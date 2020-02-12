Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2751915A03C
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 05:38:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B986511C;
	Wed, 12 Feb 2020 05:37:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B986511C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581482293;
	bh=/hLlWNDPFB+MynT8hlwwevO4PuPt67yakkI5p1qAGQA=;
	h=From:To:Date:In-Reply-To:References:In-Reply-To:References:Cc:
	 Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From;
	b=dfCr9LaJsMHdSH9kga2tfmctAOrKgoQQ6ucrmKZ8Xpoq4p0VESwLc+D5xf/34Ngxy
	 ZVvOIukhdplpJRurKdY9bE7qtFnhbJhnHEEoM5g16ePYwyLkp1qtrdUt5BRcq+NOwb
	 1G64MWNXkS/QiPmNTg9B8LebVpcYNJu4E+672vd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07A10F80277;
	Wed, 12 Feb 2020 05:35:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63D5BF80158; Wed, 12 Feb 2020 05:35:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90D1DF800E7
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 05:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90D1DF800E7
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2AE5F2256C7;
 Wed, 12 Feb 2020 05:35:43 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1027E2256CC;
 Wed, 12 Feb 2020 05:35:36 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 6787C402B7;
 Wed, 12 Feb 2020 12:35:27 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Date: Wed, 12 Feb 2020 12:30:01 +0800
Message-Id: <916c5542c7248ee3dc9ebe5324b80beb2af9d1fa.1581475981.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1581475981.git.shengjiu.wang@nxp.com>
References: <cover.1581475981.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1581475981.git.shengjiu.wang@nxp.com>
References: <cover.1581475981.git.shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 1/3] ASoC: fsl_asrc: Move common definition to
	fsl_asrc_common
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There is a new ASRC included in i.MX serial platform, there
are some common definition can be shared with each other.
So move the common definition to a separate header file.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.h        | 11 +----------
 sound/soc/fsl/fsl_asrc_common.h | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 10 deletions(-)
 create mode 100644 sound/soc/fsl/fsl_asrc_common.h

diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 8a821132d9d0..e8abb27ffeda 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -10,8 +10,7 @@
 #ifndef _FSL_ASRC_H
 #define _FSL_ASRC_H
 
-#define IN	0
-#define OUT	1
+#include  "fsl_asrc_common.h"
 
 #define ASRC_DMA_BUFFER_NUM		2
 #define ASRC_INPUTFIFO_THRESHOLD	32
@@ -283,14 +282,6 @@
 #define ASRMCR1i_OW16_MASK		(1 << ASRMCR1i_OW16_SHIFT)
 #define ASRMCR1i_OW16(v)		((v) << ASRMCR1i_OW16_SHIFT)
 
-
-enum asrc_pair_index {
-	ASRC_INVALID_PAIR = -1,
-	ASRC_PAIR_A = 0,
-	ASRC_PAIR_B = 1,
-	ASRC_PAIR_C = 2,
-};
-
 #define ASRC_PAIR_MAX_NUM	(ASRC_PAIR_C + 1)
 
 enum asrc_inclk {
diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
new file mode 100644
index 000000000000..8acc55778ff2
--- /dev/null
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2019 NXP
+ *
+ */
+
+#ifndef _FSL_ASRC_COMMON_H
+#define _FSL_ASRC_COMMON_H
+
+/* directions */
+#define IN	0
+#define OUT	1
+
+enum asrc_pair_index {
+	ASRC_INVALID_PAIR = -1,
+	ASRC_PAIR_A = 0,
+	ASRC_PAIR_B = 1,
+	ASRC_PAIR_C = 2,
+};
+
+#endif /* _FSL_ASRC_COMMON_H */
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
