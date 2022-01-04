Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B73D484089
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jan 2022 12:12:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FDBF1727;
	Tue,  4 Jan 2022 12:11:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FDBF1727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641294733;
	bh=Ld2+Q4ozOZIgT4bdA9V1N9bOVC8WyOfgaha4Y0SCEW4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XgLO/+4IvDSaFK8CSyY2EWJeEVRKUFX3/MkkdoU1e2uMjAeNzZZYutRIPpdjD/PPe
	 m5Y/NewFxOTiRRaUxBdEoL7o74s6FrADcxGXQkW5YsZMkUHE6q/pPo+7ZBg/HuvrXT
	 B12F6Uhi1q/DJVAotbvjfJxJipO+Z8GLb2FW/E3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4622F804FB;
	Tue,  4 Jan 2022 12:10:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5DF0F80089; Tue,  4 Jan 2022 12:10:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB409F8007E
 for <alsa-devel@alsa-project.org>; Tue,  4 Jan 2022 12:10:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB409F8007E
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D14061A0DE9;
 Tue,  4 Jan 2022 12:10:20 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9ABC71A2251;
 Tue,  4 Jan 2022 12:10:20 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 36792183AD67;
 Tue,  4 Jan 2022 19:10:19 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: imx-card: Need special setting for ak4497 on i.MX8MQ
Date: Tue,  4 Jan 2022 18:40:33 +0800
Message-Id: <1641292835-19085-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1641292835-19085-1-git-send-email-shengjiu.wang@nxp.com>
References: <1641292835-19085-1-git-send-email-shengjiu.wang@nxp.com>
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

The SAI on i.MX8MQ don't support one2one ratio for mclk:bclk, so
the mclk frequency exceeds the supported range of codec for
the case that sample rate is larger than 705kHZ and format is
S32_LE. Update the supported width for such case.

Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-card.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index e758c4f1b0bc..e0f3aa6d9501 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -553,8 +553,23 @@ static int imx_card_parse_of(struct imx_card_data *data)
 			link_data->cpu_sysclk_id = FSL_SAI_CLK_MAST1;
 
 			/* sai may support mclk/bclk = 1 */
-			if (of_find_property(np, "fsl,mclk-equal-bclk", NULL))
+			if (of_find_property(np, "fsl,mclk-equal-bclk", NULL)) {
 				link_data->one2one_ratio = true;
+			} else {
+				int i;
+
+				/*
+				 * i.MX8MQ don't support one2one ratio, then
+				 * with ak4497 only 16bit case is supported.
+				 */
+				for (i = 0; i < ARRAY_SIZE(ak4497_fs_mul); i++) {
+					if (ak4497_fs_mul[i].rmin == 705600 &&
+					    ak4497_fs_mul[i].rmax == 768000) {
+						ak4497_fs_mul[i].wmin = 32;
+						ak4497_fs_mul[i].wmax = 32;
+					}
+				}
+			}
 		}
 
 		link->cpus->of_node = args.np;
-- 
2.17.1

