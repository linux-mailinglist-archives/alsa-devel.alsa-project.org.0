Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1548F18D35C
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 16:53:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9296374C;
	Fri, 20 Mar 2020 16:52:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9296374C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584719584;
	bh=0Ua2qKCRuJX1p+rRo3iu9VUft1KtJWJecbVLUDaflgk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jZG7szpLyYDyRWkT5T6DahDQ9zi1boDRY3+kh219KO4kJFiZNAPfDm4J5+MS5hIxU
	 9CVT9M+dYJQo267QB50QFJZwPmE6voC8Xp19as61MDAePNgDDtr4ur8I9wxLGepVNX
	 C/K6fMfZAH40P3PDa0V+2XvfuXyxxaU0VzDRR+xE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3EC3F80162;
	Fri, 20 Mar 2020 16:51:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1C4DF8015B; Fri, 20 Mar 2020 16:51:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AE48F800C0
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 16:51:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AE48F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com
 header.i=@gateworks-com.20150623.gappssmtp.com header.b="JrCCUJRD"
Received: by mail-oi1-x242.google.com with SMTP id b17so6934159oic.8
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 08:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Ua2qKCRuJX1p+rRo3iu9VUft1KtJWJecbVLUDaflgk=;
 b=JrCCUJRDMF/N+NkW+ZOd9bgEyld9L064O27BZmFVHpZAwmutTV85jOU/v2s9twknFl
 mAwlpNzFzlfVOJKZ8NC0eE9nProuOVCq9O4JAFisbK/uA6igKBtYdB8EdqxAS0/5VnAK
 DB3SC/HWXyJMksqcyhlQyBI9l7apsGlNjFyYW9WVs8xtDpoUEvp7gBHQ5UCZnZ6XzQKz
 6+hhc26tEbs3xDOg6RtIIhv6ZAYwfzK7fXQxIX6NbqC1X2xiQdOXlawvqQOD6CXgBJEG
 dynuKd6WWWddOGJazON8ma8WC3BKCmS3lpyTmcFstxHzvWJwB1HSrD27jcDZiPfj8l59
 mLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Ua2qKCRuJX1p+rRo3iu9VUft1KtJWJecbVLUDaflgk=;
 b=P1lgkOOGHdT43UeCzneHY/Ytw3ij6CSSFhA2DBYBrqZaY6f3J5+xt9yk8IJ8i45BbV
 NZmmqqT3VBulqz1jYXdUdeXzLjKjxGz0CL6ZbwNZeCLxZlrTwz4pMzHVh5Jyv7i84CIL
 3LDno72/Xc2B8YCuK5wn9zYGPheTAStPSUf1AG/5Bbza4diPEEKm5SSewceTZNVsN/tW
 txg2eYziOwJe243UpspVlub4hdFKIVYsO5Ka1YvHYw3r9BDnMUxsG86uYYQPc3SE87xE
 4edieIIwYLjROJTqhkc54vVq8LHdqdQuoPnwCDRdxKT8JiIVzfbAeu1JGMxngKzD8i/7
 0Daw==
X-Gm-Message-State: ANhLgQ2tCufmG+dWAQ2FmfQG70/g8B+P6mRyXuc2V6uNv+KJYwevPg6Z
 x3QAxQc8vrJXB5xmOX23i0ZMz8o5Cp2MRmUxtJDuDg==
X-Google-Smtp-Source: ADFU+vvOFP1DF5/ZF9jaKsOKByY+/fgm5EgY644cpEkSUiXubLpGBAmhNaI1uzja7eIaSNjN3msBbppikJDPNVcnX/M=
X-Received: by 2002:aca:4b56:: with SMTP id y83mr7242234oia.142.1584719474911; 
 Fri, 20 Mar 2020 08:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191212071847.45561-1-alison.wang@nxp.com>
 <CAGgjyvHHzPWjRTqxYmGCmk3qa6=kOezHywVDFomgD6UNj-zwpQ@mail.gmail.com>
 <VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <VI1PR04MB4062C67906888DA8142C17E1F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <CAGgjyvGAjx1SV=K66AM24DxMTA_sAF2uhhDw5gXCFTGNZi8E7Q@mail.gmail.com>
 <VI1PR04MB40620DD55D5ED0FDC3E94C2BF4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <20191212122318.GB4310@sirena.org.uk>
 <CAJ+vNU0xZOb0R2VNkq6k3efdkgQUtO_-cEdNgZ643nt_G=vevQ@mail.gmail.com>
 <af99c9abd9c2aec6a074fb05310c56b780725ebd.camel@toradex.com>
In-Reply-To: <af99c9abd9c2aec6a074fb05310c56b780725ebd.camel@toradex.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 20 Mar 2020 08:51:03 -0700
Message-ID: <CAJ+vNU16ax9JTx2kSMUF8SiVD-+4KGoFO-U07xM5eE=T6Fwjhw@mail.gmail.com>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC:
 sgtl5000: Fix of unmute outputs on probe"
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "alison.wang@nxp.com" <alison.wang@nxp.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Igor Opanyuk <igor.opanyuk@toradex.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>
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

On Fri, Mar 20, 2020 at 12:26 AM Marcel Ziswiler
<marcel.ziswiler@toradex.com> wrote:
>
> Hi Tim
>
> On Thu, 2020-03-19 at 13:49 -0700, Tim Harvey wrote:
> > On Thu, Dec 12, 2019 at 4:24 AM Mark Brown <broonie@kernel.org>
> > wrote:
> > > On Thu, Dec 12, 2019 at 10:46:31AM +0000, Alison Wang wrote:
> > >
> > > > We tested this standard solution using gstreamer and standard
> > > > ALSA
> > > > tools like aplay, arecord and all these tools unmute needed
> > > > blocks
> > > > successfully.
> > > > [Alison Wang] I am using aplay. Do you mean I need to add some
> > > > parameters for aplay or others to unmute the outputs?
> > >
> > > Use amixer.
> >
> > Marc / Oleksandr,
> >
> > I can't seem to find the original patch in my mailbox for 631bc8f:
> > ('ASoC: sgtl5000: Fix of unmute outputs on probe')
>
> I forwarded you that one again. OK?
>
> > however I find it
> > breaks sgtl5000 audio output on the Gateworks boards which is still
> > broken on 5.6-rc6.
>
> What exactly do you mean by "breaks"? Isn't it that you just need to
> unmute stuff e.g. using amixer or using a proper updated asound.state
> file with default states for your controls?

the audio device is in /proc/asound/cards but when I send audio to it
I 'hear' nothing out the normal line-out output.

>
> > Was there some follow-up patches that haven't made
> > it into mainline yet regarding this?
>
> I don't think so. It all works perfectly, not?
>
> > The response above indicates maybe there was an additional ALSA
> > control perhaps added as a resolution but I don't see any differences
> > there.
>
> Not that I am aware of, no.
>

The output of 'amixer' shows nothing different than before this patch
where audio out worked (same controls, same settings on them). I'm
testing this with a buildroot rootfs with no asound.conf (or at least
none that I know of... i'm honestly not clear where all they can be).

Tim
