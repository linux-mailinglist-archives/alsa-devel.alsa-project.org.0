Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA517B4EAA
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 11:05:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C1A1DEC;
	Mon,  2 Oct 2023 11:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C1A1DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696237552;
	bh=zxBN8F75uWnisIg/DLkm1eMHtzYoNrGdZLjR695s3dU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YFUam4ddvAQxjTwmQh/puju5JRt9rn0MTqHij4k/bZxHYeJFG40jHzifc2SJJjNDp
	 OURDCmfTYJUV/8XlsWXuxKhUb2Qht4KHMhBK5XngNGO0223j1vvRu/kpqeBNg6Uumg
	 jEUwKX1b4z9w8jpVwOqXMsPNXe6MynITQw49nSKo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D059DF801EB; Mon,  2 Oct 2023 11:05:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C65CF802E8;
	Mon,  2 Oct 2023 11:05:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11FA6F80310; Mon,  2 Oct 2023 11:04:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A406F801EB
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 11:04:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A406F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=BCQXLWKE
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39294i23101410;
	Mon, 2 Oct 2023 04:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696237484;
	bh=SRbFvXtnRVCs0CfxdKvx1BuZcqO9rvLGyF0BEg7Pe2g=;
	h=From:To:CC:Subject:Date;
	b=BCQXLWKEPNdpS+7JHHz4gND4Jhk2WxsrRzIaLrRbDEAAUf8yxWfIwD7ambb5XVXBl
	 EHDlUVL4KwMM3779/YSkW6f7p0YTZOFtFv47PvNBmE6V3t7qoVSfEpxDz40K26rRVg
	 vKseT0yHcVkfHaUh6P0MH3q3n4UvlPYyAjhZVrAU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39294iRP015795
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Oct 2023 04:04:44 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Oct 2023 04:04:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Oct 2023 04:04:43 -0500
Received: from LT5CG31242FY.dhcp.ti.com (ileaxei01-snat.itg.ti.com
 [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39294bCm025196;
	Mon, 2 Oct 2023 04:04:38 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <robh+dt@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <lgirdwood@gmail.com>, <perex@perex.cz>,
        <pierre-louis.bossart@linux.intel.com>, <kevin-lu@ti.com>,
        <13916275206@139.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <liam.r.girdwood@intel.com>,
        <mengdong.lin@intel.com>, <baojun.xu@ti.com>,
        <thomas.gfeller@q-drop.com>, <peeyush@ti.com>, <navada@ti.com>,
        <tiwai@suse.de>, Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: fixed compiling issue in m68k
Date: Mon, 2 Oct 2023 17:04:33 +0800
Message-ID: <20231002090434.1896-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: J3DG2YSDBTOOQHSL4ILC33X4M2VGK6WW
X-Message-ID-Hash: J3DG2YSDBTOOQHSL4ILC33X4M2VGK6WW
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J3DG2YSDBTOOQHSL4ILC33X4M2VGK6WW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

fixed m68k compiling issue: mapping table can save code field; storing the
dev_idx as a member of block can reduce unnecessary  time and system
resource comsumption of dev_idx mapping every time the block data writing
to the dsp.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
Changes in v1:
 - | Reported-by: kernel test robot <lkp@intel.com>
   | Closes:
   | https://lore.kernel.org/oe-kbuild-all/202309222048.RnSqEIK5-lkp@intel.
   | com/
---
 include/sound/tas2781-dsp.h       |   5 +
 sound/soc/codecs/tas2781-fmwlib.c | 234 +++++++++++++-----------------
 2 files changed, 107 insertions(+), 132 deletions(-)

diff --git a/include/sound/tas2781-dsp.h b/include/sound/tas2781-dsp.h
index bd1b72bf47a5..ea9af2726a53 100644
--- a/include/sound/tas2781-dsp.h
+++ b/include/sound/tas2781-dsp.h
@@ -77,6 +77,11 @@ struct tasdev_blk {
 	unsigned int nr_cmds;
 	unsigned int blk_size;
 	unsigned int nr_subblocks;
+	/* fixed m68k compiling issue, storing the dev_idx as a member of block
+	 * can reduce unnecessary timeand system resource comsumption of
+	 * dev_idx mapping every time the block data writing to the dsp.
+	 */
+	unsigned char dev_idx;
 	unsigned char *data;
 };
 
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index eb55abae0d7b..e27775d834e9 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -80,10 +80,72 @@ struct tas_crc {
 	unsigned char len;
 };
 
+struct blktyp_devidx_map {
+	unsigned char blktyp;
+	unsigned char dev_idx;
+};
+
 static const char deviceNumber[TASDEVICE_DSP_TAS_MAX_DEVICE] = {
 	1, 2, 1, 2, 1, 1, 0, 2, 4, 3, 1, 2, 3, 4
 };
 
+/* fixed m68k compiling issue: mapping table can save code field */
+static const struct blktyp_devidx_map ppc3_tas2781_mapping_table[] = {
+	{ MAIN_ALL_DEVICES_1X, 0x80 },
+	{ MAIN_DEVICE_A_1X, 0x81 },
+	{ COEFF_DEVICE_A_1X, 0xC1 },
+	{ PRE_DEVICE_A_1X, 0xC1 },
+	{ PRE_SOFTWARE_RESET_DEVICE_A, 0xC1 },
+	{ POST_SOFTWARE_RESET_DEVICE_A, 0xC1 },
+	{ MAIN_DEVICE_B_1X, 0x82 },
+	{ COEFF_DEVICE_B_1X, 0xC2 },
+	{ PRE_DEVICE_B_1X, 0xC2 },
+	{ PRE_SOFTWARE_RESET_DEVICE_B, 0xC2 },
+	{ POST_SOFTWARE_RESET_DEVICE_B, 0xC2 },
+	{ MAIN_DEVICE_C_1X, 0x83 },
+	{ COEFF_DEVICE_C_1X, 0xC3 },
+	{ PRE_DEVICE_C_1X, 0xC3 },
+	{ PRE_SOFTWARE_RESET_DEVICE_C, 0xC3 },
+	{ POST_SOFTWARE_RESET_DEVICE_C, 0xC3 },
+	{ MAIN_DEVICE_D_1X, 0x84 },
+	{ COEFF_DEVICE_D_1X, 0xC4 },
+	{ PRE_DEVICE_D_1X, 0xC4 },
+	{ PRE_SOFTWARE_RESET_DEVICE_D, 0xC4 },
+	{ POST_SOFTWARE_RESET_DEVICE_D, 0xC4 },
+};
+
+static const struct blktyp_devidx_map ppc3_mapping_table[] = {
+	{ MAIN_ALL_DEVICES_1X, 0x80 },
+	{ MAIN_DEVICE_A_1X, 0x81 },
+	{ COEFF_DEVICE_A_1X, 0xC1 },
+	{ PRE_DEVICE_A_1X, 0xC1 },
+	{ MAIN_DEVICE_B_1X, 0x82 },
+	{ COEFF_DEVICE_B_1X, 0xC2 },
+	{ PRE_DEVICE_B_1X, 0xC2 },
+	{ MAIN_DEVICE_C_1X, 0x83 },
+	{ COEFF_DEVICE_C_1X, 0xC3 },
+	{ PRE_DEVICE_C_1X, 0xC3 },
+	{ MAIN_DEVICE_D_1X, 0x84 },
+	{ COEFF_DEVICE_D_1X, 0xC4 },
+	{ PRE_DEVICE_D_1X, 0xC4 },
+};
+
+static const struct blktyp_devidx_map non_ppc3_mapping_table[] = {
+	{ MAIN_ALL_DEVICES, 0x80 },
+	{ MAIN_DEVICE_A, 0x81 },
+	{ COEFF_DEVICE_A, 0xC1 },
+	{ PRE_DEVICE_A, 0xC1 },
+	{ MAIN_DEVICE_B, 0x82 },
+	{ COEFF_DEVICE_B, 0xC2 },
+	{ PRE_DEVICE_B, 0xC2 },
+	{ MAIN_DEVICE_C, 0x83 },
+	{ COEFF_DEVICE_C, 0xC3 },
+	{ PRE_DEVICE_C, 0xC3 },
+	{ MAIN_DEVICE_D, 0x84 },
+	{ COEFF_DEVICE_D, 0xC4 },
+	{ PRE_DEVICE_D, 0xC4 },
+};
+
 static struct tasdevice_config_info *tasdevice_add_config(
 	struct tasdevice_priv *tas_priv, unsigned char *config_data,
 	unsigned int config_size, int *status)
@@ -316,6 +378,37 @@ int tasdevice_rca_parser(void *context, const struct firmware *fmw)
 }
 EXPORT_SYMBOL_NS_GPL(tasdevice_rca_parser, SND_SOC_TAS2781_FMWLIB);
 
+/* fixed m68k compiling issue: mapping table can save code field */
+static unsigned char map_dev_idx(struct tasdevice_fw *tas_fmw,
+	struct tasdev_blk *block)
+{
+
+	struct blktyp_devidx_map *p =
+		(struct blktyp_devidx_map *)non_ppc3_mapping_table;
+	struct tasdevice_dspfw_hdr *fw_hdr = &(tas_fmw->fw_hdr);
+	struct tasdevice_fw_fixed_hdr *fw_fixed_hdr = &(fw_hdr->fixed_hdr);
+
+	int i, n = ARRAY_SIZE(non_ppc3_mapping_table);
+	unsigned char dev_idx = 0;
+
+	if (fw_fixed_hdr->ppcver >= PPC3_VERSION_TAS2781) {
+		p = (struct blktyp_devidx_map *)ppc3_tas2781_mapping_table;
+		n = ARRAY_SIZE(ppc3_tas2781_mapping_table);
+	} else if (fw_fixed_hdr->ppcver >= PPC3_VERSION) {
+		p = (struct blktyp_devidx_map *)ppc3_mapping_table;
+		n = ARRAY_SIZE(ppc3_mapping_table);
+	}
+
+	for (i = 0; i < n; i++) {
+		if (block->type == p[i].blktyp) {
+			dev_idx = p[i].dev_idx;
+			break;
+		}
+	}
+
+	return dev_idx;
+}
+
 static int fw_parse_block_data_kernel(struct tasdevice_fw *tas_fmw,
 	struct tasdev_blk *block, const struct firmware *fmw, int offset)
 {
@@ -351,6 +444,14 @@ static int fw_parse_block_data_kernel(struct tasdevice_fw *tas_fmw,
 	block->nr_subblocks = be32_to_cpup((__be32 *)&data[offset]);
 	offset += 4;
 
+	/* fixed m68k compiling issue:
+	 * 1. mapping table can save code field.
+	 * 2. storing the dev_idx as a member of block can reduce unnecessary
+	 *    time and system resource comsumption of dev_idx mapping every
+	 *    time the block data writing to the dsp.
+	 */
+	block->dev_idx = map_dev_idx(tas_fmw, block);
+
 	if (offset + block->blk_size > fmw->size) {
 		dev_err(tas_fmw->dev, "%s: nSublocks error\n", __func__);
 		offset = -EINVAL;
@@ -768,144 +869,13 @@ EXPORT_SYMBOL_NS_GPL(tasdevice_select_cfg_blk, SND_SOC_TAS2781_FMWLIB);
 static int tasdevice_load_block_kernel(
 	struct tasdevice_priv *tasdevice, struct tasdev_blk *block)
 {
-	struct tasdevice_dspfw_hdr *fw_hdr = &(tasdevice->fmw->fw_hdr);
-	struct tasdevice_fw_fixed_hdr *fw_fixed_hdr = &(fw_hdr->fixed_hdr);
 	const unsigned int blk_size = block->blk_size;
 	unsigned int i, length;
 	unsigned char *data = block->data;
-	unsigned char dev_idx = 0;
-
-	if (fw_fixed_hdr->ppcver >= PPC3_VERSION_TAS2781) {
-		switch (block->type) {
-		case MAIN_ALL_DEVICES_1X:
-			dev_idx = 0x80;
-			break;
-		case MAIN_DEVICE_A_1X:
-			dev_idx = 0x81;
-			break;
-		case COEFF_DEVICE_A_1X:
-		case PRE_DEVICE_A_1X:
-		case PRE_SOFTWARE_RESET_DEVICE_A:
-		case POST_SOFTWARE_RESET_DEVICE_A:
-			dev_idx = 0xC1;
-			break;
-		case MAIN_DEVICE_B_1X:
-			dev_idx = 0x82;
-			break;
-		case COEFF_DEVICE_B_1X:
-		case PRE_DEVICE_B_1X:
-		case PRE_SOFTWARE_RESET_DEVICE_B:
-		case POST_SOFTWARE_RESET_DEVICE_B:
-			dev_idx = 0xC2;
-			break;
-		case MAIN_DEVICE_C_1X:
-			dev_idx = 0x83;
-			break;
-		case COEFF_DEVICE_C_1X:
-		case PRE_DEVICE_C_1X:
-		case PRE_SOFTWARE_RESET_DEVICE_C:
-		case POST_SOFTWARE_RESET_DEVICE_C:
-			dev_idx = 0xC3;
-			break;
-		case MAIN_DEVICE_D_1X:
-			dev_idx = 0x84;
-			break;
-		case COEFF_DEVICE_D_1X:
-		case PRE_DEVICE_D_1X:
-		case PRE_SOFTWARE_RESET_DEVICE_D:
-		case POST_SOFTWARE_RESET_DEVICE_D:
-			dev_idx = 0xC4;
-			break;
-		default:
-			dev_info(tasdevice->dev,
-				"%s: load block: Other Type = 0x%02x\n",
-				__func__, block->type);
-			break;
-		}
-	} else if (fw_fixed_hdr->ppcver >=
-	PPC3_VERSION) {
-		switch (block->type) {
-		case MAIN_ALL_DEVICES_1X:
-			dev_idx = 0x80;
-			break;
-		case MAIN_DEVICE_A_1X:
-			dev_idx = 0x81;
-			break;
-		case COEFF_DEVICE_A_1X:
-		case PRE_DEVICE_A_1X:
-			dev_idx = 0xC1;
-			break;
-		case MAIN_DEVICE_B_1X:
-			dev_idx = 0x82;
-			break;
-		case COEFF_DEVICE_B_1X:
-		case PRE_DEVICE_B_1X:
-			dev_idx = 0xC2;
-			break;
-		case MAIN_DEVICE_C_1X:
-			dev_idx = 0x83;
-			break;
-		case COEFF_DEVICE_C_1X:
-		case PRE_DEVICE_C_1X:
-			dev_idx = 0xC3;
-			break;
-		case MAIN_DEVICE_D_1X:
-			dev_idx = 0x84;
-			break;
-		case COEFF_DEVICE_D_1X:
-		case PRE_DEVICE_D_1X:
-			dev_idx = 0xC4;
-			break;
-		default:
-			dev_info(tasdevice->dev,
-				"%s: load block: Other Type = 0x%02x\n",
-				__func__, block->type);
-			break;
-		}
-	} else {
-		switch (block->type) {
-		case MAIN_ALL_DEVICES:
-			dev_idx = 0|0x80;
-			break;
-		case MAIN_DEVICE_A:
-			dev_idx = 0x81;
-			break;
-		case COEFF_DEVICE_A:
-		case PRE_DEVICE_A:
-			dev_idx = 0xC1;
-			break;
-		case MAIN_DEVICE_B:
-			dev_idx = 0x82;
-			break;
-		case COEFF_DEVICE_B:
-		case PRE_DEVICE_B:
-			dev_idx = 0xC2;
-			break;
-		case MAIN_DEVICE_C:
-			dev_idx = 0x83;
-			break;
-		case COEFF_DEVICE_C:
-		case PRE_DEVICE_C:
-			dev_idx = 0xC3;
-			break;
-		case MAIN_DEVICE_D:
-			dev_idx = 0x84;
-			break;
-		case COEFF_DEVICE_D:
-		case PRE_DEVICE_D:
-			dev_idx = 0xC4;
-			break;
-		default:
-			dev_info(tasdevice->dev,
-				"%s: load block: Other Type = 0x%02x\n",
-				__func__, block->type);
-			break;
-		}
-	}
 
 	for (i = 0, length = 0; i < block->nr_subblocks; i++) {
 		int rc = tasdevice_process_block(tasdevice, data + length,
-			dev_idx, blk_size - length);
+			block->dev_idx, blk_size - length);
 		if (rc < 0) {
 			dev_err(tasdevice->dev,
 				"%s: %u %u sublock write error\n",
-- 
2.34.1

