Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6BCE3C9
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 15:31:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C5F4166E;
	Mon, 29 Apr 2019 15:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C5F4166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556544702;
	bh=alszsw4kxd6BWHYqE9KsWHvAj0iIyuYUhKqGhhE2SgM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZigFO9mXNLPySViVpqqBCBWn/68vThMIDYziu9/kdLXZJ28U3AHdMs0php6Cn04ja
	 pEdGh/owdnSOtDR5538tJpPa1ROG94cGLYmiQa/8ZwmE6TasNwVHbIUfw2gwcl6jDc
	 pU4L11dGR5dNs0Qictx4F3YL2yIUfc26dnnvHWmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BA38F896F5;
	Mon, 29 Apr 2019 15:29:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7C38F896B7; Mon, 29 Apr 2019 15:29:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8C19F80641
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 15:29:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8C19F80641
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="pFUVGdlR"
Received: by mail-wr1-x442.google.com with SMTP id l2so406619wrb.9
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 06:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u5gkjIo0jKHz5nMirUsgx+T49vpY9J+GcHz2XWc4FKc=;
 b=pFUVGdlRPrcuUqW2/0hELTzPbKKNEYhqDI3CkoHGbZm5Yq65C2D4IF8ZEXBAdCGtm8
 6y06tr2gg4sOArlY8cGKjM3ebjdz0ngMoptkgu46RzVGo5BR9g2+DFM/wOEPtp9o8wT4
 Rwoc0G8zd17SAbTmHP7FagKPPu93ZXMX/8yb+MbH4oV242MLkVQFh4kWT4loQuxdmu0x
 tYoULFW6Gm/RlFujGK8PtsjODesDRrDXCUEXXxbX1fOWnMy/BdnVREtQkCQeYj8X50nr
 ymiJSVYd7oFu6C++IEeQyMRAe+AFq2Wdm4m2vv7Zk3zP031MG5rTwCecm4QiH1gEyYXu
 Hx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u5gkjIo0jKHz5nMirUsgx+T49vpY9J+GcHz2XWc4FKc=;
 b=GWTBV/wB+obI9fweeVCXK2jQ7Dt6QcMZOIa46bAOzIngM8kNKdVNDVDPtEB8jRi1sG
 DU97cdWumCCTX670OBlLUw7Uf+FNt6wyGf/HoTXBsRODJmwdBTKoeSNLhRddBge0/+Db
 fqysQxLyrsL68nSn+88Y4RFCkvfPCsijjO6wC1oLJ9QPIPJqTm0BNStUzcMJkVlVrxlP
 KIsEMe756pqhoWobMR2MSHICT+c03lz/B5kybWa7dEkADwBnti5j6s1Y3TdGGgSn9Txk
 e031foAAy33s9WB8F0/DwGBeLdGaGeZLT4vJ8zZjw2rlv9OSF1/JUkYnSMVBP91cQekT
 125w==
X-Gm-Message-State: APjAAAVAW99YbhZQY132MSJ7EboxYq6+T3MEjC7HGTCfdE6HV26tmjV9
 Lwb/cdZxXbfuiML/AW8FXfEHFg==
X-Google-Smtp-Source: APXvYqwQRjw0fpniFRPWZPbufXRuMFumxyoEfAbrckJdhgOSUuRSLDn24hIGZQuswECs2edXbWvhNQ==
X-Received: by 2002:a5d:4392:: with SMTP id i18mr10153524wrq.239.1556544589439; 
 Mon, 29 Apr 2019 06:29:49 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id s17sm2857593wra.94.2019.04.29.06.29.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 06:29:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon, 29 Apr 2019 15:29:38 +0200
Message-Id: <20190429132943.16269-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429132943.16269-1-jbrunet@baylibre.com>
References: <20190429132943.16269-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 1/6] ASoC: hdmi-codec: remove function name
	debug traces
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

Remove the debug traces only showing the function name on entry.
The same can be obtained using ftrace.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/hdmi-codec.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index e5b6769b9797..9dca24732069 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -416,8 +416,6 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
 	int ret = 0;
 
-	dev_dbg(dai->dev, "%s()\n", __func__);
-
 	ret = hdmi_codec_new_stream(substream, dai);
 	if (ret)
 		return ret;
@@ -453,8 +451,6 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
 
-	dev_dbg(dai->dev, "%s()\n", __func__);
-
 	WARN_ON(hcp->current_stream != substream);
 
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
@@ -531,8 +527,6 @@ static int hdmi_codec_set_fmt(struct snd_soc_dai *dai,
 	struct hdmi_codec_daifmt cf = { 0 };
 	int ret = 0;
 
-	dev_dbg(dai->dev, "%s()\n", __func__);
-
 	if (dai->id == DAI_ID_SPDIF) {
 		cf.fmt = HDMI_SPDIF;
 	} else {
@@ -602,8 +596,6 @@ static int hdmi_codec_digital_mute(struct snd_soc_dai *dai, int mute)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
 
-	dev_dbg(dai->dev, "%s()\n", __func__);
-
 	if (hcp->hcd.ops->digital_mute)
 		return hcp->hcd.ops->digital_mute(dai->dev->parent,
 						  hcp->hcd.data, mute);
@@ -661,8 +653,6 @@ static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
 	};
 	int ret;
 
-	dev_dbg(dai->dev, "%s()\n", __func__);
-
 	ret =  snd_pcm_add_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
 				      NULL, drv->playback.channels_max, 0,
 				      &hcp->chmap_info);
@@ -759,8 +749,6 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 	int dai_count, i = 0;
 	int ret;
 
-	dev_dbg(dev, "%s()\n", __func__);
-
 	if (!hcd) {
 		dev_err(dev, "%s: No plalform data\n", __func__);
 		return -EINVAL;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
