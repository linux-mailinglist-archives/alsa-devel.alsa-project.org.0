Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD711DD06F
	for <lists+alsa-devel@lfdr.de>; Thu, 21 May 2020 16:46:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1F29184E;
	Thu, 21 May 2020 16:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1F29184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590072361;
	bh=uwIAP16rB0yhhJBxoSQ+MKUPFdlhmSgpnQpxe7peaFs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J80PuB6S3Kn6jNa6oG0KSgDO78b4t2fGHp2wucv/ARwYTUmrfeLnkInF+1UhnQVNn
	 uNpP7tQ20VsAD5/7nvRuunrT0j+y3p+KSe2EhtMq84/vbpAY1BCU2QCixClvF4ceHO
	 mcF9XThVlpd5Uwu7LBBSTkvFvH5VSjBe4rRHXuZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A279F80229;
	Thu, 21 May 2020 16:45:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 561DDF801F8; Thu, 21 May 2020 16:45:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52069F800E1
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 16:44:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52069F800E1
Received: from [123.114.63.221] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1jbmRM-0002Rl-BI; Thu, 21 May 2020 14:44:57 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH for-5.8] ASoC: amd: doesn't print error log if the return
 value is EPROBE_DEFER
Date: Thu, 21 May 2020 22:44:34 +0800
Message-Id: <20200521144434.14442-1-hui.wang@canonical.com>
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

The machine driver module and codec driver module don't have
dependency, it is possible that the machine driver is loaded ahead of
the codec driver, then the register_card() will fail and return
EPROBE_DEFER, in this case the driver should not print error log since
this is not a real failure.

For example, I saw this log from a machine with amd renoir audio:
acp_pdm_mach acp_pdm_mach.0: snd_soc_register_card(acp) failed: -517

After applying this patch, there is no error log to confuse users and
audio works after the codec driver is loaded.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/soc/amd/acp-da7219-max98357a.c | 3 ++-
 sound/soc/amd/acp-rt5645.c           | 3 ++-
 sound/soc/amd/acp3x-rt5682-max9836.c | 3 ++-
 sound/soc/amd/renoir/acp3x-rn.c      | 7 ++++---
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 9414d7269c4f..a7e755a563e8 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -440,7 +440,8 @@ static int cz_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(card, machine);
 	ret = devm_snd_soc_register_card(&pdev->dev, &cz_card);
 	if (ret) {
-		dev_err(&pdev->dev,
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
 				"devm_snd_soc_register_card(%s) failed: %d\n",
 				cz_card.name, ret);
 		return ret;
diff --git a/sound/soc/amd/acp-rt5645.c b/sound/soc/amd/acp-rt5645.c
index 73b31f88a6b5..cffd24eae3a3 100644
--- a/sound/soc/amd/acp-rt5645.c
+++ b/sound/soc/amd/acp-rt5645.c
@@ -174,7 +174,8 @@ static int cz_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, card);
 	ret = devm_snd_soc_register_card(&pdev->dev, &cz_card);
 	if (ret) {
-		dev_err(&pdev->dev,
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
 				"devm_snd_soc_register_card(%s) failed: %d\n",
 				cz_card.name, ret);
 		return ret;
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index e499c00e0c66..16bcaad9ead2 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -346,7 +346,8 @@ static int acp3x_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, &acp3x_card);
 	if (ret) {
-		dev_err(&pdev->dev,
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
 				"devm_snd_soc_register_card(%s) failed: %d\n",
 				acp3x_card.name, ret);
 		return ret;
diff --git a/sound/soc/amd/renoir/acp3x-rn.c b/sound/soc/amd/renoir/acp3x-rn.c
index 306134b89a82..95b616fcad30 100644
--- a/sound/soc/amd/renoir/acp3x-rn.c
+++ b/sound/soc/amd/renoir/acp3x-rn.c
@@ -54,9 +54,10 @@ static int acp_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(card, machine);
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		dev_err(&pdev->dev,
-			"snd_soc_register_card(%s) failed: %d\n",
-			acp_card.name, ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"snd_soc_register_card(%s) failed: %d\n",
+				acp_card.name, ret);
 		return ret;
 	}
 	return 0;
-- 
2.17.1

