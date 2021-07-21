Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A01D13D10BF
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 16:05:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FA291709;
	Wed, 21 Jul 2021 16:05:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FA291709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626876356;
	bh=vg9z41hmSCMZBbjTvlxxRIhe17ia8/cGZ9aMWJ/UPIE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vrk16761f6MLVd7rM2x+VzQl/O4d8sYGWsix/xqvDu8McY3bHkIJcORQAFtez2d3A
	 VR+2EcdGE4C3qkFgzid839QSzdtRFYsKlONbaceObQZuaqZ4EXMS59XQ97MEo//UvS
	 rSSibGnRGZ1DraBBI/dZwGaM2is31RpsEMpyD3Wc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2817EF804CF;
	Wed, 21 Jul 2021 16:04:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83AA3F804CF; Wed, 21 Jul 2021 16:04:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46FBEF804AC
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 16:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46FBEF804AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="rLn+cnHM"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="pJjqbxL8"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D4F1758046C;
 Wed, 21 Jul 2021 10:04:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 21 Jul 2021 10:04:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=c+hLIAQ99eGDJ
 mpR27VO2gLSF+6XUX6mH1kTLMWYFLA=; b=rLn+cnHMZnNtGVDS5UptVjbM00BxC
 vo5NmWzfeNTobguQ9E1hpxKF2oM25QvypuSlobOwkGq8HP97iXFcKx6qk+lqqjLf
 VNonL7HyyKaduEsIr1/ADlqPjbEy26gxtBnk03R3t13w25w+aXaFYG2rqvu2bmGI
 LCXy5lxLemvfmgBe39seZIbDjZPhSWjokd9ar8iVvMU/uJUadO15GFaVBKK1CGzA
 dFo4rmhGvxTmrTWFwO8XVCtFQ4QBFQZCQrm8dSAkeIeLke3hBOGKwdhFW2IIWlsG
 hbm3wiWwjmGjxaSJDrFV50PbIHn6mDUfLseuKodcrHePj0ILRxOnTkH9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=c+hLIAQ99eGDJmpR27VO2gLSF+6XUX6mH1kTLMWYFLA=; b=pJjqbxL8
 3JMUsvO1FtEVcY4HBBno/W2NYzvPpDDfi7XVqz8hkIlUhFf9aNoVspS0cl7cv8iI
 y4L3j1gNkE1UdJjGRLFGFSyrax7pm/AQecK4B6B17M/L3hueuP+2R0vzsf+c7unD
 2PpReT8glJqfAFnPxn0gmLpP7O0ApVLg+CLEa8aotVYEH1ymrWlaU8kNK6plUx+A
 MkeJpma8LjY8KcxBkTgyEpIA+OBeSI1MovHdTyNn+MqmRJmQkvoY+9zHWWvLOtMZ
 RNUVJpef4M5PQkjZkkB72Zxa5a07MHMYV1NNZcsmQtuBjTV7VgaPFbh4Vdod0KvV
 hZOogmWADK/FGA==
X-ME-Sender: <xms:bSn4YJH-DARgvKPA4jjrwPwuhVSF_VFLskiDuR2IQmQy5Tl4HjvwSA>
 <xme:bSn4YOXF4BllgoctAH4IaArSIY-b85xFMs5_I1IJGt2Ntu_QVLk2ZjkECJpjvjvi1
 bc7I0P2eHHwM20bOsI>
X-ME-Received: <xmr:bSn4YLJY_PIvR5YXCnrPDlERcND8q0utcpO1DDSdRY_XXvI_05zjVSMZgjw-d4YiO3dOSfZuy8y_qFSfZAV48o-iXJXs6hwmD3id>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
 ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
 himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepveejieejtdevgfff
 gfejuefggfeutdelteekgeetueeftddutddtgfffhffgueffnecuffhomhgrihhnpeguvg
 hvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bin4YPEbHZI5ZGyw6eVqR0HdWsidNvfYxKjFHnJSz-sb2SDDZCmhGg>
 <xmx:bin4YPUv71ltTB6W_KR6432bm6KvVhO_GeBP-dOmN8eYNujCvazX6Q>
 <xmx:bin4YKMlsFwq_LgKqL-Bq7m3jPSUZ-o7LTeoNaWNdpnblk4qFcXk6w>
 <xmx:bin4YPQa5XkMr2RmNkgEh0aawQcsUUW15TVwTA1tuQ3NwgNQRCfEVw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 10:04:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@siol.net>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 01/54] ASoC: dt-bindings: Add WM8978 Binding
Date: Wed, 21 Jul 2021 16:03:31 +0200
Message-Id: <20210721140424.725744-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721140424.725744-1-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-sunxi@googlegroups.com, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>
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

Even though we had the wm8978 driver for some time and a number of
boards using it already, we never had a binding for it. Let's add it
based on what the driver expects and the boards are providing.

Cc: alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../devicetree/bindings/sound/wlf,wm8978.yaml | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8978.yaml

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8978.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8978.yaml
new file mode 100644
index 000000000000..6761380261e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8978.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8978.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Wolfson WM8978 Codec Device Tree Bindings
+
+maintainers:
+  - Mark Brown <broonie@kernel.org>
+
+properties:
+  '#sound-dai-cells':
+    const: 0
+
+  compatible:
+    const: wlf,wm8978
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 526000
+
+required:
+  - '#sound-dai-cells'
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        codec@0 {
+            #sound-dai-cells = <0>;
+            compatible = "wlf,wm8978";
+            reg = <0>;
+            spi-max-frequency = <500000>;
+        };
+    };
+
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        codec@0 {
+            #sound-dai-cells = <0>;
+            compatible = "wlf,wm8978";
+            reg = <0>;
+        };
+    };
+
+...
-- 
2.31.1

