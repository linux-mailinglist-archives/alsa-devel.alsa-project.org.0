Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 543C8417DC0
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Sep 2021 00:27:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFF3A1612;
	Sat, 25 Sep 2021 00:26:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFF3A1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632522460;
	bh=xO/aSWAI4RuRWt1PTCg0oErUGoCXDpb1uFwdLxaM6Vk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yz6fPdvvMh5WqvV2sITMyy2YLPH7IaivkelzSTPfslIVKN+mz1RfaBJyEXe/icE8t
	 /GjVu6M0L4cNIM4cw06SC9nDOlnDGpEa5/weS0FtKz5+XxASJcsnlZwlzF4QQaNYbI
	 F6CuInz8E723LylhPwWEoR0n1TkiFTu2P7BC3ZJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A91BF804BB;
	Sat, 25 Sep 2021 00:26:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B53F9F802A0; Sat, 25 Sep 2021 00:26:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 456C5F800BC
 for <alsa-devel@alsa-project.org>; Sat, 25 Sep 2021 00:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 456C5F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="f/j5P6LI"
Received: by mail-qv1-xf2c.google.com with SMTP id cv2so1177357qvb.5
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 15:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9hIoTctW0zXrE7Lw1N+2JJP8RvvOBLGUdaTyz2AkDAY=;
 b=f/j5P6LI1ZrKVcOhKef2nc2k/kiUuXvnnaMLmD7Wkk0ZUuLp803oEGYgvFl0SnFNY9
 TPfKAQDYnBD2+ZpuLF7cY4nOUAhOPvGUiMnPJ3yZ8UEhG22my578l3VphVnsGh3LDk+5
 MIoCX/8g88eFZS4TrQD8NCTaU99LXAxwO9eFJ2Y9eq6Pu9nVWJq//GcWIkLYt1+PLVcg
 mvtQo6El0xUnS0EirWL32REO/JZqwT00FuEKBGjHQNUSm/LqrQyocKzemjzoFbsSUDij
 kN0l3FMUf1hz284yc5+RyxtGWDPWD2Ejxdk7gwstI30wMZaKklc/n1qyNzMT1ZR6s3l+
 hL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9hIoTctW0zXrE7Lw1N+2JJP8RvvOBLGUdaTyz2AkDAY=;
 b=jyNuLbUEyuUuIJ+kA3yCjDFRvK+KqYPAdPFgpLvp1b1g/irVYRlLcQrTIEw2e+2sRZ
 PKRJ05SSmYGeXvdEFmDFwl4g0fe9lJx6DYqPI0GYt0rayjh59uP/M7MgtByIUG367K6O
 0P8blYKeNPqLuCGfevF/s2uWBFe/FZeQF91VfME3Tg9g4DJ0ZChpPPjy/v2MAwcvk4kC
 GfXX3TvSm2dFOfZ46xUu3qi90UndX7uboo1UB5WG05ptdmpLR9SVnUyrJnBKbz0ca1Mq
 eP6i6THBfDqQMU5LS1dnrHN0LY3Kc2UrD0neG+vP9FUamX8zF2WVTLSTz3PCuBG4WFYO
 zRAw==
X-Gm-Message-State: AOAM532JSd/dcOxXKhAU1MCAIpBH3PxLmqazO2PiNdVzGVWcF2k0tIcP
 KGUmkj845HETfk4O0kso4E0=
X-Google-Smtp-Source: ABdhPJyLssKu+xZLY0wgGZsMLCDQ6Plj6jcqmhEOp6M6/YmKIfcH1AGreVpOj3hHg/qGE2VLulrG+g==
X-Received: by 2002:a0c:aac2:: with SMTP id g2mr12729730qvb.41.1632522369910; 
 Fri, 24 Sep 2021 15:26:09 -0700 (PDT)
Received: from geday ([2804:7f2:8280:7522:2e0:4cff:fe36:3314])
 by smtp.gmail.com with ESMTPSA id o202sm7556639qke.51.2021.09.24.15.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 15:26:09 -0700 (PDT)
Date: Fri, 24 Sep 2021 19:26:08 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Muni Sekhar <munisekharrms@gmail.com>
Subject: Re: ALSA kernel projects - for academic purposes
Message-ID: <YU5QgPwYDB2XnaVP@geday>
References: <CAHhAz+i=3NDuxK2rZZY6N18=OTbkna3VMVpx4nNgF0vyq3JmQA@mail.gmail.com>
 <324112.1632501120@turing-police>
 <CAHhAz+jNCd=cw-bohcoiAA2UhNZYSFLX07qEV-T2p+KAsVHhAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHhAz+jNCd=cw-bohcoiAA2UhNZYSFLX07qEV-T2p+KAsVHhAQ@mail.gmail.com>
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-sound@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
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

On Fri, Sep 24, 2021 at 10:28:01PM +0530, Muni Sekhar wrote:
> On Fri, Sep 24, 2021 at 10:02 PM Valdis Klētnieks
> <valdis.kletnieks@vt.edu> wrote:
> >
> > On Fri, 24 Sep 2021 19:34:59 +0530, Muni Sekhar said:
> > > What small projects would you suggest to a novice with the ALSA
> > > kernel. The aim is to develop a familiarity with the ALSA kernel
> > > source code, and also to submit it for academic purposes.
> >
> > A good place to start is getting a good handle on what the phrase "the ALSA
> > kernel" even means.
> Basically looking for kernel space audio subsystem projects rather
> than its user-space library(alsa-lib) and utilities(alsa-utils).
> >

Hi Muni Sekhar,

I'm not an academicist by far but if you want your patches to be academic,
I think it's more of a question of scientific rigour and scientific
method, such that when the patch(set) is finally accepted by the Linux
community and Linus Torvalds ultimately, you can write a paper about
it.

Obviously there are a lot of things an academicist could bring from his
background to improve the Linux kernel, from the standpoint of security,
code correctness, speed (efficacy), etc.

My suggestion is to ask Takashi Iwai if he has in mind any fun project a
novice academicist could try to do with ALSA. He's the maintainer of
ALSA kernel-side and has a background in academia. He could very well be
the person most able to give the advice you ask for.

Thanks,
Geraldo Nascimento


> > There's the Linux kernel, a small corner of which is the ALSA subsystem for
> > sound.
> >
> 
> 
> -- 
> Thanks,
> Sekhar
