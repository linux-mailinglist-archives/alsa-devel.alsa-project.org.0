Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1B4E3D0
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 15:33:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAC46166D;
	Mon, 29 Apr 2019 15:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAC46166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556544784;
	bh=UonJeZSVBXPWbOdTeqwVSzZQTq+mebHLnf7ouvX7pAc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jGI6OvDlFwDi962AeOMV6QH16SJLht36hBOf8/vT+zcAjm1M8MUjWdlb1j769R4gp
	 my8cSzYkV9qGc+XujoQin1LksuLAtfwQrREhjF6kSb3J/LQjRPZEa3WMOpzNi3H7I7
	 LHpxsH5d2mQ1UFf9kxS42rlFWTx2U/drMjt5MUFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9910FF80C41;
	Mon, 29 Apr 2019 15:30:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 671C1F8962A; Mon, 29 Apr 2019 15:29:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41105F80C41
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 15:29:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41105F80C41
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="ns9DV7vl"
Received: by mail-wm1-x341.google.com with SMTP id h11so15794598wmb.5
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 06:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jguxe++uQg1Tg16qsCOT2xdBZ2LoE15AQChE753+pog=;
 b=ns9DV7vl1GqOrO/l7Pw/dLmy4NgN3/x795IBIKZ+BKXrvNhko8jL+GoCk33SLpy7nF
 GphkEdLsA1stWrdCKWx20VUWt0I8WUBc+s7fvJgfBs1SeB61JEkA1oxNmTRIluXP87g5
 xJtw8WLKxGjC2bFqvsAiFkZtMyKHE4MJdov2el5ZY2sbLNkl/K52f9Xitk383AEiq/Ht
 ZIIYkFr4XvTxV8WamLucfoPYlelow6AmwOej3EUaHz4AebYx52vKuwUdQyv+BoZTmUjB
 ndUGecFTHr8UYRamWk0vJP6sQLfC4pLm9TnIcemJ8aIKRqoZU3wZhZaghTXBIXLZc0sk
 BaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jguxe++uQg1Tg16qsCOT2xdBZ2LoE15AQChE753+pog=;
 b=nJOLTCshFYNfQA2rO3GvBV99pS6eo6eBQtUVA4rI6neDncvw6yN6kJLit7GBzjaqvr
 aFaCbmXpAufXNoXRmoLzHIm7Lt7mu3tQHnLQn4vgHIdGAZddMP7J4vR3lW3ErqcfWMQS
 aLmnaODSd5KJE8cUE9+3a9tFhuCNHXRCmrdTYUXEp+KYkjpAdJTJ2009xZJBiga3dIfn
 HFjPkvCOtz/EiMRBvPXeYPzCHVvzaMOVZy6LyGYYTV76XKTVS+RdSyC0Yw5MRiLkE0pD
 DlzA2+yxc0n1CwcrR4miTOJSxolp1UA1XZDk4GRD/QTeR9twL8htvLX00YxQ4EozgoRb
 ZUqw==
X-Gm-Message-State: APjAAAWhUhgfOTnNUKQrPZFgX+uPrnM2YXOzWjTbZS78ODgprAniXDBg
 6sh/sdCZe8oaOSaUQrdmWvzTeg==
X-Google-Smtp-Source: APXvYqznEB34S8Y0R3lfnUYKt0vBonlD/vhA5qe5px4C4oql/IzQD3R62u57tqApFNuPCVB1fZfEEQ==
X-Received: by 2002:a7b:ce84:: with SMTP id q4mr18135443wmj.41.1556544590406; 
 Mon, 29 Apr 2019 06:29:50 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id s17sm2857593wra.94.2019.04.29.06.29.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 06:29:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon, 29 Apr 2019 15:29:39 +0200
Message-Id: <20190429132943.16269-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429132943.16269-1-jbrunet@baylibre.com>
References: <20190429132943.16269-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 2/6] ASoC: hdmi-codec: unlock the device on
	startup errors
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

If the hdmi codec startup fails, it should clear the current_substream
pointer to free the device. This is properly done for the audio_startup()
callback but for snd_pcm_hw_constraint_eld().

Make sure the pointer cleared if an error is reported.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/hdmi-codec.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 9dca24732069..4bd598253c62 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -437,8 +437,12 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 		if (!ret) {
 			ret = snd_pcm_hw_constraint_eld(substream->runtime,
 							hcp->eld);
-			if (ret)
+			if (ret) {
+				mutex_lock(&hcp->current_stream_lock);
+				hcp->current_stream = NULL;
+				mutex_unlock(&hcp->current_stream_lock);
 				return ret;
+			}
 		}
 		/* Select chmap supported */
 		hdmi_codec_eld_chmap(hcp);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
