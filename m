Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD0F4253CC
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 15:12:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F30851661;
	Thu,  7 Oct 2021 15:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F30851661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633612365;
	bh=eopMu/mJxtl84/KkCrZsNfIyX4P+NZNJvE2R2F1sbrQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oavyQN1RKJeGXIprkSc1oIilcxMRug6Sme0Sk0lqwEABo01tjYkmMo7mZVsmBSZNZ
	 +zLp+DdyjB6H1VP4VsZrp+1Kqia7IBqtwu5TeukyNF/QOj5c9JmLbp0W8ybT7udXvK
	 +MMUIqtx8wmsNaYfwZACIBi5FD3JUq2c1X2GSH7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B926F80130;
	Thu,  7 Oct 2021 15:11:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC469F8027D; Thu,  7 Oct 2021 15:11:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B8DFF800FE
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 15:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B8DFF800FE
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mhl0I-1n371p452W-00dkFS for <alsa-devel@alsa-project.org>; Thu, 07 Oct
 2021 15:11:18 +0200
Received: by mail-wr1-f47.google.com with SMTP id k7so18830928wrd.13
 for <alsa-devel@alsa-project.org>; Thu, 07 Oct 2021 06:11:17 -0700 (PDT)
X-Gm-Message-State: AOAM530wzXJydTZ2Y9GDVmuV9fibXrqiyLPYcKQ63Cwrl8jp3pW23qFc
 lKqIV4HccI703CtqIxzxjlHwZguImu5lJsTfv3Y=
X-Google-Smtp-Source: ABdhPJz+35NXT/p5TszOUNgOpymxZVTmTArKWJKi2r6OibnWqxiqzjsuLR4U9FbC9D/iKpGK8f1e5LZYTuC8A3v+RKY=
X-Received: by 2002:adf:a3da:: with SMTP id m26mr5182095wrb.336.1633612277427; 
 Thu, 07 Oct 2021 06:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191211212025.1981822-1-arnd@arndb.de>
 <20191211212025.1981822-9-arnd@arndb.de>
 <29QBMJU8DE71E.2YZSH8IHT5HMH@mforney.org> <s5hpmsh9kdx.wl-tiwai@suse.de>
 <CAK8P3a0K3XtjiszC3XWgG0L8+AgO+xUGr_KEAnb9a5GmyecoUQ@mail.gmail.com>
 <s5hee8x9f92.wl-tiwai@suse.de>
In-Reply-To: <s5hee8x9f92.wl-tiwai@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 7 Oct 2021 15:11:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0pSZxqfk-bn+idrDYDwANSfiP9L6U1O5jLQvK+3vwyVQ@mail.gmail.com>
Message-ID: <CAK8P3a0pSZxqfk-bn+idrDYDwANSfiP9L6U1O5jLQvK+3vwyVQ@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH v7 8/9] ALSA: add new 32-bit layout for
 snd_pcm_mmap_status/control
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:W4vR0GdMOrLBDUZVGP1rBLRFXPIggiN4hG1eELHr3AgRu8BYceW
 dM9ZZHRCbe71AJ1X3YLt04LoQxZ6aXxAVhjV7QF62L7a+7IbcmoTHzb/Y8nMFlzYON6lKyt
 uww5+4g+OYhiN6y887ZHA0hIm0E0nx0fdwoNVNG9mYwMCYCoxtdT3x0/jGz3nmsFWHcMPS2
 PWCiWdJb2yqtsQniCSv1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6r9jcD0GJAI=:aujfh0/2UnVmm+Z1Ulqf1A
 59dny11r6UZRYkf1hdE3TgzG1mfkhhZ/1bp2QJoBv0MLcVxozsLzxKn5pBbp7YXkVrD3HsXYh
 jLUHpVuAlRIJu8Vk5EsGNz3vwmsv4KXhcFKg28/73Ma1g3i/zfCuHd6Z3LhCBu+fZnxUT9FvU
 ytSxuockuYLit+YLQLPDNPf9neQMk2tiMYTyemaPTbeOM6VDbk6biyhr1Kk2c81wa4DlW2Xz2
 dmOUIrPbHmxnnzfOwlAlp6qaesQQIvJZKV+t2YIbBIVFn/jL9oaE26k33T5LtxsESIY4r2B5v
 nVN8NlzDFrpgoQOJI6yUIysMVGnMzFCgz3vCyfeEe5McDuzGa78l0dnKWiE+28zoVcsbg9D2h
 hvHg3ZkzmLpoTwRG/XfNJSTKsyStK4gixHnSPcyaFubGluB4NvZFRQrD0gu4rAsRAQ/qD0+Eb
 ymuoikFzgnaob06f35xlsZhvjlSqBX1nI4pUjw9w6r7cnXPwEkHWOtHAePvfEUwMR1WgzUXZF
 gjp31RBIuY54ErTyXzoTAmvPnAcw0FIh7Idmj5m9JDmQq1WTygNG5JzTme7ZMa3pI13rFu9UE
 nTUG1lZynLhCnyo5+0vIvTxeH3Fd4xgpEk1OLjWnyICeNJ345r93YnWgVFOeUm9LP5zbNNZMV
 7l2ZZ7JBHVk3j+HeLhBo35pjIop51aSJDm2IwkpP0gnxiVtS+6KTdU64yhG8ETsGM4GVtz34u
 KiHqUtPxv4qXUGSheD7B+QsCaOozookkEc1IaYOGtubeWd55B/9uJuh5jpky3dvqfgBHLoGW2
 Bsaws7I6Wa1oyB/zGvnMHqGoN88PZg0g7Jc3gWR/XK39Li+fnMVQeJMyrim25n/m365PgQ+84
 ZqaFZss6eEn2GuMx07Vw==
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Baolin Wang <baolin.wang@linaro.org>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 musl@lists.openwall.com, Takashi Iwai <tiwai@suse.com>,
 Michael Forney <mforney@mforney.org>, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang7@gmail.com>
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

 On Thu, Oct 7, 2021 at 2:43 PM Takashi Iwai <tiwai@suse.de> wrote:
> On Thu, 07 Oct 2021 13:48:44 +0200, Arnd Bergmann wrote:
> > On Thu, Oct 7, 2021 at 12:53 PM Takashi Iwai <tiwai@suse.de> wrote:
> > > On Wed, 06 Oct 2021 19:49:17 +0200, Michael Forney wrote:
> >
> > As far as I can tell, the broken interface will always result in
> > user space seeing a zero value for "avail_min". Can you
> > make a prediction what that would mean for actual
> > applications? Will they have no audio output, run into
> > a crash, or be able to use recover and appear to work normally
> > here?
>
> No, fortunately it's only about control->avail_min, and fiddling this
> value can't break severely (otherwise it'd be a security problem ;)
>
> In the buggy condition, it's always zero, and the kernel treated as if
> 1, i.e. wake up as soon as data is available, which is OK-ish for most
> applications.   Apps usually don't care about the wake-up condition so
> much.  There are subtle difference and may influence on the stability
> of stream processing, but the stability usually depends more strongly
> on the hardware and software configurations.
>
> That being said, the impact by this bug (from the application behavior
> POV) is likely quite small, but the contamination is large; as you
> pointed out, it's much larger than I thought.

Ok, got it.

> The definition in uapi/sound/asound.h is a bit cryptic, but IIUC,
> __snd_pcm_mmap_control64 is used for 64bit archs, right?  If so, the
> problem rather hits more widely on 64bit archs silently.  Then, the
> influence by this bug must be almost negligible, as we've had no bug
> report about the behavior change.

While __snd_pcm_mmap_control64 is only used on 32-bit
architectures when 64-bit time_t is used. At the moment, this
means all users of musl-1.2.x libc, but not glibc.

On 64-bit architectures, __snd_pcm_mmap_control and
__snd_pcm_mmap_control64 are meant to be identical,
and this is actually true regardless of the bug, since
__pad_before_uframe and __pad_after_uframe both
end up as zero-length arrays here.

> We may just fix it in kernel and for new library with hoping that no
> one sees the actual problem.  Or, we may provide a complete new set of
> mmap offsets and ioctl to cover both broken and fixed interfaces...
> The decision depends on how perfectly we'd like to address the bug.
> As of now, I'm inclined to go for the former, but I'm open for more
> opinions.

Adding the musl list to Cc for additional testers, anyone interested
please see [1] for the original report.

It would be good to hear from musl users that are already using
audio support with 32-bit applications on 64-bit kernels, which
is the case that has the problem today. Have you noticed any
problems with audio support here? If not, we can probably
"fix" the kernel here and make the existing binaries behave
the same way on 32-bit kernels. If there are applications that
don't work in that environment today, I think we need to instead
change the kernel to accept the currently broken format on
both 32-bit and 64-bit kernels, possibly introducing yet another
format that works as originally intended but requires a newly
built kernel.

      Arnd

[1] https://lore.kernel.org/all/29QBMJU8DE71E.2YZSH8IHT5HMH@mforney.org/
