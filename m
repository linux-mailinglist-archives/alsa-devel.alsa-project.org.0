Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD7458256
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 14:17:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FAB51729;
	Thu, 27 Jun 2019 14:16:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FAB51729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561637839;
	bh=e0e8+c9FQ6HXuGhca7S6wPPetwvb3EjDA43xkpl+HOM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uX05avc8sgDCee2/fbtaPooY+Jpvs7N22YBqrgKXXK+2ymcPlw94hbPCVhv0GD6V1
	 osrXKY5IhueAgxkag7Ry+1FpDPQIHa94kgkSZJmU5VkIpsNxO/wPrQwva/Oi1k4/yr
	 vcz9CvBxbd3JpU+1tPkbblC60pqRudJ83HYvrQ+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7791EF89678;
	Thu, 27 Jun 2019 14:14:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD304F806F0; Thu, 27 Jun 2019 14:14:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1051EF896F0
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 14:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1051EF896F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="UhohxZSB"
Received: by mail-wm1-x341.google.com with SMTP id s3so5500696wms.2
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 05:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6PqH7FtXAyTVmgRsql/9Vt6uYwCKZA1EzRvgR9PRCkQ=;
 b=UhohxZSBhwVGzRN5sjpR2ypPIONf+8GU9/388Qyunz9WdEExkKcDyUXrjsD2j/7QLk
 i6uIVB+v9aetT6bkneXelTtWodDRCTjCeUFfPeMRtuxXN0X6wM3dXiS9WXaxkKt7sJXF
 yptlETEn8CDMz08vjnx/gIikHwQ/DNYwXqOyLY9z3xZHZcuos4UlnodAvrgpao0oV9iB
 11L5dPCvpCGPyTj3gewwdoPHN+z6jUMNGq5ADkCmSsGo3u6gIu7ALtf/wqb2HPcz9Gdm
 KyuUhMBX+EO/uldm6thj+CLA5sHKQrjNg0ucRhQVprBCZRsTA1WIuaRZRYrdeNMlmJzs
 z6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6PqH7FtXAyTVmgRsql/9Vt6uYwCKZA1EzRvgR9PRCkQ=;
 b=OcWvUbkdtaqfXgvn3FEidbVN8pqJNOunUQYFO4hfsAAsntOCzKE7jVazUO1U/AAL8V
 QKnZJT75ltpBxCztij9RrP4hpadYhlHJ+GuaFiXFhyilUuzFKV8jy0Q7jCXiEvjgLUCA
 e5DC4aMdLB9/WgnLg9Vx/a33XkG5ZvB100/7OyE4WHXAZFFPJDaZZAwZIB8nhlIOmiHi
 ZiHk8fcBimVB2gUTaQkgUAFjDLJGdDvsWj1N2tKBbZePlRg206hkkVMclhx0M0JObbqr
 lTtSicAgWv3r2ZZXK8cRz2mBMIxy80mSJpoBkr5DheZADfYMfDoefuxZyY8ZtENRbd2N
 8qKA==
X-Gm-Message-State: APjAAAWo2MAKcdMPCkPQ5orpn+9ysQT4xV8VkQ0nR6xsTe/7zAvpaLZ7
 kXWdSkSioPrJzMO3M9AWelY6Qw==
X-Google-Smtp-Source: APXvYqy6mtChxwDtyR5Jh1xEngeE3SkTPccDJu6eNMVT6HXO76ZboMJZAJ6y2aPsXhzlNUEe4WNiNg==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr3239638wmi.0.1561637641154;
 Thu, 27 Jun 2019 05:14:01 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id i11sm6160594wmi.33.2019.06.27.05.14.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 05:14:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Thu, 27 Jun 2019 14:13:50 +0200
Message-Id: <20190627121350.21027-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627121350.21027-1-jbrunet@baylibre.com>
References: <20190627121350.21027-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH v2 2/2] ASoC: soc-core: support dai_link with
	platforms_num != 1
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

Add support platforms_num != 1 in dai_link. Initially, the main purpose of
this change was to make the platform optional in the dai_link, instead of
inserting the dummy platform driver.

This particular case had just been solved by Kuninori Morimoto with
commit 1d7689892878 ("ASoC: soc-core: allow no Platform on dai_link").

However, this change may still be useful for those who need multiple
platform components on a single dai_link (it solves one of the FIXME
note in soc-core)

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/sound/soc.h  |  6 +++++
 sound/soc/soc-core.c | 59 ++++++++++++++++++--------------------------
 2 files changed, 30 insertions(+), 35 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 64405cdab8bb..4e8071269639 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -997,6 +997,12 @@ struct snd_soc_dai_link {
 	     ((i) < link->num_codecs) && ((codec) = &link->codecs[i]);	\
 	     (i)++)
 
+#define for_each_link_platforms(link, i, platform)			\
+	for ((i) = 0;							\
+	     ((i) < link->num_platforms) &&				\
+	     ((platform) = &link->platforms[i]);			\
+	     (i)++)
+
 /*
  * Sample 1 : Single CPU/Codec/Platform
  *
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 0ec1d7a59b24..c17d2f73fa71 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -887,7 +887,7 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
 	struct snd_soc_dai_link *dai_link)
 {
 	struct snd_soc_pcm_runtime *rtd;
-	struct snd_soc_dai_link_component *codecs;
+	struct snd_soc_dai_link_component *codec, *platform;
 	struct snd_soc_component *component;
 	int i;
 
@@ -917,13 +917,14 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
 
 	/* Find CODEC from registered CODECs */
 	rtd->num_codecs = dai_link->num_codecs;
-	for_each_link_codecs(dai_link, i, codecs) {
-		rtd->codec_dais[i] = snd_soc_find_dai(codecs);
+	for_each_link_codecs(dai_link, i, codec) {
+		rtd->codec_dais[i] = snd_soc_find_dai(codec);
 		if (!rtd->codec_dais[i]) {
 			dev_info(card->dev, "ASoC: CODEC DAI %s not registered\n",
-				 codecs->dai_name);
+				 codec->dai_name);
 			goto _err_defer;
 		}
+
 		snd_soc_rtdcom_add(rtd, rtd->codec_dais[i]->component);
 	}
 
@@ -931,12 +932,13 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
 	rtd->codec_dai = rtd->codec_dais[0];
 
 	/* Find PLATFORM from registered PLATFORMs */
-	for_each_component(component) {
-		if (!snd_soc_is_matching_component(dai_link->platforms,
-						   component))
-			continue;
+	for_each_link_platforms(dai_link, i, platform) {
+		for_each_component(component) {
+			if (!snd_soc_is_matching_component(platform, component))
+				continue;
 
-		snd_soc_rtdcom_add(rtd, component);
+			snd_soc_rtdcom_add(rtd, component);
+		}
 	}
 
 	soc_add_pcm_runtime(card, rtd);
@@ -1051,15 +1053,14 @@ static int soc_init_dai_link(struct snd_soc_card *card,
 			     struct snd_soc_dai_link *link)
 {
 	int i;
-	struct snd_soc_dai_link_component *codec;
+	struct snd_soc_dai_link_component *codec, *platform;
 
 	for_each_link_codecs(link, i, codec) {
 		/*
 		 * Codec must be specified by 1 of name or OF node,
 		 * not both or neither.
 		 */
-		if (!!codec->name ==
-		    !!codec->of_node) {
+		if (!!codec->name == !!codec->of_node) {
 			dev_err(card->dev, "ASoC: Neither/both codec name/of_node are set for %s\n",
 				link->name);
 			return -EINVAL;
@@ -1080,36 +1081,24 @@ static int soc_init_dai_link(struct snd_soc_card *card,
 			return -EPROBE_DEFER;
 	}
 
-	/*
-	 * Platform may be specified by either name or OF node,
-	 * or no Platform.
-	 *
-	 * FIXME
-	 *
-	 * We need multi-platform support
-	 */
-	if (link->num_platforms > 0) {
-
-		if (link->num_platforms > 1) {
-			dev_err(card->dev,
-				"ASoC: multi platform is not yet supported %s\n",
-				link->name);
-			return -EINVAL;
-		}
-
-		if (link->platforms->name && link->platforms->of_node) {
+	for_each_link_platforms(link, i, platform) {
+		/*
+		 * Platform may be specified by either name or OF node, but it
+		 * can be left unspecified, then no components will be inserted
+		 * in the rtdcom list
+		 */
+		if (!!platform->name == !!platform->of_node) {
 			dev_err(card->dev,
-				"ASoC: Both platform name/of_node are set for %s\n",
+				"ASoC: Neither/both platform name/of_node are set for %s\n",
 				link->name);
 			return -EINVAL;
 		}
 
 		/*
-		 * Defer card registartion if platform dai component is not
-		 * added to component list.
+		 * Defer card registration if platform component is not added to
+		 * component list.
 		 */
-		if ((link->platforms->of_node || link->platforms->name) &&
-		    !soc_find_component(link->platforms))
+		if (!soc_find_component(platform))
 			return -EPROBE_DEFER;
 	}
 
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
