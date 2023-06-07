Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8BE729D4C
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:50:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 307B282B;
	Fri,  9 Jun 2023 16:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 307B282B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322221;
	bh=8ka+kmamw9OEG79FDH88JoftVnnR/6Q0Bm6hO/Sy4TY=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Y+Da8BtOcw45ez4CtaXI6xZasCCGB7Qa4GgBo2jvVAPKUdutauOjGhQGqF8mvXWdq
	 edDDA8syCRo04MjSp0hjoGXKbCh8BZtA2mK0tOk3WZw6ioTUQKGUUEpgY/9vB4rxnw
	 0hduySLxQfj8t5aShZO0sz2F1KoVAN12eRHosv1I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0497F805C2; Fri,  9 Jun 2023 16:47:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B776F805C7;
	Fri,  9 Jun 2023 16:47:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80A8BF80254; Wed,  7 Jun 2023 16:58:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1B6BF80130
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 16:57:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B6BF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qGqDR9tS
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f6042d605dso60997505e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Jun 2023 07:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686149864; x=1688741864;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15bcPlwJydkin0B+JJAsu+9McxnbVcGQs6T+4KYVyWQ=;
        b=qGqDR9tSf/ntbvkpkgaO42huIAJWHmk04412CvhnpxAwQb+CiKuF2lAVZw29BLhpWG
         wnEIyLfbZ6V/B3sHUTtyet7DHrb3nitMvWBbaZr/H5reMtDydgEwEGviYaeYGS9+xb3u
         kIXqzZgE/fUMwYd4hwFMmIkC5dye70I+oXc/GMESJ9gC60AhQrvQO9T3suMtQj7N5hBk
         Al/gAm95BjVudokd3ttDVMayJZuc+XjEdNIJkXQalNv29xxIE7fubija+2srf7PDj/lY
         +IYE61jg29t+nsXqNc20nwKC7YQziScASypHutUCduar0YEr9hY5dyOeE7tW9C4rKpFm
         0wgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686149864; x=1688741864;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15bcPlwJydkin0B+JJAsu+9McxnbVcGQs6T+4KYVyWQ=;
        b=l+MFoSXwWsHVtjSLWteUO4Slr88pVL9ysNfR5DRexM/reYJDXQPXJ5H5PEtv8ZWuIc
         hyjFxCzaTV4kXEXR7DU7VVqhcBgo/8kNd+zaClatpIpa0ybCvxk9lIAKbQS9KxDjVEvW
         TZmaZY5tOmITQ90hd1W6lB/ljfz8rJNJZZ/zedsJvLPOk3mjo/ZHDvCgYN223kcXMYTf
         00Simu1r91TTJ9ZiK4B7qeAhR0U0Jp4h8K73kYgOpGKeVkMe5nSXq2b1x9BcXMIDSAZC
         hMmdQdlLiyfiDIjcbm2WIM5T0BcuBuCoH+jIhvzOxom+XCEHHxoVOTOPFR1xJEqK6UGN
         PJsw==
X-Gm-Message-State: AC+VfDxAOzhdeBrQy7ebw7thxZ40HQ+2T7KCwtWvZ21cadorMSpxE8rF
	R781lW8Kk8NG1Zp0tKz2PoYnJA==
X-Google-Smtp-Source: 
 ACHHUZ4Om8wIr2+W8c2m5xch/rF8WjO/ue+qyFCuYy0t+JsljkFHxXGRUHuKnJgvRrjikjox6oNy/w==
X-Received: by 2002:a05:600c:ad6:b0:3f7:e629:9f3 with SMTP id
 c22-20020a05600c0ad600b003f7e62909f3mr4734068wmr.16.1686149864352;
        Wed, 07 Jun 2023 07:57:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 y6-20020adfd086000000b0030631a599a0sm15633048wrh.24.2023.06.07.07.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 07:57:42 -0700 (PDT)
Date: Wed, 7 Jun 2023 17:57:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] SoC: mediatek: mt8188-mt6359: clean up a return in
 codec_init
Message-ID: <42f2a995-3545-40bf-82a0-fd9b8abc16ce@moroto.mountain>
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
Message-ID-Hash: EI6IKERKDWYOG5DUJJUBEANLYFLOKU5I
X-Message-ID-Hash: EI6IKERKDWYOG5DUJJUBEANLYFLOKU5I
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:46:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EI6IKERKDWYOG5DUJJUBEANLYFLOKU5I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This code triggers a Smatch static checker warning and does sort of
look like an error path.

sound/soc/mediatek/mt8188/mt8188-mt6359.c:597 mt8188_max98390_codec_init() warn: missing error code? 'ret'

However, returning 0 is intentional.  Make that explicit.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: At first I thought this was an error path but it is a not.

 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index bc4b74970a46..5ad8d2a5bbc4 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -594,7 +594,7 @@ static int mt8188_max98390_codec_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	if (rtd->dai_link->num_codecs <= 2)
-		return ret;
+		return 0;
 
 	/* add widgets/controls/dapm for rear speakers */
 	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_rear_spk_widgets,
-- 
2.39.2

