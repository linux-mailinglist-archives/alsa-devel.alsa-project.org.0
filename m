Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 864BAFFD36
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 03:49:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A328167C;
	Mon, 18 Nov 2019 03:48:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A328167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574045366;
	bh=jcUSOpF8bHCCU2oKdt0DGG4Ehxfns31FKv/0XD+/DH0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mj8X69oBGVBHSq1Q7e4z17xVT53DExmHfuEs2GmVrS82sYCccy66x9+n0IPo3pMsY
	 YLOzDAow654yHza9u0Ll7itGtX91RVRTcsi8IpEaGCbyZoPX9dz1UQxf8G1zu8vX1C
	 IMoP+W3UZbEzx0BOGpa3Zuv6wDQmSB94HKkU2s0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C29DF8011A;
	Mon, 18 Nov 2019 03:47:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B916DF8013B; Mon, 18 Nov 2019 03:47:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E04BF800F6
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 03:47:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E04BF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lW+dGN+R"
Received: by mail-pf1-x443.google.com with SMTP id q13so9612785pff.2
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 18:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RREC1ahvRFfGyw76l4ibA9bqTupLckMQgY54O0gStrA=;
 b=lW+dGN+REA8N1B3l0ms9i7xiFULF9g+HqA3J5bWNgPmMViTEGbfFiKZqRb5DNPvniM
 nkT58TrOQmBLhxqz49sqtU1r50FRvwWUPT/uPWPvWYritw8YmnvSZpe/N1jjluLp0brm
 RwPDgpC8hKxNR3WrYAwWt4JxVxPBgKZftCWLVMEi8APgIusbf/VGUjGjXu5nRU8DjCEM
 WHU4vKhL99/VhKPIN8xoM4nd64Fw6AT8Jio2hQFHW1ZhAhsLZxDe2BRmmyOEdUp1th7u
 KuDfTgX/yUS3Vcao+srvscZfjN4uEFanBlq73GkeXVvSCv8FODgJ4DaCMFGAgBWVMZO1
 3egQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RREC1ahvRFfGyw76l4ibA9bqTupLckMQgY54O0gStrA=;
 b=ClUpIlsvoNZ26kgwFqw9a0XN3qelyO7nglVZcGqSuJUTSC0UGHxJM53GY2nsGUgUyC
 1PNe/bxGyuBojiRfNHUmVevK/y6lJdyh7/gGggAgOgxUQ+D3VU2J/BE74UZiPF3Jix6W
 s7LwZ7HYGZ0gMz1zBCiTllJg+57fmBgWNBnliSuA26Om2FhcNCz8F6i5Qhhbk0Fayg8j
 4r6nodW8MyTtDqDxQeni9/XN8i6qLZ193VYE15M6fdzzxYMIaAKtm9l74kSXKLcJDlT5
 WI2jt+U/HGmPCY3XRjo0Zu0VpKPaviAaqmEcOKbOko56hPn3YZAo8hZBvPx5s9X/TEQq
 tPpQ==
X-Gm-Message-State: APjAAAUXFYsM/+LCwiKlgAKkQXzulidS2uSvDJlx7NHxr51i/pSb43jf
 0Kl2rJ4Wy+thDZrsqZe3IXw=
X-Google-Smtp-Source: APXvYqwkWq6NxTkksNOXzjkY9PZHBW5+dMlAb/ErmHYmqKufTtuFkiVtJ9liXzA7erSbF37VU8yNcA==
X-Received: by 2002:a63:334f:: with SMTP id z76mr3320019pgz.277.1574045254633; 
 Sun, 17 Nov 2019 18:47:34 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id x186sm20158760pfx.105.2019.11.17.18.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 18:47:33 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Mon, 18 Nov 2019 10:47:21 +0800
Message-Id: <20191118024721.21400-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Takashi Iwai <tiwai@suse.com>, Chuhong Yuan <hslester96@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: fsl_audmix: add missed pm_runtime_disable
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
index c7e4e9757dce..57cad4365e56 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -499,15 +499,20 @@ static int fsl_audmix_probe(struct platform_device *pdev)
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
 
@@ -515,6 +520,8 @@ static int fsl_audmix_remove(struct platform_device *pdev)
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
