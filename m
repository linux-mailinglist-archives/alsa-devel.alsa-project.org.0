Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC40426A89
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 14:15:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE5DC165E;
	Fri,  8 Oct 2021 14:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE5DC165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633695301;
	bh=vqMyITl6Aqvd/V43mapMw3Cy+moJFfU/RrmyU7784Y4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pLo5IlIY0zwWBthBeSuqILCn6tQa1X8gWhKjpEuEgLtfp9SyoiYjRGdhWWjit7cqf
	 ja5uG1zNt+fPp4yOtRFKyMVXsFMtGLTszA5KdBBwlXfQHilNbvHKTkv32XjKA81Yeg
	 JofaLRdFETtrkyhkKW3QgkHIMxbhHhF0aIc2GtDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F09FF80249;
	Fri,  8 Oct 2021 14:13:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E424F80246; Fri,  8 Oct 2021 14:13:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11DFBF80229
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 14:13:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11DFBF80229
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MirSu-1nDd9d0b8G-00etOv for <alsa-devel@alsa-project.org>; Fri, 08 Oct 2021
 14:13:33 +0200
Received: by mail-wr1-f50.google.com with SMTP id s15so29267024wrv.11
 for <alsa-devel@alsa-project.org>; Fri, 08 Oct 2021 05:13:32 -0700 (PDT)
X-Gm-Message-State: AOAM5320X6QZPGNhMkUr/2X36k0PiaRly9Qiez3K5nUCTw3hE4YqQmFg
 qMnoStqSFSHK1ehDb9VpsIgkRCrmwQ/6HhX/TDA=
X-Google-Smtp-Source: ABdhPJx1A2D3uT0vzkwBBgcqCmigtym207jBkyjcfjbAUCVSC7jvNZMRoRn37wH1p1cCJbv0expgQMHr7/L53iVVxso=
X-Received: by 2002:adf:a3da:: with SMTP id m26mr3519436wrb.336.1633695212568; 
 Fri, 08 Oct 2021 05:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191211212025.1981822-1-arnd@arndb.de>
 <20191211212025.1981822-9-arnd@arndb.de>
 <29QBMJU8DE71E.2YZSH8IHT5HMH@mforney.org> <s5hpmsh9kdx.wl-tiwai@suse.de>
 <CAK8P3a0K3XtjiszC3XWgG0L8+AgO+xUGr_KEAnb9a5GmyecoUQ@mail.gmail.com>
 <s5hee8x9f92.wl-tiwai@suse.de>
 <CAK8P3a0pSZxqfk-bn+idrDYDwANSfiP9L6U1O5jLQvK+3vwyVQ@mail.gmail.com>
 <s5hy27497eo.wl-tiwai@suse.de> <20211007160634.GB7074@brightrain.aerifal.cx>
 <s5hr1cw95ar.wl-tiwai@suse.de> <20211007165158.GC7074@brightrain.aerifal.cx>
 <s5h5yu79aab.wl-tiwai@suse.de>
 <CAK8P3a0qxNLv3_RcR5COcRGPcTnYMcfbOjdWKiT2hKdcof9WUg@mail.gmail.com>
 <s5hv9277oux.wl-tiwai@suse.de>
 <CAK8P3a2DUvQSkUaDzwiRjg9d3w7pXxrw8q_oSawJKY7kEw1qtg@mail.gmail.com>
 <s5ho87z7mxg.wl-tiwai@suse.de>
In-Reply-To: <s5ho87z7mxg.wl-tiwai@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 Oct 2021 14:13:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0kg0NQoxC7_cUJfFZkoheAE2A_fQLTGKqgz0wq3L0rvw@mail.gmail.com>
Message-ID: <CAK8P3a0kg0NQoxC7_cUJfFZkoheAE2A_fQLTGKqgz0wq3L0rvw@mail.gmail.com>
Subject: Re: [musl] Re: [alsa-devel] [PATCH v7 8/9] ALSA: add new 32-bit
 layout for snd_pcm_mmap_status/control
To: musl@lists.openwall.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:yx/M4maUOTgoKo8rX5vFvoHw9fM9UZ9S/SmSvCfv9deVncDwaXY
 Jls94hUHR6UcNPLVFAv5pSKshR5Wr9tE5z1rA/vKi5mUfp3ThbjKKfHhTEtDmrm+3ZRlOat
 WMQ3zLuIt3rngz35d22rHTyeBjQmCf0MCsyWr8s0/ictl9ziqJfbVK8/FJzloiuM8Z75RZs
 rp2n2olSYAkYA68q4ou5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5ALdFe/AGmQ=:q5FD/BKzvBlcAxZuooUZtp
 2mxKo3y2YJLV+tTv0FyNJ9lTjY67i64VlYYIK0fKQAq4Pq35VhksZzuID7eANXEIQb+UavECF
 thdiWFp4Kx+PuuD7Mbd5NP6PMRHO0OmFJXUP8aejUimUTK8/mRs8ASvYGGYtQDJ5SUfrawphz
 6voVQU/4YmakUVyBzmk1ckCUKrbNd59YchTeRMdbRyM70qoxI9uTSyd/15ie8EA2HQvYUGycn
 /FbUa2KRSL3CTua0qA05cUgaFHpS3HjhgABFuydYg+XICPbNXNljfk/hbLZOCdZUm3lgaWPnE
 SvARpRbd/wsY3yHnTr2BztqDRqIG8cmPYi4Y6CbYDbBVUvPhS5CzznSkrcGJlNDWbrIIOqlLz
 hgr2ZTfykUPtKNgxvxVIake1S+65eNcgWD5WkF0qjUVwATMGn/0Wxbr65TYee99JM1xZfO3Ke
 CDO82s/DaCJnb1VSVllMgszSGGKS9pLPlIDzCz2J9Pp5DPnWI7T9RD720YmHoo0BdDCXbJb1q
 ecxjXbcqBSnlu2QzwJbHswh2QB8ZZvte+z1wNMwTaaSwrmMOK5KBp/7E8BaxV+qoJnkMVrTYK
 8WuSamGsuRrz/QE3wcuJK9XqCWpkWvIlXLW3u/2L4BiPV0VgEXikqvwXRsEtGBGhIJMPMwTVR
 Ws4qSo5ETj2/dF51nzXTihnytuDMuEqUZYwodJ74jlBMlaQB6Df81r4ZNd7XxFsX87Gpe9Tf/
 YcceLOQWhNmvFeiH3Hfe+n2EdftAojsKWU8HijvHlKelyXdvMHRlqvufkto1DPyVMPRj4sVJD
 4Ge9vpzhBoGgKYs3RvctL5SuVdmZ275+b3TQ4pKJrFNmDd/zLBTW5gOw55yG7Fux/qJjuyylz
 c2dVoOK7GyNlnb/GHTMA==
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
 Baolin Wang <baolin.wang@linaro.org>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Michael Forney <mforney@mforney.org>,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>
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

On Fri, Oct 8, 2021 at 1:53 PM Takashi Iwai <tiwai@suse.de> wrote:
> On Fri, 08 Oct 2021 13:45:45 +0200, Arnd Bergmann wrote:
> > On Fri, Oct 8, 2021 at 1:11 PM Takashi Iwai <tiwai@suse.de> wrote:
> > > On Fri, 08 Oct 2021 11:24:39 +0200, Arnd Bergmann wrote:
> > > The below is a revised kernel patch (again untested), just correcting
> > > the behavior of 32bit compat mode.  32bit apps on 32bit kernel work
> > > fine as is, as well as 64bit apps on 64bit kernel.
> >
> > Right, this should cover all cases of the ioctl itself misbehaving.
> > In addition, we still need to disallow the mmap() interface on compat
> > kernels then. Strictly speaking, we could allow the snd_pcm_mmap_status
> > but not snd_pcm_mmap_control to be mapped, but I'm not sure if
> > that's better than disallowing both.
>
> IIRC, the compat mmap is already disallowed even for the
> SNDRV_PCM_MMAP_OFFSET_CONTROL_NEW (in pcm_control_mmap_allowed()), so
> no need to change around that.

Ah, right. I think it was meant to become allowed as part of commit
80fe7430c708 ("ALSA: add new 32-bit layout for snd_pcm_mmap_status/control"),
which did allow the snd_pcm_mmap_status to be mmap()ed, but it appears
to be the rare case where two mistakes cancel out and we don't have to
change the mmap code.

         Arnd
