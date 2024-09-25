Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE7098BC35
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:37:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F12EEDB;
	Tue,  1 Oct 2024 14:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F12EEDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786263;
	bh=ciTImMBS0p6wks5mQK0mcllczL97Z3Zssq9pfQWx3xs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=reJO2jt/GzEkhyh2UUY26k/NINl/7iYPa0mEdQpjB5AFfOTFFqcLYoqm5yK1FaFV5
	 Mih6WSFuD2AhviMxlkzHlrszllZZATyiCP64BTIig9qxCoLP28h+EAy1zQQjz1vZLs
	 /bpGSLgzS5ol/te76jK8dQms7nZL6zaAdM5HgMPU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5B1DF806D3; Tue,  1 Oct 2024 14:35:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 888CDF805B4;
	Tue,  1 Oct 2024 14:35:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D18CF8010B; Wed, 25 Sep 2024 06:38:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADDF1F80266
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 06:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADDF1F80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=v+hwom/N
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8d2b4a5bf1so875432966b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 24 Sep 2024 21:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727239108; x=1727843908;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqcG1Y/DqvLJS0U3eydB1IqD9oVuSGX+UlV/1xSIyT0=;
        b=v+hwom/NVMXKs80+34ggVxdAaShr4wB32IPBy6u4YbEiLi0yRQAFOWbtRX/gETAgC+
         GW33nLAt1QmQbVyohPG6AEwqOHmISPfraKzgtyFHyG2gBTu90GwjWwLwYi9P3vUQHNAe
         QVAxAPW4C2eCee0qmvIaIfUWF4qOy5Kw0onCzWBtGtUb7hQd6GSyihq5J4UNdSUMS0zl
         /86Vxh98BQkYJBjqCQSKSPvY+/9/5HZTfwczCb+Zk2zu/TaUL6eurD/AlSw5r8aX98go
         dy//MoVWj+ZCuiA2x3LcnYwT4sOAfshC+HMO6iwEIFtafwE0FfJOimPCljoKha+IhJNY
         ppzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727239108; x=1727843908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqcG1Y/DqvLJS0U3eydB1IqD9oVuSGX+UlV/1xSIyT0=;
        b=q2T2A8aZTkIUz8bJYalZAhYui9mi6wHHTdVI33p47rLK6PCKQzgqbHadTnfo23iwQO
         YOQNn0vGXHjVhKcHwryTmjY3phIgxOPO7c0l3PMsYiK6ozPX08/iuie257LIZ//cjJZ4
         qK0FNtU40yi+hCUfN2u2TJlcFIerOBqvtzfzfG+LyEVeW08xNs/77Lg3DpBuGRpl6kEF
         IBIV9k3x/NCOUQ4i/9TLaAzRmwvtFBKv5qA/d5GBBGrlYwJnxV+2AV4xAS8w9OGDJx3u
         U3o+YmSzeXH/5icjwoK36i1+aOKgbiijj1gcOLzDwoAFgVhTW3RrUrvWGX8KGLow0ilW
         RJ5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbnLqSNTjW21QrFcLLzCq0kdvqAfnw2SNrSJP1QlrqLycb7qzLw9A+67UyeHT0jc4osh2K35eF8dHe@alsa-project.org
X-Gm-Message-State: AOJu0YzEvf/GeqbmJbtll+k7/wV8NkGxF/ot2OLDE6Wm3086XjbG8igY
	8chhTVa6Lpt9CiCDd/EAqhd/cJd3yitD+cMA3O9h75vLohjl3VBV8ldclIcufrg=
X-Google-Smtp-Source: 
 AGHT+IGxDWA9Bpt+Vo+5NwY4exmWH9AugLbSR05W212S951aBgbB3SXoz6SBoMQb7pJmFGUWWMTH7w==
X-Received: by 2002:a17:907:f14d:b0:a8b:6ee7:ba26 with SMTP id
 a640c23a62f3a-a93a0322a63mr119177866b.1.1727239108517;
        Tue, 24 Sep 2024 21:38:28 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f346casm164857466b.24.2024.09.24.21.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 21:38:27 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: srinivas.kandagatla@linaro.org,
	a39.skl@gmail.com,
	linux-sound@vger.kernel.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	vkoul@kernel.org,
	klimov.linux@gmail.com
Subject: [PATCH REVIEW 2/2] ASoC: codecs: lpass-rx-macro: add missing
 CDC_RX_BCL_VBAT_RF_PROC2 to default regs values
Date: Wed, 25 Sep 2024 05:38:23 +0100
Message-ID: <20240925043823.520218-2-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925043823.520218-1-alexey.klimov@linaro.org>
References: <20240925043823.520218-1-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexey.klimov@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XYSJEWGQFFS7JH6O2MQLP3HE4QYCTB3D
X-Message-ID-Hash: XYSJEWGQFFS7JH6O2MQLP3HE4QYCTB3D
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:35:06 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XYSJEWGQFFS7JH6O2MQLP3HE4QYCTB3D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

CDC_RX_BCL_VBAT_RF_PROC1 is listed twice and its default value
is 0x2a which is overwriten by its next occurence in rx_defaults[].
The second one should be missing CDC_RX_BCL_VBAT_RF_PROC2 instead
and its default value is expected 0x0.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 9288ddb705fe..2f6699c0a643 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -961,7 +961,7 @@ static const struct reg_default rx_defaults[] = {
 	{ CDC_RX_BCL_VBAT_PK_EST2, 0x01 },
 	{ CDC_RX_BCL_VBAT_PK_EST3, 0x40 },
 	{ CDC_RX_BCL_VBAT_RF_PROC1, 0x2A },
-	{ CDC_RX_BCL_VBAT_RF_PROC1, 0x00 },
+	{ CDC_RX_BCL_VBAT_RF_PROC2, 0x00 },
 	{ CDC_RX_BCL_VBAT_TAC1, 0x00 },
 	{ CDC_RX_BCL_VBAT_TAC2, 0x18 },
 	{ CDC_RX_BCL_VBAT_TAC3, 0x18 },
-- 
2.45.2

