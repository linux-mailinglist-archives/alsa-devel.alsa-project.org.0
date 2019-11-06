Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 567D5F0B85
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 02:15:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E485E16E7;
	Wed,  6 Nov 2019 02:14:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E485E16E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573002943;
	bh=w5+y1YRtVQsvZph+TUW3sEBIoP8A+ePh8W/gEoHmLiY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dHjB0j4+AD/QGKYaZCl3VeAJKHpgAgBJYWDJkoCbNJ5JQYb7Dp1V03izGiM7urxFR
	 CTujHj6YCuZvXS9epPXDnHnMfTDaBbda0Z0y2Cy1ZSdaoWoRO4O0mgMC8Fnjl7bzQX
	 MEbGoAc7aZ1fMWc+6Q5jTBUjaDuC51Sr28YurUxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43F78F80600;
	Wed,  6 Nov 2019 02:14:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E0DFF805DF; Wed,  6 Nov 2019 02:13:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 273E6F80271
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 02:13:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 273E6F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="B4sCh9Wl"
Received: by mail-pg1-x542.google.com with SMTP id f19so6826373pgk.11
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 17:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xfsNSxHJk6LnUfoRJAzF3M9cTyH3/DtMzZBicpYC5W8=;
 b=B4sCh9WlXUXlLqqd63gFSKJ+lSg1ZklndMTtHJ99bb9tis2DkprYUrs8YLKGCH00D1
 dXXhHto4U8cAcSYLflt//m3IU2n2v0YDvT0KAUIQiICnjtq+BZtOFXbSoBN9jLNFNOim
 kcwIxtnfFFCb7H2qggIsO8hZGCBuOJdWVk12Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xfsNSxHJk6LnUfoRJAzF3M9cTyH3/DtMzZBicpYC5W8=;
 b=NcwecxteqIw7Gs58JVy9D4gDXWhrXBR6gF29UnXWx20Aa2HS8XSI/y0Gg5UJF3IW+8
 qKzQQFrTsnq4z0UB7Gq2WY6A611EaBsccHN9lRGMzCGrtEk5arMHBmodmyx0pqgrHdj9
 Sr+aq+J4DWW0jXU0KmS+/DllvnepmSV/XUED97yKzhkSoR1GlXiMCtCx4vukU9DqxANj
 LMCyW0+0oq9wAh+TXgMLemawPDin+XWFZjzNpim0rqWEpjt5GyChaM/QmBG+KdT7t8Oz
 GjpC/srEfkBvyXZjlYsex21FL5uZotfJcyuXJfeWbo7KsRsrIC4FLWc9+aTb0ES5DNbu
 9pcw==
X-Gm-Message-State: APjAAAXAbWla/+DhUFmBxJbjWSbd8ghfmw00xwtt3QrpePZ4bXZJCwi/
 hbCbSNkj7lMYthrYsnDBaZMf3JpbIk3O
X-Google-Smtp-Source: APXvYqy7+e171IG/mtc1HdoaJgV1nSrS3F42WzSrwtO09Wo7QbAgjBneGWCWCikQ6WJfE8l+7xr0yw==
X-Received: by 2002:a17:90a:ba18:: with SMTP id s24mr16965pjr.69.1573002832634; 
 Tue, 05 Nov 2019 17:13:52 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id k20sm14626256pgn.40.2019.11.05.17.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2019 17:13:52 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 17:13:26 -0800
Message-Id: <20191106011335.223061-2-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191106011335.223061-1-cujomalainey@chromium.org>
References: <20191106011335.223061-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v3 01/11] ASoC: rt5677: Load firmware via SPI
	using delayed work
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

Then we switch to DSP mode, load firmware, and let DSP run.
When a hotword is detected, an interrupt is fired and
rt5677_irq() is called. When 'DSP VAD Switch' is turned off,
the codec is set back to normal mode.

The kcontrol 'DSP VAD Switch' is automatically enabled/disabled
when the hotwording PCM stream is opened/closed.

Change-Id: I9db4a2d125e83c13a969e31fec904fd52ff500c2
Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677-spi.c |  13 ++
 sound/soc/codecs/rt5677.c     | 301 ++++++++++++++++++++++++++--------
 sound/soc/codecs/rt5677.h     |   6 +-
 3 files changed, 253 insertions(+), 67 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 3aa3ea7c2768..25e28be3722e 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -26,6 +26,7 @@
 
 #include <sound/soc.h>
 
+#include "rt5677.h"
 #include "rt5677-spi.h"
 
 #define DRV_NAME "rt5677spi"
@@ -111,10 +112,16 @@ static int rt5677_spi_pcm_close(
 		struct snd_soc_component *component,
 		struct snd_pcm_substream *substream)
 {
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *codec_component =
+			snd_soc_rtdcom_lookup(rtd, "rt5677");
+	struct rt5677_priv *rt5677 =
+			snd_soc_component_get_drvdata(codec_component);
 	struct rt5677_dsp *rt5677_dsp =
 			snd_soc_component_get_drvdata(component);
 
 	cancel_delayed_work_sync(&rt5677_dsp->copy_work);
+	rt5677->set_dsp_vad(codec_component, false);
 	return 0;
 }
 
@@ -154,9 +161,15 @@ static int rt5677_spi_prepare(
 		struct snd_soc_component *component,
 		struct snd_pcm_substream *substream)
 {
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *rt5677_component =
+			snd_soc_rtdcom_lookup(rtd, "rt5677");
+	struct rt5677_priv *rt5677 =
+			snd_soc_component_get_drvdata(rt5677_component);
 	struct rt5677_dsp *rt5677_dsp =
 			snd_soc_component_get_drvdata(component);
 
+	rt5677->set_dsp_vad(rt5677_component, true);
 	rt5677_dsp->dma_offset = 0;
 	rt5677_dsp->avail_bytes = 0;
 	return 0;
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 315a3d39bc09..13f21bf4e04e 100644
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
 
@@ -686,10 +690,8 @@ static int rt5677_dsp_mode_i2c_read(
 	return ret;
 }
 
-static void rt5677_set_dsp_mode(struct snd_soc_component *component, bool on)
+static void rt5677_set_dsp_mode(struct rt5677_priv *rt5677, bool on)
 {
-	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
-
 	if (on) {
 		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
 			RT5677_PWR_DSP, RT5677_PWR_DSP);
@@ -701,86 +703,234 @@ static void rt5677_set_dsp_mode(struct snd_soc_component *component, bool on)
 	}
 }
 
+static unsigned int rt5677_set_vad_source(struct rt5677_priv *rt5677)
+{
+	/* DMIC1 power = enabled
+	 * DMIC CLK = 256 * fs / 12
+	 */
+	regmap_update_bits(rt5677->regmap, RT5677_DMIC_CTRL1,
+		RT5677_DMIC_CLK_MASK, 5 << RT5677_DMIC_CLK_SFT);
+
+	/* I2S pre divide 2 = /6 (clk_sys2) */
+	regmap_update_bits(rt5677->regmap, RT5677_CLK_TREE_CTRL1,
+		RT5677_I2S_PD2_MASK, RT5677_I2S_PD2_6);
+
+	/* DSP Clock = MCLK1 (bypassed PLL2) */
+	regmap_write(rt5677->regmap, RT5677_GLB_CLK2,
+		RT5677_DSP_CLK_SRC_BYPASS);
+
+	/* SAD Threshold1 */
+	regmap_write(rt5677->regmap, RT5677_VAD_CTRL2, 0x013f);
+	/* SAD Threshold2 */
+	regmap_write(rt5677->regmap, RT5677_VAD_CTRL3, 0x0ae5);
+	/* SAD Sample Rate Converter = Up 6 (8K to 48K)
+	 * SAD Output Sample Rate = Same as I2S
+	 * SAD Threshold3
+	 */
+	regmap_update_bits(rt5677->regmap, RT5677_VAD_CTRL4,
+		RT5677_VAD_OUT_SRC_RATE_MASK | RT5677_VAD_OUT_SRC_MASK |
+		RT5677_VAD_LV_DIFF_MASK, 0x7f << RT5677_VAD_LV_DIFF_SFT);
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
+	/* IRQ Source of VAD Jack Detection = enable */
+	regmap_write(rt5677->regmap, RT5677_IRQ_CTRL2, 0x4000);
+
+	/* Private register, no doc */
+	regmap_update_bits(rt5677->regmap, RT5677_PR_BASE + RT5677_BIAS_CUR4,
+		0x0f00, 0x0100);
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
+static int rt5677_load_dsp_from_file(struct rt5677_priv *rt5677)
+{
+	const struct firmware *fwp;
+	struct device *dev = rt5677->component->dev;
+	int ret = 0;
+
+	/* Load dsp firmware from rt5677_elf_vad file */
+	ret = request_firmware(&fwp, "rt5677_elf_vad", dev);
+	if (ret) {
+		dev_err(dev, "Request rt5677_elf_vad failed %d\n", ret);
+		return ret;
+	}
+	dev_info(dev, "Requested rt5677_elf_vad (%zu)\n", fwp->size);
+
+	ret = rt5677_parse_and_load_dsp(rt5677, fwp->data, fwp->size);
+	release_firmware(fwp);
+	return ret;
+}
+
 static int rt5677_set_dsp_vad(struct snd_soc_component *component, bool on)
 {
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
-	static bool activity;
-	int ret;
+	rt5677->dsp_vad_en = on;
 
 	if (!IS_ENABLED(CONFIG_SND_SOC_RT5677_SPI))
 		return -ENXIO;
 
-	if (on && !activity) {
-		activity = true;
+	schedule_delayed_work(&rt5677->dsp_work, 0);
+	return 0;
+}
 
-		regcache_cache_only(rt5677->regmap, false);
-		regcache_cache_bypass(rt5677->regmap, true);
+static void rt5677_dsp_work(struct work_struct *work)
+{
+	struct rt5677_priv *rt5677 =
+		container_of(work, struct rt5677_priv, dsp_work.work);
+	static bool activity;
+	bool enable = rt5677->dsp_vad_en;
 
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
-		rt5677_set_dsp_mode(component, true);
-
-		ret = request_firmware(&rt5677->fw1, RT5677_FIRMWARE1,
-			component->dev);
-		if (ret == 0) {
-			rt5677_spi_write_firmware(0x50000000, rt5677->fw1);
-			release_firmware(rt5677->fw1);
-		}
 
-		ret = request_firmware(&rt5677->fw2, RT5677_FIRMWARE2,
-			component->dev);
-		if (ret == 0) {
-			rt5677_spi_write_firmware(0x60000000, rt5677->fw2);
-			release_firmware(rt5677->fw2);
-		}
+	dev_info(rt5677->component->dev, "DSP VAD: enable=%d, activity=%d\n",
+			enable, activity);
 
-		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1, 0x1, 0x0);
+	if (enable && !activity) {
+		activity = true;
 
-		regcache_cache_bypass(rt5677->regmap, false);
-		regcache_cache_only(rt5677->regmap, true);
-	} else if (!on && activity) {
+		/* Set GPIO1 as an output pin driving a 0. Firmware will
+		 * raise GPIO1 upon hotword detect.
+		 */
+		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL2,
+			RT5677_GPIO1_DIR_MASK |	RT5677_GPIO1_OUT_MASK |
+			RT5677_GPIO1_P_MASK, RT5677_GPIO1_DIR_OUT |
+			RT5677_GPIO1_OUT_LO | RT5677_GPIO1_P_NOR);
+		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
+			RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_GPIO1);
+
+		rt5677_set_vad_source(rt5677);
+		rt5677_set_dsp_mode(rt5677, true);
+
+		/* Boot the firmware from IRAM instead of SRAM0. */
+		rt5677_dsp_mode_i2c_write_addr(rt5677, RT5677_DSP_BOOT_VECTOR,
+			0x0009, 0x0003);
+		rt5677_dsp_mode_i2c_write_addr(rt5677, RT5677_DSP_BOOT_VECTOR,
+			0x0019, 0x0003);
+		rt5677_dsp_mode_i2c_write_addr(rt5677, RT5677_DSP_BOOT_VECTOR,
+			0x0009, 0x0003);
+
+		rt5677_load_dsp_from_file(rt5677);
+
+		/* Set DSP CPU to Run */
+		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
+			RT5677_PWR_DSP_CPU, 0x0);
+	} else if (!enable && activity) {
 		activity = false;
 
-		regcache_cache_only(rt5677->regmap, false);
-		regcache_cache_bypass(rt5677->regmap, true);
+		/* Set DSP CPU to Stop */
+		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
+			RT5677_PWR_DSP_CPU, RT5677_PWR_DSP_CPU);
 
-		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1, 0x1, 0x1);
-		rt5677_set_dsp_mode(component, false);
-		regmap_write(rt5677->regmap, RT5677_PWR_DSP1, 0x0001);
+		rt5677_set_dsp_mode(rt5677, false);
 
-		regmap_write(rt5677->regmap, RT5677_RESET, 0x10ec);
+		/* Disable and clear VAD interrupt */
+		regmap_write(rt5677->regmap, RT5677_VAD_CTRL1, 0x2184);
+		regmap_update_bits(rt5677->regmap, RT5677_IRQ_CTRL2,
+			0xF000, 0x0000);
 
-		regcache_cache_bypass(rt5677->regmap, false);
-		regcache_mark_dirty(rt5677->regmap);
-		regcache_sync(rt5677->regmap);
-	}
+		/* Set GPIO1 pin back to be IRQ output for jack detect */
+		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
+			RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
 
-	return 0;
+	}
 }
 
 static const DECLARE_TLV_DB_SCALE(dac_vol_tlv, -6525, 75, 0);
@@ -819,7 +969,8 @@ static int rt5677_dsp_vad_put(struct snd_kcontrol *kcontrol,
 	rt5677->dsp_vad_en = !!ucontrol->value.integer.value[0];
 
 	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
-		rt5677_set_dsp_vad(component, rt5677->dsp_vad_en);
+		rt5677_set_dsp_vad(component,
+				!!ucontrol->value.integer.value[0]);
 
 	return 0;
 }
@@ -4740,6 +4891,8 @@ static void rt5677_remove(struct snd_soc_component *component)
 {
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
 
+	cancel_delayed_work_sync(&rt5677->dsp_work);
+
 	regmap_write(rt5677->regmap, RT5677_RESET, 0x10ec);
 	gpiod_set_value_cansleep(rt5677->pow_ldo2, 0);
 	gpiod_set_value_cansleep(rt5677->reset_pin, 1);
@@ -4938,6 +5091,17 @@ static struct snd_soc_dai_driver rt5677_dai[] = {
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
@@ -5081,6 +5245,9 @@ static irqreturn_t rt5677_irq(int unused, void *data)
 
 	mutex_lock(&rt5677->irq_lock);
 
+	if (rt5677->dsp_vad_en)
+		rt5677_spi_hotword_detected();
+
 	/*
 	 * Loop to handle interrupts until the last i2c read shows no pending
 	 * irqs. The interrupt line is shared by multiple interrupt sources.
@@ -5271,6 +5438,8 @@ static int rt5677_i2c_probe(struct i2c_client *i2c)
 		return -ENOMEM;
 
 	rt5677->dev = &i2c->dev;
+	rt5677->set_dsp_vad = rt5677_set_dsp_vad;
+	INIT_DELAYED_WORK(&rt5677->dsp_work, rt5677_dsp_work);
 	i2c_set_clientdata(i2c, rt5677);
 
 	if (i2c->dev.of_node) {
diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index 213f4b8ca269..d18b41da1176 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -1730,6 +1730,7 @@ enum {
 	RT5677_AIF4,
 	RT5677_AIF5,
 	RT5677_AIFS,
+	RT5677_DSPBUFF,
 };
 
 enum {
@@ -1845,14 +1846,17 @@ struct rt5677_priv {
 #ifdef CONFIG_GPIOLIB
 	struct gpio_chip gpio_chip;
 #endif
-	bool dsp_vad_en;
+	bool dsp_vad_en; /* DSP VAD enable/disable request */
 	bool is_dsp_mode;
 	bool is_vref_slow;
+	struct delayed_work dsp_work;
 
 	/* Interrupt handling */
 	struct irq_domain *domain;
 	struct mutex irq_lock;
 	unsigned int irq_en;
+
+	int (*set_dsp_vad)(struct snd_soc_component *component, bool on);
 };
 
 int rt5677_sel_asrc_clk_src(struct snd_soc_component *component,
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
