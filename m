Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D44D2605FDA
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:14:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6235AB932;
	Thu, 20 Oct 2022 14:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6235AB932
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666268049;
	bh=Y1rcYmThX2owFrcbBdOMXqBDMA6/eYfKWheBi2Oua+A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cf7GNePHBoXanpowZVJDHeXg/jyXTCtbraw40Cunsd2tstyMkb3wppHZEFFDBjg9A
	 oNXG2yqhJjnJ1HShxMIsFQm9g89dZYM0HJaQQ0+yWdwIf0Cdk0pCaC7FgUXnj7zSJ7
	 F/i7J+CxXYronOuQpPGelBX3qb4zVrNmQEKfvKwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2103F80552;
	Thu, 20 Oct 2022 14:12:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D572FF80552; Thu, 20 Oct 2022 14:12:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F15DF804E5
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F15DF804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="g/J8twqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666267946; x=1697803946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y1rcYmThX2owFrcbBdOMXqBDMA6/eYfKWheBi2Oua+A=;
 b=g/J8twqMNfUu0htsAOOqq4KvcwM+WngrS6/KrVtd45C1C1Y8nQGdaNxm
 P9msq6IEzX800cHzD3vnYv2zookVHtaoLgz4m1g62voIA55CGUs3xL4vV
 Je8FntTqHf2GhrcBKFkvHBe/Bk6JctbtAa7JoCpiUUhQxZvoI7dAPWAjz
 Rb2lgNVltTcGlMc8JJkMQxGc1iUj/Q5PiYvHQo4Q/kbGUfs8Qo0ru1ydb
 0lI+IVidOB14GxU92Ki+K0cTCm6Xx8hSe8JbDFFFwQJbI1quakETsH+sO
 BOeSl9Ftj3DxZJ79gMET1eLyWo79KzaMa5wCQpiw0+3U3jKJJIVuxiuyt w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333256284"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="333256284"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:22 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="663009858"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="663009858"
Received: from awrynn-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.12.86])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:20 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 02/19] ASoC: SOF: Introduce container struct for SOF
 firmware
Date: Thu, 20 Oct 2022 15:12:21 +0300
Message-Id: <20221020121238.18339-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
References: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 chao.song@intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Move the firmware related information under a new struct (sof_firmware)
and add it to the high level snd_sof_dev struct.

Convert the generic code to use this new container when working with the
basefw and for compatibility reasons set the old plat_data members used by
the platforms.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc3-loader.c | 26 ++++++++++++--------------
 sound/soc/sof/ipc4-loader.c |  6 ++----
 sound/soc/sof/loader.c      | 18 +++++++++++++-----
 sound/soc/sof/sof-priv.h    | 14 ++++++++++++++
 4 files changed, 41 insertions(+), 23 deletions(-)

diff --git a/sound/soc/sof/ipc3-loader.c b/sound/soc/sof/ipc3-loader.c
index bf423ca4e97b..28218766d211 100644
--- a/sound/soc/sof/ipc3-loader.c
+++ b/sound/soc/sof/ipc3-loader.c
@@ -138,8 +138,7 @@ static ssize_t ipc3_fw_ext_man_size(struct snd_sof_dev *sdev, const struct firmw
 
 static size_t sof_ipc3_fw_parse_ext_man(struct snd_sof_dev *sdev)
 {
-	struct snd_sof_pdata *plat_data = sdev->pdata;
-	const struct firmware *fw = plat_data->fw;
+	const struct firmware *fw = sdev->basefw.fw;
 	const struct sof_ext_man_elem_header *elem_hdr;
 	const struct sof_ext_man_header *head;
 	ssize_t ext_man_size;
@@ -310,18 +309,18 @@ static int sof_ipc3_parse_module_memcpy(struct snd_sof_dev *sdev,
 
 static int sof_ipc3_load_fw_to_dsp(struct snd_sof_dev *sdev)
 {
-	struct snd_sof_pdata *plat_data = sdev->pdata;
-	const struct firmware *fw = plat_data->fw;
+	u32 payload_offset = sdev->basefw.payload_offset;
+	const struct firmware *fw = sdev->basefw.fw;
 	struct snd_sof_fw_header *header;
 	struct snd_sof_mod_hdr *module;
 	int (*load_module)(struct snd_sof_dev *sof_dev, struct snd_sof_mod_hdr *hdr);
 	size_t remaining;
 	int ret, count;
 
-	if (!plat_data->fw)
+	if (!fw)
 		return -EINVAL;
 
-	header = (struct snd_sof_fw_header *)(fw->data + plat_data->fw_offset);
+	header = (struct snd_sof_fw_header *)(fw->data + payload_offset);
 	load_module = sof_ops(sdev)->load_module;
 	if (!load_module) {
 		dev_dbg(sdev->dev, "Using generic module loading\n");
@@ -331,9 +330,8 @@ static int sof_ipc3_load_fw_to_dsp(struct snd_sof_dev *sdev)
 	}
 
 	/* parse each module */
-	module = (struct snd_sof_mod_hdr *)(fw->data + plat_data->fw_offset +
-					    sizeof(*header));
-	remaining = fw->size - sizeof(*header) - plat_data->fw_offset;
+	module = (struct snd_sof_mod_hdr *)(fw->data + payload_offset + sizeof(*header));
+	remaining = fw->size - sizeof(*header) - payload_offset;
 	/* check for wrap */
 	if (remaining > fw->size) {
 		dev_err(sdev->dev, "%s: fw size smaller than header size\n", __func__);
@@ -374,19 +372,19 @@ static int sof_ipc3_load_fw_to_dsp(struct snd_sof_dev *sdev)
 
 static int sof_ipc3_validate_firmware(struct snd_sof_dev *sdev)
 {
-	struct snd_sof_pdata *plat_data = sdev->pdata;
-	const struct firmware *fw = plat_data->fw;
+	u32 payload_offset = sdev->basefw.payload_offset;
+	const struct firmware *fw = sdev->basefw.fw;
 	struct snd_sof_fw_header *header;
-	size_t fw_size = fw->size - plat_data->fw_offset;
+	size_t fw_size = fw->size - payload_offset;
 
-	if (fw->size <= plat_data->fw_offset) {
+	if (fw->size <= payload_offset) {
 		dev_err(sdev->dev,
 			"firmware size must be greater than firmware offset\n");
 		return -EINVAL;
 	}
 
 	/* Read the header information from the data pointer */
-	header = (struct snd_sof_fw_header *)(fw->data + plat_data->fw_offset);
+	header = (struct snd_sof_fw_header *)(fw->data + payload_offset);
 
 	/* verify FW sig */
 	if (strncmp(header->sig, SND_SOF_FW_SIG, SND_SOF_FW_SIG_SIZE) != 0) {
diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index e635ae515fa9..9f433e9b4cd3 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -17,9 +17,8 @@
 static size_t sof_ipc4_fw_parse_ext_man(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
-	struct snd_sof_pdata *plat_data = sdev->pdata;
 	struct sof_man4_fw_binary_header *fw_header;
-	const struct firmware *fw = plat_data->fw;
+	const struct firmware *fw = sdev->basefw.fw;
 	struct sof_ext_manifest4_hdr *ext_man_hdr;
 	struct sof_man4_module_config *fm_config;
 	struct sof_ipc4_fw_module *fw_module;
@@ -138,9 +137,8 @@ static int sof_ipc4_validate_firmware(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	u32 fw_hdr_offset = ipc4_data->manifest_fw_hdr_offset;
-	struct snd_sof_pdata *plat_data = sdev->pdata;
 	struct sof_man4_fw_binary_header *fw_header;
-	const struct firmware *fw = plat_data->fw;
+	const struct firmware *fw = sdev->basefw.fw;
 	struct sof_ext_manifest4_hdr *ext_man_hdr;
 
 	ext_man_hdr = (struct sof_ext_manifest4_hdr *)fw->data;
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 59e6be59258e..1e31b7c296e7 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -22,7 +22,7 @@ int snd_sof_load_firmware_raw(struct snd_sof_dev *sdev)
 	int ret;
 
 	/* Don't request firmware again if firmware is already requested */
-	if (plat_data->fw)
+	if (sdev->basefw.fw)
 		return 0;
 
 	fw_filename = kasprintf(GFP_KERNEL, "%s/%s",
@@ -31,7 +31,7 @@ int snd_sof_load_firmware_raw(struct snd_sof_dev *sdev)
 	if (!fw_filename)
 		return -ENOMEM;
 
-	ret = request_firmware(&plat_data->fw, fw_filename, sdev->dev);
+	ret = request_firmware(&sdev->basefw.fw, fw_filename, sdev->dev);
 
 	if (ret < 0) {
 		dev_err(sdev->dev,
@@ -48,7 +48,7 @@ int snd_sof_load_firmware_raw(struct snd_sof_dev *sdev)
 	ext_man_size = sdev->ipc->ops->fw_loader->parse_ext_manifest(sdev);
 	if (ext_man_size > 0) {
 		/* when no error occurred, drop extended manifest */
-		plat_data->fw_offset = ext_man_size;
+		sdev->basefw.payload_offset = ext_man_size;
 	} else if (!ext_man_size) {
 		/* No extended manifest, so nothing to skip during FW load */
 		dev_dbg(sdev->dev, "firmware doesn't contain extended manifest\n");
@@ -58,6 +58,12 @@ int snd_sof_load_firmware_raw(struct snd_sof_dev *sdev)
 			fw_filename, ret);
 	}
 
+	/*
+	 * Until the platform code is switched to use the new container the fw
+	 * and payload offset must be set in plat_data
+	 */
+	plat_data->fw = sdev->basefw.fw;
+	plat_data->fw_offset = sdev->basefw.payload_offset;
 err:
 	kfree(fw_filename);
 
@@ -100,7 +106,8 @@ int snd_sof_load_firmware_memcpy(struct snd_sof_dev *sdev)
 	return 0;
 
 error:
-	release_firmware(plat_data->fw);
+	release_firmware(sdev->basefw.fw);
+	sdev->basefw.fw = NULL;
 	plat_data->fw = NULL;
 	return ret;
 
@@ -185,7 +192,8 @@ EXPORT_SYMBOL(snd_sof_run_firmware);
 void snd_sof_fw_unload(struct snd_sof_dev *sdev)
 {
 	/* TODO: support module unloading at runtime */
-	release_firmware(sdev->pdata->fw);
+	release_firmware(sdev->basefw.fw);
+	sdev->basefw.fw = NULL;
 	sdev->pdata->fw = NULL;
 }
 EXPORT_SYMBOL(snd_sof_fw_unload);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index de08825915b3..3d70b57e4864 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -136,6 +136,17 @@ struct snd_sof_platform_stream_params {
 	bool cont_update_posn;
 };
 
+/**
+ * struct sof_firmware - Container struct for SOF firmware
+ * @fw:			Pointer to the firmware
+ * @payload_offset:	Offset of the data within the loaded firmware image to be
+ *			loaded to the DSP (skipping for example ext_manifest section)
+ */
+struct sof_firmware {
+	const struct firmware *fw;
+	u32 payload_offset;
+};
+
 /*
  * SOF DSP HW abstraction operations.
  * Used to abstract DSP HW architecture and any IO busses between host CPU
@@ -487,6 +498,9 @@ struct snd_sof_dev {
 	spinlock_t ipc_lock;	/* lock for IPC users */
 	spinlock_t hw_lock;	/* lock for HW IO access */
 
+	/* Main, Base firmware image */
+	struct sof_firmware basefw;
+
 	/*
 	 * ASoC components. plat_drv fields are set dynamically so
 	 * can't use const
-- 
2.38.1

