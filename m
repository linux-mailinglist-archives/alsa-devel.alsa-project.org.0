Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B38501B66
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 20:53:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95AC31932;
	Thu, 14 Apr 2022 20:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95AC31932
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649962427;
	bh=H4ktIngn7owDJMgeZYmLjN8VDxt0GwWUrGgQvTIdfxc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mlt9Ub9fe4Ry4UtN6OUwhh7BjO4gpwPX+jRVwxb2L/1Hsg74rY4GgMVBhb6JQrLvV
	 A40tSFAitZu7DyHQ2il6MjY/KwA9JLEel3STnpDF7pUen7xQ0Szr4MRpEhKT4s8Rl/
	 tN7gAVqVT2fk3z29wyL+A8XXFccM7wp0SHBfhFgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 406ADF8058C;
	Thu, 14 Apr 2022 20:49:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D490F80563; Thu, 14 Apr 2022 20:49:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69F63F80516
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 20:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69F63F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="a9peyUTp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649962141; x=1681498141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H4ktIngn7owDJMgeZYmLjN8VDxt0GwWUrGgQvTIdfxc=;
 b=a9peyUTpKTKVDfqSk2NNSapCA4mFbbEhFnht7192umyifRIH7wHdc6PU
 /m9bWWuDaS66saEM99pBSZSahdBluMS2EQXLgu3Q3DPM0hbfAMLGVmO3t
 TdCEjAOpYERl3uiNo00jVYpyJF9g/ZteoXvAeEbQ6Yh3AT52DKHVO3/2U
 BaGkvxUWPnIwmk4HvW/lVPzJPRuBgnZbawZFTPehQKjnhYrJV4So5r8r4
 QXFN6H6momZgAf5ekr/9aWulLzTLi51KTBn9nfjvcCU/sk0PSC8bfqE27
 rQ08+7af1cl00n+dYr5vJdfbn5lFHxuF8VDnhRxczFsoBlNyWFGZDK6eT g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="349442363"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="349442363"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:45 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="560304653"
Received: from rrsolima-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.130.212])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 13/15] ASoC: SOF: Intel: hda: Define rom_status_reg in
 sof_intel_dsp_desc
Date: Thu, 14 Apr 2022 13:48:15 -0500
Message-Id: <20220414184817.362215-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
References: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add the rom_status_reg field to struct sof_intel_dsp_desc and define
it for HDA platforms. This will be used to check the ROM status during
FW boot.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/apl.c        |  1 +
 sound/soc/sof/intel/cnl.c        |  2 ++
 sound/soc/sof/intel/hda-loader.c | 14 ++++++++------
 sound/soc/sof/intel/hda.c        |  8 ++++++--
 sound/soc/sof/intel/icl.c        |  1 +
 sound/soc/sof/intel/shim.h       |  1 +
 sound/soc/sof/intel/tgl.c        |  4 ++++
 7 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index b3e3f2494c74..4762846d8a33 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -71,6 +71,7 @@ const struct sof_intel_dsp_desc apl_chip_info = {
 	.ipc_ack = HDA_DSP_REG_HIPCIE,
 	.ipc_ack_mask = HDA_DSP_REG_HIPCIE_DONE,
 	.ipc_ctl = HDA_DSP_REG_HIPCCTL,
+	.rom_status_reg = HDA_DSP_SRAM_REG_ROM_STATUS,
 	.rom_init_timeout	= 150,
 	.ssp_count = APL_SSP_COUNT,
 	.ssp_base_offset = APL_SSP_BASE_OFFSET,
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index ab1f45bfc83b..86b683486f06 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -289,6 +289,7 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	.ipc_ack = CNL_DSP_REG_HIPCIDA,
 	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
 	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
+	.rom_status_reg = HDA_DSP_SRAM_REG_ROM_STATUS,
 	.rom_init_timeout	= 300,
 	.ssp_count = CNL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
@@ -316,6 +317,7 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	.ipc_ack = CNL_DSP_REG_HIPCIDA,
 	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
 	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
+	.rom_status_reg = HDA_DSP_SRAM_REG_ROM_STATUS,
 	.rom_init_timeout	= 300,
 	.ssp_count = ICL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 625bc1e67f1e..f6c50ee526fa 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -171,7 +171,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 
 	/* step 7: wait for ROM init */
 	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
-					HDA_DSP_SRAM_REG_ROM_STATUS, status,
+					chip->rom_status_reg, status,
 					((status & HDA_DSP_ROM_STS_MASK)
 						== HDA_DSP_ROM_INIT),
 					HDA_DSP_REG_POLL_INTERVAL_US,
@@ -188,8 +188,8 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 
 	if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 		dev_err(sdev->dev,
-			"error: %s: timeout HDA_DSP_SRAM_REG_ROM_STATUS read\n",
-			__func__);
+			"%s: timeout with rom_status_reg (%#x) read\n",
+			__func__, chip->rom_status_reg);
 
 err:
 	flags = SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX | SOF_DBG_DUMP_OPTIONAL;
@@ -268,6 +268,8 @@ static int cl_cleanup(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 
 static int cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
 	unsigned int reg;
 	int ret, status;
 
@@ -278,7 +280,7 @@ static int cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_str
 	}
 
 	status = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
-					HDA_DSP_SRAM_REG_ROM_STATUS, reg,
+					chip->rom_status_reg, reg,
 					((reg & HDA_DSP_ROM_STS_MASK)
 						== HDA_DSP_ROM_FW_ENTERED),
 					HDA_DSP_REG_POLL_INTERVAL_US,
@@ -291,8 +293,8 @@ static int cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_str
 
 	if (status < 0) {
 		dev_err(sdev->dev,
-			"error: %s: timeout HDA_DSP_SRAM_REG_ROM_STATUS read\n",
-			__func__);
+			"%s: timeout with rom_status_reg (%#x) read\n",
+			__func__, chip->rom_status_reg);
 	}
 
 	ret = cl_trigger(sdev, hext_stream, SNDRV_PCM_TRIGGER_STOP);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index af3693d820fd..d34cd4d341c5 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -406,11 +406,13 @@ static const struct hda_dsp_msg_code hda_dsp_rom_msg[] = {
 
 static void hda_dsp_get_status(struct snd_sof_dev *sdev, const char *level)
 {
+	const struct sof_intel_dsp_desc *chip;
 	u32 status;
 	int i;
 
+	chip = get_chip_info(sdev->pdata);
 	status = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
-				  HDA_DSP_SRAM_REG_ROM_STATUS);
+				  chip->rom_status_reg);
 
 	for (i = 0; i < ARRAY_SIZE(hda_dsp_rom_msg); i++) {
 		if (status == hda_dsp_rom_msg[i].code) {
@@ -456,13 +458,15 @@ static void hda_dsp_get_registers(struct snd_sof_dev *sdev,
 static void hda_dsp_dump_ext_rom_status(struct snd_sof_dev *sdev, const char *level,
 					u32 flags)
 {
+	const struct sof_intel_dsp_desc *chip;
 	char msg[128];
 	int len = 0;
 	u32 value;
 	int i;
 
+	chip = get_chip_info(sdev->pdata);
 	for (i = 0; i < HDA_EXT_ROM_STATUS_SIZE; i++) {
-		value = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_SRAM_REG_ROM_STATUS + i * 0x4);
+		value = snd_sof_dsp_read(sdev, HDA_DSP_BAR, chip->rom_status_reg + i * 0x4);
 		len += snprintf(msg + len, sizeof(msg) - len, " 0x%x", value);
 	}
 
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 964014239afd..2e4d371f7860 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -134,6 +134,7 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	.ipc_ack = CNL_DSP_REG_HIPCIDA,
 	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
 	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
+	.rom_status_reg = HDA_DSP_SRAM_REG_ROM_STATUS,
 	.rom_init_timeout	= 300,
 	.ssp_count = ICL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index fd64377de9a0..3eb09941ae6e 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -164,6 +164,7 @@ struct sof_intel_dsp_desc {
 	int ipc_ack;
 	int ipc_ack_mask;
 	int ipc_ctl;
+	int rom_status_reg;
 	int rom_init_timeout;
 	int ssp_count;			/* ssp count of the platform */
 	int ssp_base_offset;		/* base address of the SSPs */
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index d0f805c67d5b..32d7e15126c2 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -105,6 +105,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.ipc_ack = CNL_DSP_REG_HIPCIDA,
 	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
 	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
+	.rom_status_reg = HDA_DSP_SRAM_REG_ROM_STATUS,
 	.rom_init_timeout	= 300,
 	.ssp_count = ICL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
@@ -125,6 +126,7 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 	.ipc_ack = CNL_DSP_REG_HIPCIDA,
 	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
 	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
+	.rom_status_reg = HDA_DSP_SRAM_REG_ROM_STATUS,
 	.rom_init_timeout	= 300,
 	.ssp_count = ICL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
@@ -145,6 +147,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.ipc_ack = CNL_DSP_REG_HIPCIDA,
 	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
 	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
+	.rom_status_reg = HDA_DSP_SRAM_REG_ROM_STATUS,
 	.rom_init_timeout	= 300,
 	.ssp_count = ICL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
@@ -165,6 +168,7 @@ const struct sof_intel_dsp_desc adls_chip_info = {
 	.ipc_ack = CNL_DSP_REG_HIPCIDA,
 	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
 	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
+	.rom_status_reg = HDA_DSP_SRAM_REG_ROM_STATUS,
 	.rom_init_timeout	= 300,
 	.ssp_count = ICL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
-- 
2.30.2

