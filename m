Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C554B75504
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 19:02:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 463AD1EEC;
	Thu, 25 Jul 2019 19:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 463AD1EEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564074150;
	bh=DZGGwLfL56/I90LV4ph9yviY44QJemGGsvbo7VZFDEc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fxlrESlRxXwxLF+Z3x1RP7EGVoUIGZQC2TNErJLDJdksdpBr6nYSomCUnQ3DGoLiN
	 uj74QEOb4JgejuRk3mQq97Pz8zRgt5gBAJAwuNW9AG1CSpeNhFY3jPi79pd5STLL2e
	 XxsT8qDxiOcfjawpRnR4GWHl+0RuGZXwUGfLG0j0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FB25F80481;
	Thu, 25 Jul 2019 19:00:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6B89F80447; Thu, 25 Jul 2019 18:59:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C000F800F5
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 18:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C000F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="m0yzJqTL"
Received: by mail-wr1-x442.google.com with SMTP id c2so48331824wrm.8
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 09:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RjZlNK5foaQOSQzbPfrKvphWkFDjBwZWcqfyFOMILTw=;
 b=m0yzJqTLfQUVO9D+Kp04i0U6B7GihD54VtnGw83R3RZXjnk719z2IdBOI4yHFIO8pg
 BcdA7IFFjKE+VXE5k7AdT6/t48Cn8BgYW1es8YENonXXslAi0vXw0v/7RxiVUZWu40NY
 oxLDlEcPXF18or7K10CjlHkCS2P3s/IbPNxHzqFR//ddxQkc2D7HdacUD4CzQwNnFDmn
 5ceEzOgsjLEtp3yWBOEQKSZCkSGxgNweL34gsO9+3A0vzwlmku1j47Ahvuhn6oVWNEjd
 z7MYMCObi6thyoGQ89GVEUCXW1s2RSyuvrGM86imrJQ+cKvmVgt5WggZfZAcsq50cfon
 uJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RjZlNK5foaQOSQzbPfrKvphWkFDjBwZWcqfyFOMILTw=;
 b=NqqO2nxjIKlV6PcJk8dKkLYPp2uyEkayKhSUYHTeWqzV29e+uC1O1Q9RhfcTAjRQsV
 RmsoNJSKXW7MDdUQYBlaz/F8ln5wVx4kwUPdlOTMQ3V9bEQYk7LnZKGbpc5DwJzo6EuD
 CLgDInoyyuSxsJSRHT+37e3B/M6KFnClMhwKcciYp8lMGhnzJAtRsuzdSDsaB0jjomBg
 up4KRd7wNvKLmKfjbx9KY44MkEJtKiZ1+jZ2M95GLGmgV3kl1GUvhhmplPGhd9JKUNnW
 dN3vmjbZX92UfHEvR2n+fIgp9mMcGWy0rmz9+fG8jb6Ui1cCj1rZJBPsVMFsTUhrqQR3
 lnjA==
X-Gm-Message-State: APjAAAXtSqmCFfD6e//7Hyz0k+l15qaGgMAK0/R2sb8IaRpe/Z8S4VKs
 Yg2L+TxZ2HXx7DoKYmSaA4vp3w==
X-Google-Smtp-Source: APXvYqzkZIFz+KVxgJBu1r3Q+ftdDRhPRxm5CuaClhVaUFvnLzyoMd84/wr8z2QjCOwDlYK0tfyViw==
X-Received: by 2002:adf:eb51:: with SMTP id u17mr3481607wrn.257.1564073993318; 
 Thu, 25 Jul 2019 09:59:53 -0700 (PDT)
Received: from starbuck.baylibre.local (uluru.liltaz.com. [163.172.81.188])
 by smtp.googlemail.com with ESMTPSA id q10sm53627199wrf.32.2019.07.25.09.59.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:59:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Thu, 25 Jul 2019 18:59:44 +0200
Message-Id: <20190725165949.29699-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190725165949.29699-1-jbrunet@baylibre.com>
References: <20190725165949.29699-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH v2 1/6] ASoC: codec2codec: run callbacks in
	order
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
 sound/soc/soc-dapm.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 1d04612601ad..034b31fd2ecb 100644
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
@@ -3853,6 +3848,23 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 				goto out;
 			}
 			sink->active++;
+		}
+
+		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
+		snd_soc_dapm_widget_for_each_source_path(w, path) {
+			source = path->source->priv;
+
+			ret = snd_soc_dai_hw_params(source, &substream, params);
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
 			ret = snd_soc_dai_hw_params(sink, &substream, params);
 			if (ret < 0)
 				goto out;
@@ -3889,9 +3901,18 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
 		snd_soc_dapm_widget_for_each_source_path(w, path) {
 			source = path->source->priv;
-
 			snd_soc_dai_hw_free(source, &substream);
+		}
+
+		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
+		snd_soc_dapm_widget_for_each_sink_path(w, path) {
+			sink = path->sink->priv;
+			snd_soc_dai_hw_free(sink, &substream);
+		}
 
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
