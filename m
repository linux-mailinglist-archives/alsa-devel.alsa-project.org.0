Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D33571AA3
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 14:58:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACE181685;
	Tue, 12 Jul 2022 14:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACE181685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657630711;
	bh=jCbQ3mBGQ4VQmuWIGAaoFnb+XcFXJ4lRE9YX1c/iSaE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y/5gGhtorL237gGvHS5fLFPZFHgOPmK15WqSG8BYmejEKipPU0X1R20SFUIIh3+Qt
	 CS8WGouEyofHPOslM4lnnxjOZDv1OGSU9U8Go5U5vRlo8P6zTiSDm8key8emQFD6zf
	 Z0YvKF5+SqsGoD3AtDHCu/2JzqVL3DaYuQBPfrNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99065F80506;
	Tue, 12 Jul 2022 14:57:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D31A7F80506; Tue, 12 Jul 2022 14:57:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33CCDF8012B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 14:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33CCDF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Kk7qu7Ds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657630616; x=1689166616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jCbQ3mBGQ4VQmuWIGAaoFnb+XcFXJ4lRE9YX1c/iSaE=;
 b=Kk7qu7Dsnw1UbFOpt0Yco737y129nbvfa/M8Odo+ijXs3cr+5tbwmSrt
 gqQLW8RCqtMpfVfftupHgrVqRd5ekJxpRDfLAJZayFD4dpWBITtVOpoVl
 7+H2pxoevQ141Le113ijtp8E6DlbiRd3gIDD7L9MyFowCVZGIYCxITSPX
 XvjTtuHP4VG6lgu4RGghh6Th39KL5nSk0O6ImC8qWZ6UPAiuYPE6IjCWT
 t2fmRxLSjK4jwnuCqaklpLaR0lIR34iKM4IuNbWU+m3lDCkW9V+Mr5Zb4
 xF2Vo8TjUIvIhfgFswwTTgobAHjxB53aEcE6vE/CCPmDGJVQq2rI9tSoM g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="346607576"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="346607576"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 05:56:51 -0700
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="662942897"
Received: from ahedstro-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.175])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 05:56:49 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 1/3] ASoC: SOF: Intel: hda: Correct the ROM/FW state reporting
 code
Date: Tue, 12 Jul 2022 15:57:32 +0300
Message-Id: <20220712125734.30512-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220712125734.30512-1-peter.ujfalusi@linux.intel.com>
References: <20220712125734.30512-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

The FSR (Firmware State Register) can be found at offset 0 in the SRAM and
it is holding information about the state of the ROM/FW.
In case of a boot failure it can be used to get the state where the boot
process got stuck, it does not itself contains error codes as such.

The error code (or the firmware state information) is stored in the next
soft register at offset 0x4.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 147 ++++++++++++++++++++++++++++++++------
 sound/soc/sof/intel/hda.h |  63 ++++++++++++++++
 2 files changed, 190 insertions(+), 20 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index bc07df1fc39f..d519b9802b3b 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -353,7 +353,7 @@ static inline bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
 
 struct hda_dsp_msg_code {
 	u32 code;
-	const char *msg;
+	const char *text;
 };
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG)
@@ -382,10 +382,7 @@ module_param_named(use_common_hdmi, hda_codec_use_common_hdmi, bool, 0444);
 MODULE_PARM_DESC(use_common_hdmi, "SOF HDA use common HDMI codec driver");
 #endif
 
-static const struct hda_dsp_msg_code hda_dsp_rom_msg[] = {
-	{HDA_DSP_ROM_FW_MANIFEST_LOADED, "status: manifest loaded"},
-	{HDA_DSP_ROM_FW_FW_LOADED, "status: fw loaded"},
-	{HDA_DSP_ROM_FW_ENTERED, "status: fw entered"},
+static const struct hda_dsp_msg_code hda_dsp_rom_fw_error_texts[] = {
 	{HDA_DSP_ROM_CSE_ERROR, "error: cse error"},
 	{HDA_DSP_ROM_CSE_WRONG_RESPONSE, "error: cse wrong response"},
 	{HDA_DSP_ROM_IMR_TO_SMALL, "error: IMR too small"},
@@ -404,26 +401,136 @@ static const struct hda_dsp_msg_code hda_dsp_rom_msg[] = {
 	{HDA_DSP_ROM_NULL_FW_ENTRY,	"error: null FW entry point"},
 };
 
-static void hda_dsp_get_status(struct snd_sof_dev *sdev, const char *level)
+#define FSR_ROM_STATE_ENTRY(state)	{FSR_STATE_ROM_##state, #state}
+static const struct hda_dsp_msg_code fsr_rom_state_names[] = {
+	FSR_ROM_STATE_ENTRY(INIT),
+	FSR_ROM_STATE_ENTRY(INIT_DONE),
+	FSR_ROM_STATE_ENTRY(CSE_MANIFEST_LOADED),
+	FSR_ROM_STATE_ENTRY(FW_MANIFEST_LOADED),
+	FSR_ROM_STATE_ENTRY(FW_FW_LOADED),
+	FSR_ROM_STATE_ENTRY(FW_ENTERED),
+	FSR_ROM_STATE_ENTRY(VERIFY_FEATURE_MASK),
+	FSR_ROM_STATE_ENTRY(GET_LOAD_OFFSET),
+	FSR_ROM_STATE_ENTRY(FETCH_ROM_EXT),
+	FSR_ROM_STATE_ENTRY(FETCH_ROM_EXT_DONE),
+	/* CSE states */
+	FSR_ROM_STATE_ENTRY(CSE_IMR_REQUEST),
+	FSR_ROM_STATE_ENTRY(CSE_IMR_GRANTED),
+	FSR_ROM_STATE_ENTRY(CSE_VALIDATE_IMAGE_REQUEST),
+	FSR_ROM_STATE_ENTRY(CSE_IMAGE_VALIDATED),
+	FSR_ROM_STATE_ENTRY(CSE_IPC_IFACE_INIT),
+	FSR_ROM_STATE_ENTRY(CSE_IPC_RESET_PHASE_1),
+	FSR_ROM_STATE_ENTRY(CSE_IPC_OPERATIONAL_ENTRY),
+	FSR_ROM_STATE_ENTRY(CSE_IPC_OPERATIONAL),
+	FSR_ROM_STATE_ENTRY(CSE_IPC_DOWN),
+};
+
+#define FSR_BRINGUP_STATE_ENTRY(state)	{FSR_STATE_BRINGUP_##state, #state}
+static const struct hda_dsp_msg_code fsr_bringup_state_names[] = {
+	FSR_BRINGUP_STATE_ENTRY(INIT),
+	FSR_BRINGUP_STATE_ENTRY(INIT_DONE),
+	FSR_BRINGUP_STATE_ENTRY(HPSRAM_LOAD),
+	FSR_BRINGUP_STATE_ENTRY(UNPACK_START),
+	FSR_BRINGUP_STATE_ENTRY(IMR_RESTORE),
+	FSR_BRINGUP_STATE_ENTRY(FW_ENTERED),
+};
+
+#define FSR_WAIT_STATE_ENTRY(state)	{FSR_WAIT_FOR_##state, #state}
+static const struct hda_dsp_msg_code fsr_wait_state_names[] = {
+	FSR_WAIT_STATE_ENTRY(IPC_BUSY),
+	FSR_WAIT_STATE_ENTRY(IPC_DONE),
+	FSR_WAIT_STATE_ENTRY(CACHE_INVALIDATION),
+	FSR_WAIT_STATE_ENTRY(LP_SRAM_OFF),
+	FSR_WAIT_STATE_ENTRY(DMA_BUFFER_FULL),
+	FSR_WAIT_STATE_ENTRY(CSE_CSR),
+};
+
+#define FSR_MODULE_NAME_ENTRY(mod)	[FSR_MOD_##mod] = #mod
+static const char * const fsr_module_names[] = {
+	FSR_MODULE_NAME_ENTRY(ROM),
+	FSR_MODULE_NAME_ENTRY(ROM_BYP),
+	FSR_MODULE_NAME_ENTRY(BASE_FW),
+	FSR_MODULE_NAME_ENTRY(LP_BOOT),
+	FSR_MODULE_NAME_ENTRY(BRNGUP),
+	FSR_MODULE_NAME_ENTRY(ROM_EXT),
+};
+
+static const char *
+hda_dsp_get_state_text(u32 code, const struct hda_dsp_msg_code *msg_code,
+		       size_t array_size)
 {
-	const struct sof_intel_dsp_desc *chip;
-	u32 status;
 	int i;
 
-	chip = get_chip_info(sdev->pdata);
-	status = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
-				  chip->rom_status_reg);
-
-	for (i = 0; i < ARRAY_SIZE(hda_dsp_rom_msg); i++) {
-		if (status == hda_dsp_rom_msg[i].code) {
-			dev_printk(level, sdev->dev, "%s - code %8.8x\n",
-				   hda_dsp_rom_msg[i].msg, status);
-			return;
-		}
+	for (i = 0; i < array_size; i++) {
+		if (code == msg_code[i].code)
+			return msg_code[i].text;
 	}
 
+	return NULL;
+}
+
+static void hda_dsp_get_state(struct snd_sof_dev *sdev, const char *level)
+{
+	const struct sof_intel_dsp_desc *chip = get_chip_info(sdev->pdata);
+	const char *state_text, *error_text, *module_text;
+	u32 fsr, state, wait_state, module, error_code;
+
+	fsr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, chip->rom_status_reg);
+	state = FSR_TO_STATE_CODE(fsr);
+	wait_state = FSR_TO_WAIT_STATE_CODE(fsr);
+	module = FSR_TO_MODULE_CODE(fsr);
+
+	if (module > FSR_MOD_ROM_EXT)
+		module_text = "unknown";
+	else
+		module_text = fsr_module_names[module];
+
+	if (module == FSR_MOD_BRNGUP)
+		state_text = hda_dsp_get_state_text(state, fsr_bringup_state_names,
+						    ARRAY_SIZE(fsr_bringup_state_names));
+	else
+		state_text = hda_dsp_get_state_text(state, fsr_rom_state_names,
+						    ARRAY_SIZE(fsr_rom_state_names));
+
 	/* not for us, must be generic sof message */
-	dev_dbg(sdev->dev, "unknown ROM status value %8.8x\n", status);
+	if (!state_text) {
+		dev_printk(level, sdev->dev, "%#010x: unknown ROM status value\n", fsr);
+		return;
+	}
+
+	if (wait_state) {
+		const char *wait_state_text;
+
+		wait_state_text = hda_dsp_get_state_text(wait_state, fsr_wait_state_names,
+							 ARRAY_SIZE(fsr_wait_state_names));
+		if (!wait_state_text)
+			wait_state_text = "unknown";
+
+		dev_printk(level, sdev->dev,
+			   "%#010x: module: %s, state: %s, waiting for: %s, %s\n",
+			   fsr, module_text, state_text, wait_state_text,
+			   fsr & FSR_HALTED ? "not running" : "running");
+	} else {
+		dev_printk(level, sdev->dev, "%#010x: module: %s, state: %s, %s\n",
+			   fsr, module_text, state_text,
+			   fsr & FSR_HALTED ? "not running" : "running");
+	}
+
+	error_code = snd_sof_dsp_read(sdev, HDA_DSP_BAR, chip->rom_status_reg + 4);
+	if (!error_code)
+		return;
+
+	error_text = hda_dsp_get_state_text(error_code, hda_dsp_rom_fw_error_texts,
+					    ARRAY_SIZE(hda_dsp_rom_fw_error_texts));
+	if (!error_text)
+		error_text = "unknown";
+
+	if (state == FSR_STATE_FW_ENTERED)
+		dev_printk(level, sdev->dev, "status code: %#x (%s)\n", error_code,
+			   error_text);
+	else
+		dev_printk(level, sdev->dev, "error code: %#x (%s)\n", error_code,
+			   error_text);
 }
 
 static void hda_dsp_get_registers(struct snd_sof_dev *sdev,
@@ -482,7 +589,7 @@ void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 	u32 stack[HDA_DSP_STACK_DUMP_SIZE];
 
 	/* print ROM/FW status */
-	hda_dsp_get_status(sdev, level);
+	hda_dsp_get_state(sdev, level);
 
 	if (flags & SOF_DBG_DUMP_REGS) {
 		u32 status = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_SRAM_REG_FW_STATUS);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index dc713c20ba1d..77c74e3c09b1 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -187,6 +187,69 @@
 
 #define HDA_DSP_STACK_DUMP_SIZE			32
 
+/* ROM/FW status register */
+#define FSR_STATE_MASK				GENMASK(23, 0)
+#define FSR_WAIT_STATE_MASK			GENMASK(27, 24)
+#define FSR_MODULE_MASK				GENMASK(30, 28)
+#define FSR_HALTED				BIT(31)
+#define FSR_TO_STATE_CODE(x)			((x) & FSR_STATE_MASK)
+#define FSR_TO_WAIT_STATE_CODE(x)		(((x) & FSR_WAIT_STATE_MASK) >> 24)
+#define FSR_TO_MODULE_CODE(x)			(((x) & FSR_MODULE_MASK) >> 28)
+
+/* Wait states */
+#define FSR_WAIT_FOR_IPC_BUSY			0x1
+#define FSR_WAIT_FOR_IPC_DONE			0x2
+#define FSR_WAIT_FOR_CACHE_INVALIDATION		0x3
+#define FSR_WAIT_FOR_LP_SRAM_OFF		0x4
+#define FSR_WAIT_FOR_DMA_BUFFER_FULL		0x5
+#define FSR_WAIT_FOR_CSE_CSR			0x6
+
+/* Module codes */
+#define FSR_MOD_ROM				0x0
+#define FSR_MOD_ROM_BYP				0x1
+#define FSR_MOD_BASE_FW				0x2
+#define FSR_MOD_LP_BOOT				0x3
+#define FSR_MOD_BRNGUP				0x4
+#define FSR_MOD_ROM_EXT				0x5
+
+/* State codes (module dependent) */
+/* Module independent states */
+#define FSR_STATE_INIT				0x0
+#define FSR_STATE_INIT_DONE			0x1
+#define FSR_STATE_FW_ENTERED			0x5
+
+/* ROM states */
+#define FSR_STATE_ROM_INIT			FSR_STATE_INIT
+#define FSR_STATE_ROM_INIT_DONE			FSR_STATE_INIT_DONE
+#define FSR_STATE_ROM_CSE_MANIFEST_LOADED	0x2
+#define FSR_STATE_ROM_FW_MANIFEST_LOADED	0x3
+#define FSR_STATE_ROM_FW_FW_LOADED		0x4
+#define FSR_STATE_ROM_FW_ENTERED		FSR_STATE_FW_ENTERED
+#define FSR_STATE_ROM_VERIFY_FEATURE_MASK	0x6
+#define FSR_STATE_ROM_GET_LOAD_OFFSET		0x7
+#define FSR_STATE_ROM_FETCH_ROM_EXT		0x8
+#define FSR_STATE_ROM_FETCH_ROM_EXT_DONE	0x9
+
+/* (ROM) CSE states */
+#define FSR_STATE_ROM_CSE_IMR_REQUEST			0x10
+#define FSR_STATE_ROM_CSE_IMR_GRANTED			0x11
+#define FSR_STATE_ROM_CSE_VALIDATE_IMAGE_REQUEST	0x12
+#define FSR_STATE_ROM_CSE_IMAGE_VALIDATED		0x13
+
+#define FSR_STATE_ROM_CSE_IPC_IFACE_INIT	0x20
+#define FSR_STATE_ROM_CSE_IPC_RESET_PHASE_1	0x21
+#define FSR_STATE_ROM_CSE_IPC_OPERATIONAL_ENTRY	0x22
+#define FSR_STATE_ROM_CSE_IPC_OPERATIONAL	0x23
+#define FSR_STATE_ROM_CSE_IPC_DOWN		0x24
+
+/* BRINGUP (or BRNGUP) states */
+#define FSR_STATE_BRINGUP_INIT			FSR_STATE_INIT
+#define FSR_STATE_BRINGUP_INIT_DONE		FSR_STATE_INIT_DONE
+#define FSR_STATE_BRINGUP_HPSRAM_LOAD		0x2
+#define FSR_STATE_BRINGUP_UNPACK_START		0X3
+#define FSR_STATE_BRINGUP_IMR_RESTORE		0x4
+#define FSR_STATE_BRINGUP_FW_ENTERED		FSR_STATE_FW_ENTERED
+
 /* ROM  status/error values */
 #define HDA_DSP_ROM_STS_MASK			GENMASK(23, 0)
 #define HDA_DSP_ROM_INIT			0x1
-- 
2.37.0

