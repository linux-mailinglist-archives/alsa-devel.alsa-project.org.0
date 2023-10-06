Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D53A47BB9C0
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 15:48:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3914EBC0;
	Fri,  6 Oct 2023 15:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3914EBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696600128;
	bh=9suc3UfejIPKY7OwBn+Lm6Jg9BCLKsGCzscCZ7b+cSc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kFogw9TcEB/6+PAHigG5vIGQSftoBMmWnlGOqSgycbEyN/4LAW5GjoXQu2lxGhKd2
	 +dnYraswnTBWMvZ0k8wCydC6U2inu5h6UgZaZ9QGZ0oXeI0YNW2nfm2jzp3juetPsO
	 2r/3IvT3B3TGAySrC/SZXmDMj//fCNRJOBh3HU+w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10380F805A0; Fri,  6 Oct 2023 15:46:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 332E1F80580;
	Fri,  6 Oct 2023 15:46:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15A9AF80549; Fri,  6 Oct 2023 15:46:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDA21F80549
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 15:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDA21F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=f0ubedzO
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50308217223so2667112e87.3
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Oct 2023 06:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599993; x=1697204793;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKUwyfTTneTxSGqUZGpPDlenguAqMHPKsbdYxdaEdtE=;
        b=f0ubedzOrTuSk9soyGsAT51hW3ZWDNqBSDPhu9aa4ut4g/RqW3psQr9J0Dw2Gxp6lI
         JhcJdQgm9iyVKL2hxs/qYyZxGQLM6wtBSi7ZUdS09IgQRsGEttb92KHgLaDPtdYAhf/7
         h6dcQySO7lNg9PKYhuhqjXs1RJgYo0iO5oAispybB8abrrjPP3KWYFHtWqtx+/B5EnYH
         Uct4uguwkBlaIGLeD3jxQ/A7t/ChapvUv1baG2F524mnH7YUJ7eMbfeFVOyadCNJm+fW
         tTgM5Gu18kv/q31fKdVEbfZ+4G5OHIrtQppyq+0I40wizVUGoE1W5beAM3G1y0AIb4Ya
         9v9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599993; x=1697204793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKUwyfTTneTxSGqUZGpPDlenguAqMHPKsbdYxdaEdtE=;
        b=O4w09Tkc+suAiMzJfDEOMTl1SoMPmPkAdeATvtlxik2VQdkFhlFWJOe+fk5CAgnl/S
         cutkX71jWgOQdeX6V8EX047QNgkKA5P4lrythBbHaxEKhxVEBfENv5U1I1tkyL1ttY3P
         PTIzue0ClsPgSJtJG61xI/LhPaAHbZmjqnB8WM49+gB1R7SUCKnCOZPsPWTgQqGit3TU
         YfOZzsHiUNKtZDkNd15oJ06707yz5ynJcf/cAbyppdlcI9HaaDV5mPfPNwKZVfXtuKwA
         lAEprMBbgQZlBh/yMuC1p9KwnCJzqMbfR3NT6V/XZbBOa50uM8nVNQm4tlZWXnI4QFSB
         G68g==
X-Gm-Message-State: AOJu0YzmZN8+1vRL25XF3q/RiLJZ7powbN/yNwQSGF15lGJBaUYYkc8Z
	N3V159K1Vkgyc6w26HHU7byCeAC3sGu4AAms8zM=
X-Google-Smtp-Source: 
 AGHT+IGcwLvp1n+5FWSbw9bTwDxtSAgSpZp4HVrtvVLTsDkaltU0mqZDETpn1S5AIg0T9GnwoZL/uA==
X-Received: by 2002:a05:6512:280d:b0:501:bee7:487b with SMTP id
 cf13-20020a056512280d00b00501bee7487bmr8096933lfb.11.1696599992987;
        Fri, 06 Oct 2023 06:46:32 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:32 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 06 Oct 2023 15:46:29 +0200
Subject: [PATCH 6/8] ASoC: mt8173-rt5650: Drop unused includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-6-07fe79f337f5@linaro.org>
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: 6P5WYPMW4HR3GSFW6HTVQM5QDITLPDGQ
X-Message-ID-Hash: 6P5WYPMW4HR3GSFW6HTVQM5QDITLPDGQ
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6P5WYPMW4HR3GSFW6HTVQM5QDITLPDGQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver includes the legacy GPIO header <linux/gpio.h> and
<linux/of_gpio.h> but does not use any symbols from either of
them so drop the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/mediatek/mt8173/mt8173-rt5650.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 18cf84bb25c7..bcec1d9d790b 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -7,8 +7,6 @@
  */
 
 #include <linux/module.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
 #include "../../codecs/rt5645.h"

-- 
2.34.1

