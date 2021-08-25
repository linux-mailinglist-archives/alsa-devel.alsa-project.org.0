Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9C13F752A
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 14:35:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDC7E167A;
	Wed, 25 Aug 2021 14:34:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDC7E167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629894903;
	bh=KZpPw79G+Yb8LnS8Bb9pFbwFEWXCfXaTZqglpRjSyC0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T0vyV+ich+bkBPqXnJND19hQoH7qLonOebTfES4Q30+XLWQmWAdYrq8ON3aRITTQo
	 uG9CsWmQNQVSCOu6YdiNVm8lhoIuTbb1o+geOXBGJru1fMgIRyUbSg3b1sYVveQ1Au
	 BZnIOPMiYso9q2EqnI/vmlUF8d3JItZdYjb5oLx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EED9F8003C;
	Wed, 25 Aug 2021 14:33:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73506F8020C; Wed, 25 Aug 2021 14:33:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F925F800C9
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 14:33:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F925F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com
 header.i=@kernel-dk.20150623.gappssmtp.com header.b="OZDKKzHn"
Received: by mail-io1-xd36.google.com with SMTP id q3so13190054iot.3
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NSRQrDmq/EfihE21lvhIAAL69eKqPhpJ9u28s5cgZ/8=;
 b=OZDKKzHnE3yX63xl2KH664RSsyxD9nSvk5v5cjwZDb4qgxncCeUSuZGy9yN+3QqOCY
 52kFY6V64+HEM00a3PcnnmEwkUpi6J6Y8GiORj3Dlq1KMJQm3728oTrU35hbvCZMBkat
 7tAhfseTkJWp4S0MoegMK1oaqcOot/D0N3bEAiQgmObH7KmwNz7I5mkOVrvTeofCR4eq
 TFjo9Gos29FSHHc1sdcrtFzndxyQZoBo1gj+EsSpefLu4IExmCXOGOkIhyBNlQhFEJBZ
 GDWGNzInBuxKuzFh0tgU8bB/rBlmG/ySU0Hr98AcVydv9r92+2OdCiBiLWKT9lTOVIvK
 MSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NSRQrDmq/EfihE21lvhIAAL69eKqPhpJ9u28s5cgZ/8=;
 b=BajOv5a50quw1zTv2ZOZhBge2d+et6mra8Fey58pFYBhCahvwiZV/iC5A/mAJxlAQ8
 2AfA4GBo1wQWiRtFyQNbz40H0jgygZDdD6+2gIMUL1Y90wM56u3ficD1ikx3SB8M8WLL
 xDuBMeG54dfDMykvm4EYZyKEKVn536q/d80T5lUUl4FSCLvL6PaiXaVqzcjD8m/RriW2
 9h7IRiuelBUmzK0e/ij0Te6NG9r2c+W6vIW+DV9SNaGOAR5FGElE92XY9fxczhoCNhan
 hiKN3B1vwhIKEtaa75YzmtxXqn22bZou0Tk82ZWq4AAyQ3x8wGeHLGcEINS8kmDvdciQ
 JEsQ==
X-Gm-Message-State: AOAM531GXGl+H4L7yVc1vMSByvo9893D6a/h8PMdLuEEo3nfJSO/VopX
 yF0kI26tQHRWwkxED6fRUGYogQRVtvETbg==
X-Google-Smtp-Source: ABdhPJytZzejO29fs7o4z8o0k7muGVpCKPYOA+V9SCVRS4hMDUFQ1Qzf9eMPe84PZ/Gloh6lzZO8Sg==
X-Received: by 2002:a05:6602:2001:: with SMTP id
 y1mr28849781iod.97.1629894811926; 
 Wed, 25 Aug 2021 05:33:31 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id n11sm3484506ilq.21.2021.08.25.05.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 05:33:31 -0700 (PDT)
Subject: Re: azx_get_pos_skl() induced system slowness
To: Takashi Iwai <tiwai@suse.de>
References: <402d5952-3bf6-5c0d-5276-8367bfe1542a@kernel.dk>
 <s5h7dga1267.wl-tiwai@suse.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <e82c04e5-45c7-cb88-a130-33c2043d3f4a@kernel.dk>
Date: Wed, 25 Aug 2021 06:33:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5h7dga1267.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, kai.vehmanen@linux.intel.com
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

On 8/25/21 12:14 AM, Takashi Iwai wrote:
> On Tue, 24 Aug 2021 19:38:08 +0200,
> Jens Axboe wrote:
>>
>> Hi,
>>
>> Got a new notebook recently, it's a Lenovo X1 Carbon 9th gen. Sound
>> works fine, but sometimes I get really stuttering playback from nestopia
>> and I finally decided to look into it. When this happens,
>> azx_get_pos_skl() is seemingly called a lot, at least it uses a ton of
>> CPU cycles. This comes and goes, sometimes 1 minute in between,
>> sometimes 2, and sometimes 30 seconds.
>>
>> If I comment out the udelay() in that function it does seems to be
>> noticeably better, though it's not a complete fix. I guess it just
>> reduces the pain of calling it so many times?
>>
>> This is running 5.14-rc7, but it's not a recent regression.
>>
>> Any clues as to what this might be?
> 
> Are you using PulseAudio?  Or pipewire?  The former might cause lots
> of position update calls when the device doesn't give back the stable
> (or consistent) position report.

I'm using the default (mint) which is pulseaudio. But after reading your
reply, I switched to pipewire - hopefully that'll work better!

> The code there was borrowed from the ASoC Intel Skylake driver
> (sound/soc/intel/skylake/skl-pcm.c), and the same is also carried to
> the recent ASoC SOF HDA driver, too.
> As far as I understand from the comment, the udelay() itself could be
> reduced only for the case right after the interrupt wakeup.  That is,
> a hackish patch like below might help.
> 
> But, as far as I see with PulseAudio, it still results in a lot of
> register read -- so PA seems repeatedly reading the position.
> 
> A better result (only from the CPU usage POV) could be gained on my
> machine by just switching to another position inquiry; namely, pass
> position_fix=1 option to snd-hda-intel module.  But I checked this
> only for a short period, so am not sure about the long run.

Let me know if you want to test the patch or using that option, for now
I just went with pipewire and will see if that works any better.

-- 
Jens Axboe

