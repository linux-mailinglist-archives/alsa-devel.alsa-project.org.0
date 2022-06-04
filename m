Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FD253D619
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jun 2022 10:24:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E1CB175F;
	Sat,  4 Jun 2022 10:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E1CB175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654331086;
	bh=0AaBduRrXcoF0NJ0MYh0cIl2NOWzfp/F7sdL2Z8MCn0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=csprJS5zjlT77otqGbV2D+uss38cBxFZElEtYZ8EHVbOK3B7KzNIxsL6pF0QXJ9Ug
	 srWFafzX1enmchZf9Zu3rWJkS3uyhkgDF2Cm1GTi5OZCGW6GIrdcKrNbop3BI7X2lH
	 5+gzWCVh5em4SU843I/4e8CbU7S13UZ7q9Tk6xz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC0CAF801EC;
	Sat,  4 Jun 2022 10:23:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9145F8016D; Sat,  4 Jun 2022 10:23:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F925F80089
 for <alsa-devel@alsa-project.org>; Sat,  4 Jun 2022 10:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F925F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="p5YD7LlS"
Received: from [192.168.0.109] (unknown [123.112.66.143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id BBA1A3F12B; 
 Sat,  4 Jun 2022 08:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1654331016;
 bh=aQvt7Mjm/73yrtUJKZPUj0EaH8bpxfi4gFxjX9P1QCg=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=p5YD7LlSulE6nE3KMJnl4ZNCO4RZj/OuiqynMGu6rtCUEAy9Tb7QwNOf1iF+e/zNt
 szd8p4/BvsCQHO7GlwoGTA+p9UapscOfvspBQ/vMLOqaAVSTG2NqVmdwoUaKJhBgaq
 mcBcLTHGBmIScrb08MuNShl4FGcUl2NQ7//6gwvxBOUkVfCRnc700mfDL/M3q3XQNV
 YA0CIGQlLVH2uJkPwGOXhO8tQBYGo5LPCwVb76hL/x3v22+Iy24q+xm6mFZGxk0eGC
 vlGnmuxAJIiceZ5J+I0sGHYdZsHXD/qdLDfXDDka6osZ2QuFb9nDrrbbGaeExrb7kq
 57e5rYcEjdyyg==
Message-ID: <087d4274-c744-77f0-287e-0f4fe3b2ad67@canonical.com>
Date: Sat, 4 Jun 2022 16:23:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] ASoC: nau8822: Add operation for internal PLL off and
 on
Content-Language: en-US
To: David Lin <ctlin0.linux@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20220530040151.95221-1-hui.wang@canonical.com>
 <20220530040151.95221-2-hui.wang@canonical.com>
 <c492a0f0-779b-6438-6245-3d6f159b48ef@gmail.com>
 <817ab950-db61-9d48-f51f-41009c8bd23d@canonical.com>
 <YpiR5ov8X/5yQACT@sirena.org.uk>
 <cd69d7e3-6a54-7438-b126-5962a8951ca3@canonical.com>
 <YpneCrGXLYeK9WB5@sirena.org.uk>
 <95d95e72-4230-a1c9-83f5-ed1449164182@gmail.com>
From: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <95d95e72-4230-a1c9-83f5-ed1449164182@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: wtli@nuvoton.com, kchsu0@nuvoton.com, alsa-devel@alsa-project.org,
 ctlin0@nuvoton.com
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


On 6/3/22 21:26, David Lin wrote:
> On 2022/6/3 下午 06:10, Mark Brown wrote:
>> On Fri, Jun 03, 2022 at 05:55:18PM +0800, Hui Wang wrote:
>>> On 6/2/22 18:33, Mark Brown wrote:
>>>>> Thanks for your comment. But it is weird, it doesn't work like you 
>>>>> said,
>>>>> probably need specific route setting in the machine driver level?
>>>> Is this triggering due to reprogramming the PLL for one direction
>>>> while the other is already active (eg, starting a capture during
>>>> a playba
>>> Yes, it is. With the current machine driver of fsl-asoc-card.c, if 
>>> starting
>>> a capture during a playback or starting a playback during a capture, 
>>> the
>>> codec driver will reprogram PLL parameters while PLL is on.
>> So your patch fixes that case - note however that you're probably
>> getting an audio glitch in the already active stream while doing
>> this.  I'll send a patch which should improve that shortly. BTW,
>> shouldn't the PLL power be left off if the output frequency is 0?
>
> Agree Mark's comment.
>
> By the way, when the platform's dai_link support be_hw_params_fixup 
> callback, the sample rate will be fixed to same rate, so PLL will not 
> be also reconfigured during playback and recording at the same time.
>
Agree with your comment. And the Mark's patch is a better one. After 
Mark's  patch is merged, I will revert my [1/2 PATCH] if that is not 
dropped from the Mark's tree.

And then I will update my [2/2 PATCH] as below since the error of 
"fsl-asoc-card sound-nau8822: failed to stop FLL: -22" need to be 
handled and pll_param->freq_in/freq_out need to be cleared. If 
freq_in/freq_out is not cleared, it is possible that the 
NAU8822_REG_CLOCKING can't be updated (suppose play sound by PLL -> MCLK 
-> PLL).

@@ -726,6 +726,13 @@ static int nau8822_set_pll(struct snd_soc_dai *dai, 
int pll_id, int source,
         struct nau8822_pll *pll_param = &nau8822->pll;
         int ret, fs;

+       if (freq_in == 0 || freq_out == 0) {
+               dev_dbg(component->dev, "PLL disabled\n");
+               pll_param->freq_in = 0;
+               pll_param->freq_out = 0;
+               return 0;
+       }
+
         if (freq_in == pll_param->freq_in &&
             freq_out == pll_param->freq_out)
                 return 0;

>>> And in another case, if the snd_soc_dai_set_pll() is called in the
>>> card->set_bias_level() instead of card_hw_params(), the PLL will 
>>> keep being
>>> off since check_mclk_select_pll() always returns false.
>> That should be fixable...
