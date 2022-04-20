Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85972507EC1
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 04:20:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3C2C1828;
	Wed, 20 Apr 2022 04:19:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3C2C1828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650421215;
	bh=EDThhC71ijNWEoYlYX9uhKPCT4GCyZSQ7cJ+W7uf1Y4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IKAf4iPQ8elRx8ZtB7HhPS0YDujnuc6t9sygJdufMLf/igpciwbamF72pJsXpnp0V
	 r9LnqI5ysuDkc5uf3z+igaRk4SGk6d/KlPc/xrw8tAPkJH5y9LabEIG/LzTpjMheQo
	 i94iZ+a1F7qCcODXJMxoHCb8g+dsTpcIJ7UMCNQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DBC6F800C1;
	Wed, 20 Apr 2022 04:19:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E05FDF80125; Wed, 20 Apr 2022 04:19:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A976F800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 04:19:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A976F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a687CipG"
Received: by mail-pj1-x1031.google.com with SMTP id
 mp16-20020a17090b191000b001cb5efbcab6so3633779pjb.4
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 19:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=rF0d2fPjjYbYQnGkxkUzLty/3S+O+5X64cLZKZhZO4E=;
 b=a687CipGVP6S8l+yw3Z2qapCCMGrDznZGl7Hg3EB037BBEABhZ6eF3M10/IylPutLq
 tQk4PoARW3oQOylOYrHMJUSK816QZrgIdfkSTwwL0QdHAkJVcmKoL9XaORVH2tFZ8bkQ
 suw0zsEntUJBE2xRXZ3LyV8uwnGt9PxlXtBzTac8aTchaXiMvgmTCOZPXXL6jawi62ut
 YG/CoFhUJ9DK3+VJLvU6h9rohaJqhLf1gVWx+op8HU8pcClxlOXXbY1WGA2Y41fi03v6
 q6u8qH5e52PTYTG/EQ2jyxwTOkR9v9EjEuQQpyd1QGp4cAZO59SpZQ1J0naqroyozhTl
 HKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=rF0d2fPjjYbYQnGkxkUzLty/3S+O+5X64cLZKZhZO4E=;
 b=xaufYgQ1EKBUgr7ltlqi2SQMpRRgcBI9r7irw2NDafiaWWgxxnnooOvJ5uw8wzCNPW
 exzsAT7tumLudDBHmcUzdCaWMbMY+h+BeeH+oMW75o8VZ/sEHudaLEpQrvYY332uA7wh
 ILsK+j0vxKg9SXd+A+JS/JwkEKNWTJEjYE9I6D6GehfqARHM4KIXwEtPYFeEAozGuB6t
 vC84YlFMq09SMR/P8lNfUBd2RjxvIK1DJ7N3PGM2ZoScTWHSESfIwtoU7qMtw4bpH9pZ
 iWtyNVRbltywlOD84J99jvBX4NuOeV68N97N5B8239X9aVtE09AzurSWL7rXb7m0a2CF
 fCug==
X-Gm-Message-State: AOAM5306TY+PlXgacOJjW0qUbcfWDfQ2jaJHykler5j0EKIBL/sCQw4r
 YeQFYldp0nzBXP2wH7YUpwk=
X-Google-Smtp-Source: ABdhPJxbaX8P4DgFAq5AqtRlie8zEQAmzOhdP6082cOtk6bDfu+J7/3gLmB876ENEQEoVEvDJTvcPQ==
X-Received: by 2002:a17:902:bd06:b0:158:8973:b16b with SMTP id
 p6-20020a170902bd0600b001588973b16bmr18598380pls.129.1650421145605; 
 Tue, 19 Apr 2022 19:19:05 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020aa784d6000000b005082b06cc58sm17015120pfn.215.2022.04.19.19.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 19:19:05 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Miaoqian Lin <linmq006@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: fsl: Fix error handling in pcm030_fabric_probe
Date: Wed, 20 Apr 2022 02:18:52 +0000
Message-Id: <20220420021855.8224-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <Yh90u+E3RTuGEDWU@sirena.org.uk>
References: <Yh90u+E3RTuGEDWU@sirena.org.uk>
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

This will call twice platform_device_put()
if both platform_device_add() and snd_soc_register_card() fails.
return early on error  to avoid duplicating the error code logic.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
changes in v2:
- use return statement to return early when fails
- rebase on top of commit 559089e0a93d ("vmalloc: replace VM_NO_HUGE_VMAP with VM_ALLOW_HUGE_VMAP")
---
 sound/soc/fsl/pcm030-audio-fabric.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/pcm030-audio-fabric.c b/sound/soc/fsl/pcm030-audio-fabric.c
index 83b4a22bf15a..096a37993ad3 100644
--- a/sound/soc/fsl/pcm030-audio-fabric.c
+++ b/sound/soc/fsl/pcm030-audio-fabric.c
@@ -89,13 +89,16 @@ static int pcm030_fabric_probe(struct platform_device *op)
 		dev_err(&op->dev, "request_module returned: %d\n", ret);
 
 	pdata->codec_device = platform_device_alloc("wm9712-codec", -1);
-	if (!pdata->codec_device)
+	if (!pdata->codec_device) {
 		dev_err(&op->dev, "platform_device_alloc() failed\n");
+		return -ENOMEM;
+	}
 
 	ret = platform_device_add(pdata->codec_device);
 	if (ret) {
 		dev_err(&op->dev, "platform_device_add() failed: %d\n", ret);
 		platform_device_put(pdata->codec_device);
+		return ret;
 	}
 
 	ret = snd_soc_register_card(card);
@@ -103,6 +106,7 @@ static int pcm030_fabric_probe(struct platform_device *op)
 		dev_err(&op->dev, "snd_soc_register_card() failed: %d\n", ret);
 		platform_device_del(pdata->codec_device);
 		platform_device_put(pdata->codec_device);
+		return ret;
 	}
 
 	platform_set_drvdata(op, pdata);
-- 
2.17.1

