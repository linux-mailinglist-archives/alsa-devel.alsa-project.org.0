Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 502B7257275
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 05:51:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06435181D;
	Mon, 31 Aug 2020 05:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06435181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598845898;
	bh=LM/A5KUPHjMvGZ4UBdNrwL0HGCQRsFz6kdcRQ7YSzQ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nde+eRTJK5fXDGJg6G1OaUX02IS0tjqH7XFUxVg2IaDD8meFL/5D2ZR1eH+hfzL82
	 0YPi/86Z0ZJ+4xn4KfYsqfw+SE9ssd1NRP8ZNF3OFFiFESc2RVSlw/j0vS/5cmoIlu
	 EqeePHsqZ4nLDQF2ccLvWSoAoGphuIB8MtJ7u7SM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDB81F8026F;
	Mon, 31 Aug 2020 05:49:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5353BF802BC; Mon, 31 Aug 2020 05:49:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 946B7F80257
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 05:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 946B7F80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="Fia0eJvK"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="MPUht6zR"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id DC72C58054F;
 Sun, 30 Aug 2020 23:48:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 30 Aug 2020 23:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=wD7ZfrlNaMxZt
 s/5UJZ3RuMQ+EnJabMvQzkgcOJiW2A=; b=Fia0eJvKRfDaz+g3P7iLlmuTAj8mK
 9fuqR0YfWAOarVXuiZuo3B+c7Tvk5IwSbLkd9jkY1Y3iECdiyK0KmdyHPM+Saq0q
 t/KvK0Yq4fsXAJ+6JSsv9pNm6S+JGEMVPpDq4A8rAOnUZQiggssVm91KyoRcSt3C
 O7J63OsSCzmtpAlmPX1n2Tgv5S/FmZ8eE59z3Kn49NzmHWeIKWbCblwW4Jj5vLn3
 YpVClQVnZi38zSMYuFI9X0T4P9H2TFMQJIGUrKv73JsIQ0U+y2ZTLeQQJMhY5p7h
 6CXGHXKMVJFSCF7EOVMaAu3VLXGJvzzitdulKAabX2hygJhnKJ7KuzZ+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=wD7ZfrlNaMxZts/5UJZ3RuMQ+EnJabMvQzkgcOJiW2A=; b=MPUht6zR
 EgxQliNNuoYSlEhBvyrEy6TPSwYbQLT5TfPxTMVXx5ljNvwNl/Nb97RmelhH26je
 i5hnEXowAb8yseHVSEEX+FO5jcPhLDjMHFL5/JXJTNSbypRIQ74Ll+A8LVLy5gTb
 Cym6UZtv6Ik6K6rYLwDCw3Vvm322fE+EcWB2IbNq2kVy3Ceb540gzxia+j6JaP95
 GTlWEs4AqlwqiBu/ZVUrAmDFztpnfB3dXoZ918PTUasOYGX31LAduAeAmHR5f5sz
 6fhAZpwjfY5k6hh7IybaVYgTVtbcQ95a5ig2V22VeBu9hFTKas42Ro0HJkcTBceg
 roMj0lHiTxEv7w==
X-ME-Sender: <xms:J3NMX-iLpPkfzYu0ndT09Qyjzxj7aHdGVuWHJbcEBYtQwE8JmS-ShA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefgedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgepudenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:J3NMX_AdmJJhOW2UdMYezQ_B_zagWBTUQa8w9jSBNxXJ9XG8ypHttA>
 <xmx:J3NMX2G3SsbwRYVostrkjHWNivNxKjGjYAMWPnfdnjgO5MNPMXc6DA>
 <xmx:J3NMX3Sm4P76JzyyF7igO7OtWyhqjiElS26bxHtDtwWgfMs2LG5nBQ>
 <xmx:J3NMXywEBewCBt7Vz7DA1yon8oCZ06s8KoqqcWiKDH0ynaXn77lVdA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4D00A3280064;
 Sun, 30 Aug 2020 23:48:55 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/9] ASoC: sun8i-codec: Fix AIF1_ADCDAT_CTRL field names
Date: Sun, 30 Aug 2020 22:48:46 -0500
Message-Id: <20200831034852.18841-4-samuel@sholland.org>
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

They are controlling "AD0" (AIF1 slot 0 ADC), not "DA0".

Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 263c1e7c3cc2..68c8edae9084 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -49,8 +49,8 @@
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_16		(1 << 4)
 #define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT		2
 #define SUN8I_AIF1_ADCDAT_CTRL				0x044
-#define SUN8I_AIF1_ADCDAT_CTRL_AIF1_DA0L_ENA		15
-#define SUN8I_AIF1_ADCDAT_CTRL_AIF1_DA0R_ENA		14
+#define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA		15
+#define SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA		14
 #define SUN8I_AIF1_DACDAT_CTRL				0x048
 #define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0L_ENA		15
 #define SUN8I_AIF1_DACDAT_CTRL_AIF1_DA0R_ENA		14
@@ -407,10 +407,10 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	/* AIF "ADC" Outputs */
 	SND_SOC_DAPM_AIF_IN("AIF1 AD0L", "Capture", 0,
 			    SUN8I_AIF1_ADCDAT_CTRL,
-			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_DA0L_ENA, 0),
+			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0L_ENA, 0),
 	SND_SOC_DAPM_AIF_IN("AIF1 AD0R", "Capture", 0,
 			    SUN8I_AIF1_ADCDAT_CTRL,
-			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_DA0R_ENA, 0),
+			    SUN8I_AIF1_ADCDAT_CTRL_AIF1_AD0R_ENA, 0),
 
 	/* ADC Inputs (connected to analog codec DAPM context) */
 	SND_SOC_DAPM_ADC("ADCL", NULL, SND_SOC_NOPM, 0, 0),
-- 
2.26.2

