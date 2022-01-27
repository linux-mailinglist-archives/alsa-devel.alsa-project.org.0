Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B8649E322
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jan 2022 14:14:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C4721910;
	Thu, 27 Jan 2022 14:14:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C4721910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643289296;
	bh=IEsjkRBo8VNuspUc7lc0OMVB+ejks8lPC1jN3f7B/Ls=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cs1VJ784D4DPAPhL5BoNODSECDqsyKy1RL7K3pSppFQaCias/Y0pM1fNvIBdzDZlE
	 gX8Vh7IMTmI65PnScjnaJ4TakBOhiFqFoKPgp6zUCofbylhyfkpoEN2q9ZmslndiPk
	 lMa4CHKCmnpqG/J/5H7rpMsBYUHjYF9bd4LhTRfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA338F8025A;
	Thu, 27 Jan 2022 14:13:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0001F80254; Thu, 27 Jan 2022 14:13:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89547F800C8
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 14:13:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89547F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ABvPbSjy"
Received: by mail-pl1-x629.google.com with SMTP id h14so2468652plf.1
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 05:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YXzkvLeXLi2eCYEQ5gEHtGCtSrlAhjMGW+JtDUaBg2s=;
 b=ABvPbSjyT6rV20F/ei4kOOQ1fFDOwJMtWo/sSVF9nIHbwU6Nqceo9/hWVX96sXehSx
 8ZsJVv3qVRw8N1xyHhNdLY/X8DD/XEoUT4H5eZ6EQG3+XZRclCPQ8IE8qdmobawqMRxr
 r6qQQ36gH5zwgOjsTBNi3nJfE1VtJpELMqDsF+jhoJ6vL/QTPfr+jWOa7uIYPXNtNdrO
 DTbby/kjEYxmz+tA4E1ifrjujFQVq1XjEGm8ipynyUYPmeckGnlGHqMYfJP9t83wmPlZ
 PmEQjfbmgnLQJAnxxvqsgMBYyaz+UDI4KEuQGYUo5iFukbzekZUltwXwB/mOLK5jkSzn
 c37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YXzkvLeXLi2eCYEQ5gEHtGCtSrlAhjMGW+JtDUaBg2s=;
 b=kTFwC60WN07VQ7A0zxVSqBpZOEsgTsL+fqQGYxsdJusllqz5lQj0rdcooWMyNAtujb
 N56F0oI8JUJxdWRG0A0ogQJj2JnCNxuHBwYmD+QT375/Ha3ckaxaZWJr0hNOYVAKVY/t
 WJq1lcjA7ZMrQjqdxuBKCTwYgIuM/g+WOckY+tsGG3WWzJFbu7V/vMzZByKArF3UAbww
 CAAhCWqmKLStMQpP9+1xXyZCYKlkNNo6JRWxEQ2IhFMbbl7cR05yIfERF9LMN8uFcO75
 qCiahBip73wdWBOfUz8Iqc92x0JOiqACVkprSVUABT9Vtsnxj5zWxEhvcVWZp33/f8gA
 K4QQ==
X-Gm-Message-State: AOAM530u2D/b07z7m2Khp6Uo8vqtSk9NLUeS3RoCFcCVuDj5JPH23Cgh
 LwIgQ8Jo7kcOgXA4DIic/o7H3eMSjc8wr3Po
X-Google-Smtp-Source: ABdhPJysbG0ubLDHAuk/vm5CAv0jg6oZWRdNVaWO0vQPW+mAPZCdMtTl6CK+a5TjP6POX6vPtKJxxg==
X-Received: by 2002:a17:90b:17ca:: with SMTP id
 me10mr9860243pjb.207.1643289221704; 
 Thu, 27 Jan 2022 05:13:41 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id d9sm5683355pfl.69.2022.01.27.05.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 05:13:41 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Eric Millbrandt <emillbrandt@dekaresearch.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: fsl: Add missing error handling in
 pcm030_fabric_probe
Date: Thu, 27 Jan 2022 13:13:34 +0000
Message-Id: <20220127131336.30214-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YfFFWSVgnbL6ETxo@sirena.org.uk>
References: <YfFFWSVgnbL6ETxo@sirena.org.uk>
Cc: linmq006@gmail.com
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
Changes in v2:
- avoid return early before the card registration.
---
 sound/soc/fsl/pcm030-audio-fabric.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/pcm030-audio-fabric.c b/sound/soc/fsl/pcm030-audio-fabric.c
index af3c3b90c0ac..83b4a22bf15a 100644
--- a/sound/soc/fsl/pcm030-audio-fabric.c
+++ b/sound/soc/fsl/pcm030-audio-fabric.c
@@ -93,16 +93,21 @@ static int pcm030_fabric_probe(struct platform_device *op)
 		dev_err(&op->dev, "platform_device_alloc() failed\n");
 
 	ret = platform_device_add(pdata->codec_device);
-	if (ret)
+	if (ret) {
 		dev_err(&op->dev, "platform_device_add() failed: %d\n", ret);
+		platform_device_put(pdata->codec_device);
+	}
 
 	ret = snd_soc_register_card(card);
-	if (ret)
+	if (ret) {
 		dev_err(&op->dev, "snd_soc_register_card() failed: %d\n", ret);
+		platform_device_del(pdata->codec_device);
+		platform_device_put(pdata->codec_device);
+	}
 
 	platform_set_drvdata(op, pdata);
-
 	return ret;
+
 }
 
 static int pcm030_fabric_remove(struct platform_device *op)
-- 
2.17.1

