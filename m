Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6B0434A6D
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 13:44:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD9E416D5;
	Wed, 20 Oct 2021 13:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD9E416D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634730285;
	bh=+vGHNzjCHV3m4sFkBUMo266c78r/pLF1jEgqVpYK1mw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gAMkOodYxCFQKQVfLdwf3dNm3tCxycTgVmVUdhlxDeO4xD76RQoXssuL9WHK9qpQU
	 Bo1QlVM2hClYWuFFm/r0PBMRf2aALc0n/4Z4Lq8lnY4MRzLf+qKaEJCfPbWzKNXyti
	 jSs6nFcKNQDkuN4k3IzKdnozgS1PeCymX+LdIF1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E7A5F804F1;
	Wed, 20 Oct 2021 13:42:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 214BCF804ED; Wed, 20 Oct 2021 13:42:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0773F80082
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 13:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0773F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="CSs/m7Zi"
Received: by mail-wm1-x32a.google.com with SMTP id o24so10881225wms.0
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 04:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qt1kRkQIhdl5KXXeNc9j0xtUv1cZrn94RpXEyZ0WvkQ=;
 b=CSs/m7ZiRFp2v9dmNvryyzrk/kgz9iLi+f2hjBXZ86n0m66tOIlF4bDh7TwJRT1YeQ
 xtBGU9XamE3lh+vsqdLOabMO5xm1lkoHFIupF1+zP32Zesf/TOmtuj56oEbiVFHYKcYj
 xlWS/CYCWtAW+LhgD3srkF/TORtFL79SqihWMaU1ga/VS1usykttVpe5JTNzM36AbqS/
 /DthTpsIp6ZetkkMqdYyK7wmpb1CEIOipRi4S+kQa05b0IbSDbxhRYPx8RjVflQmADO7
 g3A0WZ0DtBg45SmRNRXQ9whBClOz6e+KKRRY0s/BZe2P0bNcoFXhoBw6LcCy0vkaVGCn
 leIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qt1kRkQIhdl5KXXeNc9j0xtUv1cZrn94RpXEyZ0WvkQ=;
 b=qXsaEOQgAIODTZFmYYQXC5iwaM/JvjSAW+bfnxRpah46uz80uNLxUMByvYyriQ8DPO
 j/sbnuAkCgqTGKswrL71DRC5t9T00Hk8oz6Ty1Bo5AdvtnmLhaIntTFAcTElx7G8KoDP
 B/0NEyRCtcPWtOG/2qL5diLaSRZfNGzdwPrMcA653koOEmszkABLfUYoqMLLOTRgRCsr
 /dNJGuSj3oKoVJ6vCRrcHSi6IwwSevfGChABZbuYuhOQth7/kmKqmO/BqWlTueHvpPgQ
 gWLID1GI2xP1Emq96vDGW2MJOeo+0XWiMKZfjWSGK7AYa9e1Vl01TJsx2onKrDM7SUYx
 FqTA==
X-Gm-Message-State: AOAM532xYVtwgPVhUqP2chaaABUUaxVdfvLL4FezxC/odbk8FAmqidFS
 G+hU2lkeZoYqXbuNsFXnOYE5lw==
X-Google-Smtp-Source: ABdhPJywVaZAqRITJci/WxzJmCqmvcgN4vbJsFCQPeyynKUpuyJ2uNuZgf6d9710w0xmYnfDbyl08w==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr51027972wru.65.1634730154240; 
 Wed, 20 Oct 2021 04:42:34 -0700 (PDT)
Received: from jackdaw.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id s14sm1732927wro.76.2021.10.20.04.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 04:42:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: meson: axg-tdm-interface: manage formatters in
 trigger
Date: Wed, 20 Oct 2021 13:42:17 +0200
Message-Id: <20211020114217.133153-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020114217.133153-1-jbrunet@baylibre.com>
References: <20211020114217.133153-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
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

So far, the formatters have been reset/enabled using the .prepare()
callback. This was done in this callback because walking the formatters use
a mutex so it could not be done in .trigger(), which is atomic by default.

It turns out there is a problem on capture path of the AXG series.
The FIFO may get out of sync with the TDM decoder if the IP are not enabled
in a specific order. The FIFO must be enabled before the formatter starts
producing data. IOW, we must deal with FE before the BE. The .prepare()
callback is called on the BEs before the FE so it is not OK for the AXG.

The .trigger() callback order can be configured, and it deals with the FE
before the BEs by default. To solve our problem, we just need to start and
stop the formatters from the .trigger() callback. It is OK do so now that
the links have been made 'nonatomic' in the card driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 87cac440b369..db077773af7a 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -351,13 +351,29 @@ static int axg_tdm_iface_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int axg_tdm_iface_prepare(struct snd_pcm_substream *substream,
+static int axg_tdm_iface_trigger(struct snd_pcm_substream *substream,
+				 int cmd,
 				 struct snd_soc_dai *dai)
 {
-	struct axg_tdm_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct axg_tdm_stream *ts =
+		snd_soc_dai_get_dma_data(dai, substream);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		axg_tdm_stream_start(ts);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_STOP:
+		axg_tdm_stream_stop(ts);
+		break;
+	default:
+		return -EINVAL;
+	}
 
-	/* Force all attached formatters to update */
-	return axg_tdm_stream_reset(ts);
+	return 0;
 }
 
 static int axg_tdm_iface_remove_dai(struct snd_soc_dai *dai)
@@ -397,8 +413,8 @@ static const struct snd_soc_dai_ops axg_tdm_iface_ops = {
 	.set_fmt	= axg_tdm_iface_set_fmt,
 	.startup	= axg_tdm_iface_startup,
 	.hw_params	= axg_tdm_iface_hw_params,
-	.prepare	= axg_tdm_iface_prepare,
 	.hw_free	= axg_tdm_iface_hw_free,
+	.trigger	= axg_tdm_iface_trigger,
 };
 
 /* TDM Backend DAIs */
-- 
2.33.0

