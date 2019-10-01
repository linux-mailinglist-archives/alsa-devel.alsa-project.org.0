Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8193C33A3
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 14:01:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75FFD1677;
	Tue,  1 Oct 2019 14:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75FFD1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569931306;
	bh=fF15QnWVhDzyxgI0JfQffufHHRNgEd5VfQQyrWYwLlM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GSLOxiMiQjsAkLtdRixEZhau6zDcFOLUEwppMP0HGILfw7RkRgKxPMawrqiNNP7ww
	 DMXz7qCOMmu3HS/cTdgufIeQadHAGBGhWWjAloyUH3PXIjulkX50wa+EP+q1e9NiKf
	 yZtfcDoY7pvef8orou7jSVBQBuT9W2LIMNfS9Q5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B800DF80C5A;
	Tue,  1 Oct 2019 13:41:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BECF4F80716; Tue,  1 Oct 2019 13:41:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8589F80639
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:40:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8589F80639
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="rjUhPgbp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=zIkM8oZgmIv/BhPJfyepEtaPqf94VD1HkTKQ5Bkf03o=; b=rjUhPgbp9msm
 QGDlarWKfelOcSp6yjhEK8t8BnIjzJmTyhAFw2dvt5H80DDeuC8eLpmdJNxArzrz2FReKT2ijFJXk
 66I/MRGRzds+unjB8nUn8FG6uv9cYvEoK424b1jbBuNfA5uJuKHeEcsBvk2ADsIbEvm6C/JzRBD3I
 iVNbQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWT-0004Vn-7m; Tue, 01 Oct 2019 11:40:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A265527429C0; Tue,  1 Oct 2019 12:40:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <65e1f035aea2951aacda54aa3a751bc244f72f6a.1568367274.git.shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114052.A265527429C0@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:52 +0100 (BST)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 festevam@gmail.com
Subject: [alsa-devel] Applied "ASoC: fsl_mqs: add DT binding documentation"
	to the asoc tree
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

The patch

   ASoC: fsl_mqs: add DT binding documentation

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 75234212c446cef3272a025b588b2e418158ed30 Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Fri, 13 Sep 2019 17:42:13 +0800
Subject: [PATCH] ASoC: fsl_mqs: add DT binding documentation

Add the DT binding documentation for NXP MQS driver

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/65e1f035aea2951aacda54aa3a751bc244f72f6a.1568367274.git.shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/sound/fsl,mqs.txt     | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,mqs.txt

diff --git a/Documentation/devicetree/bindings/sound/fsl,mqs.txt b/Documentation/devicetree/bindings/sound/fsl,mqs.txt
new file mode 100644
index 000000000000..40353fc30255
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,mqs.txt
@@ -0,0 +1,36 @@
+fsl,mqs audio CODEC
+
+Required properties:
+  - compatible : Must contain one of "fsl,imx6sx-mqs", "fsl,codec-mqs"
+		"fsl,imx8qm-mqs", "fsl,imx8qxp-mqs".
+  - clocks : A list of phandles + clock-specifiers, one for each entry in
+	     clock-names
+  - clock-names : "mclk" - must required.
+		  "core" - required if compatible is "fsl,imx8qm-mqs", it
+		           is for register access.
+  - gpr : A phandle of General Purpose Registers in IOMUX Controller.
+	  Required if compatible is "fsl,imx6sx-mqs".
+
+Required if compatible is "fsl,imx8qm-mqs":
+  - power-domains: A phandle of PM domain provider node.
+  - reg: Offset and length of the register set for the device.
+
+Example:
+
+mqs: mqs {
+	compatible = "fsl,imx6sx-mqs";
+	gpr = <&gpr>;
+	clocks = <&clks IMX6SX_CLK_SAI1>;
+	clock-names = "mclk";
+	status = "disabled";
+};
+
+mqs: mqs@59850000 {
+	compatible = "fsl,imx8qm-mqs";
+	reg = <0x59850000 0x10000>;
+	clocks = <&clk IMX8QM_AUD_MQS_IPG>,
+		 <&clk IMX8QM_AUD_MQS_HMCLK>;
+	clock-names = "core", "mclk";
+	power-domains = <&pd_mqs0>;
+	status = "disabled";
+};
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
