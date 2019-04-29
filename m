Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 645EAE3D5
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 15:35:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA43C1669;
	Mon, 29 Apr 2019 15:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA43C1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556544907;
	bh=QlvV29nj5N61DY1JZ6pDjMeEC9ekppxdZpCUL3LMCa8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n2kGUncuXO6t5yvd1Reu9Mn8Uw144PaYiRGQhl/LpcrrdnLyTkrOV+aooE8KWDWhR
	 kQ96dKwVj54sEo8Mc5ZUP0UGQCmeSbLpB+uxqiBZuli+x/gkuVljYmUCUqvI5N1Amm
	 LqHpEVXbjBZseGad+id2jqGBmHj9z5dlO54Q0whY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44DC7F89738;
	Mon, 29 Apr 2019 15:30:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFD80F89724; Mon, 29 Apr 2019 15:30:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 815F2F80CAB
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 15:29:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 815F2F80CAB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="J2dTv1NP"
Received: by mail-wr1-x443.google.com with SMTP id s18so16140705wrp.0
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=whsOXQ8xRakI5AVYAzepVuB15C/D0yrTQsABLkaS6Vw=;
 b=J2dTv1NPn4J99TrrljZ2hOdA1bv1ifuVO+cH2SVjLUxRsCwvDn6BHWRe13ydolX9HU
 f0TgeitA6xsof7AZ1BTeJMhJx9kNVCtreRIIz9tilr7F8ppdQBBxnamrpVfxs+7s0EuC
 /JVT4wZ1PMsPZY5/LjXMc70KWL4sthpL7sEtgbb7ZuUzPpYMMhz4nifFsD75k0rW8ryA
 spcy4SlO6AluDcIowl1fcf1VPnzD2N57NI7qTRcgkQAlS9idnCiCIUExwUaYbgeV7gih
 tm7D8w2q0cvdL0hYkGcQiVK21c5VDYXHMhWi8jpwQFBdbCzSs5At+eD45xDtXv+WytzX
 tf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=whsOXQ8xRakI5AVYAzepVuB15C/D0yrTQsABLkaS6Vw=;
 b=Pt1JgpeqYOtiHpsUR7zJOrsBgJkG4dHfdi5iWgJgFe4MJEM8OUpeGJU1/iiNwaXZLu
 GgCIgh5ZXtXBM+Id6VhcDiyFQwL/TO8u/GAFwAMe1Qn7EGvMUQTe6VXWEQkVSSt+wr/e
 zMjoy4MmQd3NrtQr+EaL/DsHOfZHsny5B5cl8pbLQqX85brmgiNpvuT/wHSDKU6OxuOv
 HbExzB2cCqF9husH1rtFu+LRLPhfQiFjTp2yRHAPYJi+tBwVbOPsGefubpNjf0zwqsD6
 m/Xa3jQ+xfX94/vs9S4xDr1k9ox1pgXxGkMhf/PzKIMyoENFU2OLonkOXFFCIJ1qkoRk
 zWDw==
X-Gm-Message-State: APjAAAWE249M4Zfc6m1RfJV1XrUt8yOT6qaAUH9C8Gg82eiu9zwQSA1R
 eKbMeFdKZ9LofA4oZXlNHKLSrQ==
X-Google-Smtp-Source: APXvYqxOsG9oiU7eEepi7586wap76Pj0lBUVZ/mY6bdH1Ba/VKYnS+x1TJFaXAE4iJXvcVWCek6nRA==
X-Received: by 2002:adf:f845:: with SMTP id d5mr2185657wrq.107.1556544591717; 
 Mon, 29 Apr 2019 06:29:51 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id s17sm2857593wra.94.2019.04.29.06.29.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 06:29:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon, 29 Apr 2019 15:29:40 +0200
Message-Id: <20190429132943.16269-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429132943.16269-1-jbrunet@baylibre.com>
References: <20190429132943.16269-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 3/6] ASoC: hdmi-codec: stream is already locked
	in hw_params
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

startup() should have run before hw_params() is called, so the
current_substream pointer should already be properly set. There
is no reason to call hdmi_codec_new_stream() again in the
hw_params() callback

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/hdmi-codec.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 4bd598253c62..780f2008b271 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -495,10 +495,6 @@ static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	ret = hdmi_codec_new_stream(substream, dai);
-	if (ret)
-		return ret;
-
 	hdmi_audio_infoframe_init(&hp.cea);
 	hp.cea.channels = params_channels(params);
 	hp.cea.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
