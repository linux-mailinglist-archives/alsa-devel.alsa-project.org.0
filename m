Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51315AC01D2
	for <lists+alsa-devel@lfdr.de>; Thu, 22 May 2025 03:44:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD6C6601EA;
	Thu, 22 May 2025 03:44:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD6C6601EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747878286;
	bh=h2ciSCUJX/LX1GlbSqmF+G8dX6D9bml0axuFESbOons=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Q9gALDX6A8/Egdd4qgM9/n2InXkrXZu37A6TyjAsPm4REvLQPExqpy+taxYHwwJfK
	 NJ3PqjIL+jBFzQ7XafaFudah7CEYDFG4Qdhvp3R7V2eh745l1uX3MTjvCJ/iKoVKUP
	 OELE651p7hgYBW5lm+84BDvONquC9m96Hv2lR7Ak=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F07A7F8059F; Thu, 22 May 2025 03:44:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF7A1F805AA;
	Thu, 22 May 2025 03:44:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BA0BF8056F; Thu, 22 May 2025 03:44:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E36B2F801F7
	for <alsa-devel@alsa-project.org>; Thu, 22 May 2025 03:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E36B2F801F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=bRFoQ+uq
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54M1htXZ446074;
	Wed, 21 May 2025 20:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747878236;
	bh=qHHj9sngM/7Tp48gK/cCl6RSJOmN8w0VQK+rDAx+OB8=;
	h=From:To:CC:Subject:Date;
	b=bRFoQ+uqkeU7lEnAS1jv6mpsNzz0bRDnI0qUZ8RNdekAzNYsuH6rFin1ojFdijQSa
	 Ca+pjYXIkwHnBJXWHSpuf9Y4RbTEAYP8+yktiU2QpYynPlx2sMEN8N4jto26Z6Ox/l
	 AitV1cyz973CqZM32iL2aMVFTHMrj87PeNq6tnnA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54M1ht0e3143710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 21 May 2025 20:43:55 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 May 2025 20:43:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 May 2025 20:43:54 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.60])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54M1hoh8323801;
	Wed, 21 May 2025 20:43:51 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>, <jesse-ji@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Move and unified the calibrated-data
 getting function for SPI and I2C into the tas2781_hda lib.
Date: Thu, 22 May 2025 09:43:47 +0800
Message-ID: <20250522014347.1163-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: UZK3N33TSCUDRNFVTY2W2Y6P65XA2F4N
X-Message-ID-Hash: UZK3N33TSCUDRNFVTY2W2Y6P65XA2F4N
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UZK3N33TSCUDRNFVTY2W2Y6P65XA2F4N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Calibration data getting function for SPI and I2C HDA drivers are almost
same, which read the calibration data from UEFI. To put them into
tas2781_hda lib for code cleanup is more reasonable than to still keep
them in the codec driver. For tas2781 codec driver, there're two different
sources for calibrated data, one is from bin file, generated in factory
test, requested and read in codec driver side; the other is from user
space during device bootup.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - Correct the comment in tas2781.h.
 - Move enum device_catlog_id {...} from tas2781.h into tas2781_hda.h.
 - Move (*save_calibration)() and (*apply_calibration)() from tas2781.h
   into tas2781_hda.h.
 - Move the declaration of tas2781_save_calibration into tas2781_hda.h.
 - Define tasdev_fct_efi_guid[] and put all the supported devices into
   the tas2781_hda.c.
 - Optimize and cleanup tas2563_save_calibration.
 - Move the definition of TASDEVICE_CMD_XXX from tas2781.h to
   tas2781_fmwlib.c
 - Drop tas2781_save_calibration() in tas2781-comlib.c.
 - Move the implementation of tasdevice_remove to tas2781-comlib.c
---
 include/sound/tas2781.h           |  10 --
 sound/pci/hda/tas2781_hda.c       | 179 ++++++++++++++++++++++
 sound/pci/hda/tas2781_hda.h       |  12 ++
 sound/pci/hda/tas2781_hda_i2c.c   | 245 ++++++++++--------------------
 sound/pci/hda/tas2781_hda_spi.c   | 167 +-------------------
 sound/soc/codecs/tas2781-comlib.c |  15 --
 6 files changed, 272 insertions(+), 356 deletions(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 9dc178a7486a..40cd3bd079b5 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -116,11 +116,6 @@ enum dspbin_type {
 	TASDEV_BETA,
 };
 
-enum device_catlog_id {
-	LENOVO = 0,
-	OTHERS
-};
-
 struct bulk_reg_val {
 	int reg;
 	unsigned char val[4];
@@ -190,7 +185,6 @@ struct tasdevice_priv {
 	struct regmap *regmap;
 	struct device *dev;
 
-	enum device_catlog_id catlog_id;
 	unsigned char cal_binaryname[TASDEVICE_MAX_CHANNELS][64];
 	unsigned char crc8_lkp_tbl[CRC8_TABLE_SIZE];
 	unsigned char coef_binaryname[64];
@@ -241,8 +235,6 @@ struct tasdevice_priv {
 	int (*dev_bulk_read)(struct tasdevice_priv *tas_priv,
 		unsigned short chn, unsigned int reg, unsigned char *p_data,
 		unsigned int n_length);
-	int (*save_calibration)(struct tasdevice_priv *tas_priv);
-	void (*apply_calibration)(struct tasdevice_priv *tas_priv);
 };
 
 int tasdevice_dev_read(struct tasdevice_priv *tas_priv,
@@ -256,6 +248,4 @@ int tasdevice_dev_bulk_write(
 	struct tasdevice_priv *tas_priv, unsigned short chn,
 	unsigned int reg, unsigned char *p_data, unsigned int n_length);
 void tasdevice_remove(struct tasdevice_priv *tas_priv);
-int tasdevice_save_calibration(struct tasdevice_priv *tas_priv);
-void tasdevice_apply_calibration(struct tasdevice_priv *tas_priv);
 #endif /* __TAS2781_H__ */
diff --git a/sound/pci/hda/tas2781_hda.c b/sound/pci/hda/tas2781_hda.c
index 9d8e0d938d5a..5f1d4b3e9688 100644
--- a/sound/pci/hda/tas2781_hda.c
+++ b/sound/pci/hda/tas2781_hda.c
@@ -18,6 +18,185 @@
 
 #include "tas2781_hda.h"
 
+const efi_guid_t tasdev_fct_efi_guid[] = {
+	/* DELL */
+	EFI_GUID(0xcc92382d, 0x6337, 0x41cb, 0xa8, 0x8b, 0x8e, 0xce, 0x74,
+		0x91, 0xea, 0x9f),
+	/* HP */
+	EFI_GUID(0x02f9af02, 0x7734, 0x4233, 0xb4, 0x3d, 0x93, 0xfe, 0x5a,
+		0xa3, 0x5d, 0xb3),
+	/* LENOVO & OTHERS */
+	EFI_GUID(0x1f52d2a1, 0xbb3a, 0x457d, 0xbc, 0x09, 0x43, 0xa3, 0xf4,
+		0x31, 0x0a, 0x92),
+};
+EXPORT_SYMBOL_NS_GPL(tasdev_fct_efi_guid, "SND_HDA_SCODEC_TAS2781");
+
+static void tas2781_apply_calib(struct tasdevice_priv *p)
+{
+	struct calidata *cali_data = &p->cali_data;
+	struct cali_reg *r = &cali_data->cali_reg_array;
+	unsigned char *data = cali_data->data;
+	unsigned int *tmp_val = (unsigned int *)data;
+	unsigned int cali_reg[TASDEV_CALIB_N] = {
+		TASDEVICE_REG(0, 0x17, 0x74),
+		TASDEVICE_REG(0, 0x18, 0x0c),
+		TASDEVICE_REG(0, 0x18, 0x14),
+		TASDEVICE_REG(0, 0x13, 0x70),
+		TASDEVICE_REG(0, 0x18, 0x7c),
+	};
+	unsigned int crc, oft;
+	unsigned char *buf;
+	int i, j, k, l;
+
+	if (tmp_val[0] == 2781) {
+		/*
+		 * New features were added in calibrated Data V3:
+		 *     1. Added calibration registers address define in
+		 *	    a node, marked as Device id == 0x80.
+		 * New features were added in calibrated Data V2:
+		 *     1. Added some the fields to store the link_id and
+		 *	    uniqie_id for multi-link solutions
+		 *     2. Support flexible number of devices instead of
+		 *	    fixed one in V1.
+		 * Layout of calibrated data V2 in UEFI(total 256 bytes):
+		 *     ChipID (2781, 4 bytes)
+		 *     Data-Group-Sum (4 bytes)
+		 *     TimeStamp of Calibration (4 bytes)
+		 *     for (i = 0; i < Data-Group-Sum; i++) {
+		 *	    if (Data type != 0x80) (4 bytes)
+		 *		 Calibrated Data of Device #i (20 bytes)
+		 *	    else
+		 *		 Calibration registers address (5*4 = 20 bytes)
+		 *		 # V2: No reg addr in data grp section.
+		 *		 # V3: Normally the last grp is the reg addr.
+		 *     }
+		 *     CRC (4 bytes)
+		 *     Reserved (the rest)
+		 */
+		crc = crc32(~0, data, (3 + tmp_val[1] * 6) * 4) ^ ~0;
+
+		if (crc != tmp_val[3 + tmp_val[1] * 6]) {
+			cali_data->total_sz = 0;
+			dev_err(p->dev, "%s: CRC error\n", __func__);
+			return;
+		}
+
+		for (j = 0, k = 0; j < tmp_val[1]; j++) {
+			oft = j * 6 + 3;
+			if (tmp_val[oft] == TASDEV_UEFI_CALI_REG_ADDR_FLG) {
+				for (i = 0; i < TASDEV_CALIB_N; i++) {
+					buf = &data[(oft + i + 1) * 4];
+					cali_reg[i] = TASDEVICE_REG(buf[1],
+						buf[2], buf[3]);
+				}
+			} else {
+				l = j * (cali_data->cali_dat_sz_per_dev + 1);
+				if (k >= p->ndev || l > oft * 4) {
+					dev_err(p->dev, "%s: dev sum error\n",
+						__func__);
+					cali_data->total_sz = 0;
+					return;
+				}
+
+				data[l] = k;
+				for (i = 0; i < TASDEV_CALIB_N * 4; i++)
+					data[l + i] = data[4 * oft + i];
+				k++;
+			}
+		}
+	} else {
+		/*
+		 * Calibration data is in V1 format.
+		 * struct cali_data {
+		 *     char cali_data[20];
+		 * }
+		 *
+		 * struct {
+		 *     struct cali_data cali_data[4];
+		 *     int  TimeStamp of Calibration (4 bytes)
+		 *     int CRC (4 bytes)
+		 * } ueft;
+		 */
+		crc = crc32(~0, data, 84) ^ ~0;
+		if (crc != tmp_val[21]) {
+			cali_data->total_sz = 0;
+			dev_err(p->dev, "%s: V1 CRC error\n", __func__);
+			return;
+		}
+
+		for (j = p->ndev - 1; j >= 0; j--) {
+			l = j * (cali_data->cali_dat_sz_per_dev + 1);
+			for (i = TASDEV_CALIB_N * 4; i > 0 ; i--)
+				data[l + i] = data[p->index * 5 + i];
+			data[l+i] = j;
+		}
+	}
+
+	if (p->dspbin_typ == TASDEV_BASIC) {
+		r->r0_reg = cali_reg[0];
+		r->invr0_reg = cali_reg[1];
+		r->r0_low_reg = cali_reg[2];
+		r->pow_reg = cali_reg[3];
+		r->tlimit_reg = cali_reg[4];
+	}
+
+	p->is_user_space_calidata = true;
+	cali_data->total_sz = p->ndev * (cali_data->cali_dat_sz_per_dev + 1);
+}
+
+/*
+ * Update the calibration data, including speaker impedance, f0, etc,
+ * into algo. Calibrate data is done by manufacturer in the factory.
+ * The data is used by Algo for calculating the speaker temperature,
+ * speaker membrane excursion and f0 in real time during playback.
+ * Calibration data format in EFI is V2, since 2024.
+ */
+int tas2781_save_calibration(struct tas2781_hda *hda)
+{
+	/*
+	 * GUID was used for data access in BIOS, it was provided by board
+	 * manufactory.
+	 */
+	efi_guid_t efi_guid = tasdev_fct_efi_guid[LENOVO];
+	static efi_char16_t efi_name[] = TASDEVICE_CALIBRATION_DATA_NAME;
+	struct tasdevice_priv *p = hda->priv;
+	struct calidata *cali_data = &p->cali_data;
+	unsigned long total_sz = 0;
+	unsigned int attr, size;
+	unsigned char *data;
+	efi_status_t status;
+
+	if (hda->catlog_id < LENOVO)
+		efi_guid = tasdev_fct_efi_guid[hda->catlog_id];
+
+	cali_data->cali_dat_sz_per_dev = 20;
+	size = p->ndev * (cali_data->cali_dat_sz_per_dev + 1);
+	/* Get real size of UEFI variable */
+	status = efi.get_variable(efi_name, &efi_guid, &attr, &total_sz, NULL);
+	cali_data->total_sz = total_sz > size ? total_sz : size;
+	if (status == EFI_BUFFER_TOO_SMALL) {
+		/* Allocate data buffer of data_size bytes */
+		data = p->cali_data.data = devm_kzalloc(p->dev,
+			p->cali_data.total_sz, GFP_KERNEL);
+		if (!data) {
+			p->cali_data.total_sz = 0;
+			return -ENOMEM;
+		}
+		/* Get variable contents into buffer */
+		status = efi.get_variable(efi_name, &efi_guid, &attr,
+			&p->cali_data.total_sz, data);
+	}
+	if (status != EFI_SUCCESS) {
+		p->cali_data.total_sz = 0;
+		return status;
+	}
+
+	tas2781_apply_calib(p);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(tas2781_save_calibration, "SND_HDA_SCODEC_TAS2781");
+
 void tas2781_hda_remove(struct device *dev,
 	const struct component_ops *ops)
 {
diff --git a/sound/pci/hda/tas2781_hda.h b/sound/pci/hda/tas2781_hda.h
index 95229083ce6a..575a701c8dfb 100644
--- a/sound/pci/hda/tas2781_hda.h
+++ b/sound/pci/hda/tas2781_hda.h
@@ -9,6 +9,8 @@
 
 #include <sound/asound.h>
 
+/* Flag of calibration registers address. */
+#define TASDEV_UEFI_CALI_REG_ADDR_FLG	BIT(7)
 #define TASDEVICE_CALIBRATION_DATA_NAME	L"CALI_DATA"
 #define TASDEV_CALIB_N			5
 
@@ -44,6 +46,13 @@
 	.private_value = xdata, \
 }
 
+enum device_catlog_id {
+	DELL = 0,
+	HP,
+	LENOVO,
+	OTHERS
+};
+
 struct tas2781_hda {
 	struct device *dev;
 	struct tasdevice_priv *priv;
@@ -54,6 +63,9 @@ struct tas2781_hda {
 	void *hda_priv;
 };
 
+extern const efi_guid_t tasdev_fct_efi_guid[];
+
+int tas2781_save_calibration(struct tas2781_hda *p);
 void tas2781_hda_remove(struct device *dev,
 	const struct component_ops *ops);
 int tasdevice_info_profile(struct snd_kcontrol *kctl,
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 0e51b07dbd05..d91eed9f7804 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -33,26 +33,21 @@
 #include "hda_generic.h"
 #include "tas2781_hda.h"
 
-#define TASDEVICE_SPEAKER_CALIBRATION_SIZE	20
-
-#define TAS2563_MAX_CHANNELS	4
-
-#define TAS2563_CAL_POWER	TASDEVICE_REG(0, 0x0d, 0x3c)
-#define TAS2563_CAL_R0		TASDEVICE_REG(0, 0x0f, 0x34)
-#define TAS2563_CAL_INVR0	TASDEVICE_REG(0, 0x0f, 0x40)
-#define TAS2563_CAL_R0_LOW	TASDEVICE_REG(0, 0x0f, 0x48)
-#define TAS2563_CAL_TLIM	TASDEVICE_REG(0, 0x10, 0x14)
-#define TAS2563_CAL_DATA_SIZE	4
-#define TAS2563_CAL_CH_SIZE	20
-#define TAS2563_CAL_ARRAY_SIZE	80
-
-static unsigned int cal_regs[TASDEV_CALIB_N] = {
-	TAS2563_CAL_POWER, TAS2563_CAL_R0, TAS2563_CAL_INVR0,
-	TAS2563_CAL_R0_LOW, TAS2563_CAL_TLIM,
-};
+#define TAS2563_CAL_VAR_NAME_MAX	16
+#define TAS2563_CAL_ARRAY_SIZE		80
+#define TAS2563_CAL_DATA_SIZE		4
+#define TAS2563_MAX_CHANNELS		4
+#define TAS2563_CAL_CH_SIZE		20
+
+#define TAS2563_CAL_R0_LOW		TASDEVICE_REG(0, 0x0f, 0x48)
+#define TAS2563_CAL_POWER		TASDEVICE_REG(0, 0x0d, 0x3c)
+#define TAS2563_CAL_INVR0		TASDEVICE_REG(0, 0x0f, 0x40)
+#define TAS2563_CAL_TLIM		TASDEVICE_REG(0, 0x10, 0x14)
+#define TAS2563_CAL_R0			TASDEVICE_REG(0, 0x0f, 0x34)
 
 struct tas2781_hda_i2c_priv {
 	struct snd_kcontrol *snd_ctls[2];
+	int (*save_calibration)(struct tas2781_hda *h);
 };
 
 static int tas2781_get_i2c_res(struct acpi_resource *ares, void *data)
@@ -283,157 +278,89 @@ static const struct snd_kcontrol_new tas2781_dsp_conf_ctrl = {
 	.put = tasdevice_config_put,
 };
 
-static void tas2563_apply_calib(struct tasdevice_priv *tas_priv)
+static int tas2563_save_calibration(struct tas2781_hda *h)
 {
-	int offset = 0;
-	__be32 data;
-	int ret;
-
-	for (int i = 0; i < tas_priv->ndev; i++) {
-		for (int j = 0; j < TASDEV_CALIB_N; ++j) {
-			data = cpu_to_be32(
-				*(uint32_t *)&tas_priv->cali_data.data[offset]);
-			ret = tasdevice_dev_bulk_write(tas_priv, i, cal_regs[j],
-				(unsigned char *)&data, TAS2563_CAL_DATA_SIZE);
-			if (ret)
-				dev_err(tas_priv->dev,
-					"Error writing calib regs\n");
-			offset += TAS2563_CAL_DATA_SIZE;
-		}
-	}
-}
-
-static int tas2563_save_calibration(struct tasdevice_priv *tas_priv)
-{
-	static efi_guid_t efi_guid = EFI_GUID(0x1f52d2a1, 0xbb3a, 0x457d, 0xbc,
-		0x09, 0x43, 0xa3, 0xf4, 0x31, 0x0a, 0x92);
-
-	static efi_char16_t *efi_vars[TAS2563_MAX_CHANNELS][TASDEV_CALIB_N] = {
-		{ L"Power_1", L"R0_1", L"InvR0_1", L"R0_Low_1", L"TLim_1" },
-		{ L"Power_2", L"R0_2", L"InvR0_2", L"R0_Low_2", L"TLim_2" },
-		{ L"Power_3", L"R0_3", L"InvR0_3", L"R0_Low_3", L"TLim_3" },
-		{ L"Power_4", L"R0_4", L"InvR0_4", L"R0_Low_4", L"TLim_4" },
+	efi_guid_t efi_guid = tasdev_fct_efi_guid[LENOVO];
+	char *vars[TASDEV_CALIB_N] = {
+		"R0_%d", "InvR0_%d", "R0_Low_%d", "Power_%d", "TLim_%d"
 	};
-
+	efi_char16_t efi_name[TAS2563_CAL_VAR_NAME_MAX];
 	unsigned long max_size = TAS2563_CAL_DATA_SIZE;
+	unsigned char var8[TAS2563_CAL_VAR_NAME_MAX];
+	struct tasdevice_priv *p = h->hda_priv;
+	struct calidata *cd = &p->cali_data;
+	struct cali_reg *r = &cd->cali_reg_array;
 	unsigned int offset = 0;
+	unsigned char *data;
 	efi_status_t status;
 	unsigned int attr;
+	int ret, i, j, k;
+
+	cd->cali_dat_sz_per_dev = TAS2563_CAL_DATA_SIZE * TASDEV_CALIB_N;
 
-	tas_priv->cali_data.data = devm_kzalloc(tas_priv->dev,
-			TAS2563_CAL_ARRAY_SIZE, GFP_KERNEL);
-	if (!tas_priv->cali_data.data)
+	/* extra byte for each device is the device number */
+	cd->total_sz = (cd->cali_dat_sz_per_dev + 1) * p->ndev;
+	data = cd->data = devm_kzalloc(p->dev, cd->total_sz,
+		GFP_KERNEL);
+	if (!data)
 		return -ENOMEM;
 
-	for (int i = 0; i < tas_priv->ndev; ++i) {
-		for (int j = 0; j < TASDEV_CALIB_N; ++j) {
-			status = efi.get_variable(efi_vars[i][j],
+	for (i = 0; i < p->ndev; ++i) {
+		data[offset] = i;
+		offset++;
+		for (j = 0; j < TASDEV_CALIB_N; ++j) {
+			ret = snprintf(var8, sizeof(var8), vars[j], i);
+
+			if (ret < 0 || ret >= sizeof(var8) - 1) {
+				dev_err(p->dev, "%s: Read %s failed\n",
+					__func__, var8);
+				return -EINVAL;
+			}
+			/*
+			 * Our variable names are ASCII by construction, but
+			 * EFI names are wide chars.  Convert and zero-pad.
+			 */
+			memset(efi_name, 0, sizeof(efi_name));
+			for (k = 0; k < sizeof(var8) && var8[k]; k++)
+				efi_name[k] = var8[k];
+			status = efi.get_variable(efi_name,
 				&efi_guid, &attr, &max_size,
-				&tas_priv->cali_data.data[offset]);
+				&data[offset]);
 			if (status != EFI_SUCCESS ||
 				max_size != TAS2563_CAL_DATA_SIZE) {
-				dev_warn(tas_priv->dev,
-				"Calibration data read failed %ld\n", status);
+				dev_warn(p->dev,
+					"Dev %d: Caldat[%d] read failed %ld\n",
+					i, j, status);
 				return -EINVAL;
 			}
 			offset += TAS2563_CAL_DATA_SIZE;
 		}
 	}
 
-	tas_priv->cali_data.total_sz = offset;
-	tasdevice_apply_calibration(tas_priv);
-
-	return 0;
-}
-
-static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
-{
-	struct calidata *cali_data = &tas_priv->cali_data;
-	struct cali_reg *r = &cali_data->cali_reg_array;
-	unsigned int cali_reg[TASDEV_CALIB_N] = {
-		TASDEVICE_REG(0, 0x17, 0x74),
-		TASDEVICE_REG(0, 0x18, 0x0c),
-		TASDEVICE_REG(0, 0x18, 0x14),
-		TASDEVICE_REG(0, 0x13, 0x70),
-		TASDEVICE_REG(0, 0x18, 0x7c),
-	};
-	int i, j, rc;
-	int oft = 0;
-	__be32 data;
-
-	if (tas_priv->dspbin_typ != TASDEV_BASIC) {
-		cali_reg[0] = r->r0_reg;
-		cali_reg[1] = r->invr0_reg;
-		cali_reg[2] = r->r0_low_reg;
-		cali_reg[3] = r->pow_reg;
-		cali_reg[4] = r->tlimit_reg;
-	}
-
-	for (i = 0; i < tas_priv->ndev; i++) {
-		for (j = 0; j < TASDEV_CALIB_N; j++) {
-			data = cpu_to_be32(
-				*(uint32_t *)&tas_priv->cali_data.data[oft]);
-			rc = tasdevice_dev_bulk_write(tas_priv, i,
-				cali_reg[j], (unsigned char *)&data, 4);
-			if (rc < 0)
-				dev_err(tas_priv->dev,
-					"chn %d calib %d bulk_wr err = %d\n",
-					i, j, rc);
-			oft += 4;
-		}
-	}
-}
-
-/* Update the calibration data, including speaker impedance, f0, etc, into algo.
- * Calibrate data is done by manufacturer in the factory. These data are used
- * by Algo for calculating the speaker temperature, speaker membrane excursion
- * and f0 in real time during playback.
- */
-static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
-{
-	efi_guid_t efi_guid = EFI_GUID(0x02f9af02, 0x7734, 0x4233, 0xb4, 0x3d,
-		0x93, 0xfe, 0x5a, 0xa3, 0x5d, 0xb3);
-	static efi_char16_t efi_name[] = TASDEVICE_CALIBRATION_DATA_NAME;
-	unsigned int attr, crc;
-	unsigned int *tmp_val;
-	efi_status_t status;
-
-	/* Lenovo devices */
-	if (tas_priv->catlog_id == LENOVO)
-		efi_guid = EFI_GUID(0x1f52d2a1, 0xbb3a, 0x457d, 0xbc, 0x09,
-			0x43, 0xa3, 0xf4, 0x31, 0x0a, 0x92);
-
-	tas_priv->cali_data.total_sz = 0;
-	/* Get real size of UEFI variable */
-	status = efi.get_variable(efi_name, &efi_guid, &attr,
-		&tas_priv->cali_data.total_sz, tas_priv->cali_data.data);
-	if (status == EFI_BUFFER_TOO_SMALL) {
-		/* Allocate data buffer of data_size bytes */
-		tas_priv->cali_data.data = devm_kzalloc(tas_priv->dev,
-			tas_priv->cali_data.total_sz, GFP_KERNEL);
-		if (!tas_priv->cali_data.data)
-			return -ENOMEM;
-		/* Get variable contents into buffer */
-		status = efi.get_variable(efi_name, &efi_guid, &attr,
-			&tas_priv->cali_data.total_sz,
-			tas_priv->cali_data.data);
-	}
-	if (status != EFI_SUCCESS)
+	if (cd->total_sz != offset) {
+		dev_err(p->dev, "%s: tot_size(%lu) and offset(%u) dismatch\n",
+			__func__, cd->total_sz, offset);
 		return -EINVAL;
+	}
 
-	tmp_val = (unsigned int *)tas_priv->cali_data.data;
-
-	crc = crc32(~0, tas_priv->cali_data.data, 84) ^ ~0;
-	dev_dbg(tas_priv->dev, "cali crc 0x%08x PK tmp_val 0x%08x\n",
-		crc, tmp_val[21]);
-
-	if (crc == tmp_val[21]) {
-		time64_t seconds = tmp_val[20];
+	r->r0_reg = TAS2563_CAL_R0;
+	r->invr0_reg = TAS2563_CAL_INVR0;
+	r->r0_low_reg = TAS2563_CAL_R0_LOW;
+	r->pow_reg = TAS2563_CAL_POWER;
+	r->tlimit_reg = TAS2563_CAL_TLIM;
 
-		dev_dbg(tas_priv->dev, "%ptTsr\n", &seconds);
-		tasdevice_apply_calibration(tas_priv);
-	} else
-		tas_priv->cali_data.total_sz = 0;
+	/*
+	 * TAS2781_FMWLIB supports two solutions of calibrated data. One is
+	 * from the driver itself: driver reads the calibrated files directly
+	 * during probe; The other from user space: during init of audio hal,
+	 * the audio hal will pass the calibrated data via kcontrol interface.
+	 * Driver will store this data in "struct calidata" for use. For hda
+	 * device, calibrated data are usunally saved into UEFI. So Hda side
+	 * codec driver use the mixture of these two solutions, driver reads
+	 * the data from UEFI, then store this data in "struct calidata" for
+	 * use.
+	 */
+	p->is_user_space_calidata = true;
 
 	return 0;
 }
@@ -548,7 +475,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	/* If calibrated data occurs error, dsp will still works with default
 	 * calibrated data inside algo.
 	 */
-	tasdevice_save_calibration(tas_priv);
+	hda_priv->save_calibration(tas_hda);
 
 	tasdevice_tuning_switch(tas_hda->priv, 0);
 	tas_hda->priv->playback_started = true;
@@ -581,11 +508,11 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 	subid = codec->core.subsystem_id >> 16;
 
 	switch (subid) {
-	case 0x17aa:
-		tas_hda->priv->catlog_id = LENOVO;
+	case 0x1028:
+		tas_hda->catlog_id = DELL;
 		break;
 	default:
-		tas_hda->priv->catlog_id = OTHERS;
+		tas_hda->catlog_id = LENOVO;
 		break;
 	}
 
@@ -658,13 +585,11 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 
 	if (strstr(dev_name(&clt->dev), "TIAS2781")) {
 		device_name = "TIAS2781";
-		tas_hda->priv->save_calibration = tas2781_save_calibration;
-		tas_hda->priv->apply_calibration = tas2781_apply_calib;
+		hda_priv->save_calibration = tas2781_save_calibration;
 		tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;
 	} else if (strstr(dev_name(&clt->dev), "INT8866")) {
 		device_name = "INT8866";
-		tas_hda->priv->save_calibration = tas2563_save_calibration;
-		tas_hda->priv->apply_calibration = tas2563_apply_calib;
+		hda_priv->save_calibration = tas2563_save_calibration;
 		tas_hda->priv->global_addr = TAS2563_GLOBAL_ADDR;
 	} else
 		return -ENODEV;
@@ -735,11 +660,6 @@ static int tas2781_runtime_resume(struct device *dev)
 
 	tasdevice_prmg_load(tas_hda->priv, tas_hda->priv->cur_prog);
 
-	/* If calibrated data occurs error, dsp will still works with default
-	 * calibrated data inside algo.
-	 */
-	tasdevice_apply_calibration(tas_hda->priv);
-
 	mutex_unlock(&tas_hda->priv->codec_lock);
 
 	return 0;
@@ -783,11 +703,6 @@ static int tas2781_system_resume(struct device *dev)
 	tasdevice_reset(tas_hda->priv);
 	tasdevice_prmg_load(tas_hda->priv, tas_hda->priv->cur_prog);
 
-	/* If calibrated data occurs error, dsp will still work with default
-	 * calibrated data inside algo.
-	 */
-	tasdevice_apply_calibration(tas_hda->priv);
-
 	if (tas_hda->priv->playback_started)
 		tasdevice_tuning_switch(tas_hda->priv, 0);
 
diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/pci/hda/tas2781_hda_spi.c
index e0f8603c4854..5c03e9d2283a 100644
--- a/sound/pci/hda/tas2781_hda_spi.c
+++ b/sound/pci/hda/tas2781_hda_spi.c
@@ -526,169 +526,6 @@ static struct snd_kcontrol_new tas2781_dsp_ctls[] = {
 	},
 };
 
-static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
-{
-	struct calidata *cali_data = &tas_priv->cali_data;
-	struct cali_reg *r = &cali_data->cali_reg_array;
-	unsigned char *data = cali_data->data;
-	unsigned int *tmp_val = (unsigned int *)data;
-	unsigned int cali_reg[TASDEV_CALIB_N] = {
-		TASDEVICE_REG(0, 0x17, 0x74),
-		TASDEVICE_REG(0, 0x18, 0x0c),
-		TASDEVICE_REG(0, 0x18, 0x14),
-		TASDEVICE_REG(0, 0x13, 0x70),
-		TASDEVICE_REG(0, 0x18, 0x7c),
-	};
-	unsigned int crc, oft;
-	unsigned char *buf;
-	int i, j, k, l;
-
-	if (tmp_val[0] == 2781) {
-		/*
-		 * New features were added in calibrated Data V3:
-		 *     1. Added calibration registers address define in
-		 *	    a node, marked as Device id == 0x80.
-		 * New features were added in calibrated Data V2:
-		 *     1. Added some the fields to store the link_id and
-		 *	    uniqie_id for multi-link solutions
-		 *     2. Support flexible number of devices instead of
-		 *	    fixed one in V1.
-		 * Layout of calibrated data V2 in UEFI(total 256 bytes):
-		 *     ChipID (2781, 4 bytes)
-		 *     Data-Group-Sum (4 bytes)
-		 *     TimeStamp of Calibration (4 bytes)
-		 *     for (i = 0; i < Data-Group-Sum; i++) {
-		 *	    if (Data type != 0x80) (4 bytes)
-		 *		 Calibrated Data of Device #i (20 bytes)
-		 *	    else
-		 *		 Calibration registers address (5*4 = 20 bytes)
-		 *		 # V2: No reg addr in data grp section.
-		 *		 # V3: Normally the last grp is the reg addr.
-		 *     }
-		 *     CRC (4 bytes)
-		 *     Reserved (the rest)
-		 */
-		crc = crc32(~0, data, (3 + tmp_val[1] * 6) * 4) ^ ~0;
-
-		if (crc != tmp_val[3 + tmp_val[1] * 6]) {
-			cali_data->total_sz = 0;
-			dev_err(tas_priv->dev, "%s: CRC error\n", __func__);
-			return;
-		}
-
-		for (j = 0, k = 0; j < tmp_val[1]; j++) {
-			oft = j * 6 + 3;
-			if (tmp_val[oft] == TASDEV_UEFI_CALI_REG_ADDR_FLG) {
-				for (i = 0; i < TASDEV_CALIB_N; i++) {
-					buf = &data[(oft + i + 1) * 4];
-					cali_reg[i] = TASDEVICE_REG(buf[1],
-						buf[2], buf[3]);
-				}
-			} else {
-				l = j * (cali_data->cali_dat_sz_per_dev + 1);
-				if (k >= tas_priv->ndev || l > oft * 4) {
-					dev_err(tas_priv->dev,
-						"%s: dev sum error\n",
-						__func__);
-					cali_data->total_sz = 0;
-					return;
-				}
-
-				data[l] = k;
-				for (i = 0; i < TASDEV_CALIB_N * 4; i++)
-					data[l + i] = data[4 * oft + i];
-				k++;
-			}
-		}
-	} else {
-		/*
-		 * Calibration data is in V1 format.
-		 * struct cali_data {
-		 *     char cali_data[20];
-		 * }
-		 *
-		 * struct {
-		 *     struct cali_data cali_data[4];
-		 *     int  TimeStamp of Calibration (4 bytes)
-		 *     int CRC (4 bytes)
-		 * } ueft;
-		 */
-		crc = crc32(~0, data, 84) ^ ~0;
-		if (crc != tmp_val[21]) {
-			cali_data->total_sz = 0;
-			dev_err(tas_priv->dev, "%s: V1 CRC error\n", __func__);
-			return;
-		}
-
-		for (j = tas_priv->ndev - 1; j >= 0; j--) {
-			l = j * (cali_data->cali_dat_sz_per_dev + 1);
-			for (i = TASDEV_CALIB_N * 4; i > 0 ; i--)
-				data[l + i] = data[tas_priv->index * 5 + i];
-			data[l+i] = j;
-		}
-	}
-
-	if (tas_priv->dspbin_typ == TASDEV_BASIC) {
-		r->r0_reg = cali_reg[0];
-		r->invr0_reg = cali_reg[1];
-		r->r0_low_reg = cali_reg[2];
-		r->pow_reg = cali_reg[3];
-		r->tlimit_reg = cali_reg[4];
-	}
-
-	tas_priv->is_user_space_calidata = true;
-	cali_data->total_sz =
-		tas_priv->ndev * (cali_data->cali_dat_sz_per_dev + 1);
-}
-
-/*
- * Update the calibration data, including speaker impedance, f0, etc,
- * into algo. Calibrate data is done by manufacturer in the factory.
- * These data are used by Algo for calculating the speaker temperature,
- * speaker membrane excursion and f0 in real time during playback.
- * Calibration data format in EFI is V2, since 2024.
- */
-static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
-{
-	/*
-	 * GUID was used for data access in BIOS, it was provided by board
-	 * manufactory, like HP: "{02f9af02-7734-4233-b43d-93fe5aa35db3}"
-	 */
-	efi_guid_t efi_guid =
-		EFI_GUID(0x02f9af02, 0x7734, 0x4233,
-			 0xb4, 0x3d, 0x93, 0xfe, 0x5a, 0xa3, 0x5d, 0xb3);
-	static efi_char16_t efi_name[] = TASDEVICE_CALIBRATION_DATA_NAME;
-	struct calidata *cali_data = &tas_priv->cali_data;
-	unsigned long total_sz = 0;
-	unsigned int attr, size;
-	efi_status_t status;
-	unsigned char *data;
-
-	cali_data->cali_dat_sz_per_dev = 20;
-	size = tas_priv->ndev * (cali_data->cali_dat_sz_per_dev + 1);
-	status = efi.get_variable(efi_name, &efi_guid, &attr, &total_sz, NULL);
-	cali_data->total_sz = total_sz > size ? total_sz : size;
-	if (status == EFI_BUFFER_TOO_SMALL) {
-		/* Allocate data buffer of data_size bytes */
-		data = tas_priv->cali_data.data = devm_kzalloc(tas_priv->dev,
-			tas_priv->cali_data.total_sz, GFP_KERNEL);
-		if (!data) {
-			tas_priv->cali_data.total_sz = 0;
-			return -ENOMEM;
-		}
-		/* Get variable contents into buffer */
-		status = efi.get_variable(efi_name, &efi_guid, &attr,
-			&tas_priv->cali_data.total_sz, data);
-	}
-	if (status != EFI_SUCCESS) {
-		tas_priv->cali_data.total_sz = 0;
-		return status;
-	}
-
-	tas_priv->apply_calibration(tas_priv);
-	return 0;
-}
-
 static void tas2781_hda_remove_controls(struct tas2781_hda *tas_hda)
 {
 	struct hda_codec *codec = tas_hda->priv->codec;
@@ -858,7 +695,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	 * If calibrated data occurs error, dsp will still works with default
 	 * calibrated data inside algo.
 	 */
-	tas2781_save_calibration(tas_priv);
+	tas2781_save_calibration(tas_hda);
 out:
 	release_firmware(fmw);
 	pm_runtime_mark_last_busy(tas_hda->priv->dev);
@@ -961,8 +798,6 @@ static int tas2781_hda_spi_probe(struct spi_device *spi)
 	}
 	if (strstr(dev_name(&spi->dev), "TXNW2781")) {
 		device_name = "TXNW2781";
-		tas_priv->save_calibration = tas2781_save_calibration;
-		tas_priv->apply_calibration = tas2781_apply_calib;
 	} else {
 		dev_err(tas_priv->dev, "Unmatched spi dev %s\n",
 			dev_name(&spi->dev));
diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index 076c1d955972..4cec9f8a00af 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -130,21 +130,6 @@ int tasdevice_dev_bulk_write(
 }
 EXPORT_SYMBOL_GPL(tasdevice_dev_bulk_write);
 
-int tasdevice_save_calibration(struct tasdevice_priv *tas_priv)
-{
-	if (tas_priv->save_calibration)
-		return tas_priv->save_calibration(tas_priv);
-	return -EINVAL;
-}
-EXPORT_SYMBOL_GPL(tasdevice_save_calibration);
-
-void tasdevice_apply_calibration(struct tasdevice_priv *tas_priv)
-{
-	if (tas_priv->apply_calibration && tas_priv->cali_data.total_sz)
-		tas_priv->apply_calibration(tas_priv);
-}
-EXPORT_SYMBOL_GPL(tasdevice_apply_calibration);
-
 static void tasdev_dsp_prog_blk_remove(struct tasdevice_prog *prog)
 {
 	struct tasdevice_data *tas_dt;
-- 
2.43.0

