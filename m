Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEDA314B45
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 10:18:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1223E16B4;
	Tue,  9 Feb 2021 10:17:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1223E16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612862289;
	bh=F5fQl8HlAKlBRIChzr13jso3dj0Ver6EA7Zj+996Er0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uQ3GS2y2V2rKVaMCeLEGN6wKG3U5bgXdIVgPF0DDW6gdSf9gBmh4mH4/mEOar2xWh
	 SfV0E3Qy7Sbmn5oJAnsjTgRQhQt/7ARFnBeN4NwmsXUUVb0ED4bqA8VW1e9D/qzsi/
	 1jWSYNyp1/R9gH+/YjdvrLwmuBtMSTVpo6eJ+sH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16F74F801EB;
	Tue,  9 Feb 2021 10:16:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FE1CF801D5; Tue,  9 Feb 2021 10:16:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BCA4F80165
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 10:16:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BCA4F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tnKURcRD"
Received: by mail-qt1-x829.google.com with SMTP id n28so5451862qtv.12
 for <alsa-devel@alsa-project.org>; Tue, 09 Feb 2021 01:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UCCWDHu0sYSquKe4LwEXk0kUehGPBZCaQ+gPrhz2B70=;
 b=tnKURcRDMsX6KiDYyAtN3ScVm4Xp3sVDTWZQKtuJnUh3KGUrksRRRmet2qx+mEjT1Y
 Zgpj6m0XBE1jPTA/ISmoEhBqNEGLjcjfrYz9RYjjbdW1bOVkR8WJUvBwwXuH2XYBv1Ot
 cD4e4JVB5h00iD4b8COz3OM4fX1NmMfXTeFPG7F64PuyWj/VNJT579c9TP9OZ/sKetnY
 UL4jEkoesboHATyk8jB+ZuwLqHUgiBemu1v9dn8CLnNNA6GLG13X+YYI3Qmf480tNcTW
 e1CuEtTNIEXMrXK6Z911F09dY/V4GuXNrk8TlhuoseP0TL/3s0Jy+jXl4EcYNLKnK06X
 dHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UCCWDHu0sYSquKe4LwEXk0kUehGPBZCaQ+gPrhz2B70=;
 b=KSM8oIZTerFBsm6U/4LVaXoBRyXK/tY2So59MYhzJlh3mh13MYcA9dkfKlvZBFW9Bj
 SRFoTcWkYUJvVArPD6xsQcM3YI7LQvtHYATTHBAWAw+5w4dAX8O+93w2wMiwif0zei4H
 ydlohgJscfSOPwu9DrtwS9/d7VPU+7ooS5wkpWvVzicqw7YOvJTgQn5gDMlfAIdHUX1r
 7+QRNNWVVEtsn/DG3PczFYNAaDtzESoRB7J34dJPw3X02tXPbfre/9czoMaB4Af+tXdx
 mj8nELKKCuPoMMhmWRYCi99gwmXbgdb/EuxSBa/yxnQvRpvP7npI0a1MXrB1OoOcVmOU
 SnMQ==
X-Gm-Message-State: AOAM5305w7IzV/POVKCgDvrgxTNLsfomDsxMPbu/QMd6LmA0J8KJXqEg
 pEvz/gXUkAPtIMIjXitYpFWk6VP+bgognfMQDAg=
X-Google-Smtp-Source: ABdhPJxk7JApErbcYd9iIq2ywHmycgjkc6ZN9v2FM3gZNbGEGB6G4khg1FgLHMytyhFDNZEL3y9l+4+oq0VpDadZElI=
X-Received: by 2002:ac8:4e8b:: with SMTP id 11mr18524155qtp.292.1612862187116; 
 Tue, 09 Feb 2021 01:16:27 -0800 (PST)
MIME-Version: 1.0
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-3-git-send-email-shengjiu.wang@nxp.com>
 <20210208115112.GD8645@sirena.org.uk>
In-Reply-To: <20210208115112.GD8645@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 9 Feb 2021 17:16:16 +0800
Message-ID: <CAA+D8AMRGRRk6FzdiqaHAP1=dPJngNgmdGmU59vrroXA9BMyXw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] ASoC: fsl_rpmsg: Add CPU DAI driver for audio base
 on rpmsg
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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

On Mon, Feb 8, 2021 at 7:53 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Sun, Feb 07, 2021 at 06:23:50PM +0800, Shengjiu Wang wrote:
>
> > +static int fsl_rpmsg_hw_params(struct snd_pcm_substream *substream,
> > +                            struct snd_pcm_hw_params *params,
> > +                            struct snd_soc_dai *dai)
> > +{
>
> ...
>
> > +     ret = clk_prepare_enable(rpmsg->mclk);
> > +     if (ret)
> > +             dev_err(dai->dev, "failed to enable mclk: %d\n", ret);
> > +
> > +     return ret;
> > +}
> > +
> > +static int fsl_rpmsg_hw_free(struct snd_pcm_substream *substream,
> > +                          struct snd_soc_dai *dai)
> > +{
> > +     struct fsl_rpmsg *rpmsg = snd_soc_dai_get_drvdata(dai);
> > +
> > +     clk_disable_unprepare(rpmsg->mclk);
>
> hw_params() can be called multiple times and there's no need for it to
> be balanced with hw_free(), I'd move this to a different callback (DAPM
> should work well).

Which callback should I use? Is there an example?

best regards
wang shengjiu
