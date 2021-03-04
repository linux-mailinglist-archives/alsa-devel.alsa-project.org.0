Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CDE32CF46
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 10:09:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2B411AB6;
	Thu,  4 Mar 2021 10:08:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2B411AB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614848988;
	bh=xtV8BoZTPzunnsWz+C/FIxqZDRePilTaXL0Rijfys1M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rJQBKobjZjzqYvlbXMTL6bWAO1TJ1tmaIKnu7+wGkFCwE/uOZkZBtZQhMvf0GixPF
	 dTxoBH7hDRSVSVXM0e/auqTKXMVeuTGApVa8qtmk05QxTvAfajGjHpL7PX/kDcTFkg
	 U6xcWFD6vsu+8NbWZvbwjMyd39DBn5d7qp1aOaS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D99C4F8007E;
	Thu,  4 Mar 2021 10:08:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A966F80269; Thu,  4 Mar 2021 10:08:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5295F8007E
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 10:08:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5295F8007E
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0UQMz88a_1614848882; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UQMz88a_1614848882) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 04 Mar 2021 17:08:03 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: timur@kernel.org
Subject: [PATCH v2] ASoC: imx-hdmi: fix platform_no_drv_owner.cocci warnings
Date: Thu,  4 Mar 2021 17:08:01 +0800
Message-Id: <1614848881-29637-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, broonie@kernel.org,
 Yang Li <yang.lee@linux.alibaba.com>, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org, shengjiu.wang@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

./sound/soc/fsl/imx-hdmi.c:226:3-8: No need to set .owner here. The core
will do it.

Remove .owner field if calls are used which set it automatically

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---

Change in v2:
-use imx-hdmi instead of hdmi-codec for Subject

 sound/soc/fsl/imx-hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index dbbb761..cd0235a 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -223,7 +223,6 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 static struct platform_driver imx_hdmi_driver = {
 	.driver = {
 		.name = "imx-hdmi",
-		.owner = THIS_MODULE,
 		.pm = &snd_soc_pm_ops,
 		.of_match_table = imx_hdmi_dt_ids,
 	},
-- 
1.8.3.1

