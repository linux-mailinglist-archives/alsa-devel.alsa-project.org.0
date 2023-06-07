Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E920E729D47
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:49:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05BD2846;
	Fri,  9 Jun 2023 16:48:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05BD2846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322187;
	bh=bD5iImVpmUY0Z6MqDtNZjSBGfXf3QwDAdcsZC40D3d4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vQkFuwbfiFqvE+sgt/eqGYsk2yvgJle/9sNOeFIN94D8EPNiA5N/ROaopJybdUm/y
	 d2Ae67iuInH30Qi7zfn4XB7qYZSNM1xEScENKN7EiRs7Sp4otmVJMpU0yhMSnLdy1i
	 waDkZUZ6hN/yNjM9sEB1JfD/MifvBMwHlC/NvVrc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63D1FF805A1; Fri,  9 Jun 2023 16:47:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D299F805B2;
	Fri,  9 Jun 2023 16:47:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06F26F80199; Wed,  7 Jun 2023 11:42:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 843CEF80130
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 11:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 843CEF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AwLzbIm1
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f730c1253fso33423115e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Jun 2023 02:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686130919; x=1688722919;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G6Lo+18sIXzxNcuFSTXduKxmc08cyUDjNGZNtZkUahY=;
        b=AwLzbIm1zg0K9edsLuu1NPocZIg/6ycVQovwysMtzw1bJxOUTxjkJrih+FSr6FZL0S
         oVilKsEKAD/Y6IbWIJZBBNFhrz6P5rEMXlaQ3OPDg/Yqlvbz5ZBuANiBDrcpSre/F1Fw
         pXbSiPDfbmN/8xL919riWuZgDoVDRT2BKp0tZDKEJjH0O/YjAkZzTJtyICE94xEOb741
         aL/VIR6a++MpCXo/Rblos5rTbmlJlhRiMrKqJXjfecy6eEofY3JAkDU2LCsSQvGyAUEL
         zHEPAkEfJxgZ8HzN1ObF4l1/T5/CgOi7ZLqZsrhg0idw3yyZj2eudGlAKt6DhSv7aWKC
         aAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686130919; x=1688722919;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6Lo+18sIXzxNcuFSTXduKxmc08cyUDjNGZNtZkUahY=;
        b=BAWJwDEGp6J4Ei6tgt0bEyafRXfFYLOi/DY8f8pUQQw2wP7n/bAFio7IW0vWhfYMm3
         AylVZqPOxqcyQBlR5tWZ0c+DQdzNCyMLSw/qiL8nBg6/OUj9UVlkpxLSpuCngT5Xrftn
         0xIoZYdsyOV8qZZEFWpK00Dbl9R3V26yD3CZnaF+wuTT7ibHHbVH287RLGeEBr5lCkGi
         O2f0S3SJijBzbNC5RVJpHSbd0saaxL/ooMu6GZjzlvRAVZ204aLVLg/T3OYzsjRpMiXT
         stLrq+U8xDdxYDX1Q+jkH8HNRwljTEhJ8koa63azM7NHVOfezM7HlO0+kNVzaqLMlNj1
         Unmg==
X-Gm-Message-State: AC+VfDwwn8Qe32TxiFiCgav5PpC+Om9Y2ZAzST5FPOlvAQ6GpMY6wWTf
	8h2D2xkRlvtByoY5dUBOIxEstg==
X-Google-Smtp-Source: 
 ACHHUZ6Xh/LwcZ+rZVHzsTOg4l/H6d1/H3rWqOqZY6ABx67wn1KYIBuLFgv2YJrWxIXpyw52rn7ENg==
X-Received: by 2002:a05:600c:287:b0:3f4:2452:966a with SMTP id
 7-20020a05600c028700b003f42452966amr4432811wmk.27.1686130918955;
        Wed, 07 Jun 2023 02:41:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 y8-20020a7bcd88000000b003f4ecf1fcbcsm1541154wmj.22.2023.06.07.02.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:41:56 -0700 (PDT)
Date: Wed, 7 Jun 2023 12:41:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8188-mt6359: Fix error code in codec_init
Message-ID: <f1d2f4c5-895d-4ad3-ab0f-b7ea4a74b69b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: S6CYXM4CDUOO2E6A25BFAYY4FHM2QNJL
X-Message-ID-Hash: S6CYXM4CDUOO2E6A25BFAYY4FHM2QNJL
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:46:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S6CYXM4CDUOO2E6A25BFAYY4FHM2QNJL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Return -EINVAL on this error path instead of returning success.

Fixes: 9f08dcbddeb3 ("ASoC: mediatek: mt8188-mt6359: support new board with nau88255")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This is based on static analysis and not tested.

 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index bc4b74970a46..ae02bbcd5d4e 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -594,7 +594,7 @@ static int mt8188_max98390_codec_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	if (rtd->dai_link->num_codecs <= 2)
-		return ret;
+		return -EINVAL;
 
 	/* add widgets/controls/dapm for rear speakers */
 	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_rear_spk_widgets,
-- 
2.39.2

