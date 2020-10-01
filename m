Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DA027F7E5
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:17:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 322291680;
	Thu,  1 Oct 2020 04:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 322291680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601518657;
	bh=w2QWlRiEzYqqrQIjYptCzliGnxhnwTsh6/3Ivea6dbk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fy8PrMj612hfdlzmRy5ocN06vzbQSVGvY1EC/uE+K7af7GXCVeghdOw9q0W5b7AhS
	 FQ7gPF8L3vv99p4Udk+LjbEL9PM8x4C/TyLyQy0IOeTN9jc812r3EJBOayWBDhd7f4
	 0QP5jsMd68BmVn51LUVkFxUrcn+cQENjczOxTjZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22C1BF802DF;
	Thu,  1 Oct 2020 04:12:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25E5FF80323; Thu,  1 Oct 2020 04:12:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0036F8022D
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0036F8022D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="mPaarXF8"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="JJzqrXNX"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id C948C580325;
 Wed, 30 Sep 2020 22:11:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=NSmhqV0mmdPNs
 m8wsirGm6E7M0NDVR5Is3lE3Iwkiks=; b=mPaarXF8nE3/c5b4a4ZlpbeBiCHYA
 MGvoS3kmSrPM23eq3Qc2uXTYODFttE0xuX9YfOrUjCLPUf1Bb9dXzGCPks87HlDI
 vVokQUrTnpQUmL1ax27ENxq0lePnCx/celdadlyo9Ucwlaz2GqvHCB8MnMZ1kEPm
 FFeR6ZJ8Y2zZnnld7O72OZKQa865LmTuvWaFHCXXAMGoJQj+mr3IOW6jqtJARCgc
 5kmETlBw2VAMVbI3UET4cwtYZkrUlMJHE05owSaZfP5mssSqiCrcCnC13GJHyhhx
 TfmSndem2WLOVD/AGTCwDXgxztXJd8uv2PUlruoKeaqla5b69jgeQRPZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=NSmhqV0mmdPNsm8wsirGm6E7M0NDVR5Is3lE3Iwkiks=; b=JJzqrXNX
 E+sOpyWwQvdM2rCzzbBJZBsHxp5Ed6IkRwZ52C8U7mvdgSChVEdZvWEYxEk7iyNs
 zZnU65lLXyvz0w+cS6jU+qgdj+FWXddvol8ejiYQ91mQC24PeBWWWF80Zdl+sQQO
 wLuo5su//BtXMUVb915O9Ewa1qLpqjiSrF1Biz3+eipUc+08Vog6siUdlmUoCo3O
 dJ+C6BIfjjY/URHu5TqSAIFm3Wly9tjvsIlZrrakMJsCu4biu4eWMlIyHeOOuzRw
 S54y+vbc4b8jbFB3DD3AEoM9OKu7m3fTrdM9YpGFDU451kLckgtxFVqbMNWQ/eGy
 y1PxF0MVWBAlSA==
X-ME-Sender: <xms:6Tp1X8JMpKPc64Vd7mHI_LF35nI72T66J44at7gvHOD6SlMhrEj8AA>
 <xme:6Tp1X8IWuZBWkUKi-saVWNfHbKKHXcv4KvOLOUspsXXlnmTx7DKfIPWQkP6XJA2qJ
 FrTzs6w-iHBCtIr9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:6Tp1X8tUeRelrf7E5mmhF8CpilM2mnBCVtNlVHrXQnslBjv8OXDo1Q>
 <xmx:6Tp1X5bo3nof-8x23NF0rSFuqPEZJXF0wxMXD9wj7yHqX1BVYGgIwg>
 <xmx:6Tp1XzaQa1BTCwBG-4vJ504eadw7iGC8JOUnsMRTueiuHeXuEvY1lA>
 <xmx:6Tp1XxMGI6xRE7cmx2VsdWhvC66Z7YLdcbzDLA2t4cXt1PY2TljdAw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1ADA03064682;
 Wed, 30 Sep 2020 22:11:53 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 08/25] ASoC: sun8i-codec: Use snd_soc_dai_get_drvdata
Date: Wed, 30 Sep 2020 21:11:31 -0500
Message-Id: <20201001021148.15852-9-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201001021148.15852-1-samuel@sholland.org>
References: <20201001021148.15852-1-samuel@sholland.org>
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

Remove a level of indirection by getting the device directly from the
passed-in struct snd_soc_dai, instead of going through its component.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 578c0c0e6330..7590c4b04d14 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -162,17 +162,17 @@ static int sun8i_codec_get_hw_rate(struct snd_pcm_hw_params *params)
 		return 0xa;
 	default:
 		return -EINVAL;
 	}
 }
 
 static int sun8i_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
-	struct sun8i_codec *scodec = snd_soc_component_get_drvdata(dai->component);
+	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
 	u32 value;
 
 	/* clock masters */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS: /* Codec slave, DAI master */
 		value = 0x1;
 		break;
 	case SND_SOC_DAIFMT_CBM_CFM: /* Codec Master, DAI slave */
@@ -294,17 +294,17 @@ static int sun8i_codec_get_lrck_div(unsigned int channels,
 
 	return ilog2(div) - 4;
 }
 
 static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params,
 				 struct snd_soc_dai *dai)
 {
-	struct sun8i_codec *scodec = snd_soc_component_get_drvdata(dai->component);
+	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
 	int sample_rate, lrck_div;
 	u8 bclk_div;
 
 	/*
 	 * The CPU DAI handles only a sample of 16 bits. Configure the
 	 * codec to handle this type of sample resolution.
 	 */
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-- 
2.26.2

