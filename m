Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0E4105A52
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 20:23:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA20317AF;
	Thu, 21 Nov 2019 20:22:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA20317AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574364198;
	bh=4XJ9bTmBrTw43n1O8VarrFSR2CE2/slfcxgAJNVGP+w=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AkhKwmJrWfON96L2A/twKZ00wu1VzT1wTXXrHJfQnirdVq09sjPEK5pmy2EcYdfxN
	 9jVP5o1xyj2+ZrD0SlE1pUG5K5S/amzuWowT1dBzaibQiyNfnogsKMobOzUy1GYeAZ
	 8a9MnBavFlczLQJgxQZDWjdg7f35yferd3cTXSuo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 726F5F8014C;
	Thu, 21 Nov 2019 20:22:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96D20F8014C; Thu, 21 Nov 2019 20:22:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42A8AF800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 20:22:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42A8AF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="Nz9Tobym"
Received: by mail-il1-x142.google.com with SMTP id a7so4416244ild.6
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 11:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AUYpCoOsWYyPUKhJnruj811k34dkK/YW4ZdZ2Znb05A=;
 b=Nz9Tobymw3rLvTh8sBsQmokxgbIDltKEQb7UqTOdYcQHhn1jenx1BQGT7S5/KJOZqc
 3pTJZNUKCk16NwJ3F5/Zuql9jkF1NVeJMGae/S/RRNIk1Li8SPJbYjfdx01FHhbQjpry
 WfqJ7COQfKxupl6i1MhpfsF2i6+Mf6aJMybVEofM0F2jLY2FR5VurtfLBX+lfQK6F1cQ
 JyBgk5olPwbM+LhlFeahgOMhPg6LGMDyJXL9ZrAEnBw/6/uc84bR0GDE+OE2nyRKZ0np
 VxEUFf83G8BA0gbtTurQFagtG6yBcwbHvL3gBEWAdIDjA8HKjwpzG2tZEcW0x1SJj6MD
 MFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AUYpCoOsWYyPUKhJnruj811k34dkK/YW4ZdZ2Znb05A=;
 b=XfRbq/5v3ktNCyV+kjgS0oFUUFg/NjF4ZNgqrk47zsEljU9QLUYlc32LaCnd9O5WcL
 3dIddcamVZtftxguQr9DgvKmCkUOEzQ/UgkgQHR2RQkxUpATvfHpkoMzKDZduonRsOyz
 Eim+dR1AW0ft8lyQOxBdMiZwPTrb4+LDmiCnBgGIK3+QAHFjFWosMgcD4wUtPWtf+jvE
 vnjqWVf3mnNp+RrKbs22AFHUTikp+Dq4SkgqrJuUL7+EbAmFBIfbMr214lAvS62quCRK
 PChZevFhhh5dvgZJ5T+fO5OrcxKYMhsBf3ZKoeM9JW2tepUvjqd9VWQzFD8KSD7BAA9U
 nZ4w==
X-Gm-Message-State: APjAAAVjhHsnPlN8qjq/5SyPFNoKE2DTkADrGqS0EVBdolphP/OenJwm
 SFSHK9UZJJbNKMzFRSXnnV3k70CyVk58TdgzdKsgXg==
X-Google-Smtp-Source: APXvYqzE8gaZN+surX0UIAiHauqy16HGUH61rztL54QVlD97TsbHUOSb8QamasdD88fh45/WAXP29+VgmXGyX3JDIjA=
X-Received: by 2002:a92:8ccc:: with SMTP id s73mr11896459ill.86.1574364133992; 
 Thu, 21 Nov 2019 11:22:13 -0800 (PST)
MIME-Version: 1.0
References: <20191117085308.23915-1-tiwai@suse.de>
 <20191117085308.23915-8-tiwai@suse.de>
 <3b407a02-b791-52a4-2335-e21d8ab732dd@linux.intel.com>
 <s5hy2wdyq3t.wl-tiwai@suse.de>
 <CAFQqKeWgqHwrCSSbLrkuCHkBww2g4dsBcF93SDN_ZK_-KSe5tg@mail.gmail.com>
 <s5hpnhpyng6.wl-tiwai@suse.de>
 <CAFQqKeWPgPWpDgZUPvOqSFUY2Zq=8zW-=LhYimtg0S0Hqpc43A@mail.gmail.com>
 <s5hmucszzni.wl-tiwai@suse.de>
 <3fc820272992362a56881abf7230f1500fdfdd2a.camel@linux.intel.com>
 <s5hblt8z7ow.wl-tiwai@suse.de>
 <030249cd63d754bd70ce5de5c58e04784eecebff.camel@linux.intel.com>
 <s5hv9rgxohq.wl-tiwai@suse.de>
 <ce61828881dea0fffd2c26a92ad2571ab3565404.camel@linux.intel.com>
 <s5hy2wbwo8c.wl-tiwai@suse.de>
 <CAFQqKeVsQ1AjjKgS-HJ0-mg7JbbmMVjJcUB7wbvsbyz9e2TqLg@mail.gmail.com>
In-Reply-To: <CAFQqKeVsQ1AjjKgS-HJ0-mg7JbbmMVjJcUB7wbvsbyz9e2TqLg@mail.gmail.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Thu, 21 Nov 2019 11:22:03 -0800
Message-ID: <CAFQqKeWVuJs+bnZsrYAHdke0pZpBSmP71RFVrfwVE3=P4A7hsw@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 7/8] ALSA: pcm: Add card sync_irq field
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

>
> > >
>> > > I couldn't find anything obvious.  Could you try without changing
>> > > snd_sof_pcm_period_elapsed(), i.e. only adding the stuff and calling
>> > > sync_stop, in order to see whether the additional stuff broke
>> > > anything?
>> > It is indeed the removal of snd_sof_pcm_period_elapsed() that makes the
>> > device hang when the stream is stoppped. But that's a bit surprising
>> > given that all I tried was using the snd_pcm_period_elapsed() directly
>> > instead of scheduling the delayed work to call it.
>>
>> If I read the code correctly, this can't work irrelevantly from the
>> sync_stop stuff.  The call of period_elapsed is from
>> hda_dsp_stream_check() which is performed in bus->reg_lock spinlock in
>> hda_dsp_stream_threaded_handler().  Meanwhile, the XRUN trigger goes
>> to hda_dsp_pcm_trigger() that follows hda_dsp_stream_trigger(), and
>> this function expects the sleepable context due to
>> snd_sof_dsp_read_poll_timeout() call.
>>
>> So something like below works?
>>
>>
>> Takashi
>>
>> --- a/sound/soc/sof/intel/hda-stream.c
>> +++ b/sound/soc/sof/intel/hda-stream.c
>> @@ -592,8 +592,11 @@ static bool hda_dsp_stream_check(struct hdac_bus
>> *bus, u32 status)
>>                                 continue;
>>
>>                         /* Inform ALSA only in case not do that with IPC
>> */
>> -                       if (sof_hda->no_ipc_position)
>> -                               snd_sof_pcm_period_elapsed(s->substream);
>> +                       if (sof_hda->no_ipc_position) {
>> +                               spin_unlock_irq(&bus->reg_lock);
>> +                               snd_pcm_period_elapsed(s->substream);
>> +                               spin_lock_irq(&bus->reg_lock);
>>
> Thanks, Takashi. Yes, I realized it this morning as well that it is due to
> the reg_lock. It does work with this change now. I will run some stress
> tests with this change and get back with the results.
>
Hi Takashi,

Sorry the stress tests took a while.
As we discussed earlier, adding the sync_stop() op didnt quite help the SOF
driver in removing the delayed work for snd_pcm_period_elapsed().

Thanks,
Ranjani

>
> Thanks,
> Ranjani
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
