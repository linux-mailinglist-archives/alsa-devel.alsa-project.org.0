Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A1281311E
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 14:16:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 723CFDF9;
	Thu, 14 Dec 2023 14:16:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 723CFDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702559801;
	bh=pE/NrsCrt9dzyWmHpAvVhrx2jqeufxODC4Ve1eLNtCM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hl3XyPMvgr2qwOtrAmLy3Gq1cZVv0DSGwk6sdpKZD2MOIsa+OcYKbcXmD2U6/GzwS
	 hv5GcXIH1IMdPjHH0xtui9Q8BCZurFBN1JRBrR2Q/z0EZ5w3gWl20Se5TL/7wW2G8E
	 Nwu6Xa5dMDKUQIDrGMQijasaPazLBDws8E3bwdZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9348EF805AE; Thu, 14 Dec 2023 14:16:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47756F805C5;
	Thu, 14 Dec 2023 14:16:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3932F8020D; Thu, 14 Dec 2023 14:15:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A906F80166
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 14:15:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A906F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bVWK77kh
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ca00dffc23so103161421fa.2
        for <alsa-devel@alsa-project.org>;
 Thu, 14 Dec 2023 05:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702559744; x=1703164544;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFPvhE2TfppE4P1yrXLwpu8QNBSRgd4h1Csi59de14s=;
        b=bVWK77khUs/l1oZ+zhkxME3fzj1SnGpnFjAwExCZhLsOOluUhkZvr8FKiKUlLyXmBQ
         o3gIPGhJsfvuywENov1N03JaYYlWFmwy+CK4HbPKJ1aSxB74HJlf8Ts5AqBNS0za6K1D
         +aUrMY8uwnhUQpXbsrMEdoUjazxoP7i24Den8mhXjm/9aVXAZlz5vRoKlOhUef/fcumj
         wsUTGw6RO2n9zdHoPTQa+PRBwJ4yRcPhEVDwRhlj8QJB6eL5YiT12PLT63fIg9qnKs3F
         yaF9+qOD1exqsKGOpE50jHH6Wcia8jp/JHsK7DbUUmcCIMzxbUI4ZXWFNLNxd+5k//SG
         wL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702559744; x=1703164544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFPvhE2TfppE4P1yrXLwpu8QNBSRgd4h1Csi59de14s=;
        b=gptMrVo5C+u96vYVIgxpbbsFJ5Uqo1bza19ARRWzpjKaL6jb30k8HDhsOniPigYbop
         BWQk9IKD4ms/eO+FDkOxbd95FtzSRLAhTrcKiZRQvBJ2SlOaXMWrEVNG2KNB4bmuBCFp
         71Pb85z5F/IYVycuBkvS78cmahjDnvjMJ4gH5WpQy/663QRqd2xmLqFEVqkP70ERI/fp
         VnjJ6E7DPMsSeGdoBuZbm6eNuc+oafvbbzNlnvkGR2GPUbOUvk/H/Oo830JyLi1L3PEi
         x4I5jPsxy/C4e52l5SFMRXmTIB0C0siAWHVMKwowJ3rXnTSYB4vb+jfmCra4KosYglPC
         PbFQ==
X-Gm-Message-State: AOJu0YyzK5MTKbMitj43yWj6KltOMXj4ayVDtOCChGNa1/0m9FB84JdO
	9ep4txlDdtTURFgso38Yx15Sxw==
X-Google-Smtp-Source: 
 AGHT+IFZ57yYzKJ7lhsSP4PBKVG28nM00flMj6xzVKrNm2pHPIBAti0LYIyzlqr3hZAxbG5Uc+OLtQ==
X-Received: by 2002:a05:651c:88b:b0:2cc:1c75:3494 with SMTP id
 d11-20020a05651c088b00b002cc1c753494mr5912328ljq.55.1702559744240;
        Thu, 14 Dec 2023 05:15:44 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 p23-20020a2e93d7000000b002ca02ceae84sm2080478ljh.83.2023.12.14.05.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:15:43 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Dec 2023 14:15:42 +0100
Subject: [PATCH 1/4] ASoC: hisilicon: Drop GPIO include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20231214-gpio-descriptors-sound-misc-v1-1-e3004176bd8b@linaro.org>
References: 
 <20231214-gpio-descriptors-sound-misc-v1-0-e3004176bd8b@linaro.org>
In-Reply-To: 
 <20231214-gpio-descriptors-sound-misc-v1-0-e3004176bd8b@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
Message-ID-Hash: GAARPU6ZQNTXPHXDHURD4ZUWNFJRN3PX
X-Message-ID-Hash: GAARPU6ZQNTXPHXDHURD4ZUWNFJRN3PX
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GAARPU6ZQNTXPHXDHURD4ZUWNFJRN3PX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver is including the legacy GPIO header <linux/gpio.h>
but not using any symbols from it. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/hisilicon/hi6210-i2s.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index dd7d2a077248..250ae3781d14 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -15,7 +15,6 @@
 #include <linux/clk.h>
 #include <linux/jiffies.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>

-- 
2.34.1

