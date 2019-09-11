Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE80CAF47B
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 04:46:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1BCB16F2;
	Wed, 11 Sep 2019 04:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1BCB16F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568169962;
	bh=rzjjCq5ca55Fz5mzyh15cuGgwBZlDtSUl1aLlaCFbWI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NFKknyEjXHAviq5zGtLbAq7TKTcL0sXGoaGHb7dVtaH2gCX5X1N8CvxONsCRRLevE
	 F3sePKEfxPx4/JLiZcq7KCDNIJjv2K2WVl0r6rq2wRDThW7Q+cVYG0IqiWN0qQftR0
	 R3pmoX4iBXJNH93eBqg5NrmaH1ES3LH+b03wyDEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C161F804CF;
	Wed, 11 Sep 2019 04:44:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E218CF8044B; Wed, 11 Sep 2019 04:44:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F124F802DF
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 04:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F124F802DF
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C76021A0523;
 Wed, 11 Sep 2019 04:44:08 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 87D121A051A;
 Wed, 11 Sep 2019 04:44:02 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 9CEE9402DE;
 Wed, 11 Sep 2019 10:43:54 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Date: Wed, 11 Sep 2019 10:42:38 -0400
Message-Id: <cff8bff1e8d3334fa308ddfcec266a5284e3c858.1568169346.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [alsa-devel] [PATCH 1/2] ASoC: fsl_mqs: add DT binding documentation
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

Add the DT binding documentation for NXP MQS driver

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/fsl,mqs.txt     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,mqs.txt

diff --git a/Documentation/devicetree/bindings/sound/fsl,mqs.txt b/Documentation/devicetree/bindings/sound/fsl,mqs.txt
new file mode 100644
index 000000000000..a1dbe181204a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,mqs.txt
@@ -0,0 +1,20 @@
+fsl,mqs audio CODEC
+
+Required properties:
+
+  - compatible : Must contain one of "fsl,imx6sx-mqs", "fsl,codec-mqs"
+		"fsl,imx8qm-mqs", "fsl,imx8qxp-mqs".
+  - clocks : A list of phandles + clock-specifiers, one for each entry in
+	     clock-names
+  - clock-names : Must contain "mclk"
+  - gpr : The gpr node.
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
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
