Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D32CA3245B4
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 22:22:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21A411675;
	Wed, 24 Feb 2021 22:21:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21A411675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614201758;
	bh=0i/88gbKn648dwprC9gVIJ1ExR43WHmwy+Dau0BKQWQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fWi02ywhkPb8lZoGSivra/+7vKoOnfmCoGY9cfxMOSt/9I5cJZxsdmwMk7EJ7FUPj
	 8YOGUqn4+fn0cowwPqAmC1TdE9CJ9ITSipZyfNSGCErgtd5UEXdbmO+UF8G+8Ygyy2
	 7HCj+7+eGmbQZBgKWzecoMQWGrQzww925JX6a3Sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A930F8032B;
	Wed, 24 Feb 2021 22:19:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C40D0F802CA; Wed, 24 Feb 2021 22:19:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62E84F8028B
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 22:19:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62E84F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rY1yV1Ai"
Received: by mail-lj1-x236.google.com with SMTP id r23so4130153ljh.1
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 13:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c5DfhNeAwwpzk7lWN1yZX9gxlgXcH020L1Zpko4icfU=;
 b=rY1yV1Ai7VAOwjIchhxUfiW8HVXTOFHY5DnR9H8zP+eRqagNAMjQYPGfHocaReUgXT
 7fPrshHgVB0+Pn/XzRV1BrxiBf4xncSskLnIHDq2N9MaoFqM+NgIkncuaUbQGsU5MX+V
 R3fTyyKnFFSg1fvlU19X6fum4X/yZT7z38ftVh3R3ZbfqY3MGJ2uLpyE/JBs3MRV7l1b
 GnSEy+v6Stb9UDUH2ICCT+lRsMMFFfmyGRcik5gbTNi/+PywZ7w3wqZmsb/GgfyvSSD8
 bRpk5FQEcRio5K7jXIXS7Z5Xiu4Q2225vb1VgcOkYiePAFDXGLV50NeuYfEgpb8+B5SK
 JSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c5DfhNeAwwpzk7lWN1yZX9gxlgXcH020L1Zpko4icfU=;
 b=ZYgV7s/P1O9xInyqQtErKt60he6ij0mnmiFyzJIkFr5Ulgjem0eiq1CFEOeR4Ky7xL
 CpmfQIHYQOLRcyuQnb9+IJnHYHnolAVImeIO5DoqjgWY6WAmr2BYDgyRyl1WxQXeJFEG
 HZxnEgrko9R/dFZXFm6ZzYLOQPdq4NG7JI9wTofGDQLafrfwkVkmgXBa+O2nsauJDq57
 CKz5tYpGKpLroCbKzrWyNMbxca06m9ZdY7pJG+XKdBWehunO2aHkyGRNhQMAHCGE/gKN
 oGQxvMXblghLzruUO/eGdtbPuAXGe4SoCVog5eU+pd1qHx+UdFTZyBuM97nM9JszrNL7
 zP4A==
X-Gm-Message-State: AOAM531JkGEXmyIe12pWeCCwBsF4fxZa/O82tIbzWTJtjuEcWBpg+OYm
 IymcUQql+/kGfXq6IexZxEI=
X-Google-Smtp-Source: ABdhPJyR9BMQ7aExvBSaCCsIx3H0Jt1U9lYeloXAZJ9u96glq0dhBhN8B3JCTqcrdLKmD63SuRXarA==
X-Received: by 2002:a2e:90d0:: with SMTP id o16mr15999620ljg.304.1614201567029; 
 Wed, 24 Feb 2021 13:19:27 -0800 (PST)
Received: from localhost.localdomain (h-98-128-229-129.NA.cust.bahnhof.se.
 [98.128.229.129])
 by smtp.gmail.com with ESMTPSA id w26sm717116lfr.186.2021.02.24.13.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 13:19:26 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/4] ASoC: rt*: Constify static struct snd_soc_dai_ops
Date: Wed, 24 Feb 2021 22:19:16 +0100
Message-Id: <20210224211918.39109-3-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210224211918.39109-1-rikard.falkeborn@gmail.com>
References: <20210224211918.39109-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, linux-kernel@vger.kernel.org
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

The only usage of them is to assign their address to the ops field in
the snd_soc_dai_driver struct, which is a pointer to const. Make them
const to allow the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/codecs/rt1015.c     | 2 +-
 sound/soc/codecs/rt1016.c     | 2 +-
 sound/soc/codecs/rt5682-sdw.c | 2 +-
 sound/soc/codecs/rt700.c      | 2 +-
 sound/soc/codecs/rt711.c      | 2 +-
 sound/soc/codecs/rt715.c      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 844e4079d176..501cc45240b4 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -1028,7 +1028,7 @@ static void rt1015_remove(struct snd_soc_component *component)
 #define RT1015_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
-static struct snd_soc_dai_ops rt1015_aif_dai_ops = {
+static const struct snd_soc_dai_ops rt1015_aif_dai_ops = {
 	.hw_params = rt1015_hw_params,
 	.set_fmt = rt1015_set_dai_fmt,
 	.set_tdm_slot = rt1015_set_tdm_slot,
diff --git a/sound/soc/codecs/rt1016.c b/sound/soc/codecs/rt1016.c
index a23d368ab4da..483375fc16ca 100644
--- a/sound/soc/codecs/rt1016.c
+++ b/sound/soc/codecs/rt1016.c
@@ -534,7 +534,7 @@ static void rt1016_remove(struct snd_soc_component *component)
 #define RT1016_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
-static struct snd_soc_dai_ops rt1016_aif_dai_ops = {
+static const struct snd_soc_dai_ops rt1016_aif_dai_ops = {
 	.hw_params = rt1016_hw_params,
 	.set_fmt = rt1016_set_dai_fmt,
 };
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 0b7ac74e671d..5e097f776561 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -269,7 +269,7 @@ static int rt5682_sdw_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_dai_ops rt5682_sdw_ops = {
+static const struct snd_soc_dai_ops rt5682_sdw_ops = {
 	.hw_params	= rt5682_sdw_hw_params,
 	.hw_free	= rt5682_sdw_hw_free,
 	.set_sdw_stream	= rt5682_set_sdw_stream,
diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index 66ec395dbbcd..01af9d9dd3ca 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -1002,7 +1002,7 @@ static int rt700_pcm_hw_free(struct snd_pcm_substream *substream,
 #define RT700_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
-static struct snd_soc_dai_ops rt700_ops = {
+static const struct snd_soc_dai_ops rt700_ops = {
 	.hw_params	= rt700_pcm_hw_params,
 	.hw_free	= rt700_pcm_hw_free,
 	.set_sdw_stream	= rt700_set_sdw_stream,
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 85f744184a60..202bf6fbc5be 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -1048,7 +1048,7 @@ static int rt711_pcm_hw_free(struct snd_pcm_substream *substream,
 #define RT711_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
-static struct snd_soc_dai_ops rt711_ops = {
+static const struct snd_soc_dai_ops rt711_ops = {
 	.hw_params	= rt711_pcm_hw_params,
 	.hw_free	= rt711_pcm_hw_free,
 	.set_sdw_stream	= rt711_set_sdw_stream,
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 9a7d393d424a..f419d001a3fb 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -683,7 +683,7 @@ static int rt715_pcm_hw_free(struct snd_pcm_substream *substream,
 #define RT715_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
-static struct snd_soc_dai_ops rt715_ops = {
+static const struct snd_soc_dai_ops rt715_ops = {
 	.hw_params	= rt715_pcm_hw_params,
 	.hw_free	= rt715_pcm_hw_free,
 	.set_sdw_stream	= rt715_set_sdw_stream,
-- 
2.30.1

