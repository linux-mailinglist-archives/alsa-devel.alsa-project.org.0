Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8727D29AD10
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 14:19:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20FDC1661;
	Tue, 27 Oct 2020 14:18:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20FDC1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603804749;
	bh=Dnuntczw33HgtPBUDJ3zYGIi3wkF3OjQCTKgNiFza50=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Snlw1DaxCC0xa2r320i+oDJ+RCwqr99sPVRqnjwBTpKa32BR8Clw4ta930eaoKxsC
	 gr9V1fw15Or447B//6XFT0sC6TyOtYBEIjrri1HJumJAQM0RJdEtAN5a0c53d/rg8N
	 sh4X4PEOiQDTRnuAGdWE/qz1eL6RCE5jjJB2LK2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A13BFF800FF;
	Tue, 27 Oct 2020 14:17:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65F3BF8020D; Tue, 27 Oct 2020 14:17:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5A3AF800FF
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 14:17:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5A3AF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vNh8er+j"
Received: by mail-qv1-xf43.google.com with SMTP id de3so599916qvb.5
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 06:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sv4MSsdbMGxld4Lj23VTm9RmQoViIo/kKrPn4dkU/IY=;
 b=vNh8er+jimshlHNWTbr4gxIBpMpES1VfHM5fklA4+DGxjGBfFZMTBNrnWvRMDNzEfr
 aQrfRcyA0YRlMkbE4iRd8LQFdeArBZ9l5u2mKk4ecgqvSfxudOFqI5447qbLTrmxWVxu
 MZUs1sCVwjcKM77K7xR3A3fPqScf/wNvsOraon9HEj4uf5+0pOLLY0avW/tdBmuAFGze
 2wXlIiRzczDBzOQoZN6yxBFuW/tl1JJMxJ0b5qMqVRTQISZPadZgZF7ZJVsxohgOlICP
 hviF2mSA6Kpe8+FB0P5K1y+aiD2cqurYZzRe5yMm+ivlwi3k21Y19tDzHoSm1qOlOYil
 eUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sv4MSsdbMGxld4Lj23VTm9RmQoViIo/kKrPn4dkU/IY=;
 b=L2g6ihipMT862OAKdb4Z6LO1DlWJqTKwLaPPzn0pEpS9YM7h3UalMghlUCMyk98gNB
 qz13ZWiKygn0q9OkvprLV2fS3Q/q1SCMWsMxK3TV17SFSCOQm/uFv1+V9UHG18QzTXQF
 SUiyGa0aY/0Kld7Z1hWOxevl+C/HwMjZM1s88q5x5OpGAeyWSqB/+e4n2gEeI8XSPyWe
 phw9+msBoRkCeB7C5mSlw2hCld6wdzluYIo+yX069il9AgH86EFylOxzrNb2BBy7t4iE
 PBuEQEAaog5r+2kC3ntDmZiVC5gJkFfvJCSavJ/OG8Ql62jmHAzxN++hshRCgqDd1sWb
 Ysmw==
X-Gm-Message-State: AOAM531tOiPswXH2ab1qIjPmxg5lpbs7iLleg6RLRv56mXEdMMgGdhYv
 sY8ZbfT0lfUYfSVDxMFieHE0zFPw6iQ6cRiHJ9E=
X-Google-Smtp-Source: ABdhPJw7WHxGGt0QI/QBYgwttvjYmNUbf+/rEv7bpW+TknJBJlrymRHrxafQb7NUmoIIP3EJGVRRlgEZT+IDAOuSO8A=
X-Received: by 2002:a0c:82c4:: with SMTP id i62mr2409110qva.28.1603804648818; 
 Tue, 27 Oct 2020 06:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <1603708855-2663-1-git-send-email-shengjiu.wang@nxp.com>
 <1603708855-2663-2-git-send-email-shengjiu.wang@nxp.com>
 <20201026133003.GD7402@sirena.org.uk>
In-Reply-To: <20201026133003.GD7402@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 27 Oct 2020 21:17:17 +0800
Message-ID: <CAA+D8AMtFh_ZCPrxNDcMmLx2Uqxh9cRX=dX8=tJXt=O72baY5Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_aud2htx: Add aud2htx module driver
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Mon, Oct 26, 2020 at 9:31 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Oct 26, 2020 at 06:40:55PM +0800, Shengjiu Wang wrote:
>
> > +static int fsl_aud2htx_hw_params(struct snd_pcm_substream *substream,
> > +                              struct snd_pcm_hw_params *params,
> > +                              struct snd_soc_dai *cpu_dai)
> > +{
> > +     struct fsl_aud2htx *aud2htx = snd_soc_dai_get_drvdata(cpu_dai);
> > +
> > +     /* DMA request when number of entries < WTMK_LOW */
> > +     regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL_EXT,
> > +                        AUD2HTX_CTRE_DT_MASK, 0);
> > +
> > +     /* Disable interrupts*/
> > +     regmap_update_bits(aud2htx->regmap, AUD2HTX_IRQ_MASK,
> > +                        AUD2HTX_WM_HIGH_IRQ_MASK |
> > +                        AUD2HTX_WM_LOW_IRQ_MASK |
> > +                        AUD2HTX_OVF_MASK,
> > +                        AUD2HTX_WM_HIGH_IRQ_MASK |
> > +                        AUD2HTX_WM_LOW_IRQ_MASK |
> > +                        AUD2HTX_OVF_MASK);
> > +
> > +     /* Configur watermark */
> > +     regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL_EXT,
> > +                        AUD2HTX_CTRE_WL_MASK,
> > +                        AUD2HTX_WTMK_LOW << AUD2HTX_CTRE_WL_SHIFT);
> > +     regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL_EXT,
> > +                        AUD2HTX_CTRE_WH_MASK,
> > +                        AUD2HTX_WTMK_HIGH << AUD2HTX_CTRE_WH_SHIFT);
> > +     return 0;
> > +}
>
> This doesn't look like a hw_params operation - it doesn't appear to
> reference the params at all, or even containt any conditional
> statements.  Shouldn't this be configured just once at driver load?

Ok, I will update it.

best regards
wang shengjiu
