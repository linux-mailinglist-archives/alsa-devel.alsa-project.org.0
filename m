Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6667C398266
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 09:01:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9D9A16F7;
	Wed,  2 Jun 2021 09:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9D9A16F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622617261;
	bh=9gNQoQmOYEGKa/gMGQRoI94/nlSpApYUj/tGYR4UqL8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aiCaQ5SVBJ1KOVbpG51xvDIpsPv/pFLrFZ7+swAE4fcw7OMEhgJBSFnulQVQgDDW0
	 Ypa9T9B2a8b9fWTlAagOs+S2uoFwLTD/IfNm2cG+HYnCudGDKq1GtSIXIPzmfojOmc
	 +xnY+3LxwnrviLemCB/IHSEbYxlfX2JIzQfn3a0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2D75F80103;
	Wed,  2 Jun 2021 09:00:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E13BBF80430; Wed,  2 Jun 2021 09:00:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC2A1F804BC
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 08:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC2A1F804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="jDC9TnR4"
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 746AE1A1E9D;
 Wed,  2 Jun 2021 08:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva020.eu-rdc02.nxp.com 746AE1A1E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com;
 s=nselector3; t=1622617197;
 bh=SWgLA9X2K6gN6TIyMw7jN/rBkJDvoZSmZ7cEH5X1U7M=;
 h=From:To:Subject:Date:From;
 b=jDC9TnR4i6xgH8zwaCPLpZl13UR9d0C4rmME9PtLbcPebgyN2/Z16g8lXrWgSZBVr
 QmTMG8LZ2Txqub8jwsN8LKB5Bn9BMi6psMj5ujnW2eVCJ4QZTIdk9GXYcnUHJiwrwf
 sKQp7FuPWdo7Ow2NzZ1jN+5SGQ3yZuxfjZkEdLFJx8ERmDV+QA7x/4lFge6td/Gl90
 Dh53wioGhYD1xeq1o/WyZSmwfm49NqKtCGtsQF62fTNa4MezD6XYbqJGvdlhBANjtc
 X1nFMI2IQ7/fKFv3O0Dj6ai5C1cYTFYS9mKqTHaVCLJ6F2eQg6xiQL0mHpzN8hRDyL
 Ow7GAcXDkaxBw==
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1050D1A1E8A;
 Wed,  2 Jun 2021 08:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva020.eu-rdc02.nxp.com 1050D1A1E8A
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 7933B4031D;
 Wed,  2 Jun 2021 14:59:47 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl-asoc-card: change dev_err to dev_dbg for defer probe
Date: Wed,  2 Jun 2021 14:42:12 +0800
Message-Id: <1622616132-10391-1-git-send-email-shengjiu.wang@nxp.com>
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
 sound/soc/fsl/fsl-asoc-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 4f55b316cf0f..b40ba910ae9d 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -709,7 +709,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	of_node_put(framemaster);
 
 	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
-		dev_err(&pdev->dev, "failed to find codec device\n");
+		dev_dbg(&pdev->dev, "failed to find codec device\n");
 		ret = -EPROBE_DEFER;
 		goto asrc_fail;
 	}
-- 
2.27.0

