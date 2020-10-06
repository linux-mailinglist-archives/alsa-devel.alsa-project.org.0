Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB99B28452B
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 07:05:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFDB11773;
	Tue,  6 Oct 2020 07:04:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFDB11773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601960714;
	bh=oZa7bIChs84Ng5/4qvll6FHlLjd2x5jmFuMJy6oTVaw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jlCNLP5ZPsqK6m+0wQbX00QUHh/f9vM1ixSiPolfvyojOWtohvEPXSHul6bqywoCe
	 5BiY6mh2BnE5uhzZP6qDT6QMD2p+xPYlnm9M1+2KfEgKeLr9f39JoyqjFA+QxQsKzM
	 aOAWr3WF5alqvKXqU5rHvnWKRsYSQHwwH76Ijmjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D24FCF800CB;
	Tue,  6 Oct 2020 07:03:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E430F80246; Tue,  6 Oct 2020 07:03:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC9D3F800C9
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 07:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC9D3F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="AFmklXa6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="EPkkFVXn"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 01140C6B;
 Tue,  6 Oct 2020 01:03:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 06 Oct 2020 01:03:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=o
 WLg/2i+TQUsx3kpfl8FNqwpAO07sFlgoMeJklktQv0=; b=AFmklXa6A8UAEBshM
 XormxgtzeHby/cOOY4tNHmkPw59vJMuixIAIhLzQrWpPL2gmVmV6qCyM1kc75IeZ
 nTCdyokrMowK4HoyYB0R+DwvAcK2l9ssJoX0b8lVol2qtq7ilPCkSRekRTCiyV81
 A89PGpXQsPBA7QC+5J62f5M6rp7If+K8+NlIJ2Lt6EOL3cY1Igg9Q6qx7WOOdBaV
 MyX5n0cOixq0Q+CN87l1gTR+2EmzBVwKUpGppzROTLdkQR5b5+slux+NZhZu6VLK
 v4+/ofclG1tbxCEmEFyOAae2e+yRY+yukN6SuYuV1GuGO8Zog+LPvR1qHENU/LNM
 ojtSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=oWLg/2i+TQUsx3kpfl8FNqwpAO07sFlgoMeJklktQ
 v0=; b=EPkkFVXnOedVnd5i+zaJMiWSqNIe1d4wp0WNxJW2F8xMKXEYjllLRZMzN
 xhtasgS1RHq4Edt4TH5Is0ofgEALZT2fY62DnOb8e57MWIkmDt0L8XCRJtIACgKe
 6OdmOOk4gLVF6I569SLmevHckU/GVi56gtwa2yAHwjnFvw43aVNJMgS04JT4PkRL
 t/zMtVnq0uf6Ck52BxsiaKiyWFSemxLkYWy93kK1UTl95mlThiXBaN7wFh7BgJaV
 6pSv/SoRH6rfRxo/5WChefw3pC76bEH+aqUz4kEhTYdoRNqSZnWUT+GkkUDy/eL3
 KU6QQNzjOPlFWD+9QOcZLLjrEEXiQ==
X-ME-Sender: <xms:k_p7XwlqWwCX89Cy8SC0zYcXgCWhnrne3rtRLo-C1MjLc1b-O8xI1Q>
 <xme:k_p7X_1Xch46bdLdh6HhS33EorSUS3cgqFHXSRsNcdnWq-KwYZ_Z58cZ7tu4LCGxp
 rh-IN5gH_LCMho3QA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeefgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeehnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpefhueeuueetteeiuddvveetieekiedvkeejjeetkeejfeejuddvvedu
 geejteelueenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:k_p7X-ocWSx-4nwhwI3Babz3p4E6Bxe-PzddAeH8nrCbCW7jFZnAbw>
 <xmx:k_p7X8n3hsqxWOvkuBmAhugsoNYWEcsTwJjP2tjlygN2ymWG5CXzVg>
 <xmx:k_p7X-3apXUvScAotc0XMXdIrNbGlVw79X8af28Ms7DSSJ-sTD9Ijw>
 <xmx:lvp7X0ONZUUVXZwdDNAg26FSjigy0Jl0mxqnuadNpT0gCCHOSfvWJdVisJQ>
Received: from [70.135.148.151]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4E02E306467D;
 Tue,  6 Oct 2020 01:03:15 -0400 (EDT)
Subject: Re: [PATCH v6 02/14] ASoC: sun4i-i2s: Change set_chan_cfg() params
To: Maxime Ripard <maxime@cerno.tech>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?=
 <peron.clem@gmail.com>
References: <20201003141950.455829-1-peron.clem@gmail.com>
 <20201003141950.455829-3-peron.clem@gmail.com>
 <20201005121307.v6jpyeyfi4kxc2cl@gilmour.lan>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <fae04296-9865-3dcb-e02d-46062bf778a8@sholland.org>
Date: Tue, 6 Oct 2020 00:03:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201005121307.v6jpyeyfi4kxc2cl@gilmour.lan>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-sunxi@googlegroups.com, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On 10/5/20 7:13 AM, Maxime Ripard wrote:
> On Sat, Oct 03, 2020 at 04:19:38PM +0200, Clément Péron wrote:
>> As slots and slot_width can be set manually using set_tdm().
>> These values are then kept in sun4i_i2s struct.
>> So we need to check if these values are setted or not
>> in the struct.
>>
>> Avoid to check for this logic in set_chan_cfg(). This will
>> duplicate the same check instead pass the required values
>> as params to set_chan_cfg().
>>
>> This will also avoid a bug when we will enable 20/24bits support,
>> i2s->slot_width is not actually used in the lrck_period computation.
>>
>> Suggested-by: Samuel Holland <samuel@sholland.org>
>> Signed-off-by: Clément Péron <peron.clem@gmail.com>
>> ---
>>  sound/soc/sunxi/sun4i-i2s.c | 36 ++++++++++++++----------------------
>>  1 file changed, 14 insertions(+), 22 deletions(-)
>>
>> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
>> index c5ccd423e6d3..1f577dbc20a6 100644
>> --- a/sound/soc/sunxi/sun4i-i2s.c
>> +++ b/sound/soc/sunxi/sun4i-i2s.c
>> @@ -177,8 +177,9 @@ struct sun4i_i2s_quirks {
>>  	unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *);
>>  	s8	(*get_sr)(const struct sun4i_i2s *, int);
>>  	s8	(*get_wss)(const struct sun4i_i2s *, int);
>> -	int	(*set_chan_cfg)(const struct sun4i_i2s *,
>> -				const struct snd_pcm_hw_params *);
>> +	int	(*set_chan_cfg)(const struct sun4i_i2s *i2s,
>> +				unsigned int channels,	unsigned int slots,
>> +				unsigned int slot_width);
>>  	int	(*set_fmt)(const struct sun4i_i2s *, unsigned int);
>>  };
>>  
>> @@ -414,10 +415,9 @@ static s8 sun8i_i2s_get_sr_wss(const struct sun4i_i2s *i2s, int width)
>>  }
>>  
>>  static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>> -				  const struct snd_pcm_hw_params *params)
>> +				  unsigned int channels, unsigned int slots,
>> +				  unsigned int slot_width)
>>  {
>> -	unsigned int channels = params_channels(params);
>> -
>>  	/* Map the channels for playback and capture */
>>  	regmap_write(i2s->regmap, SUN4I_I2S_TX_CHAN_MAP_REG, 0x76543210);
>>  	regmap_write(i2s->regmap, SUN4I_I2S_RX_CHAN_MAP_REG, 0x00003210);
>> @@ -434,15 +434,11 @@ static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>>  }
>>  
>>  static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>> -				  const struct snd_pcm_hw_params *params)
>> +				  unsigned int channels, unsigned int slots,
>> +				  unsigned int slot_width)
>>  {
>> -	unsigned int channels = params_channels(params);
>> -	unsigned int slots = channels;
>>  	unsigned int lrck_period;
>>  
>> -	if (i2s->slots)
>> -		slots = i2s->slots;
>> -
>>  	/* Map the channels for playback and capture */
>>  	regmap_write(i2s->regmap, SUN8I_I2S_TX_CHAN_MAP_REG, 0x76543210);
>>  	regmap_write(i2s->regmap, SUN8I_I2S_RX_CHAN_MAP_REG, 0x76543210);
>> @@ -467,11 +463,11 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>>  	case SND_SOC_DAIFMT_DSP_B:
>>  	case SND_SOC_DAIFMT_LEFT_J:
>>  	case SND_SOC_DAIFMT_RIGHT_J:
>> -		lrck_period = params_physical_width(params) * slots;
>> +		lrck_period = slot_width * slots;
>>  		break;
>>  
>>  	case SND_SOC_DAIFMT_I2S:
>> -		lrck_period = params_physical_width(params);
>> +		lrck_period = slot_width;
>>  		break;
>>  
>>  	default:
>> @@ -490,15 +486,11 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>>  }
>>  
>>  static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>> -				      const struct snd_pcm_hw_params *params)
>> +				      unsigned int channels, unsigned int slots,
>> +				      unsigned int slot_width)
>>  {
>> -	unsigned int channels = params_channels(params);
>> -	unsigned int slots = channels;
>>  	unsigned int lrck_period;
>>  
>> -	if (i2s->slots)
>> -		slots = i2s->slots;
>> -
>>  	/* Map the channels for playback and capture */
>>  	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP0_REG, 0xFEDCBA98);
>>  	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x76543210);
>> @@ -525,11 +517,11 @@ static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>>  	case SND_SOC_DAIFMT_DSP_B:
>>  	case SND_SOC_DAIFMT_LEFT_J:
>>  	case SND_SOC_DAIFMT_RIGHT_J:
>> -		lrck_period = params_physical_width(params) * slots;
>> +		lrck_period = slot_width * slots;
>>  		break;
>>  
>>  	case SND_SOC_DAIFMT_I2S:
>> -		lrck_period = params_physical_width(params);
>> +		lrck_period = slot_width;
>>  		break;
>>  
>>  	default:
>> @@ -565,7 +557,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
>>  	if (i2s->slot_width)
>>  		slot_width = i2s->slot_width;
>>  
>> -	ret = i2s->variant->set_chan_cfg(i2s, params);
>> +	ret = i2s->variant->set_chan_cfg(i2s, channels, slots, slot_width);
> 
> Isn't slots and slot_width set to 0 here ?
> 
> And therefore, wouldn't we set lrck_period to 0 if we're using any
> format but I2S?
> 
> More importantly, I'm not really convinced this needs to be done, and it
> introduces some side effects that are not explained.

If I set dai-tdm-slot-width = <32> and start a stream using S16_LE,
currently we would calculate BCLK for 32-bit slots, but program
lrck_period for 16-bit slots, making the sample rate double what we
expected. That sounds like a bug to me. (Because of that, as Chen-Yu
mentioned in reply to v5, this should be the first patch in the series.)

Could you be more specific what side effects you are referring to?

> Maxime

Cheers,
Samuel
