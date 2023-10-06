Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 537727BB9C8
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 15:49:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6B7CDEB;
	Fri,  6 Oct 2023 15:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6B7CDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696600192;
	bh=+qUGSCcBcw0vkTZy6oiFlY8yvdezGr/iQ/Rfpk20Lsg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B0zzCRqpmkBF3e+/VUBQb8tkS/+Q+mmdInDoRYXvWx06TTv7trFvqRyRcM5EMFSBO
	 sD4w3vzNLeHMDhIGr9oYHcB+/Qb6DNrO7niUNsQznNyqYtZ+27IcoVp7IetOsnRbfw
	 SxRy3kjjMV3gD6U6nWdnc24scEi2OXwNsbjSmxuA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 709C1F80567; Fri,  6 Oct 2023 15:47:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85595F80551;
	Fri,  6 Oct 2023 15:47:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30E59F805C0; Fri,  6 Oct 2023 15:47:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D7E4F80552
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 15:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D7E4F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZizeInPa
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50567477b29so2795620e87.3
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Oct 2023 06:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599992; x=1697204792;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xkMTG9p1NQ0LVgSR1UXz8ORgmEVrpeNo+lHyOzhxw4=;
        b=ZizeInPaeHwVJzdVH54beTsru40funHrhFP+U+1aCahQQklHBQ5ir1cV4XXsJdjUgw
         x4fA9JWRCaQ3vPMgv0cngW6dRlW/tO9cah3o+o05Jhuo5ra5ZlK59a/1oosb9X5cgwXo
         w/aC0LwKxDvdbR9EQrqgTdawnbl+qcuVZlQYds793rzOnuJhY1S5f+lKS3rkxZmwK0CM
         KDmPR3p+kp8Zno2UUCY6PRTsBAAfbDpkZRhhICkUeSLp1mSSEE5Pj0WBwmmb7n2zvuTZ
         zMsHvUDKRq9f+u8ahFEHPH0Yser4vb9a2KVayemP852//qrTNMmUcQw9vE2PYg+Vu8Pw
         Tfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599992; x=1697204792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xkMTG9p1NQ0LVgSR1UXz8ORgmEVrpeNo+lHyOzhxw4=;
        b=wefuWIxMSgUQx0vFs908smCcDQG6JpaREbvCnJin2brRUOpVujCs/CLdbD4NxoIp6s
         ku/TnNzPF72MvwGY7l/KiJQSA/HtccS4x+jr7zlQR9ZROvC3WoyUdB5FRTk2e//4v7az
         akrPIAPmJ54K5kKdx1ueTh9F6VlT1uKsMTGvgU3hmUk36B03J4ABuLboXLXjX6JrAILo
         rBOunRj3hhE3q+jyDFn5XhNExPQyJLu9iWrkKjXKdLoMQXyNTISiHJn1xIai6hVJ0mc1
         3AHQtDsnlDmIqoxz2zRLEY6QwOXWEgGsYtoHJUbVYpbFMGvfq/gFxkDNp/lVNXrh7nsP
         ZCLA==
X-Gm-Message-State: AOJu0YwM/hURKdt7jHLzJg6SE4XUSLw1TkbWRhpODBno4HAL5IgM4TL0
	L6qtOPd95f0We0KGtEtJjCYg0g==
X-Google-Smtp-Source: 
 AGHT+IGJYZb0UTK80c9PKT/6qzBCUPzMqh8bJnRydOq6QDikSosdvO3Bu1DGtamtPk12vFlTYj1sEA==
X-Received: by 2002:a05:6512:2811:b0:503:257a:7f5d with SMTP id
 cf17-20020a056512281100b00503257a7f5dmr9257925lfb.31.1696599992059;
        Fri, 06 Oct 2023 06:46:32 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:31 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 06 Oct 2023 15:46:28 +0200
Subject: [PATCH 5/8] ASoC: mt8173-rt5650-rt5676: Drop unused includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-5-07fe79f337f5@linaro.org>
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
Message-ID-Hash: VPIKHZ7RHRLDZPTGPQNFO2XU6JEAEDTC
X-Message-ID-Hash: VPIKHZ7RHRLDZPTGPQNFO2XU6JEAEDTC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPIKHZ7RHRLDZPTGPQNFO2XU6JEAEDTC/>
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
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index ffb094284bfb..351b586e01b0 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
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

