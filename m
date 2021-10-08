Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E49426A12
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 13:47:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27E5A168A;
	Fri,  8 Oct 2021 13:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27E5A168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633693648;
	bh=OzX9OQSslrumvlbzKLrmCg/qXhmv5PNZPjIH3rQ4RtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u38R4vUdDKDlWM+kQMSxCXgoLucZGGiJ9iEuKrZLUw/lTxGMcfcQt+yHv9RPaXfEw
	 bb10aSyg9ATgJL+zqO+gk4O5nyO/wRvRtzR5RirvReustBCc+u9wqJKSvNX2Hbj9/y
	 if/TyAtrBnBqEiftI1O0TqdmOF5E1xEe5HMJWyB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93E37F80229;
	Fri,  8 Oct 2021 13:46:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E82EF80229; Fri,  8 Oct 2021 13:46:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 281F1F80229
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 13:46:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 281F1F80229
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MowbA-1n7Z241OxS-00qVJj for <alsa-devel@alsa-project.org>; Fri, 08 Oct
 2021 13:46:02 +0200
Received: by mail-wr1-f53.google.com with SMTP id o20so28876088wro.3
 for <alsa-devel@alsa-project.org>; Fri, 08 Oct 2021 04:46:01 -0700 (PDT)
X-Gm-Message-State: AOAM530LClzP5RzhNU0w3/SZki5zzyft7ZbeSWfoUxUOkItPQHJlWLqG
 m5sNwC5T8vNeWkY0H5UGUh99msj/OWD7+GJSrdA=
X-Google-Smtp-Source: ABdhPJyHo72NGMxQuQyxjtT+5nQCpXx6NLGzNhCQiYTfEj1ygK3qKqvFSanv94vqY7Xo8TEpIVxc2neyx1BN+BCLKCI=
X-Received: by 2002:a05:6000:1561:: with SMTP id
 1mr3318468wrz.369.1633693561692; 
 Fri, 08 Oct 2021 04:46:01 -0700 (PDT)
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
In-Reply-To: <s5hv9277oux.wl-tiwai@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 Oct 2021 13:45:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2DUvQSkUaDzwiRjg9d3w7pXxrw8q_oSawJKY7kEw1qtg@mail.gmail.com>
Message-ID: <CAK8P3a2DUvQSkUaDzwiRjg9d3w7pXxrw8q_oSawJKY7kEw1qtg@mail.gmail.com>
Subject: Re: [musl] Re: [alsa-devel] [PATCH v7 8/9] ALSA: add new 32-bit
 layout for snd_pcm_mmap_status/control
To: musl@lists.openwall.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Ah14Rz8ustNsdnAr1Tjlgz/ZmZcl8PsfUeHuzMG5qA5dYsDLPmI
 ZouGrYBGRXaAoaGyUvoGoBNWz1x55usUBxhy+qBoAvXFxT+eN3qV+qjwZIZnQBNyYQ+AbpW
 E/Yl5d1y8e1ERl2Srd09U0W4yEfX4icjUEZ8sY/DDxSqnPaL5sGuaZ6wcySzsn7NSsS3PpA
 QlY3ReGXGybqJy0YP3ghw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3ug/viv/Khw=:c+KFYuo41LljZkE1HVu2Nn
 BlvN+BNL1xDLH26qtSKcJf1Vd9I6V/Nv/oPt20neuh+Wh3BS5wzSWWzZ15T2zoIucip33Z4rm
 PuR7tkGw8xy9I++vewuMhdvLiIfKo5mVDuOnDcdQHD59QJwfRTUUgow/mzflZuYXY/rFE0xlx
 r5+5ylH9YqSWYbJ2LWn/JR+SdMRuDqGBpD49dk8Gyq2/nxmUocbDtkdrWeb+tWMb4z7oz1LEU
 IF2WhR7NKGwbSf+JRvkb6RYWLAzw3r3dFCTDzsW4Ahbx59SNA4QMDTWcbEcnbfAvB7xRVdr2z
 A8z7spcWeGxWf/maCVv5O0LJ/HwQmoCMPNhmaUbSaaUrAhh9dQurHiSgkig3YyzWM2bDNcNPj
 VRqmLRk7p8t5HHPYMchfwcy6ppS6kMjo3xX/3x4CbcFuUg12v8a+lIK9k+jQSUSE5wQs+H14t
 Ejf6T4iRqXbjG68+YPrecRMNFBMuGp7TCiDWMGQVtVNFgGe5/MadUlZmy4dweVvQA6k5BH4YE
 vKq+46tzBVNB7WS6uYArmIwlwwFJN4Bv2E6cEtcI2NaM9DerT7DCxRm/JTKD0d7L590kYKbk9
 Jf2SG/VwCYD2S3ci2C3bDN+2G+1Lt236UtyEiuHi3BF9eImPatjABtS+mqTZ6p0Lw/YGqMiCy
 KigFrdUpqAgt4zjX2R7AuxxhQBJHFzaGaUnufvlb29lMXpaJwznfG8+6BVW/F8ohmJXg4gulH
 m8SYsJqLX5bmYM5UDz8LW5hjPCV2zszoxsNwV3oy/jPBn0xiFCRL0w1dvwpdBdlkb4fys5zDa
 bWgQ4t+4jQQ6laAiiy3vHjUX79KbX7kbkqvGFcz6RQn8bS31bV5FCiU2sy05kF5E+C8tNlY8g
 06JNqEK30iyC8yOF7xfQ==
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

On Fri, Oct 8, 2021 at 1:11 PM Takashi Iwai <tiwai@suse.de> wrote:
> On Fri, 08 Oct 2021 11:24:39 +0200, Arnd Bergmann wrote:

> >
> > I've tried to understand this part of musl's convert_ioctl_struct(), but I just
> > can't figure out whether it does the conversion based the on the layout that
> > is currently used in the kernel, or based on the layout we should have been
> > using, and would use with the above fix. Rich, can you help me here?
>
> So, at this moment, I'm not sure whether we should correct the struct
> at all.  This will lead to yet more breakage, and basically the struct
> itself *works* -- the only bug is in 32bit compat handling in the
> kernel (again).

I'm still unsure if the musl fallback code is correct or not.

> The below is a revised kernel patch (again untested), just correcting
> the behavior of 32bit compat mode.  32bit apps on 32bit kernel work
> fine as is, as well as 64bit apps on 64bit kernel.

Right, this should cover all cases of the ioctl itself misbehaving.
In addition, we still need to disallow the mmap() interface on compat
kernels then. Strictly speaking, we could allow the snd_pcm_mmap_status
but not snd_pcm_mmap_control to be mapped, but I'm not sure if
that's better than disallowing both.

       Arnd
