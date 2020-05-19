Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D4C1DA290
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 22:26:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E19C179C;
	Tue, 19 May 2020 22:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E19C179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589919982;
	bh=w5U5QGt61xoJg8jCc3MxJOl5qGiknIKpadYVDYRoXPY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wny0VRHPZeo82hL8lkREhWQRdmJb/09dmD3YZj5wPYe+y1yTcWUuiCWq+Qq/oU9gu
	 owL3LgvlPwhvweV5I8KulVJbZI5PZ1/oPJN3zEOLJOwo/6bWOmj42r6RGqR1CBCbP5
	 jTFdZI4EfI5ThKh3Nv2iThI6c9VilK1AiUrgdh6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04DDEF801F8;
	Tue, 19 May 2020 22:24:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68178F801A3; Tue, 19 May 2020 22:24:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1937EF80132
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 22:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1937EF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com
 header.i=@gateworks-com.20150623.gappssmtp.com header.b="QWQb9PkJ"
Received: by mail-oi1-x243.google.com with SMTP id s198so935762oie.6
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4Iv5P+0vDwbQQRwqaOMs725j9mg9QZsfySmGi7egyrg=;
 b=QWQb9PkJSafkzfItqgE3TBzXUTJzyhHSAbdosSId/wGtxPyLR466jVltMKaumvbMlz
 f0bXen7ndP1pjVHH+7UgrQGW5yvIWt1aoJLwYS5LKsDM0iotPQSh6AD9ZYDLTqqtksZK
 eHgzeHnqgCtpthsfr5dhMq5Zg4wWjk5+ebqmxaVZaRPA7VVJ2X5SMsWpmnjfl1LOptdr
 kj7KyjARI8ys06b3DSpaDb1sJAycs4168igTr3H0vXlBPxaYGxTG8GBqcp1u7gTfer1H
 hytMPzOiUsn9UyDWOONKlWeFPeteGAIVyHRPTKM+b3S1856q5XvmnQMkRYBFln3L6/LD
 r2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4Iv5P+0vDwbQQRwqaOMs725j9mg9QZsfySmGi7egyrg=;
 b=JIKFNJBtKxGWztV/ukLWxUwAYjW5bkd5JGf8ZvZyjAY5sQG6c/mFTcX4cUJ7rycomh
 1/gmVPQ4nrU9ZeF+XCHi4Ekc1DPy/S6M/U4jYTb81KMMHYXQif+MAIfNoIRJO2Lok1+j
 NUS5AqkQZ0ePKgOJd/IMcvFwJ9Kc9Wb2cShgVbi4fdyviQVlkk+fhrmDyVaJcomQFnSD
 CkcY2nUGIpmEU2p+M+4Nz122uLthvoZxFMKWTG8Nl0eTbbRYIQ6jea3fvimxC1h8+iit
 W5gccs229g3vVsS6CugaZeZ4rq/LFypkCLm7tBEVl0DnCrVz/q/KbR5IDEiaxDuTErGJ
 M1og==
X-Gm-Message-State: AOAM532e2pVS5/qn/8bt22N2m1FEMD9FvDLPcpwl/YwzDNogfYifof/t
 JPP2FPaE9m+eUmoo2He/N0uf5NWRg975STh0+bwDIQ==
X-Google-Smtp-Source: ABdhPJzRHCnnnSAe66+mzDR9kG6hWhL10cgy/XR1E3KD563FAISGom/hUZpQQ514wb/BlFfyllYSgVbqfDXzNeOtFNo=
X-Received: by 2002:aca:e1d6:: with SMTP id y205mr936736oig.142.1589919866336; 
 Tue, 19 May 2020 13:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU3ekA76nXE7UV+kxA1DtbSMiRCnhTOy6RwixOrj1AoJug@mail.gmail.com>
 <AM6PR04MB4966BF44BCECB83835CA0A4F80B80@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <83ca04ea-8c5a-6738-e2e1-bb3632a61eff@nxp.com>
In-Reply-To: <83ca04ea-8c5a-6738-e2e1-bb3632a61eff@nxp.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 19 May 2020 13:24:14 -0700
Message-ID: <CAJ+vNU3i_3Fs0MNX3k_PTHuJt2r5S9Ro6UeEtN9acHoWxg-iFg@mail.gmail.com>
Subject: Re: imx8mm fsl_sai clock config failing
To: Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Anson Huang <anson.huang@nxp.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Abel Vesa <abel.vesa@nxp.com>
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

On Mon, May 18, 2020 at 7:48 AM Daniel Baluta <daniel.baluta@nxp.com> wrote=
:
>
> Hi Tim,
>
> <snip>
>

Daniel,

Thanks for the reply!

>
> >> I'm trying to get imx8mm sai working with a tlv320aic3x codec on a new=
 board
> >> and am finding that the sai3 bus clock is getting derived from the wro=
ng source
> >> leading hw_params() to fail with 'fsl-sai
> >> 30030000.sai: failed to derive required Tx rate: 3072000'
> >>
> >> In comparison to the imx8mm-evk I find it's clock gets configured as d=
esired yet
> >> I have the same device-tree configuration for sai3.
>
> It is strange that setting sai3 works with wolfson codec but not yours.
>
> It should either work for both or for none.

Well... it doesn't 'work' for the imx8mm-evk wm8524-audio as it hangs
during playback (see below) yet it does get past negotiating the sai
master clock.

>
> Anyhow, can you please try to create a more specific clock hierarchy
>
> similar with the on for 8mq (see imx8mq-evk.dts).
>
>
> &sai2 {
> =C2=BB       pinctrl-names =3D "default";
> =C2=BB       pinctrl-0 =3D <&pinctrl_sai2>;
> =C2=BB       assigned-clocks =3D <&clk IMX8MQ_AUDIO_PLL1_BYPASS>, <&clk
> IMX8MQ_CLK_SAI2>;
> =C2=BB       assigned-clock-parents =3D <&clk IMX8MQ_AUDIO_PLL1>, <&clk
> IMX8MQ_AUDIO_PLL1_OUT>;
> =C2=BB       assigned-clock-rates =3D <0>, <24576000>;
> =C2=BB       status =3D "okay";
> };
> Note that even though the imx8mm-evk appears to configure its clock
> correctly I
>
> >> still have not been able to play audio out the wm8524 and the system a=
ppears
> >> to hang during playback as if BCLK/MCLK were not clocking.
> >>
> >> Perhaps there is something not supported yet upstream with regards to
> >> IMX8MM SAI?
> >>
> >
>
> I remember that wm8524 worked for me both with imx8mm/imx8mq. Can you syn=
c
>
> at commit
>
>
> commit 13f3b9fdef6c7d9ad069ae617707e5a10a685074
> Author: Daniel Baluta <daniel.baluta@nxp.com>
> Date:   Tue Jun 4 20:32:57 2019 +0800
>
> and give it a try.

looks like fsl-sai isn't supported yet in
13f3b9fdef6c7d9ad069ae617707e5a10a685074... used
a860fac420971c5a90d4f78959b44ead793aee4f instead which has the sai
driver but fails with:

[    2.579234] wm8524-codec audio-codec: simple-card: set_sysclk error
[    2.585512] asoc-simple-card sound-wm8524: ASoC: failed to init
30030000.sai-wm8524-hifi: -22
[    2.594050] asoc-simple-card sound-wm8524: ASoC: failed to
instantiate card -22
[    2.601467] asoc_simple_probe err:-22
[    2.605161] asoc-simple-card: probe of sound-wm8524 failed with error -2=
2

Can you please sync up with mainline and take a look?

>
>
> Also, what SDMA firmware are you using? That might be a problem. I don't
> remember
>
> if the default ROM firmware worked.
>

I've tried the default as well as that from
https://www.nxp.com/lgfiles/NMG/MAD/YOCTO/firmware-imx-8.0.bin which
shows as firmware 4.4:

# dmesg | grep imx-sdma
[    2.037854] imx-sdma 302c0000.dma-controller: loaded firmware 4.4
[    2.042705] imx-sdma 302b0000.dma-controller: loaded firmware 4.4
[    2.049132] imx-sdma 30bd0000.dma-controller: loaded firmware 4.4

I ended up working around this on my board by making the tlv320aic3x
the master. I do recall reading someplace that using the codec as the
master is a better choice anyway as it provides better clk per
sample-rate matching... is this true? I'm not clear which option to
pick in general.

So in summary I have my imx8mm board working using codec as master but
imx8mm-evk in mainline does not work currently, at least 5.7-rc4 which
is what I tested.

Thanks,

Tim
