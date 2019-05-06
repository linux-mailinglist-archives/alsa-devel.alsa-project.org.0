Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7520314804
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 12:00:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02CA71862;
	Mon,  6 May 2019 12:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02CA71862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557136859;
	bh=wRniDwO7CG3IeruvbqENillNuts8Lbef2AmhncQdFR8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nzjEIvX7zkU83fiYonkbcTDHz0gNgmnK5rkE6Gx6ie71vjaXFs3T4ATI/VB4gj++D
	 xMLePePZw4llnG6RickEdFZCgp8tPbs0+M8H32lNVKyC6Tq+0YM+l78FBtQSafteTh
	 bR18B0aqqFslcg6YcS7AYNL7O/g73PcbLj0cA6Qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1D67F896FD;
	Mon,  6 May 2019 11:58:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB9E3F896E6; Mon,  6 May 2019 11:58:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63D96F8962A
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 11:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63D96F8962A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="AndrexMZ"
Received: by mail-wr1-x442.google.com with SMTP id l2so16454203wrb.9
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 02:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dfLtGNFClAo6TII3XvesnrIEXOA3C3N3iJ8W2ZBUhMY=;
 b=AndrexMZaltXMXLQICjUp7CV9V4Mp7tlXc1teK2aYdDDsqAYZ2XPSpQntKBfOyEKDY
 +gvcG8eud5mk0ltvrTQi9Q/S1CblmXA0+1qoJxiuzXDIfTxhpdWdSoYwY+oCW0E6S6sR
 DLBQB2PM9EG/5ruV9Hlmw0ATywSf+JpzT0VQYMw717AUIlQ/s+ZrqRiev7kjs5NyYE7t
 mJ0M9fkJJowP5MXW+Ut5eQCKV2QW5pMvaMs3T9VfPxqlh3+9zMdbbRLXgwtlTJjovFVV
 jgdWJGg+fw0/RN1PZyCfU18SKPvjeIo+e/Z9uIDEfGePi/orcdkcQWZJbPfUbypibZsx
 f9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dfLtGNFClAo6TII3XvesnrIEXOA3C3N3iJ8W2ZBUhMY=;
 b=bvd5xj9elz+r8eKWOIIEU++jmZJyPlR5OXCPg+WIu5ToHrd7xR16c0It5GVxNE+Zo+
 M0lcLii9HOe7KJUkUC3qH+bs18B6dcFpfXNql6PXjIwXX8EH30TKW17yFdlIFPe+tSt7
 x+MiSiQ8gp6kluupFYxg+4f2TOEFk6k0NTDrMl8DkRg3fCGIzdfcVLgzAzXqA9IjGSyb
 e5FZPTOZjsp+zIRxlNbxxAo/eoWKNnEVZFi1wJ3tS58b9WR+6W8mbWwn9D5bzeKnTnRM
 t+TWkIpfjnr2vtD7nIrHeKLH0qr5iNXcMLC8hkXO8zhLmrVdZjTsBOSLaoPLLirPhECm
 YTbA==
X-Gm-Message-State: APjAAAWKXonWmhOMGVqzfx4i3g7brNjePCbL1r/hf5NOOSCihGp21s1i
 8oGYFWTnSyq63OeGTeFYoz8SHw==
X-Google-Smtp-Source: APXvYqyU5tzeDEIIy4cT2QjaaJ2oiPWaQMuDSG+/sop7ymmJTLBYxOZBAITjLAETmZyF60k8YnF6xA==
X-Received: by 2002:a5d:6249:: with SMTP id m9mr611030wrv.255.1557136703654;
 Mon, 06 May 2019 02:58:23 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id c10sm23409791wrd.69.2019.05.06.02.58.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 02:58:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon,  6 May 2019 11:58:12 +0200
Message-Id: <20190506095815.24578-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506095815.24578-1-jbrunet@baylibre.com>
References: <20190506095815.24578-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH v2 1/4] ASoC: hdmi-codec: remove function name
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
index 39caf19abb0b..eb31d7eddcbf 100644
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
@@ -457,8 +455,6 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
 
-	dev_dbg(dai->dev, "%s()\n", __func__);
-
 	WARN_ON(hcp->current_stream != substream);
 
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
@@ -527,8 +523,6 @@ static int hdmi_codec_set_fmt(struct snd_soc_dai *dai,
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
 	struct hdmi_codec_daifmt cf = { 0 };
 
-	dev_dbg(dai->dev, "%s()\n", __func__);
-
 	if (dai->id == DAI_ID_SPDIF)
 		return 0;
 
@@ -597,8 +591,6 @@ static int hdmi_codec_digital_mute(struct snd_soc_dai *dai, int mute)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
 
-	dev_dbg(dai->dev, "%s()\n", __func__);
-
 	if (hcp->hcd.ops->digital_mute)
 		return hcp->hcd.ops->digital_mute(dai->dev->parent,
 						  hcp->hcd.data, mute);
@@ -656,8 +648,6 @@ static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
 	};
 	int ret;
 
-	dev_dbg(dai->dev, "%s()\n", __func__);
-
 	ret =  snd_pcm_add_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
 				      NULL, drv->playback.channels_max, 0,
 				      &hcp->chmap_info);
@@ -754,8 +744,6 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 	int dai_count, i = 0;
 	int ret;
 
-	dev_dbg(dev, "%s()\n", __func__);
-
 	if (!hcd) {
 		dev_err(dev, "%s: No platform data\n", __func__);
 		return -EINVAL;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
