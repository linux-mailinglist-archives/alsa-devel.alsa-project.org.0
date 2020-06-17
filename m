Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 516AA1FC582
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 07:01:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE90C166C;
	Wed, 17 Jun 2020 07:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE90C166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592370101;
	bh=YSY3Uk5Y+ePwsENgHq+22wg+Kno1OqdLPZ8YHagk4h0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gJTk48fI00XlfpLE8JmhYD3A2KchxH/Gnev1dj6CXFj4TEenr+xiPeQZZxERTQ15Z
	 HP5qZF0somwMZpRcuXP9tHuWMi5Gtyjr8+clAaA5f/C7znnKR+ocMyO6KoGdkMHz2m
	 5cdyoQQs9DQPY39LbSKzEbaisia2yAVqhQNy8S7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 805A3F80171;
	Wed, 17 Jun 2020 06:59:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2664F802A1; Wed, 17 Jun 2020 06:59:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01493F8025F
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 06:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01493F8025F
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CF7B42005FD;
 Wed, 17 Jun 2020 06:59:37 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 950FE2008A3;
 Wed, 17 Jun 2020 06:59:32 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A5824402B1;
 Wed, 17 Jun 2020 12:59:25 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: bindings: fsl-asoc-card: Add compatible string
 for MQS
Date: Wed, 17 Jun 2020 12:48:24 +0800
Message-Id: <2185a3ec866bc59f82d93b73d1a732a896fd8f48.1592369271.git.shengjiu.wang@nxp.com>
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

Add compatible string "fsl,imx-audio-mqs" for MQS, and move
"audio-routing" property to be optional for MQS doesn't need
such property.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2
- Move "audio-routing" to optional.

 .../devicetree/bindings/sound/fsl-asoc-card.txt      | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
index c60a5732d29c..ca9a3a43adfd 100644
--- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
@@ -34,6 +34,8 @@ The compatible list for this generic sound card currently:
 
  "fsl,imx-audio-wm8960"
 
+ "fsl,imx-audio-mqs"
+
 Required properties:
 
   - compatible		: Contains one of entries in the compatible list.
@@ -44,6 +46,11 @@ Required properties:
 
   - audio-codec		: The phandle of an audio codec
 
+Optional properties:
+
+  - audio-asrc		: The phandle of ASRC. It can be absent if there's no
+			  need to add ASRC support via DPCM.
+
   - audio-routing	: A list of the connections between audio components.
 			  Each entry is a pair of strings, the first being the
 			  connection's sink, the second being the connection's
@@ -60,11 +67,6 @@ Required properties:
 			        coexisting in order to support the old bindings
 				of wm8962 and sgtl5000.
 
-Optional properties:
-
-  - audio-asrc		: The phandle of ASRC. It can be absent if there's no
-			  need to add ASRC support via DPCM.
-
 Optional unless SSI is selected as a CPU DAI:
 
   - mux-int-port	: The internal port of the i.MX audio muxer (AUDMUX)
-- 
2.21.0

