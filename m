Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C93B16211E
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 07:49:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C88861612;
	Tue, 18 Feb 2020 07:48:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C88861612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582008545;
	bh=0eqQrh1VwLdrnQQmTFGcmjFRv3pmZrM6TpAqwg3AUS8=;
	h=From:To:Subject:Date:In-Reply-To:References:In-Reply-To:
	 References:Cc:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=q0OQsTGTN8Qg18Po2dF4kzZDZl28fUGydiSydvdKHj/+LIJ4AXiDAuallrpUlWonC
	 TFxd66qFgPaki9XlUh4Qm2g8NxL5J9CEL7wa4IOUQ6NNzxqMhcHJ5ZGC+ot7x2HcFS
	 w4bz3jCiLuyNxAj9A4ktfyVOSVlUAfYPyf6Cnp4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5258FF80277;
	Tue, 18 Feb 2020 07:46:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1C78F80137; Tue, 18 Feb 2020 07:46:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8E40F80145
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 07:46:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8E40F80145
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A7E4820363E;
 Tue, 18 Feb 2020 07:46:14 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9D9B62035DE;
 Tue, 18 Feb 2020 07:46:07 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id AAD9E403DA;
 Tue, 18 Feb 2020 14:45:28 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] ASoC: dt-bindings: fsl_easrc: Add document for EASRC
Date: Tue, 18 Feb 2020 14:39:36 +0800
Message-Id: <a02af544c73914fe3a5ab2f35eb237ef68ee29e7.1582007379.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582007379.git.shengjiu.wang@nxp.com>
References: <cover.1582007379.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1582007379.git.shengjiu.wang@nxp.com>
References: <cover.1582007379.git.shengjiu.wang@nxp.com>
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

EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
IP module found on i.MX8MN.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/fsl,easrc.txt   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.txt

diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.txt b/Documentation/devicetree/bindings/sound/fsl,easrc.txt
new file mode 100644
index 000000000000..0e8153165e3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,easrc.txt
@@ -0,0 +1,57 @@
+NXP Asynchronous Sample Rate Converter (ASRC) Controller
+
+The Asynchronous Sample Rate Converter (ASRC) converts the sampling rate of a
+signal associated with an input clock into a signal associated with a different
+output clock. The driver currently works as a Front End of DPCM with other Back
+Ends Audio controller such as ESAI, SSI and SAI. It has four context to support
+four substreams within totally 32 channels.
+
+Required properties:
+- compatible:                Contains "fsl,imx8mn-easrc".
+
+- reg:                       Offset and length of the register set for the
+			     device.
+
+- interrupts:                Contains the asrc interrupt.
+
+- dmas:                      Generic dma devicetree binding as described in
+		             Documentation/devicetree/bindings/dma/dma.txt.
+
+- dma-names:                 Contains "ctx0_rx", "ctx0_tx",
+				      "ctx1_rx", "ctx1_tx",
+			              "ctx2_rx", "ctx2_tx",
+				      "ctx3_rx", "ctx3_tx".
+
+- clocks:                    Contains an entry for each entry in clock-names.
+
+- clock-names:               "mem" - Peripheral clock to driver module.
+
+- fsl,easrc-ram-script-name: The coefficient table for the filters
+
+- fsl,asrc-rate:             Defines a mutual sample rate used by DPCM Back
+			     Ends.
+
+- fsl,asrc-width:            Defines a mutual sample width used by DPCM Back
+			     Ends.
+
+Example:
+
+easrc: easrc@300C0000 {
+	compatible = "fsl,imx8mn-easrc";
+	reg = <0x0 0x300C0000 0x0 0x10000>;
+	interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&clk IMX8MN_CLK_ASRC_ROOT>;
+	clock-names = "mem";
+	dmas = <&sdma2 16 23 0> , <&sdma2 17 23 0>,
+	       <&sdma2 18 23 0> , <&sdma2 19 23 0>,
+	       <&sdma2 20 23 0> , <&sdma2 21 23 0>,
+	       <&sdma2 22 23 0> , <&sdma2 23 23 0>;
+	dma-names = "ctx0_rx", "ctx0_tx",
+		    "ctx1_rx", "ctx1_tx",
+		    "ctx2_rx", "ctx2_tx",
+		    "ctx3_rx", "ctx3_tx";
+	fsl,easrc-ram-script-name = "imx/easrc/easrc-imx8mn.bin";
+	fsl,asrc-rate  = <8000>;
+	fsl,asrc-width = <16>;
+	status = "disabled";
+};
-- 
2.21.0

