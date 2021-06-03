Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 991F539A3FF
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 17:10:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F25B71706;
	Thu,  3 Jun 2021 17:09:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F25B71706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622733027;
	bh=Rd4rddmaEAPj/zvx1obGBGelPweQVo8FFyROMbO+Z50=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dDTbpgf3xu+NpCBuhpsokYW+3TXMfzgh0SYuRRuCkSoRhApou0mqFppOwywKKI473
	 s4LPPdyCe/5kMkJQIn2IqpKSpjOBvVJt+hI18tBvSAnn4/Xfh7Nqg6sKdlwsz0w8Lx
	 qkOmphW0cVg/oZefN7bZ89OXGKFY5vWAFk3xhWsM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5141FF80253;
	Thu,  3 Jun 2021 17:08:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0912AF80254; Thu,  3 Jun 2021 17:08:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E435AF800E5
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 17:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E435AF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ZTihRspu"
Received: by mail-pj1-x1031.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso3518028pjx.1
 for <alsa-devel@alsa-project.org>; Thu, 03 Jun 2021 08:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PcpREyx/sY/lgerr3vzlgOD6wtcXgn5d39afLXx/Ta4=;
 b=ZTihRspu2XkfwNLTIOj5sL0Gfpi0sZ7kt97ib8Jh4tE7tNk5XU+jJO0q8MPzWDFv92
 3lr74zbq6iVIBd+ctUJjRQZk3KjvrNP4RAOBFiT+LLGMhKz4s0Nxr3FtKEgjocn6rk9o
 lzLqUTZoISv5T5PKJDzTqNRfzUIHrPlirnFF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PcpREyx/sY/lgerr3vzlgOD6wtcXgn5d39afLXx/Ta4=;
 b=DtJEZCPkkElYaQxts0K4JvrBe8nBvhF5/oOu/9zKH0oVKdHsizh83Lfy/6dgwweGhH
 JPIRJs+sGBWgB2DTQQvM2qHrIhoeTa8Fa31gU1g5KqAwNMljceZ/AeCQUy4Ruo2miyCF
 U4kLvibP54opfqv8a2oVuLC3ttInmx0UMtYZoFwvCDDsGILjGQ4Nt2XAPsvLwsY8V3lA
 cbvztx07m8xhNkpnxcJnK8Dzznnf88n0gmsJ3oNL/+BOcVFqlJpTWg0UKv2qFYYGR72F
 xCDETVCGunzBKMdzT3DXLmhBzfnbEgbRRYI/GhGtFxQDZm2WH89LRoAxoSSSCZ07hsLe
 yO8A==
X-Gm-Message-State: AOAM533juCueP68YuYC+nhmblTTKGYKNt8+XPmeZL2QZBSZ68XXGl+Ht
 Tg600Gdv7a9qANa4X5USF5XYvg==
X-Google-Smtp-Source: ABdhPJx1tyBNbtivGMqKJi/quXPjFdCD+fu/JMMazLOzqO6y7Qxs/n3RJtLADR7CNqCpnPz8iJwvhw==
X-Received: by 2002:a17:902:ee8c:b029:fe:dc5f:564 with SMTP id
 a12-20020a170902ee8cb02900fedc5f0564mr131799pld.71.1622732927292; 
 Thu, 03 Jun 2021 08:08:47 -0700 (PDT)
Received: from judyhsiao-p920.tpe.corp.google.com
 ([2401:fa00:1:10:a8e1:b46e:86b1:84fb])
 by smtp.gmail.com with ESMTPSA id l70sm2467422pgd.20.2021.06.03.08.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:08:44 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: broonie@kernel.org
Subject: [v5] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture begin
Date: Thu,  3 Jun 2021 23:08:30 +0800
Message-Id: <20210603150830.229423-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Andy Gross <agross@kernel.org>, dgreid@chromium.org,
 devicetree@vger.kernel.org, judyhsiao@google.com, tzungbi@chromium.org,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 cychiang@google.com, Takashi Iwai <tiwai@suse.com>,
 Judy Hsiao <judyhsiao@chromium.org>
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

From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

This patch fixes PoP noise of around 15ms observed during audio
capture begin.
Enables BCLK and LRCLK in snd_soc_dai_ops prepare call for
introducing some delay before capture start.

Co-developed-by: Judy Hsiao <judyhsiao@chromium.org>
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
(am from https://patchwork.kernel.org/patch/12276369/)
(also found at https://lore.kernel.org/r/20210524142114.18676-1-srivasam@codeaurora.org)

---
Changes Since V4:
        -- Replaced the __clk_is_enabled(BCLK) check by the self maintained 
           mi2s_was_prepared bool state.
        -- Removed unrelated changes.
        -- Refined comments.
Changes Since V3:
        -- Checked BCLK is off before enabling it in lpass_cpu_daiops_prepare as
           lpass_cpu_daiops_prepare can be called multiple times
        -- Checked BCLK is on before disabling it in lpass_cpu_daiops_shutdown to
           fix the WARN. It is because BCLK may not be enabled if
           lpass_cpu_daiops_prepare is not called before lpass_cpu_daiops_shutdown
        -- Added more comments
Changes Since V2:
        -- Updated comments as per linux style
        -- Removed unrelated changes
Changes Since V1:
        -- Enabled BCLK and LRCLK in dai ops prepare API instead of startup API
        -- Added comments

 sound/soc/qcom/lpass-cpu.c | 80 ++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/lpass.h     |  4 ++
 2 files changed, 84 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index af8cb64924a0..3129e7cc25a4 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -93,8 +93,30 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
+	unsigned int id = dai->driver->id;
 
 	clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
+	/*
+	 * Ensure LRCLK is disabled even in device node validation.
+	 * Will not impact if disabled in lpass_cpu_daiops_trigger()
+	 * suspend.
+	 */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_DISABLE);
+	else
+		regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_DISABLE);
+
+	/*
+	 * BCLK may not be enabled if lpass_cpu_daiops_prepare is called before
+	 * lpass_cpu_daiops_shutdown. It's paired with the clk_enable in
+	 * lpass_cpu_daiops_prepare.
+	 */
+	if (drvdata->mi2s_was_prepared[dai->driver->id]) {
+		drvdata->mi2s_was_prepared[dai->driver->id] = false;
+		clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
+	}
+
 	clk_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
 }
 
@@ -275,6 +297,18 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		/*
+		 * Ensure lpass BCLK/LRCLK is enabled during
+		 * device resume as lpass_cpu_daiops_prepare() is not called
+		 * after the device resumes. We don't check mi2s_was_prepared before
+		 * enable/disable BCLK in trigger events because:
+		 *  1. These trigger events are paired, so the BCLK
+		 *     enable_count is balanced.
+		 *  2. the BCLK can be shared (ex: headset and headset mic),
+		 *     we need to increase the enable_count so that we don't
+		 *     turn off the shared BCLK while other devices are using
+		 *     it.
+		 */
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			ret = regmap_fields_write(i2sctl->spken, id,
 						 LPAIF_I2SCTL_SPKEN_ENABLE);
@@ -296,6 +330,10 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		/*
+		 * To ensure lpass BCLK/LRCLK is disabled during
+		 * device suspend.
+		 */
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			ret = regmap_fields_write(i2sctl->spken, id,
 						 LPAIF_I2SCTL_SPKEN_DISABLE);
@@ -315,12 +353,54 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
+	unsigned int id = dai->driver->id;
+	int ret;
+	/*
+	 * Ensure lpass BCLK/LRCLK is enabled bit before playback/capture
+	 * data flow starts. This allows other codec to have some delay before
+	 * the data flow.
+	 * (ex: to drop start up pop noise before capture starts).
+	 */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		ret = regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_ENABLE);
+	else
+		ret = regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_ENABLE);
+
+	if (ret) {
+		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Check mi2s_was_prepared before enabling BCLK as lpass_cpu_daiops_prepare can
+	 * be called multiple times. It's paired with the clk_disable in
+	 * lpass_cpu_daiops_shutdown.
+	 */
+	if (!drvdata->mi2s_was_prepared[dai->driver->id]) {
+		drvdata->mi2s_was_prepared[dai->driver->id] = true;
+		ret = clk_enable(drvdata->mi2s_bit_clk[id]);
+		if (ret) {
+			dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
+			clk_disable(drvdata->mi2s_osr_clk[id]);
+			drvdata->mi2s_was_prepared[dai->driver->id] = false;
+			return ret;
+		}
+	}
+	return 0;
+}
+
 const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
 	.set_sysclk	= lpass_cpu_daiops_set_sysclk,
 	.startup	= lpass_cpu_daiops_startup,
 	.shutdown	= lpass_cpu_daiops_shutdown,
 	.hw_params	= lpass_cpu_daiops_hw_params,
 	.trigger	= lpass_cpu_daiops_trigger,
+	.prepare	= lpass_cpu_daiops_prepare,
 };
 EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops);
 
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 83b2e08ade06..7f72214404ba 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -67,6 +67,10 @@ struct lpass_data {
 	/* MI2S SD lines to use for playback/capture */
 	unsigned int mi2s_playback_sd_mode[LPASS_MAX_MI2S_PORTS];
 	unsigned int mi2s_capture_sd_mode[LPASS_MAX_MI2S_PORTS];
+
+	/* The state of MI2S prepare dai_ops was called */
+	bool mi2s_was_prepared[LPASS_MAX_MI2S_PORTS];
+
 	int hdmi_port_enable;
 
 	/* low-power audio interface (LPAIF) registers */
-- 
2.31.0

