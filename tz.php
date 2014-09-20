<?php
  /**
   * @descGet system run time value script
  */
  echo $arRuntime =explode(" ", system('systeminfo /FO csv'));
?>