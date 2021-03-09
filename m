Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E17533287A
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 15:23:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4DEC187D;
	Tue,  9 Mar 2021 15:22:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4DEC187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615299820;
	bh=LFzBpSNHP+vrtel2MRZcL5gjdS1jkt+970oquyANlBQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGeThKrZapRBDnuYuuTkhdM4sSXaOZqQSxKNeWGUBidpxO5Ngk8U1MixTDhE/rmcu
	 2vT1q9WY2puQoz+yQsTHkb8Ue37pkmnaoMj5t24HwX/SBuV+kV4Mpg1HVw59IHUoy2
	 EE3hmL+ShhqoPQw9/zGeAjWyNGeaPABOiM6pbcJg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FA8AF80276;
	Tue,  9 Mar 2021 15:21:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 984FCF8028B; Tue,  9 Mar 2021 15:21:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67DC5F8025A
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 15:21:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67DC5F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="y/cECAfO"
Received: by mail-wr1-x433.google.com with SMTP id j2so15930048wrx.9
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 06:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A31MLzcUUZxKNDle59AEPrSG341kwaYtutGOJhEp5Bs=;
 b=y/cECAfOj4w96o3lr+rxNHByHgL4Y/E3/hC0XHEYqmIJ+EtP0tisupHMmSg85yUGwN
 S7CcPEVF04MX7yL6ukMSkNfzwahiIWZIwKHbuqEU7ZbakNAj41M1jGrdY6iLIWv2rdAy
 oR9gU4ttqGc+lkmP22J1JN96yBO6AH356D1HZtL83nWHGVTSc/ZEYYSMZ5BgFzoco4Rc
 d5gwKdPT8kt2D4tehKAyVKm1PO3SgHkAqlc0SgeciESjIKNrYUKMumT9zGO3Zreksqtc
 0jnrrErVSyBBeJsDzYx87orupogyKfC2V48wb6SXmCkT6urKJyCGU6gsLUqmSHBHVba9
 ptWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A31MLzcUUZxKNDle59AEPrSG341kwaYtutGOJhEp5Bs=;
 b=fNvECgE0bARFMOQE7EJ+GQ7bKOaU9XtntfkDBQs+ji0CnFk/ZRt+Cs6aLl70vgEecs
 jHD7pzNP7wZbQq0wgFECDi7Ufo5ChdqiHImL1g5t9wUehChgtWTr5vUAlPeb39CY5Ggw
 tDhmpb74MHB4+8wBLcsywCVuJGOv+KNvIX5efdkKXzafV1+4ezWdm74DxCTHk+CI0QN7
 b/V60x/HIhyc6udNUUTMyE16WZyuMc8SL7zhSy9ToYGdWbcBhZU4x5qL2xnDksILuFUS
 hWjU+d/EFOWf35wony7Yr38Zrtxf36lOXuUn9lSMkYrD/uDCWwKvZHYWW6JUHBFb8EmP
 NCMA==
X-Gm-Message-State: AOAM53136heP45cfWMYGiHtg4rGe21IE8FBtTDYhDj77fGMdSnnP33zi
 fpCNpQcCKUWXFPBnF3oTh0BurA==
X-Google-Smtp-Source: ABdhPJy042LtlHEfuJfKqiOVGQ92boBU4NMnlk4/3C8Cz9Q9MRZON0Jy5Qj1AMRfbJmQDqmxFdLsxw==
X-Received: by 2002:a5d:6406:: with SMTP id z6mr16698147wru.264.1615299707516; 
 Tue, 09 Mar 2021 06:21:47 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id j14sm22265123wrw.69.2021.03.09.06.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:21:47 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 3/3] ASoC: codecs: wcd934x: add a sanity check in set
 channel map
Date: Tue,  9 Mar 2021 14:21:29 +0000
Message-Id: <20210309142129.14182-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210309142129.14182-1-srinivas.kandagatla@linaro.org>
References: <20210309142129.14182-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: amit.pundir@linaro.org, alsa-devel@alsa-project.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 john.stultz@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

set channel map can be passed with a channel maps, however if
the number of channels that are passed are more than the actual
supported channels then we would be accessing array out of bounds.

So add a sanity check to validate these numbers!

Fixes: a61f3b4f476e ("ASoC: wcd934x: add support to wcd9340/wcd9341 codec")
Reported-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1:
	- make sure the wcd is not de-referenced without intialization

 sound/soc/codecs/wcd934x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 40f682f5dab8..d18ae5e3ee80 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1873,6 +1873,12 @@ static int wcd934x_set_channel_map(struct snd_soc_dai *dai,
 
 	wcd = snd_soc_component_get_drvdata(dai->component);
 
+	if (tx_num > WCD934X_TX_MAX || rx_num > WCD934X_RX_MAX) {
+		dev_err(wcd->dev, "Invalid tx %d or rx %d channel count\n",
+			tx_num, rx_num);
+		return -EINVAL;
+	}
+
 	if (!tx_slot || !rx_slot) {
 		dev_err(wcd->dev, "Invalid tx_slot=%p, rx_slot=%p\n",
 			tx_slot, rx_slot);
-- 
2.21.0

