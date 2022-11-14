Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB186276D6
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 08:57:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7DDE15F2;
	Mon, 14 Nov 2022 08:56:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7DDE15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668412619;
	bh=nV+po/EOSXJJGxPIGFZxcptuH7fgjsLTN2Vct2SYHAk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bdwPQbILWOKOaKAF67L1P0f7Hq+nWWZxdxAT9jBi1k71Tlnmt7J6Gvo1W58sxyYk2
	 qjUws3MdhPHiI8CaUW/ZzP7u8oDUZ/hNkKCXNtj22nmPCCg2a32DeHbbBc/NQg3b2B
	 loqvVYFMVbkPJXmBHj+j3sXpUgct3Zr1op5Kctzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CF1DF80448;
	Mon, 14 Nov 2022 08:56:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5E85F80431; Mon, 14 Nov 2022 08:56:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5019DF800B6
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 08:55:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5019DF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eDVxPAu2"
Received: by mail-lf1-x12a.google.com with SMTP id g12so18006214lfh.3
 for <alsa-devel@alsa-project.org>; Sun, 13 Nov 2022 23:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xhn/0QJ3MTxrKx8J7Ife3UIo+sP8pCzXMaolCw/tjg4=;
 b=eDVxPAu2ulBmZbA2KoMn26s/Bw7ECW/Lw/5+kJDaUlCuC+J7XsTZ8TWd2lAv1Dahxi
 pV5ewEiFiTKAAbvwLL+JYfkv1mfoyaF1Ni/08Z4O6v77Y+xiWyUmKmqZpXp0fpC0e4CY
 XH9U5m8ilMkmUPqJTgcfIIZVTYOV+jpKtVibQbLF7M3wfiRngyVq2C4azkiW67rU1efg
 tKJC6yhgwwJAz5Fpu9ExGwo+xhBJKByx0NizWGiWyywIaN+3kwP54CDDOBPdzh7QNNt+
 MfFo7tQdqK85cAxIOrFbi2fAhZJwEShIKbxjlY55HkH/r+WbZN8mlBft6iNf7XZPiq6c
 z3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xhn/0QJ3MTxrKx8J7Ife3UIo+sP8pCzXMaolCw/tjg4=;
 b=xmXn3ZEpML5mSwxMOEzmPRxtpabFh2bD2KXDr2p923FMs2dks4IJ/RMmafQMUp/sol
 E5UV0ejIgTyPsTt4LYLpMh3eSMyI7+EWUteSHwAF8RbIYNEOMgkFD7/UpDvtdy0vQMvc
 3IOpmay23hbHNFPWtYLZGBgmshyGGlNr37DvjG04P+gYfwjnEGzJAtgbFEdrAMgYq35r
 E1KuJJc0VWm3p1Uz6oebUE6VKMXPwo1by7uKeMewSDb28UAP+bosSdoCs5V8Hv8yu1JN
 GydrEF0xpPIidTnIlN7QBv/zXN1dH8FStsQgJibeJoeQJDLW/7VeXDXS4CRoDlh9N8ra
 4qRw==
X-Gm-Message-State: ANoB5plCzz90Vye8Y51XiXDjQHYQSUpUVNFzLjPN7KCe0026nd6dTXYi
 Q0PvGdO2Ks8+ELfD8FwwRYaCmObyRNwiPsGBsWj9MnunGuc=
X-Google-Smtp-Source: AA0mqf5ENldQOFn8J+KzK3KXatOc8lZpPKfa7Dxvp/ibtOlN83K76dxfTyp/hJ59z0/5ckwDv8ZHXutHAKMYIihNL9o=
X-Received: by 2002:a19:5f5e:0:b0:4a4:5e42:ea06 with SMTP id
 a30-20020a195f5e000000b004a45e42ea06mr3467118lfj.408.1668412554061; Sun, 13
 Nov 2022 23:55:54 -0800 (PST)
MIME-Version: 1.0
References: <20221107215201.434212-1-marex@denx.de>
 <CAA+D8AOCqfeVVPwJjLeniWSWeOZjL-64Hktsa===1fs7j96oYw@mail.gmail.com>
 <654da7a3-20fa-e84d-9050-5c6fcb7d6f3b@denx.de>
In-Reply-To: <654da7a3-20fa-e84d-9050-5c6fcb7d6f3b@denx.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 14 Nov 2022 15:55:42 +0800
Message-ID: <CAA+D8AOSbVgk5Cah0WLVg_QzSeKN+Y5EHDB1-h3EP4kV2vQxQA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable transmitter when generating MCLK
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>
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

On Wed, Nov 9, 2022 at 8:55 PM Marek Vasut <marex@denx.de> wrote:

> On 11/9/22 10:30, Shengjiu Wang wrote:
>
> [...]
>
> >> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> >> index 1c9be8a5dcb13..98c62027e5799 100644
> >> --- a/sound/soc/fsl/fsl_sai.c
> >> +++ b/sound/soc/fsl/fsl_sai.c
> >> @@ -503,6 +503,10 @@ static int fsl_sai_set_bclk(struct snd_soc_dai
> *dai,
> >> bool tx, u32 freq)
> >>                  /* SAI is in master mode at this point, so enable MCLK
> */
> >>                  regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
> >>                                     FSL_SAI_MCTL_MCLK_EN,
> >> FSL_SAI_MCTL_MCLK_EN);
> >> +
> >> +               /* Transmitter must be enabled to generate MCLK on pad
> */
> >> +               regmap_update_bits(sai->regmap, FSL_SAI_xCSR(1, ofs),
> >> +                                  FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
> >>
> >
> > No need to fix the transmitter,   FSL_SAI_xCSR(tx, ofs) should work also.
>
> That's probably not a good idea, since this could also enable the
> RE(receiver) part . We always need to enable the TE(transmitter) to
> generate MCLK.
>

TCSR.TERE and RCSR.TERE all can enable the MCLK.
if use the FSL_SAI_xCSR(tx, ofs), both cases can be covered.
if the bclk is generated by TX, then enable the TE(transmitter) to
generate MCLK.  or if the bclk is generated by RX, then enable
the RE(receiver) to generate MCLK.


>
> >>          }
> >>
> >>          return 0;
> >> @@ -1445,6 +1449,11 @@ static int fsl_sai_probe(struct platform_device
> >> *pdev)
> >>              sai->soc_data->max_register >= FSL_SAI_MCTL) {
> >>                  regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
> >>                                     FSL_SAI_MCTL_MCLK_EN,
> >> FSL_SAI_MCTL_MCLK_EN);
> >> +
> >> +               /* Transmitter must be enabled to generate MCLK on pad
> */
> >> +               regmap_update_bits(sai->regmap,
> >> +                                  FSL_SAI_xCSR(1,
> >> sai->soc_data->reg_offset),
> >> +                                  FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
> >>
> >
> > After one time playback or recording,  the TERE is disabled, so this
> changes
> > in probe() only for the first time.  There is the same issue for the
> second
> > time.
>
> So what would you suggest to keep the MCLK clock generated always ?
>
> I was almost tempted to turn the SAI into a clock provider, so that the
> codec could become its clock consumer and enable the MCLK on demand, but
> that seems to be a rather invasive change.
>

May you can try to enhance the drivers/clk/clk-fsl-sai.c

best regards
wang shengjiu
