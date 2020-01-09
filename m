Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E893135791
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 12:01:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13E3D1779;
	Thu,  9 Jan 2020 12:00:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13E3D1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578567702;
	bh=NCRVV0fJ3Vl0z1+Ar3x+pL7FHPM093cwtFDaOnSzTkA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FGSMz0tMtTfuDJPSSm5Q9qv31CBDaHEbOQTMyQbuEkEgI66BqX4UI+674GxnushHY
	 79XS0DKlDIfZs3LS2tNCruseypskNfpZ4LYvdz/t1uJfV8FLJfoFrri1YN5NNabdQi
	 ypfpu1t+OLUAxZYuCdK4kE/jBOJWtDB0EBgCa8E0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49D64F801EB;
	Thu,  9 Jan 2020 11:59:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF151F8015B; Thu,  9 Jan 2020 11:59:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8638F800E4
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 11:59:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8638F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="WxtF6rMh"
Received: by mail-io1-xd44.google.com with SMTP id v3so6644374ioj.5
 for <alsa-devel@alsa-project.org>; Thu, 09 Jan 2020 02:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QPi6QnVXghXv8TY7JMc2BuYgut9DZveS4sz8HSAzzAE=;
 b=WxtF6rMhat0yOMYOkIGw1PZioR964EQ0WGOdDWYoA4+TwrtGwcvF471ZdqnxorH+R6
 JEi1bKDztJVqWgCIWLQ5bH80cEw5JZJak2XTFCVGavFicQZFC0I57NcUbrKpmb6LMCQn
 Ho8KowQTK6vAx+J2SE9zTNXGo9yBrJlC0mrEXy3/BVPRJ4DQf73YsijLrIt2W1mKC36m
 1PsZ1RQk+yUVF1o3TrbcEtAyMCbPu5DHnO0G5bj4WPRbOMOcwwFVcIqYPfeUGYJuwM6E
 0RkxNn+bxdnC4UEb7Xa8B18mFIv4FyhYRvMzcTnft+1mPcfXVyjRGHYpwzd36Gc/cpzW
 FTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QPi6QnVXghXv8TY7JMc2BuYgut9DZveS4sz8HSAzzAE=;
 b=nQoAy4Oi4xZBF56xIEeBLdp3N45ynqv7aq/Mso6WqTfBlJuQRPbwlByGCU/A+m8id3
 Lfm3n1+VCz7i8fuUUh3MmvhEsh5GNxaMWiBs4gv9V4rbno1KFmq8M7xVLnSydOX3gNrC
 GI9H/JQMsRq8A6JkmsHX2bEZPratZIMXRsEmhXktACu3oNlRfxe8d+JdEfphTbHnBUiB
 WQx90AnNUvzIzUfDqiMOXhRPbTKyXeN85qENsSGwN9bAOvGszkyvgN/IO74eGhV4cbbg
 NL9cjRG1GgxYeHP3/viyO+J+uUlN77LWwo5GfcnLMbtlHbrxiwBV6r+dLTV975kgYK7T
 sTuQ==
X-Gm-Message-State: APjAAAUmUkMd9Ng/m6izIZKNrpHEDoGvhP+0jWCvsXAM7N7878VMlO46
 kn275JoGTbMEbz3QAmA3CQ4RWCQ9cZIkSS60dW5a5u3DMzU=
X-Google-Smtp-Source: APXvYqy5YRToV4ho+1HZN01NgOpFCbr14jsvMrxynyarJaFUyY1ek05rytw4zulCXWiF5tX1rdl3nX75mbjlAFbZqhc=
X-Received: by 2002:a6b:8f41:: with SMTP id r62mr7053509iod.140.1578567590321; 
 Thu, 09 Jan 2020 02:59:50 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200108115027eucas1p1d3645ba53703780679c662921efbca78@eucas1p1.samsung.com>
 <20200108115007.31095-1-m.szyprowski@samsung.com>
 <20200108115007.31095-2-m.szyprowski@samsung.com>
 <CA+Px+wXkFE5b_8bLz7-c95TvEdqHGD5s-XKRYMVr40xQkqTWxQ@mail.gmail.com>
In-Reply-To: <CA+Px+wXkFE5b_8bLz7-c95TvEdqHGD5s-XKRYMVr40xQkqTWxQ@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 9 Jan 2020 18:59:39 +0800
Message-ID: <CA+Px+wWVhZn+UrX04bGMnR8J0XeR0+Oy1r0DD4Spm+i1WPZKqQ@mail.gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Dylan Reid <dgreid@google.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: max98090: fix lockdep warning
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

On Thu, Jan 9, 2020 at 1:36 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> On Wed, Jan 8, 2020 at 7:50 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> > This fixes the following lockdep warning observed on Exynos4412-based
> > Odroid U3 board:
> > ======================================================
> > -> #1 (&card->controls_rwsem){++++}:
> >        snd_ctl_add_replace+0x3c/0x84
> >        dapm_create_or_share_kcontrol+0x24c/0x2e0
> >        snd_soc_dapm_new_widgets+0x308/0x594
> >        snd_soc_bind_card+0x80c/0xad4
> >        devm_snd_soc_register_card+0x34/0x6c
> >        odroid_audio_probe+0x288/0x34c
> >        platform_drv_probe+0x6c/0xa4

I noticed the stack is a little different than the last time
(odroid_audio_probe vs. asoc_simple_probe).  Did you use the same
machine to test?
>        asoc_simple_probe+0x244/0x4a0
>        platform_drv_probe+0x6c/0xa4
(https://mailman.alsa-project.org/pipermail/alsa-devel/2019-December/160142.html)

> I would like to spend some time to find the root cause.  It would be a
> little challenging though (I have no real runtime to test...).

After a few hours of study, I failed to find the reason to cause the
possible circular locking.  And would need more of your input.

Followed the information provided in the message
(https://mailman.alsa-project.org/pipermail/alsa-devel/2019-December/160535.html).
As the message said "snd_soc_of_get_dai_link_codecs() return
-EPROBE_DEFER".  The snd_soc_of_get_dai_link_codecs( ) is before
devm_snd_soc_register_card( ), and I didn't find any side effects in
odroid_audio_probe( ).

Only a very minor issue: snd_soc_of_put_dai_link_codecs(codec_link)
will be called twice.  One in snd_soc_of_get_dai_link_codecs( ) when
return -EPROBE_DEFER; another one is under the label
"err_put_cpu_dai".
(https://elixir.bootlin.com/linux/v5.5-rc5/source/sound/soc/samsung/odroid.c#L328)
 The code doesn't generate any side effects because of
snd_soc_of_put_dai_link_codecs( )'s robustness.

Another minor thing: odroid_card_dais is not immutable but
odroid_audio_probe( ) would try to modify it
(https://elixir.bootlin.com/linux/v5.5-rc5/source/sound/soc/samsung/odroid.c#L295).
Again, I don't think it would produce any troubles.  I guess no
machine would have multiple sound cards, share the same machine
driver, and unbind/bind in runtime.

> It is weird: userspace should not see things (e.g. no controlC0) until
> snd_card_register( ).

(based on today's broonie/sound.git/for-next) I would like to provide
you more information about this statement to help you find further
information.
When userspace can see the control device?  Ideally,
snd_soc_bind_card( ) -> snd_card_register( ) ->
snd_device_register_all( ) -> __snd_device_register( ) ->
snd_ctl_dev_register( ) -> snd_register_device( ).
If you look at the calling stack of possible circular locking,
snd_soc_dapm_new_widgets( ) is before snd_card_register( ).  That's
why we think userspace should not see control devices (i.e. controlC0,
controlC1, ...) and should not be able to set mixer control via ioctl(
).


As this may not directly be related to the issue, could you share the
init script of alsactl in your system?  Does it follow the convention?
 (i.e. sound card is ready when receives controlC* changed event in
udev rule 78-sound-card.rules)
> 6. when userspace init scripts (alsactl) enumerates devices
(https://mailman.alsa-project.org/pipermail/alsa-devel/2019-December/160535.html)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
