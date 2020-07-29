Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 711182321F5
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 17:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 194E516F8;
	Wed, 29 Jul 2020 17:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 194E516F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596037809;
	bh=2y8Szq1p9ZuIx3YIkpgZkNXHivLB1upuhNzZbeJYJUA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Co+5xnL8SQcdBp4s7UkctH5zsBYZPeYyku3oltzfs2fdl7Cwcw50ncUQVk/ICFUQO
	 GLmJMKIm7KPgWCR2R3E8DxAUkeKDqP8tr2YqY99BNSTKYn7HzM7DRACoElFYyfpiIk
	 TOv6eVY5JtyRZGfw9eDYCwINwwLK/I9M/vdyQBto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 708D9F801ED;
	Wed, 29 Jul 2020 17:48:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E93AAF801EB; Wed, 29 Jul 2020 17:48:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA4E7F80171
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 17:48:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA4E7F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="n+OxTPRi"
Received: by mail-wr1-x443.google.com with SMTP id b6so22099635wrs.11
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=36JMClzoi7h93LvxaQw3joeoIat/KioNOebe1PCxRfY=;
 b=n+OxTPRilig3haxEVJ5AhEQGmEPmRUF1YiywGsBdl5Z+XrM+gmIBqBlJw6szHy+r2A
 wuuM3o0C5jxjVER9hXK/E9j+AWnICQXWRAVe3M0VfvHE45ZgFE8ixPDfuLGsZgmaQziM
 Sqir7xV7BPs1bG13tLiBw1wwQOG8oGgoP7IejuwPWVa2zKp7+qgGxcYFzmDHye5Obg/K
 Bgsq6xYOiRMDuPU5bBPYXtaUpByB0ilY0FtTffIUubB7vuRRwNe5jFtEwjt8691LkdEz
 bfkADdUcJyZ24AizWb9313N2o3wNGuuLzOnY4T2WdPx3Dd23zfy4uxlH7EvBNYvL/lqB
 znTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=36JMClzoi7h93LvxaQw3joeoIat/KioNOebe1PCxRfY=;
 b=g38eK0cMut2vjQCuDugT4ibB13rxvsrCjuWGmeQLd5Tv+XtWf9uX7HmapJHAKxIEpq
 GHCk0BqBkvgJUZh6Z1fPIz6VYGFTbPIum98fZRq1OWfirnss9zHfx69WlQuJUD/+E3CJ
 SvBJBTadf2C/6soEjPxf/XVcOcN6ZwA2XnTetTNMl0wc6GRtNhZoouAaMZD+BYpWQ6Hq
 xKh/r/fEpCUQUbDYaMijzrH8bixJSM6oCOe7x3hnG/usqJTcVCgwRHI7AHJpEoN4dRqP
 sNtD6I4yyXvnXUi4GrVzHQfhPKajElnq6Fj4Eh/19/e0cVff1GiL0FDy40hmtLkGDKvp
 50xw==
X-Gm-Message-State: AOAM532riR35BjuRZKKk3e7HVpFurS4dhLdiZXV+0QdaYOcYKmJZBjJl
 4A4qL7lyVGm2W9B5ZcDuYAKalQ==
X-Google-Smtp-Source: ABdhPJyrcNry8P8JgzRYvpG5FsopA4iFS5SUa/WXhOO/PIw8l2gzCtCcunQ+sUCAiMde/GxaIvpDdg==
X-Received: by 2002:a5d:5486:: with SMTP id h6mr28823589wrv.136.1596037684667; 
 Wed, 29 Jul 2020 08:48:04 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id t2sm6224808wmb.28.2020.07.29.08.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 08:48:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: core: restore dpcm flags semantics
Date: Wed, 29 Jul 2020 17:46:39 +0200
Message-Id: <20200729154639.1983854-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 zhangn1985@outlook.com, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
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

commit b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
changed dpcm_playback and dpcm_capture semantic by throwing an error if
these flags are not aligned with DAIs capabilities on the link.

The former semantic did not force the flags and DAI caps to be aligned.
The flag previously allowed card drivers to disable a stream direction on
a link (whether or not such feature is deemed useful).

With change ('ASoC: core: use less strict tests for dailink capabilities')
an error is thrown if the flags and and the DAI caps are not aligned. Those
parameters were not meant to aligned initially. No technical reason was
given about why cards should now be considered "broken" in such condition
is not met, or why it should be considered to be an improvement to enforce
that.

Forcing the flags to be aligned with DAI caps just make the information
the flag carry redundant with DAI caps, breaking a few cards along the way.

This change drops the added error conditions and restore the initial flag
semantics.

Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Hi Mark,

 Because b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
 introduced more than one problem, the change
 "ASoC: core: use less strict tests for dailink capabilities" [0] is still
 necessary but the change of semantic remains a problem with it.

 This patch applies on top of it.

 sound/soc/soc-pcm.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 00ac1cbf6f88..2e205b738eae 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2749,13 +2749,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 					break;
 				}
 			}
-
-			if (!playback) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support playback for stream %s\n",
-					rtd->dai_link->stream_name);
-				return -EINVAL;
-			}
 		}
 		if (rtd->dai_link->dpcm_capture) {
 			stream = SNDRV_PCM_STREAM_CAPTURE;
@@ -2766,13 +2759,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 					break;
 				}
 			}
-
-			if (!capture) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support capture for stream %s\n",
-					rtd->dai_link->stream_name);
-				return -EINVAL;
-			}
 		}
 	} else {
 		/* Adapt stream for codec2codec links */
-- 
2.25.4

