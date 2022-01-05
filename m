Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6504853B2
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 14:40:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFC2718F9;
	Wed,  5 Jan 2022 14:39:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFC2718F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641390032;
	bh=ArFAjcv4rghtZjlmttgtFnTTyAQcP3JK7EE7dmsBvD8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b0mpClb9DLarRzXCKkyNZ9vGzSuuT0qPpKkfu3UqcClWtEmEsLePg7+gMHOtBxL9f
	 YSus5OHCi6MlW8B3+O9xqTheVgQzhlvAZrzMkPfxFvyBKhhtWnITYb28hYc3P4h2Uo
	 gB2W/DfvAgeDoJXYzTGAG9dqbIiggOohJv+yRcCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D7CFF8020C;
	Wed,  5 Jan 2022 14:39:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1F07F801D8; Wed,  5 Jan 2022 14:39:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76142F8007E
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 14:39:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76142F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="j5asdzYW"
Received: by mail-qk1-x72a.google.com with SMTP id de30so38294081qkb.0
 for <alsa-devel@alsa-project.org>; Wed, 05 Jan 2022 05:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JjbmazhTwQXr2UKLzUSBw9SdkLAAfURcuNnua/7AjuU=;
 b=j5asdzYWVeVvRpSlGrmvQS0NBpwMbJC3D8vAGda8GycqMeGgwpWnjPLPO4x/2oI9O6
 2nSz03s8QknFUMnmi+WM81bLiaykLQfZJGLRw1cDxU74ZWi47hyJ3GH0vAPzXYMMMMax
 +yEqNKzxKHAVFmIAKZ9Ce/XaIxpBWOL0JMj4rWjicVAiUwIoCW3qv5yBHU3UsxXDZ25d
 DBp2YgjF4lUgVdqaqjirWTZCGoMLCXDU40/+OGZoIFOEO1guMAXQ5fsfyGNgyuIiCAW7
 oEyc7jAccb4/psBoNBnclsnytchrklodbjny9Dv+PjOZaD0ukKjnBXU6NmMbxYob6gXJ
 xUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JjbmazhTwQXr2UKLzUSBw9SdkLAAfURcuNnua/7AjuU=;
 b=dQo3iiucPuvwns0cAuUTdQhW+wDSYTTCKkXHW53nEI9HY2uAhbVR6MuADC2Z0NZEuu
 UAGWEACE4n6ZLLnaIhYG8VP0zC+RgGDw9j+IRRHBjCFb/VoMAkEKcZUnByItKbtmdTKJ
 nsLMdyFicNKIAZAIc7d/haL+NBHcDSvZGwKha7G9+KnJNKWJAYu1IsLmN3hGdJOpS9BN
 u7891HDI/6Cfa9SR5oz7lJY+7h2HnaoReFBEH/rjoSUS3MtHd4UXw/BQfKuM8US023QP
 43WWa2xaYMx1wVdekrQ+Int4DQDvDXoSBCWt5hSTzAGt19m7Y+w/7ZkYvLCV76xZqNFq
 uZYw==
X-Gm-Message-State: AOAM531IcIAS6WM8CHOS273v+QAOIIBuT0n/JXBeHATf0ABakaYeMV8W
 GcG0BMv29bdtkJMrBZlv+GVpVVV//6FXEjCb+w==
X-Google-Smtp-Source: ABdhPJx41olc8HI6Y+TUXj7nB1yDxKJyb1XQbTkbJiwOMcqyEUxzslQxhh3xJIP3sjHrR383ZUzcVj+rqxlyOSmMWGI=
X-Received: by 2002:a05:620a:1a01:: with SMTP id
 bk1mr38207453qkb.539.1641389955858; 
 Wed, 05 Jan 2022 05:39:15 -0800 (PST)
MIME-Version: 1.0
References: <CAJ4JBRO7qE63TAC-=4y=QMaiAEfkyjRmgiZEF_57Hm+ztc8+Qg@mail.gmail.com>
 <s5hiluzjy3d.wl-tiwai@suse.de>
In-Reply-To: <s5hiluzjy3d.wl-tiwai@suse.de>
From: Stefan Sauer <st.kost@gmail.com>
Date: Wed, 5 Jan 2022 14:39:05 +0100
Message-ID: <CAJ4JBRMKsrJ54ee0gPwRTeScghA4SB8m2iOWybQA=6584ejG-g@mail.gmail.com>
Subject: Re: slow snd_rawmidi_drain() for VirMidi devcies
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

-   28,78%     0,00%  rawmidi_alsa  [snd_rawmidi]         [k]
snd_rawmidi_drain_output
   - snd_rawmidi_drain_output
      - 26,59% msleep
           schedule_timeout
           schedule
         + __schedule
      + 2,13% schedule_timeout

Seems to be because of:
https://github.com/torvalds/linux/blob/master/sound/core/rawmidi.c#L244
if (substream->ops->drain)
  substream->ops->drain(substream);
else
  msleep(50);

It see what fileops have no drain impl:
https://github.com/torvalds/linux/blob/master/sound/core/rawmidi.c#L1708
and I see
https://github.com/torvalds/linux/blob/master/sound/core/seq/seq_virmidi.c#L329
that define no drain op. Not which ones are actually used here :/

The docs confirm teh 50 ms wait though:
https://github.com/torvalds/linux/blob/master/Documentation/sound/kernel-api/writing-an-alsa-driver.rst#drain-callback

would it make sense to have a dummy drain function for the seq_virmidi
output ops?

Stefan


Am Di., 4. Jan. 2022 um 16:54 Uhr schrieb Takashi Iwai <tiwai@suse.de>:

> On Sat, 01 Jan 2022 12:49:13 +0100,
> Stefan Sauer wrote:
> >
> > hi,
> >
> > I've tried to link BitwigStudio to the webapp cables.gl over virmidi.
> > Unfortunately Bitwig Studio only supports rawmidi. What I discovered is
> > that there is a strange slowness when sending data to virmidi caused
> > by snd_rawmidi_drain().
> >
> > I've posted two tiny, self-contained c apps to:
> > https://gist.github.com/ensonic/c7588b87fa6c1fa94a8f753b1e0aa394
> > See some examples below. 2 observations:
> > * snd_rawmidi_type() is *not* reporting virmidi as VIRTUAL
> > * snd_rawmidi_drain() takes about 60ms! on virtual vs. less that 0.1 ms
> on
> > usb midi (I checked all my hw midi and the worst was avg=1ms on physical
> > midi image unitor8)
> >
> > When comparing the implementations:
> >
> https://github.com/alsa-project/alsa-lib/blob/master/src/rawmidi/rawmidi_virt.c#L173
> >
> https://github.com/alsa-project/alsa-lib/blob/master/src/rawmidi/rawmidi_hw.c#L164
> > I see that the hw one results in an IOCTL which I can see when striking
> the
> > code and I wonder if this is the root cause? Why is rawmidi_virt.c not
> used
> > for virmidi?
> > >From poking at snd_rawmidi_open_conf() I have not yet figured where
> this is
> > decided ....
> >
> > Stefan
> >
> > > amidi -l
> > Dir Device    Name
> > IO  hw:0,0,0  Scarlett 18i20 USB MIDI 1
> > IO  hw:3,0,0  nanoKEY2 nanoKEY2 _ KEYBOARD
> > IO  hw:5,0,0  nanoKONTROL nanoKONTROL _ SLIDE
> > IO  hw:10,0    Virtual Raw MIDI (16 subdevices)
> > IO  hw:11,0    Virtual Raw MIDI (16 subdevices)
> >
> > # using direct i/o to virmidi - all good
> > > ./rawmidi_oss /dev/midi11 0
> > Using device '/dev/midi11' without draining
> > write took min=  0.0015 ms, avg=  0.0016 ms, max=  0.0110 ms
> > > ./rawmidi_oss /dev/midi11 1
> > Using device '/dev/midi11' with draining
> > write took min=  0.0015 ms, avg=  0.0017 ms, max=  0.0101 ms
> > drain took min=  0.0001 ms, avg=  0.0001 ms, max=  0.0008 ms
> >
> > # using snd_rawmidi to virmidi - slow drain operations
> > > ./rawmidi_alsa hw:11,0 0
> > Using device 'hw:11,0' without draining
> > SND_RAWMIDI_TYPE_HW
> > write took min=  0.0010 ms, avg=  0.0011 ms, max=  0.0056 ms
> > > ./rawmidi_alsa hw:11,0 1
> > Using device 'hw:11,0' with draining
> > SND_RAWMIDI_TYPE_HW
> > write took min=  0.0016 ms, avg=  0.0040 ms, max=  0.0077 ms
> > drain took min= 55.9951 ms, avg= 60.4330 ms, max= 64.0653 ms
> >
> > # using snd_rawmidi to usb hw - all good
> > > ./rawmidi_alsa hw:3,0 0
> > Using device 'hw:3,0' without draining
> > SND_RAWMIDI_TYPE_HW
> > write took min=  0.0012 ms, avg=  0.0015 ms, max=  0.0121 ms
> > > ./rawmidi_alsa hw:3,0 1
> > Using device 'hw:3,0' with draining
> > SND_RAWMIDI_TYPE_HW
> > write took min=  0.0024 ms, avg=  0.0032 ms, max=  0.0110 ms
> > drain took min=  0.0293 ms, avg=  0.0636 ms, max=  0.2277 ms
>
> This kind of thing needs profiling.  You can try perf or whatever
> available, and identify which call takes long.  My wild guess is
> something about snd_seq_sync_output_queue(), maybe poll syscall takes
> unexpected long.
>
>
> thanks,
>
> Takashi
>
