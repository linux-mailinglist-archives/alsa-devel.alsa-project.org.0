Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28949977E4A
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:14:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68CDBEAB;
	Fri, 13 Sep 2024 13:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68CDBEAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726226053;
	bh=vDgjIBjhHTJrGIyXLK3F1O9eH8ttQJqEQh1v0D44fkc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BgrkGCctszhZn8blQZYuB4dikPjY8zbefKqoT53Hhlk8hpD/3TBUEv+s+j/Qof7TL
	 lzzow0jI7uw6pZxWhRgzX4hDBk+yQmOYBQnDRYh1ovCACQOe0j97uIhKy2+8WLOLk5
	 dEh9uVdMMeUAZqDMKacSUl6d1PwBcP1ojFv/fB4I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 073DFF805AC; Fri, 13 Sep 2024 13:12:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AC37F805BD;
	Fri, 13 Sep 2024 13:12:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95965F801F5; Tue, 10 Sep 2024 23:13:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3283F800E9
	for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2024 23:13:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3283F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eiLqYg0Z
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-374c326c638so4445014f8f.2
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Sep 2024 14:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726002790; x=1726607590;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mShm0KIU0OZ83/t9phYF8kP86kSg8BrKV+H1Ffpa/nc=;
        b=eiLqYg0ZNToph7STc0RCw25M4xgwofZHgSsuSU7lDt2jCSRA+8BO3hASSgxpefhwKB
         94y3mlFakO3PRnSyKN+SVduYarB4OnTILw+ZEBLJEheiQRy390Y/qcjHd7A3DSR5KXFG
         FjTZWnRioWermcx5FgHhFiutdR7SjOfCMz2qUcfzYVQ2JZUM22J/076AP4LertdzUpQB
         t2+LVEkHBqztIdebzOO26EivRG0WTSaFtGhEGQRe76feOUrFoC3t3uRMrkpKVbzYkzco
         JoMmTjUEBULeCJC1yVka+owZJeWWR/is/T9NTf6AfSaKcxIPQvH6MKzzgRuXIrfa5A2l
         UTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726002790; x=1726607590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mShm0KIU0OZ83/t9phYF8kP86kSg8BrKV+H1Ffpa/nc=;
        b=qm70O9NXBZSSfiWB3gBBuUJUZIBztp539RLEuHT+Lynr+cs3VX9vdK0kLE9sPGlTeG
         snIlR717Sqq2zOcZEtLKbZG/xYYLKBRPm+wW1sFSjXGLc0c0t0n3dOlCGpVpapJ6baL/
         SPSkAy1dW9YAlg1sOTn3tQQP3D0/m2RwX5lRaQwjcdwGPGKRbouPAJrr0XHB2zEj2ljY
         u1D4Y9wO9kivoAH122e5pOJfzUQ0p39WCCALmdwPIbIRCYAKw4vPeWEylFUZlhWHM/fz
         NXeebxtmodfg7Uirk0N7JnAmm3ytPq6kLitUIbU5cM4eFjvSUtw0Gv5hk+PjoITGSyEZ
         wHig==
X-Gm-Message-State: AOJu0Ywnn07iGXvGCHjHNJE+eaNuhyez6g5qrCU6HoKkVRwQ9tpkuzVb
	8PH9xWdmabkTm+6svociHr+tFa+Mc0icYZsW6KXUwEn1jYV+GZNb
X-Google-Smtp-Source: 
 AGHT+IFwmCNPL5aE3FgmJvUfyIwFUQvYFcinWghCIonakDEYeycDzAajn6O7VZPeDDDMSpsKOoIGHw==
X-Received: by 2002:a5d:6aca:0:b0:371:8688:1660 with SMTP id
 ffacd0b85a97d-378896c800cmr11271977f8f.51.1726002789527;
        Tue, 10 Sep 2024 14:13:09 -0700 (PDT)
Received: from void.void ([188.120.129.44])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3789564a279sm9879024f8f.9.2024.09.10.14.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 14:13:09 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Andrew Kreimer <algonell@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH] ASoC: tlv320aic31xx: Fix typos
Date: Wed, 11 Sep 2024 00:12:41 +0300
Message-ID: <20240910211302.8909-1-algonell@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: algonell@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: E6VQ4FR52VC5XEPIGO2FCRSLKC6DRUC4
X-Message-ID-Hash: E6VQ4FR52VC5XEPIGO2FCRSLKC6DRUC4
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:12:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E6VQ4FR52VC5XEPIGO2FCRSLKC6DRUC4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix typos in comments.

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 sound/soc/codecs/tlv320aic31xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 7e624c4b77b6..187d68e8688c 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -895,7 +895,7 @@ static int aic31xx_setup_pll(struct snd_soc_component *component,
 		dev_err(component->dev,
 			"%s: Sample rate (%u) and format not supported\n",
 			__func__, params_rate(params));
-		/* See bellow for details how fix this. */
+		/* See below for details on how to fix this. */
 		return -EINVAL;
 	}
 	if (bclk_score != 0) {
-- 
2.46.0

