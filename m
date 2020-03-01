Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DAD174B86
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Mar 2020 06:34:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5527816E8;
	Sun,  1 Mar 2020 06:33:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5527816E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583040846;
	bh=N+r32YvIJlSJ6m7iyAbzGrBC7Q0VsYcnbo1vc3qx808=;
	h=From:To:Subject:Date:In-Reply-To:References:In-Reply-To:
	 References:Cc:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=iT/IGSbrG2e4xdKZymOGEJzi/c5v9WUuZvO18rNiVpF015m+rK70XMI6esaRtLLAC
	 q4TNRQcV8zwG9bwgFYeAvmLMfm9UQUy4MXOt+fgG9ej9za0Sv27OskGf+Cw2zwEcJ6
	 tqKg7D9KU4QU4hj6p14j4x8I66CEq3/+Bp8csTUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E484AF80271;
	Sun,  1 Mar 2020 06:30:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93F00F8026A; Sun,  1 Mar 2020 06:30:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92B5AF80245
 for <alsa-devel@alsa-project.org>; Sun,  1 Mar 2020 06:30:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92B5AF80245
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 88CEB200A32;
 Sun,  1 Mar 2020 06:30:36 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 44BF9200A2B;
 Sun,  1 Mar 2020 06:30:27 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 83DD3402A7;
 Sun,  1 Mar 2020 13:30:16 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/8] ARM: dts: imx6qdl: Change asrc-width to asrc-format
Date: Sun,  1 Mar 2020 13:24:13 +0800
Message-Id: <5bb6329e32d7c12019daec403b8f01758df675da.1583039752.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1583039752.git.shengjiu.wang@nxp.com>
References: <cover.1583039752.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1583039752.git.shengjiu.wang@nxp.com>
References: <cover.1583039752.git.shengjiu.wang@nxp.com>
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

asrc_format is more inteligent, which is align with the alsa
definition snd_pcm_format_t, we don't need to convert it to
format in driver, and it can distinguish S24_LE & S24_3LE.
default value is SNDRV_PCM_FORMAT_S16_LE(2).

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index e6b4b8525f98..062d98ee513b 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -481,7 +481,7 @@
 					dma-names = "rxa", "rxb", "rxc",
 							"txa", "txb", "txc";
 					fsl,asrc-rate  = <48000>;
-					fsl,asrc-width = <16>;
+					fsl,asrc-format = <2>;
 					status = "okay";
 				};
 
-- 
2.21.0

