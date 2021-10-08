Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D45DC426B07
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 14:38:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FC031689;
	Fri,  8 Oct 2021 14:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FC031689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633696737;
	bh=tr57BcsLvQff1UJOz2xcwwSVeDkxcz5E9TvAladVYsM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gHI4nQPu81o084J+b6ymFA5rkRxY2W0Ue2kNoSu0RFiovxuxIMAnPlMyoZ9iQqwjG
	 NBAl0ClQK82yMztAbhygEVUoQrsqZla20p1uYTs7dByrBkcAt0sl9/gF95knIptjx4
	 1+9kGXC+kvKdS4pR8PJl0kKV++BD1NECTDDNypMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B260CF80249;
	Fri,  8 Oct 2021 14:37:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3C1BF80246; Fri,  8 Oct 2021 14:37:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C0ABF80229
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 14:37:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C0ABF80229
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MHG4W-1mUNA129TM-00DCR8 for <alsa-devel@alsa-project.org>; Fri, 08 Oct 2021
 14:37:29 +0200
Received: by mail-wr1-f46.google.com with SMTP id t2so29384626wrb.8
 for <alsa-devel@alsa-project.org>; Fri, 08 Oct 2021 05:37:29 -0700 (PDT)
X-Gm-Message-State: AOAM530K2fKv2rD+BHgkkc2q35O87vmg5K/mrKAa4tOE22fBe3B4D2U2
 deRU8swXe528R+/NMjk/vdfr1WKDShI1Owp9BGg=
X-Google-Smtp-Source: ABdhPJz+OsHH9TxIx5K6iJ9DpkOYbAe4pbkJ+fTL9DRFiVKeKmwkbM0kl6Mrn8Ssl6rKFyFAWgZsHKiq0l0TwmsxawQ=
X-Received: by 2002:a7b:c8d1:: with SMTP id f17mr3224956wml.35.1633696648763; 
 Fri, 08 Oct 2021 05:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <s5hpmsh9kdx.wl-tiwai@suse.de>
 <CAK8P3a0K3XtjiszC3XWgG0L8+AgO+xUGr_KEAnb9a5GmyecoUQ@mail.gmail.com>
 <s5hee8x9f92.wl-tiwai@suse.de>
 <CAK8P3a0pSZxqfk-bn+idrDYDwANSfiP9L6U1O5jLQvK+3vwyVQ@mail.gmail.com>
 <s5hy27497eo.wl-tiwai@suse.de> <20211007160634.GB7074@brightrain.aerifal.cx>
 <s5hr1cw95ar.wl-tiwai@suse.de> <20211007165158.GC7074@brightrain.aerifal.cx>
 <s5h5yu79aab.wl-tiwai@suse.de>
 <CAK8P3a0qxNLv3_RcR5COcRGPcTnYMcfbOjdWKiT2hKdcof9WUg@mail.gmail.com>
 <20211008120609.GE7074@brightrain.aerifal.cx>
In-Reply-To: <20211008120609.GE7074@brightrain.aerifal.cx>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 Oct 2021 14:37:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2=X5tPppmcV4x9=pyodiPfoq=tA5jVKuMwA1nKJe=_bA@mail.gmail.com>
Message-ID: <CAK8P3a2=X5tPppmcV4x9=pyodiPfoq=tA5jVKuMwA1nKJe=_bA@mail.gmail.com>
Subject: Re: [musl] Re: [alsa-devel] [PATCH v7 8/9] ALSA: add new 32-bit
 layout for snd_pcm_mmap_status/control
To: musl@lists.openwall.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:rAqYyXCoUAcykQiu35tt6ud+7tbe9xrqaMAM+IMbgVFHJNcJc6D
 qzpWoNT8YU9kjSyBe5DJ2mPfIQxNpdwAkQTem1o6SIWjpiKv2sCr9sCseD/JSyaRn0p0VOk
 4RidWeV/uJ2FL6ykjn17/c114flrqJdNnD2PZPbmfCEfjcyTZrikvg0yUNQ7JALrXmYK19U
 iy51VFKamwi8NqH15AfzQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:D0zfJpGORWk=:OH24F8CEuPBkGHU3sakcpL
 6GTTUo2q7mpFC05WCljGCpueTlQALeFY2FmtGZ2Ge+XJIkJrZSFLP6i4yGSd5Eo28AyEmEe25
 nd41aVU+Q8/ys1nYkJMILR2wP3XKX2TaGkHQ1hUFO8TR2kk15zeBp9Foj20ddUmztwDLsKfpw
 Z4UOovfT2rHL9tTnbn5nDz8Dlwu7ejseesqSgenn4WiiTjymEkF/05ArRjDYEIvQ8suEX92Wd
 /X8dw5jluBAyHWSrsg5J+aMTAX+pHx6LUay/zDrEkgz9XokJOYyjMP95GW83G8IXg5DlBhaPw
 G+1D7puPsVPbftw8JNQQBpxIf6yIcXIk7xV9BthsqYEuW8yNgYecF9V0b/lv8hyPgeHMZ2NVF
 IgJeBsZQ3y+8h73c8IPiRpS+kROQK1CAaOyED3wQ7TO/mNuL0dtS22eh1WLC2NHbj4x9RJScT
 MfP+/AW9V7iYxQaDkf+UdWLpg6qzSkCNvFQFrTBx1z2+4sK7Ue60AJoysjPazfUap9lhE9VgQ
 GI+eq8P/PA9C5i9W+zqRxjPZgaePd+F01MineRgkzZVoA2+fchs9AtI5N7rJvAONeDtgTyEd3
 XDSROQq12Wg27RAf8Tv1ursxzRQbWpB/vnS4WgaILZ7ue4y5knwvQ3BW119nlZvqexBJxvBgR
 mYmuQgycH6Jg+afdjczbvPaKwhfjEaed1kaggzx1N9tbLQzqMFtH2ittOy/CUyYayoxQ/jvox
 LYUwZEFfD3bi8A2qyL6Ne337K+mhtXL9MzmOGp1Xm6vDB+AUfp47TRWQO9/efhrf5vomudG9x
 dqnEru0N1RSz9bqHSoszxuyqSMbcCuVIb9kySCDn4j/AWH7ujBvd9WMpwdMZdp2UCq9U1ZOAb
 hTQEx0GtOoSO1RXzfHRg==
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Baolin Wang <baolin.wang@linaro.org>,
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

On Fri, Oct 8, 2021 at 2:06 PM Rich Felker <dalias@libc.org> wrote:
> On Fri, Oct 08, 2021 at 11:24:39AM +0200, Arnd Bergmann wrote:
> >
> > I've tried to understand this part of musl's convert_ioctl_struct(), but I just
> > can't figure out whether it does the conversion based the on the layout that
> > is currently used in the kernel, or based on the layout we should have been
> > using, and would use with the above fix. Rich, can you help me here?
>
> If the attempted 64-bit ioctl is missing (ENOTTY), it does the
> conversion to the legacy 32-bit one and retries with that, then
> converts the results back to the 64-bit form.

I understand that it tries to do that.

The part that I'm not sure about is which of the two possible
64-bit forms it's using -- the broken one we have defined in the
kernel headers, or the one we were trying to define but failed.

      Arnd
