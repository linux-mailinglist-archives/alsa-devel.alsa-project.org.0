Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DED1AB283
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:32:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 823F3852;
	Wed, 15 Apr 2020 22:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 823F3852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586982746;
	bh=sAIwtCm9bpq1aLkb4xKrVEUwnsvaxtB8liQnTo9yGI4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tbKDALkkPiwYNPws/pn2atEpOF54nCDP4Hax7jUAV8sxCtgASLp8QRk0q7mJ/fdUI
	 /F/Q6eMiz2ZaiFx5ZbMSt6IjfNTZhmFPG7U0yTc8Sru6oMJHIQ2pyh2lI7Ja5UTHAl
	 5ifOQ2lY6ZLojofr2SCCjtjDb0H6jqe3feG6/Sqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C35A6F80299;
	Wed, 15 Apr 2020 22:29:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 939D8F80124; Wed, 15 Apr 2020 22:29:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39667F80124
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39667F80124
IronPort-SDR: oWyni8ldOQLddNXqTOVv5VsjpVIK/7NiuziaL8r9wuLrg3eeiURBs1QlZO875uA2BZRrQb+NJk
 GpgbgaN0/p0w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:28:53 -0700
IronPort-SDR: 2B3cy3yX3ypLGGIJOdFYqtZHLz+tiFU/5/IzkVgIbu2+9ag7etJE5Y7XAa8v5CoU2/cKAMtiKH
 ss0xJRIDzGMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656237"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:28:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/24] ASoC: SOF: Introduce offset in firmware data
Date: Wed, 15 Apr 2020 15:27:55 -0500
Message-Id: <20200415202816.934-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
References: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Karol Trzcinski <karolx.trzcinski@linux.intel.com>
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

From: Karol Trzcinski <karolx.trzcinski@linux.intel.com>

It makes possible to provide extra information to host
before downloading firmware. Extra data should be put
at the beginning of firmware binary.
Exchange is done without any effort on DSP side.
This mechanism will be used in extended manifest.

Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof.h              |  3 +++
 sound/soc/sof/intel/hda-loader.c |  9 +++++++--
 sound/soc/sof/loader.c           | 29 +++++++++++++++++++----------
 3 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index a0cbca021230..969f554b0b7d 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -27,6 +27,9 @@ struct snd_sof_pdata {
 
 	struct device *dev;
 
+	/* indicate how many first bytes shouldn't be loaded into DSP memory. */
+	size_t fw_offset;
+
 	/*
 	 * notification callback used if the hardware initialization
 	 * can take time or is handled in a workqueue. This callback
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index e1550ccd0a49..1beaaf5879e2 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -293,8 +293,13 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 
 	chip_info = desc->chip_info;
 
-	stripped_firmware.data = plat_data->fw->data;
-	stripped_firmware.size = plat_data->fw->size;
+	if (plat_data->fw->size < plat_data->fw_offset) {
+		dev_err(sdev->dev, "error: firmware size must be greater than firmware offset\n");
+		return -EINVAL;
+	}
+
+	stripped_firmware.data = plat_data->fw->data + plat_data->fw_offset;
+	stripped_firmware.size = plat_data->fw->size - plat_data->fw_offset;
 
 	/* init for booting wait */
 	init_waitqueue_head(&sdev->boot_wait);
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 312f7fffcb2c..89f35db2577d 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -379,12 +379,19 @@ int snd_sof_parse_module_memcpy(struct snd_sof_dev *sdev,
 }
 EXPORT_SYMBOL(snd_sof_parse_module_memcpy);
 
-static int check_header(struct snd_sof_dev *sdev, const struct firmware *fw)
+static int check_header(struct snd_sof_dev *sdev, const struct firmware *fw,
+			size_t fw_offset)
 {
 	struct snd_sof_fw_header *header;
+	size_t fw_size = fw->size - fw_offset;
+
+	if (fw->size < fw_offset) {
+		dev_err(sdev->dev, "error: firmware size must be greater than firmware offset\n");
+		return -EINVAL;
+	}
 
 	/* Read the header information from the data pointer */
-	header = (struct snd_sof_fw_header *)fw->data;
+	header = (struct snd_sof_fw_header *)(fw->data + fw_offset);
 
 	/* verify FW sig */
 	if (strncmp(header->sig, SND_SOF_FW_SIG, SND_SOF_FW_SIG_SIZE) != 0) {
@@ -393,9 +400,9 @@ static int check_header(struct snd_sof_dev *sdev, const struct firmware *fw)
 	}
 
 	/* check size is valid */
-	if (fw->size != header->file_size + sizeof(*header)) {
+	if (fw_size != header->file_size + sizeof(*header)) {
 		dev_err(sdev->dev, "error: invalid filesize mismatch got 0x%zx expected 0x%zx\n",
-			fw->size, header->file_size + sizeof(*header));
+			fw_size, header->file_size + sizeof(*header));
 		return -EINVAL;
 	}
 
@@ -406,7 +413,8 @@ static int check_header(struct snd_sof_dev *sdev, const struct firmware *fw)
 	return 0;
 }
 
-static int load_modules(struct snd_sof_dev *sdev, const struct firmware *fw)
+static int load_modules(struct snd_sof_dev *sdev, const struct firmware *fw,
+			size_t fw_offset)
 {
 	struct snd_sof_fw_header *header;
 	struct snd_sof_mod_hdr *module;
@@ -415,14 +423,15 @@ static int load_modules(struct snd_sof_dev *sdev, const struct firmware *fw)
 	int ret, count;
 	size_t remaining;
 
-	header = (struct snd_sof_fw_header *)fw->data;
+	header = (struct snd_sof_fw_header *)(fw->data + fw_offset);
 	load_module = sof_ops(sdev)->load_module;
 	if (!load_module)
 		return -EINVAL;
 
 	/* parse each module */
-	module = (struct snd_sof_mod_hdr *)((u8 *)(fw->data) + sizeof(*header));
-	remaining = fw->size - sizeof(*header);
+	module = (struct snd_sof_mod_hdr *)(fw->data + fw_offset +
+					    sizeof(*header));
+	remaining = fw->size - sizeof(*header) - fw_offset;
 	/* check for wrap */
 	if (remaining > fw->size) {
 		dev_err(sdev->dev, "error: fw size smaller than header size\n");
@@ -502,7 +511,7 @@ int snd_sof_load_firmware_memcpy(struct snd_sof_dev *sdev)
 		return ret;
 
 	/* make sure the FW header and file is valid */
-	ret = check_header(sdev, plat_data->fw);
+	ret = check_header(sdev, plat_data->fw, plat_data->fw_offset);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: invalid FW header\n");
 		goto error;
@@ -516,7 +525,7 @@ int snd_sof_load_firmware_memcpy(struct snd_sof_dev *sdev)
 	}
 
 	/* parse and load firmware modules to DSP */
-	ret = load_modules(sdev, plat_data->fw);
+	ret = load_modules(sdev, plat_data->fw, plat_data->fw_offset);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: invalid FW modules\n");
 		goto error;
-- 
2.20.1

