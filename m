Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDFA610B3F
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 09:25:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E0A8294C;
	Fri, 28 Oct 2022 09:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E0A8294C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666941924;
	bh=s40/VRZf1sqTKCy0bCV/OILY0tFv8UO63e6HVVrChQE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NFs8Nau14Ye16vLVzj+uVOlTIv6NKlClKJ1IrGbnh3KBdKxv1wxxBkSo36HC1r7e4
	 X6HbgzOfi8fHyLoph/P98khfEc72PHrjD4UfqRCzQozWKakgG1nBP8RzzSjnXQl7Z3
	 iG8gGsi/TkH5TDscCZeBlVZz12RaF7a+0Pv87+qw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF999F804BD;
	Fri, 28 Oct 2022 09:24:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94DE8F8025A; Fri, 28 Oct 2022 09:24:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F97BF80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 09:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F97BF80095
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D39791A0CE8;
 Fri, 28 Oct 2022 09:24:20 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6B4841A0CDE;
 Fri, 28 Oct 2022 09:24:20 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E1F83183486A;
 Fri, 28 Oct 2022 15:24:18 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_xcvr: Add Counter registers
Date: Fri, 28 Oct 2022 15:03:47 +0800
Message-Id: <1666940627-7611-1-git-send-email-shengjiu.wang@nxp.com>
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

These counter registers are part of register list,
add them to complete the register map

- DMAC counter control registers
- Data path Timestamp counter register
- Data path bit counter register
- Data path bit count timestamp register
- Data path bit read timestamp register

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 40 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h | 21 +++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index c043efe4548d..2a6802fb2a8b 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -934,6 +934,14 @@ static const struct reg_default fsl_xcvr_reg_defaults[] = {
 	{ FSL_XCVR_RX_DPTH_CTRL_SET,	0x00002C89 },
 	{ FSL_XCVR_RX_DPTH_CTRL_CLR,	0x00002C89 },
 	{ FSL_XCVR_RX_DPTH_CTRL_TOG,	0x00002C89 },
+	{ FSL_XCVR_RX_DPTH_CNTR_CTRL,	0x00000000 },
+	{ FSL_XCVR_RX_DPTH_CNTR_CTRL_SET, 0x00000000 },
+	{ FSL_XCVR_RX_DPTH_CNTR_CTRL_CLR, 0x00000000 },
+	{ FSL_XCVR_RX_DPTH_CNTR_CTRL_TOG, 0x00000000 },
+	{ FSL_XCVR_RX_DPTH_TSCR, 0x00000000 },
+	{ FSL_XCVR_RX_DPTH_BCR,  0x00000000 },
+	{ FSL_XCVR_RX_DPTH_BCTR, 0x00000000 },
+	{ FSL_XCVR_RX_DPTH_BCRR, 0x00000000 },
 	{ FSL_XCVR_TX_DPTH_CTRL,	0x00000000 },
 	{ FSL_XCVR_TX_DPTH_CTRL_SET,	0x00000000 },
 	{ FSL_XCVR_TX_DPTH_CTRL_CLR,	0x00000000 },
@@ -944,6 +952,14 @@ static const struct reg_default fsl_xcvr_reg_defaults[] = {
 	{ FSL_XCVR_TX_CS_DATA_3,	0x00000000 },
 	{ FSL_XCVR_TX_CS_DATA_4,	0x00000000 },
 	{ FSL_XCVR_TX_CS_DATA_5,	0x00000000 },
+	{ FSL_XCVR_TX_DPTH_CNTR_CTRL,	0x00000000 },
+	{ FSL_XCVR_TX_DPTH_CNTR_CTRL_SET, 0x00000000 },
+	{ FSL_XCVR_TX_DPTH_CNTR_CTRL_CLR, 0x00000000 },
+	{ FSL_XCVR_TX_DPTH_CNTR_CTRL_TOG, 0x00000000 },
+	{ FSL_XCVR_TX_DPTH_TSCR, 0x00000000 },
+	{ FSL_XCVR_TX_DPTH_BCR,	 0x00000000 },
+	{ FSL_XCVR_TX_DPTH_BCTR, 0x00000000 },
+	{ FSL_XCVR_TX_DPTH_BCRR, 0x00000000 },
 	{ FSL_XCVR_DEBUG_REG_0,		0x00000000 },
 	{ FSL_XCVR_DEBUG_REG_1,		0x00000000 },
 };
@@ -975,6 +991,14 @@ static bool fsl_xcvr_readable_reg(struct device *dev, unsigned int reg)
 	case FSL_XCVR_RX_DPTH_CTRL_SET:
 	case FSL_XCVR_RX_DPTH_CTRL_CLR:
 	case FSL_XCVR_RX_DPTH_CTRL_TOG:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL_SET:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL_CLR:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL_TOG:
+	case FSL_XCVR_RX_DPTH_TSCR:
+	case FSL_XCVR_RX_DPTH_BCR:
+	case FSL_XCVR_RX_DPTH_BCTR:
+	case FSL_XCVR_RX_DPTH_BCRR:
 	case FSL_XCVR_TX_DPTH_CTRL:
 	case FSL_XCVR_TX_DPTH_CTRL_SET:
 	case FSL_XCVR_TX_DPTH_CTRL_CLR:
@@ -985,6 +1009,14 @@ static bool fsl_xcvr_readable_reg(struct device *dev, unsigned int reg)
 	case FSL_XCVR_TX_CS_DATA_3:
 	case FSL_XCVR_TX_CS_DATA_4:
 	case FSL_XCVR_TX_CS_DATA_5:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL_SET:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL_CLR:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL_TOG:
+	case FSL_XCVR_TX_DPTH_TSCR:
+	case FSL_XCVR_TX_DPTH_BCR:
+	case FSL_XCVR_TX_DPTH_BCTR:
+	case FSL_XCVR_TX_DPTH_BCRR:
 	case FSL_XCVR_DEBUG_REG_0:
 	case FSL_XCVR_DEBUG_REG_1:
 		return true;
@@ -1017,6 +1049,10 @@ static bool fsl_xcvr_writeable_reg(struct device *dev, unsigned int reg)
 	case FSL_XCVR_RX_DPTH_CTRL_SET:
 	case FSL_XCVR_RX_DPTH_CTRL_CLR:
 	case FSL_XCVR_RX_DPTH_CTRL_TOG:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL_SET:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL_CLR:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL_TOG:
 	case FSL_XCVR_TX_DPTH_CTRL_SET:
 	case FSL_XCVR_TX_DPTH_CTRL_CLR:
 	case FSL_XCVR_TX_DPTH_CTRL_TOG:
@@ -1026,6 +1062,10 @@ static bool fsl_xcvr_writeable_reg(struct device *dev, unsigned int reg)
 	case FSL_XCVR_TX_CS_DATA_3:
 	case FSL_XCVR_TX_CS_DATA_4:
 	case FSL_XCVR_TX_CS_DATA_5:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL_SET:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL_CLR:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL_TOG:
 		return true;
 	default:
 		return false;
diff --git a/sound/soc/fsl/fsl_xcvr.h b/sound/soc/fsl/fsl_xcvr.h
index 7f2853c60085..4769b0fca21d 100644
--- a/sound/soc/fsl/fsl_xcvr.h
+++ b/sound/soc/fsl/fsl_xcvr.h
@@ -49,6 +49,16 @@
 #define FSL_XCVR_RX_DPTH_CTRL_CLR	0x188
 #define FSL_XCVR_RX_DPTH_CTRL_TOG	0x18c
 
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL	0x1C0
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_SET	0x1C4
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_CLR	0x1C8
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TOG	0x1CC
+
+#define FSL_XCVR_RX_DPTH_TSCR		0x1D0
+#define FSL_XCVR_RX_DPTH_BCR		0x1D4
+#define FSL_XCVR_RX_DPTH_BCTR		0x1D8
+#define FSL_XCVR_RX_DPTH_BCRR		0x1DC
+
 #define FSL_XCVR_TX_DPTH_CTRL		0x220 /* TX datapath ctrl reg */
 #define FSL_XCVR_TX_DPTH_CTRL_SET	0x224
 #define FSL_XCVR_TX_DPTH_CTRL_CLR	0x228
@@ -59,6 +69,17 @@
 #define FSL_XCVR_TX_CS_DATA_3		0x23C
 #define FSL_XCVR_TX_CS_DATA_4		0x240
 #define FSL_XCVR_TX_CS_DATA_5		0x244
+
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL	0x260
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_SET	0x264
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_CLR	0x268
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TOG	0x26C
+
+#define FSL_XCVR_TX_DPTH_TSCR		0x270
+#define FSL_XCVR_TX_DPTH_BCR		0x274
+#define FSL_XCVR_TX_DPTH_BCTR		0x278
+#define FSL_XCVR_TX_DPTH_BCRR		0x27C
+
 #define FSL_XCVR_DEBUG_REG_0		0x2E0
 #define FSL_XCVR_DEBUG_REG_1		0x2F0
 
-- 
2.34.1

