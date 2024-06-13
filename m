Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B8C907814
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:17:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D8BA21B5;
	Thu, 13 Jun 2024 18:17:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D8BA21B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295455;
	bh=W8hL3Bodet35BokJxThto2yxkVSqixYf1rJDGEX7vyk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XGABRsNEIyxDi5t0IIoAzAfdQ5+hRSfx9Og67ITB8AKaYmqwRteUVGuPCNBIrHKRF
	 G8LlmW1d1JwuNvM9fXOHFYF4eQ2sYAIZLx2/RjmRsc1XdtDOsu+oQU+6Rhwrdj1PoF
	 V71IZKIa3EA3LK2YKV7OH3KQuSP091jhldbc3hNc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0B9BF89671; Thu, 13 Jun 2024 18:05:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A6BFF89A2D;
	Thu, 13 Jun 2024 18:05:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20FDEF8057A; Thu, 13 Jun 2024 10:27:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBF84F80579
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 10:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBF84F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=fhYkMdCT
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45D8RFlP096467;
	Thu, 13 Jun 2024 03:27:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718267235;
	bh=fAKGhsENG7nGEYtJtrzujg9mmtv7O9X92G8C6vmD+NM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fhYkMdCTw7zuhL8qyT7gUG7q8I/WgC/i1ab1+C/ZNbYUWfKcfuqjKGhlee+j8KTd2
	 si+Tnp4d6vZhRt33mwzzdbf9754YNS5keDGwLOr/fgawD9uxzD9eBa4506EaLSevca
	 aIAdpWigGtvrHI5puY4NGOljhRqDNi9ccVtjaz7M=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45D8RFI6086219
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Jun 2024 03:27:15 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Jun 2024 03:27:15 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Jun 2024 03:27:15 -0500
Received: from lelvsmtp6.itg.ti.com ([10.250.165.138])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45D8QwPU058785;
	Thu, 13 Jun 2024 03:27:07 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <robh+dt@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <lgirdwood@gmail.com>, <perex@perex.cz>,
        <pierre-louis.bossart@linux.intel.com>, <kevin-lu@ti.com>,
        <shenghao-ding@ti.com>, <navada@ti.com>, <13916275206@139.com>,
        <v-hampiholi@ti.com>, <v-po@ti.com>, <niranjan.hy@ti.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <liam.r.girdwood@intel.com>, <yung-chuan.liao@linux.intel.com>,
        <baojun.xu@ti.com>, <broonie@kernel.org>, <soyer@irl.hu>
Subject: [PATCH v7 1/1] ALSA: hda/tas2781: Add tas2781 hda driver based on SPI
Date: Thu, 13 Jun 2024 16:26:33 +0800
Message-ID: <20240613082633.388-2-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20240613082633.388-1-baojun.xu@ti.com>
References: <20240613082633.388-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: G6BEHTTEIFR5PTDQCRUGJYSJQG6AUPX7
X-Message-ID-Hash: G6BEHTTEIFR5PTDQCRUGJYSJQG6AUPX7
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:05:46 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G6BEHTTEIFR5PTDQCRUGJYSJQG6AUPX7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Integrate tas2781 hda spi driver configs for HP (Varcolac).
Every tas2781 SPI node was added by serial-multi-instantie.c as a single
SPI device. The code support Realtek as the primary codec.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

---
v7:
 - Add new project Gemtree (0x103c8daa) support for tas2781 spi driver.
v6:
 - Remove client in tasdevice_priv struct as it was not used.
 - Change format for tasdevice_spi_dev_write() in tas2781_hda_spi.c.
 - Change update bits function to read & write mode, as tas2781 use last bit
   to mask read & write, it cause regmap_update_bits work not as our expected.
 - Add element in tas2781_snd_controls, tas2781_prof_ctrl,
   tas2781_dsp_conf_ctrl, to support second device.
   Previous version add sound card for first index only.
 - Change calibration registers address declaire to TASDEVICE_REG() mode.
 - Add snd_ctl_new1() for second device.
 - Change format for tas2781_hda_unbind() to fit 79 chars in one line.
 - Remove client for spi as it was not used.
 - Remove unused variables.
 - Remove cur_prog clean in runtime_suspend().
 - Remove unused variables.
 - Add tasdevice_spi_tuning_switch() in runtime_resume.
 - Remove cur_prog clean in system_resume().
 - Add tuning switch if playback started in system_resume().
 - Change TASDEVICE_PAGE_REG to TASDEVICE_REG_ID in tas2781_spi_fwlib.c.
 - Remove calibration binary load functions as data will be loaded from EFI.
v5:
 - Combined all modification into one patch for pass the compile.
 - Remove old hardware id "TIAS2781" as no production on market.
 - Change max page size to 256 in tas2781-spi.h.
 - Change book reg from 127 to GENMASK(7, 1), as one bit shift is needed.
 - Change register address define as one bit shift needed for offset.
 - Change block check sum comments to Firmware block from I2C.
 - Change define of (page + reg) to TASDEVICE_PAGE_REG from TASDEVICE_PGRG.
 - Change to lower case in defined value.
 - Add registers default value table in tas2781_hda_spi.c
 - Change rang_max to 256 * 256.
 - Add zero_flag_mask in regmap_config.
 - Change max_register to 256 * 256.
 - Add registers default table into structure regmap_config.
 - Change parameter from book number to whole register address.
 - Remove page 0 switch as SPI driver will do it.
 - Add bit(0) for read function as tas2781 will check last bit of address,
   to determine operation mode is read (1) or write (0).
 - Change switch case to if check in tas2781_hda_playback_hook(),
   as it may cause compile problem in clang-19 building.
 - Change variable declaration position.
 - Change order in if check.
 - Remove old hardware id ("TIAS2781") support.
 - Remove debug message in runtime suspend and resume.
 - Remove regmap.h include in tas2781_spi_fwlib.c.
 - Remove MODULE_ in fwlib as this file will work with tas2781_hda_spi.c only.
v4:
 - Add old hardware id "TIAS2781" for compatible with old production
 - Add 2 devices in struct smi_node tas2781_hda, to compatible with 4 AMPs
v4:
 - Add old hardware id "TIAS2781" for compatible with old production
 - Add 2 devices in struct smi_node tas2781_hda, to compatible with 4 AMPs
 - Move include of sound/tas2781-dsp.h to c source file tas2781_hda_spi.c,
   tas2781_spi_fwlib.c, as it's not needed in header file tas2781-spi.h
 - Use page and book number define in other micro define
 - Change 4000000 to (4 * HZ_PER_MHZ)
 - Add define for calibration variable name and size in UEFI.
 - Remove structure tasdevice & tasdevice_irqinfo, and move variables in to
   structure tasdevice_priv
 - Remove some unused variables in sttructure tasdevice_priv
 - Remove function declare of tascodec_init(), use tascodec_spi_init()
 - Remove function declare of tasdevice_remove()
 - Add array_size.h included in tas2781_hda_spi.c
 - Add cleanup.h included for change mutex to guard
 - Add units.h included
 - Include tas2781-dsp.h
 - Remove unused variables in tas2781_hda structure
 - Change 0xff to GENMASK(7, 0)
 - Change 128 to define of max page size
 - Change code as all variables was moved to tasdevice_priv structure
 - Change comments for error in book write, or page write
 - Remove initial of ret, and return 0 directly
 - Change comments for wrong typo, add space in front and end
 - Add check for bulk read, max size should be a page size
 - Change usleep_rang() to fsleep()
 - Change mutex_lock to guard(mutex), and remove mutex_unlock()
 - Change tasdevice_spi_init() to void from int as no value return required
 - Change second parameter to sizeof
 - Remove tasdevice_clamp(), use clamp()
 - Add compatible with old hardware id "TIAS2781"
 - Remove cs_gpio and spi device in tas2781_read_acpi() as use default CS
 - Change dev-index check, return -EINVAL if it's <= 0
 - Change 0xFF to U8_MAX
 - Remove GPIO get for chip-select, use default from SPI device
 - Perform RESET in first AMP only as all AMPs share same RESET pin
 - return 0 directly in some simple routine to avoid variable initial
 - Change comments for function which was used by system
 - Change "ON" "OFF" to function str_on_off(...)
 - Change format of GUID
 - Add temp buffer for first efi.get_variable()
 - Free data if it was allocated
 - Change format of debug message of calibration date time print
 - Remove total_sz = 0, as it's not needed
 - Move save_calibration to after tuning_switch to avoid calibration data
   overwrite
 - Remove dev from structure tasdevice_hda, use dev in tasdevice_priv
 - Remove 0 from { "tas2781-hda", 0}, & {"TXNW2781", 0},
 - Add old hardware id "TIAS2781" for compatible with old production
 - Add 2 devices in struct smi_node tas2781_hda, to compatible with 4 AMPs
v3:
 - Move HID up to above /* Non-conforming _HID ... */ in scan.c,
   for avoid misunderstanding.
 - Move HID up to above /* Non-conforming _HID ... */ in
   serial-multi-instantiate.c, for avoid misunderstanding.
 - Change objs to y for snd-hda-scodec-tas2781-spi- in Makefile.
 - Change format for some define in tas2781-spi.h.
 - Add define for TASDEVICE_MAX_BOOK_NUM, TASDEVICE_MAX_PAGE.
 - Move declare of "enum calib_data {" to header file from source file.
 - Remove "enum device_catlog_id {" as only one platform was supported now.
 - Remove "struct calidata", as we will save pure calibration data only.
 - Remove "struct calidata", "enum device_catlog_id" in tasdevice_priv.
 - Add calibration_data in tasdevice_priv to save pure calibration data.
 - Remove declare of tasdevice_save_calibration() and
   tasdevice_apply_calibration(), as it will be used within same c file.
 - Add below header files included in tas2781_hda_spi.c:
   bits.h, mutex.h, property.h, time.h, types.h.
 - Move two micro define to header file tas2781-spi.h.
 - Change format of some micro define.
 - Change format of some structure.
 - Remove irq in tas2781_hda, as have it already in tasdevice_priv.
 - Remove some local functions declare as not necessarily.
 - Return error if regmap_write() failed.
 - Change fixed value 2 to sizeof(data).
 - Remove all of EXPORT_SYMBOL_GPL,
   as all of function was called within same module.
 - Remove empty line after last return in some functions.
 - Remove some variable initialyzation.
 - Remove variable sub, store acpi_subsystem_id directly.
 - Remove wrong comments for device index, it's must, can't be NULL.
 - Remove some local variables, use elements in structure directly.
 - Append commas in last element of an array.
 - Change calibration data process, didn't save all of calibration data in EFI,
   get in local, and save pure calibration data in tasdevice_priv.
 - Call tasdevice_save_calibration() from function pointer in tasdevice_priv;
 - Remove subid as one platform was supported only, needn't check.
 - Add initialyzation for local variable.
 - Move regmap initialyzation to before acpi read.
 - Call tasdevice_apply_calibration() from function pointer in tasdevice_priv;
 - Remove MODULE_IMPORT_NS(SND_SOC_TAS2781_FMWLIB), as all functions was
   performed within same module.
 - Update format and variables declare order.
 - Change format of multi conditions for if.
 - Remove casting which is not needed.
 - Change variables type to avoid casting.
 - Remove Unneeded parentheses.
 - Change if check to avoid goto.
 - Add {} for keep same style.
 - Remove some local variables, use elements in structure directly.
v2:
 - Change depends on SPI to SPI_MASTER in sound/pci/hda/Kconfig
 - Add select SND_HDA_SCODEC_COMPONENT in sound/pci/hda/Kconfig
 - Change comp_generic_fixup() 5th parameter from "-%s:00" to
   "-%s:00-tas2781-hda.%d" in sound/pci/hda/patch_realtek.c
 - Change chain_id from ALC285_FIXUP_THINKPAD_HEADSET_JACK to
   ALC285_FIXUP_HP_GPIO_LED in sound/pci/hda/patch_realtek.c
 - Remove project name "Gemtree"
 - Update information in file header of tas2781-spi.h.
 - Remove useless micro define.
 - Change TASDEVICE_I2CChecksum to TASDEVICE_Checksum
 - Remove enum control_bus as current code support SPI only.
 - Remove device define as current code support TAS2781 only.
 - Remove spi_device **spi_devs in structure tasdevice_priv.
 - Remove cal_binaryname in structure tasdevice_priv.
 - Remove ndev in structure tasdevice_priv.
 - Change isacpi and  isspi, replace by control_bus(I2C or SPI).
 - Remove void tasdevice_spi_dsp_remove(void *context).
 - Add acpi_device and irq in structure tas2781_hda in tas2781_hda_spi.c.
 - Remove parameter chn in all of registers access functions.
 - Add tascodec_spi_init().
 - Add chip select gpio set for SPI device.
 - Change tasdevice_tuning_switch() to tasdevice_spi_tuning_switch().
 - Change device offset from tas_priv->ndev to tas_priv->index.
 - Change tasdevice_dsp_remove() to tasdevice_spi_dsp_remove().
 - tasdevice_prmg_load() to tasdevice_spi_prmg_load().
 - Change tasdevice_config_info_remove() to
   tasdevice_spi_config_info_remove().
 - Add one dummy byte shift when read from page 2~127, or not book 0.
 - Change tasdevice_spi_change_chn_book() to tasdevice_spi_switch_book()
 - Perform put_device(physdev) before error return.
 - Change calibration data id to 2781 from 2783 in EFI
 - Change calibration data structure name in comments.
 - Remove file name in tas2781_spi_fwlib.c.
 - Remove #include <linux/i2c.h> as it not needed in SPI mode.
 - Change TAB to speace in micro define in tas2781_spi_fwlib.c.
 - Change to up-case for DSP.
 - Change all of multi-line comments format, empty first line.
 - Change all of sizeof(struct xx) to sizeof(*xx).
 - Remove Explicit casting for variables compare to avoid possible fault.
 - Return directly without goto.
 - Change 1 << xx to BIT(xx).
 - Remove deviceNumber[] as current SPI device will support one device only.
 - Add memory free before return error.
 - Change "buf[offset]; offset += 1" to buf[offset++].
 - Remove some debug information print.
 - Change firmware binary to single device mode.
 - Change all bexx_to_cpup() to get_unaligned_bexx().
 - Remove ndev process as current SPI device support single device only.
 - Remove chn and chnend for single device support only.
 - Change all of registers read/write function, remove parameter chn.
 - Create new function for single write, burst write, delay, field write
   in tasdevice_process_block().
---
 drivers/acpi/scan.c                           |    1 +
 .../platform/x86/serial-multi-instantiate.c   |   12 +
 sound/pci/hda/Kconfig                         |   14 +
 sound/pci/hda/Makefile                        |    2 +
 sound/pci/hda/patch_realtek.c                 |   14 +
 sound/pci/hda/tas2781-spi.h                   |  148 ++
 sound/pci/hda/tas2781_hda_spi.c               | 1266 ++++++++++
 sound/pci/hda/tas2781_spi_fwlib.c             | 2101 +++++++++++++++++
 8 files changed, 3558 insertions(+)
 create mode 100644 sound/pci/hda/tas2781-spi.h
 create mode 100644 sound/pci/hda/tas2781_hda_spi.c
 create mode 100644 sound/pci/hda/tas2781_spi_fwlib.c

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 503773707e01..9c08c5886370 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1760,6 +1760,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 		{"CSC3557", },
 		{"INT33FE", },
 		{"INT3515", },
+		{"TXNW2781", },
 		/* Non-conforming _HID for Cirrus Logic already released */
 		{"CLSA0100", },
 		{"CLSA0101", },
diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index 97b9c6392230..23d46063423d 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -368,6 +368,17 @@ static const struct smi_node cs35l57_hda = {
 	.bus_type = SMI_AUTO_DETECT,
 };
 
+static const struct smi_node tas2781_hda = {
+	.instances = {
+		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
+		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
+		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
+		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
+		{}
+	},
+	.bus_type = SMI_AUTO_DETECT,
+};
+
 /*
  * Note new device-ids must also be added to ignore_serial_bus_ids in
  * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
@@ -380,6 +391,7 @@ static const struct acpi_device_id smi_acpi_ids[] = {
 	{ "CSC3556", (unsigned long)&cs35l56_hda },
 	{ "CSC3557", (unsigned long)&cs35l57_hda },
 	{ "INT3515", (unsigned long)&int3515_data },
+	{ "TXNW2781", (unsigned long)&tas2781_hda },
 	/* Non-conforming _HID for Cirrus Logic already released */
 	{ "CLSA0100", (unsigned long)&cs35l41_hda },
 	{ "CLSA0101", (unsigned long)&cs35l41_hda },
diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 0da625533afc..113161618788 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -204,6 +204,20 @@ config SND_HDA_SCODEC_TAS2781_I2C
 comment "Set to Y if you want auto-loading the side codec driver"
 	depends on SND_HDA=y && SND_HDA_SCODEC_TAS2781_I2C=m
 
+config SND_HDA_SCODEC_TAS2781_SPI
+	tristate "Build TAS2781 HD-audio side codec support for SPI Bus"
+	depends on SPI_MASTER
+	depends on ACPI
+	depends on EFI
+	depends on SND_SOC
+	select CRC32_SARWATE
+	help
+	  Say Y or M here to include TAS2781 SPI HD-audio side codec support
+	  in snd-hda-intel driver, such as ALC287.
+
+comment "Set to Y if you want auto-loading the side codec driver"
+	depends on SND_HDA=y && SND_HDA_SCODEC_TAS2781_SPI=m
+
 config SND_HDA_CODEC_REALTEK
 	tristate "Build Realtek HD-audio codec support"
 	select SND_HDA_GENERIC
diff --git a/sound/pci/hda/Makefile b/sound/pci/hda/Makefile
index 058ca0a289e4..0bb5f0ce073f 100644
--- a/sound/pci/hda/Makefile
+++ b/sound/pci/hda/Makefile
@@ -70,6 +70,8 @@ obj-$(CONFIG_SND_HDA_SCODEC_CS35L56_SPI) += snd-hda-scodec-cs35l56-spi.o
 obj-$(CONFIG_SND_HDA_CS_DSP_CONTROLS) += snd-hda-cs-dsp-ctls.o
 obj-$(CONFIG_SND_HDA_SCODEC_COMPONENT) += snd-hda-scodec-component.o
 obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_I2C) += snd-hda-scodec-tas2781-i2c.o
+obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_SPI) += snd-hda-scodec-tas2781-spi.o
+snd-hda-scodec-tas2781-spi-y :=	tas2781_hda_spi.o tas2781_spi_fwlib.o
 
 # this must be the last entry after codec drivers;
 # otherwise the codec patches won't be hooked before the PCI probe
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index aa76d1c88589..38f2cf148477 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6921,6 +6921,11 @@ static void tas2781_fixup_i2c(struct hda_codec *cdc,
 	comp_generic_fixup(cdc, action, "i2c", "TIAS2781", "-%s:00", 1);
 }
 
+static void tas2781_fixup_spi(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
+{
+	comp_generic_fixup(cdc, action, "spi", "TXNW2781", "-%s:00-tas2781-hda.%d", 2);
+}
+
 static void yoga7_14arb7_fixup_i2c(struct hda_codec *cdc,
 	const struct hda_fixup *fix, int action)
 {
@@ -7498,6 +7503,7 @@ enum {
 	ALC236_FIXUP_DELL_DUAL_CODECS,
 	ALC287_FIXUP_CS35L41_I2C_2_THINKPAD_ACPI,
 	ALC287_FIXUP_TAS2781_I2C,
+	ALC245_FIXUP_TAS2781_SPI_2,
 	ALC287_FIXUP_YOGA7_14ARB7_I2C,
 	ALC245_FIXUP_HP_MUTE_LED_COEFBIT,
 	ALC245_FIXUP_HP_X360_MUTE_LEDS,
@@ -9688,6 +9694,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	},
+	[ALC245_FIXUP_TAS2781_SPI_2] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = tas2781_fixup_spi,
+		.chained = true,
+		.chain_id = ALC285_FIXUP_HP_GPIO_LED,
+	},
 	[ALC287_FIXUP_YOGA7_14ARB7_I2C] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = yoga7_14arb7_fixup_i2c,
@@ -10156,6 +10168,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b8d, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b8f, "HP", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b92, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8b93, "HP Varcolac", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8b96, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8bb3, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
@@ -10212,6 +10225,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8cdf, "HP SnowWhite", ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ce0, "HP SnowWhite", ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8cf5, "HP ZBook Studio 16", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8daa, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x106d, "Asus K53BE", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
diff --git a/sound/pci/hda/tas2781-spi.h b/sound/pci/hda/tas2781-spi.h
new file mode 100644
index 000000000000..3ddb4dc7173b
--- /dev/null
+++ b/sound/pci/hda/tas2781-spi.h
@@ -0,0 +1,148 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+//
+// ALSA SoC Texas Instruments TAS2781 Audio Smart Amplifier
+//
+// Copyright (C) 2024 Texas Instruments Incorporated
+// https://www.ti.com
+//
+// The TAS2781 driver implements a flexible and configurable
+// algo coefficient setting for TAS2781 chips.
+//
+// Author: Baojun Xu <baojun.xu@ti.com>
+//
+
+#ifndef __TAS2781_SPI_H__
+#define __TAS2781_SPI_H__
+
+#define TASDEVICE_RATES			\
+	(SNDRV_PCM_RATE_44100 |	SNDRV_PCM_RATE_48000 | \
+	SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_88200)
+
+#define TASDEVICE_FORMATS		\
+	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
+	SNDRV_PCM_FMTBIT_S32_LE)
+
+#define TASDEVICE_MAX_BOOK_NUM		256
+#define TASDEVICE_MAX_PAGE		256
+
+#define TASDEVICE_MAX_SIZE	(TASDEVICE_MAX_BOOK_NUM * TASDEVICE_MAX_PAGE)
+
+/* PAGE Control Register (available in page0 of each book) */
+#define TASDEVICE_PAGE_SELECT		0x00
+#define TASDEVICE_BOOKCTL_PAGE		0x00
+#define TASDEVICE_BOOKCTL_REG		GENMASK(7, 1)
+#define TASDEVICE_BOOK_ID(reg)		((reg & GENMASK(24, 16)) >> 16)
+#define TASDEVICE_PAGE_ID(reg)		((reg & GENMASK(15, 8)) >> 8)
+#define TASDEVICE_REG_ID(reg)		((reg & GENMASK(7, 1)) >> 1)
+#define TASDEVICE_PAGE_REG(reg)		(reg & GENMASK(15, 1))
+#define TASDEVICE_REG(book, page, reg)	(((book & GENMASK(7, 0)) << 16) + \
+					 ((page & GENMASK(7, 0)) << 8) + \
+					  ((reg & GENMASK(6, 0)) << 1))
+
+/* Software Reset */
+#define TAS2781_REG_SWRESET		TASDEVICE_REG(0x0, 0x0, 0x01)
+#define TAS2781_REG_SWRESET_RESET	BIT(0)
+
+/* Firmware block Checksum */
+#define TASDEVICE_Checksum		TASDEVICE_REG(0x0, 0x0, 0x7e)
+
+/* Volume control */
+#define TAS2781_DVC_LVL			TASDEVICE_REG(0x0, 0x0, 0x1a)
+#define TAS2781_AMP_LEVEL		TASDEVICE_REG(0x0, 0x0, 0x03)
+#define TAS2781_AMP_LEVEL_MASK		GENMASK(5, 1)
+
+#define TASDEVICE_CMD_SING_W		0x1
+#define TASDEVICE_CMD_BURST		0x2
+#define TASDEVICE_CMD_DELAY		0x3
+#define TASDEVICE_CMD_FIELD_W		0x4
+
+#define TAS2781_SPI_MAX_FREQ		(4 * HZ_PER_MHZ)
+
+#define TASDEVICE_CRC8_POLYNOMIAL		0x4d
+#define TASDEVICE_SPEAKER_CALIBRATION_SIZE	20
+
+#define TASDEVICE_CALIBRATION_DATA_NAME	L"CALI_DATA"
+#define TASDEVICE_CALIBRATION_DATA_SIZE	256
+
+enum calib_data {
+	R0_VAL = 0,
+	INV_R0,
+	R0LOW,
+	POWER,
+	TLIM,
+	CALIB_MAX
+};
+
+struct tasdevice_priv {
+	struct tasdevice_fw *cali_data_fmw;
+	struct tasdevice_rca rcabin;
+	struct tasdevice_fw *fmw;
+	struct gpio_desc *reset;
+	struct mutex codec_lock;
+	struct regmap *regmap;
+	struct device *dev;
+	struct tm tm;
+
+	const char *acpi_subsystem_id;
+	unsigned char crc8_lkp_tbl[CRC8_TABLE_SIZE];
+	unsigned char coef_binaryname[64];
+	unsigned char rca_binaryname[64];
+	unsigned char dev_name[32];
+
+	unsigned int err_code;
+	bool is_loading;
+	bool is_loaderr;
+	int cur_book;
+	int cur_prog;
+	int cur_conf;
+	int fw_state;
+	int index;
+	int irq;
+	void *client;
+	void *codec;
+	bool force_fwload_status;
+	bool playback_started;
+	unsigned int calibration_data[CALIB_MAX];
+
+	int (*fw_parse_variable_header)(struct tasdevice_priv *tas_priv,
+		const struct firmware *fmw, int offset);
+	int (*fw_parse_program_data)(struct tasdevice_priv *tas_priv,
+		struct tasdevice_fw *tas_fmw,
+		const struct firmware *fmw, int offset);
+	int (*fw_parse_configuration_data)(struct tasdevice_priv *tas_priv,
+		struct tasdevice_fw *tas_fmw,
+		const struct firmware *fmw, int offset);
+	int (*tasdevice_load_block)(struct tasdevice_priv *tas_priv,
+		struct tasdev_blk *block);
+
+	int (*save_calibration)(struct tasdevice_priv *tas_priv);
+	void (*apply_calibration)(struct tasdevice_priv *tas_priv);
+};
+
+int tasdevice_spi_dev_read(struct tasdevice_priv *tas_priv,
+	unsigned int reg, unsigned int *value);
+int tasdevice_spi_dev_write(struct tasdevice_priv *tas_priv,
+	unsigned int reg, unsigned int value);
+int tasdevice_spi_dev_bulk_write(
+	struct tasdevice_priv *tas_priv, unsigned int reg,
+	unsigned char *p_data, unsigned int n_length);
+int tasdevice_spi_dev_bulk_read(struct tasdevice_priv *tas_priv,
+	unsigned int reg, unsigned char *p_data, unsigned int n_length);
+int tasdevice_spi_dev_update_bits(struct tasdevice_priv *tasdevice,
+	unsigned int reg, unsigned int mask, unsigned int value);
+
+void tasdevice_spi_select_cfg_blk(void *context, int conf_no,
+	unsigned char block_type);
+void tasdevice_spi_config_info_remove(void *context);
+int tasdevice_spi_dsp_parser(void *context);
+int tasdevice_spi_rca_parser(void *context, const struct firmware *fmw);
+void tasdevice_spi_dsp_remove(void *context);
+void tasdevice_spi_calbin_remove(void *context);
+int tasdevice_spi_select_tuningprm_cfg(void *context, int prm,
+	int cfg_no, int rca_conf_no);
+int tasdevice_spi_prmg_load(void *context, int prm_no);
+int tasdevice_spi_prmg_calibdata_load(void *context, int prm_no);
+void tasdevice_spi_tuning_switch(void *context, int state);
+int tas2781_spi_load_calibration(void *context, char *file_name,
+	unsigned short i);
+#endif /* __TAS2781_SPI_H__ */
diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/pci/hda/tas2781_hda_spi.c
new file mode 100644
index 000000000000..e9b77f602c75
--- /dev/null
+++ b/sound/pci/hda/tas2781_hda_spi.c
@@ -0,0 +1,1266 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// TAS2781 HDA SPI driver
+//
+// Copyright 2024 Texas Instruments, Inc.
+//
+// Author: Baojun Xu <baojun.xu@ti.com>
+
+#include <linux/acpi.h>
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/crc8.h>
+#include <linux/crc32.h>
+#include <linux/efi.h>
+#include <linux/firmware.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/spi/spi.h>
+#include <linux/time.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#include <sound/hda_codec.h>
+#include <sound/soc.h>
+#include <sound/tas2781-dsp.h>
+#include <sound/tlv.h>
+#include <sound/tas2781-tlv.h>
+
+#include "tas2781-spi.h"
+
+#include "hda_local.h"
+#include "hda_auto_parser.h"
+#include "hda_component.h"
+#include "hda_jack.h"
+#include "hda_generic.h"
+
+/*
+ * No standard control callbacks for SNDRV_CTL_ELEM_IFACE_CARD
+ * Define two controls, one is Volume control callbacks, the other is
+ * flag setting control callbacks.
+ */
+
+/* Volume control callbacks for tas2781 */
+#define ACARD_SINGLE_RANGE_EXT_TLV(xname, xreg, xshift, xmin, xmax, xinvert, \
+	xhandler_get, xhandler_put, tlv_array) { \
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD, .name = (xname), \
+	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
+		SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.tlv.p = (tlv_array), \
+	.info = snd_soc_info_volsw_range, \
+	.get = xhandler_get, .put = xhandler_put, \
+	.private_value = (unsigned long)&(struct soc_mixer_control) { \
+		.reg = xreg, .rreg = xreg, \
+		.shift = xshift, .rshift = xshift,\
+		.min = xmin, .max = xmax, .invert = xinvert, \
+	} \
+}
+
+/* Flag control callbacks for tas2781 */
+#define ACARD_SINGLE_BOOL_EXT(xname, xdata, xhandler_get, xhandler_put) { \
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD, \
+	.name = xname, \
+	.info = snd_ctl_boolean_mono_info, \
+	.get = xhandler_get, \
+	.put = xhandler_put, \
+	.private_value = xdata, \
+}
+
+struct tas2781_hda {
+	struct tasdevice_priv *priv;
+	struct acpi_device *dacpi;
+	struct snd_kcontrol *dsp_prog_ctl;
+	struct snd_kcontrol *dsp_conf_ctl;
+	struct snd_kcontrol *snd_ctls[3];
+	struct snd_kcontrol *prof_ctl;
+};
+
+static const struct reg_default tas2781_reg_defaults[] = {
+	/* Default values for ROM mode. Activated. */
+	{ 0x04, 0x1a },	/* AMP inactive. */
+	{ 0x14, 0x3a },	/* Enable both channels. */
+	{ 0xb8, 0x99 },	/* Enable power up on clock. */
+};
+
+static const struct regmap_range_cfg tasdevice_ranges[] = {
+	{
+		.range_min = 0,
+		.range_max = TASDEVICE_MAX_SIZE,
+		.selector_reg = TASDEVICE_PAGE_SELECT,
+		.selector_mask = GENMASK(7, 0),
+		.selector_shift = 0,
+		.window_start = 0,
+		.window_len = TASDEVICE_MAX_PAGE,
+	},
+};
+
+static const struct regmap_config tasdevice_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.zero_flag_mask = true,
+	.cache_type = REGCACHE_NONE,
+	.ranges = tasdevice_ranges,
+	.num_ranges = ARRAY_SIZE(tasdevice_ranges),
+	.max_register = TASDEVICE_MAX_SIZE,
+	.reg_defaults = tas2781_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(tas2781_reg_defaults),
+};
+
+static int tasdevice_spi_switch_book(struct tasdevice_priv *tas_priv, int reg)
+{
+	struct regmap *map = tas_priv->regmap;
+	int ret;
+
+	if (tas_priv->cur_book != TASDEVICE_BOOK_ID(reg)) {
+		ret = regmap_write(map, TASDEVICE_BOOKCTL_REG,
+			TASDEVICE_BOOK_ID(reg));
+		if (ret < 0) {
+			dev_err(tas_priv->dev, "Switch Book E=%d\n", ret);
+			return ret;
+		}
+		tas_priv->cur_book = TASDEVICE_BOOK_ID(reg);
+	}
+	return 0;
+}
+
+int tasdevice_spi_dev_read(struct tasdevice_priv *tas_priv, unsigned int reg,
+	unsigned int *val)
+{
+	struct regmap *map = tas_priv->regmap;
+	int ret;
+
+	ret = tasdevice_spi_switch_book(tas_priv, reg);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * In our TAS2781 SPI mode, if read from other book (not book 0),
+	 * or read from page number larger than 1 in book 0, one more byte
+	 * read is needed, and first byte is a dummy byte, need to be ignored.
+	 */
+	if ((TASDEVICE_BOOK_ID(reg) > 0) || (TASDEVICE_PAGE_ID(reg) > 1)) {
+		unsigned char data[2];
+
+		ret = regmap_bulk_read(map, TASDEVICE_PAGE_REG(reg) | 1,
+			data, sizeof(data));
+		*val = data[1];
+	} else {
+		ret = regmap_read(map, TASDEVICE_PAGE_REG(reg) | 1, val);
+	}
+	if (ret < 0)
+		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+
+	return ret;
+}
+
+int tasdevice_spi_dev_write(struct tasdevice_priv *tas_priv, unsigned int reg,
+	unsigned int value)
+{
+	struct regmap *map = tas_priv->regmap;
+	int ret;
+
+	ret = tasdevice_spi_switch_book(tas_priv, reg);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(map, TASDEVICE_PAGE_REG(reg), value);
+	if (ret < 0)
+		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+
+	return ret;
+}
+
+int tasdevice_spi_dev_bulk_write(struct tasdevice_priv *tas_priv,
+	unsigned int reg, unsigned char *data, unsigned int len)
+{
+	struct regmap *map = tas_priv->regmap;
+	int ret;
+
+	ret = tasdevice_spi_switch_book(tas_priv, reg);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_bulk_write(map, TASDEVICE_PAGE_REG(reg), data, len);
+	if (ret < 0)
+		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+
+	return ret;
+}
+
+int tasdevice_spi_dev_bulk_read(struct tasdevice_priv *tas_priv,
+	unsigned int reg, unsigned char *data, unsigned int len)
+{
+	struct regmap *map = tas_priv->regmap;
+	int ret;
+
+	ret = tasdevice_spi_switch_book(tas_priv, reg);
+	if (ret < 0)
+		return ret;
+
+	if (len > TASDEVICE_MAX_PAGE)
+		len = TASDEVICE_MAX_PAGE;
+	/*
+	 * In our TAS2781 SPI mode, if read from other book (not book 0),
+	 * or read from page number larger than 1 in book 0, one more byte
+	 * read is needed, and first byte is a dummy byte, need to be ignored.
+	 */
+	if ((TASDEVICE_BOOK_ID(reg) > 0) || (TASDEVICE_PAGE_ID(reg) > 1)) {
+		unsigned char buf[TASDEVICE_MAX_PAGE+1];
+
+		ret = regmap_bulk_read(map, TASDEVICE_PAGE_REG(reg) | 1,
+			buf, len + 1);
+		memcpy(data, buf + 1, len);
+	} else {
+		ret = regmap_bulk_read(map, TASDEVICE_PAGE_REG(reg) | 1,
+			data, len);
+	}
+	if (ret < 0)
+		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+
+	return ret;
+}
+
+int tasdevice_spi_dev_update_bits(struct tasdevice_priv *tas_priv,
+	unsigned int reg, unsigned int mask, unsigned int value)
+{
+	struct regmap *map = tas_priv->regmap;
+	int ret, val;
+
+	/*
+	 * In our TAS2781 SPI mode, read/write was masked in last bit of
+	 * address, it cause regmap_update_bits() not work as expected.
+	 */
+	ret = tasdevice_spi_dev_read(tas_priv, reg, &val);
+	if (ret < 0) {
+		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+		return ret;
+	}
+	ret = regmap_write(map, TASDEVICE_PAGE_REG(reg),
+		(val & ~mask) | (mask & value));
+	if (ret < 0)
+		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+
+	return ret;
+}
+
+static void tas2781_spi_reset(struct tasdevice_priv *tas_dev)
+{
+	int ret;
+
+	if (tas_dev->reset) {
+		gpiod_set_value_cansleep(tas_dev->reset, 0);
+		fsleep(800);
+		gpiod_set_value_cansleep(tas_dev->reset, 1);
+	} else {
+		ret = tasdevice_spi_dev_write(tas_dev, TAS2781_REG_SWRESET,
+			TAS2781_REG_SWRESET_RESET);
+		if (ret < 0)
+			dev_err(tas_dev->dev, "dev sw-reset fail, %d\n", ret);
+	}
+	fsleep(1000);
+}
+
+static int tascodec_spi_init(struct tasdevice_priv *tas_priv, void *codec,
+	struct module *module,
+	void (*cont)(const struct firmware *fw, void *context))
+{
+	int ret;
+
+	/*
+	 * Codec Lock Hold to ensure that codec_probe and firmware parsing and
+	 * loading do not simultaneously execute.
+	 */
+	guard(mutex)(&tas_priv->codec_lock);
+
+	ret = scnprintf(tas_priv->rca_binaryname,
+		sizeof(tas_priv->rca_binaryname), "%sRCA%d.bin",
+		tas_priv->dev_name, tas_priv->index);
+	if (ret <= 0) {
+		dev_err(tas_priv->dev, "rca name err:0x%08x\n", ret);
+		return ret;
+	}
+	crc8_populate_msb(tas_priv->crc8_lkp_tbl, TASDEVICE_CRC8_POLYNOMIAL);
+	tas_priv->codec = codec;
+	ret = request_firmware_nowait(module, FW_ACTION_UEVENT,
+		tas_priv->rca_binaryname, tas_priv->dev, GFP_KERNEL, tas_priv,
+		cont);
+	if (ret)
+		dev_err(tas_priv->dev, "request_firmware_nowait err:0x%08x\n",
+			ret);
+
+	return ret;
+}
+
+static void tasdevice_spi_init(struct tasdevice_priv *tas_priv)
+{
+	tas_priv->cur_prog = -1;
+	tas_priv->cur_conf = -1;
+
+	tas_priv->cur_book = -1;
+	tas_priv->cur_prog = -1;
+	tas_priv->cur_conf = -1;
+
+	mutex_init(&tas_priv->codec_lock);
+}
+
+static int tasdevice_spi_amp_putvol(struct tasdevice_priv *tas_priv,
+	struct snd_ctl_elem_value *ucontrol, struct soc_mixer_control *mc)
+{
+	unsigned int invert = mc->invert;
+	unsigned char mask;
+	int max = mc->max;
+	int val, ret;
+
+	mask = rounddown_pow_of_two(max);
+	mask <<= mc->shift;
+	val =  clamp(invert ? max - ucontrol->value.integer.value[0] :
+		ucontrol->value.integer.value[0], 0, max);
+	ret = tasdevice_spi_dev_update_bits(tas_priv,
+		mc->reg, mask, (unsigned int)(val << mc->shift));
+	if (ret)
+		dev_err(tas_priv->dev, "set AMP vol error in dev %d\n",
+			tas_priv->index);
+
+	return ret;
+}
+
+static int tasdevice_spi_amp_getvol(struct tasdevice_priv *tas_priv,
+	struct snd_ctl_elem_value *ucontrol, struct soc_mixer_control *mc)
+{
+	unsigned int invert = mc->invert;
+	unsigned char mask = 0;
+	int max = mc->max;
+	int ret, val;
+
+	/* Read the primary device */
+	ret = tasdevice_spi_dev_read(tas_priv, mc->reg, &val);
+	if (ret) {
+		dev_err(tas_priv->dev, "%s, get AMP vol error\n", __func__);
+		return ret;
+	}
+
+	mask = rounddown_pow_of_two(max);
+	mask <<= mc->shift;
+	val = (val & mask) >> mc->shift;
+	val = clamp(invert ? max - val : val, 0, max);
+	ucontrol->value.integer.value[0] = val;
+
+	return ret;
+}
+
+static int tasdevice_spi_digital_putvol(struct tasdevice_priv *tas_priv,
+	struct snd_ctl_elem_value *ucontrol, struct soc_mixer_control *mc)
+{
+	unsigned int invert = mc->invert;
+	int max = mc->max;
+	int val, ret;
+
+	val = clamp(invert ? max - ucontrol->value.integer.value[0] :
+		ucontrol->value.integer.value[0], 0, max);
+	ret = tasdevice_spi_dev_write(tas_priv, mc->reg, (unsigned int)val);
+	if (ret)
+		dev_err(tas_priv->dev, "set digital vol err in dev %d\n",
+			tas_priv->index);
+
+	return ret;
+
+}
+
+static int tasdevice_spi_digital_getvol(struct tasdevice_priv *tas_priv,
+	struct snd_ctl_elem_value *ucontrol, struct soc_mixer_control *mc)
+{
+	unsigned int invert = mc->invert;
+	int max = mc->max;
+	int ret, val;
+
+	/* Read the primary device as the whole */
+	ret = tasdevice_spi_dev_read(tas_priv, mc->reg, &val);
+	if (ret) {
+		dev_err(tas_priv->dev, "%s, get digital vol err\n", __func__);
+		return ret;
+	}
+
+	val = clamp(invert ? max - val : val, 0, max);
+	ucontrol->value.integer.value[0] = val;
+
+	return ret;
+}
+
+static int tas2781_read_acpi(struct tas2781_hda *tas_hda, const char *hid,
+	int id)
+{
+	struct tasdevice_priv *p = tas_hda->priv;
+	struct acpi_device *adev;
+	struct device *physdev;
+	u32 values[HDA_MAX_COMPONENTS];
+	const char *property;
+	size_t nval;
+	int ret, i;
+
+	adev = acpi_dev_get_first_match_dev(hid, NULL, -1);
+	if (!adev) {
+		dev_err(p->dev, "Failed to find ACPI device: %s\n", hid);
+		return -ENODEV;
+	}
+
+	strscpy(p->dev_name, hid, sizeof(p->dev_name));
+	tas_hda->dacpi = adev;
+	physdev = get_device(acpi_get_first_physical_node(adev));
+	acpi_dev_put(adev);
+
+	/* No side-effect to the playback even if subsystem_id is NULL */
+	p->acpi_subsystem_id = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
+
+	property = "ti,dev-index";
+	ret = device_property_count_u32(physdev, property);
+	if ((ret <= 0) || (ret > ARRAY_SIZE(values))) {
+		ret = -EINVAL;
+		goto err;
+	}
+	nval = ret;
+
+	ret = device_property_read_u32_array(physdev, property, values, nval);
+	if (ret)
+		goto err;
+
+	p->index = U8_MAX;
+	for (i = 0; i < nval; i++) {
+		if (values[i] == id) {
+			p->index = i;
+			break;
+		}
+	}
+	if (p->index == U8_MAX) {
+		dev_dbg(p->dev, "No index found in %s\n", property);
+		ret = -ENODEV;
+		goto err;
+	}
+
+	if (p->index == 0) {
+		/* All of amps share same RESET pin. */
+		p->reset = devm_gpiod_get_index_optional(physdev, "reset",
+			p->index, GPIOD_OUT_LOW);
+		if (IS_ERR(p->reset)) {
+			dev_err_probe(p->dev, ret, "Failed on reset GPIO\n");
+			goto err;
+		}
+	}
+
+	put_device(physdev);
+
+	return 0;
+
+err:
+	dev_err(p->dev, "read acpi error, ret: %d\n", ret);
+	put_device(physdev);
+	acpi_dev_put(adev);
+
+	return ret;
+}
+
+static void tas2781_hda_playback_hook(struct device *dev, int action)
+{
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
+
+	if ((action == HDA_GEN_PCM_ACT_OPEN) ||
+	    (action == HDA_GEN_PCM_ACT_CLOSE)) {
+		if (action == HDA_GEN_PCM_ACT_OPEN)
+			pm_runtime_get_sync(dev);
+		guard(mutex)(&tas_hda->priv->codec_lock);
+		tasdevice_spi_tuning_switch(tas_hda->priv, 0);
+		if (action == HDA_GEN_PCM_ACT_CLOSE) {
+			pm_runtime_mark_last_busy(dev);
+			pm_runtime_put_autosuspend(dev);
+		}
+	} else {
+		dev_dbg(tas_hda->priv->dev,
+			"Playback action not supported: %d\n", action);
+	}
+}
+
+static int tasdevice_info_profile(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_info *uinfo)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = tas_priv->rcabin.ncfgs - 1;
+
+	return 0;
+}
+
+static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] = tas_priv->rcabin.profile_cfg_id;
+
+	return 0;
+}
+
+static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	int max = tas_priv->rcabin.ncfgs - 1;
+	int val;
+
+	val = clamp(ucontrol->value.integer.value[0], 0, max);
+	if (tas_priv->rcabin.profile_cfg_id != val) {
+		tas_priv->rcabin.profile_cfg_id = val;
+		return 1;
+	}
+
+	return 0;
+}
+
+static int tasdevice_info_programs(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_info *uinfo)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = tas_priv->fmw->nr_programs - 1;
+
+	return 0;
+}
+
+static int tasdevice_info_config(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_info *uinfo)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = tas_priv->fmw->nr_configurations - 1;
+
+	return 0;
+}
+
+static int tasdevice_program_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] = tas_priv->cur_prog;
+
+	return 0;
+}
+
+static int tasdevice_program_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	int nr_program = ucontrol->value.integer.value[0];
+	int max = tas_priv->fmw->nr_programs - 1;
+	int val;
+
+	val = clamp(nr_program, 0, max);
+
+	if (tas_priv->cur_prog != val) {
+		tas_priv->cur_prog = val;
+		return 1;
+	}
+
+	return 0;
+}
+
+static int tasdevice_config_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] = tas_priv->cur_conf;
+
+	return 0;
+}
+
+static int tasdevice_config_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	int max = tas_priv->fmw->nr_configurations - 1;
+	int val;
+
+	val = clamp(ucontrol->value.integer.value[0], 0, max);
+
+	if (tas_priv->cur_conf != val) {
+		tas_priv->cur_conf = val;
+		return 1;
+	}
+
+	return 0;
+}
+
+/*
+ * tas2781_digital_getvol - get the volum control
+ * @kcontrol: control pointer
+ * @ucontrol: User data
+ *
+ * Customer Kcontrol for tas2781 is primarily for regmap booking, paging
+ * depends on internal regmap mechanism.
+ * tas2781 contains book and page two-level register map, especially
+ * book switching will set the register BXXP00R7F, after switching to the
+ * correct book, then leverage the mechanism for paging to access the
+ * register.
+ *
+ * Return 0 if succeeded.
+ */
+static int tas2781_digital_getvol(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+
+	return tasdevice_spi_digital_getvol(tas_priv, ucontrol, mc);
+}
+
+static int tas2781_amp_getvol(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+
+	return tasdevice_spi_amp_getvol(tas_priv, ucontrol, mc);
+}
+
+static int tas2781_digital_putvol(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+
+	/* The check of the given value is in tasdevice_digital_putvol. */
+	return tasdevice_spi_digital_putvol(tas_priv, ucontrol, mc);
+}
+
+static int tas2781_amp_putvol(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+
+	/* The check of the given value is in tasdevice_amp_putvol. */
+	return tasdevice_spi_amp_putvol(tas_priv, ucontrol, mc);
+}
+
+static int tas2781_force_fwload_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] = (int)tas_priv->force_fwload_status;
+	dev_dbg(tas_priv->dev, "%s : Force FWload %s\n", __func__,
+		str_on_off(tas_priv->force_fwload_status));
+
+	return 0;
+}
+
+static int tas2781_force_fwload_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	bool change, val = (bool)ucontrol->value.integer.value[0];
+
+	if (tas_priv->force_fwload_status == val) {
+		change = false;
+	} else {
+		change = true;
+		tas_priv->force_fwload_status = val;
+	}
+	dev_dbg(tas_priv->dev, "%s : Force FWload %s\n", __func__,
+		str_on_off(tas_priv->force_fwload_status));
+
+	return change;
+}
+
+static const struct snd_kcontrol_new tas2781_snd_controls[] = {
+	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain 0", TAS2781_AMP_LEVEL,
+		1, 0, 20, 0, tas2781_amp_getvol,
+		tas2781_amp_putvol, amp_vol_tlv),
+	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain 0", TAS2781_DVC_LVL,
+		0, 0, 200, 1, tas2781_digital_getvol,
+		tas2781_digital_putvol, dvc_tlv),
+	ACARD_SINGLE_BOOL_EXT("Speaker Force Firmware Load 0", 0,
+		tas2781_force_fwload_get, tas2781_force_fwload_put),
+	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain 1", TAS2781_AMP_LEVEL,
+		1, 0, 20, 0, tas2781_amp_getvol,
+		tas2781_amp_putvol, amp_vol_tlv),
+	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain 1", TAS2781_DVC_LVL,
+		0, 0, 200, 1, tas2781_digital_getvol,
+		tas2781_digital_putvol, dvc_tlv),
+	ACARD_SINGLE_BOOL_EXT("Speaker Force Firmware Load 1", 0,
+		tas2781_force_fwload_get, tas2781_force_fwload_put),
+};
+
+static const struct snd_kcontrol_new tas2781_prof_ctrl[] = {
+{
+	.name = "Speaker Profile Id - 0",
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.info = tasdevice_info_profile,
+	.get = tasdevice_get_profile_id,
+	.put = tasdevice_set_profile_id,
+},
+{
+	.name = "Speaker Profile Id - 1",
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.info = tasdevice_info_profile,
+	.get = tasdevice_get_profile_id,
+	.put = tasdevice_set_profile_id,
+},
+};
+static const struct snd_kcontrol_new tas2781_dsp_prog_ctrl[] = {
+{
+	.name = "Speaker Program Id 0",
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.info = tasdevice_info_programs,
+	.get = tasdevice_program_get,
+	.put = tasdevice_program_put,
+},
+{
+	.name = "Speaker Program Id 1",
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.info = tasdevice_info_programs,
+	.get = tasdevice_program_get,
+	.put = tasdevice_program_put,
+},
+};
+
+static const struct snd_kcontrol_new tas2781_dsp_conf_ctrl[] = {
+{
+	.name = "Speaker Config Id 0",
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.info = tasdevice_info_config,
+	.get = tasdevice_config_get,
+	.put = tasdevice_config_put,
+},
+{
+	.name = "Speaker Config Id 1",
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.info = tasdevice_info_config,
+	.get = tasdevice_config_get,
+	.put = tasdevice_config_put,
+},
+};
+
+static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
+{
+	static const unsigned int cali_array[CALIB_MAX] = {
+		TASDEVICE_REG(0, 0x17, 0x74),
+		TASDEVICE_REG(0, 0x18, 0x0c),
+		TASDEVICE_REG(0, 0x18, 0x14),
+		TASDEVICE_REG(0, 0x13, 0x70),
+		TASDEVICE_REG(0, 0x18, 0x7c),
+	};
+	int j, rc;
+
+	/*
+	 * If no calibration data exist in tasdevice_priv *tas_priv,
+	 * calibration apply will be ignored, and use default values
+	 * in firmware binary, which was loaded during firmware download.
+	 */
+	if (tas_priv->calibration_data[0] == 0)
+		return;
+	/*
+	 * Calibration data was saved in tasdevice_priv *tas_priv as:
+	 * unsigned int calibration_data[CALIB_MAX];
+	 * and every data (in 4 bytes) will be saved in register which in
+	 * book 0, and page number in page_array[], offset was saved in
+	 * rgno_array[].
+	 */
+	for (j = 0; j < CALIB_MAX; j++) {
+		rc = tasdevice_spi_dev_bulk_write(tas_priv, cali_array[j],
+			(unsigned char *)&tas_priv->calibration_data[j], 4);
+		if (rc < 0)
+			dev_err(tas_priv->dev,
+				"chn %d calib %d bulk_wr err = %d\n",
+				tas_priv->index, j, rc);
+	}
+}
+
+/*
+ * Update the calibration data, including speaker impedance, f0, etc,
+ * into algo. Calibrate data is done by manufacturer in the factory.
+ * These data are used by Algo for calculating the speaker temperature,
+ * speaker membrane excursion and f0 in real time during playback.
+ * Calibration data format in EFI is V2, since 2024.
+ */
+static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
+{
+	/*
+	 * GUID was used for data access in BIOS, it was provided by board
+	 * manufactory, like HP: "{02f9af02-7734-4233-b43d-93fe5aa35db3}"
+	 */
+	efi_guid_t efi_guid =
+		EFI_GUID(0x02f9af02, 0x7734, 0x4233,
+			 0xb4, 0x3d, 0x93, 0xfe, 0x5a, 0xa3, 0x5d, 0xb3);
+	static efi_char16_t efi_name[] = TASDEVICE_CALIBRATION_DATA_NAME;
+	unsigned char data[TASDEVICE_CALIBRATION_DATA_SIZE];
+	struct tm *tm = &tas_priv->tm;
+	unsigned long total_sz = 0;
+	unsigned int attr, crc;
+	unsigned int *tmp_val;
+	efi_status_t status;
+
+	tas_priv->calibration_data[0] = 0;
+	status = efi.get_variable(efi_name, &efi_guid, &attr, &total_sz,
+		data);
+	if (status == EFI_BUFFER_TOO_SMALL) {
+		if (total_sz > TASDEVICE_CALIBRATION_DATA_SIZE)
+			return -ENOMEM;
+		/* Get variable contents into buffer */
+		status = efi.get_variable(efi_name, &efi_guid, &attr,
+			&total_sz, data);
+	}
+	if (status != EFI_SUCCESS)
+		return -EINVAL;
+
+	tmp_val = (unsigned int *)data;
+	if (tmp_val[0] == 2781) {
+		/*
+		 * New features were added in calibrated Data V2:
+		 *     1. Added some the fields to store the link_id and
+		 *     uniqie_id for multi-link solutions
+		 *     2. Support flexible number of devices instead of
+		 *     fixed one in V1.
+		 * Layout of calibrated data V2 in UEFI(total 256 bytes):
+		 *     ChipID (2781, 4 bytes)
+		 *     Device-Sum (4 bytes)
+		 *     TimeStamp of Calibration (4 bytes)
+		 *     for (i = 0; i < Device-Sum; i++) {
+		 *             Device #i index_info () {
+		 *                     SDW link id (2bytes)
+		 *                     SDW unique_id (2bytes)
+		 *             }
+		 *             Calibrated Data of Device #i (20 bytes)
+		 *     }
+		 *     CRC (4 bytes)
+		 *     Reserved (the rest)
+		 */
+		crc = crc32(~0, data, 3 + tmp_val[0] * 6) ^ ~0;
+		dev_dbg(tas_priv->dev, "cali crc 0x%08x PK tmp_val 0x%08x\n",
+			crc, tmp_val[3 + tmp_val[0] * 6]);
+
+		if (crc == tmp_val[3 + tmp_val[0] * 6]) {
+			time64_to_tm(tmp_val[2], 0, tm);
+			dev_dbg(tas_priv->dev, "Calibration date %pt.\n", tm);
+			for (int i = 0; i < CALIB_MAX; i++)
+				tas_priv->calibration_data[i] =
+					tmp_val[3 + tas_priv->index * 6 + i];
+			tas_priv->apply_calibration(tas_priv);
+		}
+	} else {
+		/*
+		 * Calibration data is in V1 format.
+		 * struct cali_data {
+		 *      char cali_data[20];
+		 * }
+		 *
+		 * struct {
+		 *      struct cali_data cali_data[4];
+		 *      int  TimeStamp of Calibration (4 bytes)
+		 *      int CRC (4 bytes)
+		 * } ueft;
+		 */
+		crc = crc32(~0, data, 84) ^ ~0;
+		dev_dbg(tas_priv->dev, "cali crc 0x%08x PK tmp_val 0x%08x\n",
+			crc, tmp_val[21]);
+
+		if (crc == tmp_val[21]) {
+			time64_to_tm(tmp_val[20], 0, tm);
+			dev_dbg(tas_priv->dev, "Calibration date %pt.\n", tm);
+			for (int i = 0; i < CALIB_MAX; i++)
+				tas_priv->calibration_data[i] =
+					tmp_val[tas_priv->index * 5 + i];
+			tas_priv->apply_calibration(tas_priv);
+		}
+	}
+
+	return 0;
+}
+
+static void tas2781_hda_remove_controls(struct tas2781_hda *tas_hda)
+{
+	struct hda_codec *codec = tas_hda->priv->codec;
+
+	if (tas_hda->dsp_prog_ctl)
+		snd_ctl_remove(codec->card, tas_hda->dsp_prog_ctl);
+
+	if (tas_hda->dsp_conf_ctl)
+		snd_ctl_remove(codec->card, tas_hda->dsp_conf_ctl);
+
+	for (int i = ARRAY_SIZE(tas_hda->snd_ctls) - 1; i >= 0; i--)
+		if (tas_hda->snd_ctls[i])
+			snd_ctl_remove(codec->card, tas_hda->snd_ctls[i]);
+
+	if (tas_hda->prof_ctl)
+		snd_ctl_remove(codec->card, tas_hda->prof_ctl);
+}
+
+static void tasdev_fw_ready(const struct firmware *fmw, void *context)
+{
+	struct tasdevice_priv *tas_priv = context;
+	struct tas2781_hda *tas_hda = dev_get_drvdata(tas_priv->dev);
+	struct hda_codec *codec = tas_priv->codec;
+	int i, j, ret;
+
+	pm_runtime_get_sync(tas_priv->dev);
+	guard(mutex)(&tas_priv->codec_lock);
+
+	ret = tasdevice_spi_rca_parser(tas_priv, fmw);
+	if (ret)
+		goto out;
+
+	/* Add control one time only. */
+	tas_hda->prof_ctl = snd_ctl_new1(&tas2781_prof_ctrl[tas_priv->index],
+		tas_priv);
+	ret = snd_ctl_add(codec->card, tas_hda->prof_ctl);
+	if (ret) {
+		dev_err(tas_priv->dev, "Failed to add KControl %s = %d\n",
+			tas2781_prof_ctrl[tas_priv->index].name, ret);
+		goto out;
+	}
+	j = tas_priv->index * 3;
+	for (i = 0; i < ARRAY_SIZE(tas2781_snd_controls)/2; i++) {
+		tas_hda->snd_ctls[i] =
+			snd_ctl_new1(&tas2781_snd_controls[i + j], tas_priv);
+		ret = snd_ctl_add(codec->card, tas_hda->snd_ctls[i]);
+		if (ret) {
+			dev_err(tas_priv->dev,
+				"Failed to add snd control %s = %d\n",
+				tas2781_snd_controls[i + j].name, ret);
+			goto out;
+		}
+	}
+
+	tasdevice_spi_dsp_remove(tas_priv);
+
+	tas_priv->fw_state = TASDEVICE_DSP_FW_PENDING;
+	scnprintf(tas_priv->coef_binaryname, 64, "TAS2XXX%08X-%01d.bin",
+		codec->core.subsystem_id, tas_priv->index);
+	ret = tasdevice_spi_dsp_parser(tas_priv);
+	if (ret) {
+		dev_err(tas_priv->dev, "dspfw load %s error\n",
+			tas_priv->coef_binaryname);
+		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
+		goto out;
+	}
+
+	/* Add control one time only. */
+	tas_hda->dsp_prog_ctl =
+		snd_ctl_new1(&tas2781_dsp_prog_ctrl[tas_priv->index],
+			tas_priv);
+	ret = snd_ctl_add(codec->card, tas_hda->dsp_prog_ctl);
+	if (ret) {
+		dev_err(tas_priv->dev,
+			"Failed to add KControl %s = %d\n",
+			tas2781_dsp_prog_ctrl[tas_priv->index].name, ret);
+		goto out;
+	}
+
+	tppcver = get_unaligned_be32(&buf[offset]);
+	offset += 8;
+	fw_fixed_hdr->drv_ver = get_unaligned_be32(&buf[offset]);
+	offset += 72;
+
+out:
+	return offset;
+}
+
+static int tasdevice_dspfw_ready(const struct firmware *fmw, void *context)
+{
+	struct tasdevice_priv *tas_priv = context;
+	struct tasdevice_fw_fixed_hdr *fw_fixed_hdr;
+	struct tasdevice_fw *tas_fmw;
+	int offset = 0, ret = 0;
+
+	if (!fmw || !fmw->data) {
+		dev_err(tas_priv->dev, "%s: Failed to read firmware %s\n",
+			__func__, tas_priv->coef_binaryname);
+		return -EINVAL;
+	}
+
+	tas_priv->fmw = kzalloc(sizeof(*tas_priv->fmw), GFP_KERNEL);
+	if (!tas_priv->fmw)
+		return -ENOMEM;
+	tas_fmw = tas_priv->fmw;
+	tas_fmw->dev = tas_priv->dev;
+	offset = fw_parse_header(tas_priv, tas_fmw, fmw, offset);
+
+	if (offset == -EINVAL)
+		return -EINVAL;
+
+	fw_fixed_hdr = &(tas_fmw->fw_hdr.fixed_hdr);
+	/* Support different versions of firmware */
+	switch (fw_fixed_hdr->drv_ver) {
+	case 0x301:
+	case 0x302:
+	case 0x502:
+	case 0x503:
+		tas_priv->fw_parse_variable_header =
+			fw_parse_variable_header_kernel;
+		tas_priv->fw_parse_program_data =
+			fw_parse_program_data_kernel;
+		tas_priv->fw_parse_configuration_data =
+			fw_parse_configuration_data_kernel;
+		tas_priv->tasdevice_load_block =
+			tasdevice_load_block_kernel;
+		break;
+	case 0x202:
+	case 0x400:
+		tas_priv->fw_parse_variable_header =
+			fw_parse_variable_header_git;
+		tas_priv->fw_parse_program_data =
+			fw_parse_program_data;
+		tas_priv->fw_parse_configuration_data =
+			fw_parse_configuration_data;
+		tas_priv->tasdevice_load_block =
+			tasdevice_load_block;
+		break;
+	default:
+		ret = dspfw_default_callback(tas_priv,
+			fw_fixed_hdr->drv_ver, fw_fixed_hdr->ppcver);
+		if (ret)
+			return ret;
+		break;
+	}
+
+	offset = tas_priv->fw_parse_variable_header(tas_priv, fmw, offset);
+	if (offset < 0)
+		return offset;
+
+	offset = tas_priv->fw_parse_program_data(tas_priv, tas_fmw, fmw,
+		offset);
+	if (offset < 0)
+		return offset;
+
+	offset = tas_priv->fw_parse_configuration_data(tas_priv,
+		tas_fmw, fmw, offset);
+	if (offset < 0)
+		ret = offset;
+
+	return ret;
+}
+
+int tasdevice_spi_dsp_parser(void *context)
+{
+	struct tasdevice_priv *tas_priv = context;
+	const struct firmware *fw_entry;
+	int ret;
+
+	ret = request_firmware(&fw_entry, tas_priv->coef_binaryname,
+		tas_priv->dev);
+	if (ret) {
+		dev_err(tas_priv->dev, "%s: load %s error\n", __func__,
+			tas_priv->coef_binaryname);
+		return ret;
+	}
+
+	ret = tasdevice_dspfw_ready(fw_entry, tas_priv);
+	release_firmware(fw_entry);
+	fw_entry = NULL;
+
+	return ret;
+}
+
+static void tasdev_dsp_prog_blk_remove(struct tasdevice_prog *prog)
+{
+	struct tasdevice_data *tas_dt;
+	struct tasdev_blk *blk;
+	unsigned int i;
+
+	if (!prog)
+		return;
+
+	tas_dt = &(prog->dev_data);
+
+	if (!tas_dt->dev_blks)
+		return;
+
+	for (i = 0; i < tas_dt->nr_blk; i++) {
+		blk = &(tas_dt->dev_blks[i]);
+		kfree(blk->data);
+	}
+	kfree(tas_dt->dev_blks);
+}
+
+static void tasdev_dsp_prog_remove(struct tasdevice_prog *prog,
+	unsigned short nr)
+{
+	int i;
+
+	for (i = 0; i < nr; i++)
+		tasdev_dsp_prog_blk_remove(&prog[i]);
+	kfree(prog);
+}
+
+static void tasdev_dsp_cfg_blk_remove(struct tasdevice_config *cfg)
+{
+	struct tasdevice_data *tas_dt;
+	struct tasdev_blk *blk;
+	unsigned int i;
+
+	if (cfg) {
+		tas_dt = &(cfg->dev_data);
+
+		if (!tas_dt->dev_blks)
+			return;
+
+		for (i = 0; i < tas_dt->nr_blk; i++) {
+			blk = &(tas_dt->dev_blks[i]);
+			kfree(blk->data);
+		}
+		kfree(tas_dt->dev_blks);
+	}
+}
+
+static void tasdev_dsp_cfg_remove(struct tasdevice_config *config,
+	unsigned short nr)
+{
+	int i;
+
+	for (i = 0; i < nr; i++)
+		tasdev_dsp_cfg_blk_remove(&config[i]);
+	kfree(config);
+}
+
+void tasdevice_spi_dsp_remove(void *context)
+{
+	struct tasdevice_priv *tas_dev = context;
+
+	if (!tas_dev->fmw)
+		return;
+
+	if (tas_dev->fmw->programs)
+		tasdev_dsp_prog_remove(tas_dev->fmw->programs,
+			tas_dev->fmw->nr_programs);
+	if (tas_dev->fmw->configs)
+		tasdev_dsp_cfg_remove(tas_dev->fmw->configs,
+			tas_dev->fmw->nr_configurations);
+	kfree(tas_dev->fmw);
+	tas_dev->fmw = NULL;
+}
+
+static void tas2781_clear_calfirmware(struct tasdevice_fw *tas_fmw)
+{
+	struct tasdevice_calibration *calibration;
+	struct tasdev_blk *block;
+	unsigned int blks;
+	int i;
+
+	if (!tas_fmw->calibrations)
+		goto out;
+
+	for (i = 0; i < tas_fmw->nr_calibrations; i++) {
+		calibration = &(tas_fmw->calibrations[i]);
+		if (!calibration)
+			continue;
+
+		if (!calibration->dev_data.dev_blks)
+			continue;
+
+		for (blks = 0; blks < calibration->dev_data.nr_blk; blks++) {
+			block = &(calibration->dev_data.dev_blks[blks]);
+			if (!block)
+				continue;
+			kfree(block->data);
+		}
+		kfree(calibration->dev_data.dev_blks);
+	}
+	kfree(tas_fmw->calibrations);
+out:
+	kfree(tas_fmw);
+}
+
+void tasdevice_spi_calbin_remove(void *context)
+{
+	struct tasdevice_priv *tas_priv = context;
+
+	if (tas_priv->cali_data_fmw) {
+		tas2781_clear_calfirmware(tas_priv->cali_data_fmw);
+		tas_priv->cali_data_fmw = NULL;
+	}
+}
+
+void tasdevice_spi_config_info_remove(void *context)
+{
+	struct tasdevice_priv *tas_priv = context;
+	struct tasdevice_rca *rca = &(tas_priv->rcabin);
+	struct tasdevice_config_info **ci = rca->cfg_info;
+	unsigned int i, j;
+
+	if (!ci)
+		return;
+	for (i = 0; i < rca->ncfgs; i++) {
+		if (!ci[i])
+			continue;
+		if (ci[i]->blk_data) {
+			for (j = 0; j < ci[i]->real_nblocks; j++) {
+				if (!ci[i]->blk_data[j])
+					continue;
+				kfree(ci[i]->blk_data[j]->regdata);
+				kfree(ci[i]->blk_data[j]);
+			}
+			kfree(ci[i]->blk_data);
+		}
+		kfree(ci[i]);
+	}
+	kfree(ci);
+}
+
+static int tasdevice_load_data(struct tasdevice_priv *tas_priv,
+	struct tasdevice_data *dev_data)
+{
+	struct tasdev_blk *block;
+	unsigned int i;
+	int ret = 0;
+
+	for (i = 0; i < dev_data->nr_blk; i++) {
+		block = &(dev_data->dev_blks[i]);
+		ret = tas_priv->tasdevice_load_block(tas_priv, block);
+		if (ret < 0)
+			break;
+	}
+
+	return ret;
+}
+
+int tasdevice_spi_select_tuningprm_cfg(void *context, int prm_no,
+	int cfg_no, int rca_conf_no)
+{
+	struct tasdevice_priv *tas_priv = context;
+	struct tasdevice_rca *rca = &(tas_priv->rcabin);
+	struct tasdevice_config_info **cfg_info = rca->cfg_info;
+	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
+	struct tasdevice_prog *program;
+	struct tasdevice_config *conf;
+	int prog_status = 0;
+	int status;
+
+	if (!tas_fmw) {
+		dev_err(tas_priv->dev, "%s: Firmware is NULL\n", __func__);
+		return 0;
+	}
+
+	if (cfg_no >= tas_fmw->nr_configurations) {
+		dev_err(tas_priv->dev,
+			"%s: cfg(%d) is not in range of conf %u\n",
+			__func__, cfg_no, tas_fmw->nr_configurations);
+		return 0;
+	}
+
+	if (prm_no >= tas_fmw->nr_programs) {
+		dev_err(tas_priv->dev,
+			"%s: prm(%d) is not in range of Programs %u\n",
+			__func__, prm_no, tas_fmw->nr_programs);
+		return 0;
+	}
+
+	if (rca_conf_no >= rca->ncfgs ||
+	    rca_conf_no < 0 ||
+	    !cfg_info) {
+		dev_err(tas_priv->dev,
+			"conf_no:%d should be in range from 0 to %u\n",
+			rca_conf_no, rca->ncfgs-1);
+		return 0;
+	}
+
+	if (prm_no >= 0	&&
+	   (tas_priv->cur_prog != prm_no ||
+	    tas_priv->force_fwload_status)) {
+		tas_priv->cur_conf = -1;
+		tas_priv->is_loading = true;
+		prog_status++;
+	}
+
+	if (prog_status) {
+		program = &(tas_fmw->programs[prm_no]);
+		tasdevice_load_data(tas_priv, &(program->dev_data));
+		if (tas_priv->is_loaderr == false &&
+		    tas_priv->is_loading == true) {
+			struct tasdevice_fw *cal_fmw =
+				tas_priv->cali_data_fmw;
+
+			if (cal_fmw) {
+				struct tasdevice_calibration
+					*cal = cal_fmw->calibrations;
+
+				if (cal)
+					load_calib_data(tas_priv,
+						&(cal->dev_data));
+			}
+			tas_priv->cur_prog = prm_no;
+		}
+
+	}
+
+	if (cfg_no &&
+	   (cfg_no != tas_priv->cur_conf) &&
+	   (tas_priv->is_loaderr == false)) {
+		status++;
+		tas_priv->is_loading = true;
+	} else {
+		tas_priv->is_loading = false;
+	}
+
+	if (status) {
+		conf = &(tas_fmw->configs[cfg_no]);
+		status = 0;
+		tasdevice_load_data(tas_priv, &(conf->dev_data));
+		if (tas_priv->is_loaderr == true) {
+			status |= 1 << 4;
+		} else if (tas_priv->is_loaderr == false &&
+			   tas_priv->is_loading == true) {
+			tas_priv->cur_conf = cfg_no;
+		}
+	} else {
+		dev_dbg(tas_priv->dev, "%s: Unneeded loading dsp conf %d\n",
+			__func__, cfg_no);
+	}
+
+	return prog_status;
+}
+
+int tasdevice_spi_prmg_load(void *context, int prm_no)
+{
+	struct tasdevice_priv *tas_priv = context;
+	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
+	struct tasdevice_prog *program;
+	int prog_status = 0;
+
+	if (!tas_fmw) {
+		dev_err(tas_priv->dev, "%s: Firmware is NULL\n", __func__);
+		return 0;
+	}
+
+	if (prm_no >= tas_fmw->nr_programs) {
+		dev_err(tas_priv->dev,
+			"%s: prm(%d) is not in range of Programs %u\n",
+			__func__, prm_no, tas_fmw->nr_programs);
+		return 0;
+	}
+
+	if (prm_no >= 0 && tas_priv->cur_prog != prm_no) {
+		tas_priv->cur_conf = -1;
+		tas_priv->is_loading = true;
+		prog_status++;
+	}
+	if (prog_status) {
+		program = &(tas_fmw->programs[prm_no]);
+		tasdevice_load_data(tas_priv, &(program->dev_data));
+		if ((tas_priv->is_loaderr == false) &&
+		    (tas_priv->is_loading == true))
+			tas_priv->cur_prog = prm_no;
+	}
+
+	return prog_status;
+}
+
+int tasdevice_spi_prmg_calibdata_load(void *context, int prm_no)
+{
+	struct tasdevice_priv *tas_priv = context;
+	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
+	struct tasdevice_prog *program;
+	int prog_status = 0;
+
+	if (!tas_fmw) {
+		dev_err(tas_priv->dev, "%s: Firmware is NULL\n", __func__);
+		return 0;
+	}
+
+	if (prm_no >= tas_fmw->nr_programs) {
+		dev_err(tas_priv->dev,
+			"%s: prm(%d) is not in range of Programs %u\n",
+			__func__, prm_no, tas_fmw->nr_programs);
+		return 0;
+	}
+
+	if (prm_no >= 0 && tas_priv->cur_prog != prm_no) {
+		tas_priv->cur_conf = -1;
+		tas_priv->is_loading = true;
+		prog_status++;
+	}
+	tas_priv->is_loaderr = false;
+
+	if (prog_status) {
+		program = &(tas_fmw->programs[prm_no]);
+		tasdevice_load_data(tas_priv, &(program->dev_data));
+		if (tas_priv->is_loaderr == false &&
+		    tas_priv->is_loading == true) {
+			struct tasdevice_fw *cal_fmw =
+				tas_priv->cali_data_fmw;
+
+			if (cal_fmw) {
+				struct tasdevice_calibration *cal =
+					cal_fmw->calibrations;
+
+				if (cal)
+					load_calib_data(tas_priv,
+						&(cal->dev_data));
+			}
+			tas_priv->cur_prog = prm_no;
+		}
+
+	}
+
+	return prog_status;
+}
+
+void tasdevice_spi_tuning_switch(void *context, int state)
+{
+	struct tasdevice_priv *tas_priv = context;
+	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
+	int profile_cfg_id = tas_priv->rcabin.profile_cfg_id;
+
+	if (tas_priv->fw_state == TASDEVICE_DSP_FW_FAIL) {
+		dev_err(tas_priv->dev, "DSP bin file not loaded\n");
+		return;
+	}
+
+	if (state == 0) {
+		if (tas_priv->cur_prog < tas_fmw->nr_programs) {
+			/* dsp mode or tuning mode */
+			profile_cfg_id = tas_priv->rcabin.profile_cfg_id;
+			tasdevice_spi_select_tuningprm_cfg(tas_priv,
+				tas_priv->cur_prog, tas_priv->cur_conf,
+				profile_cfg_id);
+		}
+
+		tasdevice_spi_select_cfg_blk(tas_priv, profile_cfg_id,
+			TASDEVICE_BIN_BLK_PRE_POWER_UP);
+	} else {
+		tasdevice_spi_select_cfg_blk(tas_priv, profile_cfg_id,
+			TASDEVICE_BIN_BLK_PRE_SHUTDOWN);
+	}
+}
-- 
2.40.1

>From 095fdc73683ce6a19b1dbae740e83a79a4e06c41 Mon Sep 17 00:00:00 2001
From: Baojun Xu <baojun.xu@ti.com>
Date: Thu, 13 Jun 2024 16:11:58 +0800
Subject: [PATCH v7 1/1] ALSA: hda/tas2781: Add tas2781 hda driver based on SPI

Integrate tas2781 hda spi driver configs for HP (Varcolac).
Every tas2781 SPI node was added by serial-multi-instantie.c as a single
SPI device. The code support Realtek as the primary codec.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

---
v7:
 - Add new project Gemtree (0x103c8daa) support for tas2781 spi driver.
v6:
 - Remove client in tasdevice_priv struct as it was not used.
 - Change format for tasdevice_spi_dev_write() in tas2781_hda_spi.c.
 - Change update bits function to read & write mode, as tas2781 use last bit
   to mask read & write, it cause regmap_update_bits work not as our expected.
 - Add element in tas2781_snd_controls, tas2781_prof_ctrl,
   tas2781_dsp_conf_ctrl, to support second device.
   Previous version add sound card for first index only.
 - Change calibration registers address declaire to TASDEVICE_REG() mode.
 - Add snd_ctl_new1() for second device.
 - Change format for tas2781_hda_unbind() to fit 79 chars in one line.
 - Remove client for spi as it was not used.
 - Remove unused variables.
 - Remove cur_prog clean in runtime_suspend().
 - Remove unused variables.
 - Add tasdevice_spi_tuning_switch() in runtime_resume.
 - Remove cur_prog clean in system_resume().
 - Add tuning switch if playback started in system_resume().
 - Change TASDEVICE_PAGE_REG to TASDEVICE_REG_ID in tas2781_spi_fwlib.c.
 - Remove calibration binary load functions as data will be loaded from EFI.
v5:
 - Combined all modification into one patch for pass the compile.
 - Remove old hardware id "TIAS2781" as no production on market.
 - Change max page size to 256 in tas2781-spi.h.
 - Change book reg from 127 to GENMASK(7, 1), as one bit shift is needed.
 - Change register address define as one bit shift needed for offset.
 - Change block check sum comments to Firmware block from I2C.
 - Change define of (page + reg) to TASDEVICE_PAGE_REG from TASDEVICE_PGRG.
 - Change to lower case in defined value.
 - Add registers default value table in tas2781_hda_spi.c
 - Change rang_max to 256 * 256.
 - Add zero_flag_mask in regmap_config.
 - Change max_register to 256 * 256.
 - Add registers default table into structure regmap_config.
 - Change parameter from book number to whole register address.
 - Remove page 0 switch as SPI driver will do it.
 - Add bit(0) for read function as tas2781 will check last bit of address,
   to determine operation mode is read (1) or write (0).
 - Change switch case to if check in tas2781_hda_playback_hook(),
   as it may cause compile problem in clang-19 building.
 - Change variable declaration position.
 - Change order in if check.
 - Remove old hardware id ("TIAS2781") support.
 - Remove debug message in runtime suspend and resume.
 - Remove regmap.h include in tas2781_spi_fwlib.c.
 - Remove MODULE_ in fwlib as this file will work with tas2781_hda_spi.c only.
v4:
 - Add old hardware id "TIAS2781" for compatible with old production
 - Add 2 devices in struct smi_node tas2781_hda, to compatible with 4 AMPs
v4:
 - Add old hardware id "TIAS2781" for compatible with old production
 - Add 2 devices in struct smi_node tas2781_hda, to compatible with 4 AMPs
 - Move include of sound/tas2781-dsp.h to c source file tas2781_hda_spi.c,
   tas2781_spi_fwlib.c, as it's not needed in header file tas2781-spi.h
 - Use page and book number define in other micro define
 - Change 4000000 to (4 * HZ_PER_MHZ)
 - Add define for calibration variable name and size in UEFI.
 - Remove structure tasdevice & tasdevice_irqinfo, and move variables in to
   structure tasdevice_priv
 - Remove some unused variables in sttructure tasdevice_priv
 - Remove function declare of tascodec_init(), use tascodec_spi_init()
 - Remove function declare of tasdevice_remove()
 - Add array_size.h included in tas2781_hda_spi.c
 - Add cleanup.h included for change mutex to guard
 - Add units.h included
 - Include tas2781-dsp.h
 - Remove unused variables in tas2781_hda structure
 - Change 0xff to GENMASK(7, 0)
 - Change 128 to define of max page size
 - Change code as all variables was moved to tasdevice_priv structure
 - Change comments for error in book write, or page write
 - Remove initial of ret, and return 0 directly
 - Change comments for wrong typo, add space in front and end
 - Add check for bulk read, max size should be a page size
 - Change usleep_rang() to fsleep()
 - Change mutex_lock to guard(mutex), and remove mutex_unlock()
 - Change tasdevice_spi_init() to void from int as no value return required
 - Change second parameter to sizeof
 - Remove tasdevice_clamp(), use clamp()
 - Add compatible with old hardware id "TIAS2781"
 - Remove cs_gpio and spi device in tas2781_read_acpi() as use default CS
 - Change dev-index check, return -EINVAL if it's <= 0
 - Change 0xFF to U8_MAX
 - Remove GPIO get for chip-select, use default from SPI device
 - Perform RESET in first AMP only as all AMPs share same RESET pin
 - return 0 directly in some simple routine to avoid variable initial
 - Change comments for function which was used by system
 - Change "ON" "OFF" to function str_on_off(...)
 - Change format of GUID
 - Add temp buffer for first efi.get_variable()
 - Free data if it was allocated
 - Change format of debug message of calibration date time print
 - Remove total_sz = 0, as it's not needed
 - Move save_calibration to after tuning_switch to avoid calibration data
   overwrite
 - Remove dev from structure tasdevice_hda, use dev in tasdevice_priv
 - Remove 0 from { "tas2781-hda", 0}, & {"TXNW2781", 0},
 - Add old hardware id "TIAS2781" for compatible with old production
 - Add 2 devices in struct smi_node tas2781_hda, to compatible with 4 AMPs
v3:
 - Move HID up to above /* Non-conforming _HID ... */ in scan.c,
   for avoid misunderstanding.
 - Move HID up to above /* Non-conforming _HID ... */ in
   serial-multi-instantiate.c, for avoid misunderstanding.
 - Change objs to y for snd-hda-scodec-tas2781-spi- in Makefile.
 - Change format for some define in tas2781-spi.h.
 - Add define for TASDEVICE_MAX_BOOK_NUM, TASDEVICE_MAX_PAGE.
 - Move declare of "enum calib_data {" to header file from source file.
 - Remove "enum device_catlog_id {" as only one platform was supported now.
 - Remove "struct calidata", as we will save pure calibration data only.
 - Remove "struct calidata", "enum device_catlog_id" in tasdevice_priv.
 - Add calibration_data in tasdevice_priv to save pure calibration data.
 - Remove declare of tasdevice_save_calibration() and
   tasdevice_apply_calibration(), as it will be used within same c file.
 - Add below header files included in tas2781_hda_spi.c:
   bits.h, mutex.h, property.h, time.h, types.h.
 - Move two micro define to header file tas2781-spi.h.
 - Change format of some micro define.
 - Change format of some structure.
 - Remove irq in tas2781_hda, as have it already in tasdevice_priv.
 - Remove some local functions declare as not necessarily.
 - Return error if regmap_write() failed.
 - Change fixed value 2 to sizeof(data).
 - Remove all of EXPORT_SYMBOL_GPL,
   as all of function was called within same module.
 - Remove empty line after last return in some functions.
 - Remove some variable initialyzation.
 - Remove variable sub, store acpi_subsystem_id directly.
 - Remove wrong comments for device index, it's must, can't be NULL.
 - Remove some local variables, use elements in structure directly.
 - Append commas in last element of an array.
 - Change calibration data process, didn't save all of calibration data in EFI,
   get in local, and save pure calibration data in tasdevice_priv.
 - Call tasdevice_save_calibration() from function pointer in tasdevice_priv;
 - Remove subid as one platform was supported only, needn't check.
 - Add initialyzation for local variable.
 - Move regmap initialyzation to before acpi read.
 - Call tasdevice_apply_calibration() from function pointer in tasdevice_priv;
 - Remove MODULE_IMPORT_NS(SND_SOC_TAS2781_FMWLIB), as all functions was
   performed within same module.
 - Update format and variables declare order.
 - Change format of multi conditions for if.
 - Remove casting which is not needed.
 - Change variables type to avoid casting.
 - Remove Unneeded parentheses.
 - Change if check to avoid goto.
 - Add {} for keep same style.
 - Remove some local variables, use elements in structure directly.
v2:
 - Change depends on SPI to SPI_MASTER in sound/pci/hda/Kconfig
 - Add select SND_HDA_SCODEC_COMPONENT in sound/pci/hda/Kconfig
 - Change comp_generic_fixup() 5th parameter from "-%s:00" to
   "-%s:00-tas2781-hda.%d" in sound/pci/hda/patch_realtek.c
 - Change chain_id from ALC285_FIXUP_THINKPAD_HEADSET_JACK to
   ALC285_FIXUP_HP_GPIO_LED in sound/pci/hda/patch_realtek.c
 - Remove project name "Gemtree"
 - Update information in file header of tas2781-spi.h.
 - Remove useless micro define.
 - Change TASDEVICE_I2CChecksum to TASDEVICE_Checksum
 - Remove enum control_bus as current code support SPI only.
 - Remove device define as current code support TAS2781 only.
 - Remove spi_device **spi_devs in structure tasdevice_priv.
 - Remove cal_binaryname in structure tasdevice_priv.
 - Remove ndev in structure tasdevice_priv.
 - Change isacpi and  isspi, replace by control_bus(I2C or SPI).
 - Remove void tasdevice_spi_dsp_remove(void *context).
 - Add acpi_device and irq in structure tas2781_hda in tas2781_hda_spi.c.
 - Remove parameter chn in all of registers access functions.
 - Add tascodec_spi_init().
 - Add chip select gpio set for SPI device.
 - Change tasdevice_tuning_switch() to tasdevice_spi_tuning_switch().
 - Change device offset from tas_priv->ndev to tas_priv->index.
 - Change tasdevice_dsp_remove() to tasdevice_spi_dsp_remove().
 - tasdevice_prmg_load() to tasdevice_spi_prmg_load().
 - Change tasdevice_config_info_remove() to
   tasdevice_spi_config_info_remove().
 - Add one dummy byte shift when read from page 2~127, or not book 0.
 - Change tasdevice_spi_change_chn_book() to tasdevice_spi_switch_book()
 - Perform put_device(physdev) before error return.
 - Change calibration data id to 2781 from 2783 in EFI
 - Change calibration data structure name in comments.
 - Remove file name in tas2781_spi_fwlib.c.
 - Remove #include <linux/i2c.h> as it not needed in SPI mode.
 - Change TAB to speace in micro define in tas2781_spi_fwlib.c.
 - Change to up-case for DSP.
 - Change all of multi-line comments format, empty first line.
 - Change all of sizeof(struct xx) to sizeof(*xx).
 - Remove Explicit casting for variables compare to avoid possible fault.
 - Return directly without goto.
 - Change 1 << xx to BIT(xx).
 - Remove deviceNumber[] as current SPI device will support one device only.
 - Add memory free before return error.
 - Change "buf[offset]; offset += 1" to buf[offset++].
 - Remove some debug information print.
 - Change firmware binary to single device mode.
 - Change all bexx_to_cpup() to get_unaligned_bexx().
 - Remove ndev process as current SPI device support single device only.
 - Remove chn and chnend for single device support only.
 - Change all of registers read/write function, remove parameter chn.
 - Create new function for single write, burst write, delay, field write
   in tasdevice_process_block().
---
 drivers/acpi/scan.c                           |    1 +
 .../platform/x86/serial-multi-instantiate.c   |   12 +
 sound/pci/hda/Kconfig                         |   14 +
 sound/pci/hda/Makefile                        |    2 +
 sound/pci/hda/patch_realtek.c                 |   14 +
 sound/pci/hda/tas2781-spi.h                   |  148 ++
 sound/pci/hda/tas2781_hda_spi.c               | 1266 ++++++++++
 sound/pci/hda/tas2781_spi_fwlib.c             | 2101 +++++++++++++++++
 8 files changed, 3558 insertions(+)
 create mode 100644 sound/pci/hda/tas2781-spi.h
 create mode 100644 sound/pci/hda/tas2781_hda_spi.c
 create mode 100644 sound/pci/hda/tas2781_spi_fwlib.c

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 503773707e01..9c08c5886370 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1760,6 +1760,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 		{"CSC3557", },
 		{"INT33FE", },
 		{"INT3515", },
+		{"TXNW2781", },
 		/* Non-conforming _HID for Cirrus Logic already released */
 		{"CLSA0100", },
 		{"CLSA0101", },
diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index 97b9c6392230..23d46063423d 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -368,6 +368,17 @@ static const struct smi_node cs35l57_hda = {
 	.bus_type = SMI_AUTO_DETECT,
 };
 
+static const struct smi_node tas2781_hda = {
+	.instances = {
+		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
+		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
+		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
+		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
+		{}
+	},
+	.bus_type = SMI_AUTO_DETECT,
+};
+
 /*
  * Note new device-ids must also be added to ignore_serial_bus_ids in
  * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
@@ -380,6 +391,7 @@ static const struct acpi_device_id smi_acpi_ids[] = {
 	{ "CSC3556", (unsigned long)&cs35l56_hda },
 	{ "CSC3557", (unsigned long)&cs35l57_hda },
 	{ "INT3515", (unsigned long)&int3515_data },
+	{ "TXNW2781", (unsigned long)&tas2781_hda },
 	/* Non-conforming _HID for Cirrus Logic already released */
 	{ "CLSA0100", (unsigned long)&cs35l41_hda },
 	{ "CLSA0101", (unsigned long)&cs35l41_hda },
diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 0da625533afc..113161618788 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -204,6 +204,20 @@ config SND_HDA_SCODEC_TAS2781_I2C
 comment "Set to Y if you want auto-loading the side codec driver"
 	depends on SND_HDA=y && SND_HDA_SCODEC_TAS2781_I2C=m
 
+config SND_HDA_SCODEC_TAS2781_SPI
+	tristate "Build TAS2781 HD-audio side codec support for SPI Bus"
+	depends on SPI_MASTER
+	depends on ACPI
+	depends on EFI
+	depends on SND_SOC
+	select CRC32_SARWATE
+	help
+	  Say Y or M here to include TAS2781 SPI HD-audio side codec support
+	  in snd-hda-intel driver, such as ALC287.
+
+comment "Set to Y if you want auto-loading the side codec driver"
+	depends on SND_HDA=y && SND_HDA_SCODEC_TAS2781_SPI=m
+
 config SND_HDA_CODEC_REALTEK
 	tristate "Build Realtek HD-audio codec support"
 	select SND_HDA_GENERIC
diff --git a/sound/pci/hda/Makefile b/sound/pci/hda/Makefile
index 058ca0a289e4..0bb5f0ce073f 100644
--- a/sound/pci/hda/Makefile
+++ b/sound/pci/hda/Makefile
@@ -70,6 +70,8 @@ obj-$(CONFIG_SND_HDA_SCODEC_CS35L56_SPI) += snd-hda-scodec-cs35l56-spi.o
 obj-$(CONFIG_SND_HDA_CS_DSP_CONTROLS) += snd-hda-cs-dsp-ctls.o
 obj-$(CONFIG_SND_HDA_SCODEC_COMPONENT) += snd-hda-scodec-component.o
 obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_I2C) += snd-hda-scodec-tas2781-i2c.o
+obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_SPI) += snd-hda-scodec-tas2781-spi.o
+snd-hda-scodec-tas2781-spi-y :=	tas2781_hda_spi.o tas2781_spi_fwlib.o
 
 # this must be the last entry after codec drivers;
 # otherwise the codec patches won't be hooked before the PCI probe
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index aa76d1c88589..38f2cf148477 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6921,6 +6921,11 @@ static void tas2781_fixup_i2c(struct hda_codec *cdc,
 	comp_generic_fixup(cdc, action, "i2c", "TIAS2781", "-%s:00", 1);
 }
 
+static void tas2781_fixup_spi(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
+{
+	comp_generic_fixup(cdc, action, "spi", "TXNW2781", "-%s:00-tas2781-hda.%d", 2);
+}
+
 static void yoga7_14arb7_fixup_i2c(struct hda_codec *cdc,
 	const struct hda_fixup *fix, int action)
 {
@@ -7498,6 +7503,7 @@ enum {
 	ALC236_FIXUP_DELL_DUAL_CODECS,
 	ALC287_FIXUP_CS35L41_I2C_2_THINKPAD_ACPI,
 	ALC287_FIXUP_TAS2781_I2C,
+	ALC245_FIXUP_TAS2781_SPI_2,
 	ALC287_FIXUP_YOGA7_14ARB7_I2C,
 	ALC245_FIXUP_HP_MUTE_LED_COEFBIT,
 	ALC245_FIXUP_HP_X360_MUTE_LEDS,
@@ -9688,6 +9694,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	},
+	[ALC245_FIXUP_TAS2781_SPI_2] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = tas2781_fixup_spi,
+		.chained = true,
+		.chain_id = ALC285_FIXUP_HP_GPIO_LED,
+	},
 	[ALC287_FIXUP_YOGA7_14ARB7_I2C] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = yoga7_14arb7_fixup_i2c,
@@ -10156,6 +10168,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b8d, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b8f, "HP", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b92, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8b93, "HP Varcolac", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8b96, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8bb3, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
@@ -10212,6 +10225,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8cdf, "HP SnowWhite", ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ce0, "HP SnowWhite", ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8cf5, "HP ZBook Studio 16", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8daa, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x106d, "Asus K53BE", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
diff --git a/sound/pci/hda/tas2781-spi.h b/sound/pci/hda/tas2781-spi.h
new file mode 100644
index 000000000000..3ddb4dc7173b
--- /dev/null
+++ b/sound/pci/hda/tas2781-spi.h
@@ -0,0 +1,148 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+//
+// ALSA SoC Texas Instruments TAS2781 Audio Smart Amplifier
+//
+// Copyright (C) 2024 Texas Instruments Incorporated
+// https://www.ti.com
+//
+// The TAS2781 driver implements a flexible and configurable
+// algo coefficient setting for TAS2781 chips.
+//
+// Author: Baojun Xu <baojun.xu@ti.com>
+//
+
+#ifndef __TAS2781_SPI_H__
+#define __TAS2781_SPI_H__
+
+#define TASDEVICE_RATES			\
+	(SNDRV_PCM_RATE_44100 |	SNDRV_PCM_RATE_48000 | \
+	SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_88200)
+
+#define TASDEVICE_FORMATS		\
+	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
+	SNDRV_PCM_FMTBIT_S32_LE)
+
+#define TASDEVICE_MAX_BOOK_NUM		256
+#define TASDEVICE_MAX_PAGE		256
+
+#define TASDEVICE_MAX_SIZE	(TASDEVICE_MAX_BOOK_NUM * TASDEVICE_MAX_PAGE)
+
+/* PAGE Control Register (available in page0 of each book) */
+#define TASDEVICE_PAGE_SELECT		0x00
+#define TASDEVICE_BOOKCTL_PAGE		0x00
+#define TASDEVICE_BOOKCTL_REG		GENMASK(7, 1)
+#define TASDEVICE_BOOK_ID(reg)		((reg & GENMASK(24, 16)) >> 16)
+#define TASDEVICE_PAGE_ID(reg)		((reg & GENMASK(15, 8)) >> 8)
+#define TASDEVICE_REG_ID(reg)		((reg & GENMASK(7, 1)) >> 1)
+#define TASDEVICE_PAGE_REG(reg)		(reg & GENMASK(15, 1))
+#define TASDEVICE_REG(book, page, reg)	(((book & GENMASK(7, 0)) << 16) + \
+					 ((page & GENMASK(7, 0)) << 8) + \
+					  ((reg & GENMASK(6, 0)) << 1))
+
+/* Software Reset */
+#define TAS2781_REG_SWRESET		TASDEVICE_REG(0x0, 0x0, 0x01)
+#define TAS2781_REG_SWRESET_RESET	BIT(0)
+
+/* Firmware block Checksum */
+#define TASDEVICE_Checksum		TASDEVICE_REG(0x0, 0x0, 0x7e)
+
+/* Volume control */
+#define TAS2781_DVC_LVL			TASDEVICE_REG(0x0, 0x0, 0x1a)
+#define TAS2781_AMP_LEVEL		TASDEVICE_REG(0x0, 0x0, 0x03)
+#define TAS2781_AMP_LEVEL_MASK		GENMASK(5, 1)
+
+#define TASDEVICE_CMD_SING_W		0x1
+#define TASDEVICE_CMD_BURST		0x2
+#define TASDEVICE_CMD_DELAY		0x3
+#define TASDEVICE_CMD_FIELD_W		0x4
+
+#define TAS2781_SPI_MAX_FREQ		(4 * HZ_PER_MHZ)
+
+#define TASDEVICE_CRC8_POLYNOMIAL		0x4d
+#define TASDEVICE_SPEAKER_CALIBRATION_SIZE	20
+
+#define TASDEVICE_CALIBRATION_DATA_NAME	L"CALI_DATA"
+#define TASDEVICE_CALIBRATION_DATA_SIZE	256
+
+enum calib_data {
+	R0_VAL = 0,
+	INV_R0,
+	R0LOW,
+	POWER,
+	TLIM,
+	CALIB_MAX
+};
+
+struct tasdevice_priv {
+	struct tasdevice_fw *cali_data_fmw;
+	struct tasdevice_rca rcabin;
+	struct tasdevice_fw *fmw;
+	struct gpio_desc *reset;
+	struct mutex codec_lock;
+	struct regmap *regmap;
+	struct device *dev;
+	struct tm tm;
+
+	const char *acpi_subsystem_id;
+	unsigned char crc8_lkp_tbl[CRC8_TABLE_SIZE];
+	unsigned char coef_binaryname[64];
+	unsigned char rca_binaryname[64];
+	unsigned char dev_name[32];
+
+	unsigned int err_code;
+	bool is_loading;
+	bool is_loaderr;
+	int cur_book;
+	int cur_prog;
+	int cur_conf;
+	int fw_state;
+	int index;
+	int irq;
+	void *client;
+	void *codec;
+	bool force_fwload_status;
+	bool playback_started;
+	unsigned int calibration_data[CALIB_MAX];
+
+	int (*fw_parse_variable_header)(struct tasdevice_priv *tas_priv,
+		const struct firmware *fmw, int offset);
+	int (*fw_parse_program_data)(struct tasdevice_priv *tas_priv,
+		struct tasdevice_fw *tas_fmw,
+		const struct firmware *fmw, int offset);
+	int (*fw_parse_configuration_data)(struct tasdevice_priv *tas_priv,
+		struct tasdevice_fw *tas_fmw,
+		const struct firmware *fmw, int offset);
+	int (*tasdevice_load_block)(struct tasdevice_priv *tas_priv,
+		struct tasdev_blk *block);
+
+	int (*save_calibration)(struct tasdevice_priv *tas_priv);
+	void (*apply_calibration)(struct tasdevice_priv *tas_priv);
+};
+
+int tasdevice_spi_dev_read(struct tasdevice_priv *tas_priv,
+	unsigned int reg, unsigned int *value);
+int tasdevice_spi_dev_write(struct tasdevice_priv *tas_priv,
+	unsigned int reg, unsigned int value);
+int tasdevice_spi_dev_bulk_write(
+	struct tasdevice_priv *tas_priv, unsigned int reg,
+	unsigned char *p_data, unsigned int n_length);
+int tasdevice_spi_dev_bulk_read(struct tasdevice_priv *tas_priv,
+	unsigned int reg, unsigned char *p_data, unsigned int n_length);
+int tasdevice_spi_dev_update_bits(struct tasdevice_priv *tasdevice,
+	unsigned int reg, unsigned int mask, unsigned int value);
+
+void tasdevice_spi_select_cfg_blk(void *context, int conf_no,
+	unsigned char block_type);
+void tasdevice_spi_config_info_remove(void *context);
+int tasdevice_spi_dsp_parser(void *context);
+int tasdevice_spi_rca_parser(void *context, const struct firmware *fmw);
+void tasdevice_spi_dsp_remove(void *context);
+void tasdevice_spi_calbin_remove(void *context);
+int tasdevice_spi_select_tuningprm_cfg(void *context, int prm,
+	int cfg_no, int rca_conf_no);
+int tasdevice_spi_prmg_load(void *context, int prm_no);
+int tasdevice_spi_prmg_calibdata_load(void *context, int prm_no);
+void tasdevice_spi_tuning_switch(void *context, int state);
+int tas2781_spi_load_calibration(void *context, char *file_name,
+	unsigned short i);
+#endif /* __TAS2781_SPI_H__ */
diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/pci/hda/tas2781_hda_spi.c
new file mode 100644
index 000000000000..e9b77f602c75
--- /dev/null
+++ b/sound/pci/hda/tas2781_hda_spi.c
@@ -0,0 +1,1266 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// TAS2781 HDA SPI driver
+//
+// Copyright 2024 Texas Instruments, Inc.
+//
+// Author: Baojun Xu <baojun.xu@ti.com>
+
+#include <linux/acpi.h>
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/crc8.h>
+#include <linux/crc32.h>
+#include <linux/efi.h>
+#include <linux/firmware.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/spi/spi.h>
+#include <linux/time.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#include <sound/hda_codec.h>
+#include <sound/soc.h>
+#include <sound/tas2781-dsp.h>
+#include <sound/tlv.h>
+#include <sound/tas2781-tlv.h>
+
+#include "tas2781-spi.h"
+
+#include "hda_local.h"
+#include "hda_auto_parser.h"
+#include "hda_component.h"
+#include "hda_jack.h"
+#include "hda_generic.h"
+
+/*
+ * No standard control callbacks for SNDRV_CTL_ELEM_IFACE_CARD
+ * Define two controls, one is Volume control callbacks, the other is
+ * flag setting control callbacks.
+ */
+
+/* Volume control callbacks for tas2781 */
+#define ACARD_SINGLE_RANGE_EXT_TLV(xname, xreg, xshift, xmin, xmax, xinvert, \
+	xhandler_get, xhandler_put, tlv_array) { \
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD, .name = (xname), \
+	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
+		SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.tlv.p = (tlv_array), \
+	.info = snd_soc_info_volsw_range, \
+	.get = xhandler_get, .put = xhandler_put, \
+	.private_value = (unsigned long)&(struct soc_mixer_control) { \
+		.reg = xreg, .rreg = xreg, \
+		.shift = xshift, .rshift = xshift,\
+		.min = xmin, .max = xmax, .invert = xinvert, \
+	} \
+}
+
+/* Flag control callbacks for tas2781 */
+#define ACARD_SINGLE_BOOL_EXT(xname, xdata, xhandler_get, xhandler_put) { \
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD, \
+	.name = xname, \
+	.info = snd_ctl_boolean_mono_info, \
+	.get = xhandler_get, \
+	.put = xhandler_put, \
+	.private_value = xdata, \
+}
+
+struct tas2781_hda {
+	struct tasdevice_priv *priv;
+	struct acpi_device *dacpi;
+	struct snd_kcontrol *dsp_prog_ctl;
+	struct snd_kcontrol *dsp_conf_ctl;
+	struct snd_kcontrol *snd_ctls[3];
+	struct snd_kcontrol *prof_ctl;
+};
+
+static const struct reg_default tas2781_reg_defaults[] = {
+	/* Default values for ROM mode. Activated. */
+	{ 0x04, 0x1a },	/* AMP inactive. */
+	{ 0x14, 0x3a },	/* Enable both channels. */
+	{ 0xb8, 0x99 },	/* Enable power up on clock. */
+};
+
+static const struct regmap_range_cfg tasdevice_ranges[] = {
+	{
+		.range_min = 0,
+		.range_max = TASDEVICE_MAX_SIZE,
+		.selector_reg = TASDEVICE_PAGE_SELECT,
+		.selector_mask = GENMASK(7, 0),
+		.selector_shift = 0,
+		.window_start = 0,
+		.window_len = TASDEVICE_MAX_PAGE,
+	},
+};
+
+static const struct regmap_config tasdevice_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.zero_flag_mask = true,
+	.cache_type = REGCACHE_NONE,
+	.ranges = tasdevice_ranges,
+	.num_ranges = ARRAY_SIZE(tasdevice_ranges),
+	.max_register = TASDEVICE_MAX_SIZE,
+	.reg_defaults = tas2781_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(tas2781_reg_defaults),
+};
+
+static int tasdevice_spi_switch_book(struct tasdevice_priv *tas_priv, int reg)
+{
+	struct regmap *map = tas_priv->regmap;
+	int ret;
+
+	if (tas_priv->cur_book != TASDEVICE_BOOK_ID(reg)) {
+		ret = regmap_write(map, TASDEVICE_BOOKCTL_REG,
+			TASDEVICE_BOOK_ID(reg));
+		if (ret < 0) {
+			dev_err(tas_priv->dev, "Switch Book E=%d\n", ret);
+			return ret;
+		}
+		tas_priv->cur_book = TASDEVICE_BOOK_ID(reg);
+	}
+	return 0;
+}
+
+int tasdevice_spi_dev_read(struct tasdevice_priv *tas_priv, unsigned int reg,
+	unsigned int *val)
+{
+	struct regmap *map = tas_priv->regmap;
+	int ret;
+
+	ret = tasdevice_spi_switch_book(tas_priv, reg);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * In our TAS2781 SPI mode, if read from other book (not book 0),
+	 * or read from page number larger than 1 in book 0, one more byte
+	 * read is needed, and first byte is a dummy byte, need to be ignored.
+	 */
+	if ((TASDEVICE_BOOK_ID(reg) > 0) || (TASDEVICE_PAGE_ID(reg) > 1)) {
+		unsigned char data[2];
+
+		ret = regmap_bulk_read(map, TASDEVICE_PAGE_REG(reg) | 1,
+			data, sizeof(data));
+		*val = data[1];
+	} else {
+		ret = regmap_read(map, TASDEVICE_PAGE_REG(reg) | 1, val);
+	}
+	if (ret < 0)
+		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+
+	return ret;
+}
+
+int tasdevice_spi_dev_write(struct tasdevice_priv *tas_priv, unsigned int reg,
+	unsigned int value)
+{
+	struct regmap *map = tas_priv->regmap;
+	int ret;
+
+	ret = tasdevice_spi_switch_book(tas_priv, reg);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(map, TASDEVICE_PAGE_REG(reg), value);
+	if (ret < 0)
+		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+
+	return ret;
+}
+
+int tasdevice_spi_dev_bulk_write(struct tasdevice_priv *tas_priv,
+	unsigned int reg, unsigned char *data, unsigned int len)
+{
+	struct regmap *map = tas_priv->regmap;
+	int ret;
+
+	ret = tasdevice_spi_switch_book(tas_priv, reg);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_bulk_write(map, TASDEVICE_PAGE_REG(reg), data, len);
+	if (ret < 0)
+		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+
+	return ret;
+}
+
+int tasdevice_spi_dev_bulk_read(struct tasdevice_priv *tas_priv,
+	unsigned int reg, unsigned char *data, unsigned int len)
+{
+	struct regmap *map = tas_priv->regmap;
+	int ret;
+
+	ret = tasdevice_spi_switch_book(tas_priv, reg);
+	if (ret < 0)
+		return ret;
+
+	if (len > TASDEVICE_MAX_PAGE)
+		len = TASDEVICE_MAX_PAGE;
+	/*
+	 * In our TAS2781 SPI mode, if read from other book (not book 0),
+	 * or read from page number larger than 1 in book 0, one more byte
+	 * read is needed, and first byte is a dummy byte, need to be ignored.
+	 */
+	if ((TASDEVICE_BOOK_ID(reg) > 0) || (TASDEVICE_PAGE_ID(reg) > 1)) {
+		unsigned char buf[TASDEVICE_MAX_PAGE+1];
+
+		ret = regmap_bulk_read(map, TASDEVICE_PAGE_REG(reg) | 1,
+			buf, len + 1);
+		memcpy(data, buf + 1, len);
+	} else {
+		ret = regmap_bulk_read(map, TASDEVICE_PAGE_REG(reg) | 1,
+			data, len);
+	}
+	if (ret < 0)
+		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+
+	return ret;
+}
+
+int tasdevice_spi_dev_update_bits(struct tasdevice_priv *tas_priv,
+	unsigned int reg, unsigned int mask, unsigned int value)
+{
+	struct regmap *map = tas_priv->regmap;
+	int ret, val;
+
+	/*
+	 * In our TAS2781 SPI mode, read/write was masked in last bit of
+	 * address, it cause regmap_update_bits() not work as expected.
+	 */
+	ret = tasdevice_spi_dev_read(tas_priv, reg, &val);
+	if (ret < 0) {
+		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+		return ret;
+	}
+	ret = regmap_write(map, TASDEVICE_PAGE_REG(reg),
+		(val & ~mask) | (mask & value));
+	if (ret < 0)
+		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+
+	return ret;
+}
+
+static void tas2781_spi_reset(struct tasdevice_priv *tas_dev)
+{
+	int ret;
+
+	if (tas_dev->reset) {
+		gpiod_set_value_cansleep(tas_dev->reset, 0);
+		fsleep(800);
+		gpiod_set_value_cansleep(tas_dev->reset, 1);
+	} else {
+		ret = tasdevice_spi_dev_write(tas_dev, TAS2781_REG_SWRESET,
+			TAS2781_REG_SWRESET_RESET);
+		if (ret < 0)
+			dev_err(tas_dev->dev, "dev sw-reset fail, %d\n", ret);
+	}
+	fsleep(1000);
+}
+
+static int tascodec_spi_init(struct tasdevice_priv *tas_priv, void *codec,
+	struct module *module,
+	void (*cont)(const struct firmware *fw, void *context))
+{
+	int ret;
+
+	/*
+	 * Codec Lock Hold to ensure that codec_probe and firmware parsing and
+	 * loading do not simultaneously execute.
+	 */
+	guard(mutex)(&tas_priv->codec_lock);
+
+	ret = scnprintf(tas_priv->rca_binaryname,
+		sizeof(tas_priv->rca_binaryname), "%sRCA%d.bin",
+		tas_priv->dev_name, tas_priv->index);
+	if (ret <= 0) {
+		dev_err(tas_priv->dev, "rca name err:0x%08x\n", ret);
+		return ret;
+	}
+	crc8_populate_msb(tas_priv->crc8_lkp_tbl, TASDEVICE_CRC8_POLYNOMIAL);
+	tas_priv->codec = codec;
+	ret = request_firmware_nowait(module, FW_ACTION_UEVENT,
+		tas_priv->rca_binaryname, tas_priv->dev, GFP_KERNEL, tas_priv,
+		cont);
+	if (ret)
+		dev_err(tas_priv->dev, "request_firmware_nowait err:0x%08x\n",
+			ret);
+
+	return ret;
+}
+
+static void tasdevice_spi_init(struct tasdevice_priv *tas_priv)
+{
+	tas_priv->cur_prog = -1;
+	tas_priv->cur_conf = -1;
+
+	tas_priv->cur_book = -1;
+	tas_priv->cur_prog = -1;
+	tas_priv->cur_conf = -1;
+
+	mutex_init(&tas_priv->codec_lock);
+}
+
+static int tasdevice_spi_amp_putvol(struct tasdevice_priv *tas_priv,
+	struct snd_ctl_elem_value *ucontrol, struct soc_mixer_control *mc)
+{
+	unsigned int invert = mc->invert;
+	unsigned char mask;
+	int max = mc->max;
+	int val, ret;
+
+	mask = rounddown_pow_of_two(max);
+	mask <<= mc->shift;
+	val =  clamp(invert ? max - ucontrol->value.integer.value[0] :
+		ucontrol->value.integer.value[0], 0, max);
+	ret = tasdevice_spi_dev_update_bits(tas_priv,
+		mc->reg, mask, (unsigned int)(val << mc->shift));
+	if (ret)
+		dev_err(tas_priv->dev, "set AMP vol error in dev %d\n",
+			tas_priv->index);
+
+	return ret;
+}
+
+static int tasdevice_spi_amp_getvol(struct tasdevice_priv *tas_priv,
+	struct snd_ctl_elem_value *ucontrol, struct soc_mixer_control *mc)
+{
+	unsigned int invert = mc->invert;
+	unsigned char mask = 0;
+	int max = mc->max;
+	int ret, val;
+
+	/* Read the primary device */
+	ret = tasdevice_spi_dev_read(tas_priv, mc->reg, &val);
+	if (ret) {
+		dev_err(tas_priv->dev, "%s, get AMP vol error\n", __func__);
+		return ret;
+	}
+
+	mask = rounddown_pow_of_two(max);
+	mask <<= mc->shift;
+	val = (val & mask) >> mc->shift;
+	val = clamp(invert ? max - val : val, 0, max);
+	ucontrol->value.integer.value[0] = val;
+
+	return ret;
+}
+
+static int tasdevice_spi_digital_putvol(struct tasdevice_priv *tas_priv,
+	struct snd_ctl_elem_value *ucontrol, struct soc_mixer_control *mc)
+{
+	unsigned int invert = mc->invert;
+	int max = mc->max;
+	int val, ret;
+
+	val = clamp(invert ? max - ucontrol->value.integer.value[0] :
+		ucontrol->value.integer.value[0], 0, max);
+	ret = tasdevice_spi_dev_write(tas_priv, mc->reg, (unsigned int)val);
+	if (ret)
+		dev_err(tas_priv->dev, "set digital vol err in dev %d\n",
+			tas_priv->index);
+
+	return ret;
+
+}
+
+static int tasdevice_spi_digital_getvol(struct tasdevice_priv *tas_priv,
+	struct snd_ctl_elem_value *ucontrol, struct soc_mixer_control *mc)
+{
+	unsigned int invert = mc->invert;
+	int max = mc->max;
+	int ret, val;
+
+	/* Read the primary device as the whole */
+	ret = tasdevice_spi_dev_read(tas_priv, mc->reg, &val);
+	if (ret) {
+		dev_err(tas_priv->dev, "%s, get digital vol err\n", __func__);
+		return ret;
+	}
+
+	val = clamp(invert ? max - val : val, 0, max);
+	ucontrol->value.integer.value[0] = val;
+
+	return ret;
+}
+
+static int tas2781_read_acpi(struct tas2781_hda *tas_hda, const char *hid,
+	int id)
+{
+	struct tasdevice_priv *p = tas_hda->priv;
+	struct acpi_device *adev;
+	struct device *physdev;
+	u32 values[HDA_MAX_COMPONENTS];
+	const char *property;
+	size_t nval;
+	int ret, i;
+
+	adev = acpi_dev_get_first_match_dev(hid, NULL, -1);
+	if (!adev) {
+		dev_err(p->dev, "Failed to find ACPI device: %s\n", hid);
+		return -ENODEV;
+	}
+
+	strscpy(p->dev_name, hid, sizeof(p->dev_name));
+	tas_hda->dacpi = adev;
+	physdev = get_device(acpi_get_first_physical_node(adev));
+	acpi_dev_put(adev);
+
+	/* No side-effect to the playback even if subsystem_id is NULL */
+	p->acpi_subsystem_id = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
+
+	property = "ti,dev-index";
+	ret = device_property_count_u32(physdev, property);
+	if ((ret <= 0) || (ret > ARRAY_SIZE(values))) {
+		ret = -EINVAL;
+		goto err;
+	}
+	nval = ret;
+
+	ret = device_property_read_u32_array(physdev, property, values, nval);
+	if (ret)
+		goto err;
+
+	p->index = U8_MAX;
+	for (i = 0; i < nval; i++) {
+		if (values[i] == id) {
+			p->index = i;
+			break;
+		}
+	}
+	if (p->index == U8_MAX) {
+		dev_dbg(p->dev, "No index found in %s\n", property);
+		ret = -ENODEV;
+		goto err;
+	}
+
+	if (p->index == 0) {
+		/* All of amps share same RESET pin. */
+		p->reset = devm_gpiod_get_index_optional(physdev, "reset",
+			p->index, GPIOD_OUT_LOW);
+		if (IS_ERR(p->reset)) {
+			dev_err_probe(p->dev, ret, "Failed on reset GPIO\n");
+			goto err;
+		}
+	}
+
+	put_device(physdev);
+
+	return 0;
+
+err:
+	dev_err(p->dev, "read acpi error, ret: %d\n", ret);
+	put_device(physdev);
+	acpi_dev_put(adev);
+
+	return ret;
+}
+
+static void tas2781_hda_playback_hook(struct device *dev, int action)
+{
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
+
+	if ((action == HDA_GEN_PCM_ACT_OPEN) ||
+	    (action == HDA_GEN_PCM_ACT_CLOSE)) {
+		if (action == HDA_GEN_PCM_ACT_OPEN)
+			pm_runtime_get_sync(dev);
+		guard(mutex)(&tas_hda->priv->codec_lock);
+		tasdevice_spi_tuning_switch(tas_hda->priv, 0);
+		if (action == HDA_GEN_PCM_ACT_CLOSE) {
+			pm_runtime_mark_last_busy(dev);
+			pm_runtime_put_autosuspend(dev);
+		}
+	} else {
+		dev_dbg(tas_hda->priv->dev,
+			"Playback action not supported: %d\n", action);
+	}
+}
+
+static int tasdevice_info_profile(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_info *uinfo)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = tas_priv->rcabin.ncfgs - 1;
+
+	return 0;
+}
+
+static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] = tas_priv->rcabin.profile_cfg_id;
+
+	return 0;
+}
+
+static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	int max = tas_priv->rcabin.ncfgs - 1;
+	int val;
+
+	val = clamp(ucontrol->value.integer.value[0], 0, max);
+	if (tas_priv->rcabin.profile_cfg_id != val) {
+		tas_priv->rcabin.profile_cfg_id = val;
+		return 1;
+	}
+
+	return 0;
+}
+
+static int tasdevice_info_programs(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_info *uinfo)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = tas_priv->fmw->nr_programs - 1;
+
+	return 0;
+}
+
+static int tasdevice_info_config(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_info *uinfo)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = tas_priv->fmw->nr_configurations - 1;
+
+	return 0;
+}
+
+static int tasdevice_program_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] = tas_priv->cur_prog;
+
+	return 0;
+}
+
+static int tasdevice_program_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	int nr_program = ucontrol->value.integer.value[0];
+	int max = tas_priv->fmw->nr_programs - 1;
+	int val;
+
+	val = clamp(nr_program, 0, max);
+
+	if (tas_priv->cur_prog != val) {
+		tas_priv->cur_prog = val;
+		return 1;
+	}
+
+	return 0;
+}
+
+static int tasdevice_config_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] = tas_priv->cur_conf;
+
+	return 0;
+}
+
+static int tasdevice_config_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	int max = tas_priv->fmw->nr_configurations - 1;
+	int val;
+
+	val = clamp(ucontrol->value.integer.value[0], 0, max);
+
+	if (tas_priv->cur_conf != val) {
+		tas_priv->cur_conf = val;
+		return 1;
+	}
+
+	return 0;
+}
+
+/*
+ * tas2781_digital_getvol - get the volum control
+ * @kcontrol: control pointer
+ * @ucontrol: User data
+ *
+ * Customer Kcontrol for tas2781 is primarily for regmap booking, paging
+ * depends on internal regmap mechanism.
+ * tas2781 contains book and page two-level register map, especially
+ * book switching will set the register BXXP00R7F, after switching to the
+ * correct book, then leverage the mechanism for paging to access the
+ * register.
+ *
+ * Return 0 if succeeded.
+ */
+static int tas2781_digital_getvol(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+
+	return tasdevice_spi_digital_getvol(tas_priv, ucontrol, mc);
+}
+
+static int tas2781_amp_getvol(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+
+	return tasdevice_spi_amp_getvol(tas_priv, ucontrol, mc);
+}
+
+static int tas2781_digital_putvol(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+
+	/* The check of the given value is in tasdevice_digital_putvol. */
+	return tasdevice_spi_digital_putvol(tas_priv, ucontrol, mc);
+}
+
+static int tas2781_amp_putvol(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+
+	/* The check of the given value is in tasdevice_amp_putvol. */
+	return tasdevice_spi_amp_putvol(tas_priv, ucontrol, mc);
+}
+
+static int tas2781_force_fwload_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] = (int)tas_priv->force_fwload_status;
+	dev_dbg(tas_priv->dev, "%s : Force FWload %s\n", __func__,
+		str_on_off(tas_priv->force_fwload_status));
+
+	return 0;
+}
+
+static int tas2781_force_fwload_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
+	bool change, val = (bool)ucontrol->value.integer.value[0];
+
+	if (tas_priv->force_fwload_status == val) {
+		change = false;
+	} else {
+		change = true;
+		tas_priv->force_fwload_status = val;
+	}
+	dev_dbg(tas_priv->dev, "%s : Force FWload %s\n", __func__,
+		str_on_off(tas_priv->force_fwload_status));
+
+	return change;
+}
+
+static const struct snd_kcontrol_new tas2781_snd_controls[] = {
+	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain 0", TAS2781_AMP_LEVEL,
+		1, 0, 20, 0, tas2781_amp_getvol,
+		tas2781_amp_putvol, amp_vol_tlv),
+	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain 0", TAS2781_DVC_LVL,
+		0, 0, 200, 1, tas2781_digital_getvol,
+		tas2781_digital_putvol, dvc_tlv),
+	ACARD_SINGLE_BOOL_EXT("Speaker Force Firmware Load 0", 0,
+		tas2781_force_fwload_get, tas2781_force_fwload_put),
+	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain 1", TAS2781_AMP_LEVEL,
+		1, 0, 20, 0, tas2781_amp_getvol,
+		tas2781_amp_putvol, amp_vol_tlv),
+	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain 1", TAS2781_DVC_LVL,
+		0, 0, 200, 1, tas2781_digital_getvol,
+		tas2781_digital_putvol, dvc_tlv),
+	ACARD_SINGLE_BOOL_EXT("Speaker Force Firmware Load 1", 0,
+		tas2781_force_fwload_get, tas2781_force_fwload_put),
+};
+
+static const struct snd_kcontrol_new tas2781_prof_ctrl[] = {
+{
+	.name = "Speaker Profile Id - 0",
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.info = tasdevice_info_profile,
+	.get = tasdevice_get_profile_id,
+	.put = tasdevice_set_profile_id,
+},
+{
+	.name = "Speaker Profile Id - 1",
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.info = tasdevice_info_profile,
+	.get = tasdevice_get_profile_id,
+	.put = tasdevice_set_profile_id,
+},
+};
+static const struct snd_kcontrol_new tas2781_dsp_prog_ctrl[] = {
+{
+	.name = "Speaker Program Id 0",
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.info = tasdevice_info_programs,
+	.get = tasdevice_program_get,
+	.put = tasdevice_program_put,
+},
+{
+	.name = "Speaker Program Id 1",
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.info = tasdevice_info_programs,
+	.get = tasdevice_program_get,
+	.put = tasdevice_program_put,
+},
+};
+
+static const struct snd_kcontrol_new tas2781_dsp_conf_ctrl[] = {
+{
+	.name = "Speaker Config Id 0",
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.info = tasdevice_info_config,
+	.get = tasdevice_config_get,
+	.put = tasdevice_config_put,
+},
+{
+	.name = "Speaker Config Id 1",
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.info = tasdevice_info_config,
+	.get = tasdevice_config_get,
+	.put = tasdevice_config_put,
+},
+};
+
+static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
+{
+	static const unsigned int cali_array[CALIB_MAX] = {
+		TASDEVICE_REG(0, 0x17, 0x74),
+		TASDEVICE_REG(0, 0x18, 0x0c),
+		TASDEVICE_REG(0, 0x18, 0x14),
+		TASDEVICE_REG(0, 0x13, 0x70),
+		TASDEVICE_REG(0, 0x18, 0x7c),
+	};
+	int j, rc;
+
+	/*
+	 * If no calibration data exist in tasdevice_priv *tas_priv,
+	 * calibration apply will be ignored, and use default values
+	 * in firmware binary, which was loaded during firmware download.
+	 */
+	if (tas_priv->calibration_data[0] == 0)
+		return;
+	/*
+	 * Calibration data was saved in tasdevice_priv *tas_priv as:
+	 * unsigned int calibration_data[CALIB_MAX];
+	 * and every data (in 4 bytes) will be saved in register which in
+	 * book 0, and page number in page_array[], offset was saved in
+	 * rgno_array[].
+	 */
+	for (j = 0; j < CALIB_MAX; j++) {
+		rc = tasdevice_spi_dev_bulk_write(tas_priv, cali_array[j],
+			(unsigned char *)&tas_priv->calibration_data[j], 4);
+		if (rc < 0)
+			dev_err(tas_priv->dev,
+				"chn %d calib %d bulk_wr err = %d\n",
+				tas_priv->index, j, rc);
+	}
+}
+
+/*
+ * Update the calibration data, including speaker impedance, f0, etc,
+ * into algo. Calibrate data is done by manufacturer in the factory.
+ * These data are used by Algo for calculating the speaker temperature,
+ * speaker membrane excursion and f0 in real time during playback.
+ * Calibration data format in EFI is V2, since 2024.
+ */
+static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
+{
+	/*
+	 * GUID was used for data access in BIOS, it was provided by board
+	 * manufactory, like HP: "{02f9af02-7734-4233-b43d-93fe5aa35db3}"
+	 */
+	efi_guid_t efi_guid =
+		EFI_GUID(0x02f9af02, 0x7734, 0x4233,
+			 0xb4, 0x3d, 0x93, 0xfe, 0x5a, 0xa3, 0x5d, 0xb3);
+	static efi_char16_t efi_name[] = TASDEVICE_CALIBRATION_DATA_NAME;
+	unsigned char data[TASDEVICE_CALIBRATION_DATA_SIZE];
+	struct tm *tm = &tas_priv->tm;
+	unsigned long total_sz = 0;
+	unsigned int attr, crc;
+	unsigned int *tmp_val;
+	efi_status_t status;
+
+	tas_priv->calibration_data[0] = 0;
+	status = efi.get_variable(efi_name, &efi_guid, &attr, &total_sz,
+		data);
+	if (status == EFI_BUFFER_TOO_SMALL) {
+		if (total_sz > TASDEVICE_CALIBRATION_DATA_SIZE)
+			return -ENOMEM;
+		/* Get variable contents into buffer */
+		status = efi.get_variable(efi_name, &efi_guid, &attr,
+			&total_sz, data);
+	}
+	if (status != EFI_SUCCESS)
+		return -EINVAL;
+
+	tmp_val = (unsigned int *)data;
+	if (tmp_val[0] == 2781) {
+		/*
+		 * New features were added in calibrated Data V2:
+		 *     1. Added some the fields to store the link_id and
+		 *     uniqie_id for multi-link solutions
+		 *     2. Support flexible number of devices instead of
+		 *     fixed one in V1.
+		 * Layout of calibrated data V2 in UEFI(total 256 bytes):
+		 *     ChipID (2781, 4 bytes)
+		 *     Device-Sum (4 bytes)
+		 *     TimeStamp of Calibration (4 bytes)
+		 *     for (i = 0; i < Device-Sum; i++) {
+		 *             Device #i index_info () {
+		 *                     SDW link id (2bytes)
+		 *                     SDW unique_id (2bytes)
+		 *             }
+		 *             Calibrated Data of Device #i (20 bytes)
+		 *     }
+		 *     CRC (4 bytes)
+		 *     Reserved (the rest)
+		 */
+		crc = crc32(~0, data, 3 + tmp_val[0] * 6) ^ ~0;
+		dev_dbg(tas_priv->dev, "cali crc 0x%08x PK tmp_val 0x%08x\n",
+			crc, tmp_val[3 + tmp_val[0] * 6]);
+
+		if (crc == tmp_val[3 + tmp_val[0] * 6]) {
+			time64_to_tm(tmp_val[2], 0, tm);
+			dev_dbg(tas_priv->dev, "Calibration date %pt.\n", tm);
+			for (int i = 0; i < CALIB_MAX; i++)
+				tas_priv->calibration_data[i] =
+					tmp_val[3 + tas_priv->index * 6 + i];
+			tas_priv->apply_calibration(tas_priv);
+		}
+	} else {
+		/*
+		 * Calibration data is in V1 format.
+		 * struct cali_data {
+		 *      char cali_data[20];
+		 * }
+		 *
+		 * struct {
+		 *      struct cali_data cali_data[4];
+		 *      int  TimeStamp of Calibration (4 bytes)
+		 *      int CRC (4 bytes)
+		 * } ueft;
+		 */
+		crc = crc32(~0, data, 84) ^ ~0;
+		dev_dbg(tas_priv->dev, "cali crc 0x%08x PK tmp_val 0x%08x\n",
+			crc, tmp_val[21]);
+
+		if (crc == tmp_val[21]) {
+			time64_to_tm(tmp_val[20], 0, tm);
+			dev_dbg(tas_priv->dev, "Calibration date %pt.\n", tm);
+			for (int i = 0; i < CALIB_MAX; i++)
+				tas_priv->calibration_data[i] =
+					tmp_val[tas_priv->index * 5 + i];
+			tas_priv->apply_calibration(tas_priv);
+		}
+	}
+
+	return 0;
+}
+
+static void tas2781_hda_remove_controls(struct tas2781_hda *tas_hda)
+{
+	struct hda_codec *codec = tas_hda->priv->codec;
+
+	if (tas_hda->dsp_prog_ctl)
+		snd_ctl_remove(codec->card, tas_hda->dsp_prog_ctl);
+
+	if (tas_hda->dsp_conf_ctl)
+		snd_ctl_remove(codec->card, tas_hda->dsp_conf_ctl);
+
+	for (int i = ARRAY_SIZE(tas_hda->snd_ctls) - 1; i >= 0; i--)
+		if (tas_hda->snd_ctls[i])
+			snd_ctl_remove(codec->card, tas_hda->snd_ctls[i]);
+
+	if (tas_hda->prof_ctl)
+		snd_ctl_remove(codec->card, tas_hda->prof_ctl);
+}
+
+static void tasdev_fw_ready(const struct firmware *fmw, void *context)
+{
+	struct tasdevice_priv *tas_priv = context;
+	struct tas2781_hda *tas_hda = dev_get_drvdata(tas_priv->dev);
+	struct hda_codec *codec = tas_priv->codec;
+	int i, j, ret;
+
+	pm_runtime_get_sync(tas_priv->dev);
+	guard(mutex)(&tas_priv->codec_lock);
+
+	ret = tasdevice_spi_rca_parser(tas_priv, fmw);
+	if (ret)
+		goto out;
+
+	/* Add control one time only. */
+	tas_hda->prof_ctl = snd_ctl_new1(&tas2781_prof_ctrl[tas_priv->index],
+		tas_priv);
+	ret = snd_ctl_add(codec->card, tas_hda->prof_ctl);
+	if (ret) {
+		dev_err(tas_priv->dev, "Failed to add KControl %s = %d\n",
+			tas2781_prof_ctrl[tas_priv->index].name, ret);
+		goto out;
+	}
+	j = tas_priv->index * 3;
+	for (i = 0; i < ARRAY_SIZE(tas2781_snd_controls)/2; i++) {
+		tas_hda->snd_ctls[i] =
+			snd_ctl_new1(&tas2781_snd_controls[i + j], tas_priv);
+		ret = snd_ctl_add(codec->card, tas_hda->snd_ctls[i]);
+		if (ret) {
+			dev_err(tas_priv->dev,
+				"Failed to add snd control %s = %d\n",
+				tas2781_snd_controls[i + j].name, ret);
+			goto out;
+		}
+	}
+
+	tasdevice_spi_dsp_remove(tas_priv);
+
+	tas_priv->fw_state = TASDEVICE_DSP_FW_PENDING;
+	scnprintf(tas_priv->coef_binaryname, 64, "TAS2XXX%08X-%01d.bin",
+		codec->core.subsystem_id, tas_priv->index);
+	ret = tasdevice_spi_dsp_parser(tas_priv);
+	if (ret) {
+		dev_err(tas_priv->dev, "dspfw load %s error\n",
+			tas_priv->coef_binaryname);
+		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
+		goto out;
+	}
+
+	/* Add control one time only. */
+	tas_hda->dsp_prog_ctl =
+		snd_ctl_new1(&tas2781_dsp_prog_ctrl[tas_priv->index],
+			tas_priv);
+	ret = snd_ctl_add(codec->card, tas_hda->dsp_prog_ctl);
+	if (ret) {
+		dev_err(tas_priv->dev,
+			"Failed to add KControl %s = %d\n",
+			tas2781_dsp_prog_ctrl[tas_priv->index].name, ret);
+		goto out;
+	}
+
+	t
