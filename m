Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 111AF4A3011
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 15:42:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 613D3F3;
	Sat, 29 Jan 2022 15:41:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 613D3F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643467349;
	bh=kiu210DVYHgGWFpK9T8NwPM8tUudJQO6yXEbWrh4j0k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g49uH3Cme+zTY8MKn1GoJ4jLXTpJrmePgqv70rWsjOwbLBh6SIvF5hkta9EMi0CSL
	 Fn4TYNc+wJ2GNvsJUr95AowxoH6v7aaL5ZfeQ9+k+OfvIoeiHnozN79bY3IR/OzwbH
	 ndnPwsw0Ro3MyuQj84SrYw8PPptQ5P2fduRDbxx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5C76F80212;
	Sat, 29 Jan 2022 15:41:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EFF8F801F7; Sat, 29 Jan 2022 15:41:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A308F8014B
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 15:41:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A308F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ftqe9oZG"
Received: by mail-lf1-x12f.google.com with SMTP id x11so17569820lfa.2
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 06:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=TsD8UeueTttBbcCHC8xUyUOJgggM70vG6Ymhib31NHo=;
 b=ftqe9oZG5U1OUJ0e9KhaRfFuHuU9Eu6WA3j07WrvrgMoj/UzMxautnN6JROsf9jQ/7
 v/YoXeu8xtCEwcNPhQk4fJQweFUbwfHl+IpRP2E45LO7y80FDxNWksAmau35j1ZQRk+D
 apG9ZP8jOUWupOqdeZKux9FhmrbQNyoHUt04Y/X8VoB7rP8nyWIcoEAldmWps8wCWHns
 q1FWA6SgQNsorJOHWWPhONjV2JpR/8mUkIw/lEYbdHS67g8JPdZZshURaeET2W0o/Q0g
 HllmJzIf7HPFe75WVQlVLRfaRndBCe5zJdV9QOiSNVbUVihYveDLeDgMxj1GVKP0DAL+
 7ZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=TsD8UeueTttBbcCHC8xUyUOJgggM70vG6Ymhib31NHo=;
 b=mA2Y+m7T5maxByyJlugsP3Hv9OXZOjU41D0KMq/ZViob7zChIpIT8WIUUPxbPVi55R
 iCh6JFUXXY0iSGXNA1iMo6aLkaqJ+4RoHkCwuqJbp/oRJj6DilK42Bp8M5O2HKDRHiUp
 HX586KENPnMnQIuY6ULsGDoRn6hV53mKsNrdY2/aWr3zvfD2YyfLTgDKEpH9YXOOtXiv
 RgBQYIQqbYPqQrw64pEi5RfYa5jR3kXMezkOQuwOh/e9CNunQQihtT2OMLTUfpRabi/x
 OZdW5tbadszLYhytVyboY4J4slhW0LyVJdUwsDywi6UVhqg8Uvziq5AvZVFa7f5UaG8x
 X6jw==
X-Gm-Message-State: AOAM532HUPm1wO0OAQOUKYlPuYAX/m7yBWVk5Gy7voSHeINuFXZ3ZPmN
 /kyz6Zs74HNhGyL3zt4FkpmgKadjzlM=
X-Google-Smtp-Source: ABdhPJzpBphGrUIiWnPY3CxLFskI7SIHm2vjLCVJp+05tqtgRZmpG77Qs6l33CRF6B63CpQC63D5eQ==
X-Received: by 2002:ac2:50d8:: with SMTP id h24mr9681599lfm.33.1643467274226; 
 Sat, 29 Jan 2022 06:41:14 -0800 (PST)
Received: from localhost.localdomain (broadband-95-84-228-163.ip.moscow.rt.ru.
 [95.84.228.163])
 by smtp.gmail.com with ESMTPSA id j2sm2215811lfp.256.2022.01.29.06.41.12
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Sat, 29 Jan 2022 06:41:13 -0800 (PST)
Date: Sat, 29 Jan 2022 17:47:04 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
Message-ID: <20220129144704.xlmeylllvy3b3fum@localhost.localdomain>
User-Agent: mtt
References: <20220113183141.kla37mbqmo4x6wxp@localhost.localdomain>
 <s5ha6fy46jt.wl-tiwai@suse.de>
 <20220114183720.n46wealclg6spxkp@localhost.localdomain>
 <s5hsftp3027.wl-tiwai@suse.de>
 <20220115152215.kprws5nja2i43qax@localhost.localdomain>
 <s5hilugw0l0.wl-tiwai@suse.de>
 <20220119093249.eaxem33bjqjxcher@localhost.localdomain>
 <20220122190522.ycaygrqcen7d3hj2@localhost.localdomain>
 <20220122205637.7gzurdu7xl4sthxw@localhost.localdomain>
 <s5ho83yldu3.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5ho83yldu3.wl-tiwai@suse.de>
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Jeremy Szu <jeremy.szu@canonical.com>,
 Huacai Chen <chenhuacai@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 tiwai@suse.com, Hui Wang <hui.wang@canonical.com>,
 PeiSen Hou <pshou@realtek.com>, Jian-Hong Pan <jhp@endlessos.org>
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

On Wed, Jan 26, 2022 at 04:24:36PM +0100, Takashi Iwai wrote:
> > Given that the CPU number is the same in alc_update_coefex_idx(), it seems 
> > these calls execution is interrupted and interleaved on the same core.
> > And, actually, there are two LEDs to set (mute and micmute). Am I onto 
> > something here?
> That's an interesting finding, and yes, such a race is quite
> possible. Below is a quick fix as an attempt to cover it.
> Could you give it a try?

Well, results are somewhat mixed.

With the supplied patch (with a mutex), the original fixup 91502a9a0b0d ("ALSA: 
hda/realtek: fix speakers and micmute on HP 855 G8") is no longer needed for 
speakers to work. So, the original timing issue is identified now.

But unbind-bind problems with IO_PAGE_FAULT and "out of range cmd" are not 
eliminated. IO_PAGE_FAULT are often logged without accompanying "out of range 
cmd". And after adding debugging printk() I haven't managed to trigger "out of 
range cmd" yet. But IO_PAGE_FAULT are more easily triggered.

Are there ways to trace origins of IO_PAGE_FAULT itself?
