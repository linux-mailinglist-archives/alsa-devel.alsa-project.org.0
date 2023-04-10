Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CA86DCD79
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 00:32:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D7661022;
	Tue, 11 Apr 2023 00:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D7661022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681165927;
	bh=XUdg5ySU26NgGqI2LXe+jNdRYgwDg6NPOYydwEO9zyg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A0u0jwDLnPPbLftmyQRTP7kkwQIU5Hv5kyH1MO+WuxTKSb/mZ9OdZqUBlMctatv0/
	 iZYJMa8DTjMCLqRKU5woxaFgSEkv8i4m7zDGMHkg84tWBvwDXLO+rblr5XlHHdBW+P
	 kuu1MTBt2Rmp87Ga3x73T6qqFbyGRLO7nZMJvUj8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43F95F804F2;
	Tue, 11 Apr 2023 00:30:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20A0CF8032B; Tue, 11 Apr 2023 00:30:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86D73F8023A
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 00:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86D73F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EScTxSck
Received: by mail-wm1-x331.google.com with SMTP id
 j1-20020a05600c1c0100b003f04da00d07so19119wms.1
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Apr 2023 15:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681165809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSuCwbIwfLs2/iUgH6G/BDQzxqJSHFvErHVugSGn4o8=;
        b=EScTxSckbRySVyQdilsthivV6BP3f9S0LmbHIasUgmL79U42sI4MeifgavFrDQ2wKE
         TFYIS+AfAlzkKBcpgPKaKHyzW5pLkdXyPlbsalsuMSoNcZTVgIHZxvgYr1SEf+y5VyUn
         bFWQKapEuTkeIGWL81oYOm7d9UlwAmS+PiwEYyMo0ZChXt/4SKTw75kZQMofACQT3RGm
         2xpHZqvqTRiE63Lr3fGGgecPmDSRKs0VChw5PQhOesYqFgQrAEfr3dFSi/pu090IrO4u
         ZrFDd+SGwwd4yADBOZcZpb7V9i7hasKnOpKaSBPYEuROmdbo/f2KsOhMDa4ap6xb3AM2
         sQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681165809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSuCwbIwfLs2/iUgH6G/BDQzxqJSHFvErHVugSGn4o8=;
        b=PZL6s9r9+JWxchitaWZKor/UUtsRiKB6wirq2c+0WwL7jBx34SfV3vQ4diWlM8d0rG
         53rwWA/8qPpvpwJhkIBOJdZkrbOBeuSt9gJ91fD9TghVJRa3cKvaj4nw5KMaACddZSat
         nKbqr8Co9b2TlB36Nn2sa+qTnA9uWQ6FwVR8svafakvTBoMxRqnHM70rGzgsiMbF7Ogo
         SGFidhedwvuIvI44xONMokjJf0zheM8QJJ5c+cqezpuftKBeubFF4cW/tS9D07LV9Kks
         bczVF2HERED9I5ktCMVisjBwrIF7mewuXbLM9O64za2wk/JtQE+7mSBTa2Y+CFrUx1ln
         Zp7w==
X-Gm-Message-State: AAQBX9cid5REe5GSE6nu3083FBbfVo3KxYki8CMqF+xbNm+pWYgyR8Yy
	fwOFINsANU9b2Wy+F6DjiZR7NNew7GoQvw==
X-Google-Smtp-Source: 
 AKy350Z016EGi9CDP0UtwmTGdxGL4aSvQsfYbXdUKaajPcaWcPbE2WfptOfvqBTDvC3en6ccEazvjw==
X-Received: by 2002:a1c:4b18:0:b0:3ee:5147:3acc with SMTP id
 y24-20020a1c4b18000000b003ee51473accmr5647813wma.36.1681165809338;
        Mon, 10 Apr 2023 15:30:09 -0700 (PDT)
Received: from localhost ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with UTF8SMTPSA id
 r7-20020a05600c458700b003f0548d00f1sm96445wmo.1.2023.04.10.15.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 15:30:09 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: ep93xx: Add OF support
Date: Tue, 11 Apr 2023 00:29:58 +0200
Message-Id: <20230410222958.2321398-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410222958.2321398-1-alexander.sverdlin@gmail.com>
References: <20230410222958.2321398-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FOCBO6BFCUA5LCXNO3AZAWBLROBBSFWI
X-Message-ID-Hash: FOCBO6BFCUA5LCXNO3AZAWBLROBBSFWI
X-MailFrom: alexander.sverdlin@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Nikita Shubin <nikita.shubin@maquefel.me>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FOCBO6BFCUA5LCXNO3AZAWBLROBBSFWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the new cirrus,ep9301-ac97 and cirrus,ep9301-i2s compatibles.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2:
 - Dropped AC97 (deleted from the tree)

 sound/soc/cirrus/ep93xx-i2s.c  | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 0e396bff147b..bbbb1065b2f1 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/of.h>
 
 #include <sound/core.h>
 #include <sound/dmaengine_pcm.h>
@@ -515,11 +516,18 @@ static int ep93xx_i2s_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id ep93xx_i2s_of_ids[] = {
+	{ .compatible = "cirrus,ep9301-i2s" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ep93xx_i2s_of_ids);
+
 static struct platform_driver ep93xx_i2s_driver = {
 	.probe	= ep93xx_i2s_probe,
 	.remove	= ep93xx_i2s_remove,
 	.driver	= {
 		.name	= "ep93xx-i2s",
+		.of_match_table = ep93xx_i2s_of_ids,
 	},
 };
 
-- 
2.40.0
