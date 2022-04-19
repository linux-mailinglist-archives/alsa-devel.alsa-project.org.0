Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3EE506B99
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:59:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E97B618D2;
	Tue, 19 Apr 2022 13:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E97B618D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369563;
	bh=D8fK0x10XAXkiVGrr8RqmwBhyscnpZgAd8tEgk/nNBE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rALuRB9z9NWTlG60lkMC7oq53LEXlZ+XoyJNq55DjuaM498I1o3HpJ91FGtKNEJ5i
	 /Zx8ATbvY7xk8OK8tZgJ1Ou8cNirOx7O7S0ihkGWLnvSohC7Vak8KvECcisZr0+5JH
	 So+IRwxkXwJYzXgZq0rOWWCNInJChUn8yUiJpAGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C382EF805BE;
	Tue, 19 Apr 2022 13:52:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40146F804F1; Tue, 19 Apr 2022 13:35:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BC1FF804A9
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 13:35:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BC1FF804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AYH2hChv"
Received: by mail-ej1-x62f.google.com with SMTP id lc2so32212357ejb.12
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 04:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KCOFhD4+rlVNZRDw2Wohm1cF4JuH6iXwMNcg8BbQ2EU=;
 b=AYH2hChvUIAZzE5RbrvoO27rgVFPlPgb3N7BdmuGnv+dXGQObVH8yVqymZuILpzO7Y
 bkDoMy1A7h8GAPQurW62zwXow+AozGNnbwzPotN5lL7nJ9doCOcW+XeLkfJptmzu7YgD
 zbxheimturxJlu/l0jyWKS3bNOrwNKWep1odA0rMJ3SVftjqaHSNYz138OFhZehV5LB0
 3OGVzXJiirBRAXeY62ufi6Mz148sg5ejozM8ZsRp1Yzb4XIc0H5QcBGK206K80tjEDdr
 GIRJIkeFxhn4JuGEn9auK3iyW3gL9phUwZTqkAxjyWQzPk1MJj6rUPzVHx+JQ0Dc6gJ5
 wgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KCOFhD4+rlVNZRDw2Wohm1cF4JuH6iXwMNcg8BbQ2EU=;
 b=yghuLDRiBjxw5GrrJypmvWnXdBUM0IoRa4xVqUYDh82UVKpj51ksWnS6ReoyETivk4
 ldNy3hMBqCcGrJD3R95wuuZ8/3o81pX2257PL6pNH+VY3ZXnL8wp6RBYb0Dq4rSrmvc+
 WOvJb+LqDO0KV2Mij3dp0ISHUyzhozz/w8CZsBUYfbPw+CkWgz/bKr/hVX4zs7nTlhqG
 mwYIlXKvzbk0J5oSzV2UD2m1z0Y67Pz8K6sw25tkIE5eGTqiqUjKMojerzxcIb4atYSZ
 BgDJuisUokeIP8WvyjuvzeBSICrKaxmpO/9ZecQ35bmiNgnqvT/wv4gVskyywPyoPIaT
 LSFQ==
X-Gm-Message-State: AOAM531ncxiruWC6XSVKbuYc889hn709CNgrYT2VCn2pH/JRNrePqYTq
 BXK2uHzZJtwLdKLJ3TgerMYgqA==
X-Google-Smtp-Source: ABdhPJw6wuVTlMl7cBqDd3vRX3OHQB0VzWpmNYx+bcp3YaVGC5PiJJHzMz42CL0W7WUhn1V2riWvyQ==
X-Received: by 2002:a17:907:3e9b:b0:6e7:f58a:9b91 with SMTP id
 hs27-20020a1709073e9b00b006e7f58a9b91mr1179180ejc.291.1650368101608; 
 Tue, 19 Apr 2022 04:35:01 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ce21-20020a170906b25500b006e89869cbf9sm5608802ejb.105.2022.04.19.04.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:35:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v7 09/12] clk: imx: scu: Fix kfree() of static memory on
 setting driver_override
Date: Tue, 19 Apr 2022 13:34:32 +0200
Message-Id: <20220419113435.246203-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
References: <20220419113435.246203-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:23 +0200
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-clk@vger.kernel.org,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 virtualization@lists.linux-foundation.org, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-arm-msm@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sven Schnelle <svens@linux.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

The driver_override field from platform driver should not be initialized
from static memory (string literal) because the core later kfree() it,
for example when driver_override is set via sysfs.

Use dedicated helper to set driver_override properly.

Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/imx/clk-scu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index ed3c01d2e8ae..4996f1d94657 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -683,7 +683,12 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
 		return ERR_PTR(ret);
 	}
 
-	pdev->driver_override = "imx-scu-clk";
+	ret = driver_set_override(&pdev->dev, &pdev->driver_override,
+				  "imx-scu-clk", strlen("imx-scu-clk"));
+	if (ret) {
+		platform_device_put(pdev);
+		return ERR_PTR(ret);
+	}
 
 	ret = imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);
 	if (ret)
-- 
2.32.0

