Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ACD733DC
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 18:27:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01B411928;
	Wed, 24 Jul 2019 18:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01B411928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563985647;
	bh=E6Ssrlxd9jJWXLToZeIxrOTUuw8V7Aq4BC4vMMBYHtk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dFv1NjN5mv8KvxyMFM/IW5zZ/yi11gaLkXUv2DIY35xcAXyKqdsekEzZLHf1ui8t1
	 tVclBJGIo2bMeDeAxz+bahpPczuGVH9IydxrIW72iXCsLe12dpxgtwQ88YJoEPci+2
	 B4iitodLOy+xIqEDYt6SofvRvV3Q3OtOZs50kNxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4210DF804CF;
	Wed, 24 Jul 2019 18:24:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0F65F8049B; Wed, 24 Jul 2019 18:24:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B47F5F8048D
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 18:24:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B47F5F8048D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="PPUpu2Uk"
Received: by mail-wm1-x343.google.com with SMTP id v15so42408764wml.0
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 09:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Npvt6BnLoRE+ITNaKiuWjMdj+Jqxi0Z7NGG0xDY8eZY=;
 b=PPUpu2UkVrvoFD58jMMOxwF8SwBcLWeMm6AdGHu32jkbpMAD7Eg35djpLxCBi2fMDx
 0CxgU2P1kCEHKkMn4Elyn5ujwm+PeMd5CTF6eojwwGsHXP/nL1EgGvFdUZkSoRs+Bp96
 MJMh/rpOXNtt8dBM2uXRtqixTB9f3Tb6SH+Ece61kAKLtRkjJbWWEpr6s2ux2PaxDuD9
 Ea0i5p5nEreZOyRnnnuE4yReUMaDmvpktXnpAlZh38dcRK5DBm0tFgNZMijZkSebyinJ
 HkKCoSQfh9IXQEQn1eJ+qGqfov17Vww7kyvlbGqMUjXDEWdm4dIRP/IUI265UeYG4cEH
 79YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Npvt6BnLoRE+ITNaKiuWjMdj+Jqxi0Z7NGG0xDY8eZY=;
 b=KsnSVUF1XjjwwBCgyZAs9gY3LIUDZjh6MI6kmtfy/kxSqLWIzSKsnlesrqM7zCSybG
 mKAVfvJlQ1CPhHjPObIkKxbNHuRhMyC76HvOv+SSjmnTiAFe4c+xth3LLMEjjnWZ1xIf
 t3jstaBrCoL5TWncW8MXt5e0f2Hru6B5dKc4+vU7J5IuGtb1iblW60tCFcgycuatr31d
 kbYaXApxm/OWOlM2U2kMPrMAhdXEXXvqP/jdQw2BvqGSKd/67ceZG9ej7iApEP2fUSgd
 4wPz1V9tonFrYZzGuXXw1dgG9dhDpMawamzzLMRokdjyYd3TysgNROfEGUhNJjrfXwnZ
 HAhA==
X-Gm-Message-State: APjAAAXhysLRQ+SiFaOLk6xGYoTvoUIYQXynDmO2LKVHjD3vwWllF8xa
 Z36qAqagty7ie25Ye/q0gwKQ3g==
X-Google-Smtp-Source: APXvYqxbB0+hlRjwpVSHseapZwEaI2p3LvGV7HWs+1hzOz2F2kLsTMcPSZVa4XmP+b9EpqBLQ2BEMw==
X-Received: by 2002:a1c:a101:: with SMTP id k1mr76948104wme.98.1563985451734; 
 Wed, 24 Jul 2019 09:24:11 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f70sm55688960wme.22.2019.07.24.09.24.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 09:24:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Wed, 24 Jul 2019 18:24:01 +0200
Message-Id: <20190724162405.6574-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724162405.6574-1-jbrunet@baylibre.com>
References: <20190724162405.6574-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 2/6] ASoC: codec2codec: name link using stream
	direction
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

At the moment, codec to codec dai link widgets are named after the
cpu dai and the 1st codec valid on the link. This might be confusing
if there is multiple valid codecs on the link for one stream
direction.

Instead, use the dai link name and the stream direction to name the
the dai link widget

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-dapm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 5348abda7ce2..d20cd89513a4 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4056,8 +4056,7 @@ snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
 
 static struct snd_soc_dapm_widget *
 snd_soc_dapm_new_dai(struct snd_soc_card *card, struct snd_soc_pcm_runtime *rtd,
-		     struct snd_soc_dapm_widget *source,
-		     struct snd_soc_dapm_widget *sink)
+		     char *id)
 {
 	struct snd_soc_dapm_widget template;
 	struct snd_soc_dapm_widget *w;
@@ -4067,7 +4066,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card, struct snd_soc_pcm_runtime *rtd,
 	int ret;
 
 	link_name = devm_kasprintf(card->dev, GFP_KERNEL, "%s-%s",
-				   source->name, sink->name);
+				   rtd->dai_link->name, id);
 	if (!link_name)
 		return ERR_PTR(-ENOMEM);
 
@@ -4247,15 +4246,13 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
 	}
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-
 		/* connect BE DAI playback if widgets are valid */
 		codec = codec_dai->playback_widget;
 
 		if (playback_cpu && codec) {
 			if (!playback) {
 				playback = snd_soc_dapm_new_dai(card, rtd,
-								playback_cpu,
-								codec);
+								"playback");
 				if (IS_ERR(playback)) {
 					dev_err(rtd->dev,
 						"ASoC: Failed to create DAI %s: %ld\n",
@@ -4284,8 +4281,7 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
 		if (codec && capture_cpu) {
 			if (!capture) {
 				capture = snd_soc_dapm_new_dai(card, rtd,
-							       codec,
-							       capture_cpu);
+							       "capture");
 				if (IS_ERR(capture)) {
 					dev_err(rtd->dev,
 						"ASoC: Failed to create DAI %s: %ld\n",
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
