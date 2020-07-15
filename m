Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49029220F06
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 16:17:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0BDA1679;
	Wed, 15 Jul 2020 16:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0BDA1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594822640;
	bh=oRnexFNAZf9d6CbypWeXJxqfBMPpIAdOTB8sYSgHkpE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qQ3nAU32ydibCM2uvFBzIeNz9Fw+kwZ9tnxxZ0JwlxbmZTslixrtBkXkAoYa/vq4w
	 KQ3M+trsSxX08iBjszHID9kZvAkxWflyRS9hS8K4Zh3qErQjdjiaZs48t5BYxYbE8E
	 BVTd7mV5ZgoBNoh2PDVrrD9M3vYtYyJJmAyRY6s8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10896F802BE;
	Wed, 15 Jul 2020 16:14:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23981F8021D; Wed, 15 Jul 2020 16:14:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D8DCF80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 16:13:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D8DCF80113
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 800B9200307;
 Wed, 15 Jul 2020 16:13:51 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2FF932002F8;
 Wed, 15 Jul 2020 16:13:46 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 6759540305;
 Wed, 15 Jul 2020 22:13:39 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com
Subject: [PATCH v2 2/3] ASoC: bindings: fsl-asoc-card: Support hp-det-gpio and
 mic-det-gpio
Date: Wed, 15 Jul 2020 22:09:38 +0800
Message-Id: <1594822179-1849-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594822179-1849-1-git-send-email-shengjiu.wang@nxp.com>
References: <1594822179-1849-1-git-send-email-shengjiu.wang@nxp.com>
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

Add headphone and microphone detection GPIO support.
These properties are optional.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 Documentation/devicetree/bindings/sound/fsl-asoc-card.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
index 133d7e14a4d0..8a6a3d0fda5e 100644
--- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
@@ -69,6 +69,9 @@ Optional properties:
 			        coexisting in order to support the old bindings
 				of wm8962 and sgtl5000.
 
+  - hp-det-gpio		: The GPIO that detect headphones are plugged in
+  - mic-det-gpio	: The GPIO that detect microphones are plugged in
+
 Optional unless SSI is selected as a CPU DAI:
 
   - mux-int-port	: The internal port of the i.MX audio muxer (AUDMUX)
-- 
2.27.0

