Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC61739BC33
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 17:47:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6252A1732;
	Fri,  4 Jun 2021 17:46:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6252A1732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622821650;
	bh=1g4+rsWwKXPCMnh6H0UOEAqhvVTIr0NoskWd1wTxgAw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IrwXGL3OdBNl0BsjbLWUVt6eAMyB/WHq/XYpS9QNbiWYftgNmmMdhZLAjKL9qLlM8
	 GTMzZXMhO523LtjRtoTbPxLYD5xf6AXcon5i+KDrJqByunRbynyezi3JafDIU0w0Fr
	 hy/Qn+RpWDrq8G+FuU47VlsQObOUf6KO6iYINLFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D943FF800CC;
	Fri,  4 Jun 2021 17:46:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F172CF802C4; Fri,  4 Jun 2021 17:45:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04743F80103
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 17:45:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04743F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="eGT9s1eW"
Received: by mail-pf1-x42a.google.com with SMTP id d16so7702361pfn.12
 for <alsa-devel@alsa-project.org>; Fri, 04 Jun 2021 08:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a5EjbHKyRmPqFqJNdWdtRulg9RgvdBFGpjQPIOIUGK0=;
 b=eGT9s1eW6nJHUhaflPkw1/ciH92NJKRDaUmJynYbJHbsFHDiFKv50VNwx3jp3fa5QS
 dbARc7MizK4sck+RoVNvIoQA2rRcAXXO/cehyaypW+U3OYUZhwRhQBwQyJvlvCumQuWZ
 ta7QOGg29iaaF7dIIzUJpCLSHOqjjIX80gLZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a5EjbHKyRmPqFqJNdWdtRulg9RgvdBFGpjQPIOIUGK0=;
 b=B890KgqUrP+ReAqeGClz6xXznllp21nfunBIDQvDhcE6NWAANcF9ptDaAjCsKlJxgE
 YcBPFQR3RQ2DHDVjloLGAZtyuZ5niEBRqEKSUASPSiSZw0H75neqUN9V5ZrKB5nFl/rU
 7uIdkRWJVWzRWNhr/nJheuvlUfKNagpQFlh1BXNoLBNEfrsV3v+kka1lGmO98U8oc7xZ
 l1l6lznUFZALs0K6Cr8S/IxaATXgntqLmx61lDZSvNbgTocszRPmFuiL8g7hWJbC79Of
 Cr0JCD0T6GTW30nCNNPevks3ibYA9qoKfl7I37j+fRy5ZW6Lrd/RIMQ5hq+YfwWKvdwy
 lw6Q==
X-Gm-Message-State: AOAM530F22XHzIe7jFE9olXELEKwpbmZztfqm80KlSEPbDAAQxMyY/cJ
 Epa/Ea6kxtTIFihvnrVAJk32eQ==
X-Google-Smtp-Source: ABdhPJyZDUc5tobk1AFXQ8CJuc0fdrT9sQMsn/EKREBxO85vuXkbQo4TnNSSuEmVjq8RwbztUXng7w==
X-Received: by 2002:a63:7e0a:: with SMTP id z10mr5463508pgc.12.1622821553412; 
 Fri, 04 Jun 2021 08:45:53 -0700 (PDT)
Received: from judyhsiao-p920.tpe.corp.google.com
 ([2401:fa00:1:10:acd8:2ca0:5ce2:556f])
 by smtp.gmail.com with ESMTPSA id g22sm2025806pfv.123.2021.06.04.08.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:45:52 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: broonie@kernel.org
Subject: [v7] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture begin
Date: Fri,  4 Jun 2021 23:45:45 +0800
Message-Id: <20210604154545.1198337-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
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
Changes Since V6:
	-- Removed clk_disable OSR clock in lpass_cpu_daiops_prepare error case as failure
           of prepare will result in calling shutdown which should take care of this.
Changes Since V5:
        -- Fixed nit.
        -- Updated `mi2s_was_prepared[dai->driver->id] = true;` after checking for errors.
Changes Since V4:
        -- Replaced the __clk_is_enabled(BCLK) check by the self maintained.
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

 sound/soc/qcom/lpass-cpu.c | 79 ++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/lpass.h     |  4 ++
 2 files changed, 83 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index af8cb64924a0..647423a6cb57 100644
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
@@ -315,12 +353,53 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
+	unsigned int id = dai->driver->id;
+	int ret;
+
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
+		ret = clk_enable(drvdata->mi2s_bit_clk[id]);
+		if (ret) {
+			dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
+			return ret;
+		}
+		drvdata->mi2s_was_prepared[dai->driver->id] = true;
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
2.32.0.rc1.229.g3e70b5a671-goog

