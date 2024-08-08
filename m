Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA62694C4EA
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 20:53:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6DD9857;
	Thu,  8 Aug 2024 20:53:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6DD9857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723143192;
	bh=ae321LVliHmFa1rc8wI0yU3i6cZfo8RmSnDSmF2dykk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o54uibKxPnElOvqJvF1shW1JObHGD0KOTuhOh+i7na+OvaVoTMt1wBr1uUGMpWEtn
	 0acNfO/BmG7LndKuX7aR70HkWZ4tTna5+fRG1My9NeALlLuF+LvxTTIEbUYLK5cMqz
	 dQFKEO2q/YW2C3b58jfIVSuixu8dAKsmpwFtxq0A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12B20F80615; Thu,  8 Aug 2024 20:51:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53974F80623;
	Thu,  8 Aug 2024 20:51:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E516FF802DB; Thu,  8 Aug 2024 20:50:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EF5EF8023A
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 20:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EF5EF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZoxCBn17
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2cdae2bc04dso234916a91.0
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Aug 2024 11:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723143031; x=1723747831;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQf8+lxBRGqbcfv4HYra0T6yNXl6ceOKIYI4wys2BEk=;
        b=ZoxCBn172tQK2e/n6qpy8awG4++KX+cXdvqAbTzFs3GIjRQ2DYyPA0E4lch1u/xkmr
         G5KzBvx0xajkVYVfGJLlmRiE0BuMrpkCmwDe+k3PsA0Dn+jADA8vwayibpCMF5q9QEZL
         4Z152MZUYzFMqc/XJe7QYxbeFlgkGUlmk+ymeaDafSShZMSDqJziE70dTijClcPyLbcX
         SPQJvHfDaiNA3gHWjoasNoumDyoE2DRVLY6/ROJ9Mxi8MzYc3upqasmS58aTL3Kayipm
         m0ZRypOCTXVakFzGeOFFeFsHqp9PQZLspI91OmyU++/jUd9VZsmqfB7PhqoWzllWhxLc
         jIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723143031; x=1723747831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQf8+lxBRGqbcfv4HYra0T6yNXl6ceOKIYI4wys2BEk=;
        b=VTM2cXEBFMdIy4KhpddwebUEBhtPzhtjsukZebZEn3WVISYqrOYasXVjCEeg8OGrNU
         8NKnX5U7MhVEYDxUPlkZzcD8lrAfRdeRoMyyZPZT0cznaN39w07iElP2sroo4ulp+Scx
         OFsEGflLGjfsZ7DNMK29mok4HjerEdjgbRDTbHAS1IQiIXcxBxPKrafww6/A2/5C/hjY
         1HZM8vZbgiXxDMuukNsWoZO8tkITzhWfHd9qjZce/Fc3XxrSIOCwba+v278YLq0Ti9J/
         BkAEMFbxGp0mGEhmdrPPbNtGMmGuDSuNMYJM4V9daZHJDhxxjJS7qh58xjiwGvuu+ncq
         ecSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvaBSjgo1ED+ghKLUx3lSO0dEDLQrPz31pcZlPI7WxaJl/cjeeUfOoID1hcmHnUZw14UgoJLzcM0OVbLt5x0kVdz9GGp4fPFtulTM=
X-Gm-Message-State: AOJu0YxrsKrLTHyhASQfmO28P0gY7Rt8627ImPIf5o0B9W69sLZSxxSB
	blemrG6/yQcqwk6tb/N/l1NuY+BcPwYAIB89OWKfOwu3QxkTTtrgxl0Hzw==
X-Google-Smtp-Source: 
 AGHT+IHW5d95YR1OZ6QMEQsz+kRupys9NmA4P5IVjto+TNNsbAqmJQ0uN35VZ0RnFXrrfKa/SN78LQ==
X-Received: by 2002:a05:6a21:99a0:b0:1c4:92fc:7c79 with SMTP id
 adf61e73a8af0-1c6fcf8565amr2124920637.5.1723143031420;
        Thu, 08 Aug 2024 11:50:31 -0700 (PDT)
Received: from fabio-Precision-3551..
 ([2804:14c:485:4b61:d689:1e02:dd79:b72c])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710cb2e4acesm1466354b3a.141.2024.08.08.11.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 11:50:30 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	alsa-devel@alsa-project.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 3/7] ASoC: fsl_rpmsg: Switch to RUNTIME_PM_OPS()
Date: Thu,  8 Aug 2024 15:49:40 -0300
Message-Id: <20240808184944.267686-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240808184944.267686-1-festevam@gmail.com>
References: <20240808184944.267686-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3BOQSDYARTPTADEGRRYJHT77SGBNSVWE
X-Message-ID-Hash: 3BOQSDYARTPTADEGRRYJHT77SGBNSVWE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3BOQSDYARTPTADEGRRYJHT77SGBNSVWE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS() with its modern RUNTIME_PM_OPS()
alternative.

The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the CONFIG_PM ifdefery from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 sound/soc/fsl/fsl_rpmsg.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index 467d6bc9f956..be46fbfd487a 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -286,7 +286,6 @@ static void fsl_rpmsg_remove(struct platform_device *pdev)
 		platform_device_unregister(rpmsg->card_pdev);
 }
 
-#ifdef CONFIG_PM
 static int fsl_rpmsg_runtime_resume(struct device *dev)
 {
 	struct fsl_rpmsg *rpmsg = dev_get_drvdata(dev);
@@ -321,12 +320,10 @@ static int fsl_rpmsg_runtime_suspend(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops fsl_rpmsg_pm_ops = {
-	SET_RUNTIME_PM_OPS(fsl_rpmsg_runtime_suspend,
-			   fsl_rpmsg_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(fsl_rpmsg_runtime_suspend, fsl_rpmsg_runtime_resume,
+		       NULL)
 };
 
 static struct platform_driver fsl_rpmsg_driver = {
@@ -334,7 +331,7 @@ static struct platform_driver fsl_rpmsg_driver = {
 	.remove_new = fsl_rpmsg_remove,
 	.driver = {
 		.name = "fsl_rpmsg",
-		.pm = &fsl_rpmsg_pm_ops,
+		.pm = pm_ptr(&fsl_rpmsg_pm_ops),
 		.of_match_table = fsl_rpmsg_ids,
 	},
 };
-- 
2.34.1

