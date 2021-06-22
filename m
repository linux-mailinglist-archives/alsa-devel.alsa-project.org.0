Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4183AFAA7
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 03:33:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 986C316AC;
	Tue, 22 Jun 2021 03:32:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 986C316AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624325614;
	bh=fTdmbU7S0b2wHKZQOXyQmnQU2DInPE5O9CkX9LJDnuc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fu4O5vr2Jj/0X4r9D0OtNMW2578nBhyvH3JpivZCcqg+//5xNvvjoTcDCuX0MQ4kw
	 vvYM0EvUEOte1SoVCfTPmb6JhAfHPG/JkHJny+7ZTaX+3r3z8C0vg82C3J+Ky4YVFr
	 j60i19BOkMEJ0BasNGCQfXq22a5IOaOS5u1Tz77w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F06B0F8016D;
	Tue, 22 Jun 2021 03:32:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26749F8016B; Tue, 22 Jun 2021 03:32:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A4C5F80163
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 03:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A4C5F80163
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 400242007C2;
 Tue, 22 Jun 2021 03:31:56 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 36CD02005D7;
 Tue, 22 Jun 2021 03:31:52 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id EBCB84024D;
 Tue, 22 Jun 2021 09:31:46 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [RESEND PATCH v2] ASoC: fsl-asoc-card: change dev_err to
 dev_err_probe for defer probe
Date: Tue, 22 Jun 2021 09:13:15 +0800
Message-Id: <1624324395-7260-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

Don't need to print error message for defer probe

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2:
- use dev_err_probe instead of dev_dbg

 sound/soc/fsl/fsl-asoc-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 121e08c2af2a..24c890d76da0 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -708,8 +708,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	of_node_put(framemaster);
 
 	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
-		dev_err(&pdev->dev, "failed to find codec device\n");
 		ret = -EPROBE_DEFER;
+		dev_err_probe(&pdev->dev, ret, "failed to find codec device\n");
 		goto asrc_fail;
 	}
 
-- 
2.27.0

