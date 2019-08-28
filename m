Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDB3A1CEF
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:37:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD739169B;
	Thu, 29 Aug 2019 16:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD739169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089452;
	bh=yDgkLePuf0nD8kvlqZ5k3l23Gtr/+YB5tVWkrfbfO+k=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qN+Z9gOWVDJgMWqrneKWUvVZ74ZSNl0//1OYUkDnUOB+STzix654UcseIWnLWiJjL
	 IyvzE0OYQRwfVtS/zrmGfoBLrfhq5/Y4H5N0ts84sHQU2BOKt+9yBcBPXp2mMBrfUA
	 zSeKxU41FZ1uXrqS3mUhjeGRoSocUB7rjWP+CC9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87292F897C0;
	Wed, 28 Aug 2019 17:17:34 +0200 (CEST)
X-Original-To: Alsa-devel@alsa-project.org
Delivered-To: Alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA724F897BE; Wed, 28 Aug 2019 17:17:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 824A4F80362
 for <Alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 17:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 824A4F80362
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mhxQs/Lp"
Received: by mail-qk1-x72f.google.com with SMTP id m2so26602qki.12
 for <Alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 08:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=tcGtrI2+Y/rBBmSKoJQLW0LrhUznLpjb2qra9L4OveY=;
 b=mhxQs/LpliyevQ1pt2sh26r7uZnb28i0s/Thl/pk5Zncha3awwLKCnYA5U9qkQm0ru
 o1LrBAsQIgzMN7hZtTFVDLLHj0hAIhsrsn5NPwmn4W5wrph+cOkdKHh2LLWwNqpdKX5W
 2IxoCy6+F9B3ruxuME1/IPSKOZrb9EZFSAFlXBdJkJisCKPDp7MDVZBSiQeKn0dU+KfQ
 NdZAz2MxVlv1UJep/cvbGOzxTbhSdTed/fVMXkU65eJHNhND5Ba60fA7V5nF+ODzfVoc
 hH1MKBBUWCsBvB4VeKMtRh8GPNRukMhbCcYbJ+PB7sQ9+kHMCd6mt+ZJLoCyvBOI3lWk
 dd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=tcGtrI2+Y/rBBmSKoJQLW0LrhUznLpjb2qra9L4OveY=;
 b=dRYItjl2UXNMSvzOrJ2Tyj46q+QcH/Kw2yUBInNtao88cyWKuETYc7jdR87Sl22rdN
 mqOoF+IP4vYL2s2BOFBsjSh8cVZuDHdYArHKS0peAbxcYvkBWrocuXXZOiWqipHMPB+h
 IF2lSO5jO57uJsXxOV2BVY7cx5ESXDyKgnZFQ2m12GNhiIJJoOj/ts0PKJ8NMQPo5c5J
 RGNyt3GzjRpo//ojrq9TNgoBY/0HlYfyD6K2FN9nwdklGhnra6TGQrWisRy7V0oh/PYa
 7aqK3H3bYL/vxr21FqyWS5QGCPj/0E3ORU6ScMvS7GrLHSdQHbwprMgh0B05oQOtzFB+
 elpA==
X-Gm-Message-State: APjAAAWjMNELyvqYinGMedN9EjOk0Rj8HWlXGCCsdearVZ0vs/1QcrTj
 MUwybH1DiU61R8kAE4wE4/0/E2wdqhAQxhSfZd4+AA==
X-Google-Smtp-Source: APXvYqyXjemEVfq3HK98FZ6LGc+ESmr6jaas3zP48YzVSKlstZZi6OuP+K/hspqM00bamkdhM+KU0L5ldU+xcrwIGNU=
X-Received: by 2002:a37:4941:: with SMTP id w62mr4080680qka.119.1567005444265; 
 Wed, 28 Aug 2019 08:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SWvNwqg3Q37BWNpw7C+75Z+CO-zUo2UUYjvz88L3hW1tk=gQ@mail.gmail.com>
In-Reply-To: <CA+SWvNwqg3Q37BWNpw7C+75Z+CO-zUo2UUYjvz88L3hW1tk=gQ@mail.gmail.com>
From: Pavel Hofman <pavhofman@gmail.com>
Date: Wed, 28 Aug 2019 17:17:12 +0200
Message-ID: <CA+SWvNztL5Ykt_LtU+zyv0MjWbM6wqAvM4U+JVcqvcN3AhdGNg@mail.gmail.com>
To: Alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Options for ASYNC feedback source in USB-audio
	gadget (USB OTG)?
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

On Wed, Aug 28, 2019 at 1:17 PM Pavel Hofman <pavhofman@gmail.com> wrote:
>
> But the feedback EP needs input data. The whole chain behind the
> virtual capture alsa device defined by the gadget driver is clocked by
> the playback soundcard. May I ask for your opinions on possible
> options for
>
> 1) gathering the feedback data from the playback chain
> 2) passing the gathered samplerate-diff data to the gadget module for
> the feedback EP to send to the USB host
>

IMO some common time frame must be used. E.g. kernel time in nanoseconds.

How about something like this:

1) the core PCM part of alsa driver would keep relative samplerate and
present such value in proc/sysfs to userspace.
the calculation something like:
copied X sample frames in Y kernel nanosecs (for the last e.g. approx.
30 secs ), with nominal samplerate 48kHz. The value would be
(10^9 * X frames/Y nanosecs) / 48000 Hz samplerate = e.g. 1.00001

2) the usb gadget code also creates/uses alsa driver, thus
measuring/displaying to userspace the same value, e.g. 1.00002 - USB
data incoming slightly faster than being consumed by the soundcard

3) the usb gadget would accept some feedback value via procfs/sysfs

4) a userspace daemon could monitor the relative samplerates of the
output and of the usb gadget (both values are relative to the same
kernel nanosecs clock), could calculate the required adjustment and
send proper value to the gadget feedback (in some format). Default
async feedback would be "no change", unless received required value
from userspace.

Monitoring the average throughput (samplerate relative to kernel
clock) could be enabled with a module param for alsa drivers, default
off.

The reason for dividing the "kernel-time samplerate" with nominal
samplerate is the chain can be resampling (48kHz -> 192kHz), but the
relative "deviation" should be the same for any samplerate.

Thanks a lot for any suggestions and comments.

Pavel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
