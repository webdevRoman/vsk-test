<?php
require '../vendor/autoload.php';
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

include "db.php";

$str = "";
$start = json_decode(file_get_contents('php://input'), true)['start'];
$end = json_decode(file_get_contents('php://input'), true)['end'];

$stmt = $pdo->query('
select sp.name "Точка",
	ter.id "Терминал",
	b.name "Банк",
	coalesce(sum(tr.sum), 0) "Объем транзакций",
	coalesce(sum(tr.commission), 0) "Объем комиссий",
	count(tr.id) "Количество транзакций"
from terminal ter
	left join salepoint sp on ter.salepoint=sp.id
	left join bank b on ter.bank=b.id
	left join transaction tr on tr.terminal=ter.id
where tr.date >= \'' . $start . '\'::date
	and tr.date <= \'' . $end . '\'::date
group by ter.id, sp.name, b.name
order by ter.id;
');

$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();
$sheet->setTitle('Отчет');
$sheet->setCellValue('A1', 'Точка');
$sheet->setCellValue('B1', 'Терминал');
$sheet->setCellValue('C1', 'Банк');
$sheet->setCellValue('D1', 'Объем транзакций');
$sheet->setCellValue('E1', 'Объем комиссий');
$sheet->setCellValue('F1', 'Количество транзакций');

$i = 1;
while ($row = $stmt->fetch()) {
  $i++;
  $sheet->setCellValue('A' . $i, $row['Точка']);
  $sheet->setCellValue('B' . $i, $row['Терминал']);
  $sheet->setCellValue('C' . $i, $row['Банк']);
  $sheet->setCellValue('D' . $i, $row['Объем транзакций']);
  $sheet->setCellValue('E' . $i, $row['Объем комиссий']);
  $sheet->setCellValue('F' . $i, $row['Количество транзакций']);
}

$writer = new Xlsx($spreadsheet);
$filename = 'report' . date("_Y-m-d_H-i-s") . '.xlsx';
$writer->save($filename);

echo $filename;