Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A60D253312
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 17:11:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 217CB1766;
	Wed, 26 Aug 2020 17:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 217CB1766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598454701;
	bh=5asAF+6+KdcpJTedBXNCR38q788Ybiy9ByuPeT2pl24=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lsg+KJE+YI3D/gSToFuNjfmApuC6u9zfuB0mKaWXnPu5ZWJqorJsSJOtFLCvY2LUv
	 I58JlEYl+F1M3sVySYCcv3gjv9HfwLCl7ALoU5yzNMs0XxM+oc+mRGPIQBsaX0S1YX
	 33NM/TeAnCv/toTh7a9ifN2I6nIcUqtYNpK2RYm8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7100DF80105;
	Wed, 26 Aug 2020 17:10:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A3FAF801D9; Wed, 26 Aug 2020 17:09:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com
 [221.176.66.81])
 by alsa1.perex.cz (Postfix) with ESMTP id 187D5F80105
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 17:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 187D5F80105
Received: from spf.mail.chinamobile.com (unknown[172.16.121.3]) by
 rmmx-syy-dmz-app11-12011 (RichMail) with SMTP id 2eeb5f467afd243-5af3e;
 Wed, 26 Aug 2020 23:08:45 +0800 (CST)
X-RM-TRANSID: 2eeb5f467afd243-5af3e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.0.144.112])
 by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee25f467afb20d-10b8c;
 Wed, 26 Aug 2020 23:08:45 +0800 (CST)
X-RM-TRANSID: 2ee25f467afb20d-10b8c
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, timur@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com
Subject: [PATCH] ASoC: fsl_spdif: Fix unnecessary check in fsl_spdif_probe()
Date: Wed, 26 Aug 2020 23:09:18 +0800
Message-Id: <20200826150918.16116-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tang Bin <tangbin@cmss.chinamobile.com>
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

The function fsl_spdif_probe() is only called with an openfirmware
platform device. Therefore there is no need to check that the passed
in device is NULL.

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/fsl/fsl_spdif.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 7858a5499..395c50167 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -1221,9 +1221,6 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 	void __iomem *regs;
 	int irq, ret, i;
 
-	if (!np)
-		return -ENODEV;
-
 	spdif_priv = devm_kzalloc(&pdev->dev, sizeof(*spdif_priv), GFP_KERNEL);
 	if (!spdif_priv)
 		return -ENOMEM;
-- 
2.20.1.windows.1



