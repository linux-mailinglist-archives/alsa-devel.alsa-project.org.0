Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E363D925FF4
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 14:16:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 257A3846;
	Wed,  3 Jul 2024 14:15:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 257A3846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720008967;
	bh=PRQQy74IKpWXY3QRzTxqKhhESPCzDa1EA9BIIyylgGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WlqZLZAcOw1GpWGFJHMrrbSGDc+i7pLlqsHzuvTtVkiwoLY1O7UM8ejkHk4H5rqBS
	 IsQdE2YFXxL1MgCC8Lb9F42+YiHYlscQU1lnGj+ZlBhBJ87DS8TQxzVjsOHwWMOkZI
	 nMn8o+yJQpyAXwQExL6of9ItlxKbZYoohlB27H20=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85831F8069D; Wed,  3 Jul 2024 14:14:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B15DBF8069D;
	Wed,  3 Jul 2024 14:14:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FD08F8025E; Wed,  3 Jul 2024 14:11:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78DD9F80568
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 14:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78DD9F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ueSeRynF
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-363bd55bcc2so2856447f8f.2
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 05:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008683; x=1720613483;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vKX4owx3K95iTAC+SEBiaFm2gE/o+uY6tBcM1pCKsoI=;
        b=ueSeRynFIT07+EQRaewBEi07uljMN8NEIwvcZhVV2rBtf56pjWLucHfGiQH7ixOU9s
         SvfosSYslGgvmZENi3urL0laeobCN2MaSuqkDJjgDNwQ69k9Llq9Y0GThec4uN+aq0z0
         pogwsS4rI8ZEO7GREoRuoIjbXtPgL4mE4GDYfXlmDOgt5rIqXmbNkYQ9aZX2Ihg7Ifu5
         19pxCjUloJ8mSd/C9g1oDRTvFW/+DbBnU+Hsw5goM2ArOjPqMqzivp49z6XbXgcjLDNI
         CKu/dGzrc6j5p0csJy5BKlnNlMvmrkayH1+XYctvvoodJ8MRT9h0kqhLBOKUNHwsczNR
         Lf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008683; x=1720613483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKX4owx3K95iTAC+SEBiaFm2gE/o+uY6tBcM1pCKsoI=;
        b=GGAS4ZR8QvxysodU/ygcAfuDa8/dG0IfkQeaCte2lC/itrR1R5so/bLqr2Mh1xEDuj
         7WuC4NsUSuXtux8g6B7xkVAvcdEVpIJB4TPxjXGzrZRlwuSSGBP2bwksz1G0MAaYrDPa
         hQEPGENklQB+wWYD73S2Ic+9Yks3n+SAiTMKOUEgqZojIJf8WDhFae0zfZRiNKM5Ow00
         13m+I0PV+2F4uDqOT346oY9x0z0XjRnLRFWPcYVBi4So6VRrVepMo9AvGCvq4Awu50ko
         +esI1U5l/kcl7E8A7Jr02/xkhBl0z9VMmJZUCFZCSo8WF3Q2JAxZn7o9dejXFJswDK0i
         o5UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMu6SgGb3auBM1R7Av3TPsXgSrBxWxlCcGXvg3c5RZZ44KHJrCE1Cq/dbN+EF848KYF9z2ZR6dKtnsahJyqq5+ppT6Q0+9G455DiM=
X-Gm-Message-State: AOJu0YxY4I9rEV43W2CYI/wi0KyulRJ8qMFqmmR5PMi/jlxsXjafyQNH
	/HTIY+D0/h7S9mkWEe+X0BydNvAzRn8Q5xwrwBicI87rpykcuzcV8xOs+78ErF8=
X-Google-Smtp-Source: 
 AGHT+IGqluTLxpMaeApU+pNJokz5T0F4CHd4vNq0sR19A7/Trl8lK6C+BdOafaCFJJwBIDjLYOjGRw==
X-Received: by 2002:a5d:6a8f:0:b0:367:958e:9822 with SMTP id
 ffacd0b85a97d-367958e9b0fmr781281f8f.14.1720008683326;
        Wed, 03 Jul 2024 05:11:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:11:04 +0200
Subject: [PATCH 10/11] ASoC: dapm: Simplify dapm_cnew_widget() with
 cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-10-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
In-Reply-To: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PRQQy74IKpWXY3QRzTxqKhhESPCzDa1EA9BIIyylgGQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/aXmraSNTcjJCjdJ7G8Qpn/Wj7KF+TwsTBT
 Oivb/6xzeaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/2gAKCRDBN2bmhouD
 11BgD/44ltVETo8dFBbkx5BpxYgtnLMW1PexinlwUhGnV6rJEoMiokxjT1QHF7YpnBtavF+7d56
 FXFNhVMRkgrOaP//aW+RoWhx727o7KjPurvec9Yqbhvp1fZSgP2fzfaZkPIxsUosyeSu3NzPJeB
 2gc2vIuwe4BFZnGIE7eG4w4OYiGLR/xZYb2dfRU6YpjHJZJnReLTu59NgvCR/8PhgHJ9u3Typvp
 iOxG3vJyIYvwdOpQwCX7z+GzjkFRjVVM9p1ldTLsPbdNlwQ18xcTpo39j10W8Ijc0aRgtPxhoJ6
 6NiN83X57gYY6KiJb5KPUPrpB8y8UwPcofDE2PXISKRNjtpo2juJNETaGt5+9MiI6ZcNfIoynRG
 MPDOuvZFTU15x//703SoVXViSKKdAUzZAJxx24ZW0Co308aPReIdYK3u+qIXhk+U9S1EfdLohpS
 DD3UZtxoRBJCc/CuzDASsDeacECYBxmqqJ5vmKtr8dq+biTheT1CvoNE+9xs4ZFnCoYkD0FoidO
 4MFJ3J8LH34qn1kaSjgJSK/PgutLunY0Bv/VX6r9/vHVvG2BGITpq6Z9j4qLnXQ7oj2No5WitBi
 hl+ZIAONea82+MTev2qbmrxX0F0NsGwJdELbV/zdhdvgupKk7cZLdZvlyjKaS86GO/LBpUzvhni
 7zvb8cfJn3lBucg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 6H7CR4H6HQU7RVVA3BLC75TRGR2VKHDN
X-Message-ID-Hash: 6H7CR4H6HQU7RVVA3BLC75TRGR2VKHDN
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6H7CR4H6HQU7RVVA3BLC75TRGR2VKHDN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the memory with scoped/cleanup.h in dapm_cnew_widget() to
reduce error handling (less error paths) and make the code a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/soc-dapm.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 16dad4a45443..236aa3c8eea1 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/async.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/bitops.h>
@@ -323,9 +324,9 @@ static inline struct snd_soc_dapm_widget *dapm_cnew_widget(
 	const struct snd_soc_dapm_widget *_widget,
 	const char *prefix)
 {
-	struct snd_soc_dapm_widget *w;
-
-	w = kmemdup(_widget, sizeof(*_widget), GFP_KERNEL);
+	struct snd_soc_dapm_widget *w __free(kfree) = kmemdup(_widget,
+							      sizeof(*_widget),
+							      GFP_KERNEL);
 	if (!w)
 		return NULL;
 
@@ -333,20 +334,18 @@ static inline struct snd_soc_dapm_widget *dapm_cnew_widget(
 		w->name = kasprintf(GFP_KERNEL, "%s %s", prefix, _widget->name);
 	else
 		w->name = kstrdup_const(_widget->name, GFP_KERNEL);
-	if (!w->name) {
-		kfree(w);
+	if (!w->name)
 		return NULL;
-	}
 
 	if (_widget->sname) {
 		w->sname = kstrdup_const(_widget->sname, GFP_KERNEL);
 		if (!w->sname) {
 			kfree_const(w->name);
-			kfree(w);
 			return NULL;
 		}
 	}
-	return w;
+
+	return_ptr(w);
 }
 
 struct dapm_kcontrol_data {

-- 
2.43.0

