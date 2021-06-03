Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC5339985B
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 05:02:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7462C1706;
	Thu,  3 Jun 2021 05:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7462C1706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622689337;
	bh=7cMOauGy87MFphH8spiqDmPD7QW/0YZmJ6+6YUbbXYM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=igp/yCR9XauG4Q0zar4JRxaTc9TcIJwaAo6jvGaaw+CNSCYYckzncAPNx4TjQEFfH
	 pi8AcfNkowx40SXuxIiHTYjIaUu038foe6NA0oVYvBXWk/Wox9o7J7zkRvt7bJZXNB
	 EyDr5zf8WBYTEsLZQJmisQ5M+TUxBWsyWtmiprL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E533FF804B0;
	Thu,  3 Jun 2021 05:01:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB4A9F80100; Thu,  3 Jun 2021 05:01:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3B27F80100
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 05:01:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3B27F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="qq0QLshf"
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 16D6B20384C;
 Thu,  3 Jun 2021 05:01:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva021.eu-rdc02.nxp.com 16D6B20384C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com;
 s=nselector4; t=1622689263;
 bh=ROQTgs3jR6KqtGsQiGNvFAQlNnnJRWQm4j8P6+1iQ+c=;
 h=From:To:Subject:Date:From;
 b=qq0QLshfSFtIiBI2Sd0Vs3tF3tBX1/TJXogfzUCFt/DVp+meQPpzA+R40+OCUt8mN
 mnE3Icn7TJmp5HOi1qCjuw81PVhSuRNL1sBKRUe8kKwbWl3pzhB8ouMA8ffFPz9O5q
 xM3pLNbLY2dUuirWnP6CdCVb7Sgu4BceMm4vHdORrnnNnynp5L82VMfkHNKiZOLXpt
 AFOMqL4SA0OkMO2S45gt5gxIIva+bpo8Ri3dG57roy2HHtJT4fuQ2Fqm2i3V6M4nmK
 CBEruqvUCd5EtvSwcnVOIpO06ArYhUxW+JH3JrEurFThRQG+p9nal8t+BhS4+9az3c
 UcCaS9MuChK6Q==
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A4C31203850;
 Thu,  3 Jun 2021 05:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva021.eu-rdc02.nxp.com A4C31203850
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B84C1402DF;
 Thu,  3 Jun 2021 11:00:52 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: fsl-asoc-card: change dev_err to dev_err_probe for
 defer probe
Date: Thu,  3 Jun 2021 10:43:23 +0800
Message-Id: <1622688203-12244-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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
index 4f55b316cf0f..2fa371ec6b1c 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -709,8 +709,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	of_node_put(framemaster);
 
 	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
-		dev_err(&pdev->dev, "failed to find codec device\n");
 		ret = -EPROBE_DEFER;
+		dev_err_probe(&pdev->dev, ret, "failed to find codec device\n");
 		goto asrc_fail;
 	}
 
-- 
2.27.0

