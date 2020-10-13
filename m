Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AC428C6B2
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Oct 2020 03:17:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F659168F;
	Tue, 13 Oct 2020 03:16:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F659168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602551846;
	bh=XYs2KKkdVQSBvOwJVNUx8uv5y8eM7Fy2Y72+hUqITig=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IWg7JOBcC2VSRRp+yvmQFGI/wG8K36/a3NthaJ7iPz0ykxfL0W4NTsiOT/O0QlNkR
	 2fCoQZPDkanVuCiCIswBS/8iQ+35sQq50txebYD5id+dcBsAjBhEeZhYRRniQNlZfM
	 8J2txpv1ogdeD5kQ1RwMVT5WAWsWJ4RlkbzXgGV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2E2BF8021D;
	Tue, 13 Oct 2020 03:15:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C479CF80217; Tue, 13 Oct 2020 03:15:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0E8EF800D8
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 03:15:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0E8EF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="jCD0vosB"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="olq7BEih"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1E8F058034E;
 Mon, 12 Oct 2020 21:15:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 12 Oct 2020 21:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=/
 EI01dJNkjAjzVrpLDHdoBNLG11c1Wr2zSgmdsOeUQk=; b=jCD0vosBiM2Fi73lK
 qq7aEC7Hb+KiedGsgfnXGak+S2OdSPM+00OpPo4aKVqHuKGsYz0d/4VAwNuq99ut
 Us3X0KrIVparkDtgMhxFwQG4sjdLlENjS+gZVSQDMDduzFx6u3lfZkjnuBR/yC5+
 jkmKZnNQWhPktwEBHoyn9IwmIMCvRMwHUqfo+GZBQ3091EwroTB/Bd9k9hXfj0Kf
 kOMMXSNu0uRl2oRKccfZK2gYZMSs8n70ZxNa+4yM3X/uwhEZcImbDBCLGz8U8k4o
 +BklZbIkN6gEa0u9V0EXLiS0uOCNVe+DCfj3JTKHnHCsUwqOlbhxnj9w4InMzi3/
 N1paQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=/EI01dJNkjAjzVrpLDHdoBNLG11c1Wr2zSgmdsOeU
 Qk=; b=olq7BEih38ZaP7P0P6a0o82OUMIVpyveU4fH9PnYNYW2NC6P1Qm9LmPpf
 4w3aOxuLOTDTYqlaJG6FnsXnACSHL/s0n78f5owEm/nGMgdPbLJ4lGNZD2B05L7c
 uanGpd3Dsw52BPMqdPcTKwenO0n8OqrFQooCXsTE4+TUJMb1XXXtS4cAUF9A22g4
 3zAJCvfKB0Kkt/FZS5ZWMQhI2J5DPdG0ljF39p05odHga0K4w6F4AEmMtfKyrkDs
 ZfKxGMYlDOqyLSMFMs+TpvEvfFxwZlyWRwg05mQDzGHspmvf1mb/108FfJB4zriv
 o4Jmv2lOhDKFaG4JONdYVjEVuMMIA==
X-ME-Sender: <xms:s_-EX2aSUVucs8dKSBOIJE9HTakoGdY9lJT1Dh5iiC0VmAm1SVIyeA>
 <xme:s_-EX5YVQd3u_sD1M2Abn_po_VjA-IWneVB5HfI-5cT0R5dwLakV1dvdCGTnWmpFq
 IgE1WVkKbT0sAUdyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrheekgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeehnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpefhueeuueetteeiuddvveetieekiedvkeejjeetkeejfeejuddvvedu
 geejteelueenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:s_-EXw9Nw5-wYf-qj6Y7pGN3XAJBzYEx7SB5rD97ZYtB_sOffetE2g>
 <xmx:s_-EX4q1Gs7lAT4E8jmgziFQMOAk05GygzlaH1Hy2tGqM6A1FvcHQA>
 <xmx:s_-EXxoM9QP2INQwNxjttCVYHApk-s3eFEvUGHF3lhm8s-XCN_K3MA>
 <xmx:tv-EX_jBRqnolCGxnwI-BE1DUTb6yUbtwigVyPjDmK3LPguzJgNQag>
Received: from [70.135.148.151]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id E0A99328005E;
 Mon, 12 Oct 2020 21:15:30 -0400 (EDT)
Subject: Re: [PATCH v6 02/14] ASoC: sun4i-i2s: Change set_chan_cfg() params
To: Maxime Ripard <maxime@cerno.tech>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?=
 <peron.clem@gmail.com>
References: <20201003141950.455829-1-peron.clem@gmail.com>
 <20201003141950.455829-3-peron.clem@gmail.com>
 <20201005121307.v6jpyeyfi4kxc2cl@gilmour.lan>
 <CAJiuCcdd6_kzsxEERZbj2Budjmuyv6gV_sPG8LjLY=fk+MO8zQ@mail.gmail.com>
 <20201012121536.z5d7kecdxaabw35n@gilmour.lan>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <0d6f0693-5ca9-9b48-4d33-a969bd5b1b1b@sholland.org>
Date: Mon, 12 Oct 2020 20:15:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201012121536.z5d7kecdxaabw35n@gilmour.lan>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On 10/12/20 7:15 AM, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Oct 05, 2020 at 03:23:12PM +0200, Clément Péron wrote:
>> On Mon, 5 Oct 2020 at 14:13, Maxime Ripard <maxime@cerno.tech> wrote:
>>>
>>> On Sat, Oct 03, 2020 at 04:19:38PM +0200, Clément Péron wrote:
>>>> As slots and slot_width can be set manually using set_tdm().
>>>> These values are then kept in sun4i_i2s struct.
>>>> So we need to check if these values are setted or not
>>>> in the struct.
>>>>
>>>> Avoid to check for this logic in set_chan_cfg(). This will
>>>> duplicate the same check instead pass the required values
>>>> as params to set_chan_cfg().
>>>>
>>>> This will also avoid a bug when we will enable 20/24bits support,
>>>> i2s->slot_width is not actually used in the lrck_period computation.
>>>>
>>>> Suggested-by: Samuel Holland <samuel@sholland.org>
>>>> Signed-off-by: Clément Péron <peron.clem@gmail.com>
>>>> ---
>>>>  sound/soc/sunxi/sun4i-i2s.c | 36 ++++++++++++++----------------------
>>>>  1 file changed, 14 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
>>>> index c5ccd423e6d3..1f577dbc20a6 100644
>>>> --- a/sound/soc/sunxi/sun4i-i2s.c
>>>> +++ b/sound/soc/sunxi/sun4i-i2s.c
>>>> @@ -177,8 +177,9 @@ struct sun4i_i2s_quirks {
>>>>       unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *);
>>>>       s8      (*get_sr)(const struct sun4i_i2s *, int);
>>>>       s8      (*get_wss)(const struct sun4i_i2s *, int);
>>>> -     int     (*set_chan_cfg)(const struct sun4i_i2s *,
>>>> -                             const struct snd_pcm_hw_params *);
>>>> +     int     (*set_chan_cfg)(const struct sun4i_i2s *i2s,
>>>> +                             unsigned int channels,  unsigned int slots,
>>>> +                             unsigned int slot_width);
>>>>       int     (*set_fmt)(const struct sun4i_i2s *, unsigned int);
>>>>  };
>>>>
>>>> @@ -414,10 +415,9 @@ static s8 sun8i_i2s_get_sr_wss(const struct sun4i_i2s *i2s, int width)
>>>>  }
>>>>
>>>>  static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>>>> -                               const struct snd_pcm_hw_params *params)
>>>> +                               unsigned int channels, unsigned int slots,
>>>> +                               unsigned int slot_width)
>>>>  {
>>>> -     unsigned int channels = params_channels(params);
>>>> -
>>>>       /* Map the channels for playback and capture */
>>>>       regmap_write(i2s->regmap, SUN4I_I2S_TX_CHAN_MAP_REG, 0x76543210);
>>>>       regmap_write(i2s->regmap, SUN4I_I2S_RX_CHAN_MAP_REG, 0x00003210);
>>>> @@ -434,15 +434,11 @@ static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>>>>  }
>>>>
>>>>  static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>>>> -                               const struct snd_pcm_hw_params *params)
>>>> +                               unsigned int channels, unsigned int slots,
>>>> +                               unsigned int slot_width)
>>>>  {
>>>> -     unsigned int channels = params_channels(params);
>>>> -     unsigned int slots = channels;
>>>>       unsigned int lrck_period;
>>>>
>>>> -     if (i2s->slots)
>>>> -             slots = i2s->slots;
>>>> -
>>>>       /* Map the channels for playback and capture */
>>>>       regmap_write(i2s->regmap, SUN8I_I2S_TX_CHAN_MAP_REG, 0x76543210);
>>>>       regmap_write(i2s->regmap, SUN8I_I2S_RX_CHAN_MAP_REG, 0x76543210);
>>>> @@ -467,11 +463,11 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>>>>       case SND_SOC_DAIFMT_DSP_B:
>>>>       case SND_SOC_DAIFMT_LEFT_J:
>>>>       case SND_SOC_DAIFMT_RIGHT_J:
>>>> -             lrck_period = params_physical_width(params) * slots;
>>>> +             lrck_period = slot_width * slots;
>>>>               break;
>>>>
>>>>       case SND_SOC_DAIFMT_I2S:
>>>> -             lrck_period = params_physical_width(params);
>>>> +             lrck_period = slot_width;
>>>>               break;
>>>>
>>>>       default:
>>>> @@ -490,15 +486,11 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>>>>  }
>>>>
>>>>  static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>>>> -                                   const struct snd_pcm_hw_params *params)
>>>> +                                   unsigned int channels, unsigned int slots,
>>>> +                                   unsigned int slot_width)
>>>>  {
>>>> -     unsigned int channels = params_channels(params);
>>>> -     unsigned int slots = channels;
>>>>       unsigned int lrck_period;
>>>>
>>>> -     if (i2s->slots)
>>>> -             slots = i2s->slots;
>>>> -
>>>>       /* Map the channels for playback and capture */
>>>>       regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP0_REG, 0xFEDCBA98);
>>>>       regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x76543210);
>>>> @@ -525,11 +517,11 @@ static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>>>>       case SND_SOC_DAIFMT_DSP_B:
>>>>       case SND_SOC_DAIFMT_LEFT_J:
>>>>       case SND_SOC_DAIFMT_RIGHT_J:
>>>> -             lrck_period = params_physical_width(params) * slots;
>>>> +             lrck_period = slot_width * slots;
>>>>               break;
>>>>
>>>>       case SND_SOC_DAIFMT_I2S:
>>>> -             lrck_period = params_physical_width(params);
>>>> +             lrck_period = slot_width;
>>>>               break;
>>>>
>>>>       default:
>>>> @@ -565,7 +557,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
>>>>       if (i2s->slot_width)
>>>>               slot_width = i2s->slot_width;
>>>>
>>>> -     ret = i2s->variant->set_chan_cfg(i2s, params);
>>>> +     ret = i2s->variant->set_chan_cfg(i2s, channels, slots, slot_width);
>>>
>>> Isn't slots and slot_width set to 0 here ?
>>
>> No, there is still a check before calling the set_cfg function.
>>
>>   unsigned int slot_width = params_physical_width(params);
>>   unsigned int channels = params_channels(params);
>>   unsigned int slots = channels;
>>
>>   if (i2s->slots)
>>   slots = i2s->slots;
>>
>>   if (i2s->slot_width)
>>   slot_width = i2s->slot_width;
>>
>> ret = i2s->variant->set_chan_cfg(i2s, channels, slots, slot_width);
>>
>> So slot_width will be equal to params_physical_width(params);
>> like before
> 
> Still, it's not obvious what slots and slot_width are going to be set to
> in a non-TDM setup where that doesn't really make much sense.

My understanding is:

"slots" is channels per frame + padding slots, regardless of format.
"slot_width" is bits per sample + padding bits, regardless of format.

Some formats may require or prohibit certain padding, but that has no
effect on the definitions.

That seems clear to me? At least that's what I implemented (and you
acked) in sun8i-codec.

> I assume you want to reduce the boilerplate, then we can make an helper
> to get the frame size and the number of channels / slots if needed

What would you name the return values, if not "slots" and "slot_width"?
"channels" and "word_size" would be inaccurate, because those terms
refer to the values without padding.

> Maxime

Cheers,
Samuel
