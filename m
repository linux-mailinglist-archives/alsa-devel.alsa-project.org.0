Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE92DFC9
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 11:51:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B254C1671;
	Mon, 29 Apr 2019 11:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B254C1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556531473;
	bh=26fBvEzaBbW+OFXbLkXPdrWtxTxYAHhArbcuINSPi2A=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WitFkFUm9DIKjj9l3URjWNwNyejpVFdUneYIV88LSqvxwVxlFgHDAqIFm++Och69Y
	 4+BJ7GoUQMYme+tP/Rpdp+zynXN9ViOXArNlqMPbi7yeqxoUscr02uFjbyhQJjpI0V
	 vyw41CtX4KnVqAtoae3cveNv9+eTl3awqQHmJ78o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE569F89721;
	Mon, 29 Apr 2019 11:48:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A499F806E7; Mon, 29 Apr 2019 11:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDD12F806E7
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 11:48:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDD12F806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="L3oVRjgu"
Received: by mail-wm1-x342.google.com with SMTP id o25so13094094wmf.5
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 02:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5lwkmI0zOv7BLpsbZZC29sb6Qw7tCofqiIoNLObPe54=;
 b=L3oVRjguMhqlA0Z2Bbxuj4vY1G3zFDofgG8TuQyhbayfUvqNiThGHm0Efy3YfZ0PMr
 pO79kWWVi6mW3pYWM/LmvlWPj9OcUqbaUteiHlO4O7ee/5XpL5PsJZ0o2EhRpDZcbqXr
 aVpbS95VmUUu4eJMyM+FQaxlPVcZ+ya60i4bdWLgqfdYLzdK51kFkwv1bg/XzlSEX5lh
 nJv41NX75qyNsvaUVPcMxG0PhOeIhD2iutryaSn/ak9rnsAfcsZMy3UGwiJbiKQb9v1r
 rmKwEtIeTabuJubq1d3hXZNL9hIrJWb9pgdV/PYbdNrl31kp54ZGSGRn7IWP1P2VclTN
 CISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5lwkmI0zOv7BLpsbZZC29sb6Qw7tCofqiIoNLObPe54=;
 b=hZjTJnzTf96Er0dJoeZ88e2k3oIbIL9karUvmlgUEGXsHEvMnvMW909qwQj4z4gHty
 yrXfYbLXThVOia65qWvntAU/AcQFjUHhGwAZzlqkAEcBe5W8T/M30tvlfWzL4/fBHwl1
 twGrD6Q2dtk+XiBLsDaMD3RMgc6b0wURl8ghaMmnui2Yz2lUTRek05ezIbeVS2zkopsC
 RY0uA7NeIbLPFSzzLLEuJnGjkFkobWcPbCvS1SbtfidiXbSjvqwqajTI+ZWof7dndL1y
 Csqx38wReO3bvvqnveJqLYFwCCEhmwKGK8FVdxEWIggKVzgS+2DxD/w2eUx5OWB20Yew
 3nhg==
X-Gm-Message-State: APjAAAWYqb8kmcugJcszhIgrpt4uFFLdaFvhvQSEiZteBJURcPjqGta+
 mA4NhK9OkD5qWAVM3kYOqz4QUw==
X-Google-Smtp-Source: APXvYqx9JPfF01cmoW9CW/F015/U9kE0LlcnPM6+cR5nK+o2pv+7MIr/YlDHkptqGMa1Hrl9pkLQdA==
X-Received: by 2002:a7b:cc97:: with SMTP id p23mr15087366wma.24.1556531281035; 
 Mon, 29 Apr 2019 02:48:01 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id 192sm47987465wme.13.2019.04.29.02.47.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 02:48:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon, 29 Apr 2019 11:47:50 +0200
Message-Id: <20190429094750.1857-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429094750.1857-1-jbrunet@baylibre.com>
References: <20190429094750.1857-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 2/2] ASoC: skip hw_free on codec dai for which
	the stream is invalid
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

Like for hw_params, hw_free should not be called on codec dai for
which the current stream is invalid.

Fixes: cde79035c6cf ("ASoC: Handle multiple codecs with split playback / capture")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-pcm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 263086af707d..04ccdc59295d 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1020,6 +1020,9 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 
 codec_err:
 	for_each_rtd_codec_dai_rollback(rtd, i, codec_dai) {
+		if (!snd_soc_dai_stream_valid(codec_dai, substream->stream))
+			continue;
+
 		if (codec_dai->driver->ops->hw_free)
 			codec_dai->driver->ops->hw_free(substream, codec_dai);
 		codec_dai->rate = 0;
@@ -1077,6 +1080,9 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 
 	/* now free hw params for the DAIs  */
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+		if (!snd_soc_dai_stream_valid(codec_dai, substream->stream))
+			continue;
+
 		if (codec_dai->driver->ops->hw_free)
 			codec_dai->driver->ops->hw_free(substream, codec_dai);
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
