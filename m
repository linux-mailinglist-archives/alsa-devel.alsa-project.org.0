Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EAC18DB58
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 23:53:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF8C084A;
	Fri, 20 Mar 2020 23:52:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF8C084A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584744794;
	bh=YJJPMLz7WHfijv4QsdDA8oo6aFkLf4z2pFfe94unjoE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UKXVPr3BZVlxoqNKC3hamiK+ayBo+j18u3HBFg0gCmiHys5vrhF0YpY9Ma6fhPk6J
	 cJiYxHD+qkGScPVtsDQvW/LiUJ6aEhiwjsH+Q4d+HqfbaDlSYf74KgULaHrkslBLqu
	 RzD/DXG3UW4sOPH8kPVADmh15x1TnVe3HrKFqxzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04247F80162;
	Fri, 20 Mar 2020 23:51:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0741EF8015B; Fri, 20 Mar 2020 23:51:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CF7CF800DD
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 23:51:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CF7CF800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com
 header.i=@gateworks-com.20150623.gappssmtp.com header.b="LLM9r0vY"
Received: by mail-ot1-x342.google.com with SMTP id a49so7636752otc.11
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 15:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YJJPMLz7WHfijv4QsdDA8oo6aFkLf4z2pFfe94unjoE=;
 b=LLM9r0vYyuH2sIU2RS7aUWEyYWOB+2wa4CA44ADRkk14C5XdkRJ7swbzRiTdH39oGB
 CKtlEYwhcyA2wgT2iF41wWrgZHwNX/dnVTiq6ypc8AQnDP/or7M/HVp++u+U23YsSHC5
 koTOcuwPKxV7YkhTOmAR/czZBpCmMBKa4x4rZOtACZvhgw8kQ3/vhquFqJGXH71RETDk
 MQS1ZGkTHPOK/L8uFfuONZGrfcHJUBQH7meA/1Ow4LJc3WVD+X4spdjyKnw8NF49ncTL
 xFS5xQa39LhiHCFc5bf5RtkatmpayKHE/sjHa9frRGF5OOUG7KjWMvIAUyEsDewnvBjM
 hNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YJJPMLz7WHfijv4QsdDA8oo6aFkLf4z2pFfe94unjoE=;
 b=ek+RhqDYQ+5GoMSmJ84oPOmFXTvYf/Jd8CClSIH78Wb/KxvKUnOuwz3QpS3of22TJL
 NaG3D/e/6hm/zGw6TZ0JiPGyMzMUA3omqXs/xcrwvV5btzTOegIiBGOiKCBf9MJolD8g
 6hRHcJux9wabU1jPiNwW+XQ4Binm1GCjT9yFLB0qPkGbE98La7s1Hqm6iS+Q41gqRCZV
 vHXzfiyeKb4fbYYOtilEI2XosdjaWGtuE9WWoAS9wb2cmxTeJFUoXbvVKsaK+r9vkUFy
 m25HEg4/Sj8Q0bW6Bp8kb0EF1qEhalexyyt2m9mRu3G2uRjvmD75RvNYsP+izK5Qjc6/
 hRWQ==
X-Gm-Message-State: ANhLgQ3Lj/9CqrQCxf5USAFklO/OoxiivvpywTBSKSU8AS8eAC4wgDTp
 Hr3Ydlyzkx+uIp9GyogAoteNCNcWAihsnTsRJb+LRw==
X-Google-Smtp-Source: ADFU+vsrPVD99WJDPNjK+smBphRsSjzG5wuLh3s4d1fcFl8xjfO2mFAAR+58K5OsCGWDB7pfc44EAJA6of2WZQlPCr8=
X-Received: by 2002:a9d:20e2:: with SMTP id x89mr8299168ota.252.1584744678589; 
 Fri, 20 Mar 2020 15:51:18 -0700 (PDT)
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
 <CAJ+vNU16ax9JTx2kSMUF8SiVD-+4KGoFO-U07xM5eE=T6Fwjhw@mail.gmail.com>
 <CAGgjyvFNCbFw7x6QL063oi-fV2UuVQVfL1cv_pQ74HWoJS4Etg@mail.gmail.com>
In-Reply-To: <CAGgjyvFNCbFw7x6QL063oi-fV2UuVQVfL1cv_pQ74HWoJS4Etg@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 20 Mar 2020 15:51:05 -0700
Message-ID: <CAJ+vNU3h1-tJT-KnyaCHj9wvXzdpDyWfvgTSGYLqU8OrzGXv6g@mail.gmail.com>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC:
 sgtl5000: Fix of unmute outputs on probe"
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "alison.wang@nxp.com" <alison.wang@nxp.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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

On Fri, Mar 20, 2020 at 10:06 AM Oleksandr Suvorov
<oleksandr.suvorov@toradex.com> wrote:
>
> On Fri, Mar 20, 2020 at 5:51 PM Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > On Fri, Mar 20, 2020 at 12:26 AM Marcel Ziswiler
> > <marcel.ziswiler@toradex.com> wrote:
> > >
> > > Hi Tim
> > >
> > > On Thu, 2020-03-19 at 13:49 -0700, Tim Harvey wrote:
> > > > On Thu, Dec 12, 2019 at 4:24 AM Mark Brown <broonie@kernel.org>
> > > > wrote:
> > > > > On Thu, Dec 12, 2019 at 10:46:31AM +0000, Alison Wang wrote:
> > > > >
> > > > > > We tested this standard solution using gstreamer and standard
> > > > > > ALSA
> > > > > > tools like aplay, arecord and all these tools unmute needed
> > > > > > blocks
> > > > > > successfully.
> > > > > > [Alison Wang] I am using aplay. Do you mean I need to add some
> > > > > > parameters for aplay or others to unmute the outputs?
> > > > >
> > > > > Use amixer.
> > > >
> > > > Marc / Oleksandr,
> > > >
> > > > I can't seem to find the original patch in my mailbox for 631bc8f:
> > > > ('ASoC: sgtl5000: Fix of unmute outputs on probe')
> > >
> > > I forwarded you that one again. OK?
> > >
> > > > however I find it
> > > > breaks sgtl5000 audio output on the Gateworks boards which is still
> > > > broken on 5.6-rc6.
> > >
> > > What exactly do you mean by "breaks"? Isn't it that you just need to
> > > unmute stuff e.g. using amixer or using a proper updated asound.state
> > > file with default states for your controls?
> >
> > the audio device is in /proc/asound/cards but when I send audio to it
> > I 'hear' nothing out the normal line-out output.
> >
> > >
> > > > Was there some follow-up patches that haven't made
> > > > it into mainline yet regarding this?
> > >
> > > I don't think so. It all works perfectly, not?
> > >
> > > > The response above indicates maybe there was an additional ALSA
> > > > control perhaps added as a resolution but I don't see any differences
> > > > there.
> > >
> > > Not that I am aware of, no.
> > >
> >
> > The output of 'amixer' shows nothing different than before this patch
> > where audio out worked (same controls, same settings on them). I'm
> > testing this with a buildroot rootfs with no asound.conf (or at least
> > none that I know of... i'm honestly not clear where all they can be).
>
> Tim, did you try to unmute the output with amixer?
>
> Could you provide the output of your amixer with and without this patch?
>
> Before this patch, the driver unmuted HP, LO, and ADC unconditionally
> on load (while it just had to set up ZCD bits).
> Now HP, LO, ADC remain muted until one unmutes them using standard
> ALSA tools/interfaces.
> ALSA mute/unmute controls for these outputs have been presenting in
> the kernel for a long time. Please, just use them.
>

Oleksandr,

When I first bisected to this I must have done something wrong as I
thought amixer settings showed the same before and after - I see that
I'm wrong about that. I see the differences now with HP, LO, and ADC
muted by default. I agree using amixer controls is fine.

Sorry for the noise!

Tim
