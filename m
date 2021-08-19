Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2963F1EA5
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 19:03:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E08061696;
	Thu, 19 Aug 2021 19:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E08061696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629392615;
	bh=845s687kVBSEi7zUPMSYclX69v7dgQV6SHAnFE3vOXI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=psw2vX6zCTXGuwyVkC55QseJfR1XMx+uFh3M9OcYtyJ1u+yF4F7MS7OWs3PHatqxD
	 VvE2E6WYbkSw3tA5r4C/yEacCGYjHxGHlA3JI5raM58E9MgtTBZ28l+7wAcQ9oYxB0
	 5L92vlzetLjO+8ll4FOrzaKk6EX+21lWYv67Pinw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43F2EF801EC;
	Thu, 19 Aug 2021 19:02:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4B8BF8026D; Thu, 19 Aug 2021 19:02:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9596BF800CC
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 19:02:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9596BF800CC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 684C51042;
 Thu, 19 Aug 2021 10:02:08 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7017E3F70D;
 Thu, 19 Aug 2021 10:02:06 -0700 (PDT)
Subject: Re: [PATCH 2/4] dt-bindings: sound: add rockchip i2s-tdm binding
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20210817101119.423853-1-frattaroli.nicolas@gmail.com>
 <20210817101119.423853-3-frattaroli.nicolas@gmail.com>
 <deb50900-fcfd-23d0-ab8a-0e64b2abb063@arm.com> <2412250.zZEsDtmPgG@archbook>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <70cb1e4b-ecb7-2a4b-ee35-02f5a6b8a986@arm.com>
Date: Thu, 19 Aug 2021 18:02:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2412250.zZEsDtmPgG@archbook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
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

On 2021-08-19 14:52, Nicolas Frattaroli wrote:
> On Donnerstag, 19. August 2021 14:08:36 CEST Robin Murphy wrote:
>> On 2021-08-17 11:11, Nicolas Frattaroli wrote:
>>> +  rockchip,trcm-sync:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description:
>>> +      Which lrck/bclk clocks each direction will sync to. You should use
>>> the +      constants in <dt-bindings/sound/rockchip,i2s-tdm.h>
>>> +    oneOf:
>>> +      - const: 0
>>> +        description:
>>> +          RK_TRCM_TXRX. Use both the TX and the RX clock for TX and RX.
>>> +      - const: 1
>>> +        description:
>>> +          RK_TRCM_TX. Use only the TX clock for TX and RX.
>>> +      - const: 2
>>> +        description:
>>> +          RK_TRCM_RX. Use only the RX clock for TX and RX.
>>
>> I wonder if that might make sense to have boolean properties to describe
>> the latter two cases (which would effectively be mutually-exclusive),
>> rather than a magic number? Or possibly even just make the respective
>> clocks optional, if this is something which would be done per-SoC rather
>> than per-board?
>>
> 
>  From what I know from downstream vendor device trees, these are per
> board, not for the SoC as a whole. There are I2S/TDM controllers on the
> SoC which I think are hardwired to certain other IP blocks, such as I2S0
> being connected to HDMI, but I2S1 can be routed outside of the SoC where
> these come into play I believe.

That's fair enough. I know a lot more about DT bindings than I do about 
I2S, but I did guess it might be related to clocking requirements of the 
connected codec rather than a constraint of the I2S block itself.

> As for making them boolean properties, I'd rather not. If I were to make it
> two mutually exclusive booleans, this would result in 4 possible states
> rather than 3, and require complexity to check it both in the schema and
> in the probe function. Like this, I can get away with a switch case that
> has a fallthrough, and a list of consts in the schema.

Complexity?


	if (of_property_read_bool(node, "rockchip,trcm-sync-tx-only"))
		i2s_tdm->clk_trcm = RK_TRCM_TX;
	if (of_property_read_bool(node, "rockchip,trcm-sync-rx-only")) {
		if (i2s_td->clk_trcm) {
			dev_err(i2s_tdm->dev, "invalid trcm-sync configuration\n");
			return -EINVAL;
		}
		i2s_tdm->clk_trcm = RK_TRCM_RX;
	}
	if (i2s_td->clk_trcm)
		i2s_tdm_dai.symmetric_rate = 1;


If I'm counting correctly, that off-the-top-of-my-head example is a mere 
58% of the size of your switch statement ;)

The usual aim in designing bindings to robustly abstract the underlying 
features, not to be easy to implement. That's why the "put this magic 
value in this register" style of property is generally frowned upon.

As for the schema, it doesn't necessarily have to try to exhaustively 
catch every possible usage error - if a combination of properties is so 
obviously nonsensical that a driver shouldn't accept it anyway, I'd 
imagine it's unlikely to slip through testing.

>>> +
>>> +  "#sound-dai-cells":
>>> +    const: 0
>>> +
>>> +  rockchip,no-dmaengine:
>>> +    description:
>>> +      If present, driver will not register a pcm dmaengine, only the dai.
>>> +      If the dai is part of multi-dais, the property should be present.
>>> +    type: boolean
>>
>> That sounds a lot more like a policy decision specific to the Linux
>> driver implementation, than something which really belongs in DT as a
>> description of the platform.
> 
> I agree. Should I be refactoring this into a module parameter or
> something along those lines? I'm unsure of where this goes.

Depends on what it actually means, and whether that's something the 
driver can figure out for itself. I just see a DT property based around 
a particular Linux API call as a big red flag :)

>>> +
>>> +  rockchip,playback-only:
>>> +    description: Specify that the controller only has playback
>>> capability.
>>> +    type: boolean
>>> +
>>> +  rockchip,capture-only:
>>> +    description: Specify that the controller only has capture capability.
>>> +    type: boolean
>>
>> Could those be inferred from the compatible string, or are there cases
>> where you have multiple instances of the IP block in different
>> configurations within the same SoC? (Or if it's merely reflecting
>> whether the respective interface is actually wired up externally, could
>> that be inferred from the attached codec?)
>>
>> Robin.
>>
> 
> They can't be inferred from the SoC because there are indeed multiple
> instances of this IP block in different configurations on the same SoC.
> The RK3566 and RK3568 have four in total, of two different categories,
> each being able to be configured for a different format (though the
> number of channels and available formats vary for the two categories,
> one group only supports I2S and PCM with two channels)
> 
> The particular configuration may even vary per-board; an I2S/TDM
> controller may be connected to an external codec which does not
> support capture, whereas on another board it may be connected to
> one that does.

Fair enough again, but surely if the codec doesn't support capture then 
in the end no capture interface is going to be exposed anyway - does the 
low-level transport need to care?

> As an example, if I understand it correctly, I2S3 on the RK3566 and
> RK3568 can do 2 channels RX and TX in I2S mode, but only 2 channels
> either RX or TX in PCM mode, but I'm unsure of the language in the
> (still not public) documentation I have.

And that starts to sound like something the driver should probably be 
aware of anyway, but at very least only casts more doubt on these 
particular properties - even if an interface to a stereo PCM codec 
couldn't support simultaneous playback and recording, couldn't it still 
support doing either, separately?

Robin.
