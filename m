Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3F5993EF4
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 08:52:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FB52E69;
	Tue,  8 Oct 2024 08:51:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FB52E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728370323;
	bh=GUvhzlzFzjridXdFhrrGBeRXP9UI7+yDU7tLFIai60w=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hSLn9SPFHAHeswwXL5v2Lty69mJThtaEto4ognJ9npXolx8lpVXVXl+D68tYnvPhi
	 4FbNWSa9f2xb+jzuvth1ecHreNWAJfJAA/l/nvjTe3hVe2ejINfsTugDXmDbT/N4pu
	 7fkO1ZVQOSRKvlSyIdlYc7KNASLVNhw9vnURAXLU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B388F805C6; Tue,  8 Oct 2024 08:51:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2871F805C6;
	Tue,  8 Oct 2024 08:51:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 315B8F80536; Tue,  8 Oct 2024 08:51:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03230F800ED
	for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2024 08:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03230F800ED
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3D9A5200269;
	Tue,  8 Oct 2024 08:51:05 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 03EA1200222;
	Tue,  8 Oct 2024 08:51:05 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 55889183B721;
	Tue,  8 Oct 2024 14:51:03 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: fsl_xcvr: enable interrupt of cmdc status update
Date: Tue,  8 Oct 2024 14:27:52 +0800
Message-Id: <1728368873-31379-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1728368873-31379-1-git-send-email-shengjiu.wang@nxp.com>
References: <1728368873-31379-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: 2NDUML5YOIB5U5INOQCKSFSITE2T7VRD
X-Message-ID-Hash: 2NDUML5YOIB5U5INOQCKSFSITE2T7VRD
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NDUML5YOIB5U5INOQCKSFSITE2T7VRD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This enables the interrupt to be asserted when there
is a change in Capabilities data structure / Latency
request of the CMDC Status register.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 4 ++++
 sound/soc/fsl/fsl_xcvr.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index beede7344efd..9e24d6462c01 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1265,6 +1265,10 @@ static irqreturn_t irq0_isr(int irq, void *devid)
 		dev_dbg(dev, "DMA write request\n");
 		isr_clr |= FSL_XCVR_IRQ_DMA_WR_REQ;
 	}
+	if (isr & FSL_XCVR_IRQ_CMDC_STATUS_UPD) {
+		dev_dbg(dev, "CMDC status update\n");
+		isr_clr |= FSL_XCVR_IRQ_CMDC_STATUS_UPD;
+	}
 
 	if (isr_clr) {
 		regmap_write(regmap, FSL_XCVR_EXT_ISR_CLR, isr_clr);
diff --git a/sound/soc/fsl/fsl_xcvr.h b/sound/soc/fsl/fsl_xcvr.h
index 882428592e1a..ce27b13698e7 100644
--- a/sound/soc/fsl/fsl_xcvr.h
+++ b/sound/soc/fsl/fsl_xcvr.h
@@ -165,6 +165,7 @@
 					 FSL_XCVR_IRQ_MUTE | \
 					 FSL_XCVR_IRQ_FIFO_UOFL_ERR | \
 					 FSL_XCVR_IRQ_HOST_WAKEUP | \
+					 FSL_XCVR_IRQ_CMDC_STATUS_UPD |\
 					 FSL_XCVR_IRQ_ARC_MODE)
 
 #define FSL_XCVR_ISR_CMDC_TX_EN		BIT(3)
-- 
2.34.1

