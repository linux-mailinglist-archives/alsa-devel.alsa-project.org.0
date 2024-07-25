Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8FF93BEDB
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 11:16:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86AAEEB6;
	Thu, 25 Jul 2024 11:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86AAEEB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721898962;
	bh=6246fXnwCejdwvRR+WaV7yd8tVAr4cMG7Uezj8q2PYs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=t6L1qv1ubZB55xi7TeikASJN9idFuSYwWRoXk/O8ITmnaxRsd1kVDdrLPHrC+IuG1
	 RCGD7qahyjpYK7k8mpGhJ+WGilt4+sOPyzJGgr9LpUFXAB8DUaCmafq9aEz8i5OCV5
	 EvCxrvf8mbCg4dO/967PtGmEMxA1M3J29cqM2eMs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 159BCF805ED; Thu, 25 Jul 2024 11:15:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B25DBF805DF;
	Thu, 25 Jul 2024 11:15:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE6CDF80482; Thu, 25 Jul 2024 11:14:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9972F8007E
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 11:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9972F8007E
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EC2EB2023A5;
	Thu, 25 Jul 2024 11:14:00 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B138F2023A6;
	Thu, 25 Jul 2024 11:14:00 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 19CE7180222B;
	Thu, 25 Jul 2024 17:13:59 +0800 (+08)
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
Subject: [PATCH 1/2] ASoC: fsl_micfil: Expand the range of FIFO watermark mask
Date: Thu, 25 Jul 2024 16:54:53 +0800
Message-Id: <1721897694-6088-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1721897694-6088-1-git-send-email-shengjiu.wang@nxp.com>
References: <1721897694-6088-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: ZKQ5WFCCCEQWQA3E5P2OOV4AUWJ7NGMN
X-Message-ID-Hash: ZKQ5WFCCCEQWQA3E5P2OOV4AUWJ7NGMN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZKQ5WFCCCEQWQA3E5P2OOV4AUWJ7NGMN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On the i.MX9x platforms, the mask of FIFO watermark
is 0x1F, on i.MX8x platforms, the mask of FIFO watermark
is 0X7. So use the mask 0x1F for all platforms to make them
compatible.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 2 +-
 sound/soc/fsl/fsl_micfil.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 0d37edb70261..96a6b88d0d67 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -831,7 +831,7 @@ static const struct reg_default fsl_micfil_reg_defaults[] = {
 	{REG_MICFIL_CTRL1,		0x00000000},
 	{REG_MICFIL_CTRL2,		0x00000000},
 	{REG_MICFIL_STAT,		0x00000000},
-	{REG_MICFIL_FIFO_CTRL,		0x00000007},
+	{REG_MICFIL_FIFO_CTRL,		0x0000001F},
 	{REG_MICFIL_FIFO_STAT,		0x00000000},
 	{REG_MICFIL_DATACH0,		0x00000000},
 	{REG_MICFIL_DATACH1,		0x00000000},
diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
index c6b902ba0a53..b7798a7cbf2a 100644
--- a/sound/soc/fsl/fsl_micfil.h
+++ b/sound/soc/fsl/fsl_micfil.h
@@ -72,7 +72,7 @@
 #define MICFIL_STAT_CHXF(ch)		BIT(ch)
 
 /* MICFIL FIFO Control Register -- REG_MICFIL_FIFO_CTRL 0x10 */
-#define MICFIL_FIFO_CTRL_FIFOWMK	GENMASK(2, 0)
+#define MICFIL_FIFO_CTRL_FIFOWMK	GENMASK(4, 0)
 
 /* MICFIL FIFO Status Register -- REG_MICFIL_FIFO_STAT 0x14 */
 #define MICFIL_FIFO_STAT_FIFOX_OVER(ch)	BIT(ch)
-- 
2.34.1

