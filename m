Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C76B515874
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Apr 2022 00:33:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22C6C161D;
	Sat, 30 Apr 2022 00:32:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22C6C161D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651271611;
	bh=rGH3Pvi/KIWEpsjsI+/ZO+5t3JFvoUTpEYhNnVTMsRE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G+7nWUonuumVqmB2DSm6zcDSq4mJfigQ3WbHbGrF+oyiYQw9PbgkHNheFP0VNU70W
	 43nYUxIPKYdLex4p9eZ9KQkcYqzTns6hnkGFwnCyGK2uSCTuSkHEUGFPyb9GfzNmE1
	 M102uqB/3ifxGOsrMfdP8fgbPP8qUFCuer70k3nU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99932F80269;
	Sat, 30 Apr 2022 00:32:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 555F4F8025D; Sat, 30 Apr 2022 00:32:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B01EF8012B
 for <alsa-devel@alsa-project.org>; Sat, 30 Apr 2022 00:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B01EF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="jtVIQhgW"
Received: by mail-ej1-x62a.google.com with SMTP id bv19so17918533ejb.6
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 15:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rGH3Pvi/KIWEpsjsI+/ZO+5t3JFvoUTpEYhNnVTMsRE=;
 b=jtVIQhgWNsRWUh3/qtfL8wvxrQSkYCxocgF3pVxPmbuTQlO1FU1zSwTusUya4w9pCr
 Q+V71XWvVz8ays0WLjMt0UhoSljKeEOpWkt9YWVx0RDSEebt1lQhc6YeYhd0rY8VKJ8S
 H8QziKjwqpVj28oGA9d7BjLoEhzg/hROUT27YWddOL0KZMqH9tGw52KEqqT9Fm0+RcCU
 gFF18vwf2jQOa5wNR0is3BvSkIevHbjLUQ0uGKhvlmoeRjsbbIMMeXGmxdoQU71avLLC
 DPHsiUfzbm3T4VlouiYe1DX+ScFxWSr1NAOegQk4LDg1Zxk/URtvRLNED2W1y8XcPRc3
 0/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rGH3Pvi/KIWEpsjsI+/ZO+5t3JFvoUTpEYhNnVTMsRE=;
 b=uFybm96GM2u5lQIo4mByVp9Rts/5TZ8X5aS8FZiAhbg0P9MPXPQ/pxsn43RFBPG2A3
 gs0bWgeyQ5qrCjo64Y9eFTx5T2FcCbo+7Gxmi6CgMRqSk+eu/CjjLSB/fgvmWdhpRDa3
 a/DX3E2KSA4HUV2DBSn9cSV08JMICAT4jewwPXzwjKKJsXqiZnxlWucPV4OOWXKvmYJ6
 vkiuc79ziqvtjZCUQ12u7c3a/JW4qVUqpOFZriU86b6eC5e6blaa97dk96g0IBB0o3a5
 8b3KMizIOo2GBvukApMwH6GYOFvx1rvGTdm3kE3YZ7LTBRvEEaD2OGk4UwxU6wWIThCk
 pgnw==
X-Gm-Message-State: AOAM533qmft+miJKMEnFPi6kxT/xQeitlBof0Z76lr//Pq9KEDnZ4QNQ
 7FLqKjYrbc1NPnRxMOQHIGTf3+epX3/Sf7OyRG95HQ==
X-Google-Smtp-Source: ABdhPJwDvoRFJ0H4kYZv8n0cS8wPzrUFZKpcn3CBoM3Z2/WI9Fmk0xUhE3xQsl6wsPHaNqcgdBPdfXonHopDsj4LEJ0=
X-Received: by 2002:a17:907:9690:b0:6f3:bf14:4c68 with SMTP id
 hd16-20020a170907969000b006f3bf144c68mr1366366ejc.584.1651271540776; Fri, 29
 Apr 2022 15:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <d9c3fed4-de6a-2cd8-acb6-7f3d2ad46b70@linux.intel.com>
In-Reply-To: <d9c3fed4-de6a-2cd8-acb6-7f3d2ad46b70@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 29 Apr 2022 15:32:09 -0700
Message-ID: <CAOReqxg9Y0_S5jqati4O+GT0C_yR7agBZYK79O996MQAk3HmDQ@mail.gmail.com>
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

On Fri, Apr 29, 2022 at 2:55 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> Hi,
> In the existing ASoC code, there is a fixed mapping between ASoC card and=
 component. A component relies on a ->card pointer that is set during the p=
robe. A component cannot be used by or "bound to" more than one card [1]
>
> This has interesting impacts on how a codec or DSP driver need to be impl=
emented.
>
> In the AVS series posted this week, multiple components are registered by=
 the DSP driver, following an interface-based split. There's in addition a =
second-level split, where the logic is pushed further: the DSP driver parti=
tions the SSP DAIs in different set of 'dai_driver's used by different comp=
onents, which are in turn used by different cards. What is done in these pa=
tches is not wrong, and is probably the only solution to support a real-wor=
ld platform with the existing ASoC code, but are the framework assumptions =
correct? In this example, the board-level information on which interface is=
 used for what functionality trickles down to the lowest level of the DSP d=
river implementation.
>
> I believe this breaks to some extent the 'clean' split between platform a=
nd machine driver(s), and it's not quite aligned with the usual notion of r=
egister/probe used across frameworks, be it for drivers/clocks/you name it.
>
> A similar case could happen in a codec driver, if independent functionali=
ty such as headset and amplifier support was exposed by separate cards, tha=
t would in turn mandate that the codec driver exposed N components, each ha=
ndling different functionality but the same type of DAI.
>
> An alternative approach would be that the DSP driver exposes all the poss=
ible DAIs that can be used, and the binding is refined to allow for more fl=
exibility. I think it's really the individual DAI that cannot be used by mo=
re than one card.

Would it also be logical to expose the DAIs on the codecs
independently or should this be validated on a case by case basis?

>
> I figured I would ask on this mailing list if
>
> a) I am not mistaken on the component/card relationship and
>

Just trying to think of a reason why this would not be true. Are we
aware of platforms that have configuration relationships across DAIs?
E.g. they use a single clock and must be configured together, so
splitting them might cause them to be in sync? Otherwise I agree, if
DAIs can be handled independently then I don't see why we should tie
them together.

Curtis

> b) if this is by design, or if we want to clarify what a component is and=
 what its restrictions might be.
>
> Thanks for your feedback/comments
> -Pierre
>
> [1] https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-core.c#L=
1364
