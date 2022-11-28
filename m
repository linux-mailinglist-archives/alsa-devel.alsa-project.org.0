Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6419C63A65C
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 11:50:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB8411682;
	Mon, 28 Nov 2022 11:49:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB8411682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669632628;
	bh=1iNfBQprbCL5uuwJdOOHqaHKJMFyiY6IxXgcAY+v+5g=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=orYY/E5XvYxI4u0EyufqoOj89InKNJsFSfMg6qP6dRi6xP0miqesXtA1XVufzYziW
	 gbGTWuEexNT26usP3ZLUgf+cYfOBEWxu8fhmYLKU1Ps1JEcrCXKCpZ6rCSgO32EmrV
	 61kMlehiSvdVm14HUVSRLXgDKM6GRHDNKh78ArRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7509DF8024C;
	Mon, 28 Nov 2022 11:49:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E235F8020D; Mon, 28 Nov 2022 11:49:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B147F80166
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 11:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B147F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="g1wT1jbJ"
Received: by mail-ed1-x532.google.com with SMTP id z18so14812449edb.9
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 02:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vs91y4YHGaU4u34bShI3KgPuCoRDr3inolegFmFOmPY=;
 b=g1wT1jbJufkUIzwh72l46wsx1uYKO6vUXth/QRDGsWDYmz2itJuh2wgRz8gFB54ual
 76YJb90ReXIyTt4Key/8F9QfduafhRtX1068ym/ARwB/w3JJhr4W7HkfdQ4HaSrDoWWJ
 9yhqFuIIlIl5iPlcxM9r1KT+oCOFR18mXqDpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vs91y4YHGaU4u34bShI3KgPuCoRDr3inolegFmFOmPY=;
 b=ejLNzR+Z0AdVOk+jvt7LdJvUP3YzOAzvu/3tIcoTcs9Fa/DiAWgeLoPKNPozQzTNBB
 j8MBH2EqmxkD7qDjEu/sgUFOnUZmd/1HT7jCciNASy8Az5rg8U2WrSCKnjD8uj3s1K4u
 kZfIQgIrXt94aRwmHScobJwjqsmj2kllqPWnTMeE4HxQocWU+MuwJFlYl/+B2t/hBKfn
 alwHHrsdC693wHcmihvElwF60bm+N4ddF9wLnkNjrf5CQ13yZtUsbBESJifwM0I42QcB
 516+xXX1A80d1l7NGKv2C0wDxfR1UMwJRgkVbNQt2Tar6sHWe0/9aHmYLSLsLwtniKzJ
 RjOQ==
X-Gm-Message-State: ANoB5pkRzECgpo5cvH0Vtx7v5JqsBjAsQ+uL6gArHh9znwuN6hGJ61wg
 qMf0hrMQlJn/Eyu3FgEDpPn1aA==
X-Google-Smtp-Source: AA0mqf5hrXjmKOSXxjiJqKrhc6FaO+hU2zOidPRgql2hNwlfmPs5esNtOtTjU/0Dp9iwo7rwPZ433w==
X-Received: by 2002:a05:6402:25c6:b0:461:b825:d7cb with SMTP id
 x6-20020a05640225c600b00461b825d7cbmr23424438edb.167.1669632562801; 
 Mon, 28 Nov 2022 02:49:22 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk.
 [80.71.134.83]) by smtp.gmail.com with ESMTPSA id
 e16-20020a170906315000b0078d793e7927sm4804807eje.4.2022.11.28.02.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 02:49:22 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Nov 2022 11:49:16 +0100
Subject: [PATCH] ASoC: mediatek: mt8173: Enable IRQ when pdata is ready
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221128-mt8173-afe-v1-0-70728221628f@chromium.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=2420; i=ribalda@chromium.org; 
 h=from:subject:message-id;
 bh=1iNfBQprbCL5uuwJdOOHqaHKJMFyiY6IxXgcAY+v+5g=; 
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjhJIviHDnwbhEMYFc1DDyoI7BOTyJsA2fKfNMrK8p
 kvF64PuJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4SSLwAKCRDRN9E+zzrEiP7nD/
 44biNT3txpSfvfha5zX+nfGnR6vEZ5/aUznIE7t3v5EjRczkRaxGRDUahFKxVrfRp0FA49fA7X4sFd
 KVwoYZDahx0sO2UZxEkDCC2LgvSbZzCEdIBWK5khVTH5HskDhrUhnGNGMnla7oNl7syeaiWE2TK0M9
 N1fva9c3htr0ZJ4TTVsX3/QgzTcX3yjBBGsWuEEMKJOsZbv2Etaxg5SdJ9iiHbLW/Hy9Zf5gHWTx1J
 gscAlxKYeJVhkbwzm14KK4VZvycIxGcN7ct4cPbdxBz9r7fmPE1hSgAgqGX8Bw2awcXoEpEe0eOuCs
 yxvMeHXMK7dqnwhM+kXYPhljHkACNAwQORPRj1kvh+UnQQ/rE9yW9+5vyXrUGT0h8YsjMYqXSdMu9p
 fqp2TviL9spcEmukM+bgvHcAr/gzuJE+2xWosZ9Jt+Ybc0kwbc2pk755JkN7A5i2TdRHUz86L2xwhZ
 Qqz5NG6qp+qhX6wxx/dEiBOKhrr3MlAyVNVRohBN+iuAJ4ZfirvCLaI6Q/9YgyvlXszvfCWDna9Len
 bTmuYjX7Dqe1S6kyc25W/v6t+rlWao7KXbvFxUuRa0trMISstb93p+uLXVzc9eHR5uqgp+sralQNnL
 hu3L2ogYp6R3e3Gj58KOCtpPWzOgnY4fNwe77KAuxySKgrqpyu2TSBpelY0g==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ricardo Ribalda <ribalda@chromium.org>
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

If the device does not come straight from reset, we might receive an IRQ
before we are ready to handle it.

Fixes:

[    2.334737] Unable to handle kernel read from unreadable memory at virtual address 00000000000001e4
[    2.522601] Call trace:
[    2.525040]  regmap_read+0x1c/0x80
[    2.528434]  mt8173_afe_irq_handler+0x40/0xf0
...
[    2.598921]  start_kernel+0x338/0x42c

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index dcaeeeb8aac7..bc155dd937e0 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1070,16 +1070,6 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = &pdev->dev;
 
-	irq_id = platform_get_irq(pdev, 0);
-	if (irq_id <= 0)
-		return irq_id < 0 ? irq_id : -ENXIO;
-	ret = devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler,
-			       0, "Afe_ISR_Handle", (void *)afe);
-	if (ret) {
-		dev_err(afe->dev, "could not request_irq\n");
-		return ret;
-	}
-
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
 		return PTR_ERR(afe->base_addr);
@@ -1185,6 +1175,16 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup_components;
 
+	irq_id = platform_get_irq(pdev, 0);
+	if (irq_id <= 0)
+		return irq_id < 0 ? irq_id : -ENXIO;
+	ret = devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler,
+			       0, "Afe_ISR_Handle", (void *)afe);
+	if (ret) {
+		dev_err(afe->dev, "could not request_irq\n");
+		goto err_pm_disable;
+	}
+
 	dev_info(&pdev->dev, "MT8173 AFE driver initialized.\n");
 	return 0;
 

---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221128-mt8173-afe-5fda4512e8b5

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>
