Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC44058252
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 14:16:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CCEE1743;
	Thu, 27 Jun 2019 14:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CCEE1743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561637793;
	bh=Z/5k8j1USL3NkhXHr9Onby3y2BtIqCz0mnk98G9n7+4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g5lYu/CxWmmdXr6muAwpSUemjCYdbE5/ZC4CHQ8ym9z2CUY5da5NI6CPOmsAd2I+d
	 Tfr4LpaTZpZWP8lv595FKoUlAYpJWVZK9T3FubG3xjdWcde+dbVbpMkn6WtQkyH/SA
	 3DJ1DK0eWaf4wMi7eE17tlPI8xv89b6RS8yvCby8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32FE9F89705;
	Thu, 27 Jun 2019 14:14:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F5BEF896F9; Thu, 27 Jun 2019 14:14:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2220BF806F0
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 14:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2220BF806F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="OngWCzsC"
Received: by mail-wm1-x344.google.com with SMTP id v19so5431861wmj.5
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 05:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6dZUNh41e54wloGbD976gFDh/dh9Od8QCAeDEWTqPi0=;
 b=OngWCzsC9ReioQ2dB+3Si543jtwEMKbYjq/B6YLYPcItr0MZED1V2Dnrf1ipky90Xm
 2iqnk1Q9oOnzku0hLU6IbIPk+Egc8yDD67sNL0VmwMMzUU6CWjk9wYoUOhtUyro6kaA2
 x/kegG5rlAwYjSM9O5eUH2HiLieh6BIsN7bTxHpA+O0W4ef+8mzhbLP8T45X3vwagZ3Y
 2zeBk3oPb43DvoPr30KaBrp0CTr4oLPqlx9RgjuNGnVfvlC2yVMbWuuALVF0uTIrL/Jy
 QcGya6qoe436hbQ2EZ06QZ3VYz3D6/Hnha2mc6zl9JCmqKAXP/jm6XI7aGTMuHjMXqrN
 FN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6dZUNh41e54wloGbD976gFDh/dh9Od8QCAeDEWTqPi0=;
 b=X8K/0WrGfmyWjGLS2N9uF3l2Q4wMgbQ2goP4h96zfHM3ohophDgYMcsSMHCq6Dl7pI
 z4yHlPHu0gERzUrcg359aTmSwQHznYRXY/vdhfB6KBYzGPXcbQyfP7iQZJGG2tK24GDZ
 bnror5DUnCbOVaqliXtg1FLQiPxypAcmGlRuLkxn5DEw8X4ElK8Y6tLF9QZxAQCgKLzi
 WT463Ov17tcdVSSvFKEcOHdpwl8UFoaX0gzvRPe5MG08YiAgLY6JotiYfdakRVffn/nr
 /a8+3TqoxFwPaYwZBz2hx7YxbjD88ezObYbohZr3RBglUmtJQxohaqcF9pzA3CKhsZkY
 9kgA==
X-Gm-Message-State: APjAAAXQrUMmSRh/ysvhvmigu2kUQ9Ai9YR2PwNfSVPsMKVrC4MLsZxY
 gj/QY/h7LUfHwA7+OVIfIwys1g==
X-Google-Smtp-Source: APXvYqza+Hvs5MtThW6KOFfdj04i4mvr0iJ5DAtXO9FQIkHVfLWq3VCCfUzX1vZSCuDoDWFEcBd7aA==
X-Received: by 2002:a1c:c109:: with SMTP id r9mr3255675wmf.143.1561637640165; 
 Thu, 27 Jun 2019 05:14:00 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id i11sm6160594wmi.33.2019.06.27.05.13.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 05:13:59 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Thu, 27 Jun 2019 14:13:49 +0200
Message-Id: <20190627121350.21027-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627121350.21027-1-jbrunet@baylibre.com>
References: <20190627121350.21027-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH v2 1/2] ASoC: soc-core: defer card registration
	if codec component is missing
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

Like cpus and platforms, defer sound card initialization if the codec
component is missing when initializing the dai_link

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 358f1fbf9a30..0ec1d7a59b24 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1064,12 +1064,20 @@ static int soc_init_dai_link(struct snd_soc_card *card,
 				link->name);
 			return -EINVAL;
 		}
+
 		/* Codec DAI name must be specified */
 		if (!codec->dai_name) {
 			dev_err(card->dev, "ASoC: codec_dai_name not set for %s\n",
 				link->name);
 			return -EINVAL;
 		}
+
+		/*
+		 * Defer card registration if codec component is not added to
+		 * component list.
+		 */
+		if (!soc_find_component(codec))
+			return -EPROBE_DEFER;
 	}
 
 	/*
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
