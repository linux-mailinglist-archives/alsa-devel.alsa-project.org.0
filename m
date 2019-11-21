Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA466105BC5
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 22:19:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 501B817BB;
	Thu, 21 Nov 2019 22:18:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 501B817BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574371185;
	bh=Giax/u3Lv3MYwOwL3ns7Y5+JIcZj9V0WOxgFYljEr7o=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EuyBF81J1mXQE6lqsltbJ80hQw2abzgFJY3eNl469/xOC7CHDHrI3GQp9JeDZIcO0
	 XrXZHD56Bq0Dix7hIAOT0S1PUPSB2zoswQbtfJHF4xuNtBOSSyIaAnKt3rI8y1aeZ0
	 /bGlFXPmSnBTnYov/IN4bef1+sf+QAFm4tsvM88Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C1BDF8014C;
	Thu, 21 Nov 2019 22:18:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1E4DF80146; Thu, 21 Nov 2019 22:17:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72C78F800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 22:17:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72C78F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="QZpJQSHw"
Received: by mail-il1-x141.google.com with SMTP id q15so4748978ils.8
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 13:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fgTHviA9/5/6QZ9K2ZnTMEdZiy2K0u7tTnBoFXuVm8Q=;
 b=QZpJQSHw4O5H8nn98fdaoPESeFtZ8ypevL9/xS8qDteQSYbLfX5RzWkjskFLLtv65z
 vYFnN1zP9Pxvp33HYfEG/f0EQbsQ45aeFMM5wr+0vhyODNN+Lv8Dxj7SsN/utlzflalP
 LXdD9cgLul0hv+ZhBZ+rBokhYBnKvSRF260lbjMz3v0VftlPhcnA2WwhvupvSgVdKUnn
 uzidCjS5LD0P2PnQoSY6iaNAq7iNRBfalDx33Ry9uXZSYDOfOfphJKEg8pihYroAuR/K
 nbvsU5HPGrnmCLHlES5ULkqj14aCOGaCbXc39HbUxUq4qJiRWbj6sMfX/CF5WFvXNxR+
 aKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fgTHviA9/5/6QZ9K2ZnTMEdZiy2K0u7tTnBoFXuVm8Q=;
 b=Phhv9ywZ45eR2CL4ed5xQpXsiF8LUf/jVL7H/yqquINywKhDooGLU6W3BLr/BUQ/Ub
 sAF9HOZLOt37cNtC3amNhmy3IT8N8kMbmn5KET3iNcaUHgDq6omqqVn5hVzh23JUxwsF
 C5ttqEFU1yjnfG8leO6VFgN58xFltdeeYyq1f3o0SIpBhHpDKDWn3EUFqzRkARXNQKyh
 lc5Q/QBZsSP8BKeCUEYUzL8AAr5+3lz94OKPV44cOzBn6H76zxe2GJ44y7P4aZxW2ddt
 PfYPqAmtj3AkUuG486C5Snfdz3mmW+lrcNwzvEjvS2nbo+FuZwL75caiJCeSWltxHNDn
 6Gkw==
X-Gm-Message-State: APjAAAUs6OTNQuwkL0jRMA35/lBS5qxWu/E6VXxZvCdc34r5pRx8fmSd
 c/KjprFqES292c5frYg2VoLY7yrrxxF6xyAttLZCRA==
X-Google-Smtp-Source: APXvYqy2ID3p+AHoGLByEPMUGoblwVA9B/vTJOU4yoUCdSQfI+ocf+h+OuWdF8FXDHKkSDot6lY+v92D6DKFaLd51HQ=
X-Received: by 2002:a92:1513:: with SMTP id v19mr12253032ilk.125.1574371073277; 
 Thu, 21 Nov 2019 13:17:53 -0800 (PST)
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
 <CAFQqKeUimt32z1myzL+JOXoCUhn7jU1=Mj8e6egQKs+c5CY0pA@mail.gmail.com>
 <s5hftihrkzs.wl-tiwai@suse.de>
In-Reply-To: <s5hftihrkzs.wl-tiwai@suse.de>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Thu, 21 Nov 2019 13:17:41 -0800
Message-ID: <CAFQqKeU4pA_t=veRm0635pZmxpn=C9sNPPUEHkgavynPYxqwFg@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
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

On Thu, Nov 21, 2019 at 1:13 PM Takashi Iwai <tiwai@suse.de> wrote:

> On Thu, 21 Nov 2019 21:46:17 +0100,
> Sridharan, Ranjani wrote:
> >
> >     >
> >     > Hi Takashi,
> >     >
> >     > Sorry the stress tests took a while.
> >     > As we discussed earlier, adding the sync_stop() op didnt quite
> help the
> >     SOF
> >     > driver in removing the delayed work for snd_pcm_period_elapsed().
> >
> >     Yeah, that's understandable.  If the stop operation itself needs some
> >     serialization, sync_stop() won't influence at all.
> >
> >     However, now after these discussions, I have some concerns in the
> >     current code:
> >
> >     - The async work started by schedule_work() may be executed
> >       (literally) immediately.  So if the timing or the serialization
> >       matters, it doesn't guarantee at all.  The same level of
> concurrency
> >       can happen at any time.
> >
> >     - The period_elapsed work might be pending at prepare or other
> >       operation;
> >       the async work means also that it doesn't guarantee its execution
> in
> >       time, and it might be delayed much, and the PCM core might go to
> >       prepare or other state even before the work is executed.
> >
> >     The second point can be fixed easily now with sync_stop.  You can
> just
> >     put flush_work() in sync_stop in addition to synchronize_irq().
> >
> >     But the first point is still unclear.  More exactly, which operation
> >     does it conflict?  Does it the playback drain?  Then it might take
> >     very long (up to seconds) to block the next operation?
> >
> > Hi Takashi,
> >
> > As I understand the original intention for adding the
> period_elapsed_work()
> > was  that snd_pcm_period_elapsed() could cause a STOP trigger while the
> > current IPC interrupt is still being handled.
> > In this case, the STOP trigger generates an IPC to the DSP but the host
> never
> > misses the IPC response from the DSP because it is still handling the
> previous
> > interrupt.
>
> OK, that makes sense.  So the issue is that the trigger stop itself
> requires the ack via the interrupt and it can't be caught because it's
> being called from the irq handler itself.
>
> In that case, though, another solution would be to make the trigger-
> stop an async work (but conditionally) while processing the normal
> period_elapsed in the irq handler.  That is, set some flag before
> calling snd_pcm_period_elapsed(), and in the trigger-stop, check the
> flag.  If the flag is set, schedule the work and return.  And, you'll
> sync this async work with sync_stop().  In that way, the period
> handling is processed without any delay more lightly.
>
OK, that makes sense. Thanks for the suggestion.
Regarding your previous comment about adding flush_work() to the
sync_stop() op, would that still be required?

Thanks,
Ranjani

>
>
> thanks,
>
> Takashi
>
> > Adding Keyon who added this change to add more and clarify your concerns.
> >
> > Thanks,
> > Ranjani
> >
> >     thanks,
> >
> >     Takashi
> >
> >
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
