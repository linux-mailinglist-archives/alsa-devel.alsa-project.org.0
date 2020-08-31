Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAD225727B
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 05:53:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CD3A1823;
	Mon, 31 Aug 2020 05:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CD3A1823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598846012;
	bh=3NxO5/NNaWj1+XtsLLyhW8JVsBN5d4D8fK6plj9VPNo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JBUb6L6OY9ib466O4SGhZA5xKP3sD1nuCDZt4rs2iiQe5vnXR+KA2yynvW8sq+1Dk
	 TxVg8RkoMBvHnLHEldnxxtek2RgxhOa0+aG8xombrrAY7MZ3Q/wnKnpPpNzgImdAuY
	 kcwFvmMpSJnmJJZwXYoyQlcbBRIOptXTZVDtSBsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFE81F802E1;
	Mon, 31 Aug 2020 05:49:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 788C9F802C3; Mon, 31 Aug 2020 05:49:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A116F80268
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 05:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A116F80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="mlqoTRer"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="fu5oDI6y"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id CD773580558;
 Sun, 30 Aug 2020 23:48:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 30 Aug 2020 23:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=NZapUfYA/Qz05
 eU6LA5tx5U02wk9kjpadYmiPX7qnRI=; b=mlqoTRerv6VOfCEWdjwZrK5aD2wWi
 iQOYZewHVIgNlheZNtyjnEzcSYOU1Z1E1ta8IYihmizrWKZHHrcJnAQE+1n6158S
 gkGkLSs0wUNe20r8ZC2zONG/cr0sil/MNxn7P1jZjP6bk3vGAgEzghlX6lJSaR+9
 YmSOpW3wIBWJESZBzj7ovXV6kKTnrzReZcwxDIgQ4m/1L5aWLGeif07W1jlPob+z
 LM5By3d0mgUECO5KVVPC1RIWI3Q2o2pXD5xYSS6Kn7dM34r19XMhfXhVvhWggSPN
 ZBHGXGzFrOSM211VVbXM8BxTJb+6i2GbZG3S3AtKWqFWDD1hA09HlKLww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=NZapUfYA/Qz05eU6LA5tx5U02wk9kjpadYmiPX7qnRI=; b=fu5oDI6y
 m+EQ4EiZGzZqyBkTJlpHqN5Yy6hSIhrSHFrEZ6PUwemsu7NNxq00voRSnE7uJXCT
 ezTYIZB9UjsGkGoYHaqiHzSsyuMczHNtGxvUecnptzn6amyR/iOk3hSjsJvbamWF
 PW+tn01YZt+sEvGfGw6hGl4cT5u2rbLwgLJJ4AW0uepEgdjJiFpAKtyq2RoHthe/
 H6orlHnE99LltPeMR5/gYfIhuFuPQg4yZwnsTOnbbEfk3FcBZjtatu4/cKuooPLs
 z0FncuMRSTfCB3ySxuYGE9sYoqP4NGFVDmcl6/H+exTIsU7hIOr6LylEdEJoPLAj
 ZRo0LdgnGjgs4A==
X-ME-Sender: <xms:KHNMX7ESSoR15zDjL6jLIAMrxscHtKKCN3UZj1w7pEyobeabQhtJFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefgedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgepudenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:KHNMX4UXd-HyaelcGF0jJMHEKckdFg9plR-EUFcnNvGAsjTC6siDtg>
 <xmx:KHNMX9LZ0vq8fssfBFc8pEZicsj8fwgBVSWWTR4Pdk5NnsXaUwRZSA>
 <xmx:KHNMX5HW9GmHpmk3H6GRnSFK2rPBB3NjZmRZln_6IKx09j5G74Xg0A>
 <xmx:KHNMXwGNGahwXukEh5iqL9Hjt6-PTeAKHLlVdqCJjHyxyJ7qkPJb6g>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 397E2328005D;
 Sun, 30 Aug 2020 23:48:56 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 5/9] ASoC: sun8i-codec: Fix ADC_DIG_CTRL field name
Date: Sun, 30 Aug 2020 22:48:48 -0500
Message-Id: <20200831034852.18841-6-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200831034852.18841-1-samuel@sholland.org>
References: <20200831034852.18841-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
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

This is the enable bit for the "AD"C, not the "DA"C.

Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index def3a0059c3d..4218a00a9aba 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -64,7 +64,7 @@
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_ADCR		9
 #define SUN8I_AIF1_MXR_SRC_AD0R_MXR_SRC_AIF2DACL	8
 #define SUN8I_ADC_DIG_CTRL				0x100
-#define SUN8I_ADC_DIG_CTRL_ENDA			15
+#define SUN8I_ADC_DIG_CTRL_ENAD				15
 #define SUN8I_ADC_DIG_CTRL_ADOUT_DTS			2
 #define SUN8I_ADC_DIG_CTRL_ADOUT_DLY			1
 #define SUN8I_DAC_DIG_CTRL				0x120
@@ -393,7 +393,7 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	/* Digital parts of the DACs and ADC */
 	SND_SOC_DAPM_SUPPLY("DAC", SUN8I_DAC_DIG_CTRL, SUN8I_DAC_DIG_CTRL_ENDA,
 			    0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("ADC", SUN8I_ADC_DIG_CTRL, SUN8I_ADC_DIG_CTRL_ENDA,
+	SND_SOC_DAPM_SUPPLY("ADC", SUN8I_ADC_DIG_CTRL, SUN8I_ADC_DIG_CTRL_ENAD,
 			    0, NULL, 0),
 
 	/* AIF "DAC" Inputs */
-- 
2.26.2

