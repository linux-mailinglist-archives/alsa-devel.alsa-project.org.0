Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81295398F62
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 17:55:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0582E16F8;
	Wed,  2 Jun 2021 17:54:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0582E16F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622649344;
	bh=7I1MzKbiSMm15nA9vr4y5OcPMYPM8xxGaMUolVgl80g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qre6ThoLr5JRrBtdwkHCQrs50m9NbENK9nRHSUVhGUSQgjvZM1OR/uwgbhF5pkoMe
	 ek/p6Up8rO6QKj/QxkhA9yZqYkhy0V4+Zw3PEEqR0LnI/1NIsEOqLpKT9AsWq03+t2
	 /crMP681s5lEliLUUHA3a/suYoRTkDtf6EC9+5qE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70A82F80141;
	Wed,  2 Jun 2021 17:54:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCD9DF80424; Wed,  2 Jun 2021 17:54:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61179F80141
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 17:54:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61179F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="LikNTzQH"
Received: by mail-pl1-x632.google.com with SMTP id e7so1322896plj.7
 for <alsa-devel@alsa-project.org>; Wed, 02 Jun 2021 08:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6eUn2CKAEvAQxy2DnamJOaAA1e9GRcSJipc3TEWJrhE=;
 b=LikNTzQHy1n5neED/lwLxnxo/jXD1lbjbb+f4Rf7f65tNCZ+IGJkWeyTJlNeLI8o5R
 vVt/8hINqDRt1md3qbTA3rfBz+ibNWA4TlpMNcdrZ63ULgM1yRBU/sASty3BbKXMug+Y
 EPzItbzd/d+8sQf0oLA6k8GLvuO5qviFtgEHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6eUn2CKAEvAQxy2DnamJOaAA1e9GRcSJipc3TEWJrhE=;
 b=aceTya3GYAV5s10zel6Bj84qTyxJXPObnT/tAAlIE0HgVmJFftoswvxXcDBwotwqQU
 UuSirfilJ4kczzWvmxha6CefSv81u8lPOTSWeuw8dnvwpLw6E/pSvVIUD6xVH8Vg5c/f
 n/3Y8cIkW7dQhyE2vdQGodeRMIhjqz/VVLsC/RwGRXBVTPR2mtFAjw7Mj+JL9guXRXnx
 Ts7CsQ2zupommwwxvs/U9Q0/luAxLEHFJiKd53ozAX6YOSrpv9QHrm8xs7UDhSFzKbNG
 rhEtW/0yqIIMgrc9bqd4+vekI3PV+0pKbzz4/uImbIcCGTbiUIsw0D6cskpsMxeIxtko
 3R5g==
X-Gm-Message-State: AOAM532gAFusYjQ9xlAT0YJWXYKD1oT/nSh2UeCsPs8xNEP2B18xo9fF
 wb38+9uQ6vu7UDuJr9w9d1EQZg==
X-Google-Smtp-Source: ABdhPJwkwFlxLaJa1wMThRqlR5fQ9T2+udO5SqG3nQCnWfmZWA+GaI0ZaNSKHKdZ3FuqE5DqZKk4eQ==
X-Received: by 2002:a17:902:904a:b029:101:af84:4f55 with SMTP id
 w10-20020a170902904ab0290101af844f55mr23927230plz.80.1622649242652; 
 Wed, 02 Jun 2021 08:54:02 -0700 (PDT)
Received: from judyhsiao-p920.tpe.corp.google.com
 ([2401:fa00:1:10:66d2:43a8:d331:5a46])
 by smtp.gmail.com with ESMTPSA id 65sm82035pfu.159.2021.06.02.08.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 08:54:01 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: broonie@kernel.org
Subject: [v4] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture begin
Date: Wed,  2 Jun 2021 23:53:12 +0800
Message-Id: <20210602155312.207401-1-judyhsiao@chromium.org>
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
introducing some delay before capture start and clock enable.

Co-developed-by: Judy Hsiao <judyhsiao@chromium.org>
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
(am from https://patchwork.kernel.org/patch/12276369/)
(also found at https://lore.kernel.org/r/20210524142114.18676-1-srivasam@codeaurora.org)

---
Chages Since V3:
        -- Check BCLK is off before enabling it in lpass_cpu_daiops_prepare as
           lpass_cpu_daiops_prepare can be called multiple times.
        -- Check BCLK is on before disabling it in lpass_cpu_daiops_shutdown to
           fix the WARN. It is because BCLK may not be enabled if
           lpass_cpu_daiops_prepare is not called before lpass_cpu_daiops_shutdown.
        -- Adds more comments.
Changes Since V2:
        -- Updated comments as per linux style
        -- Removed unrelated changes.
Changes Since V1:
        -- Enableed BCLK and LRCLK in dai ops prepare API instead of startup API
        -- Added comments

 sound/soc/qcom/lpass-cpu.c | 83 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index af8cb64924a0..b572d7874554 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -93,8 +94,28 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
+	unsigned int id = dai->driver->id;
 
 	clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
+	/*
+	 * To ensure LRCLK disabled even in device node validation
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
+	if (__clk_is_enabled(drvdata->mi2s_bit_clk[dai->driver->id]))
+		clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
+
 	clk_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
 }
 
@@ -275,6 +296,18 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		/*
+		 * To ensure lpass BCLK/LRCLK is enabled during
+		 * device resume as lpass_cpu_daiops_prepare() is not called
+		 * after the device resumes. We don't check BCLK status before
+		 * enable/disable BCLK in trigger event because:
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
@@ -288,7 +321,8 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 
 		ret = clk_enable(drvdata->mi2s_bit_clk[id]);
 		if (ret) {
-			dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
+			dev_err(dai->dev,
+				"error in enabling mi2s bit clk: %d\n", ret);
 			clk_disable(drvdata->mi2s_osr_clk[id]);
 			return ret;
 		}
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
@@ -315,12 +353,55 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
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
+	 * To ensure lpass BCLK/LRCLK is enabled bit before playback/capture
+	 * data flow starts. This allows other codec to have some delay before
+	 * the data flow.
+	 * (ex: to drop start up pop noise before capture starts).
+	 */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		ret = regmap_fields_write(i2sctl->spken, id,
+			LPAIF_I2SCTL_SPKEN_ENABLE);
+	else
+		ret = regmap_fields_write(i2sctl->micen, id,
+			LPAIF_I2SCTL_MICEN_ENABLE);
+
+	if (ret) {
+		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Check BCLK is off before enabling it as lpass_cpu_daiops_prepare can
+	 * be called multiple times. It's paired with the clk_disable in
+	 * lpass_cpu_daiops_shutdown.
+	 */
+	if (!__clk_is_enabled(drvdata->mi2s_bit_clk[dai->driver->id])) {
+		ret = clk_enable(drvdata->mi2s_bit_clk[id]);
+		if (ret) {
+			dev_err(dai->dev,
+				"error in enabling mi2s bit clk: %d\n", ret);
+			clk_disable(drvdata->mi2s_osr_clk[id]);
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
 
-- 
2.31.0

