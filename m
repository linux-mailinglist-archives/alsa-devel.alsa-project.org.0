Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC7E520545
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 21:23:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E6469F6;
	Mon,  9 May 2022 21:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E6469F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652124238;
	bh=ijAsnDJtPF6sZR/cESsldxini6x3hwIycrPcyX4nDh0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NcgQWNZlE/UgOPXsJIqFBUUkj3JML/g8bn7maTOsHwgkqvJjqPFkpoI/DxmRwKxDc
	 1RTj74InNTU0VTtq+JatZXBe2wpRXo9xJ98mzjpkI2hRzyFkaJXLFM/s8RmVDlPcSy
	 OZr5VHWHvIaW4sf/wMlcsnlscYJpBXYl+ljZCd20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8106AF8011C;
	Mon,  9 May 2022 21:22:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8563BF8025D; Mon,  9 May 2022 21:22:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from server.euro-space.net (server.euro-space.net [87.117.250.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE19AF800D3
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 21:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE19AF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=birdec.com header.i=@birdec.com
 header.b="Qf7v34GY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=birdec.com; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4u47BCK/790knsR75bTXA4NpiHdmdj09wJGyi2xvp1U=; b=Qf7v34GY+puhb0gRv16vvTmvsv
 f2pibIAGEe9eFJDAncn9/HMmE/g/X2tf/SrNwb43Hklz1cIrtjaa4dIgDGZYhOiuRr1cN/MU1MLbD
 MoAd/ro5DESEhV+hRfUAkiRGrd4l+hQ7B1J6B9AFys8tTPuuvsPuraAD6ApO0A6nJLIeCA1+0ml+Q
 44Xjl0DRM55CTXs1mhHWdUY1eayxmqgtqXptUtxJFoK85Hg907+0Y/AakY4cPY+4/wpJWdPq/a8Bh
 CjrG4glnkWOLgW79158Qwe5aBwMg+sdYG6sQTvRF5XNiHtHROHJ0TL4i1rFnaeHAW+jK08SnecIXz
 xkw/QpQg==;
Received: from dynamic-176-002-223-001.176.2.pool.telefonica.de
 ([176.2.223.1]:46096 helo=localhost.localdomain)
 by server.euro-space.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <kmarinushkin@birdec.com>) id 1no8xy-000CJF-Ks;
 Mon, 09 May 2022 20:22:47 +0100
Subject: Re: [PATCH 01/38] ASoC: soc-component: Add comment for the endianness
 flag
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
 <20220504170905.332415-2-ckeepax@opensource.cirrus.com>
 <ec86bdc6-b3c4-e595-02c8-e0687c442fd3@birdec.com>
 <20220509083729.GX38351@ediswmail.ad.cirrus.com>
From: Kirill Marinushkin <kmarinushkin@birdec.com>
Message-ID: <901cb995-4a82-741e-00ea-a1c0b22ae749@birdec.com>
Date: Mon, 9 May 2022 21:22:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220509083729.GX38351@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.euro-space.net
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - birdec.com
X-Get-Message-Sender-Via: server.euro-space.net: authenticated_id:
 kmarinushkin@birdec.com
X-Authenticated-Sender: server.euro-space.net: kmarinushkin@birdec.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched
Cc: oder_chiou@realtek.com, steven.eckhoff.opensource@gmail.com,
 alexandre.belloni@bootlin.com, lars@metafoo.de,
 kuninori.morimoto.gx@renesas.com, chrome-platform@lists.linux.dev,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 codrin.ciubotariu@microchip.com, alsa-devel@alsa-project.org,
 bleung@chromium.org, cychiang@chromium.org
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

Hello Charles,

On 5/9/22 10:37 AM, Charles Keepax wrote:
> On Sun, May 08, 2022 at 10:34:12PM +0200, Kirill Marinushkin wrote:
>> In the [PATCH 00/38] of this patch set, you write:
>>> 2) Devices behind non-audio buses, SPI just moves bits and doesn't
>>> really define an endian for audio data on the bus. Thus it seems the
>>> CODEC probably can care about the endian. The only devices that fall
>>> into this group (mostly for AoV) are: rt5514-spi.c, rt5677-spi.c,
>>> cros_ec_codec.c (only the AoV).
>>  From my experience with some PCM codecs by TI, they can not care about the
>> endianness. For example, in driver [1], if I allow BE format as
>> well, and configure
>> the sound card to use BE, it will not work. I have no sound with BE.
>> In these cases, the codec HW supports *only* LE. That's why their
>> `snd_soc_dai_driver`
>> structures provide only LE in the `format` field.
>> If such drivers specify `endianness = 1`, then `soc-core` will
>> extend their supported
>> formats with BE counter-parts, see [2]. AFAIU, it will have the same
>> effect, as if the
>> drivers themselves provided their formats in both LE | BE.
>>
>> I don't think adding `endianness = 1` to such codecs will work as expected.
>> Unfortunately, I don't have an easy access to HW today, to confirm
>> or disprove
>> this understanding.
>>
> This sounds like an error on the CPU side of the DAI link rather
> than the CODEC side of the DAI link. The formats that will be
> supported on the link are the union of the CPU and CODEC supported
> formats, ie. a format must be supported on both for the DAI to
> support it.


Yes, agree, both sides of the DAI link should provide only endianness 
they support.

This works currently, but, from my understending, it will break, after 
we set `endianness = 1`.

As soon as we start setting `endianness = 1`, the function 
`convert_endianness_formats()` will extend LE to (LE | BE), right?

If so, setting `endianness = 1` is the source of an error, right?


I could be missing something. Let's see what other reviewers think.


> The CPU I2S hardware should be sending out the bits in the same
> order regardless of if the data you feed it is BE or LE, as I2S
> specifies an ordering for the bits.


What does the endianness in the driver configure, then?


> If this is not the case then
> the host I2S controller is claiming to support an endian it does
> not, and the problem should be fixed on that side by removing the
> supported endian.


I think we have a misundersanding of my example.

In my example, i don't mean, that my CPU part of the DAI link is broken.

What i tried to demonstrate - is that if i set the unsupported 
endianness, i wouldn't expect that "the CODEC probably can care about 
the endian", as the message in [PATCH 00/38] suggests. I would expect, 
that i will have no sound.


Best regards,

Kirill

>
> Thanks,
> Charles
