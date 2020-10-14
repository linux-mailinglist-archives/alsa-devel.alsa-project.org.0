Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061128D9FE
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 08:27:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85EC31718;
	Wed, 14 Oct 2020 08:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85EC31718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602656869;
	bh=C5gWucRtuO/ByBPrm7IkWq2hc28raamoTuiCFGzc5PQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TK8fI01FyRgBZ3NhA41ExqURc0hyr+wbF0sNxvUfu5aZKuK7dKpcdTf7mOiT8Wobv
	 e4fDfXQRZRawJ3Mvt7OX81+64piznUZv115AibspcP+DdwpsG7Yk0t4EZgHi1MJlPa
	 e1zo9H/U76u/PS4dXs9YO5HBqqKVG9UA2haX7/i0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7783EF8033D;
	Wed, 14 Oct 2020 08:20:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA451F80316; Wed, 14 Oct 2020 08:20:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14287F8026D
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 08:19:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14287F8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="Gsq9LiqG"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iK9mCOSZ"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id A7414D2D;
 Wed, 14 Oct 2020 02:19:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 14 Oct 2020 02:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=DGLr7bNbfoVCw
 JHmpati3EYRUVdebC9nlRUoCQRz+DE=; b=Gsq9LiqGIJSnmBLWEr/CN8Ruvpchh
 C5bpi7Ld05mew8mQqLuEK9kTw54ag1Yw5khQe299PzpWbWTTqD6HtMyZYEL4OrSO
 dtqYk2rdjeVAXgHkN9Jmp4BPH/pWBELy+ZACCmjjEaWTNTj67vFQhhJW8LoQEBig
 LYAG4CESwDCHVP/JHdc4RPL7CO0OW4uie+zRa1gT1WdguEcTYXdFhGBQfH7SNvC3
 jbXzJsAvsCvPCWIltZdTeujzSzlrOMXn0fRC8N9Ompsb1L/GUac3Kz1515zYMvwP
 M6mkXeH/sU9R3Z5skFb/iF1vdok/Hw4zGmPV7LIB3hkdkAipVQVsjsuFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=DGLr7bNbfoVCwJHmpati3EYRUVdebC9nlRUoCQRz+DE=; b=iK9mCOSZ
 RpFLNT2RmSNCRWUdjA+R398luSHZ16qqo1gBdjq4KVY7Y0amf6MnSvKnF6jjOCb3
 rAjr/vLwZiUW0OqWHgs6prX7g+b7hcs/VxBhUdXr20Pmad2JpAIO7ihmlXw13YZe
 Jc13aEwBK2PEDfK9KkOEgcZk+CpoA8gXrhitAvjtim21pg3Fa5lba625s9YXEshV
 ZdzEgUy1xxpcGJ/pHasjmnmls9xWOwNnGdomoIV+GhBamshEMeJalkNB0k3LJskJ
 f3arY/ByCXc8Pa4JYnxVMPRl4WvrFdAezP9GvDOBkIN4en3Z+S3JScoK65knhk+n
 JRtrDK467RAxow==
X-ME-Sender: <xms:hJiGX1HoRsY24If-ObsZjWWch7tOmHe3D2gvMljwMcfCSGhev8YbFw>
 <xme:hJiGX6XMi9H03wn_zspkH40wXf-mi6cFl0iKZbmou6DON9UrL-L5_NG8uzCHiHDOU
 cLjArjS8yu1qEjmYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedriedtgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgepjeenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:hJiGX3K43od1ZyLrN2n8luSa9nYPY0Gy6DtY_dxgioyU_RQQJUjnow>
 <xmx:hJiGX7Fghh2MYvC3YkNaIVrjsE9O0yQcI1immdhLDz0BXZzyhY4X8A>
 <xmx:hJiGX7X1hSoZdWHYwtL0eQVx88RXyQQdhP6U66YGF6Da_syk4RHp_Q>
 <xmx:hJiGX3qhVMhkJzenEUA_V-ytXkVMpFWKIr8q0u99Slwr0o-FzsUPoJGEn0s>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 86EB53280060;
 Wed, 14 Oct 2020 02:19:47 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 12/17] ASoC: sun8i-codec: Protect the clock rate while
 streams are open
Date: Wed, 14 Oct 2020 01:19:36 -0500
Message-Id: <20201014061941.4306-13-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014061941.4306-1-samuel@sholland.org>
References: <20201014061941.4306-1-samuel@sholland.org>
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

The codec's clock input is shared among all AIFs, and shared with other
audio-related hardware in the SoC, including I2S and SPDIF controllers.
To ensure sample rates selected by userspace or by codec2codec DAI links
are maintained, the clock rate must be protected while it is in use.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/Kconfig       |  1 +
 sound/soc/sunxi/sun8i-codec.c | 29 +++++++++++++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/Kconfig b/sound/soc/sunxi/Kconfig
index 9cd7009cb570..69b9d8515335 100644
--- a/sound/soc/sunxi/Kconfig
+++ b/sound/soc/sunxi/Kconfig
@@ -9,16 +9,17 @@ config SND_SUN4I_CODEC
 	help
 	  Select Y or M to add support for the Codec embedded in the Allwinner
 	  A10 and affiliated SoCs.
 
 config SND_SUN8I_CODEC
 	tristate "Allwinner SUN8I audio codec"
 	depends on OF
 	depends on MACH_SUN8I || (ARM64 && ARCH_SUNXI) || COMPILE_TEST
+	select COMMON_CLK
 	select REGMAP_MMIO
 	help
 	  This option enables the digital part of the internal audio codec for
 	  Allwinner sun8i SoC (and particularly A33).
 
 	  Say Y or M if you want to add sun8i digital audio codec support.
 
 config SND_SUN8I_CODEC_ANALOG
diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 0e8b0ac31fed..253857e66f6f 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -416,27 +416,32 @@ static int sun8i_codec_get_lrck_div_order(unsigned int slots,
 	unsigned int div = slots * slot_width;
 
 	if (div < 16 || div > 256)
 		return -EINVAL;
 
 	return order_base_2(div);
 }
 
+static unsigned int sun8i_codec_get_sysclk_rate(unsigned int sample_rate)
+{
+	return sample_rate % 4000 ? 22579200 : 24576000;
+}
+
 static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params,
 				 struct snd_soc_dai *dai)
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
 	struct sun8i_codec_aif *aif = &scodec->aifs[dai->id];
 	unsigned int sample_rate = params_rate(params);
 	unsigned int slots = aif->slots ?: params_channels(params);
 	unsigned int slot_width = aif->slot_width ?: params_width(params);
-	unsigned int sysclk_rate = clk_get_rate(scodec->clk_module);
-	int lrck_div_order, word_size;
+	unsigned int sysclk_rate = sun8i_codec_get_sysclk_rate(sample_rate);
+	int lrck_div_order, ret, word_size;
 	u8 bclk_div;
 
 	/* word size */
 	switch (params_width(params)) {
 	case 8:
 		word_size = 0x0;
 		break;
 	case 16:
@@ -466,35 +471,55 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
 			   (lrck_div_order - 4) << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV);
 
 	/* BCLK divider (SYSCLK/BCLK ratio) */
 	bclk_div = sun8i_codec_get_bclk_div(sysclk_rate, lrck_div_order, sample_rate);
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK,
 			   bclk_div << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV);
 
+	/*
+	 * SYSCLK rate
+	 *
+	 * Clock rate protection is reference counted; but hw_params may be
+	 * called many times per substream, without matching calls to hw_free.
+	 * Protect the clock rate once per AIF, on the first hw_params call
+	 * for the first substream. clk_set_rate() will allow clock rate
+	 * changes on subsequent calls if only one AIF has open streams.
+	 */
+	ret = (aif->open_streams ? clk_set_rate : clk_set_rate_exclusive)(scodec->clk_module,
+									  sysclk_rate);
+	if (ret == -EBUSY)
+		dev_err(dai->dev,
+			"%s sample rate (%u Hz) conflicts with other audio streams\n",
+			dai->name, sample_rate);
+	if (ret < 0)
+		return ret;
+
 	if (!aif->open_streams)
 		scodec->sysclk_refcnt++;
 	scodec->sysclk_rate = sysclk_rate;
 
 	aif->sample_rate = sample_rate;
 	aif->open_streams |= BIT(substream->stream);
 
 	return sun8i_codec_update_sample_rate(scodec);
 }
 
 static int sun8i_codec_hw_free(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
 	struct sun8i_codec_aif *aif = &scodec->aifs[dai->id];
 
+	/* Drop references when the last substream for the AIF is freed. */
 	if (aif->open_streams != BIT(substream->stream))
 		goto done;
 
+	clk_rate_exclusive_put(scodec->clk_module);
 	scodec->sysclk_refcnt--;
 	aif->sample_rate = 0;
 
 done:
 	aif->open_streams &= ~BIT(substream->stream);
 	return 0;
 }
 
-- 
2.26.2

