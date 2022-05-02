Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1616F5177BD
	for <lists+alsa-devel@lfdr.de>; Mon,  2 May 2022 22:07:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BA171FA;
	Mon,  2 May 2022 22:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BA171FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651522076;
	bh=DN3Xgl4wQ77CfwOQ5gWkXLSlvNlO/kT0WQ14TNQWZ28=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TovehJhFyISNW7bhZK29BBLN916gc7NQtrGHX03FKctpIOjXdLgfOuZm8TmW/nHvi
	 sQbB2gCc/3Ds/bOxQcM5bXJzz6FAnIxmHuhrDZrfMWjD8am0xrLb/inBnzSH4B1dNt
	 qm4IpMfh46zDsaW0A0YnsudkkTCyTDHQ9AvBRkcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF59BF80249;
	Mon,  2 May 2022 22:06:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68E03F80245; Mon,  2 May 2022 22:06:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F43FF800D2
 for <alsa-devel@alsa-project.org>; Mon,  2 May 2022 22:06:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F43FF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Zd4/eIFj"
Received: by mail-ej1-x62c.google.com with SMTP id n10so12326099ejk.5
 for <alsa-devel@alsa-project.org>; Mon, 02 May 2022 13:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DN3Xgl4wQ77CfwOQ5gWkXLSlvNlO/kT0WQ14TNQWZ28=;
 b=Zd4/eIFjGcLEPqHZ7WmQgge9BoYJjb6Ti0GAeIYOIV/CMZEb3NJJBXFMzgc/4No+P9
 t+zEtg4ab//2AmkYkMyRXACc+7XM6sut30TkiijIUMWUwoBlU3R366PgejhEU1L16EMc
 aWEn8ciT4sdADmEATL3u+ZHhKtjjVv+odTUhXeSNB2frDbdgqoQDlvk6MeJq3X/6yrVp
 Z8r9l7LYIOGSzUVOGgeKyhNSxONVMSN9NgP+L9pzfismnV9opc8G5d0XM8Mo9VW5eG68
 m6L0rPMqpVjTdCPbAYtomr4oxxTODmwK0e7I+fkN3DgNwkrVgc+p43DWJYs9mJyc8YMZ
 9U0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DN3Xgl4wQ77CfwOQ5gWkXLSlvNlO/kT0WQ14TNQWZ28=;
 b=fGdJIKY+5YTvScMVPVa9/uSPC/jawNdyxAX0i4yXDw5pGy2k3ugiMOIA4F0uGH3D9a
 5GLgDuQm//sCEIlCXHInpaUIqMhqSQO0o9ehMsETgpk66lZo6zedxMD7AAb9aBfmA5YN
 TMpHKnuyC9FkVyyaeLUj7h4wRdoM56/YYtdP0SWI9C1aY2uDyQFCM/DhPJM/heHisUQ0
 +aIap7gjbxEGpMQS42jDhawJ8RzPjeT3MpXsmZnuNXYI0sYFeLSPyTYbeFu7/ejo1Wyl
 yvoGjVIL4OXWyYSbeg5jBv8fV3nltqGyDmq9K3dML9E/qZveNNMagQNFW/kxotQv5j+8
 RTbw==
X-Gm-Message-State: AOAM53366fP/SR8cJUddBGIG9+XDiUxksqmYNDtcgbnLxkD3kukT39on
 8srHkY3WNIu/s13AKJDFg+yG8ra631zoU6YOQep/LQ==
X-Google-Smtp-Source: ABdhPJxifpkZzedGTGC5L2Yk2C+3FI/f0S875DILEjbi/rYUiYb53FQuV1Hm3WIN46/H2p664NY1f1SjZETXAbdExik=
X-Received: by 2002:a17:907:8693:b0:6f4:82c:822f with SMTP id
 qa19-20020a170907869300b006f4082c822fmr12472412ejc.651.1651522006874; Mon, 02
 May 2022 13:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <d9c3fed4-de6a-2cd8-acb6-7f3d2ad46b70@linux.intel.com>
 <CAOReqxg9Y0_S5jqati4O+GT0C_yR7agBZYK79O996MQAk3HmDQ@mail.gmail.com>
 <29c1bfee-2f0f-e211-1ce7-ac377be03e11@linux.intel.com>
In-Reply-To: <29c1bfee-2f0f-e211-1ce7-ac377be03e11@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 2 May 2022 13:06:35 -0700
Message-ID: <CAOReqxjWXs=moAN-WdZL=8rNFW+MMg_uisJdq3yvfzSkRBoiDQ@mail.gmail.com>
Subject: Re: ASoC component/card relationship
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Mon, May 2, 2022 at 8:06 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 4/29/22 17:32, Curtis Malainey wrote:
> > On Fri, Apr 29, 2022 at 2:55 PM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> wrote:
> >>
> >> Hi,
> >> In the existing ASoC code, there is a fixed mapping between ASoC card =
and component. A component relies on a ->card pointer that is set during th=
e probe. A component cannot be used by or "bound to" more than one card [1]
> >>
> >> This has interesting impacts on how a codec or DSP driver need to be i=
mplemented.
> >>
> >> In the AVS series posted this week, multiple components are registered=
 by the DSP driver, following an interface-based split. There's in addition=
 a second-level split, where the logic is pushed further: the DSP driver pa=
rtitions the SSP DAIs in different set of 'dai_driver's used by different c=
omponents, which are in turn used by different cards. What is done in these=
 patches is not wrong, and is probably the only solution to support a real-=
world platform with the existing ASoC code, but are the framework assumptio=
ns correct? In this example, the board-level information on which interface=
 is used for what functionality trickles down to the lowest level of the DS=
P driver implementation.
> >>
> >> I believe this breaks to some extent the 'clean' split between platfor=
m and machine driver(s), and it's not quite aligned with the usual notion o=
f register/probe used across frameworks, be it for drivers/clocks/you name =
it.
> >>
> >> A similar case could happen in a codec driver, if independent function=
ality such as headset and amplifier support was exposed by separate cards, =
that would in turn mandate that the codec driver exposed N components, each=
 handling different functionality but the same type of DAI.
> >>
> >> An alternative approach would be that the DSP driver exposes all the p=
ossible DAIs that can be used, and the binding is refined to allow for more=
 flexibility. I think it's really the individual DAI that cannot be used by=
 more than one card.
> >
> > Would it also be logical to expose the DAIs on the codecs
> > independently or should this be validated on a case by case basis?
>
> Not following the question, sorry.

If we are considering helping divide the boundary between DAIs and
components, just curious if there is any gain on codecs with more than
1 DAI.

E.g. rt5677 has 6 DAIs, just pondering if it's possible (or even
useful) to do this on the codec side as well. So in theory a single
codec could be part of 2 cards.

>
> >> I figured I would ask on this mailing list if
> >>
> >> a) I am not mistaken on the component/card relationship and
> >>
> >
> > Just trying to think of a reason why this would not be true. Are we
> > aware of platforms that have configuration relationships across DAIs?
> > E.g. they use a single clock and must be configured together, so
> > splitting them might cause them to be in sync? Otherwise I agree, if
> > DAIs can be handled independently then I don't see why we should tie
> > them together.
>
> There are restrictions on most platforms, but those restrictions should b=
e expressed with modeling of clocks and serialization when accessing regist=
ers if required. Splitting the DAIs in different components to expose diffe=
rent cards to userspace without modeling such dependencies is a sure fail i=
ndeed. It's also an assured fail even if the DAIs are exposed in a single c=
omponent and used in a single card. One example would be our very own Intel=
 SSP, if you try to configure a shared MCLK with different settings that wi=
ll quickly go South.
>
> >
> > Curtis
> >
> >> b) if this is by design, or if we want to clarify what a component is =
and what its restrictions might be.
> >>
> >> Thanks for your feedback/comments
> >> -Pierre
> >>
> >> [1] https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-core.=
c#L1364
