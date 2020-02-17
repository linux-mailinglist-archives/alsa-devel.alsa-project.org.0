Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0916160B02
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:47:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78CB1167B;
	Mon, 17 Feb 2020 07:46:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78CB1167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922026;
	bh=E2Ql5p4qVDDvCgpSxS/fNYWBIQAA+pIDe1MJp5YgQQA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l3etbuzwiD8/5H3fnumaG3GBoj45709QVR0mDnhoWO565xSVAw00WMfoTT8vEZjnO
	 WuIDLfUhFueZlkRqSnmY6RbyBEdOZAVLv5a2ZR1ZAZL84xQsD27wvvlwfGMbIjM7vc
	 1XxHans3tOuYgg8D5U0s50Rvb/AyJXIuKnlBZ7Ik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 232D7F802DB;
	Mon, 17 Feb 2020 07:43:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B35C0F80291; Mon, 17 Feb 2020 07:43:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74275F8015E
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:42:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74275F8015E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="psCa0Hxd"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="2dS9ELpa"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1E2255240;
 Mon, 17 Feb 2020 01:42:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:42:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=r9qw/nKFT7h3C
 F2EI4aVoHWBErIwiJXiG/+XUz7NId0=; b=psCa0HxdSMOtcyUtvAVU/8dwXjJSC
 kwZIQ8hnHQ8uUUdnZv3iNQyNWe0ZfOOI6N2839Po9LHLhHKNv/YdKWCLLwOFJdcp
 qU0N1/JU9rHUCq3O/c2rzEv59XGMFuzqrPcuml+NaX9rfUSU3QiOGeofVcZUz/Pu
 sS4VhBvL9uGMj+gODat9acPrEfIR5Vlo+cukHnxOv8QiTC1FQo9m1Kba22w3Ob9q
 ALt0PH5tJ1sVEP5UrQfo60YGjxLFsgHGCTZ+8pXE5VtIPd8YOACEjpGH2qAE22iQ
 q6BhXAJzsS9kQ5iSf0XJAxkMyFsfTPqrQimuL57AX5gGw0e5CKI+N6u7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=r9qw/nKFT7h3CF2EI4aVoHWBErIwiJXiG/+XUz7NId0=; b=2dS9ELpa
 a/N5GVgP4448lAQhrrXrX+YCgkqvHZfxFVxWkgFgxU+bdT4AOPVRNj3ycRzXgNzt
 iX13EsracU5/O73bRdJGLfRy5Y8oSUOzAFZMA2B3a3QM0aaUrgH5bIh5MdfdOYMY
 mh61QaeHUFSrD6uOdribCuuqoKp0Pwzmr5LqYodi85xbPm6NSkEZCFLNjzrK+8SP
 z9OLlg5OfOW43NQXxzbSiY+m6k30CnA925NXIijGbSKhUyY7xwPfxIIG9I4Nax8L
 ZVQ5DHzBhOPnqnkpHnRVsyeLsyhhDhI/l4tBwy9J5R3tDlzT/m6xP8jQdaFaKqfO
 /bEbQUyhBrbAWg==
X-ME-Sender: <xms:7DVKXus6wJBVzpOsgZM_-qtAcfOu_sHF49BNZIHRkrKEAmkhj9UwRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:7TVKXnstkRKkmOhbeuYLfvoPWehdhl3bfFLkmGLPedTvT1wBTSXSig>
 <xmx:7TVKXkzMu6_NMbp6gwU_CRajzjM2vqGFrwZ18TU2pkOPqNY_oJT3Ig>
 <xmx:7TVKXthNkdnKzeAHPMQj2KUBw5vzdeL_EfLk-z-fu5LI9RCgirbi9A>
 <xmx:7TVKXhVor5h4xU6Yu9GB4gmxD54qw6LgmdZF2tL6Ew5nYh--aT3MNg>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 578F23280059;
 Mon, 17 Feb 2020 01:42:52 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:19 -0600
Message-Id: <20200217064250.15516-4-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 stable@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [RFC PATCH 03/34] arm64: dts: allwinner: a64: Fix the
	audio codec compatible
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Some differences were found between the A33 codec and the A64 codec,
causing the left and right channels to be swapped. To fix this, a new
compatible was added for the A64 variant of the codec. Update the A64
DTS to use the correct compatible.

Cc: stable@kernel.org
Fixes: ec4a95409d5c ("arm64: dts: allwinner: a64: add nodes necessary for analog sound support")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 27e48234f1c2..6d7aa1736d21 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -802,7 +802,7 @@ dai: dai@1c22c00 {
 
 		codec: codec@1c22e00 {
 			#sound-dai-cells = <0>;
-			compatible = "allwinner,sun8i-a33-codec";
+			compatible = "allwinner,sun50i-a64-codec";
 			reg = <0x01c22e00 0x600>;
 			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_CODEC>, <&ccu CLK_AC_DIG>;
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
