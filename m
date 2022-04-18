Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D0B504B58
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Apr 2022 05:31:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 676FC16AB;
	Mon, 18 Apr 2022 05:30:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 676FC16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650252664;
	bh=jsUgL6p4ETp1DkUY40trEeaGHd+gIBp0lCCrRfvqpvg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iCc7R99BgIK4w72jrHXW7taXOro7cMe0Adl1V5KskNmnrT8sF2Gpd4c0PyYrwLzJ+
	 SZ3neNb+ZC+rAlfI02+4r9lZ+7SlwD/sjK0pUrUhZ87DduhYEALDd2SXeVMvatT3iS
	 lBwyvjVhXO1r0ScIOj64Bi4d8N3nt6p4tUl4MWs0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E146BF80311;
	Mon, 18 Apr 2022 05:30:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8D4DF8014E; Mon, 18 Apr 2022 05:30:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB4FCF80121
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 05:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB4FCF80121
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 78B191A11AD;
 Mon, 18 Apr 2022 05:29:57 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 41AA11A1145;
 Mon, 18 Apr 2022 05:29:57 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 032D31800096;
 Mon, 18 Apr 2022 11:29:55 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dmic: Add support for DSD data format
Date: Mon, 18 Apr 2022 11:18:30 +0800
Message-Id: <1650251910-8932-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: shengjiu.wang@gmail.com
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

Add DSD format support in this generic dmic driver:
DSD_U8,
DSD_U16_LE,
DSD_U32_LE,

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/dmic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/dmic.c b/sound/soc/codecs/dmic.c
index 5d079d90fd3b..d1a30ca4571a 100644
--- a/sound/soc/codecs/dmic.c
+++ b/sound/soc/codecs/dmic.c
@@ -82,7 +82,10 @@ static struct snd_soc_dai_driver dmic_dai = {
 		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.formats = SNDRV_PCM_FMTBIT_S32_LE
 			| SNDRV_PCM_FMTBIT_S24_LE
-			| SNDRV_PCM_FMTBIT_S16_LE,
+			| SNDRV_PCM_FMTBIT_S16_LE
+			| SNDRV_PCM_FMTBIT_DSD_U8
+			| SNDRV_PCM_FMTBIT_DSD_U16_LE
+			| SNDRV_PCM_FMTBIT_DSD_U32_LE,
 	},
 	.ops    = &dmic_dai_ops,
 };
-- 
2.17.1

