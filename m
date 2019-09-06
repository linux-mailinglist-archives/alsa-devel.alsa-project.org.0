Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23857AC0E9
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 21:52:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61FC7166D;
	Fri,  6 Sep 2019 21:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61FC7166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567799521;
	bh=qjYmvXQZ10S2t2sGM7DIIBvwT+2AsKKN2jr9Q/yDEbo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qcXrqlNHXyeC7mbHiZMlq9DpROkZgXbWM3q+YjApI4+2XmZLf7IK2kZnYRqb8rE8s
	 gOyliNDtIvjCb2hpzl//EmVwAXQVlvJFSw+/+qorLq+nQfSepPc2gxYRefcwUYAkqz
	 9m3ZVYT5QFg1KLI2Bmu1QroSL1Llj0Zj4NJg3Awg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7B13F8063A;
	Fri,  6 Sep 2019 21:48:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32796F80639; Fri,  6 Sep 2019 21:47:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0638F80611
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 21:47:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0638F80611
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="fyOKSHzR"
Received: by mail-pf1-x444.google.com with SMTP id d15so5198671pfo.10
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 12:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gapN+hwSxlX78IFbIdAVK+5HSLsRdoV1q4n7vdli/0M=;
 b=fyOKSHzRz1Z4ZpCazORsupQKTsZRPUwAz/zEfvMErPCQG2PEWeq7X04+4ivUYgJ190
 4xODZsonRh/LZyqHKGss44tNLRsFTSfP6hBfCV3jiNiJulW68Hw9r2wjH4nI6Tms03tI
 PJZ1Ir0eCpVjvT21g99SWFV2ImqNg6Ezn8vc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gapN+hwSxlX78IFbIdAVK+5HSLsRdoV1q4n7vdli/0M=;
 b=CVREJNGeESGzTBDmkxUcjaKwjlba72jvWBpAl14oqPfFmwbeDDAy/NS8IRC55ljnrO
 Kvd4VQU5QfNvBbmUMzNZjJj/3JIUWKxlbSSA0gga761M1n4o5b+AEvGqY6yvCwpaXRhB
 UOT2cOxzQCMXMVwNypzi71b/+LLeJv3SJxnHnb6eVElcUoPDSVmmDYzszbUAJxE44CTS
 fM/hAF5TsJ0WPiEx0PdmBekTeWwHDKZYBMsyvf3m7j/7lLS4563J9NqKYWjH0rgUnrhJ
 /nCCMQxTf6w1ONusVo+Kb16rN3qrqNjnuEbnbVHcBa+Uf1WQla2lpJXgrLdy70fDOZps
 SIYA==
X-Gm-Message-State: APjAAAUuV0pQmQlpfE2iZXcNzFPJHVDp5+jqiMl9jUnmBnj3zTHdPb0O
 4Q61oj4//Y/PNkoWx6G3Xnd6kNeRBg==
X-Google-Smtp-Source: APXvYqwHylr6B3zkbaQtWvFsWxl1pBH6vAQPgfdRctKwf2KN5PsW859rr8CKNvRtkf8dC0ZBTe9CAQ==
X-Received: by 2002:a63:c009:: with SMTP id h9mr9428539pgg.166.1567799272456; 
 Fri, 06 Sep 2019 12:47:52 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id m4sm7504579pgs.71.2019.09.06.12.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2019 12:47:52 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri,  6 Sep 2019 12:46:26 -0700
Message-Id: <20190906194636.217881-5-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906194636.217881-1-cujomalainey@chromium.org>
References: <20190906194636.217881-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [RFC 04/15] ASoC: rt5677: Load firmware via SPI
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ben Zhang <benzh@chromium.org>

The firmware rt5677_elf_vad is an ELF binary obtained from
request_firmware(). Sections of the ELF are loaded to
the DSP via SPI. A model (e.g. en_us.mmap) can optionally be
loaded to the DSP at RT5677_MODEL_ADDR to overwrite the
baked-in model in rt5677_elf_vad.

When 'DSP VAD Switch' is turned on, rt5677_set_vad_source()
enables the following digital path:

DMIC L1 ->
Mono DMIC L Mux ->
Mono ADC2 L Mux ->
Mono ADC MIXL ->
VAD ADC Mux ->
IB01 Mux

Then we switch to DSP mode, load firmware, and let DSP run.
When a hotword is detected, an interrupt is fired and
rt5677_irq() is called. When 'DSP VAD Switch' is turned off,
the codec is set back to normal mode.

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 306 +++++++++++++++++++++++++++++++-------
 sound/soc/codecs/rt5677.h |   1 +
 2 files changed, 254 insertions(+), 53 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 315a3d39bc09..35d4ec1b7dfd 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -38,6 +38,10 @@
 
 #define RT5677_DEVICE_ID 0x6327
 
+/* Register controlling boot vector */
+#define RT5677_DSP_BOOT_VECTOR		0x1801f090
+#define RT5677_MODEL_ADDR		0x5FFC9800
+
 #define RT5677_PR_RANGE_BASE (0xff + 1)
 #define RT5677_PR_SPACING 0x100
 
@@ -701,6 +705,210 @@ static void rt5677_set_dsp_mode(struct snd_soc_component *component, bool on)
 	}
 }
 
+static unsigned int rt5677_set_vad_source(
+	struct snd_soc_component *component)
+{
+	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
+
+	/* Mono ADC Capture Switch = unmute (default) */
+	regmap_update_bits(rt5677->regmap, RT5677_MONO_ADC_DIG_VOL,
+			RT5677_L_MUTE, 0);
+
+	/* Mono ADC Boost Volume = 24dB */
+	regmap_update_bits(rt5677->regmap, RT5677_ADC_BST_CTRL2,
+		RT5677_MONO_ADC_L_BST_MASK | RT5677_MONO_ADC_R_BST_MASK,
+		(0x2 << RT5677_MONO_ADC_L_BST_SFT) |
+		(0x2 << RT5677_MONO_ADC_R_BST_SFT));
+
+	/* Mono ADC MIXL = Mono ADC2 L Mux (unmute)
+	 *                 Mono ADC1 L Mux (mute)
+	 * Mono ADC2 L Mux = Mono DMIC L Mux
+	 * Mono DMIC L Mux = DMIC1 (left)
+	 */
+	regmap_update_bits(rt5677->regmap, RT5677_MONO_ADC_MIXER,
+		RT5677_M_MONO_ADC_L2 | RT5677_M_MONO_ADC_L1 |
+		RT5677_SEL_MONO_ADC_L2_MASK | RT5677_SEL_MONO_DMIC_L_MASK,
+		RT5677_M_MONO_ADC_L1 | (1 << RT5677_SEL_MONO_ADC_L2_SFT) |
+		(0 << RT5677_SEL_MONO_DMIC_L_SFT));
+
+	/* DMIC1 power = enabled
+	 * DMIC CLK = 256 * fs / 12
+	 */
+	regmap_update_bits(rt5677->regmap, RT5677_DMIC_CTRL1,
+		RT5677_DMIC_1_EN_MASK | RT5677_DMIC_CLK_MASK,
+		RT5677_DMIC_1_EN | (5 << RT5677_DMIC_CLK_SFT));
+
+	/* I2S pre divide 2 = /6 (clk_sys2) */
+	regmap_update_bits(rt5677->regmap, RT5677_CLK_TREE_CTRL1,
+		RT5677_I2S_PD2_MASK, RT5677_I2S_PD2_6);
+
+	/* System Clock = MCLK1
+	 * Stereo ADC/DAC over sample rate = 128Fs (default)
+	 */
+	regmap_write(rt5677->regmap, RT5677_GLB_CLK1, 0x0000);
+
+	/* DSP Clock = MCLK1 (bypassed PLL2) */
+	regmap_write(rt5677->regmap, RT5677_GLB_CLK2,
+		RT5677_DSP_CLK_SRC_BYPASS);
+
+	/* Clock source for Mono L ADC = clk_sys2 */
+	regmap_update_bits(rt5677->regmap, RT5677_ASRC_6,
+		RT5677_AD_MONOL_CLK_SEL_MASK, 7 << RT5677_AD_MONOL_CLK_SEL_SFT);
+
+	/* SAD Threshold1 */
+	regmap_write(rt5677->regmap, RT5677_VAD_CTRL2, 0x013f);
+	/* SAD Threshold2 */
+	regmap_write(rt5677->regmap, RT5677_VAD_CTRL3, 0x0ae5);
+	/* SAD Sample Rate Converter = Up 6 (8K to 48K)
+	 * SAD Output Sample Rate = Same as I2S
+	 * VAD ADC Mux = MONO ADC MIX L
+	 * SAD Threshold3
+	 */
+	regmap_write(rt5677->regmap, RT5677_VAD_CTRL4,
+		0x01 << RT5677_VAD_SRC_SFT |
+		0x7f << RT5677_VAD_LV_DIFF_SFT);
+	/* Minimum frame level within a pre-determined duration = 32 frames
+	 * Bypass ADPCM Encoder/Decoder = Bypass ADPCM
+	 * Automatic Push Data to SAD Buffer Once SAD Flag is triggered = enable
+	 * SAD Buffer Over-Writing = enable
+	 * SAD Buffer Pop Mode Control = disable
+	 * SAD Buffer Push Mode Control = enable
+	 * SAD Detector Control = enable
+	 * SAD Function Control = enable
+	 * SAD Function Reset = normal
+	 */
+	regmap_write(rt5677->regmap, RT5677_VAD_CTRL1,
+		RT5677_VAD_FUNC_RESET | RT5677_VAD_FUNC_ENABLE |
+		RT5677_VAD_DET_ENABLE | RT5677_VAD_BUF_PUSH |
+		RT5677_VAD_BUF_OW | RT5677_VAD_FG2ENC |
+		RT5677_VAD_ADPCM_BYPASS | 1 << RT5677_VAD_MIN_DUR_SFT);
+
+	/* InBound0/1 Source = VAD ADC/DAC1 FS */
+	regmap_update_bits(rt5677->regmap, RT5677_DSP_INB_CTRL1,
+		RT5677_IB01_SRC_MASK, 4 << RT5677_IB01_SRC_SFT);
+
+	/* IRQ Source of VAD Jack Detection = enable */
+	regmap_write(rt5677->regmap, RT5677_IRQ_CTRL2, 0x4000);
+
+	/* Enable Gating Mode with MCLK = enable */
+	regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC, 0x1, 0x1);
+
+	/* Private register, no doc */
+	regmap_update_bits(rt5677->regmap, RT5677_PR_BASE + RT5677_BIAS_CUR4,
+		0x0f00, 0x0100);
+
+	/* adc mono left filter = power on */
+	regmap_update_bits(rt5677->regmap, RT5677_PWR_DIG2,
+		RT5677_PWR_ADC_MF_L, RT5677_PWR_ADC_MF_L);
+
+	/* LDO2 output = 1.2V
+	 * LDO1 output = 1.2V (LDO_IN = 1.8V)
+	 */
+	regmap_update_bits(rt5677->regmap, RT5677_PWR_ANLG1,
+		RT5677_LDO1_SEL_MASK | RT5677_LDO2_SEL_MASK,
+		5 << RT5677_LDO1_SEL_SFT | 5 << RT5677_LDO2_SEL_SFT);
+
+	/* Codec core power =  power on
+	 * LDO1 power = power on
+	 */
+	regmap_update_bits(rt5677->regmap, RT5677_PWR_ANLG2,
+		RT5677_PWR_CORE | RT5677_PWR_LDO1,
+		RT5677_PWR_CORE | RT5677_PWR_LDO1);
+
+	/* Isolation for DCVDD4 = normal (set during probe)
+	 * Isolation for DCVDD2 = normal (set during probe)
+	 * Isolation for DSP = normal
+	 * Isolation for Band 0~7 = disable
+	 * Isolation for InBound 4~10 and OutBound 4~10 = disable
+	 */
+	regmap_write(rt5677->regmap, RT5677_PWR_DSP2,
+		RT5677_PWR_CORE_ISO | RT5677_PWR_DSP_ISO |
+		RT5677_PWR_SR7_ISO | RT5677_PWR_SR6_ISO |
+		RT5677_PWR_SR5_ISO | RT5677_PWR_SR4_ISO |
+		RT5677_PWR_SR3_ISO | RT5677_PWR_SR2_ISO |
+		RT5677_PWR_SR1_ISO | RT5677_PWR_SR0_ISO |
+		RT5677_PWR_MLT_ISO);
+
+	/* System Band 0~7 = power on
+	 * InBound 4~10 and OutBound 4~10 = power on
+	 * DSP = power on
+	 * DSP CPU = stop (will be set to "run" after firmware loaded)
+	 */
+	regmap_write(rt5677->regmap, RT5677_PWR_DSP1,
+		RT5677_PWR_SR7 | RT5677_PWR_SR6 |
+		RT5677_PWR_SR5 | RT5677_PWR_SR4 |
+		RT5677_PWR_SR3 | RT5677_PWR_SR2 |
+		RT5677_PWR_SR1 | RT5677_PWR_SR0 |
+		RT5677_PWR_MLT | RT5677_PWR_DSP |
+		RT5677_PWR_DSP_CPU);
+
+	return 0;
+}
+
+static int rt5677_parse_and_load_dsp(struct rt5677_priv *rt5677, const u8 *buf,
+		unsigned int len)
+{
+	struct snd_soc_component *component = rt5677->component;
+	Elf32_Ehdr *elf_hdr;
+	Elf32_Phdr *pr_hdr;
+	Elf32_Half i;
+	int ret = 0;
+
+	if (!buf || (len < sizeof(Elf32_Ehdr)))
+		return -ENOMEM;
+
+	elf_hdr = (Elf32_Ehdr *)buf;
+#ifndef EM_XTENSA
+#define EM_XTENSA	94
+#endif
+	if (strncmp(elf_hdr->e_ident, ELFMAG, sizeof(ELFMAG) - 1))
+		dev_err(component->dev, "Wrong ELF header prefix\n");
+	if (elf_hdr->e_ehsize != sizeof(Elf32_Ehdr))
+		dev_err(component->dev, "Wrong Elf header size\n");
+	if (elf_hdr->e_machine != EM_XTENSA)
+		dev_err(component->dev, "Wrong DSP code file\n");
+
+	if (len < elf_hdr->e_phoff)
+		return -ENOMEM;
+	pr_hdr = (Elf32_Phdr *)(buf + elf_hdr->e_phoff);
+	for (i = 0; i < elf_hdr->e_phnum; i++) {
+		/* TODO: handle p_memsz != p_filesz */
+		if (pr_hdr->p_paddr && pr_hdr->p_filesz) {
+			dev_info(component->dev, "Load 0x%x bytes to 0x%x\n",
+					pr_hdr->p_filesz, pr_hdr->p_paddr);
+
+			ret = rt5677_spi_write(pr_hdr->p_paddr,
+					buf + pr_hdr->p_offset,
+					pr_hdr->p_filesz);
+			if (ret)
+				dev_err(component->dev, "Load firmware failed %d\n",
+						ret);
+		}
+		pr_hdr++;
+	}
+	return ret;
+}
+
+static int rt5677_load_dsp_from_file(struct snd_soc_component *component)
+{
+	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
+	const struct firmware *fwp;
+	int ret = 0;
+
+	/* Load dsp firmware from rt5677_elf_vad file */
+	ret = request_firmware(&fwp, "rt5677_elf_vad", component->dev);
+	if (ret) {
+		dev_err(component->dev, "Request rt5677_elf_vad failed %d\n",
+			ret);
+		return ret;
+	}
+	dev_info(component->dev, "Requested rt5677_elf_vad (%zu)\n", fwp->size);
+
+	ret = rt5677_parse_and_load_dsp(rt5677, fwp->data, fwp->size);
+	release_firmware(fwp);
+	return ret;
+}
+
 static int rt5677_set_dsp_vad(struct snd_soc_component *component, bool on)
 {
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
@@ -710,74 +918,52 @@ static int rt5677_set_dsp_vad(struct snd_soc_component *component, bool on)
 	if (!IS_ENABLED(CONFIG_SND_SOC_RT5677_SPI))
 		return -ENXIO;
 
+	dev_info(component->dev, "DSP VAD: on=%d, activity=%d\n", on, activity);
 	if (on && !activity) {
 		activity = true;
 
-		regcache_cache_only(rt5677->regmap, false);
-		regcache_cache_bypass(rt5677->regmap, true);
+		/* Set GPIO1 as an output pin driving a 0. Firmware will
+		 * raise GPIO1 upon hotword detect.
+		 */
+		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL2,
+			RT5677_GPIO1_DIR_MASK |	RT5677_GPIO1_OUT_MASK |
+			RT5677_GPIO1_P_MASK, RT5677_GPIO1_DIR_OUT |
+			RT5677_GPIO1_OUT_LO | RT5677_GPIO1_P_NOR);
+		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
+			RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_GPIO1);
 
-		regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC, 0x1, 0x1);
-		regmap_update_bits(rt5677->regmap,
-			RT5677_PR_BASE + RT5677_BIAS_CUR4, 0x0f00, 0x0f00);
-		regmap_update_bits(rt5677->regmap, RT5677_PWR_ANLG1,
-			RT5677_LDO1_SEL_MASK, 0x0);
-		regmap_update_bits(rt5677->regmap, RT5677_PWR_ANLG2,
-			RT5677_PWR_LDO1, RT5677_PWR_LDO1);
-		switch (rt5677->type) {
-		case RT5677:
-			regmap_update_bits(rt5677->regmap, RT5677_GLB_CLK1,
-				RT5677_MCLK_SRC_MASK, RT5677_MCLK2_SRC);
-			regmap_update_bits(rt5677->regmap, RT5677_GLB_CLK2,
-				RT5677_PLL2_PR_SRC_MASK |
-				RT5677_DSP_CLK_SRC_MASK,
-				RT5677_PLL2_PR_SRC_MCLK2 |
-				RT5677_DSP_CLK_SRC_BYPASS);
-			break;
-		case RT5676:
-			regmap_update_bits(rt5677->regmap, RT5677_GLB_CLK2,
-				RT5677_DSP_CLK_SRC_MASK,
-				RT5677_DSP_CLK_SRC_BYPASS);
-			break;
-		default:
-			break;
-		}
-		regmap_write(rt5677->regmap, RT5677_PWR_DSP2, 0x07ff);
-		regmap_write(rt5677->regmap, RT5677_PWR_DSP1, 0x07fd);
+		rt5677_set_vad_source(component);
 		rt5677_set_dsp_mode(component, true);
 
-		ret = request_firmware(&rt5677->fw1, RT5677_FIRMWARE1,
-			component->dev);
-		if (ret == 0) {
-			rt5677_spi_write_firmware(0x50000000, rt5677->fw1);
-			release_firmware(rt5677->fw1);
-		}
+		/* Boot the firmware from IRAM instead of SRAM0. */
+		rt5677_dsp_mode_i2c_write_addr(rt5677, RT5677_DSP_BOOT_VECTOR,
+			0x0009, 0x0003);
+		rt5677_dsp_mode_i2c_write_addr(rt5677, RT5677_DSP_BOOT_VECTOR,
+			0x0019, 0x0003);
+		rt5677_dsp_mode_i2c_write_addr(rt5677, RT5677_DSP_BOOT_VECTOR,
+			0x0009, 0x0003);
 
-		ret = request_firmware(&rt5677->fw2, RT5677_FIRMWARE2,
-			component->dev);
-		if (ret == 0) {
-			rt5677_spi_write_firmware(0x60000000, rt5677->fw2);
-			release_firmware(rt5677->fw2);
-		}
+		ret = rt5677_load_dsp_from_file(component);
 
+		/* Set DSP CPU to Run */
 		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1, 0x1, 0x0);
-
-		regcache_cache_bypass(rt5677->regmap, false);
-		regcache_cache_only(rt5677->regmap, true);
 	} else if (!on && activity) {
 		activity = false;
 
-		regcache_cache_only(rt5677->regmap, false);
-		regcache_cache_bypass(rt5677->regmap, true);
-
-		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1, 0x1, 0x1);
+		/* Set DSP CPU to Stop */
+		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
+			RT5677_PWR_DSP_CPU, RT5677_PWR_DSP_CPU);
 		rt5677_set_dsp_mode(component, false);
-		regmap_write(rt5677->regmap, RT5677_PWR_DSP1, 0x0001);
 
-		regmap_write(rt5677->regmap, RT5677_RESET, 0x10ec);
+		/* Disable and clear VAD interrupt */
+		regmap_write(rt5677->regmap, RT5677_VAD_CTRL1, 0x2184);
+		regmap_update_bits(rt5677->regmap, RT5677_IRQ_CTRL2,
+			0xF000, 0x0000);
+
+		/* Set GPIO1 pin back to be IRQ output for jack detect */
+		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
+			RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
 
-		regcache_cache_bypass(rt5677->regmap, false);
-		regcache_mark_dirty(rt5677->regmap);
-		regcache_sync(rt5677->regmap);
 	}
 
 	return 0;
@@ -4938,6 +5124,17 @@ static struct snd_soc_dai_driver rt5677_dai[] = {
 		},
 		.ops = &rt5677_aif_dai_ops,
 	},
+	{
+		.name = "rt5677-dspbuffer",
+		.id = RT5677_DSPBUFF,
+		.capture = {
+			.stream_name = "DSP Buffer",
+			.channels_min = 1,
+			.channels_max = 1,
+			.rates = SNDRV_PCM_RATE_16000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
+	},
 };
 
 static const struct snd_soc_component_driver soc_component_dev_rt5677 = {
@@ -5081,6 +5278,9 @@ static irqreturn_t rt5677_irq(int unused, void *data)
 
 	mutex_lock(&rt5677->irq_lock);
 
+	if (rt5677->dsp_vad_en)
+		rt5677_spi_hotword_detected();
+
 	/*
 	 * Loop to handle interrupts until the last i2c read shows no pending
 	 * irqs. The interrupt line is shared by multiple interrupt sources.
diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index 213f4b8ca269..2bbd618b51ac 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -1730,6 +1730,7 @@ enum {
 	RT5677_AIF4,
 	RT5677_AIF5,
 	RT5677_AIFS,
+	RT5677_DSPBUFF,
 };
 
 enum {
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
