Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4CD17D873
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 05:08:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9597167F;
	Mon,  9 Mar 2020 05:07:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9597167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583726887;
	bh=x69r6siTPYBeXQZRPrWTcmUyfUWkQFV6MtSKX6yijNY=;
	h=From:To:Subject:Date:In-Reply-To:References:In-Reply-To:
	 References:Cc:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=ctgAaOwEOfhaoEeh8NBR/xEc5jN1lbFUKbXeypUU2IvUY0iYqnn/8eFV3xsCjAcSB
	 NJUCdmC1llmloavXSn7N6PH+ANlf8q0EohaLr1Nl2J730teLhLBlEns08vKbFjDvxQ
	 H27Cl2TKn2eNyTzWD85bHBVDLiOYnwkA/wbZlGeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06989F8028C;
	Mon,  9 Mar 2020 05:05:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EB15F800DA; Mon,  9 Mar 2020 05:05:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 735B2F801A3
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 05:05:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 735B2F801A3
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D73822015B5;
 Mon,  9 Mar 2020 05:05:28 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BF7AD2015AB;
 Mon,  9 Mar 2020 05:05:21 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A4786402CA;
 Mon,  9 Mar 2020 12:05:12 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: [PATCH v5 1/7] ASoC: dt-bindings: fsl_asrc: Add new property fsl,
 asrc-format
Date: Mon,  9 Mar 2020 11:58:28 +0800
Message-Id: <24f69c50925b93afd7a706bd888ee25d27247c78.1583725533.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1583725533.git.shengjiu.wang@nxp.com>
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1583725533.git.shengjiu.wang@nxp.com>
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
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

In order to support new EASRC and simplify the code structure,
We decide to share the common structure between them. This bring
a problem that EASRC accept format directly from devicetree, but
ASRC accept width from devicetree.

In order to align with new ESARC, we add new property fsl,asrc-format.
The fsl,asrc-format can replace the fsl,asrc-width, then driver
can accept format from devicetree, don't need to convert it to
format through width.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,asrc.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
index cb9a25165503..780455cf7f71 100644
--- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
+++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
@@ -51,6 +51,11 @@ Optional properties:
 			  will be in use as default. Otherwise, the big endian
 			  mode will be in use for all the device registers.
 
+   - fsl,asrc-format	: Defines a mutual sample format used by DPCM Back
+			  Ends, which can replace the fsl,asrc-width.
+			  The value is SNDRV_PCM_FORMAT_S16_LE, or
+			  SNDRV_PCM_FORMAT_S24_LE
+
 Example:
 
 asrc: asrc@2034000 {
-- 
2.21.0

