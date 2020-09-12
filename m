Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D7E267C3F
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Sep 2020 22:31:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BD211674;
	Sat, 12 Sep 2020 22:30:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BD211674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599942709;
	bh=H9mEPtlkZkHnv48+xtIxVB4lFk4WqA6sVIcI4ahJs2U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DtnxticOPBfud38XAROvze9HiuuLxk+AEsncJr1dCOSRQMHbNPsSmEKd2eNHL4SqN
	 vojEy6y2YyK8UvU+oLVhIDaGZYH90bZAw2lqKvLT8trwi7+HM526ixaAPmEurWAikd
	 /8EpjcAq2qBk6K8LZpGG6DFP/+hr008IicxEN72w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D805F80100;
	Sat, 12 Sep 2020 22:30:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E504AF80264; Sat, 12 Sep 2020 22:30:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_26,PRX_BODY_76,RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E2DFF80100
 for <alsa-devel@alsa-project.org>; Sat, 12 Sep 2020 22:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E2DFF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="JqKaZgMA"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="VSpScBqL"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 86DF5580325;
 Sat, 12 Sep 2020 16:29:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 12 Sep 2020 16:29:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=5
 mCG9J9WZRXStCP3oo6BwMCg/UTfEFWOfJogf9Cxk4A=; b=JqKaZgMAyVoSXFJmf
 j2RCuI7D4ffirixPHrLfWJpTs0BlBhFdM2uvpWDEBa/xJ/xcuUYwi0I4BSHlQOEa
 zMg/Zo43nmfVOCqnmZU+6+ukA6X8VR1FB9Woshrd9yp6sFS5knywehlb+8AascPJ
 NGmwdEVz1OtiL3qeQ+P067J5dJ10rfFsjM6aigY080S4X0xn99gJXiGhA02rxE0S
 NofTBtaZSjmonlGWEkF53ZMP5Zlm1iXwxh22WzJdufYtIhtSE+rEto20FwMO4iLf
 ghVBNVtu06luDLmXhJm2hFVXr+dlXVc+VOAKn5ORsUe4vi6XrbFtxgsUF1xBB8cb
 xsgJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=5mCG9J9WZRXStCP3oo6BwMCg/UTfEFWOfJogf9Cxk
 4A=; b=VSpScBqL7Al/3NxfviQ6cTPLRui3u/bUuNnF1lSD6CVNBDlzslc9CqcyI
 dhmGGUwRu0tYyyikDo+BB0aBlBVAtQszwvB9MeF5DmQ2CqPdohXpIRyg6QgbiS9C
 Rz893kxSI2AwJOpbFsizbq8XU/NB1xRV8hbwiHYkOR7Rd9fTwWxjQjRJzUbWsMqQ
 Awug1gbxbYluHv8d8eVzSXPAYeOD2hrXWsiriIoMtKTYhLB1kjBwg0zK+RjHgL5M
 jPWlZ+6zMQK3UMeCWo1qWNEcQirpOk3hjZMaPaRvomYyTcstDoJmwW0b12pc/OBB
 bUtKNyL9UKWDzkTpia1c2FX+bXjEA==
X-ME-Sender: <xms:xC9dXzupv5rZz2PFg-zJGQf3q44GBg2XwdpBDr9QsnSKcQf24r7dGQ>
 <xme:xC9dX0csAIqI732GK8VZ5w-GPqaoiMVzVNBJWGzNj-coU9JTesfqDNV0TZHMHsba_
 j91MaB1pBMDG5y_aQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeiuddgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghm
 uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
 ggtffrrghtthgvrhhnpeduvdelffekjefhudeileehjeetheelfeeiieekgfetueeghfdt
 veekfeevgfehieenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeejtddrud
 efhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:xC9dX2z8rkTdeq05Y7Sy0xZlKLverWAcPok7ROAgvgELP5MGImCLgA>
 <xmx:xC9dXyPuvRWDEDWygJpOBUqcGrVVwrNTKxwDJnH5App5l9wfxRYSCQ>
 <xmx:xC9dXz-bWQRorOFWCNSHXeiuGJ7iEIt29sOW35hT5hLJznepcyNkew>
 <xmx:xi9dXyW2qmtj314Yd5cGnuxsjmMz_UrsJmR-mr6gw7ySP-hGyf0ReA>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 080E6328005A;
 Sat, 12 Sep 2020 16:29:55 -0400 (EDT)
Subject: Re: [PATCH v3 3/7] ASoC: sun4i-i2s: Add support for H6 I2S
To: Maxime Ripard <maxime@cerno.tech>
References: <CAJiuCcfXqizcq_JuXRCsqEqM2562cr1SGJ0pmy07jcJxAXojOw@mail.gmail.com>
 <20200430084600.samghw4zxb5zdbez@gilmour.lan>
 <CAJiuCcf_LHrJ6QdZgH8HyN6TRiT+GiD+t4UggFCrz-VwVHXV6w@mail.gmail.com>
 <20200504120942.lnrxnnmykqnvw3fb@gilmour.lan>
 <CAJiuCceF340FiLvyeXNZtvqftQMAmk=MtFDLT_9696ix+eH1Yw@mail.gmail.com>
 <20200729143927.47f5tbuaob4ph3lp@gilmour.lan>
 <20200729151548.GB5612@sirena.org.uk>
 <CAJiuCcdf=TNLPTUPzHP9NzPHqdxG06TRDkQfONY+ScK0DV_v5w@mail.gmail.com>
 <20200903205851.gdnpthserywsxrbs@gilmour.lan>
 <80b5a4e3-c8bc-9521-4ff1-12bb6424516f@sholland.org>
 <20200910143314.qku7po6htiiq5lzf@gilmour.lan>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <57f8bdeb-14dc-583e-ffa8-43d7a9f1bb24@sholland.org>
Date: Sat, 12 Sep 2020 15:29:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200910143314.qku7po6htiiq5lzf@gilmour.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Marcus Cooper <codekipper@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
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

Maxime,

On 9/10/20 9:33 AM, Maxime Ripard wrote:
> On Thu, Sep 03, 2020 at 09:54:39PM -0500, Samuel Holland wrote:
>> On 9/3/20 3:58 PM, Maxime Ripard wrote:
>>> On Thu, Sep 03, 2020 at 10:02:31PM +0200, Clément Péron wrote:
>>>> Hi Maxime,
>>>>
>>>> On Wed, 29 Jul 2020 at 17:16, Mark Brown <broonie@kernel.org> wrote:
>>>>>
>>>>> On Wed, Jul 29, 2020 at 04:39:27PM +0200, Maxime Ripard wrote:
>>>>>
>>>>>> It really looks like the polarity of LRCK is fine though. The first word
>>>>>> is sent with LRCK low, and then high, so we have channel 0 and then
>>>>>> channel 1 which seems to be the proper ordering?
>>
>> Which image file is this in reference to?
>>
>>>>> Yes, that's normal.
>>>>
>>>> Thank you very much for this test.
>>>>
>>>> So I will revert the following commit:
>>>>
>>>> ASoC: sun4i-i2s: Fix the LRCK polarity
>>>>
>>>> https://github.com/clementperon/linux/commit/dd657eae8164f7e4bafe8b875031a7c6c50646a9
>>>
>>> Like I said, the current code is working as expected with regard to the
>>> LRCK polarity. The issue is that the samples are delayed and start to be
>>> transmitted on the wrong phase of the signal.
>>
>> Since an I2S LRCK frame is radially symmetric, "wrong phase" and "inverted
>> polarity" look the same. The only way to definitively distinguish them is by
>> looking at the sample data.
>>
>> In "i2s-h6.png", the samples are all zeroes, so you're assuming that the first
>> sample transmitted (that is, when the bit clock starts transitioning) was a
>> "left" sample.
>>
>> However, in "h6-i2s-start-data.png", there are pairs of samples we can look at.
>> I'm still assuming that similar samples are a left/right pair, but that's
>> probably a safe assumption. Here we see the first sample in each pair is
>> transmitted with LRCK *high*, and the second sample in the pair is transmitted
>> with LRCK *low*. This is the opposite of your claim above.
>>
>> An ideal test would put left/right markers and frame numbers in the data
>> channel. The Python script below can generate such a file. Then you would know
>> how much startup delay there is, which channel the "first sample" came from, and
>> how each channel maps to the LRCK level.
>>
>> It would also be helpful to test DSP_A mode, where the LRCK signal is
>> asymmetric and an inversion would be obvious.
> 
> I had no idea that there was a wave module in Python, that's a great
> suggestion, thanks!
> 
> You'll find attached the screenshots for both the I2S and DSP_A formats.
> I zoomed out a bit to be able to have the first valid samples, but it
> should be readable.
> 
> The code I used is there:
> https://github.com/mripard/linux/tree/sunxi/h6-i2s-test
> 
> It's basically the v3, plus the DT bits.
> 
> As you can see, in the i2s case, LRCK starts low and then goes up, with
> the first channel (0x2*** samples) transmitted first, so everything
> looks right here.
> 
> On the DSP_A screenshot, LRCK will be low with small bursts high, and
> once again with the first channel being transmitted first, so it looks
> right to me too.

Indeed, for H6 i2s0 with LRCK inversion in software, everything looks correct on
the wire.

It's still concerning to me that the BSP has no evidence of this inversion,
either for i2s0 or i2s1[1]. And the inversion seems not to be required for HDMI
audio on mainline either (but there could be an inversion on the HDMI side or on
the interconnect).

Even so, your research is sufficient justification for me that the code is
correct as-is (with the inversion). Thank you very much for collecting the data!

Cheers,
Samuel

[1]:
https://github.com/Allwinner-Homlet/H6-BSP4.9-linux/blob/e634a960316dddd1eb50f2a6cf237f2f1c6da3e6/sound/soc/sunxi/sunxi-daudio.c#L1062
where 1 == SND_SOC_DAIFMT_NB_NF, and there's no inversion in
sunxi_daudio_init_fmt().
