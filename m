Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B708F1BC640
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 19:13:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50849169C;
	Tue, 28 Apr 2020 19:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50849169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588094004;
	bh=/nW9KWmVCow4DPmmG4nR2Rn4lEMBKSu3nAvAD1skmVI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LfNkYe6j5dtNMES5RNHkjOoizZLkCQhYxZdGYGXpaOdif1HjAnX3Mia5WOde2mTTr
	 X868uJ7tCwNiz813mwJpeG2JuDUbHbPoLaFn7lblVpDR5J5Oplx2nNLyCRWDi1SMVQ
	 Gcg3GeIh8pz4De+hxU+9uIZ1GP6irUNhChH3g4Ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A364F801F7;
	Tue, 28 Apr 2020 19:11:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4A0CF801DB; Tue, 28 Apr 2020 19:11:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_26,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 11330F800B8
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 19:11:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11330F800B8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FC6430E;
 Tue, 28 Apr 2020 10:11:30 -0700 (PDT)
Received: from [10.57.33.170] (unknown [10.57.33.170])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0ADD3F305;
 Tue, 28 Apr 2020 10:11:27 -0700 (PDT)
Subject: Re: Audio sound card name [was [PATCH 4/7] arm64: dts: allwinner:
 a64: Add HDMI audio]
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20200426120442.11560-1-peron.clem@gmail.com>
 <20200426120442.11560-5-peron.clem@gmail.com>
 <20200428080020.35qcuylwq2ylmubu@gilmour.lan>
 <CAJiuCcc2LQ4L36KSfO8iLVFBUO6k+zsZFX+_Ovm_10PoWO4AsA@mail.gmail.com>
 <20200428160417.6q5oab2guaumhhwi@gilmour.lan>
 <CAJiuCccFFUJJzXwygLQbDK4fGJ61p72Hv7vj3WVP-=z=J1Yj0Q@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <031ee5d3-8a30-82ee-76db-c0e8a1073046@arm.com>
Date: Tue, 28 Apr 2020 18:11:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAJiuCccFFUJJzXwygLQbDK4fGJ61p72Hv7vj3WVP-=z=J1Yj0Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
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

On 2020-04-28 5:49 pm, Clément Péron wrote:
> Hi Mark, Rob,
> 
> On Tue, 28 Apr 2020 at 18:04, Maxime Ripard <maxime@cerno.tech> wrote:
>>
>> On Tue, Apr 28, 2020 at 10:54:00AM +0200, Clément Péron wrote:
>>> Hi Maxime,
>>>
>>> On Tue, 28 Apr 2020 at 10:00, Maxime Ripard <maxime@cerno.tech> wrote:
>>>>
>>>> On Sun, Apr 26, 2020 at 02:04:39PM +0200, Clément Péron wrote:
>>>>> From: Marcus Cooper <codekipper@gmail.com>
>>>>>
>>>>> Add a simple-soundcard to link audio between HDMI and I2S.
>>>>>
>>>>> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>>>>> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
>>>>> Signed-off-by: Clément Péron <peron.clem@gmail.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 21 +++++++++++++++++++
>>>>>   1 file changed, 21 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>>>> index e56e1e3d4b73..08ab6b5e72a5 100644
>>>>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>>>> @@ -102,6 +102,25 @@
>>>>>                status = "disabled";
>>>>>        };
>>>>>
>>>>> +     hdmi_sound: hdmi-sound {
>>>>> +             compatible = "simple-audio-card";
>>>>> +             simple-audio-card,format = "i2s";
>>>>> +             simple-audio-card,name = "allwinner,hdmi";
>>>>
>>>> I'm not sure what the usual card name should be like though. I would assume that
>>>> this should be something specific enough so that you're able to differentiate
>>>> between boards / SoC so that the userspace can choose a different configuration
>>>> based on it?
>>>
>>> I really don't know what we should use here,
>>> I just have a look at other SoC:
>>> rk3328: "HDMI"
>>> rk3399: "hdmi-sound"
>>> r8a774c0-cat874: "CAT874 HDMI sound"
>>>
>>> But maybe it's time to introduce proper name:
>>> What about :
>>> pat
>>> sun50i-h6-hdmi
>>
>> It's pretty much what we've been using for the other sound cards we have, so it
>> makes sense to me.
> 
> I have a question regarding the simple-audio-card,name.
> In this patch, I would like to introduce a simple-audio-card for the
> Allwinner A64 HDMI.
> 
> What should be the preferred name for this sound card?
> "sun50i-a64-hdmi" ? "allwinner, sun50i-a64-hdmi" ?

I can at least speak for RK3328, and the reasoning there was that as the 
user looking at what `aplay -l` says, I don't give a hoot about what the 
SoC may be called, I see two cards and I want to know, with the least 
amount of uncertainty, which one will make the sound come out of the 
port that's labelled "HDMI" on the box ;)

Robin.
