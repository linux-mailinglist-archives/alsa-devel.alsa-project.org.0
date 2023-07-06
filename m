Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D960774A45E
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 21:25:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68A123E8;
	Thu,  6 Jul 2023 21:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68A123E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688671519;
	bh=sxeaamjYVIy4o13C9YzTQ3+uNf0MERRlZCTMBCbM+MY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OIcvorstVqPRt9p/VQWPg4YBvi2rctOSGtRc/l+TTrERQteiGOuPTR9dTeQKnBVGf
	 TBLtMUO9S4EDWtB7KY+EFlABGHgz2dX6Ta9S4ULQLVIa9ScjxaNuA6Sb4HXRdnoTu8
	 K8UAlH2RrcKSAIWq4ZiRkC/3T8laV/S0KBSFgRlc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B440AF80125; Thu,  6 Jul 2023 21:24:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9AD4F80093;
	Thu,  6 Jul 2023 21:24:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16D4EF80125; Thu,  6 Jul 2023 21:24:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 167A8F80093
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 21:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 167A8F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=NLh9E3/B
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6748a616e17so209278b3a.1
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 12:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688671452; x=1691263452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhVVqhgUWB+b94nKwRjLmQsRnD2v0UodHDpAR7gNhHI=;
        b=NLh9E3/BkEmA5I9ffxyypCNYhT/vVjIVZEW6xzmxmzXfHDS2TEm8MkwybamB9mo1y1
         1Zr+/gvgymxHc9pIqQJT/xQc78pht3md5z5WepsFQIwhDP3cEJr6iNg9gSS92LmJbzk0
         WzkA20DIDzzri3Qr0Tzr96WXNZFwJcXLYSA/Rinz9NhlxyP2P/Gj2r1CRDcJyS16elkf
         W6M9qa+0U0Yuiq3nfIwYyi3oLr2+YjjF/fhFl+VTillSa2GqdP1tWCpr78rsMB27YHV/
         7O+81MbkRiPpEH8K9t/c1w3jVne/mpQA+We6Qgh8gv9HYSoYiISrkD1LeDIYIfAffKyX
         NT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688671452; x=1691263452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lhVVqhgUWB+b94nKwRjLmQsRnD2v0UodHDpAR7gNhHI=;
        b=QdPlR6Atyt4FkYoKAz1IGWxzYdS241S/kfethDcee1C0VMJ51zpx2AZzbpXXz8gEu+
         ag3fhyQW1zetmxjJzD4oI9MEcoDRdS9zhJznEeY+xQCZ3AGc53LB2/H0hhDuXGCDgEPk
         oQFDZ1Wq8NvxU6s/A766ZgSp7Q2ZxNWHSR2W3vqhLcOd1vbg9315ziy/uJ9RU2Jnqrk5
         esc7FzAPQgClYB1V/UMZqg4v0/SuGBXCHnkKKxIs65qXHYvq8pfvM9TS5IZm9aWei+m5
         Ir7zAqXXisRAzDkLAix4Jt2IeOs2tBV0beLIcbuaT7Fb+YdeqFKH8KJU/E43ixrdFzWE
         x91Q==
X-Gm-Message-State: ABy/qLbJG/S4vjkSBomGC7jjepEJQmNz8HityUK8EreqXJ41F+I4pNEI
	Pe4CbymeevdyOYyOzMn+zQcHGTLNRdtoIFldhKo=
X-Google-Smtp-Source: 
 APBJJlGSXusmaOilfEYswRYzXBNrbHzPF3517Rzv7t30AGLIkrM/0ZVEagwblJ3auCzLKp0+HAQHVBDwmWQatEhdY/M=
X-Received: by 2002:a05:6a00:1d96:b0:679:a1f1:a5f8 with SMTP id
 z22-20020a056a001d9600b00679a1f1a5f8mr2808894pfw.3.1688671452381; Thu, 06 Jul
 2023 12:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230706131829.1862750-1-festevam@gmail.com>
In-Reply-To: <20230706131829.1862750-1-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 6 Jul 2023 16:24:01 -0300
Message-ID: 
 <CAOMZO5CeHHs+S3GWfivY2fN8==L5DLRSKw=cEn=xBJ95j4ajGA@mail.gmail.com>
Subject: Re: [RFC] ASoC: fsl_sai: Do not set MCTL_MCLK_EN based on the number
 of registers
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com, alsa-devel@alsa-project.org, andreas@fatal.se,
	hans.soderlund@realbit.se, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: GRFUR4HMDAWNOCXO3E3G6SCEXMHH4WOQ
X-Message-ID-Hash: GRFUR4HMDAWNOCXO3E3G6SCEXMHH4WOQ
X-MailFrom: festevam@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GRFUR4HMDAWNOCXO3E3G6SCEXMHH4WOQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shengjiu,

On Thu, Jul 6, 2023 at 10:18=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> Since commit ff87d619ac18 ("ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for
> master mode") Andreas reports that on an i.MX8MP-based system where
> MCLK needs to be an input, the MCLK pin is actually an output, despite
> not having the 'fsl,sai-mclk-direction-output' property present in the
> devicetree.
>
> This commit explains the following:
>
> "On i.MX8MM, the MCTL_MCLK_EN bit it is not only the gate
> for MCLK output to PAD, but also the gate bit between
> root clock and SAI module, So it is need to be enabled
> for master mode, otherwise there is no bclk generated."

As far as I can see, the i.MX8MM Reference Manual only talks about
this bit controlling the MCLK direction.

Is there any documentation that explains this clock gate control functional=
ity?

> Currently, the decision of using MCTL_MCLK_EN as a clock gate is based
> on the number of SAI registers present on a platform.
>
> This is fragile as it causes issues on i.MX8MP, for example.
>
> Fix the problem by introducing a new boolean mclk_en_gates_clock member i=
n
> the fsl_sai_soc_data structure that indicates that the MCTL_MCLK_EN bit
> also acts as a gate between the root clock and the SAI block.
>
> This allows i.MX8MM to turn on FSL_SAI_MCTL_MCLK_EN as intended and other
> SoCs such as i.MX8MP can still use MCLK as input.
>
> Fixes: ff87d619ac18 ("ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master m=
ode")
> Reported-by: Andreas Henriksson <andreas@fatal.se>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Hi Shengjiu,
>
> Is imx8mm the only SoC that needs mclk_en_gates_clock =3D true?
>
> What about imx8mn and imx93?
>
>  sound/soc/fsl/fsl_sai.c | 12 +++++++++++-
>  sound/soc/fsl/fsl_sai.h |  1 +
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 5e09f634c61b..e4dc6964f011 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -507,7 +507,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, =
bool tx, u32 freq)
>                                    savediv / 2 - 1);
>         }
>
> -       if (sai->soc_data->max_register >=3D FSL_SAI_MCTL) {
> +       if (sai->soc_data->mclk_en_gates_clock) {
>                 /* SAI is in master mode at this point, so enable MCLK */
>                 regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
>                                    FSL_SAI_MCTL_MCLK_EN, FSL_SAI_MCTL_MCL=
K_EN);

Also, why is FSL_SAI_MCTL_MCLK_EN set in two places (here and inside probe)=
?
