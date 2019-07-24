Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F04733D5
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 18:26:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD1211929;
	Wed, 24 Jul 2019 18:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD1211929
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563985605;
	bh=Y3OgMwSJVSxC4iNIQ50cgJ5ku2u9F0hxtC6NyejqciM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q2XPmIUnivYN6uPQpnbnhmpGSodzQoDf0so4dw0sCziGxcLbhVWn1bpH4u+rBNd33
	 tjhSBgKTAkSH1hVdtwoVw3EeQtt/urtW1PN6CRA3fyWM3ZUnSCQXS2ChuOfRHgRZ9i
	 UG9gzsSsoN3xai57aFFehVzulbORqcIp9/pth4E4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D354F8048E;
	Wed, 24 Jul 2019 18:24:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EF88F803D1; Wed, 24 Jul 2019 18:24:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFF54F803D1
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 18:24:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFF54F803D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="T0XHmH7f"
Received: by mail-wm1-x341.google.com with SMTP id h19so33829663wme.0
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 09:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ocUEQSXynTuFhR8u/rePjf3f/sB3eXLVGjV4BtMdyVs=;
 b=T0XHmH7fMTKgxRE+sBpYoKeEOwc7aBtGRsTgi4fQxLrOEfcW0U1YUrrDIw3Rn8GfcX
 lhkdzqNgssqMuQEo4DlEKUn+PqiRDTIY4NzwiQSGNCWQYJT4nWBscmNenvtx/y77qByz
 O8J4L/61kEPly3Vt5mbDYBXjERECUfgji3eBFFbA6oDgkOQBZ8258HWGNKxps1E1ytBc
 yhcCI72ckTJOjSU/9LYbSvhgbXuhl++XmTvK3k18dhhjOxg4/KAzDMeMlj+t7BdxUBl4
 j/DDcIcHQnT2kaq7UbX8BV78x4zpvLXHqdaoHZc5oUhkEUtplY4+LLtmUNuYSRCw2Q2N
 fe6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ocUEQSXynTuFhR8u/rePjf3f/sB3eXLVGjV4BtMdyVs=;
 b=mCDPsOnMErbsGWVPsXvsV3+02YEWcQHfZ0M1HPkmkaVv5MWBszhvlOoAPKeil010Lz
 tnXDn8LZJ2pVFJ3SZt8QQLAStlOktShdFMuePRCCJdg3/Q3zqyhm0LZvmiedRuHN4PyZ
 MshHruRWz/p2uGr5PwuF1jVe5vPacO9uxPCgYGi4StmA30h8m6kpvoWyCObGASQ1bt9e
 spm8u/M7zwCMbjNVjFCRyRzcZoRXsrR7Ma+Kc6XinqlTatnBd8FmV2pkeqLR7+sAezBe
 sAf/lPECC9/9PG1xvQlEIi7Z6ZOhy2RAOyyzYfh7QBIoJC5zkwWIte+SaGgl6PYQ8vf9
 XbxA==
X-Gm-Message-State: APjAAAWgZ5PFIA92CzXGDAmP+J18n0XewCIo2bwNyRtijxh/POPfNCc5
 uuyn5t9yhrJ3MQI98sh4xg5NUw==
X-Google-Smtp-Source: APXvYqz5KeYU3i1H08gJ6KW2smQMst4ZM+01sZk1tJDy733pmW2ILw3I6IwRuTSHXx60lHlH/0OyTA==
X-Received: by 2002:a1c:f409:: with SMTP id z9mr4986239wma.176.1563985450593; 
 Wed, 24 Jul 2019 09:24:10 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f70sm55688960wme.22.2019.07.24.09.24.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 09:24:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Wed, 24 Jul 2019 18:24:00 +0200
Message-Id: <20190724162405.6574-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724162405.6574-1-jbrunet@baylibre.com>
References: <20190724162405.6574-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 1/6] ASoC: codec2codec: run callbacks in order
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

When handling dai_link events on codec to codec links, run all .startup()
callbacks on sinks and sources before running any .hw_params(). Same goes
for hw_free() and shutdown(). This is closer to the behavior of regular
dai links

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-dapm.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 1d04612601ad..5348abda7ce2 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3835,11 +3835,6 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 				goto out;
 			}
 			source->active++;
-			ret = snd_soc_dai_hw_params(source, &substream, params);
-			if (ret < 0)
-				goto out;
-
-			dapm_update_dai_unlocked(&substream, params, source);
 		}
 
 		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
@@ -3853,7 +3848,24 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 				goto out;
 			}
 			sink->active++;
-			ret = snd_soc_dai_hw_params(sink, &substream, params);
+		}
+
+		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
+		snd_soc_dapm_widget_for_each_source_path(w, path) {
+			source = path->source->priv;
+
+			ret = soc_dai_hw_params(&substream, params, source);
+			if (ret < 0)
+				goto out;
+
+			dapm_update_dai_unlocked(&substream, params, source);
+		}
+
+		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
+		snd_soc_dapm_widget_for_each_sink_path(w, path) {
+			sink = path->sink->priv;
+
+			ret = soc_dai_hw_params(&substream, params, sink);
 			if (ret < 0)
 				goto out;
 
@@ -3889,9 +3901,18 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
 		snd_soc_dapm_widget_for_each_source_path(w, path) {
 			source = path->source->priv;
-
 			snd_soc_dai_hw_free(source, &substream);
+		}
 
+		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
+		snd_soc_dapm_widget_for_each_sink_path(w, path) {
+			sink = path->sink->priv;
+			snd_soc_dai_hw_free(sink, &substream);
+		}
+
+		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
+		snd_soc_dapm_widget_for_each_source_path(w, path) {
+			source = path->source->priv;
 			source->active--;
 			snd_soc_dai_shutdown(source, &substream);
 		}
@@ -3899,9 +3920,6 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
-
-			snd_soc_dai_hw_free(sink, &substream);
-
 			sink->active--;
 			snd_soc_dai_shutdown(sink, &substream);
 		}
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
