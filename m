Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A86832DFD0
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 03:57:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E102E17DF;
	Fri,  5 Mar 2021 03:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E102E17DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614913044;
	bh=SF1d1LQVQ15cubPxSQU9kTKuW7qj7bpgxNc+jecwvfc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YQkwPRuenxyXbcrbv5tiVlrUw8RTyOlqKDGV6+gj/R7Fp4Fih7ZNrHYayksl0VdMD
	 8XlBlH5Yghb0OKUPrOO1QFgrfKJvmJJltZ+IfNNfCzzcK4xlryT3hIsX7pwG8dSLlN
	 8BFKD1aBadbQXI4XmMKVLL13eV4UHnJ/QuZ3vFXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 394C2F800ED;
	Fri,  5 Mar 2021 03:55:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4953BF8025E; Fri,  5 Mar 2021 03:55:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFF65F800ED
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 03:55:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFF65F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LVLoAGKO"
Received: by mail-qk1-x72d.google.com with SMTP id n79so681929qke.3
 for <alsa-devel@alsa-project.org>; Thu, 04 Mar 2021 18:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B6K7R4Bd/k7pKUFwYYEqKbrQpzoj3M/+hPbpG9mugKo=;
 b=LVLoAGKOykm/jC9af7pN4kyhfFsAcpvm9VLGQ0CXg0Se/SR35Oao/hkwdMYuxntVC7
 J8PVTeW0iWrkuoJKaUfkJjFMyKNvIPNeP4toVjX1ZIFubifotU2p+sArdZJWyEnqPH75
 Y9aUcSuSflX0iOPbsFK769CWeZ7IC98sOu0IPwL3onUjFtgic42u1FpwAONNbuEifkTD
 30fd4+jhh3OvFhY6949/pvO0jes6AfNqJoyTQzov/lvXL4NYk8jkujPxpxY5nyGz3fPT
 LWkSuVWVkzTK+K2qNZOSVrOTr3P/MkvZI7UxiEM/FXLkgD9AHSXBbGIolCXSlxMAhqwi
 OUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B6K7R4Bd/k7pKUFwYYEqKbrQpzoj3M/+hPbpG9mugKo=;
 b=piX3Db+RxT8b4UF8ZkfgGBq/RUKjU5yA2Albj0PtsCwvyV7HkhRylSDqFxJezbU6bb
 YMU2upIiX9IRxM9X0jNn3yH/NyEZrQJXmD2QvND37bUoBIn3ONPJcC7cJdTdzs46rzi6
 WjoZVfGHj02i7N73L9eMg9cDDvEbb+nVuXOD1UCbJo708WR+Ul2xln7ORIz7iX/c7eRZ
 KH/tZoIt5hddRbmL2cJZoMdTonBA2ZZGZyQZBbfnCnaLwMb4VT9elm7VBle+nANT9LMj
 V73jfS7SEbrtSs1UqQk8GJmzdpV9dVfI3BQQo0LDKHzanyqUayhhr7gAmdEYn6JD4LU4
 ZgWQ==
X-Gm-Message-State: AOAM532WDQ+XhXZk0VsIdAwZg9hA+n9YGFGaZTvdoVvIpnDe3QBZ6rcT
 Y6foEctCgkQRkXWO5UhnSOvDCX2hSAiIk2WptIk=
X-Google-Smtp-Source: ABdhPJxRI1kuyUugmvglxFPMew6mIeAnrVcTj55/x338nxC4x/s5QaheI/U88N1H58YRzxifmLj0W6Tq5BJQQdJ62Go=
X-Received: by 2002:a37:a282:: with SMTP id l124mr7167285qke.37.1614912936574; 
 Thu, 04 Mar 2021 18:55:36 -0800 (PST)
MIME-Version: 1.0
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-8-git-send-email-shengjiu.wang@nxp.com>
 <20210210221704.GA2894134@robh.at.kernel.org>
 <CAA+D8ANOv91jr4381Acz1B2mZ6=Mx2J_2CMTGXmPKztv7bMjPA@mail.gmail.com>
 <CAL_JsqK1uc82hfdE4yj0ye-D6vygiqWkDVW96NOb-8kEFVqHMg@mail.gmail.com>
In-Reply-To: <CAL_JsqK1uc82hfdE4yj0ye-D6vygiqWkDVW96NOb-8kEFVqHMg@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 5 Mar 2021 10:55:25 +0800
Message-ID: <CAA+D8AOP9L7eNHFMYrTscz0tPKMqU8Y0H5BtqyURmduhHgvGtw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] ASoC: dt-bindings: imx-rpmsg: Add binding doc for
 rpmsg machine driver
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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

Hi

On Fri, Mar 5, 2021 at 4:05 AM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Feb 18, 2021 at 1:23 AM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
> >
> > On Thu, Feb 11, 2021 at 6:18 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Sun, Feb 07, 2021 at 06:23:55PM +0800, Shengjiu Wang wrote:
> > > > Imx-rpmsg is a new added machine driver for supporting audio on Cortex-M
> > > > core. The Cortex-M core will control the audio interface, DMA and audio
> > > > codec, setup the pipeline, the audio driver on Cortex-A core side is just
> > > > to communitcate with M core, it is a virtual sound card and don't touch
> > > > the hardware.
> > >
> > > I don't understand why there are 2 nodes for this other than you happen
> > > to want to split this into 2 Linux drivers. It's 1 h/w thing.
> >
> > This one is for the sound card machine driver.  Another one is
> > for the sound card cpu dai driver. so there are 2 nodes.
>
> You are explaining this to me in terms of drivers. Explain it in terms
> of h/w blocks.
>

Yes, there is only 1 h/w block, which is (MU) message unit

As the sound card needs a cpu dai node and sound card node,
so from the driver's perspective, I use two nodes.

Seems It is hard to only use one node for my case.
or do you have any suggestions?

Best regards
Wang shengjiu
