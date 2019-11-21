Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BACE105B54
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 21:48:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06FA417B0;
	Thu, 21 Nov 2019 21:47:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06FA417B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574369301;
	bh=xxNBzB7gYouzRDCSgik6Sxh/CeTX4HB/HIOCvNCyPXo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LBWN+xY8uLqu+xEHKl2WBbcGGknOf8z0kQoCSDgoKQMlNBP3s/+KcqtxCpsftl9R0
	 64NKAvRa1JHdHvBiFNPqA9ll3bpsvhT4T4Sy5sJyahXYZ8J23IWz356S2UFJtVwVxf
	 kO8lzfXYNaw9GOsObZ8PrXilVry3B3U4G+glvIyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E292F80146;
	Thu, 21 Nov 2019 21:46:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD13AF80146; Thu, 21 Nov 2019 21:46:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BB71F800EF
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 21:46:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BB71F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="rcGUx83W"
Received: by mail-io1-xd41.google.com with SMTP id v17so5066003iol.12
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 12:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RKA5ZWfmWS+2Qc1T/gh5s52mBpii2iIDSwLFMOaYtLw=;
 b=rcGUx83Wdj60b9PmHngt1yH/aC9pw6m5Z8F43IG0a3pnYtSg8rvcbQx9VKU7nOLQWz
 cEeqoOSMFYgDaWsQeMmmAnjwTS96mmSg6Vrr4ugjmzDsLGQf2grjT/YbrRu+TB4k2cQA
 9e3CrNDRkWsLjI92isEkjFXD1rwhsFjJiN+F6PQPU6KkJ9r4KVTRHAcr6MXnV0f12U00
 SQ7GyWY3tmO8GqtbalaGr/R5V2ArUCps2+5A0/YUPGrERXFR9dKvsDE0xiSy3QQVmAYI
 pE5uoEPyXJucA6pMoComO1IXT0idoPebwhD29CCnJ+2NIp3sJ76UFgEHOixH5y5Ss9CM
 hVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RKA5ZWfmWS+2Qc1T/gh5s52mBpii2iIDSwLFMOaYtLw=;
 b=BbhHw/712ukAhhdA1cbMGR2ttcV/U37PdeRmRV4Qyg8E6A85AnU2oP59X5ehohHUNO
 Z0BMQxRpIHz1pVE10TSqRLeMSt0kPxL0If5dbVkHUnohtSpVwND61qvXKYLT0mW9tCBo
 7WgxaWMmOvgZwbAm8Ble9H5s7O7NX7MoMwGBd4MAIDWwOc9Oa9pzLksiQOKe2Sk3gDUI
 BNfIZtSL9X+M7qRVYiAA80iggiltrg+wSOd2BSsixr/free0/EwyNPImebzAkG3aVYsz
 GXEvBXu7Hbg8QFaGjZrns2W2NldQxH8UwcpYUf2JC5rgFJvQj0RczYAgMlCpPfu/oO84
 E2/w==
X-Gm-Message-State: APjAAAWFxnMN1WvznNkFfXWBbcaYjHLOT/89+ffqcgngEqd3hqKkrexp
 5+Hs6TFVUBolczVnb/Ad1L04ina5TmZmfQmgaD0hhw==
X-Google-Smtp-Source: APXvYqzYYkH/GRINU5bh1Nk6eh7d4ikmuEwH6vUWVXldP3VIgzB9r+Otj9VAtqrNYQof33OhD8I41LTKpPKQSYTAOoQ=
X-Received: by 2002:a5d:97d9:: with SMTP id k25mr6792086ios.142.1574369188911; 
 Thu, 21 Nov 2019 12:46:28 -0800 (PST)
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
 <CAFQqKeWVuJs+bnZsrYAHdke0pZpBSmP71RFVrfwVE3=P4A7hsw@mail.gmail.com>
 <s5himndrmsv.wl-tiwai@suse.de>
In-Reply-To: <s5himndrmsv.wl-tiwai@suse.de>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Thu, 21 Nov 2019 12:46:17 -0800
Message-ID: <CAFQqKeUimt32z1myzL+JOXoCUhn7jU1=Mj8e6egQKs+c5CY0pA@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>, "Jie, Yang" <yang.jie@intel.com>
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
>
> >
> > Hi Takashi,
> >
> > Sorry the stress tests took a while.
> > As we discussed earlier, adding the sync_stop() op didnt quite help the
> SOF
> > driver in removing the delayed work for snd_pcm_period_elapsed().
>
> Yeah, that's understandable.  If the stop operation itself needs some
> serialization, sync_stop() won't influence at all.
>
> However, now after these discussions, I have some concerns in the
> current code:
>
> - The async work started by schedule_work() may be executed
>   (literally) immediately.  So if the timing or the serialization
>   matters, it doesn't guarantee at all.  The same level of concurrency
>   can happen at any time.
>
> - The period_elapsed work might be pending at prepare or other
>   operation;
>   the async work means also that it doesn't guarantee its execution in
>   time, and it might be delayed much, and the PCM core might go to
>   prepare or other state even before the work is executed.
>
> The second point can be fixed easily now with sync_stop.  You can just
> put flush_work() in sync_stop in addition to synchronize_irq().
>
> But the first point is still unclear.  More exactly, which operation
> does it conflict?  Does it the playback drain?  Then it might take
> very long (up to seconds) to block the next operation?
>
Hi Takashi,

As I understand the original intention for adding the period_elapsed_work()
was  that snd_pcm_period_elapsed() could cause a STOP trigger while the
current IPC interrupt is still being handled.
In this case, the STOP trigger generates an IPC to the DSP but the host
never misses the IPC response from the DSP because it is still handling the
previous interrupt.

Adding Keyon who added this change to add more and clarify your concerns.

Thanks,
Ranjani

>
>
> thanks,
>
> Takashi
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
