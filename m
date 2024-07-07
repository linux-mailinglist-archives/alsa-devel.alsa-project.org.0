Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 181A8929725
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jul 2024 10:36:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D47B93A;
	Sun,  7 Jul 2024 10:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D47B93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720341397;
	bh=YhFbHainyYeyciT6pc1KvK3diNomH6u/4XzJ0ctmYLM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=E9dkXmYXKHGM7yKz+Nq+6dtNZZBG7/oPfT2ql9IRZuequSTadGORzGjn48wWp+OXy
	 31PCDtDD/jlxOARaBQIxmbVS/LpQmtvNCaoxQS+kf+pc/qW3d8ne8dOsOS44xh2Go2
	 in1WzMiPUDMQ1876AeVh0PbpedIHMXRkmwbADEkw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1922F805AE; Sun,  7 Jul 2024 10:36:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C67CF80508;
	Sun,  7 Jul 2024 10:36:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46EB3F801F5; Sun,  7 Jul 2024 10:33:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8FF5F800FA
	for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2024 10:30:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8FF5F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=BUEdqSZX
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4678UOcB006842;
	Sun, 7 Jul 2024 03:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720341024;
	bh=yLpZSA+/kNe6Eaz8hHjEs6HoSIzToxZRAf/a0PLG8MM=;
	h=From:To:CC:Subject:Date;
	b=BUEdqSZXd5yMVxpXRjrHvbi8NWNJZ+8b8ld4k+kpTqag/wh/HnZN/pzAXC+ZVNbKa
	 b1ZaWDUo8J9+E9AdTbNZP8WeDjFbwu69N8RihKITc4z+rs3UfCodDykMOdNjutEzG4
	 0ix4MaW6u9hAHDXmqu7pBTST5HClnbAyERo6FCUM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4678UOdS121327
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 7 Jul 2024 03:30:24 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 7
 Jul 2024 03:30:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 7 Jul 2024 03:30:24 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.158])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4678UERh011105;
	Sun, 7 Jul 2024 03:30:15 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <zhourui@huaqin.com>,
        <alsa-devel@alsa-project.org>, <i-salazar@ti.com>,
        <linux-kernel@vger.kernel.org>, <j-chadha@ti.com>,
        <liam.r.girdwood@intel.com>, <jaden-yue@ti.com>,
        <yung-chuan.liao@linux.intel.com>, <dipa@ti.com>,
 <yuhsuan@google.com>,
        <henry.lo@ti.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
 <soyer@irl.hu>,
        <Baojun.Xu@fpt.com>, <judyhsiao@google.com>, <navada@ti.com>,
        <cujomalainey@google.com>, <aanya@ti.com>, <nayeem.mahmud@ti.com>,
        <savyasanchi.shukla@netradyne.com>, <flaviopr@microsoft.com>,
        <jesse-ji@ti.com>, <darren.ye@mediatek.com>,
        Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [PATCH v1] ASoc: TAS2781: replace beXX_to_cpup with
 get_unaligned_beXX for potentially broken alignment
Date: Sun, 7 Jul 2024 16:30:07 +0800
Message-ID: <20240707083011.98-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: EHHZPE7KDRXC4EQISXQEIXFNQQ2CBGEY
X-Message-ID-Hash: EHHZPE7KDRXC4EQISXQEIXFNQQ2CBGEY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EHHZPE7KDRXC4EQISXQEIXFNQQ2CBGEY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use get_unaligned_be16 instead of be16_to_cpup and get_unaligned_be32
instead of be32_to_cpup for potentially broken alignment.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - Add "#include <asm/unaligned.h>" for the declaration of
   get_unaligned_beXX
---
 sound/soc/codecs/tas2781-fmwlib.c | 71 +++++++++++++++----------------
 1 file changed, 35 insertions(+), 36 deletions(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 838d29fead96..63626b982d04 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -21,7 +21,7 @@
 #include <sound/soc.h>
 #include <sound/tlv.h>
 #include <sound/tas2781.h>
-
+#include <asm/unaligned.h>
 
 #define ERROR_PRAM_CRCCHK			0x0000000
 #define ERROR_YRAM_CRCCHK			0x0000001
@@ -187,8 +187,7 @@ static struct tasdevice_config_info *tasdevice_add_config(
 	/* convert data[offset], data[offset + 1], data[offset + 2] and
 	 * data[offset + 3] into host
 	 */
-	cfg_info->nblocks =
-		be32_to_cpup((__be32 *)&config_data[config_offset]);
+	cfg_info->nblocks = get_unaligned_be32(&config_data[config_offset]);
 	config_offset += 4;
 
 	/* Several kinds of dsp/algorithm firmwares can run on tas2781,
@@ -232,14 +231,14 @@ static struct tasdevice_config_info *tasdevice_add_config(
 
 		}
 		bk_da[i]->yram_checksum =
-			be16_to_cpup((__be16 *)&config_data[config_offset]);
+			get_unaligned_be16(&config_data[config_offset]);
 		config_offset += 2;
 		bk_da[i]->block_size =
-			be32_to_cpup((__be32 *)&config_data[config_offset]);
+			get_unaligned_be32(&config_data[config_offset]);
 		config_offset += 4;
 
 		bk_da[i]->n_subblks =
-			be32_to_cpup((__be32 *)&config_data[config_offset]);
+			get_unaligned_be32(&config_data[config_offset]);
 
 		config_offset += 4;
 
@@ -289,7 +288,7 @@ int tasdevice_rca_parser(void *context, const struct firmware *fmw)
 	}
 	buf = (unsigned char *)fmw->data;
 
-	fw_hdr->img_sz = be32_to_cpup((__be32 *)&buf[offset]);
+	fw_hdr->img_sz = get_unaligned_be32(&buf[offset]);
 	offset += 4;
 	if (fw_hdr->img_sz != fmw->size) {
 		dev_err(tas_priv->dev,
@@ -300,9 +299,9 @@ int tasdevice_rca_parser(void *context, const struct firmware *fmw)
 		goto out;
 	}
 
-	fw_hdr->checksum = be32_to_cpup((__be32 *)&buf[offset]);
+	fw_hdr->checksum = get_unaligned_be32(&buf[offset]);
 	offset += 4;
-	fw_hdr->binary_version_num = be32_to_cpup((__be32 *)&buf[offset]);
+	fw_hdr->binary_version_num = get_unaligned_be32(&buf[offset]);
 	if (fw_hdr->binary_version_num < 0x103) {
 		dev_err(tas_priv->dev, "File version 0x%04x is too low",
 			fw_hdr->binary_version_num);
@@ -311,7 +310,7 @@ int tasdevice_rca_parser(void *context, const struct firmware *fmw)
 		goto out;
 	}
 	offset += 4;
-	fw_hdr->drv_fw_version = be32_to_cpup((__be32 *)&buf[offset]);
+	fw_hdr->drv_fw_version = get_unaligned_be32(&buf[offset]);
 	offset += 8;
 	fw_hdr->plat_type = buf[offset];
 	offset += 1;
@@ -339,11 +338,11 @@ int tasdevice_rca_parser(void *context, const struct firmware *fmw)
 	for (i = 0; i < TASDEVICE_DEVICE_SUM; i++, offset++)
 		fw_hdr->devs[i] = buf[offset];
 
-	fw_hdr->nconfig = be32_to_cpup((__be32 *)&buf[offset]);
+	fw_hdr->nconfig = get_unaligned_be32(&buf[offset]);
 	offset += 4;
 
 	for (i = 0; i < TASDEVICE_CONFIG_SUM; i++) {
-		fw_hdr->config_size[i] = be32_to_cpup((__be32 *)&buf[offset]);
+		fw_hdr->config_size[i] = get_unaligned_be32(&buf[offset]);
 		offset += 4;
 		total_config_sz += fw_hdr->config_size[i];
 	}
@@ -423,7 +422,7 @@ static int fw_parse_block_data_kernel(struct tasdevice_fw *tas_fmw,
 	/* convert data[offset], data[offset + 1], data[offset + 2] and
 	 * data[offset + 3] into host
 	 */
-	block->type = be32_to_cpup((__be32 *)&data[offset]);
+	block->type = get_unaligned_be32(&data[offset]);
 	offset += 4;
 
 	block->is_pchksum_present = data[offset];
@@ -438,10 +437,10 @@ static int fw_parse_block_data_kernel(struct tasdevice_fw *tas_fmw,
 	block->ychksum = data[offset];
 	offset++;
 
-	block->blk_size = be32_to_cpup((__be32 *)&data[offset]);
+	block->blk_size = get_unaligned_be32(&data[offset]);
 	offset += 4;
 
-	block->nr_subblocks = be32_to_cpup((__be32 *)&data[offset]);
+	block->nr_subblocks = get_unaligned_be32(&data[offset]);
 	offset += 4;
 
 	/* fixed m68k compiling issue:
@@ -482,7 +481,7 @@ static int fw_parse_data_kernel(struct tasdevice_fw *tas_fmw,
 		offset = -EINVAL;
 		goto out;
 	}
-	img_data->nr_blk = be32_to_cpup((__be32 *)&data[offset]);
+	img_data->nr_blk = get_unaligned_be32(&data[offset]);
 	offset += 4;
 
 	img_data->dev_blks = kcalloc(img_data->nr_blk,
@@ -578,14 +577,14 @@ static int fw_parse_variable_header_kernel(
 		offset = -EINVAL;
 		goto out;
 	}
-	fw_hdr->device_family = be16_to_cpup((__be16 *)&buf[offset]);
+	fw_hdr->device_family = get_unaligned_be16(&buf[offset]);
 	if (fw_hdr->device_family != 0) {
 		dev_err(tas_priv->dev, "%s:not TAS device\n", __func__);
 		offset = -EINVAL;
 		goto out;
 	}
 	offset += 2;
-	fw_hdr->device = be16_to_cpup((__be16 *)&buf[offset]);
+	fw_hdr->device = get_unaligned_be16(&buf[offset]);
 	if (fw_hdr->device >= TASDEVICE_DSP_TAS_MAX_DEVICE ||
 		fw_hdr->device == 6) {
 		dev_err(tas_priv->dev, "Unsupported dev %d\n", fw_hdr->device);
@@ -603,7 +602,7 @@ static int fw_parse_variable_header_kernel(
 		goto out;
 	}
 
-	tas_fmw->nr_programs = be32_to_cpup((__be32 *)&buf[offset]);
+	tas_fmw->nr_programs = get_unaligned_be32(&buf[offset]);
 	offset += 4;
 
 	if (tas_fmw->nr_programs == 0 || tas_fmw->nr_programs >
@@ -622,14 +621,14 @@ static int fw_parse_variable_header_kernel(
 
 	for (i = 0; i < tas_fmw->nr_programs; i++) {
 		program = &(tas_fmw->programs[i]);
-		program->prog_size = be32_to_cpup((__be32 *)&buf[offset]);
+		program->prog_size = get_unaligned_be32(&buf[offset]);
 		offset += 4;
 	}
 
 	/* Skip the unused prog_size */
 	offset += 4 * (TASDEVICE_MAXPROGRAM_NUM_KERNEL - tas_fmw->nr_programs);
 
-	tas_fmw->nr_configurations = be32_to_cpup((__be32 *)&buf[offset]);
+	tas_fmw->nr_configurations = get_unaligned_be32(&buf[offset]);
 	offset += 4;
 
 	/* The max number of config in firmware greater than 4 pieces of
@@ -661,7 +660,7 @@ static int fw_parse_variable_header_kernel(
 
 	for (i = 0; i < tas_fmw->nr_programs; i++) {
 		config = &(tas_fmw->configs[i]);
-		config->cfg_size = be32_to_cpup((__be32 *)&buf[offset]);
+		config->cfg_size = get_unaligned_be32(&buf[offset]);
 		offset += 4;
 	}
 
@@ -699,7 +698,7 @@ static int tasdevice_process_block(void *context, unsigned char *data,
 		switch (subblk_typ) {
 		case TASDEVICE_CMD_SING_W: {
 			int i;
-			unsigned short len = be16_to_cpup((__be16 *)&data[2]);
+			unsigned short len = get_unaligned_be16(&data[2]);
 
 			subblk_offset += 2;
 			if (subblk_offset + 4 * len > sublocksize) {
@@ -725,7 +724,7 @@ static int tasdevice_process_block(void *context, unsigned char *data,
 		}
 			break;
 		case TASDEVICE_CMD_BURST: {
-			unsigned short len = be16_to_cpup((__be16 *)&data[2]);
+			unsigned short len = get_unaligned_be16(&data[2]);
 
 			subblk_offset += 2;
 			if (subblk_offset + 4 + len > sublocksize) {
@@ -766,7 +765,7 @@ static int tasdevice_process_block(void *context, unsigned char *data,
 				is_err = true;
 				break;
 			}
-			sleep_time = be16_to_cpup((__be16 *)&data[2]) * 1000;
+			sleep_time = get_unaligned_be16(&data[2]) * 1000;
 			usleep_range(sleep_time, sleep_time + 50);
 			subblk_offset += 2;
 		}
@@ -910,7 +909,7 @@ static int fw_parse_variable_hdr(struct tasdevice_priv
 
 	offset += len;
 
-	fw_hdr->device_family = be32_to_cpup((__be32 *)&buf[offset]);
+	fw_hdr->device_family = get_unaligned_be32(&buf[offset]);
 	if (fw_hdr->device_family != 0) {
 		dev_err(tas_priv->dev, "%s: not TAS device\n", __func__);
 		offset = -EINVAL;
@@ -918,7 +917,7 @@ static int fw_parse_variable_hdr(struct tasdevice_priv
 	}
 	offset += 4;
 
-	fw_hdr->device = be32_to_cpup((__be32 *)&buf[offset]);
+	fw_hdr->device = get_unaligned_be32(&buf[offset]);
 	if (fw_hdr->device >= TASDEVICE_DSP_TAS_MAX_DEVICE ||
 		fw_hdr->device == 6) {
 		dev_err(tas_priv->dev, "Unsupported dev %d\n", fw_hdr->device);
@@ -963,7 +962,7 @@ static int fw_parse_block_data(struct tasdevice_fw *tas_fmw,
 		offset = -EINVAL;
 		goto out;
 	}
-	block->type = be32_to_cpup((__be32 *)&data[offset]);
+	block->type = get_unaligned_be32(&data[offset]);
 	offset += 4;
 
 	if (tas_fmw->fw_hdr.fixed_hdr.drv_ver >= PPC_DRIVER_CRCCHK) {
@@ -988,7 +987,7 @@ static int fw_parse_block_data(struct tasdevice_fw *tas_fmw,
 		block->is_ychksum_present = 0;
 	}
 
-	block->nr_cmds = be32_to_cpup((__be32 *)&data[offset]);
+	block->nr_cmds = get_unaligned_be32(&data[offset]);
 	offset += 4;
 
 	n = block->nr_cmds * 4;
@@ -1039,7 +1038,7 @@ static int fw_parse_data(struct tasdevice_fw *tas_fmw,
 		goto out;
 	}
 	offset += n;
-	img_data->nr_blk = be16_to_cpup((__be16 *)&data[offset]);
+	img_data->nr_blk = get_unaligned_be16(&data[offset]);
 	offset += 2;
 
 	img_data->dev_blks = kcalloc(img_data->nr_blk,
@@ -1076,7 +1075,7 @@ static int fw_parse_program_data(struct tasdevice_priv *tas_priv,
 		offset = -EINVAL;
 		goto out;
 	}
-	tas_fmw->nr_programs = be16_to_cpup((__be16 *)&buf[offset]);
+	tas_fmw->nr_programs = get_unaligned_be16(&buf[offset]);
 	offset += 2;
 
 	if (tas_fmw->nr_programs == 0) {
@@ -1143,7 +1142,7 @@ static int fw_parse_configuration_data(
 		offset = -EINVAL;
 		goto out;
 	}
-	tas_fmw->nr_configurations = be16_to_cpup((__be16 *)&data[offset]);
+	tas_fmw->nr_configurations = get_unaligned_be16(&data[offset]);
 	offset += 2;
 
 	if (tas_fmw->nr_configurations == 0) {
@@ -1775,7 +1774,7 @@ static int fw_parse_header(struct tasdevice_priv *tas_priv,
 	/* Convert data[offset], data[offset + 1], data[offset + 2] and
 	 * data[offset + 3] into host
 	 */
-	fw_fixed_hdr->fwsize = be32_to_cpup((__be32 *)&buf[offset]);
+	fw_fixed_hdr->fwsize = get_unaligned_be32(&buf[offset]);
 	offset += 4;
 	if (fw_fixed_hdr->fwsize != fmw->size) {
 		dev_err(tas_priv->dev, "File size not match, %lu %u",
@@ -1784,9 +1783,9 @@ static int fw_parse_header(struct tasdevice_priv *tas_priv,
 		goto out;
 	}
 	offset += 4;
-	fw_fixed_hdr->ppcver = be32_to_cpup((__be32 *)&buf[offset]);
+	fw_fixed_hdr->ppcver = get_unaligned_be32(&buf[offset]);
 	offset += 8;
-	fw_fixed_hdr->drv_ver = be32_to_cpup((__be32 *)&buf[offset]);
+	fw_fixed_hdr->drv_ver = get_unaligned_be32(&buf[offset]);
 	offset += 72;
 
  out:
@@ -1828,7 +1827,7 @@ static int fw_parse_calibration_data(struct tasdevice_priv *tas_priv,
 		offset = -EINVAL;
 		goto out;
 	}
-	tas_fmw->nr_calibrations = be16_to_cpup((__be16 *)&data[offset]);
+	tas_fmw->nr_calibrations = get_unaligned_be16(&data[offset]);
 	offset += 2;
 
 	if (tas_fmw->nr_calibrations != 1) {
-- 
2.34.1

