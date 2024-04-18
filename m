Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F768A9F68
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 18:00:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E452DEDB;
	Thu, 18 Apr 2024 18:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E452DEDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713456058;
	bh=JFGM6C4Eytt2MX9XDuY6MRHPnAVaXFAkPCU8eQk2e3U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KIYFg4HPFcpM/o604k+DWTOllbS9hohFXEFIRCLUiecI4QhC6wlbk3zt1YN1dhwLQ
	 zrdNDIstor0eFMkvu/RhzU94JBYAiOa2M7lcY8h3xPGZf3lnxogTjslKjKgXG4TMXe
	 /q8npytFUGwDkOs+zmk5VZv64Bbdt/cX9H6w4PjM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09EC4F8981E; Thu, 18 Apr 2024 17:53:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2209DF8981A;
	Thu, 18 Apr 2024 17:53:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B29FEF80423; Thu, 18 Apr 2024 06:04:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F390F80124
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 06:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F390F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=DUM7aL+v
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43I43TCk128742;
	Wed, 17 Apr 2024 23:03:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713413009;
	bh=yBEdHEQtmE2mTguI4Uf86VpeX1ZAHlTtkRrjDBx/zB0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DUM7aL+v0Y9b2Gw+dxq/EGP9d7fGzpak740k/6vGXxubiP4RGHE8LxrG88VfEXJU5
	 /RY9CXLJaJggCEA/qkgz4xH+RqMmAfaaxydALd3R/XDEVPyvEHG1h1wdIh5V8ve+/a
	 pEbkv7swjoX+REYLEUP5Adjop2KV7n+SdvPcTtzE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43I43Trn125991
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Apr 2024 23:03:29 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Apr 2024 23:03:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Apr 2024 23:03:29 -0500
Received: from lelvsmtp6.itg.ti.com ([10.250.165.138])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43I439im070557;
	Wed, 17 Apr 2024 23:03:22 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <robh+dt@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <lgirdwood@gmail.com>, <perex@perex.cz>,
        <pierre-louis.bossart@linux.intel.com>, <kevin-lu@ti.com>,
        <shenghao-ding@ti.com>, <navada@ti.com>, <13916275206@139.com>,
        <v-po@ti.com>, <niranjan.hy@ti.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <liam.r.girdwood@intel.com>,
        <yung-chuan.liao@linux.intel.com>, <baojun.xu@ti.com>,
        <broonie@kernel.org>, <soyer@irl.hu>
Subject: [PATCH v3 2/3] ALSA: hda/tas2781: Main code of tas2781 driver for SPI
Date: Thu, 18 Apr 2024 12:02:38 +0800
Message-ID: <20240418040240.2337-3-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20240418040240.2337-1-baojun.xu@ti.com>
References: <20240418040240.2337-1-baojun.xu@ti.com>
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
Message-ID-Hash: ZWFZY43XBVTDRAFMYUAAWX76WTYFHI6Y
X-Message-ID-Hash: ZWFZY43XBVTDRAFMYUAAWX76WTYFHI6Y
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:52:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZWFZY43XBVTDRAFMYUAAWX76WTYFHI6Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Main source code for tas2781 driver for SPI.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

---
v3:
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
---
 sound/pci/hda/tas2781-spi.h     |  165 ++++
 sound/pci/hda/tas2781_hda_spi.c | 1305 +++++++++++++++++++++++++++++++
 2 files changed, 1470 insertions(+)
 create mode 100644 sound/pci/hda/tas2781-spi.h
 create mode 100644 sound/pci/hda/tas2781_hda_spi.c

diff --git a/sound/pci/hda/tas2781-spi.h b/sound/pci/hda/tas2781-spi.h
new file mode 100644
index 000000000000..cf258bf30ad2
--- /dev/null
+++ b/sound/pci/hda/tas2781-spi.h
@@ -0,0 +1,165 @@
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
+#include <sound/tas2781-dsp.h>
+
+#define TASDEVICE_RATES			\
+	(SNDRV_PCM_RATE_44100 |	SNDRV_PCM_RATE_48000 | \
+	SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_88200)
+
+#define TASDEVICE_FORMATS		\
+	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
+	SNDRV_PCM_FMTBIT_S32_LE)
+
+/*PAGE Control Register (available in page0 of each book) */
+#define TASDEVICE_PAGE_SELECT		0x00
+#define TASDEVICE_BOOKCTL_PAGE		0x00
+#define TASDEVICE_BOOKCTL_REG		127
+#define TASDEVICE_BOOK_ID(reg)		(reg / (256 * 128))
+#define TASDEVICE_PAGE_ID(reg)		((reg % (256 * 128)) / 128)
+#define TASDEVICE_PAGE_REG(reg)		((reg % (256 * 128)) % 128)
+#define TASDEVICE_PGRG(reg)		(reg % (256 * 128))
+#define TASDEVICE_REG(book, page, reg)	(((book * 256 * 128) + \
+					(page * 128)) + reg)
+
+#define TASDEVICE_MAX_BOOK_NUM		256
+#define TASDEVICE_MAX_PAGE		128
+
+/*Software Reset */
+#define TAS2781_REG_SWRESET		TASDEVICE_REG(0x0, 0X0, 0x01)
+#define TAS2781_REG_SWRESET_RESET	BIT(0)
+
+/*I2C Checksum */
+#define TASDEVICE_Checksum		TASDEVICE_REG(0x0, 0x0, 0x7E)
+
+/* Volume control */
+#define TAS2781_DVC_LVL			TASDEVICE_REG(0x0, 0x0, 0x1A)
+#define TAS2781_AMP_LEVEL		TASDEVICE_REG(0x0, 0x0, 0x03)
+#define TAS2781_AMP_LEVEL_MASK		GENMASK(5, 1)
+
+#define TASDEVICE_CMD_SING_W		0x1
+#define TASDEVICE_CMD_BURST		0x2
+#define TASDEVICE_CMD_DELAY		0x3
+#define TASDEVICE_CMD_FIELD_W		0x4
+
+#define TAS2781_SPI_MAX_FREQ		4000000
+
+#define TASDEVICE_CRC8_POLYNOMIAL		0x4d
+#define TASDEVICE_SPEAKER_CALIBRATION_SIZE	20
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
+struct tasdevice {
+	struct tasdevice_fw *cali_data_fmw;
+	unsigned int dev_addr;
+	unsigned int err_code;
+	unsigned char cur_book;
+	short cur_prog;
+	short cur_conf;
+	bool is_loading;
+	bool is_loaderr;
+};
+
+struct tasdevice_irqinfo {
+	int irq_gpio;
+	int irq;
+};
+
+struct tasdevice_priv {
+	struct tasdevice tasdevice;
+	struct tasdevice_irqinfo irq_info;
+	struct tasdevice_rca rcabin;
+	struct tasdevice_fw *fmw;
+	struct gpio_desc *reset;
+	struct gpio_desc *chipselect;
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
+	unsigned int magic_num;
+	unsigned int chip_id;
+	unsigned int sysclk;
+
+	int cur_prog;
+	int cur_conf;
+	int fw_state;
+	int index;
+	void *client;
+	void *codec;
+	bool force_fwload_status;
+	bool playback_started;
+	unsigned int global_addr;
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
+int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
+	struct module *module,
+	void (*cont)(const struct firmware *fw, void *context));
+void tasdevice_remove(struct tasdevice_priv *tas_priv);
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
index 000000000000..a25db61e055e
--- /dev/null
+++ b/sound/pci/hda/tas2781_hda_spi.c
@@ -0,0 +1,1305 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// TAS2781 HDA SPI driver
+//
+// Copyright 2024 Texas Instruments, Inc.
+//
+// Author: Baojun Xu <baojun.xu@ti.com>
+
+#include <linux/acpi.h>
+#include <linux/bits.h>
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
+
+#include <sound/hda_codec.h>
+#include <sound/soc.h>
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
+	struct gpio_desc *reset_gpio;
+	struct tasdevice_priv *priv;
+	struct gpio_desc *cs_gpio;
+	struct acpi_device *dacpi;
+	struct device *dev;
+	struct snd_kcontrol *dsp_prog_ctl;
+	struct snd_kcontrol *dsp_conf_ctl;
+	struct snd_kcontrol *snd_ctls[3];
+	struct snd_kcontrol *prof_ctl;
+};
+
+static const struct regmap_range_cfg tasdevice_ranges[] = {
+	{
+		.range_min = 0,
+		.range_max = TASDEVICE_MAX_BOOK_NUM * TASDEVICE_MAX_PAGE,
+		.selector_reg = TASDEVICE_PAGE_SELECT,
+		.selector_mask = 0xff,
+		.selector_shift = 0,
+		.window_start = 0,
+		.window_len = 128,
+	},
+};
+
+static const struct regmap_config tasdevice_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.cache_type = REGCACHE_NONE,
+	.ranges = tasdevice_ranges,
+	.num_ranges = ARRAY_SIZE(tasdevice_ranges),
+	.max_register = TASDEVICE_MAX_BOOK_NUM * TASDEVICE_MAX_PAGE,
+};
+
+static int tasdevice_spi_switch_book(struct tasdevice_priv *tas_priv, int book)
+{
+	struct tasdevice *tasdev = &tas_priv->tasdevice;
+	struct regmap *map = tas_priv->regmap;
+	int ret = 0;
+
+	if (tasdev->cur_book != book) {
+		/* Change to page 0 before book change. */
+		ret = regmap_write(map, TASDEVICE_PAGE_SELECT, 0);
+		if (ret < 0) {
+			dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+			return ret;
+		}
+		ret = regmap_write(map, TASDEVICE_BOOKCTL_REG, book);
+		if (ret < 0) {
+			dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+			return ret;
+		}
+		tasdev->cur_book = book;
+	}
+
+	return ret;
+}
+
+int tasdevice_spi_dev_read(struct tasdevice_priv *tas_priv,
+	unsigned int reg, unsigned int *val)
+{
+	struct regmap *map = tas_priv->regmap;
+	int ret;
+
+	ret = tasdevice_spi_switch_book(tas_priv, TASDEVICE_BOOK_ID(reg));
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * In our TAS2781 SPI mode, if read from other book (not book 0),
+	 * or read from page number larger than 1 in book 0, one byte more
+	 * read is needed, and first byte is a dummy byte, need to be ignored.
+	 */
+	if ((TASDEVICE_BOOK_ID(reg) > 0) || (TASDEVICE_PAGE_ID(reg) > 1)) {
+		unsigned char data[2];
+
+		ret = regmap_bulk_read(map, TASDEVICE_PGRG(reg), data,
+			sizeof(data));
+		*val = data[1];
+	} else {
+		ret = regmap_read(map, TASDEVICE_PGRG(reg), val);
+	}
+	if (ret < 0)
+		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
+
+	return ret;
+}
+
+int tasdevice_spi_dev_write(struct tasdevice_priv *tas_priv,
+	unsigned int reg, unsigned int value)
+{
+	struct regmap *map = tas_priv->regmap;
+	int ret;
+
+	ret = tasdevice_spi_switch_book(tas_priv, TASDEVICE_BOOK_ID(reg));
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(map, TASDEVICE_PGRG(reg), value);
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
+	ret = tasdevice_spi_switch_book(tas_priv, TASDEVICE_BOOK_ID(reg));
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_bulk_write(map, TASDEVICE_PGRG(reg), data, len);
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
+	ret = tasdevice_spi_switch_book(tas_priv, TASDEVICE_BOOK_ID(reg));
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * In our TAS2781 SPI mode, if read from other book (not book 0),
+	 * or read from page number larger than 1 in book 0, one byte more
+	 * read is needed, and first byte is a dummy byte, need to be ignored.
+	 */
+	if ((TASDEVICE_BOOK_ID(reg) > 0) || (TASDEVICE_PAGE_ID(reg) > 1)) {
+		unsigned char buf[129];
+
+		ret = regmap_bulk_read(map, TASDEVICE_PGRG(reg),
+			buf, len + 1);
+		memcpy(data, buf + 1, len);
+	} else {
+		ret = regmap_bulk_read(map, TASDEVICE_PGRG(reg), data, len);
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
+	int ret;
+
+	ret = tasdevice_spi_switch_book(tas_priv, TASDEVICE_BOOK_ID(reg));
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_update_bits(map, TASDEVICE_PGRG(reg), mask, value);
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
+		usleep_range(500, 1000);
+		gpiod_set_value_cansleep(tas_dev->reset, 1);
+	} else {
+		ret = tasdevice_spi_dev_write(tas_dev,
+			TAS2781_REG_SWRESET, TAS2781_REG_SWRESET_RESET);
+		if (ret < 0)
+			dev_err(tas_dev->dev, "dev sw-reset fail, %d\n", ret);
+	}
+	usleep_range(1000, 1050);
+}
+
+static int tascodec_spi_init(struct tasdevice_priv *tas_priv, void *codec,
+	struct module *module,
+	void (*cont)(const struct firmware *fw, void *context))
+{
+	int ret = 0;
+
+	/*
+	 * Codec Lock Hold to ensure that codec_probe and firmware parsing and
+	 * loading do not simultaneously execute.
+	 */
+	mutex_lock(&tas_priv->codec_lock);
+
+	scnprintf(tas_priv->rca_binaryname, 64, "%sRCA%d.bin",
+		tas_priv->dev_name, tas_priv->index);
+	crc8_populate_msb(tas_priv->crc8_lkp_tbl, TASDEVICE_CRC8_POLYNOMIAL);
+	tas_priv->codec = codec;
+	ret = request_firmware_nowait(module, FW_ACTION_UEVENT,
+		tas_priv->rca_binaryname, tas_priv->dev, GFP_KERNEL, tas_priv,
+		cont);
+	if (ret)
+		dev_err(tas_priv->dev, "request_firmware_nowait err:0x%08x\n",
+			ret);
+
+	/* Codec Lock Release*/
+	mutex_unlock(&tas_priv->codec_lock);
+
+	return ret;
+}
+
+static int tasdevice_spi_init(struct tasdevice_priv *tas_priv)
+{
+	tas_priv->cur_prog = -1;
+	tas_priv->cur_conf = -1;
+
+	tas_priv->tasdevice.cur_book = -1;
+	tas_priv->tasdevice.cur_prog = -1;
+	tas_priv->tasdevice.cur_conf = -1;
+
+	mutex_init(&tas_priv->codec_lock);
+
+	return 0;
+}
+
+static int tasdevice_clamp(int val, int max, unsigned int invert)
+{
+	if (val > max)
+		val = max;
+	if (invert)
+		val = max - val;
+	if (val < 0)
+		val = 0;
+
+	return val;
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
+	mask = (1 << fls(max)) - 1;
+	mask <<= mc->shift;
+	val = tasdevice_clamp(ucontrol->value.integer.value[0], max, invert);
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
+	mask = (1 << fls(max)) - 1;
+	mask <<= mc->shift;
+	val = (val & mask) >> mc->shift;
+	val = tasdevice_clamp(val, max, invert);
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
+	val = tasdevice_clamp(ucontrol->value.integer.value[0], max, invert);
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
+	val = tasdevice_clamp(val, max, invert);
+	ucontrol->value.integer.value[0] = val;
+
+	return ret;
+}
+
+static int tas2781_read_acpi(struct tas2781_hda *tas_hda, const char *hid,
+	int id)
+{
+	struct tasdevice_priv *p = tas_hda->priv;
+	struct gpio_desc *cs_gpiod;
+	struct acpi_device *adev;
+	struct device *physdev;
+	struct spi_device *spi;
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
+	/* No side-effect to the playback even if subsystem_id is NULL*/
+	p->acpi_subsystem_id = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
+
+	property = "ti,dev-index";
+	ret = device_property_count_u32(physdev, property);
+	if (ret <= 0)
+		goto err;
+
+	if (ret > ARRAY_SIZE(values)) {
+		ret = -EINVAL;
+		goto err;
+	}
+	nval = ret;
+
+	ret = device_property_read_u32_array(physdev, property, values, nval);
+	if (ret)
+		goto err;
+
+	p->index = 0xFF;
+	for (i = 0; i < nval; i++) {
+		if (values[i] == id) {
+			p->index = i;
+			break;
+		}
+	}
+	if (p->index == 0xFF) {
+		dev_dbg(p->dev, "No index found in %s\n", property);
+		ret = -ENODEV;
+		goto err;
+	}
+
+	p->reset = devm_gpiod_get_index_optional(physdev,
+		"reset", p->index, GPIOD_OUT_LOW);
+	if (IS_ERR(p->reset)) {
+		ret = PTR_ERR(p->reset);
+
+		/*
+		 * If RESET is shared the first amp to probe will grab the
+		 * reset line and reset all the amps
+		 */
+		if (ret != -EBUSY) {
+			dev_err_probe(p->dev, ret,
+				"Failed to get reset GPIO\n");
+			goto err;
+		}
+		dev_info(p->dev, "Reset GPIO busy, assume shared reset\n");
+		p->reset = NULL;
+	}
+
+	/*
+	 * Manually set the Chip Select for the second amp <cs_gpio_index>
+	 * in the node.
+	 * This is only supported for systems with 2 amps, since we cannot
+	 * expand the default number of chip selects without using cs-gpios
+	 * The CS GPIO must be set high prior to communicating with the
+	 * first amp (which uses a native chip select), to ensure the second
+	 * amp does not clash with the first.
+	 */
+	if (IS_ENABLED(CONFIG_SPI)) {
+		spi = to_spi_device(p->dev);
+
+		/*
+		 * This is obtained using driver_gpios, since only one GPIO
+		 * for CS exists, this can be obtained using index 0.
+		 */
+		cs_gpiod = devm_gpiod_get_index_optional(physdev, "cs",
+			p->index, GPIOD_OUT_LOW);
+		if (IS_ERR(cs_gpiod)) {
+			dev_err(p->dev, "Unable to get CS GPIO descriptor\n");
+			ret = PTR_ERR(cs_gpiod);
+			goto err;
+		}
+		if (id == 1) {
+			spi_set_csgpiod(spi, 0, cs_gpiod);
+			p->chipselect = cs_gpiod;
+		} else {
+			gpiod_set_value_cansleep(cs_gpiod, true);
+			gpiod_put(cs_gpiod);
+		}
+		spi_setup(spi);
+	}
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
+	switch (action) {
+	case HDA_GEN_PCM_ACT_OPEN:
+		pm_runtime_get_sync(dev);
+		mutex_lock(&tas_hda->priv->codec_lock);
+		tasdevice_spi_tuning_switch(tas_hda->priv, 0);
+		mutex_unlock(&tas_hda->priv->codec_lock);
+		break;
+	case HDA_GEN_PCM_ACT_CLOSE:
+		mutex_lock(&tas_hda->priv->codec_lock);
+		tasdevice_spi_tuning_switch(tas_hda->priv, 1);
+		mutex_unlock(&tas_hda->priv->codec_lock);
+
+		pm_runtime_mark_last_busy(dev);
+		pm_runtime_put_autosuspend(dev);
+		break;
+	default:
+		dev_dbg(tas_hda->dev, "Playback action not supported: %d\n",
+			action);
+		break;
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
+	int val, ret = 0;
+
+	val = clamp(ucontrol->value.integer.value[0], 0, max);
+
+	if (tas_priv->rcabin.profile_cfg_id != val) {
+		tas_priv->rcabin.profile_cfg_id = val;
+		ret = 1;
+	}
+
+	return ret;
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
+	int val, ret = 0;
+
+	val = clamp(nr_program, 0, max);
+
+	if (tas_priv->cur_prog != val) {
+		tas_priv->cur_prog = val;
+		ret = 1;
+	}
+
+	return ret;
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
+	int val, ret = 0;
+
+	val = clamp(ucontrol->value.integer.value[0], 0, max);
+
+	if (tas_priv->cur_conf != val) {
+		tas_priv->cur_conf = val;
+		ret = 1;
+	}
+
+	return ret;
+}
+
+/*
+ * tas2781_digital_getvol - get the volum control
+ * @kcontrol: control pointer
+ * @ucontrol: User data
+ * Customer Kcontrol for tas2781 is primarily for regmap booking, paging
+ * depends on internal regmap mechanism.
+ * tas2781 contains book and page two-level register map, especially
+ * book switching will set the register BXXP00R7F, after switching to the
+ * correct book, then leverage the mechanism for paging to access the
+ * register.
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
+		tas_priv->force_fwload_status ? "ON" : "OFF");
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
+		tas_priv->force_fwload_status ? "ON" : "OFF");
+
+	return change;
+}
+
+static const struct snd_kcontrol_new tas2781_snd_controls[] = {
+	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain", TAS2781_AMP_LEVEL,
+		1, 0, 20, 0, tas2781_amp_getvol,
+		tas2781_amp_putvol, amp_vol_tlv),
+	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain", TAS2781_DVC_LVL,
+		0, 0, 200, 1, tas2781_digital_getvol,
+		tas2781_digital_putvol, dvc_tlv),
+	ACARD_SINGLE_BOOL_EXT("Speaker Force Firmware Load", 0,
+		tas2781_force_fwload_get, tas2781_force_fwload_put),
+};
+
+static const struct snd_kcontrol_new tas2781_prof_ctrl = {
+	.name = "Speaker Profile Id",
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.info = tasdevice_info_profile,
+	.get = tasdevice_get_profile_id,
+	.put = tasdevice_set_profile_id,
+};
+
+static const struct snd_kcontrol_new tas2781_dsp_prog_ctrl = {
+	.name = "Speaker Program Id",
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.info = tasdevice_info_programs,
+	.get = tasdevice_program_get,
+	.put = tasdevice_program_put,
+};
+
+static const struct snd_kcontrol_new tas2781_dsp_conf_ctrl = {
+	.name = "Speaker Config Id",
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.info = tasdevice_info_config,
+	.get = tasdevice_config_get,
+	.put = tasdevice_config_put,
+};
+
+static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
+{
+	static const unsigned char page_array[CALIB_MAX] = {
+		0x17, 0x18, 0x18, 0x13, 0x18,
+	};
+	static const unsigned char rgno_array[CALIB_MAX] = {
+		0x74, 0x0c, 0x14, 0x70, 0x7c,
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
+	 * book 0,and page number in page_array[], offset was saved in
+	 * rgno_array[].
+	 */
+	for (j = 0; j < CALIB_MAX; j++) {
+		rc = tasdevice_spi_dev_bulk_write(tas_priv,
+			TASDEVICE_REG(0, page_array[j], rgno_array[j]),
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
+	efi_guid_t efi_guid = EFI_GUID(0x02f9af02, 0x7734, 0x4233, 0xb4, 0x3d,
+		0x93, 0xfe, 0x5a, 0xa3, 0x5d, 0xb3);
+	static efi_char16_t efi_name[] = L"CALI_DATA";
+	struct tm *tm = &tas_priv->tm;
+	unsigned long total_sz = 0;
+	unsigned int attr, crc;
+	unsigned int *tmp_val;
+	efi_status_t status;
+	unsigned char *data;
+
+	tas_priv->calibration_data[0] = 0;
+	/* Get real size of UEFI variable */
+	status = efi.get_variable(efi_name, &efi_guid, &attr, &total_sz,
+		tas_priv->calibration_data);
+	if (status == EFI_BUFFER_TOO_SMALL) {
+		/* Allocate data buffer of data_size bytes */
+		data = devm_kzalloc(tas_priv->dev, total_sz, GFP_KERNEL);
+		if (!data)
+			return -ENOMEM;
+		/* Get variable contents into buffer */
+		status = efi.get_variable(efi_name, &efi_guid, &attr,
+			&total_sz, data);
+	}
+	if (status != EFI_SUCCESS) {
+		kfree(data);
+		return -EINVAL;
+	}
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
+		 *     ChipID (2783, 4 bytes)
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
+		if (crc == tmp_val[3+tmp_val[0]*6]) {
+			time64_to_tm(tmp_val[2], 0, tm);
+			dev_dbg(tas_priv->dev, "%4ld-%2d-%2d, %2d:%2d:%2d\n",
+				tm->tm_year, tm->tm_mon, tm->tm_mday,
+				tm->tm_hour, tm->tm_min, tm->tm_sec);
+			for (int i = 0; i < CALIB_MAX; i++)
+				tas_priv->calibration_data[i] =
+					tmp_val[3 + tas_priv->index * 6 + i];
+			tas_priv->apply_calibration(tas_priv);
+		} else {
+			total_sz = 0;
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
+			dev_dbg(tas_priv->dev, "%4ld-%2d-%2d, %2d:%2d:%2d\n",
+				tm->tm_year, tm->tm_mon, tm->tm_mday,
+				tm->tm_hour, tm->tm_min, tm->tm_sec);
+			for (int i = 0; i < CALIB_MAX; i++)
+				tas_priv->calibration_data[i] =
+					tmp_val[tas_priv->index * 5 + i];
+			tas_priv->apply_calibration(tas_priv);
+		}
+	}
+	kfree(data);
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
+	int i, ret;
+
+	pm_runtime_get_sync(tas_priv->dev);
+	mutex_lock(&tas_priv->codec_lock);
+
+	ret = tasdevice_spi_rca_parser(tas_priv, fmw);
+	if (ret)
+		goto out;
+
+	/* Add control one time only. */
+	if (tas_priv->index == 0) {
+		tas_hda->prof_ctl = snd_ctl_new1(&tas2781_prof_ctrl, tas_priv);
+		ret = snd_ctl_add(codec->card, tas_hda->prof_ctl);
+		if (ret) {
+			dev_err(tas_priv->dev,
+				"Failed to add KControl %s = %d\n",
+				tas2781_prof_ctrl.name, ret);
+			goto out;
+		}
+
+		for (i = 0; i < ARRAY_SIZE(tas2781_snd_controls); i++) {
+			tas_hda->snd_ctls[i] =
+				snd_ctl_new1(&tas2781_snd_controls[i],
+				tas_priv);
+			ret = snd_ctl_add(codec->card, tas_hda->snd_ctls[i]);
+			if (ret) {
+				dev_err(tas_priv->dev,
+					"Failed to add KControl %s = %d\n",
+					tas2781_snd_controls[i].name, ret);
+				goto out;
+			}
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
+	if (tas_priv->index == 0) {
+		tas_hda->dsp_prog_ctl = snd_ctl_new1(&tas2781_dsp_prog_ctrl,
+			tas_priv);
+		ret = snd_ctl_add(codec->card, tas_hda->dsp_prog_ctl);
+		if (ret) {
+			dev_err(tas_priv->dev,
+				"Failed to add KControl %s = %d\n",
+				tas2781_dsp_prog_ctrl.name, ret);
+			goto out;
+		}
+
+		tas_hda->dsp_conf_ctl = snd_ctl_new1(&tas2781_dsp_conf_ctrl,
+			tas_priv);
+		ret = snd_ctl_add(codec->card, tas_hda->dsp_conf_ctl);
+		if (ret) {
+			dev_err(tas_priv->dev,
+				"Failed to add KControl %s = %d\n",
+				tas2781_dsp_conf_ctrl.name, ret);
+			goto out;
+		}
+	}
+
+	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
+	tasdevice_spi_prmg_load(tas_priv, 0);
+	if (tas_priv->fmw->nr_programs > 0)
+		tas_priv->cur_prog = 0;
+	if (tas_priv->fmw->nr_configurations > 0)
+		tas_priv->cur_conf = 0;
+
+	/*
+	 * If calibrated data occurs error, dsp will still works with default
+	 * calibrated data inside algo.
+	 */
+	tas_priv->save_calibration(tas_priv);
+
+	tasdevice_spi_tuning_switch(tas_hda->priv, 0);
+
+out:
+	mutex_unlock(&tas_hda->priv->codec_lock);
+	if (fmw)
+		release_firmware(fmw);
+	pm_runtime_mark_last_busy(tas_hda->dev);
+	pm_runtime_put_autosuspend(tas_hda->dev);
+}
+
+static int tas2781_hda_bind(struct device *dev, struct device *master,
+	void *master_data)
+{
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
+	struct hda_component *comps = master_data;
+	struct hda_codec *codec;
+	int ret;
+
+	if (!comps || tas_hda->priv->index < 0 ||
+		tas_hda->priv->index >= HDA_MAX_COMPONENTS)
+		return -EINVAL;
+
+	comps = &comps[tas_hda->priv->index];
+	if (comps->dev)
+		return -EBUSY;
+
+	codec = comps->codec;
+
+	pm_runtime_get_sync(dev);
+
+	comps->dev = dev;
+
+	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
+
+	ret = tascodec_spi_init(tas_hda->priv, codec, THIS_MODULE,
+		tasdev_fw_ready);
+	if (!ret)
+		comps->playback_hook = tas2781_hda_playback_hook;
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
+static void tas2781_hda_unbind(struct device *dev,
+	struct device *master, void *master_data)
+{
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
+	struct hda_component *comps = master_data;
+
+	comps = &comps[tas_hda->priv->index];
+
+	if (comps->dev == dev) {
+		comps->dev = NULL;
+		memset(comps->name, 0, sizeof(comps->name));
+		comps->playback_hook = NULL;
+	}
+
+	tas2781_hda_remove_controls(tas_hda);
+
+	tasdevice_spi_config_info_remove(tas_hda->priv);
+	tasdevice_spi_dsp_remove(tas_hda->priv);
+
+	tas_hda->priv->fw_state = TASDEVICE_DSP_FW_PENDING;
+}
+
+static const struct component_ops tas2781_hda_comp_ops = {
+	.bind = tas2781_hda_bind,
+	.unbind = tas2781_hda_unbind,
+};
+
+static void tas2781_hda_remove(struct device *dev)
+{
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
+
+	pm_runtime_get_sync(tas_hda->dev);
+	pm_runtime_disable(tas_hda->dev);
+
+	component_del(tas_hda->dev, &tas2781_hda_comp_ops);
+
+	pm_runtime_put_noidle(tas_hda->dev);
+
+	tasdevice_remove(tas_hda->priv);
+}
+
+static int tas2781_hda_spi_probe(struct spi_device *spi)
+{
+	struct tasdevice_priv *tas_priv;
+	struct tas2781_hda *tas_hda;
+	const char *device_name;
+	int ret = 0;
+
+	tas_hda = devm_kzalloc(&spi->dev, sizeof(*tas_hda), GFP_KERNEL);
+	if (!tas_hda)
+		return -ENOMEM;
+
+	tas_hda->dev = &spi->dev;
+	spi->max_speed_hz = TAS2781_SPI_MAX_FREQ;
+
+	tas_priv = devm_kzalloc(&spi->dev, sizeof(*tas_priv), GFP_KERNEL);
+	if (!tas_priv)
+		goto err;
+	tas_priv->regmap = devm_regmap_init_spi(spi, &tasdevice_regmap);
+	if (IS_ERR(tas_priv->regmap)) {
+		ret = PTR_ERR(tas_priv->regmap);
+		dev_err(tas_priv->dev, "Failed to allocate regmap: %d\n",
+			ret);
+		goto err;
+	}
+	tas_priv->dev = &spi->dev;
+	tas_priv->client = spi;
+	tas_hda->priv = tas_priv;
+
+	if (strstr(dev_name(&spi->dev), "TXNW2781")) {
+		device_name = "TXNW2781";
+		tas_priv->save_calibration = tas2781_save_calibration;
+		tas_priv->apply_calibration = tas2781_apply_calib;
+	} else
+		goto err;
+
+	tas_priv->irq_info.irq = spi->irq;
+	dev_set_drvdata(&spi->dev, tas_hda);
+	ret = tas2781_read_acpi(tas_hda, device_name,
+		spi_get_chipselect(spi, 0));
+	if (ret)
+		return dev_err_probe(tas_hda->dev, ret,
+			"Platform not supported\n");
+
+	ret = tasdevice_spi_init(tas_priv);
+	if (ret)
+		goto err;
+
+	pm_runtime_set_autosuspend_delay(tas_hda->dev, 3000);
+	pm_runtime_use_autosuspend(tas_hda->dev);
+	pm_runtime_mark_last_busy(tas_hda->dev);
+	pm_runtime_set_active(tas_hda->dev);
+	pm_runtime_get_noresume(tas_hda->dev);
+	pm_runtime_enable(tas_hda->dev);
+
+	pm_runtime_put_autosuspend(tas_hda->dev);
+
+	tas2781_spi_reset(tas_priv);
+
+	ret = component_add(tas_hda->dev, &tas2781_hda_comp_ops);
+	if (ret) {
+		dev_err(tas_hda->dev, "Register component failed: %d\n", ret);
+		pm_runtime_disable(tas_hda->dev);
+	}
+
+err:
+	if (ret)
+		tas2781_hda_remove(&spi->dev);
+	return ret;
+}
+
+static void tas2781_hda_spi_remove(struct spi_device *spi)
+{
+	tas2781_hda_remove(&spi->dev);
+}
+
+static int tas2781_runtime_suspend(struct device *dev)
+{
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
+
+	dev_dbg(tas_hda->dev, "Runtime Suspend\n");
+
+	mutex_lock(&tas_hda->priv->codec_lock);
+
+	if (tas_hda->priv->playback_started) {
+		tasdevice_spi_tuning_switch(tas_hda->priv, 1);
+		tas_hda->priv->playback_started = false;
+	}
+
+	tas_hda->priv->tasdevice.cur_book = -1;
+	tas_hda->priv->tasdevice.cur_prog = -1;
+	tas_hda->priv->tasdevice.cur_conf = -1;
+
+	mutex_unlock(&tas_hda->priv->codec_lock);
+
+	return 0;
+}
+
+static int tas2781_runtime_resume(struct device *dev)
+{
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
+
+	dev_dbg(tas_hda->dev, "Runtime Resume\n");
+
+	mutex_lock(&tas_hda->priv->codec_lock);
+
+	tasdevice_spi_prmg_load(tas_hda->priv, tas_hda->priv->cur_prog);
+
+	/*
+	 * If calibrated data occurs error, dsp will still works with default
+	 * calibrated data inside algo.
+	 */
+	tas_hda->priv->apply_calibration(tas_hda->priv);
+
+	mutex_unlock(&tas_hda->priv->codec_lock);
+
+	return 0;
+}
+
+static int tas2781_system_suspend(struct device *dev)
+{
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
+	int ret;
+
+	dev_dbg(tas_hda->priv->dev, "System Suspend\n");
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		return ret;
+
+	/* Shutdown chip before system suspend */
+	tasdevice_spi_tuning_switch(tas_hda->priv, 1);
+
+	/*
+	 * Reset GPIO may be shared, so cannot reset here.
+	 * However beyond this point, amps may be powered down.
+	 */
+	return 0;
+}
+
+static int tas2781_system_resume(struct device *dev)
+{
+	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	mutex_lock(&tas_hda->priv->codec_lock);
+
+	tas_hda->priv->tasdevice.cur_book = -1;
+	tas_hda->priv->tasdevice.cur_prog = -1;
+	tas_hda->priv->tasdevice.cur_conf = -1;
+
+	tas2781_spi_reset(tas_hda->priv);
+	tasdevice_spi_prmg_load(tas_hda->priv, tas_hda->priv->cur_prog);
+
+	/*
+	 * If calibrated data occurs error, dsp will still work with default
+	 * calibrated data inside algo.
+	 */
+	tas_hda->priv->apply_calibration(tas_hda->priv);
+	mutex_unlock(&tas_hda->priv->codec_lock);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tas2781_hda_pm_ops = {
+	RUNTIME_PM_OPS(tas2781_runtime_suspend, tas2781_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(tas2781_system_suspend, tas2781_system_resume)
+};
+
+static const struct spi_device_id tas2781_hda_spi_id[] = {
+	{ "tas2781-hda", 0 },
+	{}
+};
+
+static const struct acpi_device_id tas2781_acpi_hda_match[] = {
+	{"TXNW2781", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, tas2781_acpi_hda_match);
+
+static struct spi_driver tas2781_hda_spi_driver = {
+	.driver = {
+		.name		= "tas2781-hda",
+		.acpi_match_table = tas2781_acpi_hda_match,
+		.pm		= &tas2781_hda_pm_ops,
+	},
+	.id_table	= tas2781_hda_spi_id,
+	.probe		= tas2781_hda_spi_probe,
+	.remove		= tas2781_hda_spi_remove,
+};
+module_spi_driver(tas2781_hda_spi_driver);
+
+MODULE_DESCRIPTION("TAS2781 HDA SPI Driver");
+MODULE_AUTHOR("Baojun, Xu, <baojun.xug@ti.com>");
+MODULE_LICENSE("GPL");
-- 
2.40.1

