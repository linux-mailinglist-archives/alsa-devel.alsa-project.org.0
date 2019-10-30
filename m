Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7115AE9B0E
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 12:46:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E65D022C8;
	Wed, 30 Oct 2019 12:46:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E65D022C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572436012;
	bh=4bMgTs+DWNJUGGtlRR2zc8+dUI1lA3u9Txa0GuQb5OA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hfERJ3SjNnZJyWqnNPraZsiI9Lx4u0T0EmyL/1o+CHAVX4oD0IRYUPQoLZoqKxfr6
	 WBO7Gsw1nh/lj7bDcicZcu17mBz2kWDjkL8xVPOP17EhdQGZwraGVL5yQ6Q1CofcnV
	 h9We9TrIqqRHndCoASpfwVRAqdC0aOuhUyn/fxcw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36964F803D6;
	Wed, 30 Oct 2019 12:45:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B565BF80361; Wed, 30 Oct 2019 12:45:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DEF6F802A1
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 12:45:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DEF6F802A1
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F41A21A0065;
 Wed, 30 Oct 2019 12:45:00 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E1B371A0463;
 Wed, 30 Oct 2019 12:44:54 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 32EEB402E2;
 Wed, 30 Oct 2019 19:44:47 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Date: Wed, 30 Oct 2019 19:41:26 +0800
Message-Id: <6465fb7dfaa68b6693584bcfa696894628d45fe9.1572435604.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH V2 1/2] ASoC: dt-bindings: fsl_asrc: add
	compatible string for imx8qm
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

In order to support the two asrc modules in imx8qm, we need to
add compatible string "fsl,imx8qm-asrc0" and "fsl,imx8qm-asrc1"

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,asrc.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
index 1d4d9f938689..cd2bd3daa7e1 100644
--- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
+++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
@@ -8,7 +8,8 @@ three substreams within totally 10 channels.
 
 Required properties:
 
-  - compatible		: Contains "fsl,imx35-asrc" or "fsl,imx53-asrc".
+  - compatible		: Contains "fsl,imx35-asrc", "fsl,imx53-asrc",
+			  "fsl,imx8qm-asrc0" or "fsl,imx8qm-asrc1".
 
   - reg			: Offset and length of the register set for the device.
 
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
