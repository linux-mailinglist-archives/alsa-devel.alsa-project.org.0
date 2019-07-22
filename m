Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E17E97003E
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:54:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7939217D6;
	Mon, 22 Jul 2019 14:53:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7939217D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563800086;
	bh=FyNveL4c3/SPWrtYNonNdvQuWlZXPSSXwKGy9lOT9FM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QaVkY6iHUcRMxI0HjEpj0gUTEVg02KnSzCx3DV1pp+SDxP60DoggXsR4qYH2j/y5k
	 qSv9i6pHZjC1OPdJQKFLRDE0EATmmtYp3BFopKgFGsNKPqdssbNglTxjvU1+tHRTs3
	 a3HFrmQIRvtQsTzuo95vh4p6cn3UgO15LisY+9D4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7BD3F80529;
	Mon, 22 Jul 2019 14:49:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89E5FF803D6; Mon, 22 Jul 2019 14:49:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70CAAF80481
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70CAAF80481
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 90D7A1A01B0;
 Mon, 22 Jul 2019 14:48:54 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 838D21A00AA;
 Mon, 22 Jul 2019 14:48:54 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id C1865205DB;
 Mon, 22 Jul 2019 14:48:53 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Date: Mon, 22 Jul 2019 15:48:31 +0300
Message-Id: <20190722124833.28757-9-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722124833.28757-1-daniel.baluta@nxp.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 viorel.suman@nxp.com, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com, angus@akkea.ca,
 tiwai@suse.com, nicoleotsuka@gmail.com, linux-imx@nxp.com,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 l.stach@pengutronix.de
Subject: [alsa-devel] [PATCH 08/10] ASoC: dt-bindings: Document fcomb_mode
	property
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

This allows combining multiple-data-line FIFOs into a
single-data-line FIFO.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl-sai.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
index 59f4d965a5fb..ca27afd840ba 100644
--- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
@@ -54,6 +54,10 @@ Optional properties:
 			  represents first data line, bit 1 represents second
 			  data line and so on. Data line is enabled if
 			  corresponding bit is set to 1.
+  - fsl,fcomb_mode	: list of two integers (first for RX, second for TX)
+			  representing FIFO combine mode. Possible values for
+			  combined mode are: 0 - disabled, 1 - Rx/Tx from shift
+			  registers, 2 - Rx/Tx by software, 3 - both.
 
 Optional properties (for mx6ul):
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
