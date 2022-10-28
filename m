Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD41A611219
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 15:01:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CE8D1FE1;
	Fri, 28 Oct 2022 15:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CE8D1FE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666962064;
	bh=Ao9hO7r3VhpSn+p6rupTjMFGHnukQuwp09Y8dtYrSZM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vf2pAi95tY+P20eGUm/PGZD4LBWhGYQHF1i3kKYRlwCITbWAODOMhhGQgJxSpHVUw
	 WKFS7CieidWE7ZUQ7eASQgLG5aqxScHCcHYyvGDFqIv/iqXyR9BCyXM3PZMB5JIiwS
	 tdN+UQAH6pkW8nJW0g0FjlTJ+IKYFod5WOKGEWIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6285F804BD;
	Fri, 28 Oct 2022 15:00:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BEC9F8025A; Fri, 28 Oct 2022 15:00:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2ADBF80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 15:00:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2ADBF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="suju3c6R"
Received: by mail-yb1-xb2a.google.com with SMTP id t186so6002225yba.12
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 06:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e0j5a5iZpNQG2DdryJGScbsirrQGx4kQi1zIOe47cxY=;
 b=suju3c6Rt3GNQfsmDz9TEYyaxosQcCrMgZlU+pCUZkhi9SwG4iwP+SSe+45yLvOQ8U
 RyDc0NI0O0DKLdtrP4SJuISxk0qmOtx0LDwHMQVJJa5X32FTRxZBwxgBAjD6BZ+a+33H
 DkZanVr5g7acshGVfjCCUlEdJQbkEUNTSxJuenN2a4RDfDlQFiNt91ITGe/4cvng/VgR
 ZT1OFBiWaowmlDfJqy9b+Us6JeiG4uZ9sSkiBEYHHlrIG2jKGgOZZLz7ZbS0wBP5kWfk
 Z10gGAKySzTtx8qKpA+zReQbdTfRGivnmdcBc7hHU/MzeHL0//wrUql+0DjaW/H3HRQA
 RkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e0j5a5iZpNQG2DdryJGScbsirrQGx4kQi1zIOe47cxY=;
 b=VjqGAhomXGz+tkSdO8Ff//WbJxnVAxhmDYvo3ljN1WifcMeuNyS3e7bcPOtoe7+dTD
 r+72cczErMbasJ9d+qjLvC9CUcnJUNXiczDIg1YZnxSq3EA0jlF1P7MThAZpsZpi61L2
 yc5nDwZXvVnqduD2HXmizixGjXbhWkZr2Y2bgfk2SI40NbEo4Q2+c1Mzxohwe5bBdAUu
 OIlCCFIozqoCm4xnUYTpYXEXiDtznG3lJLNroA3enKfARPOrU9JOD8Z/q5wgEFrTGy1j
 kO3R6N8gsoNsm2r7HQMnnhuw7Tv0U7R/oIGDwooiRUfrnPlazXSW1eF9EtzRZwa3zQod
 1S4A==
X-Gm-Message-State: ACrzQf2DYAfOpIo8nPfFHg/EilrG1dvVDnVZvYRVpB9opC47tm/0V5Jy
 1hS+JHWoOzE5COamCBUx0xf9Smbxrd1q57A5uOj3vQ==
X-Google-Smtp-Source: AMsMyM5yjFHMIfBdC0dH8EX4MhS+aaPemWVhJjUiNK2UCVeMOmyfOGcs/y8XSPc4MzOkCpK8GttTuXPSmeSaypSU1l0=
X-Received: by 2002:a25:bc3:0:b0:6ca:6427:f00d with SMTP id
 186-20020a250bc3000000b006ca6427f00dmr33872090ybl.62.1666962000888; Fri, 28
 Oct 2022 06:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221028102450.1161382-1-ajye_huang@compal.corp-partner.google.com>
 <20221028102450.1161382-3-ajye_huang@compal.corp-partner.google.com>
 <Y1vDxtdNGURAT850@sirena.org.uk>
In-Reply-To: <Y1vDxtdNGURAT850@sirena.org.uk>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Fri, 28 Oct 2022 20:59:54 +0800
Message-ID: <CALprXBbTkj0Q_-3AL81Q1okRD5ZyDf_c=daPrkQstkM4_CNgGQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: dmic: Add optional dmic selection
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: robh@kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, devicetree@vger.kernel.org,
 angelogioacchino.delregno@collabora.corp-partner.google.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
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

Hi Mark Brown,

Thank you for review,
I think it is appropriate to implement on audio machine side, like
this I did before,
commit 3cfbf07c6d27
("ASoC: qcom: sc7180: Modify machine driver for 2mic")

What is your suggestion?  Thank you.

On Fri, Oct 28, 2022 at 7:58 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Oct 28, 2022 at 06:24:50PM +0800, Ajye Huang wrote:
>
> > +     dmic->dmic_sel = devm_gpiod_get_optional(component->dev,
> > +                                             "dmic_sel", GPIOD_OUT_LOW);
> > +     if (IS_ERR(dmic->dmic_sel))
> > +             return PTR_ERR(dmic->dmic_sel);
> > +
> >       snd_soc_component_set_drvdata(component, dmic);
> >
> >       return 0;
> > @@ -125,10 +172,15 @@ static const struct snd_soc_dapm_widget dmic_dapm_widgets[] = {
> >                              SND_SOC_NOPM, 0, 0, dmic_aif_event,
> >                              SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
> >       SND_SOC_DAPM_INPUT("DMic"),
> > +     SND_SOC_DAPM_MIC("DMIC", NULL),
> > +     SND_SOC_DAPM_MUX("Dmic Mux", SND_SOC_NOPM, 0, 0, &dmic_mux_control),
>
> If we are doing this then adding the mux needs to be conditional on
> having the GPIO, without the GPIO the control is at best confusing to
> users.
