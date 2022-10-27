Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E264D60FFE2
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 20:12:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 782CA2D92;
	Thu, 27 Oct 2022 20:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 782CA2D92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666894344;
	bh=ghnNel5RKIEKXRcO60Bu3zt02+g/FgjrBbtkb59h7Tg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cn9Y2e9vri0jSDnOr9GCNaCphdQ/CDPDmThipR1VXkRB6KsBrfk42uGuMUPbno1XR
	 pa+LK2bAZH61No9Bda4hr1+a/YXbGCUfEfH5S3RWQxLlxaQJy2B+2jaREDCGEmTiqk
	 gqnQvP/W4uFewDSfrF+q6qngLCBUiTTgRvaVDBM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEB04F80496;
	Thu, 27 Oct 2022 20:11:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 484C8F8016C; Thu, 27 Oct 2022 20:11:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DC38F8016C
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 20:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DC38F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Nl9cV5hY"
Received: by mail-vs1-xe35.google.com with SMTP id 189so2583680vsi.9
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 11:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ghnNel5RKIEKXRcO60Bu3zt02+g/FgjrBbtkb59h7Tg=;
 b=Nl9cV5hYd2NWV2/as5lCXgG/I8Z11C0iPyKcAP0GszGBIl6USl/ycrM5NQHq9QaKsB
 lGnxoZfgdTx+oAjyswEeet279YE8dI0Rr3tICwth/e9xjOpgr2VA8dX0qKPYoeGbiqkh
 SQ3ZDkD8lRd/peA5QVJ0LYpGrxJp/3AcCEsIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ghnNel5RKIEKXRcO60Bu3zt02+g/FgjrBbtkb59h7Tg=;
 b=z4njPhkAHEjdHynz4/s1yDWyrCq6PBHmomaOOJ16EmkSuCsQE2UUmi/F+nA6czZh1r
 uE/5+kKvSSM9gFaEyCUs8vAObjxN5/y5hBNwDPd8Cju2ZuYIe6gMPzZAtFUiZuP2R03N
 ay71zudJYEN2ZrRDtBIyK+LFGl8RcNFIlZXPYZuefVda6SQqnU2kx70thQJpfF64FwpV
 h+b8OPl9B++nEF07gU8YFT1QSUEWBnr3sOxcDelGpEtJzS0RMprHu/dKPTGhywhE9p8/
 M7RAPeZ6YwOPyb9TGuTlWH173nq79pySWM/8L2XF7gJz8RRg0MFzdlXvaMxfNAWJ0xXy
 Hr5g==
X-Gm-Message-State: ACrzQf3GsjFb4Vo2GGGILizxBswiHBo+3fP0BZxTBb2ShAJ4Bc6tZQI1
 6k0JSGXmm54XU22QfNMZbLa3Y5vQDGbWx+xFaPEj5Q==
X-Google-Smtp-Source: AMsMyM74dMH2UoVHwZH6BpexiKJleb8/1mmL7Ju2e0nr7U59fEqEsXTNrYgjaZxot46p9f92JXvR6Ux0CcO4bSM4nxM=
X-Received: by 2002:a05:6102:3ed5:b0:386:91a5:a246 with SMTP id
 n21-20020a0561023ed500b0038691a5a246mr28545900vsv.26.1666894279657; Thu, 27
 Oct 2022 11:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221024220015.1759428-1-nfraprado@collabora.com>
 <20221024220015.1759428-3-nfraprado@collabora.com>
 <CAGXv+5HJo5x2ieOegmv5vkfh+rTevdR_fri-7PeK+Gd+GXVjNw@mail.gmail.com>
 <20221027143627.nbbketezqunkclxh@notapiano>
 <CAGXv+5Hki=VsvZrtANujFYseBp0Lxj4WVf3nzT7cx1kkMmWPFg@mail.gmail.com>
In-Reply-To: <CAGXv+5Hki=VsvZrtANujFYseBp0Lxj4WVf3nzT7cx1kkMmWPFg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 27 Oct 2022 11:11:08 -0700
Message-ID: <CAGXv+5EZO0+Af-Fmz8JW0SiV+b5He8ZSrinJ3TtaCP0vEoW1Mg@mail.gmail.com>
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

On Thu, Oct 27, 2022 at 10:48 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Thu, Oct 27, 2022 at 7:36 AM N=C3=ADcolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > On Tue, Oct 25, 2022 at 01:12:49PM -0700, Chen-Yu Tsai wrote:
> > > On Mon, Oct 24, 2022 at 3:01 PM N=C3=ADcolas F. R. A. Prado
> > > <nfraprado@collabora.com> wrote:
> > > >
> > > > The rt5682s codec can have two supplies: AVDD and MICVDD. They are
> > >
> > > The actual chip also has LDO1_IN (for digital core and charge pump)
> > > and DBVDD (for I/O). However in the Chromebook designs these two
> > > and AVDD are all provided from the same power rail, through separate
> > > filter banks.
> >
> > What about rt5682 (no s), does that chip also have these same supplies?

(Missed this question)

The RT5682 has the same supplies, plus the VBAT one.

ChenYu

> > Also, since you already gave the purpose of these other supplies, could=
 you also
> > tell the purpose of AVDD, MICVDD and (for rt5682) VBAT? That way I coul=
d add
> > some description for them in the binding.
>
> As Mark mentioned in his reply, these are quite standard names.
>
> AVDD is for the analog bits. MICVDD is for the microphone bias.
> VBAT is called battery power in the datasheet. The block diagram
> shows it going through an internal controllable LDO whose output
> then powers MICVDD. This could be used in designs that don't
> include a suitable external supply for MICVDD. If MICVDD is provided,
> then one would turn the internal LDO off.
>
> So either VBAT or MICVDD has to be provided.
>
> ChenYu
>
> > Thanks,
> > N=C3=ADcolas
> >
> > >
> > > Neither does the datasheet specify the ordering of AVDD, DBVDD, and
> > > LDO1_IN for power sequencing, just that three should be toggled toget=
her.
> > >
> > > Should we model these? Or wait until some design actually splits thes=
e?
> > [..]
