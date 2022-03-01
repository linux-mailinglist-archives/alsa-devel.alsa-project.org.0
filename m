Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BDE4CA009
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:56:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34FC11FD6;
	Wed,  2 Mar 2022 09:55:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34FC11FD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646211369;
	bh=jZoAlcyi+RQRn4PISQg9V1qOoFVLyh+BTGJUQX7nsWU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u9D1KesoFv3FDM0WsBTRFoN+d00C1VR9xGS9XAW7N05/8vhB5krsW6NS668kqqOVq
	 F+Scue5Jm6sIYs1CDD4iXtapafq1r+kYGEWKrn5zA9rYr/GzS89GaNiWrew413T8pn
	 XNVu72itdjucSWqywBdq7AsDfAYeyKl5p9ORZSLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3893F8076D;
	Wed,  2 Mar 2022 09:34:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6710DF80227; Tue,  1 Mar 2022 10:23:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E1F1F80167
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 10:23:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E1F1F80167
X-QQ-mid: bizesmtp73t1646126609twc082qa
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 01 Mar 2022 17:23:24 +0800 (CST)
X-QQ-SSF: 0140000000800050D000B00B0000000
X-QQ-FEAT: dpyQmELDBxGKbuakA6l8ljWpsjY69dFAv/8RDBqxadSZx5WofEUutzrOtsWDE
 +IZzV12LWxeMkEeUxu1RkKJ+S8wlAsdBviHVUdC2YJvpo3YN1MAq27cbanglTNVWXolTvNB
 /fo/TP//5N6GMlyy380x7tLBZab7Ix8ygitW1Jg29M+Rww1rAPJbygAC2JkhiWvdPbariAr
 nP21RbQv3vEF3D/7TxrFf2AtEcG+thXpFAQHX1eCkfp3g/vwRj+A1vPVDHj9shj7ra4EcaJ
 Gzva7GGzAZAJJsnTyPCWDLyYLVdHsfhSbNsTUk1wBG82wTOEsIYgvEgEpd/0iLgne2uE1V3
 809Q/s4XhuUVk+5tXM1ED7/IxSroQoPSlEezWSP4A2GqgoURCY=
X-QQ-GoodBg: 2
From: Zhen Ni <nizhen@uniontech.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.com
Subject: [PATCH] Asoc: au1x: Use devm_snd_soc_register_component()
Date: Tue,  1 Mar 2022 17:23:22 +0800
Message-Id: <20220301092322.5523-1-nizhen@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:35 +0100
Cc: Zhen Ni <nizhen@uniontech.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Using devm_snd_soc_register_component()
instead of snd_soc_register_component()

Signed-off-by: Zhen Ni <nizhen@uniontech.com>
---
 sound/soc/au1x/ac97c.c    | 2 +-
 sound/soc/au1x/i2sc.c     | 2 +-
 sound/soc/au1x/psc-ac97.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/au1x/ac97c.c b/sound/soc/au1x/ac97c.c
index 3b1700e665f5..795bba756585 100644
--- a/sound/soc/au1x/ac97c.c
+++ b/sound/soc/au1x/ac97c.c
@@ -275,7 +275,7 @@ static int au1xac97c_drvprobe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = snd_soc_register_component(&pdev->dev, &au1xac97c_component,
+	ret = devm_snd_soc_register_component(&pdev->dev, &au1xac97c_component,
 					 &au1xac97c_dai_driver, 1);
 	if (ret)
 		return ret;
diff --git a/sound/soc/au1x/i2sc.c b/sound/soc/au1x/i2sc.c
index 740d4e052e4d..a3c9d52ef337 100644
--- a/sound/soc/au1x/i2sc.c
+++ b/sound/soc/au1x/i2sc.c
@@ -265,7 +265,7 @@ static int au1xi2s_drvprobe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ctx);
 
-	return snd_soc_register_component(&pdev->dev, &au1xi2s_component,
+	return devm_snd_soc_register_component(&pdev->dev, &au1xi2s_component,
 					  &au1xi2s_dai_driver, 1);
 }
 
diff --git a/sound/soc/au1x/psc-ac97.c b/sound/soc/au1x/psc-ac97.c
index 05eb36991f14..3f60313822e7 100644
--- a/sound/soc/au1x/psc-ac97.c
+++ b/sound/soc/au1x/psc-ac97.c
@@ -411,7 +411,7 @@ static int au1xpsc_ac97_drvprobe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = snd_soc_register_component(&pdev->dev, &au1xpsc_ac97_component,
+	ret = devm_snd_soc_register_component(&pdev->dev, &au1xpsc_ac97_component,
 					 &wd->dai_drv, 1);
 	if (ret)
 		return ret;
-- 
2.20.1



