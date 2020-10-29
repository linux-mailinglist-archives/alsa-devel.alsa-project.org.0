Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 412D529E50E
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:51:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB4CF1671;
	Thu, 29 Oct 2020 08:50:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB4CF1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603957889;
	bh=OOF8J0E4gBspnQG4bbiSsbBzu0yxMlfRhFWWq1cxDN0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qNcr1D8v3O88wV+1LsA6OIdIoPXX1uN7lFkwA1wsQPOKnf6DZosJsY+JnOgzSfoMa
	 bx7rOvg7eFn2/z2pYKFcjTcnNDotkRwjzVBuDxvjOgT6jC+GZIhR+huRgkbgSo8ueF
	 JLm8AFE+WyHvU+ilZtugCIy9s4xFYTmVx928I1+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2391F804B3;
	Thu, 29 Oct 2020 08:49:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46B47F8020D; Thu, 29 Oct 2020 08:43:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4008F800FF
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:43:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4008F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="R6KbsFBJ"
Received: by mail-pg1-x541.google.com with SMTP id f38so1663022pgm.2
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ByQRRqSOS0s9pNTpOtt//gM7iDqhPG0HzrMizgfaGV0=;
 b=R6KbsFBJ7AGf6UFZEd4Vf7yH5UZW8brSqoW1Xe9CLwUdFHKUtWJjt6NIgy3eCUmeOG
 QtRfCio4ewGz+maSTsyOVbge3tdNBLrvpAggSW3CfBow/g0deLUu2vM89stbtfPSHIq9
 mXfUNwhYDV9lRsqNqW/MfQlVff57B/xlD456fkNR8qUz8K58XsUMehnKLBtpvTwax9xP
 q359Uacwp5fwdN0AUQCuypMoNlt5yshUotW3KYlqjZbTuWCV6n8uwQeRt1fPs1W5kvWS
 XeKh+h5vPaxqEBiP3FPm8USLMG6P4tDiykdk1HUiLuMWm6d8BV5kiVP9AwOA7A/WlWLx
 8ZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ByQRRqSOS0s9pNTpOtt//gM7iDqhPG0HzrMizgfaGV0=;
 b=U+BHD6bDWJLWszfdZQ5rQ8FL4BdWtxw6TXnoxy+8PxaFEUbIcNLodXwT48Nv7YHVWB
 MIMGPGa8hpunpOOG0k4f1XoRH+Ame1gxIbvFamxT8Bp6pu+3uBRRThb4MCPNvlB9qrO9
 R11LRz5Qtaw7Vdz3cnFD9wjpDAOgIlaqwGz+Pb2MEaRuUNVRQo5tuWAREtsiKxlL5wOE
 Sn7mNIL6fL9s+h4MgVpRnHm6OCBoyfGQtluRBGeiD3de23/LbcrCNN0nc9WMHRlnXvHb
 ExrTlSu2Dfn7ETAidEEw1ePKoaBhe68XvLhHpQ8yig6UoHggXZxoLFJh3NXfwdy4NqVH
 ijVA==
X-Gm-Message-State: AOAM5331KH2/nNzKkMdnWGA3OIprbR7iiV0lDKzQhnBxkjHYNlFr5bRa
 kWdU4o+rxhH7/MVqvUp6w+k=
X-Google-Smtp-Source: ABdhPJzqW9+vkDhQYC2zinHRRJ2vcxLo2Fsw8j+CEUVBMEU9yIiZZoEMGG/itZzsejxJ4or4GBJz0Q==
X-Received: by 2002:a63:7e4f:: with SMTP id o15mr2971078pgn.428.1603957401923; 
 Thu, 29 Oct 2020 00:43:21 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id g7sm1707066pjl.11.2020.10.29.00.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:43:21 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 01/25] ALSA: core: pcm: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:37 +0800
Message-Id: <20201029074301.226644-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:54 +0100
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
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

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 sound/core/pcm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index be5714f1bb58..5a281ac92958 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -599,7 +599,6 @@ static const struct attribute_group *pcm_dev_attr_groups[];
  * PM callbacks: we need to deal only with suspend here, as the resume is
  * triggered either from user-space or the driver's resume callback
  */
-#ifdef CONFIG_PM_SLEEP
 static int do_pcm_suspend(struct device *dev)
 {
 	struct snd_pcm_str *pstr = container_of(dev, struct snd_pcm_str, dev);
@@ -608,7 +607,6 @@ static int do_pcm_suspend(struct device *dev)
 		snd_pcm_suspend_all(pstr->pcm);
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops pcm_dev_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(do_pcm_suspend, NULL)
-- 
2.28.0

