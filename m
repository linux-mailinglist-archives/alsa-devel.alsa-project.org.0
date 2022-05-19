Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B660C52D436
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 15:42:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41425163D;
	Thu, 19 May 2022 15:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41425163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652967746;
	bh=/S02aPKWGIdbFaknReNegxc7r2vWcnEnS0bsaayKNnA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tghk79vTkwPKixm51hpr5K2/gjITkLiX5qAcosxVgCtvTXImDB28x8skL9V0qwrXx
	 98E8gfFvzHaI16/Ls2Djsk8L14gN718oyenH0MOU+dVzjCEH9s/gKoW+W6MOV9Lz76
	 5H/7pbV1xX3uLYfqYH8oDUl/HvBfA0egKm2wpUj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ECE8F800D1;
	Thu, 19 May 2022 15:41:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79CB5F8025D; Thu, 19 May 2022 15:41:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EFECF800D1
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 15:41:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EFECF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MIZxC16q"
Received: by mail-pl1-x631.google.com with SMTP id i8so4817229plr.13
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 06:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KxYwSx6y+x9fI4ECFbVQikUh9lZgIve5uIAAey7MnwE=;
 b=MIZxC16q0VSU0b43u7W+CLYxPfvPz1+WzHV3Y885LYlyxzsl8w1dzb4yowWbDil9FO
 qcLrrpYa76H3KZCWVf0czGg+YtGLiCNVY/TiBopbJKWIU5T1+zcNd/JGyosw7qPrAxZ/
 gSv5eFDjLN1YWgNFs/qLj9lC2YzJ+0KMdexFHfRsvPda9tnHbd0Cnl+gQXBtspCtGoJf
 nVYhMvZJF5e+gy1Is1V4UVZaQbjGz+G/wZpGhgEs66XTmPtfIbxQaKnIZ0Aqf7XPVUrG
 By+GaWIEsaCLIxTW6j2iPsSZ9o7+c+cDFpuWssP5KOoVDfiFvTt1UgBoQudniepkNkNK
 +WiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KxYwSx6y+x9fI4ECFbVQikUh9lZgIve5uIAAey7MnwE=;
 b=8C5dqTB+94M0bHJQ/6Di1lhWHdKGqx57680j/MSGeQzXospfnkOSqonFC7CbysHuXy
 OGivwRQ81MdqJrrTfVjPUA5LT0Y20LBuzugJ0Mw1evS3R1HSJ9kOasyQfmGU07x8zUhX
 7YQ33TYDm0VOtVfFCHPp7rfiEpjcpPJMXgTR3+Kvg+RoTNQuimx7ZbGeTg5MFxRRUfrL
 IHq1Z76vef84uYQ6qvbQ2uzNP1dGyuw2+B57GrCl8Cq4Rzls00p4v/ZBIr3FWEaeLg89
 6cxB7ierflNUefXR/czfiKOwlj8pNKx/h79ebGJwoB8PQ1xqvVBveiz6RB7pGyxH1Ahm
 Fiyw==
X-Gm-Message-State: AOAM532x+q457LY91oNcYinlcjZWnrdXINeVaWDqMJmGaP+MoZYBvLf1
 T21MKymQCR/dHNJM8b21biJfJpoIFmgtsVGqZwo=
X-Google-Smtp-Source: ABdhPJwN938ux3fm5gzJLBtrYIriAnpPWyMjwWJI5wVfv18y6DyL30G7BSWkmIfhyqf4W/oQVIhbkGKg821ZgIO5w/Q=
X-Received: by 2002:a17:90a:6f06:b0:1df:c19b:627d with SMTP id
 d6-20020a17090a6f0600b001dfc19b627dmr5305839pjk.95.1652967677567; Thu, 19 May
 2022 06:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
In-Reply-To: <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 19 May 2022 21:41:06 +0800
Message-ID: <CAA+D8AOp+rNdzXUD+MomS5H87Kv5whMLpCqUrha15Xpbm2Mu2w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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

On Thu, May 19, 2022 at 9:23 PM Fabio Estevam <festevam@gmail.com> wrote:

> Hi Shengjiu,
>
> On Thu, May 19, 2022 at 9:49 AM Shengjiu Wang <shengjiu.wang@nxp.com>
> wrote:
>
> > diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> > index fa950dde5310..dae16a14f177 100644
> > --- a/sound/soc/fsl/fsl_sai.c
> > +++ b/sound/soc/fsl/fsl_sai.c
> > @@ -437,6 +437,12 @@ static int fsl_sai_set_bclk(struct snd_soc_dai
> *dai, bool tx, u32 freq)
> >                                    FSL_SAI_CR2_DIV_MASK |
> FSL_SAI_CR2_BYP,
> >                                    savediv / 2 - 1);
> >
> > +       if (sai->soc_data->max_register >= FSL_SAI_MCTL) {
>
> Isn't it a bit fragile to take this decision based on the number of
> SAI registers in the SoC?
>
> What about adding a specific field in soc_data for such a purpose?
>

'max_register' is one field in the soc_data,  until now in our internal
usage it seems ok for using this condition.

Thanks.

Best regards
Wang shengjiu
