Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E97A728450A
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 06:45:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B8921773;
	Tue,  6 Oct 2020 06:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B8921773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601959550;
	bh=Q5qx/pHdP4nsAKRUfQldmWzTFfrslQOmVWhLwl2WTrU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KdLuCSrtQzYVSrfv403F/vT5pK4769w6zm0FfQ3KbClFC1jYx8KECZJB3RJMSCimD
	 KaxByjfwZUQfR9YromZ09otYQoeVFuhNzWjqFPIyQKepwSgrb44S9iGKUVUHzlhjn2
	 JvcfDBYEzWIPF2M905+7PNqh/davwBy/HDWtdrcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61197F8015B;
	Tue,  6 Oct 2020 06:44:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21F19F80246; Tue,  6 Oct 2020 06:44:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 178A3F800CB
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 06:43:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 178A3F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="C04hKOuP"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ceINa3jo"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id B6BA53DF;
 Tue,  6 Oct 2020 00:43:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 06 Oct 2020 00:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=X
 2uGAJogJbE61MC4c1/0d4db+rheQyrn5sPt3B2jfek=; b=C04hKOuPIfiwZn1kb
 pvrDuEopDqCt7XKTr2jV16rzmpjCMkhbcvTOWnFw8aGUnMJfO9U47YETUyXoP/VZ
 fu39eqeyt0PzOuvqeQjPO+dDux86UCRvcirx26Jd8MP8QECyeJhQcU41nKvN5i6r
 1/zfjtDn9rfePb4aCbaw2E4ipIdS+0C2Plit5jR2MJzOMFPTLGUxmdnxztbNFYX4
 d71WyFvKSdcLjQevZaleAK4BLv4MTxzE/5SO6Gut4QgFaJHeujz9s8QHvgah6rN4
 Pa81I1CFexmrNwi2o+B6tzN+ruhQj0/YUBmgRD1mpussEIU+GOo7vd7t2ahPSJ03
 QF2Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=X2uGAJogJbE61MC4c1/0d4db+rheQyrn5sPt3B2jf
 ek=; b=ceINa3joRWtekgoblZo5972H2/CWGk0s4NapKYMpurufILS7qFFxq/pHH
 OwpcBvGmYSr1RmDdaJpA6rc1DyakAp2X3a+c+Rd5Pvh8CxZVsdsGkaugMMmouI5d
 ZrAs1Q1qHiuSbdAVAdUkgcF0ZPkySNIyuNJswjUCPyRYkkVgWQTGge85cQogUX8V
 x3jV72qBq0bTAP79le6LFzc7XWUhpX8YU3EWuixfB4hH1QE1q45SDFutjIMEmGnB
 uBpvccvUO0INGUGmV1VmbpzArspxsrA+07z6AUpm4ZUsQSFZIz5pZQ+KavOVvAlN
 PULg4myGj65fW+F/FsSVUrB1emCvQ==
X-ME-Sender: <xms:CPZ7X9QRLTyZ-tQ7k05GF20L6Ix578BrF5wpOkm6jsbF19jZW7yuFA>
 <xme:CPZ7X2wrm6ywBaGGh5IJyFtH_KWRzTV5gr98gZ_kpqvH8tCYTlDLAv1Qt1u6IslDC
 NO_hYcDpjfg3-_2EQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeefgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeehnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeettdekiedvgeetfeelueduhefftdfhkeehueejvefhtddvffejleeu
 hfeuhfevkeenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:CPZ7Xy3dBI6brQjp83pbmHbIGyaOfOi5DBtEuDOaL7FbAy6NBw_UAQ>
 <xmx:CPZ7X1AGKAdgXn3tyXt1Y-ioqb--K762Nx11JWSoydTihx-cLEDy3w>
 <xmx:CPZ7X2hUum-5kveEZyP4hZGoRhcVebURWV7Rt6vHjV6nrnKHw9EYuA>
 <xmx:CvZ7X6hoFil1IzIVyFRb1KOVD_WS8Kn1H2cKPFEhRSSJKB52b8MxLg>
Received: from [70.135.148.151]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id E440B306467D;
 Tue,  6 Oct 2020 00:43:51 -0400 (EDT)
Subject: Re: [PATCH 20/25] ASoC: sun8i-codec: Protect the clock rate while
 streams are open
To: Maxime Ripard <maxime@cerno.tech>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-21-samuel@sholland.org>
 <20201005120101.igzzwosnq6bzbua6@gilmour.lan>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <5ef4351f-e9ed-1a38-b79e-53e62a70437e@sholland.org>
Date: Mon, 5 Oct 2020 23:43:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201005120101.igzzwosnq6bzbua6@gilmour.lan>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On 10/5/20 7:01 AM, Maxime Ripard wrote:
> On Wed, Sep 30, 2020 at 09:11:43PM -0500, Samuel Holland wrote:
>> The codec's clock input is shared among all AIFs, and shared with other
>> audio-related hardware in the SoC, including I2S and SPDIF controllers.
>> To ensure sample rates selected by userspace or by codec2codec DAI links
>> are maintained, the clock rate must be protected while it is in use.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>>  sound/soc/sunxi/sun8i-codec.c | 25 ++++++++++++++++++++++---
>>  1 file changed, 22 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
>> index 501af64d43a0..86065bee7cd3 100644
>> --- a/sound/soc/sunxi/sun8i-codec.c
>> +++ b/sound/soc/sunxi/sun8i-codec.c
>> @@ -416,27 +416,32 @@ static int sun8i_codec_get_lrck_div_order(unsigned int slots,
>>  	unsigned int div = slots * slot_width;
>>  
>>  	if (div < 16 || div > 256)
>>  		return -EINVAL;
>>  
>>  	return order_base_2(div);
>>  }
>>  
>> +static unsigned int sun8i_codec_get_sysclk_rate(unsigned int sample_rate)
>> +{
>> +	return sample_rate % 4000 ? 22579200 : 24576000;
>> +}
>> +
>>  static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
>>  				 struct snd_pcm_hw_params *params,
>>  				 struct snd_soc_dai *dai)
>>  {
>>  	struct sun8i_codec *scodec = snd_soc_dai_get_drvdata(dai);
>>  	struct sun8i_codec_aif *aif = &scodec->aifs[dai->id];
>>  	unsigned int sample_rate = params_rate(params);
>>  	unsigned int slots = aif->slots ?: params_channels(params);
>>  	unsigned int slot_width = aif->slot_width ?: params_width(params);
>> -	unsigned int sysclk_rate = clk_get_rate(scodec->clk_module);
>> -	int lrck_div_order, word_size;
>> +	unsigned int sysclk_rate = sun8i_codec_get_sysclk_rate(sample_rate);
>> +	int lrck_div_order, ret, word_size;
>>  	u8 bclk_div;
>>  
>>  	/* word size */
>>  	switch (params_width(params)) {
>>  	case 8:
>>  		word_size = 0x0;
>>  		break;
>>  	case 16:
>> @@ -466,17 +471,30 @@ static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
>>  			   (lrck_div_order - 4) << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV);
>>  
>>  	/* BCLK divider (SYSCLK/BCLK ratio) */
>>  	bclk_div = sun8i_codec_get_bclk_div(sysclk_rate, lrck_div_order, sample_rate);
>>  	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
>>  			   SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK,
>>  			   bclk_div << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV);
>>  
>> -	if (!aif->open_streams) {
>> +	/* SYSCLK rate */
>> +	if (aif->open_streams) {
>> +		ret = clk_set_rate(scodec->clk_module, sysclk_rate);
>> +		if (ret < 0)
>> +			return ret;
>> +	} else {
>> +		ret = clk_set_rate_exclusive(scodec->clk_module, sysclk_rate);
> 
> It's not really clear to me why we wouldn't want to always protect the
> clock rate here?

From Documentation/sound/kernel-api/writing-an-alsa-driver.rst:

    hw_params callback
    ...
    Note that this and ``prepare`` callbacks may be called multiple
    times per initialization. For example, the OSS emulation may call
    these callbacks at each change via its ioctl.

Clock rate protection is reference counted, so we must only take one
reference (or at least a known number of references) per stream.

>> +		if (ret == -EBUSY)
>> +			dev_err(dai->dev, "%s: clock is busy! Sample rate %u Hz "
>> +				"conflicts with other audio streams.\n",
> 
> This string creates a checkpatch warning.

I will put it on one line, though >100 columns is also a checkpatch warning.

> Maxime

Cheers,
Samuel
