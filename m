Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F100910FC48
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 12:15:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 681941612;
	Tue,  3 Dec 2019 12:14:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 681941612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575371707;
	bh=wZoXE2lfd6E8aZXAlqwYFS/u7UQhSmQKsBPD/H9C0P8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e5zBNkVqS6jlx2tO4X1KD+Vblmdt6X8V8ob/YIqkCJA1CXodnZe2Z9GWvXn8HwBxq
	 3HAmKdErKaxAGG5IqFDoDHyt2aLBwUBJKnsHMGcyId2NQCi4FLyN10p2IHR7K06OkS
	 kk8dfkeTysPLbds1fB1FdmMYvIe8X2hkzr2zs06c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E83BDF80228;
	Tue,  3 Dec 2019 12:13:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADEDFF80227; Tue,  3 Dec 2019 12:13:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30C92F800F0
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 12:13:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30C92F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="g7RcBsG1"
Received: by mail-pj1-x1041.google.com with SMTP id z21so1376666pjq.13
 for <alsa-devel@alsa-project.org>; Tue, 03 Dec 2019 03:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPxVVC8nLDBEci1WSeW2S69uGVw9UleHZ5a7bu0I1Xs=;
 b=g7RcBsG1I43aqXOgX8NNWXdzwyKNnQzBaNigzS3hH9D+dPCt1yXrXC8KBQAxmAGw1V
 xIVzEZChlfDG+nQak288bYsUyD9FbjuWB5Hzwm9gi3Sc7px/7s/hrq5rBogS1I/+NkHs
 YlJ/+VAmQtSSMduDkdWU0dBpiA9oXDKOYfzFFxYwh8rKlAwK9S0R+nzfs0I5JMyJkcia
 VKZR8p9/KzWzukCGkgsTulEh7Q+hcEUGvxxswb3M63yMSulPhT32jXbFavKL4bQwnGny
 wl9QyR/fQTj4HCWqeF7iY3iuOaH5dRvExDdcoN2F9oeNqVKE+tn2djXq8qI967rtQEFd
 9lHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPxVVC8nLDBEci1WSeW2S69uGVw9UleHZ5a7bu0I1Xs=;
 b=V962TzRDKsrco0jep8j3hGgAZppfFP5XkGUGPluSL7yFx67aNBkCUYJXik7MHJ9XuT
 qU7CMuiXPeZb5nb08uyO7nY4ZNf++zxswQpZdOwAKK7E0kY5qGi7rEj6P7sZaAAaYLVI
 Kt/GcirXm/Rq/ABAv7IzzoMygAnh5x5AAQ2WKQjtwPe09GfYAvfAURa3mOsmM805ammz
 tzUUsQRupxkcLaz2zKa8cgf0ufxBhu3HDtjMGL8kQipLP77H3ouXGwqN1E3igQ/WSDzQ
 pcMqgeRm+4BVWAp80BQNTryIADxwehlZLYq/dK4CTzTIPBm7AFeL1Hp1g2yz5EaP7i2c
 VD/g==
X-Gm-Message-State: APjAAAVjuVWGC6IKzwYP1vk8Oo0OW5hrzZxBJDg9VyhSpz7s689tCxgJ
 v16qRmh0M0ZnJwth/xR0tn4=
X-Google-Smtp-Source: APXvYqwVXNPxflvrN2v14hE+cqab22DeGQaHc2v2d7g8tdd1ATtAmfxDtIDe+nffB7gaEjuEQcQb5w==
X-Received: by 2002:a17:902:9692:: with SMTP id
 n18mr4397865plp.152.1575371596975; 
 Tue, 03 Dec 2019 03:13:16 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id p5sm3160077pgj.63.2019.12.03.03.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 03:13:16 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Tue,  3 Dec 2019 19:13:03 +0800
Message-Id: <20191203111303.12933-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Takashi Iwai <tiwai@suse.com>, Chuhong Yuan <hslester96@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH resend] ASoC: fsl_audmix: add missed
	pm_runtime_disable
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The driver forgets to call pm_runtime_disable in probe failure
and remove.
Add the missed calls to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 sound/soc/fsl/fsl_audmix.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index a1db1bce330f..5faecbeb5497 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -505,15 +505,20 @@ static int fsl_audmix_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(fsl_audmix_dai));
 	if (ret) {
 		dev_err(dev, "failed to register ASoC DAI\n");
-		return ret;
+		goto err_disable_pm;
 	}
 
 	priv->pdev = platform_device_register_data(dev, mdrv, 0, NULL, 0);
 	if (IS_ERR(priv->pdev)) {
 		ret = PTR_ERR(priv->pdev);
 		dev_err(dev, "failed to register platform %s: %d\n", mdrv, ret);
+		goto err_disable_pm;
 	}
 
+	return 0;
+
+err_disable_pm:
+	pm_runtime_disable(dev);
 	return ret;
 }
 
@@ -521,6 +526,8 @@ static int fsl_audmix_remove(struct platform_device *pdev)
 {
 	struct fsl_audmix *priv = dev_get_drvdata(&pdev->dev);
 
+	pm_runtime_disable(&pdev->dev);
+
 	if (priv->pdev)
 		platform_device_unregister(priv->pdev);
 
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
