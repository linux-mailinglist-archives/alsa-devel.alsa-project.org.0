Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E85232B8B05
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 06:30:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 668CE1700;
	Thu, 19 Nov 2020 06:29:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 668CE1700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605763834;
	bh=7m88ABORqYW+HNqBKPcMR/vT6aoxCfS4C1NNJw0EAa4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lkktnUkws2GuzArCXv023P8zb2r9pj1mi3L+kCcM9S7JLVHqqcVcOj7yAshhuC0dQ
	 ng+h2cmZoRrR2xB72V45ZWQ/Elc2sub1Li6rFyAMfdFaK+btAyriEVT5REMhwAT8vc
	 MtahvPHrGQOP8Of0uWMiVNrjlk7r0izMTHkgEcmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFADFF801F5;
	Thu, 19 Nov 2020 06:29:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A1C9F801ED; Thu, 19 Nov 2020 06:28:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87815F8015A
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 06:28:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87815F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qZF2Ygao"
Received: by mail-qt1-x842.google.com with SMTP id t5so3579534qtp.2
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 21:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b7W8v88zLtr+ka2IPAyj56iTGAS8nCyLHMM+2VUflmo=;
 b=qZF2YgaoXYq0nmLnEFZikoLEWobBAv2ePC78d840jV8fVBGlhwa9cPS53PSvu/xHNN
 Xqqpc5mi8jp/wBM58SIMpqTJjRowXWQPf1GLHXRWf4LAJ8Wn7XPDBtYy4Jtvpq/Rz6bm
 LU7/yZrTjFBu93tCO84TwEFiJfha687R8ecfczX9rbZ7ab9QupindBJgfn3i7+J2iTwm
 mP7Y6rwWR3nITm+rmgWXkK/KQbnhB2YhDhCCSdxV67U9QgxzAiPzMZJMuSjmoLQfeGg/
 ADv0cjpR4/VioRFC0SMi0XyDlJ+oDitPmwv1+8wjgCRdXVcuMp5oMd81S6jCQPQeSf6k
 8UdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b7W8v88zLtr+ka2IPAyj56iTGAS8nCyLHMM+2VUflmo=;
 b=pKSFncaypjNvCDfcDw/o/+rA+tGzfuqSvaVPSmgw4ZUeROCHWWkv7SWaN96dK8dMnR
 7m1iTSafxkYv3dFKOwji9vBficFv71MEiuIuwe4IfEsX7ABS3dkLikvMtueIZYUCZtzZ
 To0dt36ej40zPol7Nqt/OGgzUquDrG7XATbvpcvMHn3le0b8dJ8AqInubVKDIVIJeTA9
 S4PbpZkXjVr4aiL97wX7GNP+Bi79dhr1tgKENFMDW/ps6Ti0dn4K0QuJJp7XuGBlz/mS
 hGS411j35Pbv2OOEIvlpp8h3y2hGNXmfvwb0+L5HCTXGVGWGHuAd3A/6MlF/iEBR81ar
 IIYg==
X-Gm-Message-State: AOAM533jVp3Ol/Ddv1znVEYn0rAm/AoCXlXRn5TjGcB922EgwfWa9tBM
 oXjvt6iTGqP8KwUyrOqM1mR4+umipOQdDb12/d8=
X-Google-Smtp-Source: ABdhPJyP01zyLRekqz3HSZ/yOdRNlpFC3KuuNZYSluSSNckhGFZkRWKxMffUcBHvJTq4iZbFHpbs1CpAK1V2ccLnnRo=
X-Received: by 2002:ac8:5806:: with SMTP id g6mr9224533qtg.292.1605763723217; 
 Wed, 18 Nov 2020 21:28:43 -0800 (PST)
MIME-Version: 1.0
References: <1605752956-17397-1-git-send-email-shengjiu.wang@nxp.com>
 <20201119050120.GA7124@Asurada-Nvidia>
In-Reply-To: <20201119050120.GA7124@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 19 Nov 2020 13:28:32 +0800
Message-ID: <CAA+D8AOuaeZCnvY0h2stzkiMnNCe7zvK_D4M2irT7y7NC+iZFg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Correct the clock source for mclk0
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
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

On Thu, Nov 19, 2020 at 1:02 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Thu, Nov 19, 2020 at 10:29:16AM +0800, Shengjiu Wang wrote:
> > On VF610, mclk0 = bus_clk;
> > On i.MX6SX/6UL/6ULL/7D, mclk0 = mclk1;
> > On i.MX7ULP, mclk0 = bus_clk;
> > On i.MX8QM/8QXP, mclk0 = bus_clk;
> > On i.MX8MQ/8MN/8MM/8MP, mclk0 = bus_clk;
> >
> > So add variable mclk0_mclk1_match in fsl_sai_soc_data To
>
> Not in favor of "mclk0_mclk1_match" as it doesn't sound explicit
> to me. Instead, "mclk0_is_bus_clk" or "mclk0_is_mclk1" might be
> better. Or in case that you foresee some other implementation:
>
> enum {
>         MCLK0_IS_BUS_CLK,
>         MCLK0_IS_MCLK1,
> };
>
> static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
> +       .mclk0_alias = MCLK0_IS_BUS_CLK,
> };

No problem.

But I just find this patch doesn't consider the mqs case.
MCLK0 can't be used for mqs, it needs MCLK1, even
the MCLK0 is same as MCLK1,  MCLK1 need to be
selected for mqs case.

Is there a decent way for this case?

best regards
wang shengjiu
