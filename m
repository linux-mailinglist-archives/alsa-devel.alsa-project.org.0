Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E0C13CE16
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 21:30:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 106C917B6;
	Wed, 15 Jan 2020 21:29:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 106C917B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579120226;
	bh=7+Qaw4Bs2Hx1jPyHbbXif7TSz+rxtQjC6h8ADzCJEW4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZGCDOAXL31aGDD8PNHSU3S6Beo3HdN4N1BE3UNy8wRI/ZySkAb+4Dti5E1XMFkBt+
	 wG99j3MQ860EiaEkeoZzMLI1skXOUhO+HcOJglHL/34yL13nBn9bwlUjw/GW89Z4v7
	 nvgfWthngN1uyp9LZ0EkgVQ7Fk7sUTqeAaxu/4AM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69069F801F8;
	Wed, 15 Jan 2020 21:28:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0D47F801EB; Wed, 15 Jan 2020 21:28:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABA0DF800CC
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 21:28:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABA0DF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="ggrQIXK1"
Received: by mail-io1-xd2b.google.com with SMTP id d15so19284455iog.3
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 12:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7PHGAZ0/1V+C778mhBrfSDKUwnn9vHDZ/ohXd+qJiN4=;
 b=ggrQIXK1PVnFOc1oisvA9yJp4/kUZ9ycuLPyTv4niX58HdWpQBCpDKGNXcUoeX0Sv2
 BhIZKtrhu/w5u2SRIMqcPy03lJK66DRV+8C7j2rLZZ50dL4aT/aNrm11jwNqpXa6ALQa
 M/aU8XUjRFBQzAj4P6tZuVsJK+pBnli5qxIEi6Hu3SkdEoBsZNoycC3KMIflj7q1hyzS
 9vj0LcI2o7dFUxT9eJAobBj9ZwL9dttibt9Jtj1beRadKeBm4xbWJXzCSGhJNLxjgqRV
 xPys7C2b0fw8cjmKmI/vTPaRAY2Ucc/Ur5M6QTUabXRtPcS/9KdkKC0WO7B3Bz/JKZ/d
 xNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7PHGAZ0/1V+C778mhBrfSDKUwnn9vHDZ/ohXd+qJiN4=;
 b=ZJLgjC2sz+lJwNQldB7RddFdffVfoIZzNh4nkHuhdBCsBgbSv74T8HPCgy2q0TV9fU
 q/7PqVKvRTq2LBQ/6C6A9e+FhDUzTS7Fz2ZrnhhjWhOybHqU4GAWHTkKU6+cGi4+Px3B
 63Ad9Bn2OkPkNe/7cgNec2rV9r4BTKUdwk7xcj2Y5uzHXYB38ORmVvrPS1ECA/XQmHhi
 Xmb5nNl374ECTv+5P8toPm0y2uuJW0hClatorh2o5FvNdVYZKTKle/1vTwWcTDQuV4zF
 fqsuCWfzBuGkul0Kt0WVtVW2ul2+C4/RMpGhD6kfMQAua23gSMjdqZisA/5JgTth2qAw
 sBZg==
X-Gm-Message-State: APjAAAUMhxpeAeSnBYRddW/EOFieUVLElfKwFQqUsG3zuQWxktelxLZQ
 6pP5WReJMQL8FFls28DcFXPAd55CIEfNCo8cbp/bKg==
X-Google-Smtp-Source: APXvYqw2RCMEXj/u3vdIzb4Xk+wHvfj6iLJTy0nF8vDll00LvesPALZdeT4Zv1CKNM97UkggMoTWrBRJbY1Fl+palwk=
X-Received: by 2002:a6b:e506:: with SMTP id y6mr22625396ioc.209.1579120111526; 
 Wed, 15 Jan 2020 12:28:31 -0800 (PST)
MIME-Version: 1.0
References: <CAFQqKeV3fG8=DaV4_rGDL3QH7gG9zEHwS9T41aOag+-cNN9wnQ@mail.gmail.com>
 <s5hlfq8pkza.wl-tiwai@suse.de>
In-Reply-To: <s5hlfq8pkza.wl-tiwai@suse.de>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Wed, 15 Jan 2020 12:28:20 -0800
Message-ID: <CAFQqKeWu+Xmg_j7CgETnu_Y-dcFMXWbC5jyaXR6N7v-d5GwzwA@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "Vehmanen, Kai" <kai.vehmanen@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, "Uimonen,
 Jaska" <jaska.uimonen@intel.com>,
 Pierre-louis Bossart <pierre-louis.bossart@intel.com>
Subject: Re: [alsa-devel] Question about runtime PM for HDA codecs
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

On Wed, Jan 15, 2020 at 11:40 AM Takashi Iwai <tiwai@suse.de> wrote:

> On Wed, 15 Jan 2020 19:15:40 +0100,
> Sridharan, Ranjani wrote:
> >
> > Hi Takashi,
> >
> > Can I please bother you with a question about how to handle the situation
> > with runtime PM for HDA codec on one of the Intel CML-based platforms
> with
> > an ALC285 codec.
> > Basically, the problem we're facing is that when using the SOF driver,
> > jack detection doesn't seem to work as intended because the codec gets
> > suspended right after the headset is plugged in.
>
> The codec going to the runtime suspend is actually the right
> behavior.  Even the bus goes down if the codec has AC_PWRST_CLKSTOP
> and AC_PWRST_EPSS capabilities, the link goes also down.  But this
> means that the irq is still triggered upon the jack detection event
> even in D3 state.
> I guess this implementation is missing in SOF DSP side.
>
We do have the WAKEEN feature implemented in SOF for capturing the jack
detecting events when the SOF device is in D3. We have this feature working
as expected on some previous platforms.
The problem specific to the ALC285 codec.

>
> > After a bit of experimenting, what we found was that calling
> > snd_hda_set_power_save() with a delay of 0 or something > 0, both help
> with
> > fixing the problem.
> >
> > But, I have a basic question about this. What is the expectation for
> > enabling the codec runtime PM?
> > I see that the legacy driver calls snd_hda_set_power_save() based on the
> > CONFIG_SND_HDA_POWER_SAVE_DEFAULT value. In the case of SOF, we do not
> > explicitly set this value so it is 0 by default. Also, when the codec is
> > registered, the runtime PM for the codec is enabled by default without
> > checking if the power_save delay is set to 0 or not. And later when the
> > snd_hda_set_power_save() is called from the legacy HDA driver probe, it
> > sets the use of auto suspend and the delay to be used based on the
> config.
>
> The runtime setup purely depends on the user's configuration.  As
> default, kernel may set to certain value via Kconfig, and some codecs
> (e.g. HDMI) prefer the runtime PM enablement as default.  Other than
> that, it's supposed to be set explicitly via sysfs, typically from
> udev rules.
>
> The driver initial code does set up some default value from historical
> reasons, but basically the setup is done from user-space.
>
> > Would it be correct to remove the pm_runtime_enable() call
> > in snd_hda_codec_register() and let the codec runtime PM enabling be set
> > with the call to snd_hda_set_power_save() for both the legacy HDA driver
> > and the SOF driver?
>
> The basic problem isn't about how the runtime PM is set.  It can be
> changed at any time, and the driver should work no matter how it is
> set.

In this case then, I suppose it is up to the SOF driver to set the auto
suspend delay to define the expected default behaviour?

Thanks,
Ranjani
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
