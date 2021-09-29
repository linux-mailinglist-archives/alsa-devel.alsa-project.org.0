Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B45F841CC10
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 20:44:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 069D716EB;
	Wed, 29 Sep 2021 20:43:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 069D716EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632941059;
	bh=anTxZhbBOLr8F0GAF+FtiNEv4VhiwsqSrowrzmJaxKM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rP1kjb7lAxxaAAgrxDCGYv4cU4MDX4I3e5lCFBQNt89q306WlBexWvOK7SePmC3pR
	 mpqp9v1b9w1WFax62Mm4OpcjGkiFovHHX1QiQyqGDcz7MTyTEUlB6UvzwVYKpLq1YG
	 da7Ad0zqnzjV927Wof5KSd/svOejr7CkibIsmfdc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6253CF8026D;
	Wed, 29 Sep 2021 20:43:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A716F80227; Wed, 29 Sep 2021 20:42:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50DA3F80113
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 20:42:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50DA3F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MlAD5cPS"
Received: by mail-vs1-xe2c.google.com with SMTP id f18so4229674vsp.2
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 11:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=21IXWzaKvhy7DYpO/VQCERD9WWYgc4mpzGPcHFrC2M0=;
 b=MlAD5cPSegzXT55tBZQBIBZMhyEIevHpGwrtkfyV0vfeT0axIPOqpXzsKs/F0ZQC60
 7eTfILu795wdSjoLwKASKbu64CA+K6vTUG91El/Mz3WlHdXQ4/Bo3EcncF1cHbVmibX4
 uxcbKRCgpBy0I223FyZ2MLyoZSsZGNAUvxSjomlkJLa68hYEWk4X0fb/1FTrH5qV0zcu
 RGTOw7n7CFjdprj4CvT8MnjqGGHSKJTr8jFPLqfk2d+VsNXy0fda8Os1xeERhakzxMH2
 Bx+ltjvpJ8AlUAaSAjXpaTHytB0e1WABncPAJwrqcgdfVEDqnrO+g+lHeNC89Y/cNJcW
 mQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=21IXWzaKvhy7DYpO/VQCERD9WWYgc4mpzGPcHFrC2M0=;
 b=eUFhX5j0BYxKWt9IZoPaAILzLmLA6vZC3gtB6HQhmxzIIM/YNFziqGapPdRSXGuiAf
 gPAi6Us6YfDOUkeEFUnQACI49fmKlRrGA8VLpa2Unf+OdnZWNsKVyF0yEsSm+Jyi5bg3
 r7JFuthbGRiVAtajpVDkj1yjiNgGj824iZomkG7fn1mbxayV2+iu9d5wfl8UEDKyGggl
 UV+KD8pP+aWw9jS2y76tkohng06ErT6+eqcQkAOIVAe3uY3tX0NjwL6R/p/iPjdkvTN9
 adx9lkDV8Ws/dzzzRiobkbtrKRGKnVotOhQa0QDffsgYF+cZj/nxZ6V/QnKLslXSQYYR
 jW+A==
X-Gm-Message-State: AOAM533F8fvTPnKOKfn+EQ7JHwAu/p1ED+MN33cHDza88gvWpv8UBJNS
 PH2iZl7eiua0ovuLMXD5GoA=
X-Google-Smtp-Source: ABdhPJwCMejqhYTZ8XRFyj7AiIQmOgFD1X49X4ZHrHo8GJLTVEZjd55qbDaXbGsQ5BRTgnhBXrCdLQ==
X-Received: by 2002:a05:6102:317a:: with SMTP id
 l26mr1674572vsm.6.1632940970914; 
 Wed, 29 Sep 2021 11:42:50 -0700 (PDT)
Received: from geday ([2804:7f2:8280:7522:98f0:31ff:fe93:2dc7])
 by smtp.gmail.com with ESMTPSA id w131sm343822vsw.14.2021.09.29.11.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 11:42:50 -0700 (PDT)
Date: Wed, 29 Sep 2021 15:42:49 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Ruben Safir <ruben@mrbrklyn.com>
Subject: Re: ALSA kernel projects - for academic purposes
Message-ID: <YVSzqfgqWEoju4Xw@geday>
References: <CAHhAz+i=3NDuxK2rZZY6N18=OTbkna3VMVpx4nNgF0vyq3JmQA@mail.gmail.com>
 <324112.1632501120@turing-police>
 <CAHhAz+jNCd=cw-bohcoiAA2UhNZYSFLX07qEV-T2p+KAsVHhAQ@mail.gmail.com>
 <YU5QgPwYDB2XnaVP@geday> <20210929150715.GC15841@www2.mrbrklyn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210929150715.GC15841@www2.mrbrklyn.com>
Cc: Muni Sekhar <munisekharrms@gmail.com>,
 alsa-devel <alsa-devel@alsa-project.org>,
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

On Wed, Sep 29, 2021 at 11:07:15AM -0400, Ruben Safir wrote:
> On Fri, Sep 24, 2021 at 07:26:08PM -0300, Geraldo Nascimento wrote:
> > On Fri, Sep 24, 2021 at 10:28:01PM +0530, Muni Sekhar wrote:
> > > On Fri, Sep 24, 2021 at 10:02 PM Valdis Klētnieks
> > > <valdis.kletnieks@vt.edu> wrote:
> > > >
> > > > On Fri, 24 Sep 2021 19:34:59 +0530, Muni Sekhar said:
> > > > > What small projects would you suggest to a novice with the ALSA
> > > > > kernel. The aim is to develop a familiarity with the ALSA kernel
> > > > > source code, and also to submit it for academic purposes.
> > 
> > I'm not an academicist by far but if you want your patches to be academic,
> > I think it's more of a question of scientific rigour and scientific
> > method, 
> 
> 
> No - it is an issue of education.  They are trying to learn something
> that they don't already know.  The contribution is they become educated.
>
> > such that when the patch(set) is finally accepted by the Linux
> > community and Linus Torvalds ultimately, you can write a paper about
> > it.
> >
> 
> 
> They are not writing a paper for Linus.  They are writing it for their
> dean or mentor.
>

Hello Ruben,

I don't see your point here. I mentioned not being in academia myself
but last time I was, the academics, from the most junior to the most
seasoned scholar, are writing for journals. They are writing to get
published and cited hopefully.

If they were writing for their dean or mentor to grade them, that would
be called homework. While that's arguably part of education, higher
or otherwise, Muni Sekhar certainly did not ask for help with his
homework.

> 
> > Obviously there are a lot of things an academicist could bring from his
> > background to improve the Linux kernel, 
> 
> Yeah - but that is not what they are trying to do.  And if that was the
> case, this would likely not be the list for it, since this is a newbies
> list.
> 
> 
> > My suggestion is to ask Takashi Iwai if he has in mind 
> 
> BOINK - the doesn't need a new student dragging on his tail and if he
> did then he would chose an intern to help with his code.
> 
> You are failing to understand how higher education works.

I do have my gripes with higher education and I never suggested I
understood it.

As to contacting the maintainer precisely of the part of the kernel you
want to contribute (ALSA kernel-side for Muni Sekhar in this case)
before actually contributing any code, this sounds, at least to me,
like sensible advice.

Thank you,
Geraldo Nascimento

> 
> > _______________________________________________
> > Kernelnewbies mailing list
> > Kernelnewbies@kernelnewbies.org
> > https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies
> 
> 
> -- 
> So many immigrant groups have swept through our town
> that Brooklyn, like Atlantis, reaches mythological
> proportions in the mind of the world - RI Safir 1998
> http://www.mrbrklyn.com 
> 
> DRM is THEFT - We are the STAKEHOLDERS - RI Safir 2002
> http://www.nylxs.com - Leadership Development in Free Software
> http://www2.mrbrklyn.com/resources - Unpublished Archive 
> http://www.coinhangout.com - coins!
> http://www.brooklyn-living.com 
> 
> Being so tracked is for FARM ANIMALS and extermination camps, 
> but incompatible with living as a free human being. -RI Safir 2013
> 
