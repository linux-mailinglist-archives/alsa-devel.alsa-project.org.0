Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93104160B11
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:49:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AAA91689;
	Mon, 17 Feb 2020 07:49:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AAA91689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922193;
	bh=xOV3rztKhYBkWI2ePpG7Fs9nYRJQCxaGPB0drVce/QI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kHsX8EExBybyw/qr+c9r4P5t2DGP55zO33S54gs0+qcmHh+QqlefunysPETjXd0B7
	 2tufZMSEtmV4jsuY4ifjzBLaSzgv+K5OJxuYLX4Y4TsXT+QuzJ4f0Adg0/8is/ZR5R
	 AGVghxDzsIjx9cQlz1eHyaUhfcA88wREAfCXayko=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E6C6F8028F;
	Mon, 17 Feb 2020 07:43:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80C25F802DB; Mon, 17 Feb 2020 07:43:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BD4AF80277
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:42:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BD4AF80277
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="u3/G47gG"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="e5iBbcJH"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id BA4DE5232;
 Mon, 17 Feb 2020 01:42:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:42:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=gQog3OlsgbAsZ
 oLI+7srNygrqMavGsdiz3aPBAseJDU=; b=u3/G47gGQc2OcFGLR6Z943suj10dP
 2awt9rhUf0OXIvckkiO/1eKKXwIXwX4/a1sxwuPDLUCcvHjp/A/L8eBR0EJcrjyH
 V8Y/jWmeY6wQN3KYLpDnAVjjAJl0izK+CqcQToAEMEJiolkpztrh2GxheA/+Nv2n
 B3vQXz9hiUlt1SdwInsx4nALN4Php+jvqbZyQ/bWbCwIpYZbIgcXC2zD95gnB2en
 h2ZjQVlEM54Xv/Ip9plM0rKs+fqZ8NESeRgZMbyxN1sWSS6tGpgsm3e3Lt1APZ02
 1F6dGCDA2twKVw6WkWxPcV/PjrAQoaoviFw447Dm8Omy005SZmEp6y11Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=gQog3OlsgbAsZoLI+7srNygrqMavGsdiz3aPBAseJDU=; b=e5iBbcJH
 IOAg9pVnocAPi6Sp8i0kx74fJsqeNs+m5vYL8YhdQkcT16sejyy/knoZ6jIjr6L9
 eStJA2Z8YsEU9M8sUbHD+uwFbamymGLKcDOnEwW+i6taWq5QPYpAOhG25YCLepia
 BMiVzqSwsbuf97uLJ9zwNuQep3NB3xMZOgHsmHDzFXJSjnhB4zz8xKyiZW5rQ0+U
 5eEjRWs8DMSFgJnHDNIlBHYftYq2dm0bp/oVon7466XcygsECgrAaAVpR2ON2Y/U
 5JXUPu3/BKDZkP3tGnwtDujxQTSm5/ZeQxMXgL53dHcCcuesp+q484kETOR5swJa
 ItoaAcLmkM0edQ==
X-ME-Sender: <xms:8jVKXuQmi8WsaVVubwPEj6CNm7lba6kG47PQZNxu5xekAssIY1l52g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:8jVKXiOE8VBa7iCQyks4ezIEgJ92NqvqQLUwGH4OWim9WojisX2TpQ>
 <xmx:8jVKXudkoM3216rtbn1l4mHCP66Kqjl5arGzptKYw7a0QtABtVLeNg>
 <xmx:8jVKXlWWWwmoeg2LuRuTRzcSmVpQk79P1JBDLkLIUmccjXWLB6pTvA>
 <xmx:8jVKXvvOSXyCkl1AFqItQpJgmVl6iO9dLrau2FwI9-T0nBWus2w4MQ>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0985D328005A;
 Mon, 17 Feb 2020 01:42:58 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:28 -0600
Message-Id: <20200217064250.15516-13-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 12/34] ASoC: sun8i-codec: Fix AIF1 MODCLK
	widget name
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

It should be "AIF1", not "AFI1".

Fixes: 36c684936fae ("ASoC: Add sun8i digital audio codec")
Fixes: eda85d1fee05 ("ASoC: sun8i-codec: Add ADC support for a33")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 3d5ed2f4575a..03cfe4e17ff7 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -430,7 +430,7 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_PGA("ADC Right", SND_SOC_NOPM, 0, 0, NULL, 0),
 
 	/* Clocks */
-	SND_SOC_DAPM_SUPPLY("MODCLK AFI1", SUN8I_MOD_CLK_ENA,
+	SND_SOC_DAPM_SUPPLY("MODCLK AIF1", SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_AIF1, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("MODCLK DAC", SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_DAC, 0, NULL, 0),
@@ -461,9 +461,9 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	{ "AIF1", NULL, "SYSCLK AIF1" },
 	{ "AIF1 PLL", NULL, "AIF1" },
 	{ "RST AIF1", NULL, "AIF1 PLL" },
-	{ "MODCLK AFI1", NULL, "RST AIF1" },
-	{ "DAC", NULL, "MODCLK AFI1" },
-	{ "ADC", NULL, "MODCLK AFI1" },
+	{ "MODCLK AIF1", NULL, "RST AIF1" },
+	{ "DAC", NULL, "MODCLK AIF1" },
+	{ "ADC", NULL, "MODCLK AIF1" },
 
 	{ "RST DAC", NULL, "SYSCLK" },
 	{ "MODCLK DAC", NULL, "RST DAC" },
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
