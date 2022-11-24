Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B40B639470
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:10:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B00E1862;
	Sat, 26 Nov 2022 09:09:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B00E1862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450217;
	bh=juyso/HpoYSWkLmKLmGTH4pUybPN5U49mx40hL898E4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vaoDeCJaPCC9ZFIyLqYNNvJZVarMRI3dVxaD5MkcVGlZMk0X9hfJzF7Xi6rp+wbX5
	 RqYgwoNUeqHYQhrOSB1MYosdety1gAf7snnTQqqGGbN4Gaflbm3tmUHz5/h5anFxw7
	 3oTkj8ovPbYGssz3DFj/ZhCGOLFXKUKkHepufBJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D71CF8063B;
	Sat, 26 Nov 2022 08:59:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 240D9F80431; Thu, 24 Nov 2022 14:54:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, SPF_HELO_NONE, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED, 
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0FACF80115
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 14:54:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0FACF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iHQdDPV0"
Received: by mail-yb1-xb2c.google.com with SMTP id 1so1880151ybl.7
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 05:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d19VZe73RsPQWbRMrRH216S4FHkhXapc6P3i52jmtAc=;
 b=iHQdDPV0ac4BN0lr3UIcdo0l9o8IvC/T2aKWTM3N//are1c4pniWRMI9Wq7uw6zp35
 irIz6Dzc+GGvWaUfq63UjjORdGQMOPbPvKsIBzQXhokJiz7rA9TLFYovwQh2ZvYN6cFz
 7wYilt3BDqwAQn0wfaBdOGxLeI1vYWC/g8awjJgO1jaHNVtaZ9iiUNL8GHloaCxl7EMO
 zAu9uDM0LZfTkBSoKPOiI+tzfrH77UwF0n8b2JYeupK3X/ULL7TkvPtylxXSuaj8Zq5S
 bLlFJaQoXVctBwxN5UcG1t/Pnjtyj5GUv7fj8Z11a2xiM1qhukgu2smV3qeOQEWbw5QS
 ltLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d19VZe73RsPQWbRMrRH216S4FHkhXapc6P3i52jmtAc=;
 b=M88pQ0FUkwtBFCKcjgRazpAJ7Dd3c5L6A7/pK0PRaMIyPmS8H8DOOlZLQEStA/8Xk5
 1NXv8DiJjNRPDSVDMzqV7lQzEcktHznZh0FhAGV5/uP6ssY5sz0E+X56nK0l9ZCNWlvi
 GGossmhSah+30EmYLGoV9NFDx/gbiu0Gv8KrL259cHHJ3YyOiV5mzxptmX5DyKiNwbXJ
 GMUo50WWm4XFlF/K4hhJYQSSSVR0xxaKqsxheo9cZ7L2rHP5daptUMOG6Dfvt8WOqB7P
 /dlZ9tZpJ8Wc/OWDQF6vWZhw4tpZ1iCJ+SvIjAHTmR2oai6TNeaX0ZXpWMXfyYdctTcV
 hFbw==
X-Gm-Message-State: ANoB5pneiwtpGy681hS4AFIYRvxmXoloieiJgN73T6EVPwtvHoED0GWT
 7FepaitbF5oNA5GrwGkZKdcldykbiD4acttnizY=
X-Google-Smtp-Source: AA0mqf5IrmZnahNNIPS3/hpEG3PMIsp17Y7diXsqE373VqHNhMRguSHtQK56lGixA59/Fp9Gj76W5OPPLgNBPQ+WnpI=
X-Received: by 2002:a05:6902:192:b0:6ef:3e1d:9054 with SMTP id
 t18-20020a056902019200b006ef3e1d9054mr9549191ybh.48.1669298066226; Thu, 24
 Nov 2022 05:54:26 -0800 (PST)
MIME-Version: 1.0
References: <CABDcavYdsk-O4x3oPX4i4+T5wsoZV26_kpEq6JvpD8A_cAGHxg@mail.gmail.com>
 <20221124111336.GE105268@ediswmail.ad.cirrus.com>
In-Reply-To: <20221124111336.GE105268@ediswmail.ad.cirrus.com>
From: Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>
Date: Thu, 24 Nov 2022 14:54:15 +0100
Message-ID: <CABDcavbRryENG58LO7+gbJeKbBBPP1uG1Xc00yXUBNzspWpWoA@mail.gmail.com>
Subject: Re: SOC_DOUBLE_R_SX_TLV controls broken in cs24l51 driver
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:51 +0100
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 James Schulman <james.schulman@cirrus.com>,
 =?UTF-8?Q?Tan_Nay=C4=B1r?= <tannayir@gmail.com>
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

El jue, 24 nov 2022 a las 12:13, Charles Keepax
(<ckeepax@opensource.cirrus.com>) escribi=C3=B3:
>
> On Thu, Nov 24, 2022 at 10:57:34AM +0100, Guillermo Rodriguez Garcia wrot=
e:
> > Hi all,
> >
> > I am using a dev board with a Cirrus Logic cs24l51 codec.
> >
> > This used to work fine prior to kernel version 5.x, however after 5.x
> > it is not possible to set certain values for ALSA controls from
> > userspace.
> >
> > I believe this is related to the input validation that is mentioned in
> > this thread: https://lore.kernel.org/all/Yph8C3bRxcr6ogW7@sirena.org.uk=
/T/,
> > and possibly in this commit: 4f1e50d6a9cf9c1b8c859d449b5031cacfa8404e
> > ("ASoC: ops: Reject out of bounds values in snd_soc_put_volsw_sx()")
> >
> > For the cs24l51, all the controls that fail are using the
> > SOC_DOUBLE_R_SX_TLV macro.
> >
> > I have traced this to the checks in snd_soc_put_volsw_sx, specifically
> > the (val > max - min) check:
> >
>
> Can you try these two patches:
>
> https://lore.kernel.org/all/165236477046.1016627.15470197691244479154.b4-=
ty@kernel.org/

Thanks.
In my tests, these patches seem to fix the problem for some values,
but not for all of them:

$ amixer cset name=3D'Analog Playback Volume' '208','208'
numid=3D3,iface=3DMIXER,name=3D'Analog Playback Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D228,step=3D0
  : values=3D208,208
  | dBscale-min=3D-102.00dB,step=3D0.50dB,mute=3D0

$ amixer cset name=3D'Analog Playback Volume' '180','180'
amixer: Control default element write error: Invalid argument

Looking at the code I'd say that patch 1/2 is correct however I have
doubts about patch 2/2:

        val_mask =3D mask << rshift;
        val2 =3D (ucontrol->value.integer.value[1] + min) & mask;
+
+       if (mc->platform_max && val2 > mc->platform_max)
+           return -EINVAL;
+       if (val2 > max)
+           return -EINVAL;
+
        val2 =3D val2 << rshift;

        err =3D snd_soc_component_update_bits(component, reg2, val_mask,

The checks for max and platform_max are done on val2, but val2 is
already the result of adding the minimum value ('min') and applying
the mask.
Shouldn't the checks be done on ucontrol->value.integer.value[1] instead?

Thanks,

Guillermo Rodriguez Garcia
guille.rodriguez@gmail.com
