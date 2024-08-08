Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5D694C4F0
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 20:53:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAF01E82;
	Thu,  8 Aug 2024 20:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAF01E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723143237;
	bh=ddYKQIDL235r4+RKAIGr9PUoUGq/CeBqhl036jTf0z4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t7/9PUSZl9J2d7CJsu9zfFKL7atTlw16nlnR9Jh+BDU5Q3+dc+sjII5FLDmbsz9du
	 YlSqZn68vdMZ+n8uyB0h7byYxewtH5o7nvV9cldXKmywBAiWTVVHuiHuFj1aOrVX3U
	 yxsbLWdXXoFfR4qTenKmjaVPz/m7QY7H9GX8Xtj0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25E45F80693; Thu,  8 Aug 2024 20:52:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CE01F806A6;
	Thu,  8 Aug 2024 20:52:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6419F802DB; Thu,  8 Aug 2024 20:50:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27C54F80236
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 20:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27C54F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SyBorBet
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-70d2cd07869so110877b3a.0
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Aug 2024 11:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723143041; x=1723747841;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHFlSeM0x9wf/C8SejIAylQjDyad2lQr4Ad9tCBEoBs=;
        b=SyBorBet/uvWrWxQW8OzhKSLZ+PVIwfM+XyHtJiMhlksdoDARagFFgpc6mF1oqySM2
         PRJpS4y5KtsgEmK/434RQWcw8R++XCjDQVC4PEDEiV2xZpzsDykPbBPHdkUHRT70UbLt
         lHpXgnK4Pko2TDu4+DXLPVm2z6LRvWJlFwXDe6iaj7IcntsHuiRJyLwJTfT9MMg2+Y2F
         nkgasipMmLlVOZkNZZ863V+Mezp60QUOf1RHdez1v9o7QFRA9kbxsyE7ix82ViZTlyKh
         GjZzwEj2IPjUB+vGAdws34CV9Sdcatl4Vz5J0QzBHtqPzT7MqDHhBDrH9TGrC9wpLV6V
         SFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723143041; x=1723747841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHFlSeM0x9wf/C8SejIAylQjDyad2lQr4Ad9tCBEoBs=;
        b=oEm51C8zVGSJ0bnzhaGHOrZga336lWEl4knKCAgzZbFGNC5H8XU+RNFLFF4brdIZqC
         o/GnzhT0MAIgZhx/gqUeoXd6Bssz5AK32mqwNLRtN2AoouuT6hRKl8zS7Q6AVIGVeH3/
         DXqlpYYyCy5oVaLSfyxaQkrLIV054C9tYcAEFZgLh+LJLazc4EKhEF9lqPUp+wfCz5/A
         LIK1hpA7ULYlo8d03Qke85r8TH9vMQIqHZNv3w/QPHXx4MDKqBf6EjLPx0gCvdM1St9K
         kQda0Uaht+jhcYrHr+W3lGsvczG5SHSgxzWWmRHnpINJkFN6OtEz274z7JerokGfYk+C
         VNPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYZRNRf+MZASY+DIBtKw15sxLmmhMqteh1IOS/hMFPSTNTtNFKHyBbEgoBwZhFBDMls2aGXwiT40Xw@alsa-project.org
X-Gm-Message-State: AOJu0YyoupXtuNo1NA6mEdhMmPlTQvUIiEshiiwaGnF9iKGzXHe3j+62
	dINr8dVVhAWWIhRpWhzJuXuZHFu7UHbv9VEzi5iNhVDNZ3htWit9F/Krww==
X-Google-Smtp-Source: 
 AGHT+IEJNzTRowR2scY7npjwzCxHF+PmEuPWdFSnIypgTkFivuBev917Fym2WHBPKdalssWtfBz3sA==
X-Received: by 2002:a05:6a00:3928:b0:70d:148e:4bad with SMTP id
 d2e1a72fcca58-710cad593demr2064483b3a.2.1723143040643;
        Thu, 08 Aug 2024 11:50:40 -0700 (PDT)
Received: from fabio-Precision-3551..
 ([2804:14c:485:4b61:d689:1e02:dd79:b72c])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710cb2e4acesm1466354b3a.141.2024.08.08.11.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 11:50:40 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	alsa-devel@alsa-project.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 7/7] ASoC: imx-pcm-rpmsg: Switch to
 RUNTIME/SYSTEM_SLEEP_PM_OPS()
Date: Thu,  8 Aug 2024 15:49:44 -0300
Message-Id: <20240808184944.267686-7-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240808184944.267686-1-festevam@gmail.com>
References: <20240808184944.267686-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FX5IGAQUDLTOHKNT2J235MLANA5FHAYI
X-Message-ID-Hash: FX5IGAQUDLTOHKNT2J235MLANA5FHAYI
X-MailFrom: festevam@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FX5IGAQUDLTOHKNT2J235MLANA5FHAYI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS()/SET SYSTEM_SLEEP_PM_OPS() with their modern
RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() alternatives.

The combined usage of pm_ptr() and RUNTIME_PM_OPS/SYSTEM_SLEEP_PM_OPS()
allows the compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the CONFIG_PM ifdefery from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index b0944a07ab47..22156f99dcee 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -753,7 +753,6 @@ static void imx_rpmsg_pcm_remove(struct platform_device *pdev)
 		destroy_workqueue(info->rpmsg_wq);
 }
 
-#ifdef CONFIG_PM
 static int imx_rpmsg_pcm_runtime_resume(struct device *dev)
 {
 	struct rpmsg_info *info = dev_get_drvdata(dev);
@@ -771,9 +770,7 @@ static int imx_rpmsg_pcm_runtime_suspend(struct device *dev)
 
 	return 0;
 }
-#endif
 
-#ifdef CONFIG_PM_SLEEP
 static int imx_rpmsg_pcm_suspend(struct device *dev)
 {
 	struct rpmsg_info *info = dev_get_drvdata(dev);
@@ -809,14 +806,11 @@ static int imx_rpmsg_pcm_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops imx_rpmsg_pcm_pm_ops = {
-	SET_RUNTIME_PM_OPS(imx_rpmsg_pcm_runtime_suspend,
-			   imx_rpmsg_pcm_runtime_resume,
-			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(imx_rpmsg_pcm_suspend,
-				imx_rpmsg_pcm_resume)
+	RUNTIME_PM_OPS(imx_rpmsg_pcm_runtime_suspend,
+		       imx_rpmsg_pcm_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(imx_rpmsg_pcm_suspend, imx_rpmsg_pcm_resume)
 };
 
 static const struct platform_device_id imx_rpmsg_pcm_id_table[] = {
@@ -832,7 +826,7 @@ static struct platform_driver imx_pcm_rpmsg_driver = {
 	.id_table = imx_rpmsg_pcm_id_table,
 	.driver = {
 		.name = IMX_PCM_DRV_NAME,
-		.pm = &imx_rpmsg_pcm_pm_ops,
+		.pm = pm_ptr(&imx_rpmsg_pcm_pm_ops),
 	},
 };
 module_platform_driver(imx_pcm_rpmsg_driver);
-- 
2.34.1

