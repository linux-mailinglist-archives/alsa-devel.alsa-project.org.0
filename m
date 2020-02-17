Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E961160B20
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:52:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E6C516A4;
	Mon, 17 Feb 2020 07:51:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E6C516A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922341;
	bh=F8OX6nBbvXJP2ACnLyACie4ljDz4iSa7V1NKemYsvYQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JDDIHyhOtbKRiJpE2nwrYACYQF+F9oKBZoYbzRTBLorUNH0NhQHfG+h/AU7vJeQ4z
	 5OvpQThxKSDV/7W+YVOCNWxEFeWjx5RStK0LoxwKeXQ8L2upYP68pGLeFmWdEL89Mb
	 R9xqbqYb9r2g+8C9oktw1ix+v46EHXebh6PqAzLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32AAAF8025F;
	Mon, 17 Feb 2020 07:43:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE662F802E0; Mon, 17 Feb 2020 07:43:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4FEAF80278
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:42:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4FEAF80278
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="rA0TWI3a"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="AlfQlKZV"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 24A6151E1;
 Mon, 17 Feb 2020 01:42:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:42:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=p9ksJoRp95f7P
 lFbHwIyRMPpDKeA8eop3QczTiTwM5I=; b=rA0TWI3a7YFet8EoCuVsI860z8I+E
 SUNvecqs39KS3JIqqi4RPpfstCl9Iu0k0P0q2gD+P370ar9as8z7XTME/yXhIf0o
 0Pz3ifUxbqWnK+BILkTy2G+vAwMuTOaTptOmGT3NfPRJsKC7oe90DAYixPMoFcZ4
 GSeMwwiv30gl01gdhxiIj1k7zFrQTdoNf4vWQH4MVfwhLxLv5vVvwRqEyLkhsYg5
 e/CMCVuWb0U4WkpEbnmyTN4xGsrFOc0q38nJCjdtDbdhF/F5wdowWQQe76XC3BSa
 u97lrGQaqg62vw8uTIS8242pggrnupimDn1pVK4JfhXMSrdiGijCa1fkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=p9ksJoRp95f7PlFbHwIyRMPpDKeA8eop3QczTiTwM5I=; b=AlfQlKZV
 qcRoroqJR4iTVy4z9ZXqbfLjezcInYcOwoGHcanXsBb6P4+ojJrWStsrkWvOe12a
 1CuXUnSPXaJfpYNRxjzmGfcLUwlhL+spH4EcgvN8gv9Xc1jILUJRysrfTRFSr0xI
 0AghczMyxRXG+HAsmNhla3yUAdwnZVOmcvdvEUh0BRaekNipf4hM9b7S2t1uw4PG
 oN3aq68Eeo2CdCGC8gglEsRmFudh+9OFvwwhhNIFzMunWdxDi0H4I56lkLHWSNCK
 HJEhz9rA8VBM8Ex1CUoZ/GXW5HvuWdwP1KR8TYEKb5et1QhXCQ6R/Kj/IRMHPLDf
 GZvIzJmUZUBaKA==
X-ME-Sender: <xms:8jVKXuK9HKg9G6WO2NREAqZOPZCX8hmCXdNeEnTVWwRYWpEtp-R08Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:8jVKXvh2bpMMC8HC_kQnNmyw7Lm3xPXPyJE7f3uUA8Igk4vsn8qSEQ>
 <xmx:8jVKXn32rdAvcrLynx_oIv794La04keS7WNjTjRV7-oN9eGE76TCbw>
 <xmx:8jVKXmZvnwHAVVAjFGhKULDsskpS2SfDCpFese_5F_hfq-cLyFGkpg>
 <xmx:8jVKXsaWB5rtxRbfRjy0WwXVusYWIB3S3_-jHErYgoffgIJ_6DLQJg>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 69ECA3280059;
 Mon, 17 Feb 2020 01:42:57 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:27 -0600
Message-Id: <20200217064250.15516-12-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 11/34] ASoC: sun8i-codec: Enforce parameter
	symmetry
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

Each of the codec's DAIs has a single set of parameters for its clock,
channels, and word size. If both capture and playback are active on a
single DAI, they must use compatible parameters. Set the symmetric_*
flags in the DAI driver to enforce this.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index bf12f5199e96..3d5ed2f4575a 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -534,6 +534,9 @@ static struct snd_soc_dai_driver sun8i_codec_dai = {
 	},
 	/* pcm operations */
 	.ops = &sun8i_codec_dai_ops,
+	.symmetric_rates = 1,
+	.symmetric_channels = 1,
+	.symmetric_samplebits = 1,
 };
 
 static const struct snd_soc_component_driver sun8i_soc_component = {
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
