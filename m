Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 367C1398F2B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 17:45:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5EEB16F4;
	Wed,  2 Jun 2021 17:44:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5EEB16F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622648739;
	bh=kz49oNM7CB8GlmVLR9dUdTllC+2zWyZhc2X2vlUlpy4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fd/WktcSYy95Eno/Ah4bLOE0Jg8zzcmfzM1CfPguvq6w3IkAFYcNENlFi/1RWkr5a
	 +Les+2nH4OrAUfcR8fvg5wzDubNlHoj68yT7oF6J7p3AxN6VWKaGMSel0I/KgWblrP
	 oaMb2Z99NmMreeBg1mOLLCjDoPQckjSfHrOtEDZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1845DF80103;
	Wed,  2 Jun 2021 17:44:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1991AF80424; Wed,  2 Jun 2021 17:44:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 367E9F80141
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 17:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 367E9F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VstgI3Ch"
Received: by mail-lf1-x135.google.com with SMTP id a5so4157044lfm.0
 for <alsa-devel@alsa-project.org>; Wed, 02 Jun 2021 08:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OBblrHGCs55cViW00rNijqacDYoorI2gMf91bLN8H6A=;
 b=VstgI3Ch9IUJL9QEJ7w2wz1Y5FqrOIB5LeLRPYhI+Y+BW3jN0++iSF7+3gaFX0A/sD
 RKgw8wEnssMKzm8dlJHQYhh2CRYsTi1G3Mid27IGhB34PujdNlv2V5DXn0LJPRiaVfYh
 Zk93v5k0AldhWQ6prr+RBo9gkfik8nlv7GFHFPfjnrAMuH74yHNILeeDTwhmkq4DKVba
 +ZtthrbaGwljl5F0ZDVVw6qLajvIPWu38YgA35tvnX6sCE2+LE6Njxw6N28L7t6OqYx/
 ruHTrgpVUz9kgqtx6Pw2ExDIOOyhOGBfMnpM7g/3adZgEoPgVWR3Pewt51pfjCiHn3qT
 oY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OBblrHGCs55cViW00rNijqacDYoorI2gMf91bLN8H6A=;
 b=jx7BCpDzU0k57CdknUt0ufM/DUXuEVRgpNl3Yg7Q7hSzzUt6ZtGEW8A5SektUJWBXg
 2XTsWdyLZ1P2hKQcDLt/56xjV9ep442t2lWw0cgKNhuKTvEnW/TBOt1YsJDLqFYTaoRC
 IHLjpZ6CYMdrcuri2+UWhILSPQuqJShIe4W3NhyTO4JEZWZ9bHyM5I7v5Caq45NrhRHR
 m0wuo9dgIYC53A67ML9Nb4N/8fQIZ21nOWINGZtpPQJBaB3UPQwCAyFRriJ0Y6T4RHOU
 dwVkdrPDSotYpnbuYED82Voa54avC3B4zulO4ZjlXf8qRaTAMteHT9CTLVo7X13yFKqY
 e5LA==
X-Gm-Message-State: AOAM533HQXxlq3ld3KPfvyrfCU+f0o6wyUilmlqqeIqB8+VEumHuRbSU
 naVWIJzcMFlbe6+6k6a+feIc76i3RizTfKOFgWk=
X-Google-Smtp-Source: ABdhPJzdK7pAHWYASLkeaOmnuhJjmfN6soue4SZRfA3dMZz+X3wo1Jhzd9myvH2AuzGDmUg82lgYxpIsOTh6tU5E6hg=
X-Received: by 2002:ac2:51a9:: with SMTP id f9mr5025625lfk.223.1622648641044; 
 Wed, 02 Jun 2021 08:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <1622616132-10391-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1622616132-10391-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 2 Jun 2021 12:43:49 -0300
Message-ID: <CAOMZO5An-v0mLAvjofiWLc4ufJiE4EzG1b4NDwToPSvgODrHjQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: change dev_err to dev_dbg for defer
 probe
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
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

Hi Shengjiu,

On Wed, Jun 2, 2021 at 3:59 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> Don't need to print error message for defer probe
...
>         if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
> -               dev_err(&pdev->dev, "failed to find codec device\n");
> +               dev_dbg(&pdev->dev, "failed to find codec device\n");

You may consider using dev_err_probe() here, which fits exactly this purpose.
