Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 430F82F4466
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 07:09:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D233F16B1;
	Wed, 13 Jan 2021 07:09:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D233F16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610518194;
	bh=4vDUTQqTaRR7hqtpCZ/x1vcxmQpo+uOgGl7Za6wnubA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z5fNqF3UVME2Z+KsLo66plY3z3u0futlGqxpiFJ0WZIS9gbRMoWhyJZmB6NMDpk5a
	 oZbHJAR+ULWgZDay+yFI03Bo3X3KhWlGW5R9955pNtcsDfSqGVllvToHuPd/5CyDoA
	 aF7eK8UqV3Sr4cJFaWGWi9pSmgj1Y+H1CfEoZZEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBA18F804D6;
	Wed, 13 Jan 2021 07:06:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FE3CF8016D; Wed, 13 Jan 2021 07:06:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33B88F8014D
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 07:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33B88F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="NSFYGKXS"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="NEybdZcS"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 7C5671B80;
 Wed, 13 Jan 2021 01:06:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 13 Jan 2021 01:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=O2ch6PxeaPKIY
 rDAylcvcJjLc0v52L8vH5z7zkCbnsg=; b=NSFYGKXSsI5M+y7vkGCKM2ltTTNhR
 wPdcjXSTY/pKOJWturaotNCPjIJf4/2/1IFjTDMmjsQ0hKFympp90spWwP5SK1hA
 3WGJVBrm60fifmMIGRgohDfSijoHh8lYQnYNNI/VVz3Wg1OWEJZLCL4CRJ9FEwhX
 BuB6wbhQKXWY3nn9rDltUhKXAbXNqhJxveHvZZo7xxMU/PeQjC1ehW6M9Hr7aqNk
 DPsAZdmgjiFQwRJb5Xxeui982UqB3In4VsTSQmV4fpiSKfjlYQ/YZBqDX4ZnyGc0
 bqfTmICT15mUo85CSRhRNUIvqBs7aBuGDB6VhFMdj6U7G37ty96O83QKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=O2ch6PxeaPKIYrDAylcvcJjLc0v52L8vH5z7zkCbnsg=; b=NEybdZcS
 B0WODOP25ZWCQewJ9o88u9uUtXDgQSOacS8eqj7lCYQCGkzzELXGzZNutCS0FXpM
 /+z7OI7mOnd677KEMBR/+6WmCenprZX5nuNCjB3TFar6U9TIgtaRDFTkXvrhBFTy
 fwdQwWmV13R7LzdsGHxTcmqUr598b5DHE5ksTXwRdk+PB3nO05ScmFGzU32OzBSe
 rVNhF5L8pEoPJgDH0I4n1F1teeZTtLeh70PnSX4uXE6ZFszllGa+vkxCOJVgcMM+
 6s0r8QkxTUzqFyzQ8lE7aGeHjYH87SWVJIc2l148bAj7TL2gob0PDL6ZJsLnNYBN
 L4l74kLpmQL7Xg==
X-ME-Sender: <xms:2Y3-X8TDR8-8LOMJ8yZYvA36lhL84BbKRaCFoDpINEMpQ9a-JUjEgQ>
 <xme:2Y3-X5yOFnS67kR6wT3fcmwTg6ddetfx7-ZOmVo5I5WvQus2gK5HxNcFIvDt5_8YT
 nngR_IBIBFAlYmutg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:2Y3-X50462jYXspZACTN2iLL3Hyo4dzhs7X-NOG2YwyqdL8XoI8cYA>
 <xmx:2Y3-XwCVo5yCx-HQz7MIlmz9XP6y0ouSdkDR0VUeXUkpMWNP0PPTyw>
 <xmx:2Y3-X1g1yEHN2k_fbgR0TGOMlyh0Cq9RHX1g5rtJ4IjQN49H-akH6w>
 <xmx:2o3-X2WC_TiZ80xzOSpHEDNdfsSltp2j7Lsr1gsroMOPbKth4kYQrIYD08Y>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 52DC224005C;
 Wed, 13 Jan 2021 01:06:17 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 2/7] ARM: dts: sun8i-a33: Allow using multiple codec DAIs
Date: Wed, 13 Jan 2021 00:06:10 -0600
Message-Id: <20210113060615.53088-3-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113060615.53088-1-samuel@sholland.org>
References: <20210113060615.53088-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
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

Increase #sound-dai-cells on the digital codec to allow using the other
DAIs provided by the codec for AIF2 and AIF3.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm/boot/dts/sun8i-a33.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a33.dtsi
index c458f5fb124f..0b38f9f35074 100644
--- a/arch/arm/boot/dts/sun8i-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a33.dtsi
@@ -198,7 +198,7 @@ simple-audio-card,cpu {
 		};
 
 		link_codec: simple-audio-card,codec {
-			sound-dai = <&codec>;
+			sound-dai = <&codec 0>;
 		};
 	};
 
@@ -238,7 +238,7 @@ dai: dai@1c22c00 {
 		};
 
 		codec: codec@1c22e00 {
-			#sound-dai-cells = <0>;
+			#sound-dai-cells = <1>;
 			compatible = "allwinner,sun8i-a33-codec";
 			reg = <0x01c22e00 0x400>;
 			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.26.2

