Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CBC2AD34F
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 11:17:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D7B0170A;
	Tue, 10 Nov 2020 11:16:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D7B0170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605003452;
	bh=SGGqaVhedazS4Fn29Dd8LaJPMNYrrxaL5+RNG0z041o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tk1SSvXGFIb+izt2DEhPWjQNlJaG7r2TYY1GEetTqt51ifE1mloXVy4DD1gYTz8Bq
	 984EAQZF0I5CEfGAMtuh7fBgec+HfZa2S9g5pGcxHJto4MKqKmhhokkTsREYjiu/pa
	 GvmY0wO3JYCbQ4FZOJAkdhigwX/nxumOJ3AA76H4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80209F804C3;
	Tue, 10 Nov 2020 11:15:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E9FAF801D5; Sun,  8 Nov 2020 12:20:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03942F800D2
 for <alsa-devel@alsa-project.org>; Sun,  8 Nov 2020 12:19:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03942F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eAi7Beyc"
Received: by mail-pg1-x542.google.com with SMTP id e21so4459941pgr.11
 for <alsa-devel@alsa-project.org>; Sun, 08 Nov 2020 03:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6ypFqyizBtI+bG9+f2gee6r9YBqN51Gv1uLtChfql90=;
 b=eAi7BeycYrQsdFpDuCS8MgBXcaQfRzpLQ3B+R03IC/8zq8gHlsRqIwAeJYRBghZqHG
 lTvLL+YRLj4ktbvJ6LjEZUdHSigvJpGe1LiM8tWEB0Tcc0XdRWwm6uKoju8WcqRVpIiA
 o7zQAuLjVvaCWetAk58lho+mbivsHEzodjHE8fKddi57lodBY4Wc3hbRYB3QteKEiuuz
 mS7RDy7V/asDkjNCJmy3u/rN7zzeGQOv1AsqdH9ZJq10O16E2sS2+RDiY/W64hfN+GYP
 jY/aB2Heob82kX/7vO4hQMlLwFRS8wwS/WpGMtZLluTmsh5clyVW9bcblH664+JMtvOj
 PGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6ypFqyizBtI+bG9+f2gee6r9YBqN51Gv1uLtChfql90=;
 b=g+0BIsx1LeS8LOuHqpubJ39yVxWf2L371EifzF3Bft4rHZ9kqoh7lsVeAVVfnJOsSk
 T23uZKfXZosxtxaICwMOHKQb9xbro0CTTtHtrNoa/AE2342+iNd2Qkqvp4WDa7gtjG4u
 sIAWSzpSWazXUikxNkEqU1S45+o+ZMCOEF315zAugAG2yDwmW/2Qq6GpfuahjJ8LzZRW
 7WqjXvI2skT0/jK1MkP5kLjoFTA+Cn11o9581iA+kH7PfrnQEcW5e7PLB37naVBXCJhH
 cH5jvD5I+QNfvgLHEkMFK/UeyFUGvEoP6j5nv6W2AaAtcYtL5fNzod8X5/15Zo4AB2Ue
 yBzg==
X-Gm-Message-State: AOAM531For+qLzZc9REsh8HrB1cr461rtabfIZu4/kc6XV2zwaAK+25W
 SsFhGkDCld0UW2UOkawdSM4=
X-Google-Smtp-Source: ABdhPJwOYydXZpBfJT1LjKbjX7KMWb98jpiO0iRJS7UUuINPRXEOFa+g0Ur/ZmpUUKJ+I1s+MUWE9g==
X-Received: by 2002:aa7:942a:0:b029:164:a853:f0fc with SMTP id
 y10-20020aa7942a0000b0290164a853f0fcmr9250990pfo.40.1604834392880; 
 Sun, 08 Nov 2020 03:19:52 -0800 (PST)
Received: from atulu-nitro ([122.164.210.133])
 by smtp.gmail.com with ESMTPSA id i17sm8069407pfa.183.2020.11.08.03.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2020 03:19:52 -0800 (PST)
Date: Sun, 8 Nov 2020 16:49:46 +0530
From: Atul Gopinathan <leoatul12@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] ALSA: usb-audio: Fix coding style problems
Message-ID: <20201108111946.GB10284@atulu-nitro>
References: <20201108083515.5256-1-leoatul12@gmail.com>
 <20201108091136.GA44749@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201108091136.GA44749@kroah.com>
X-Mailman-Approved-At: Tue, 10 Nov 2020 11:14:55 +0100
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

On Sun, Nov 08, 2020 at 10:11:36AM +0100, Greg KH wrote:
> On Sun, Nov 08, 2020 at 02:05:16PM +0530, Atul wrote:
> > From: Atul Gopinathan <leoatul12@gmail.com>
> > 
> > Hi,
> 
> No need for this to be in the changelog.
> 
> > 
> > This patch fixes some coding style warnings and errors that were
> > generated using scripts/checkpatch.pl.
> 
> You should be explicit about _what_ warnings and errors.  And probably
> break them out into individual patches, one per warning/error type.
> 

Got it, I'll keep the above points in mind.

> But more importantly, always run your patch through checkpatch.pl when
> you are done, as you just _ADDED_ warnings to the kernel with this
> change:
> 
> > @@ -895,9 +896,10 @@ static int snd_usb_nativeinstruments_boot_quirk(struct usb_device *dev)
> >  	usb_reset_device(dev);
> >  
> >  	/* return -EAGAIN, so the creation of an audio interface for this
> > -	 * temporary device is aborted. The device will reconnect with a
> > -	 * new product ID */
> > -	return -EAGAIN;
> > +     * temporary device is aborted. The device will reconnect with a
> > +     * new product ID
> > +     */
> > +    return -EAGAIN;
> >  }
> >  
> >  static void mbox2_setup_48_24_magic(struct usb_device *dev)
> 
> You turned tabs into spaces, not allowed, sorry.

I truly apologize for this blunder. That was a really silly mistake from
my side inspite of having seen your FOSDEM talk on 'Submitting Your First
Kernel Patch' and using indentations as they were intended to be a
hundred times.

> 
> If you want to do basic checkpatch cleanups, try starting in the
> drivers/staging/ area of the kernel, which is much more forgiving and
> set up just for this type of thing, instead of trying to do this in the
> "core" kernel portions, where you have to deal with other real code
> changing happening at the same time.
> 

I guess I'll start with this instead of messing with the "core" code.
I'm still in my learning phase, so checkpatch cleanups are the only
contributions I can make for now. :D

> good luck!
> 
> greg k-h

Thanks a lot for your patience!

Atul
