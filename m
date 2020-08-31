Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B010025727A
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 05:53:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F7A517D2;
	Mon, 31 Aug 2020 05:52:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F7A517D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598845998;
	bh=uwfLZ8laDE/9hUmwo0sablq4oQKuNUjMsYPMyaB0ezo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HUzmq+yMmrGruFh4FhmtX5W3K6ZnN1Zaq3umK/g72KCwWdgHG+mKwzv2S8M6iJrMQ
	 VCJewb55/QVZI/xVI+LUWXCWygxFRiC3/a6ABMPUDd9zJMSaAeU1lWRQJOBTrpHmoZ
	 kWO25C3g1obMApJzkBmVtFkigyRDr2jD85kVltmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FAA9F802DC;
	Mon, 31 Aug 2020 05:49:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82672F802BC; Mon, 31 Aug 2020 05:49:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BE79F80146
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 05:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BE79F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="TgYql2bk"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="A2lTzgG7"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D2FC0580544;
 Sun, 30 Aug 2020 23:48:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 30 Aug 2020 23:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=M0CdV6kHU/iX2
 H9POhKaJG2gciwsmAXpW0BjK/sUQO4=; b=TgYql2bk0GGBYtG0ReW0PxVoQZQMY
 ZCezA7GNb/AJEP16ZApl8+FrnpDWeGBrFVsqx5vcfdpe/hmpW97Wk29otX6S/P8E
 pt0zDm/n+YTXXncySyvRa5R5Jc1/UQkFUw+eYeFuNTCY/W2Z2R5J0Tu+CHXYNh8C
 z4wA7hP2cXDlDtR/2pDxKjRQUMemOj4ZfPKKrctKama58l/iIvIOOg5keI4TRlQV
 SoicAEws7VhKoeORTKrWIXwRZXLPwKo5NG5NYwmEIguZGyV8rTtEuzwaxkoJWVh2
 CeXT1Hp2oFY1WaKK+LKLLHdDphq0rsRtMjP32NemuAMUrzphlb/a7+BOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=M0CdV6kHU/iX2H9POhKaJG2gciwsmAXpW0BjK/sUQO4=; b=A2lTzgG7
 KUKWFXbhDTzRIrXxqZgZeqgB/N4+Q/mNHM40huBmY1N/bUZBaYk0+veHrBnVVMQW
 RnlMqHD28/3iBPMv3Y/OUCNq2NBgSnaw3dTZ6Y7Iaqufppek5pgjm3xVef/TGmTU
 fMnVqoIrPHJTUuAmGrKLSOi59+yFsVlfY8CqO8UkbjDROAyginyad2gjiIchnyfA
 ay8dAGAkqw0yjH0WEzejp7RAk7ZEUOfGU3FVlxzzTlmDyn2FT8H7r0jtrvVubuYQ
 Bb5HS/4eINc43NCUiul2/JSLt6g0nIRWEoobPIY+cuC6f5b5WbfR1fLfqkMKObMd
 XcFmhHG5XBKllw==
X-ME-Sender: <xms:JnNMXx7XVcWiPVW-HJQPqhUGdqLpaEVi5sJkuGhtjr1WxaLM9cB1rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefgedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:JnNMX-6nb8Bn7nX1m92MaIHUT2K6WcjHwYlwvlJen2BjD1Px4lXNrw>
 <xmx:JnNMX4esMms5601H4gVBr2f3OusumfxJzDGBzDz-2wiJJPROq62Eug>
 <xmx:JnNMX6Ir7I7yhssdMIudY25PbGLHnfUVwb3Ry0WLOdHrvOjwgkKe5Q>
 <xmx:J3NMX6oJ6wVHN7wtgNPhmsp-JopcMcq3_o0Itcpr13GQugbFMGMviw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 61C693280059;
 Sun, 30 Aug 2020 23:48:54 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/9] ASoC: sun8i-codec: Remove extraneous widgets
Date: Sun, 30 Aug 2020 22:48:44 -0500
Message-Id: <20200831034852.18841-2-samuel@sholland.org>
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

This driver is for the digital part of the codec only. The analog part,
including the microphone inputs, is managed by a separate driver. These
widgets look like they were copied from sun4i-codec. Since they do not
perform any function in this driver, remove them.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index e3a1347d7ecd..52ef0f9ec79e 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -455,10 +455,6 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 			    SUN8I_MOD_RST_CTL_DAC, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("RST ADC", SUN8I_MOD_RST_CTL,
 			    SUN8I_MOD_RST_CTL_ADC, 0, NULL, 0),
-
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_MIC("Mic", NULL),
-
 };
 
 static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
-- 
2.26.2

