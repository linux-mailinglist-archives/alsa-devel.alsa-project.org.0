Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 334E2468100
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 01:00:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3E832590;
	Sat,  4 Dec 2021 00:59:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3E832590
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638576027;
	bh=eH4AVT8EhXniK4YTDF4qVfgIFQagjBtaNRTg14JTcB4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j2xgPbhe0CDFtwMvwr3w5wEm0wCzqXoeJuhBeEyO3N1RG/RnFbg4cE3fotBFj7lw1
	 dDP15MdEZKQ2HQzN1yL8veNJqj7mvVOBR2251ecL3PK2OTsRXJgSWtNdNmTfEaiLye
	 QF3MVG5SpGzcdk+GrkxD6eXmaIJTvtm2D8LkN+fs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21433F80249;
	Sat,  4 Dec 2021 00:59:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB880F80246; Sat,  4 Dec 2021 00:59:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73619F80085
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 00:58:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73619F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pmdihMTx"
Received: by mail-qk1-x72b.google.com with SMTP id t83so5194044qke.8
 for <alsa-devel@alsa-project.org>; Fri, 03 Dec 2021 15:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bpAtCKPeMSv2oRRZN0QFKaKPzEIQxPPQzD2YI3RgM3U=;
 b=pmdihMTxL1nzF6Cy/V8uvFk551i/TDzE7daDmFaxbKK6UcznmKNrVUysII/zbe1OrB
 WUJOjaW/WSZlS+Ko4kPT48xZ01uMs3+L/s2xVVkKL/eOncerjJoadYiYhTLiwEYWjr4u
 cFzzUHYbu/qN0OD3JS0ljolq3aWzK+8jN47hIwfz2xwOR85s4436bU/JTuG4XPX+TTdP
 uvwqc4j6+/09TdbzM1bilvtKV9fjStautD+W+7ajnoC71BJX604VmkWyFcumASHYKz5w
 MA6NU6RvmJWLsoh9PllM4pzg2FGqXRZRKUIxgIwM3aL2+5j2GEhoobssbdDJDc2dPttQ
 E58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bpAtCKPeMSv2oRRZN0QFKaKPzEIQxPPQzD2YI3RgM3U=;
 b=3GIdR3CQh73wBK0sOfDFsWHXjA6fiQlX1UHXtzSEfYH6Ds1iH3Za5Uea1H5k/06JWR
 bjNpYjGl19mR/mZtg8709ROqhGuFAC6YjuRKEeMmRc8qBbdiZ5g+yffr2hglGiMLi5Jy
 Cl+VxBy7/rtydCck+CWeQPnIK+9+vbtx/8lXBZcb0FKCCDNbSD0pY6dvnRQcKcW7lmQ3
 8LTPfUgrORQ+zwyHbNrqVI3T9QH5c1HuKEYpBOUoMFcyzmOuLT8yREn/1xigMOsSPRxP
 BOCqZfmyzH/Yi/ssMucEAU13k4FOHau64LhB/Nuj/p34hQZF1gg60qYVeqO89Xexy+fi
 bWAg==
X-Gm-Message-State: AOAM531yPF7qhvE/ei1EpVtf1gu3jbdDFeGPJIrf5w/o1ICn0i57oyri
 emjYKEPRp8IRVWCQbfdaMu0=
X-Google-Smtp-Source: ABdhPJxxPENqcZGsWoIVRfo8QTn6amLjVfFIdzZTqJ5ixns0+CnvYDgZhj7ZOC3WNMxSUiDPYEj07w==
X-Received: by 2002:a05:620a:1924:: with SMTP id
 bj36mr20379559qkb.476.1638575934218; 
 Fri, 03 Dec 2021 15:58:54 -0800 (PST)
Received: from geday ([2804:7f2:8002:7bf1:59c9:7624:9b4a:10d2])
 by smtp.gmail.com with ESMTPSA id r65sm2799279qke.85.2021.12.03.15.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 15:58:53 -0800 (PST)
Date: Fri, 3 Dec 2021 20:58:53 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: Reorder snd_djm_devices entries
Message-ID: <YaqvPbmEGZth/0Ag@geday>
References: <Yaky19EeHagfRSTD@geday>
 <s5hsfv9stbw.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hsfv9stbw.wl-tiwai@suse.de>
Cc: William Overton <willovertonuk@gmail.com>,
 ALSA-devel <alsa-devel@alsa-project.org>, Olivia Mackintosh <livvy@base.nu>
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

On Fri, Dec 03, 2021 at 02:37:07PM +0100, Takashi Iwai wrote:
> On Thu, 02 Dec 2021 21:55:51 +0100,
> Geraldo Nascimento wrote:
> > 
> > Olivia Mackintosh has posted to alsa-devel reporting that
> > there's a potential bug that could break mixer quirks for Pioneer
> > devices introduced by 6d27788160362a7ee6c0d317636fe4b1ddbe59a7
> > "ALSA: usb-audio: Add support for the Pioneer DJM 750MK2
> > Mixer/Soundcard".
> > 
> > This happened because the DJM 750 MK2 was added last to the Pioneer DJM
> > device table index and defined as 0x4 but was added to snd_djm_devices[]
> > just after the DJM 750 (MK1) entry instead of last, after the DJM 900
> > NXS2. This escaped review.
> > 
> > Let's reorder the entries in snd_djm_devices[] so they match the Pioneer
> > DJM device table index #define's.
> > 
> > Reported-by: Olivia Mackintosh <livvy@base.nu>
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
>

Hi, Takashi

> Thanks the patch.

My pleasure.

> 
> The code change is OK, but better to use more explicit form in C99
> style initialization, something like below.

I'll send v2 of the patch with C99-style designators as you have
suggested.

> 
> Could you check whether this works?

That's the problem, I don't own any DJM mixer, someone else needs to
test this.

Thanks,
Geraldo Nascimento

> 
> 
> thanks,
> 
> Takashi
> 
> --- a/sound/usb/mixer_quirks.c
> +++ b/sound/usb/mixer_quirks.c
> @@ -3016,11 +3016,11 @@ static const struct snd_djm_ctl snd_djm_ctls_750mk2[] = {
>  
>  
>  static const struct snd_djm_device snd_djm_devices[] = {
> -	SND_DJM_DEVICE(250mk2),
> -	SND_DJM_DEVICE(750),
> -	SND_DJM_DEVICE(750mk2),
> -	SND_DJM_DEVICE(850),
> -	SND_DJM_DEVICE(900nxs2)
> +	[SND_DJM_250MK2_IDX] =	SND_DJM_DEVICE(250mk2),
> +	[SND_DJM_750_IDX] =	SND_DJM_DEVICE(750),
> +	[SND_DJM_850_IDX] =	SND_DJM_DEVICE(850),
> +	[SND_DJM_900NXS2_IDX] =	SND_DJM_DEVICE(900nxs2),
> +	[SND_DJM_750MK2_IDX] =	SND_DJM_DEVICE(750mk2),
>  };
>  
>
