Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B53349C8B7
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 12:34:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86D9F1F0D;
	Wed, 26 Jan 2022 12:33:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86D9F1F0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643196869;
	bh=yWdW+gSmIxeIlk50tCS2PvaKNzM/Ssgr7lInAB+60jc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TFbzaRWsLDxDWkrli4gM2gx6IEtJEPvBE1zgd2jZFWicyLUinLSigSgYfp4y1NnY6
	 M1klWA5JQkSfd5x+L+4giVjpJjYtQpfBSscHlkYJ0A48EaMr8W2xxR1J1OroKInZPx
	 xvuXaIvCIYHV56Ce8ZW+WQU5/VHXxgHKfGIoPS+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4F49F80118;
	Wed, 26 Jan 2022 12:33:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75031F8049C; Wed, 26 Jan 2022 12:33:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AD2BF80118
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 12:33:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AD2BF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PSlbe9++"
Received: by mail-pj1-x102a.google.com with SMTP id
 d12-20020a17090a628c00b001b4f47e2f51so4326147pjj.3
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 03:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=a8wHaxFP6XLg/+G2Gdl2AxvIcrGqp9pWAjcn6Z4Bg5Q=;
 b=PSlbe9++ZoQHmKjIdWrjG+TGtkYyetB4XHKyf09AJjOlKxZjkgHgCh4a+vWBsR0oS7
 mxALTkCh1w9lBxjOWpnGuywGjti5sA3PO3lmLz6YLekl/HL39j0JGRg54VNDX7XBB871
 zlmnhSA/jMwu5kgnZKy3T1ApGfz+/vI1QKetRHciKlkudV+ym07Y5GBA8liEWrXlYVJR
 C5KGEN3qwKt/7SxTyLNiQUEZNvpPHkQigi5k3FTshX07frGPWOiniLBZOyqqhF7WVWWo
 iiZ+mFuNgvkpbCLBhwUeJvbuhelvp3HI3OO7IkVc/nStHiC1nb/7pZkwnI23aab+vin+
 gusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=a8wHaxFP6XLg/+G2Gdl2AxvIcrGqp9pWAjcn6Z4Bg5Q=;
 b=ofo/9dWzdH5lLW23xdruozHNiR51ygSVhuf2j1JFND6jsiplrf9GPAD5BrJ7yOdF74
 TqYraDrwwZcKmu+SM42RqcvTRDm5DdXDwJ5b89RqilwqVSAYaYIqXchPyRDfPQeVF6kr
 vr2EJI6kGItPdHaHXesGnb9OwyDtewZnVp+39IzigBjVQprxTMFpNkwmjJQEqUV9TQFO
 JyAsaqLEcVgkO848LChKFGJ/SUcA/DAzPixMLVGgcWonqqQzChZ5dmSLPcxEPSJT/kfO
 wkPVML+/iiLkTKYskS3p2XxPSZwGR0Cjh9R9wqyDJyYT1m81QxgN/k51xipb6nfX5VWQ
 LWIw==
X-Gm-Message-State: AOAM532xCfdMZMF816d/OQc5u72V4/UcWNuo/BeCnzRC754/OOQiqjWE
 EEV4aexoPZNrjOjwkyKl/Nc=
X-Google-Smtp-Source: ABdhPJyYzirjwI2H2BJxS8J/fQ26G11g80rcwzf3uUGfhnZSUjJpCP5YHoznUbQ/c6XDeMzYwfXeCw==
X-Received: by 2002:a17:90b:3ec5:: with SMTP id
 rm5mr6448550pjb.14.1643196791927; 
 Wed, 26 Jan 2022 03:33:11 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id m1sm1913787pfk.202.2022.01.26.03.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 03:33:11 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Miaoqian Lin <linmq006@gmail.com>,
 Eric Millbrandt <emillbrandt@dekaresearch.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl: Add missing error handling in pcm030_fabric_probe
Date: Wed, 26 Jan 2022 11:33:04 +0000
Message-Id: <20220126113307.1673-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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

Add the missing platform_device_put() and platform_device_del()
before return from pcm030_fabric_probe in the error handling case.

Fixes: c912fa913446 ("ASoC: fsl: register the wm9712-codec")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/fsl/pcm030-audio-fabric.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/pcm030-audio-fabric.c b/sound/soc/fsl/pcm030-audio-fabric.c
index af3c3b90c0ac..02c4ae20c673 100644
--- a/sound/soc/fsl/pcm030-audio-fabric.c
+++ b/sound/soc/fsl/pcm030-audio-fabric.c
@@ -93,15 +93,22 @@ static int pcm030_fabric_probe(struct platform_device *op)
 		dev_err(&op->dev, "platform_device_alloc() failed\n");
 
 	ret = platform_device_add(pdata->codec_device);
-	if (ret)
+	if (ret) {
 		dev_err(&op->dev, "platform_device_add() failed: %d\n", ret);
+		goto exit_device_put;
+	}
 
 	ret = snd_soc_register_card(card);
 	if (ret)
 		dev_err(&op->dev, "snd_soc_register_card() failed: %d\n", ret);
 
 	platform_set_drvdata(op, pdata);
+	return ret;
 
+exit_release_dev:
+	platform_device_del(pdata->codec_device);
+exit_device_put:
+	platform_device_put(pdata->codec_device);
 	return ret;
 }
 
-- 
2.17.1

