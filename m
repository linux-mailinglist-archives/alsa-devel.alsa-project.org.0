Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7BE41D201
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 05:52:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FD2616DF;
	Thu, 30 Sep 2021 05:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FD2616DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632973960;
	bh=5eUuBqn3EYpRFDo+0vtWph/z6mbzGz7Au5xI7pelnA0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W3kzhVq6MunxA4YDqAj3SjO3+sZ/2KpSguY/CTR9zHh6g+mlmPKmi1cm9j4ILbWCG
	 CkL914iT3XR9nTFhfs7xwgORRfWufonNFs3vgb01TAvloWhYT+GopE+FC1i3ex2qk6
	 8WC0egdvrV9WvmOz1g8MBdaaRiOgswxRdH2WWkAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A280FF804BC;
	Thu, 30 Sep 2021 05:51:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E263F804AD; Thu, 30 Sep 2021 05:51:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33B89F80113
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 05:51:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33B89F80113
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1E22B20030E;
 Thu, 30 Sep 2021 05:51:09 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DA6F420028A;
 Thu, 30 Sep 2021 05:51:08 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 6D943183AC94;
 Thu, 30 Sep 2021 11:51:07 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_rpmsg: Add rpmsg audio support for i.MX8ULP
Date: Thu, 30 Sep 2021 11:26:53 +0800
Message-Id: <1632972413-22130-1-git-send-email-shengjiu.wang@nxp.com>
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

On i.MX8ULP the audio interface and codec are controlled
by Cortex-M domain, Cortex-M core provides audio service
over rpmsg.

The rpmsg audio function is almost same as i.MX7ULP
platform, so share same configuration.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_rpmsg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index 07abad7fe372..8508bc7f239d 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -174,6 +174,7 @@ static const struct of_device_id fsl_rpmsg_ids[] = {
 	{ .compatible = "fsl,imx8mm-rpmsg-audio", .data = &imx8mm_data},
 	{ .compatible = "fsl,imx8mn-rpmsg-audio", .data = &imx8mn_data},
 	{ .compatible = "fsl,imx8mp-rpmsg-audio", .data = &imx8mp_data},
+	{ .compatible = "fsl,imx8ulp-rpmsg-audio", .data = &imx7ulp_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_rpmsg_ids);
-- 
2.17.1

