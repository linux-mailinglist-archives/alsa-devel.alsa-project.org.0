Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A11866102E5
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 22:43:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BA432812;
	Thu, 27 Oct 2022 22:42:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BA432812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666903398;
	bh=8g/NvpXF90lFd3MK6y1uk8Tp2PL5UqO5GTNCv7dIPN8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pgbfua8TJRlaOci+PXgxZ9o8BcyFwgj/mQ0An11heAeC61g6c9/V9Lu+xYYBgYex0
	 l1wF+/XlQ4fXmy3xcsk6s6hom1cH6CBhtuV5Efe4uno17g1YihvmzTDLfRD9k+3B1O
	 Cpi4A8f5l7EiFUrbKKn73neAJEbbPL6LwdgprrqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B1E6F80496;
	Thu, 27 Oct 2022 22:42:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A4CDF8025E; Thu, 27 Oct 2022 22:42:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87B46F80100
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 22:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87B46F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="mfcsfrDE"
Received: by mail-vk1-xa2c.google.com with SMTP id a66so1479966vkc.3
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 13:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8g/NvpXF90lFd3MK6y1uk8Tp2PL5UqO5GTNCv7dIPN8=;
 b=mfcsfrDE3cI/GmCb3UBhTkX6gdZNSZz8f0vHfemZ3spIk9sGzim525YmQAu3FndJM/
 DyNGThWRZ+hL0jEqnxsVkKqwq7Qofv7yjYruWxi1JYVVH80AYmwFKsjuOrshqQVUUJXt
 GDyodQj01+3C1NUg31BGShO3HSqO3ziCeznVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8g/NvpXF90lFd3MK6y1uk8Tp2PL5UqO5GTNCv7dIPN8=;
 b=UN85FlIzjYZ42+4r+3EqLFrJwviME3Il8qMW/VjAEYqUmgG5Rh1RtEpsWLMIYLfd0Z
 YFeZXJ7cVozNnaL9vYgNEV8/XkON62CEOTzhWesx2NR7/C3iSHJtSf+kMrBKSIwhPrtp
 buu3y9EMnlTiy6cAP44ub7oZVTEr3UOfkpzzfjcmcntRfCiv4OaoadBF/HRi/xlzVzQe
 BulQWbORxf+p5ejylSAXsR+31xFBwlW1Vs7TKmyLLtrdY8VBFgAZmsirsAAzRQiEKc+N
 UMQQLCRKo0ihCAS6+ucMo+7znveMALkdhGejIhe8iWJROfmq7Wh3Me+zfOWCXQbr1tNw
 VKIg==
X-Gm-Message-State: ACrzQf1WuSDxmgaiZ6S+5rRNyJ/5LEj4hDS/j7ciSA7MgH0HWNaXML+G
 YgwXziFMw8x43CPMXs7fz7KvAmF2F0NObxrGjBaqPw==
X-Google-Smtp-Source: AMsMyM5e8H7JiXPDjiqKLc+IO2hoeZk2b3j2tenM4xk6Apsvq9cUZwBocikHt7yRA3c12RqM2flZsv1TL5jE9g/WLd8=
X-Received: by 2002:a1f:9116:0:b0:3a2:362b:fea9 with SMTP id
 t22-20020a1f9116000000b003a2362bfea9mr27041203vkd.11.1666903334314; Thu, 27
 Oct 2022 13:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221024220015.1759428-1-nfraprado@collabora.com>
 <20221024220015.1759428-3-nfraprado@collabora.com>
 <CAGXv+5HJo5x2ieOegmv5vkfh+rTevdR_fri-7PeK+Gd+GXVjNw@mail.gmail.com>
 <20221027143627.nbbketezqunkclxh@notapiano>
 <CAGXv+5Hki=VsvZrtANujFYseBp0Lxj4WVf3nzT7cx1kkMmWPFg@mail.gmail.com>
 <CAGXv+5EZO0+Af-Fmz8JW0SiV+b5He8ZSrinJ3TtaCP0vEoW1Mg@mail.gmail.com>
 <20221027192015.qbmf4bwwok63wytz@notapiano>
In-Reply-To: <20221027192015.qbmf4bwwok63wytz@notapiano>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 27 Oct 2022 13:42:01 -0700
Message-ID: <CAGXv+5H3B33cTJ7mxd11D3WALHo90fCdTXKXZRfnaK4GATnPMA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: realtek, rt5682s: Add AVDD and
 MICVDD supplies
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Thu, Oct 27, 2022 at 12:20 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Thu, Oct 27, 2022 at 11:11:08AM -0700, Chen-Yu Tsai wrote:
> > On Thu, Oct 27, 2022 at 10:48 AM Chen-Yu Tsai <wenst@chromium.org> wrot=
e:
> > >
> > > On Thu, Oct 27, 2022 at 7:36 AM N=C3=ADcolas F. R. A. Prado
> > > <nfraprado@collabora.com> wrote:
> > > >
> > > > On Tue, Oct 25, 2022 at 01:12:49PM -0700, Chen-Yu Tsai wrote:
> > > > > On Mon, Oct 24, 2022 at 3:01 PM N=C3=ADcolas F. R. A. Prado
> > > > > <nfraprado@collabora.com> wrote:
> > > > > >
> > > > > > The rt5682s codec can have two supplies: AVDD and MICVDD. They =
are
> > > > >
> > > > > The actual chip also has LDO1_IN (for digital core and charge pum=
p)
> > > > > and DBVDD (for I/O). However in the Chromebook designs these two
> > > > > and AVDD are all provided from the same power rail, through separ=
ate
> > > > > filter banks.
> > > >
> > > > What about rt5682 (no s), does that chip also have these same suppl=
ies?
> >
> > (Missed this question)
> >
> > The RT5682 has the same supplies, plus the VBAT one.
> >
> > ChenYu
> >
> > > > Also, since you already gave the purpose of these other supplies, c=
ould you also
> > > > tell the purpose of AVDD, MICVDD and (for rt5682) VBAT? That way I =
could add
> > > > some description for them in the binding.
> > >
> > > As Mark mentioned in his reply, these are quite standard names.
> > >
> > > AVDD is for the analog bits. MICVDD is for the microphone bias.
> > > VBAT is called battery power in the datasheet. The block diagram
> > > shows it going through an internal controllable LDO whose output
> > > then powers MICVDD. This could be used in designs that don't
> > > include a suitable external supply for MICVDD. If MICVDD is provided,
> > > then one would turn the internal LDO off.
> > >
> > > So either VBAT or MICVDD has to be provided.
>
> So if I get this right we should be making the following supplies require=
d:
> AVDD
> VBAT or MICVDD (on rt5682s there's no VBAT so just MICVDD)

That's right.

> And for LDO1_ON and DBVDD what would be the best way to model? Should we =
make
> them required in the binding as well and add them pointing to the same re=
gulator
> from AVDD in the chromebook DT or just leave them as optional?

They should be required. And we then describe them to match the board.

ChenYu

> Thanks,
> N=C3=ADcolas
>
> > >
> > > ChenYu
> > >
> > > > Thanks,
> > > > N=C3=ADcolas
> > > >
> > > > >
> > > > > Neither does the datasheet specify the ordering of AVDD, DBVDD, a=
nd
> > > > > LDO1_IN for power sequencing, just that three should be toggled t=
ogether.
> > > > >
> > > > > Should we model these? Or wait until some design actually splits =
these?
> > > > [..]
