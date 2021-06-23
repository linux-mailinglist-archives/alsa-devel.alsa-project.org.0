Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 030143B1C8A
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 16:31:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69A871661;
	Wed, 23 Jun 2021 16:30:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69A871661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624458680;
	bh=nTVwHd8+wtNWvTGrhHg9d3A+6E/+x5h/DZQL1ZDWCqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vCjyzjDdjRK2Lm6jw0KCG3H7QvxR8mq/7yDR7qKr49XK9kdSdlR+XIKVuypExWVv3
	 F4sn1CMhGvxduxkhYM+RPDeZZIRFR/uzY+0IaNPEtgQ3RXWN7fphgNDxy8GFnT85x6
	 Yrc95adGlURJtxUvG56xXxYh17E8gG6KHBULex8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B37F0F801D5;
	Wed, 23 Jun 2021 16:29:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9045AF8016D; Wed, 23 Jun 2021 16:29:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DD59F800E1
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 16:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DD59F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="GoIaYqmV"
Received: by mail-ed1-x533.google.com with SMTP id h17so3737205edw.11
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 07:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NwEPWicXEScGAJ5xVFnITtqbN5ZVd/S2/99HIs4jcak=;
 b=GoIaYqmVekjEn37Cxpn5CKQXmVjMm4MFdz0pM0djdApdRBwJI7kswcPMRRvBpFGk5y
 0QkqmWQIFyIwvnyUDc1DYzBBDZtvYKkRk5iV9mPFUqO7Ud2Uf2BcgCfl5he7C4xyxYvd
 RJRtTIR5NQ4rffFIL2UHo/soK2fIyb6S25Wno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NwEPWicXEScGAJ5xVFnITtqbN5ZVd/S2/99HIs4jcak=;
 b=B6wpUBxRznPJjqcXJrrgmwb3G5GeQpVhNztR/uZV5uJ930MKx62ASapJmRkf8LgMIq
 h6qtlBaBvzE8uiEilRvG6VlQ8JGKttMTD2ZOcgt7iWznZil27IMZotXDVGlLzwB3XoIj
 OUoSOyhEuGlN43zDv2cDwyU5Be1K1JCXTThxHkARvzRKc8uKsQx2ufyzi2S/hbcLVwes
 tMTQxFpncZNgRXnAwHs8KAp/e9VcIUWfVec3EalnPAhfehSQhauxKyPJI+SjgP3qDPTN
 MrPucBRbuSGFTbw2lujJYU3T+fAiFquClKYsx7ow8PlVIwIyIOhLV1UIFSOBYvj319bs
 V3hQ==
X-Gm-Message-State: AOAM531H3s3iK1LJevnlqwcylwEWaYzMJ0xVukJgFcqc/vGiOr4PkiH/
 ZHCV2MBcv0z+MjzYzA/abW1Oz2wvUqzZHxpBramM/w==
X-Google-Smtp-Source: ABdhPJyeMsLNi/QXkqaDM0G+bcsAZpsb5ooggnwbRoIqJuWmxNuU8EYrYKhlFeoc/Wp1w0w5f+3LNTU6B6JSdunayAY=
X-Received: by 2002:a50:afe2:: with SMTP id h89mr13086751edd.308.1624458567386; 
 Wed, 23 Jun 2021 07:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210621074152.306362-1-judyhsiao@chromium.org>
 <20210621114546.GD4094@sirena.org.uk>
 <CAJXt+b-eRLKORqPOX1cJM3xzEyJhdeuj+w9-btpZSmy7v4U6Sw@mail.gmail.com>
 <20210622162307.GF4574@sirena.org.uk>
In-Reply-To: <20210622162307.GF4574@sirena.org.uk>
From: Judy Hsiao <judyhsiao@chromium.org>
Date: Wed, 23 Jun 2021 22:29:15 +0800
Message-ID: <CAJXt+b_15SEFW9ztg=CaYHfVJk-q+u46eLVgdPm+2ugjwajc1g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: snd-soc-dummy: add Device Tree support
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, Judy Hsiao <judyhsiao@google.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Dylan Reid <dgreid@chromium.org>, linux-arm-kernel@lists.infradead.org
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

On Wed, Jun 23, 2021 at 12:23 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jun 23, 2021 at 12:10:53AM +0800, Judy Hsiao wrote:
>
> > Thanks for your review comment.
> > This patch is used to support multi-channel where we want one codec to
> > control the only GPIO shared by 4 amps.
>
> So you've got 4 instances of the same CODEC?  Then I'd expect to see
> those all individually represented in DT.  Or if there's a single
> physical CODEC then I'm not sure what the dummies are for?
>
> > In snd_soc_runtime_calc_hw(), by creating dummy codecs that share a
> > DAI link with a real codec:
> >   1. The min/ max channel of  CPU DAI will be directly adopted.
> >   2. The formats and sample rates of the DAI link will be determined
> > by the real codec unless the real codec supports the rate
> >       and format that do not intersect with the rate and format of
> > snd-soc-dummy.
> > That is the reason why we don=E2=80=99t specify the format and sample r=
ates of
> > the dummy codec with the real codec determining the properties .
>
> It's not clear to me why you'd not just describe the actual CODECs here
> rather than using a dummy CODEC, the fact that the dummy CODEC is doing
> what you want is just an accident of the implementation rather than a
> description of the hardware.

Thanks for your inputs. Specifying four codes for the multi-channel works f=
ine.
We have not thought of specifying four codes before as we want to avoid loa=
ding
the codec driver multiple times, but actually loading the
snd-soc-dummy just has the
similar cost. By specifying four codes, the dtsi file describes the
real hardware schematic.
I will specify four codec in the dtsi file to support the four channel
use case and this
snd-soc-dummy patch is not needed. Thanks for the discussion!
