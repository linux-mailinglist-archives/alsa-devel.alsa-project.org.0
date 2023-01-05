Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D265465E839
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 10:50:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5FFAF17C;
	Thu,  5 Jan 2023 10:50:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5FFAF17C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672912254;
	bh=W66804O1QC/XCTRejBKDHivJ3DaUSCYSSX1+FfX+Lko=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pqtwhETQKC+CnyLbaxFoFlBfPnOVx8a2OeTOJvRj2OII/5WX+kKG7CcDRpAYoleWq
	 AzWKqSYIu1F4QcHVqNOPviqMd0QO3l6ZIa684EHIS2Tc5VmqBrTkyzAc6IjLnlQQXh
	 gbIooeBF0PH9aoHRKIa+FNlAjWowbyXF8ha+suuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11F04F8022B;
	Thu,  5 Jan 2023 10:49:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82D7CF804AD; Thu,  5 Jan 2023 10:49:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4381F8022B
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 10:49:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4381F8022B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TfD9Tl7A
Received: by mail-wm1-x333.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso913275wmb.0
 for <alsa-devel@alsa-project.org>; Thu, 05 Jan 2023 01:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=paARRJIFHIsVX4dtu4ZLJZE/XHiRymnBzrwux6NQcSI=;
 b=TfD9Tl7A4ZNOXf/np9wdrY4h25B4/4+S27TByz89hpIwQVT5QubrZ+w5ObaB4V6WS9
 4QCrQyZ/kV/5p7xakU4aaBLDeKPYJNXuSCvlAGKFsEVJSOCZI7Os92BwG2YhC1I2dmtb
 OYKN/1ALMzLnSc4CW1IUs38Xwn/sGp+uZEJM73FSLoYhajuXtmG8TBXML03CmI8IPGG8
 38z8sJqPpknRkGVNj7KsJIe+kpP79qnhp0zDdpyIPLu22mM1YPpoAbyEuNmv5dt0bnti
 6duYuXJUQDjrkyHa45PkG3Xkwx+4Iq+aczpwhaSTqmjtL4f4SyQl+TfC28Ooe1RVq/hD
 46uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=paARRJIFHIsVX4dtu4ZLJZE/XHiRymnBzrwux6NQcSI=;
 b=zJeX4W13Y+ub7yr/JV08cMA3ca7HZ6G39qXjHEF2QZej6e1sXNjUOdMkrVSh8LuVir
 gfSQKAwUYztogdzAe1yQh9Q8TTcgDaMqYpSbhOyFmtdoT5g1fpabxATeAABJuXa8PQCy
 usCEC+ezrPO1vr8BMkl/f8C7Wom2emY7XSeBGltn1erIW8dp4pLcewmbpMdBIzkVmYX6
 KyOWkIGoglgb4a5j8atXAXCkP2rYGwV6Jao5h3CZwET1inie6akNgfWx47PniN4Ls9VY
 aEZc1iYLJOmaRZhqJq5ajoAiVHUyrPJmZkeVummI72nLedsxpOAZmuK0XQQvOpWZuTEw
 tMSw==
X-Gm-Message-State: AFqh2ko7/YWt8W5Evb10awYjidYki63IKu1LcQfJztRnAwq5VxhzJvp4
 z1i9V3j4wUnbJmrT+evebm+NR3HmEgabPJB3c3I=
X-Google-Smtp-Source: AMrXdXtlmxDg/o8Vf0/42UoL40MYP402jKJXPX3nFjs1O/tiK+hPd8h5neSgCEHYznNmo1SWhmeIhjbEqJHaJfH+tNA=
X-Received: by 2002:a05:600c:b42:b0:3cf:a851:d2ef with SMTP id
 k2-20020a05600c0b4200b003cfa851d2efmr2046752wmr.88.1672912189014; Thu, 05 Jan
 2023 01:49:49 -0800 (PST)
MIME-Version: 1.0
References: <20230104025754.3019235-1-chancel.liu@nxp.com>
In-Reply-To: <20230104025754.3019235-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 5 Jan 2023 17:49:37 +0800
Message-ID: <CAA+D8AO-_MFop-WS=XQa2L83aajibkY4DeJek-3khN5p_1rwig@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Correct the number of steps on SX
 controls
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 4, 2023 at 10:58 AM Chancel Liu <chancel.liu@nxp.com> wrote:

> The parameter "max" of SOC_SINGLE_SX_TLV() means the number of steps
> rather than maximum value. This patch corrects the minimum value to -8
> and the number of steps to 15.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_micfil.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index d7e6fc996166..d4d3bc7ca87c 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -325,21 +325,21 @@ static int hwvad_detected(struct snd_kcontrol
> *kcontrol,
>
>  static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
>         SOC_SINGLE_SX_TLV("CH0 Volume", REG_MICFIL_OUT_CTRL,
> -                         MICFIL_OUTGAIN_CHX_SHIFT(0), 0xF, 0x7, gain_tlv),
> +                         MICFIL_OUTGAIN_CHX_SHIFT(0), 0x8, 0xF, gain_tlv),
>         SOC_SINGLE_SX_TLV("CH1 Volume", REG_MICFIL_OUT_CTRL,
> -                         MICFIL_OUTGAIN_CHX_SHIFT(1), 0xF, 0x7, gain_tlv),
> +                         MICFIL_OUTGAIN_CHX_SHIFT(1), 0x8, 0xF, gain_tlv),
>         SOC_SINGLE_SX_TLV("CH2 Volume", REG_MICFIL_OUT_CTRL,
> -                         MICFIL_OUTGAIN_CHX_SHIFT(2), 0xF, 0x7, gain_tlv),
> +                         MICFIL_OUTGAIN_CHX_SHIFT(2), 0x8, 0xF, gain_tlv),
>         SOC_SINGLE_SX_TLV("CH3 Volume", REG_MICFIL_OUT_CTRL,
> -                         MICFIL_OUTGAIN_CHX_SHIFT(3), 0xF, 0x7, gain_tlv),
> +                         MICFIL_OUTGAIN_CHX_SHIFT(3), 0x8, 0xF, gain_tlv),
>         SOC_SINGLE_SX_TLV("CH4 Volume", REG_MICFIL_OUT_CTRL,
> -                         MICFIL_OUTGAIN_CHX_SHIFT(4), 0xF, 0x7, gain_tlv),
> +                         MICFIL_OUTGAIN_CHX_SHIFT(4), 0x8, 0xF, gain_tlv),
>         SOC_SINGLE_SX_TLV("CH5 Volume", REG_MICFIL_OUT_CTRL,
> -                         MICFIL_OUTGAIN_CHX_SHIFT(5), 0xF, 0x7, gain_tlv),
> +                         MICFIL_OUTGAIN_CHX_SHIFT(5), 0x8, 0xF, gain_tlv),
>         SOC_SINGLE_SX_TLV("CH6 Volume", REG_MICFIL_OUT_CTRL,
> -                         MICFIL_OUTGAIN_CHX_SHIFT(6), 0xF, 0x7, gain_tlv),
> +                         MICFIL_OUTGAIN_CHX_SHIFT(6), 0x8, 0xF, gain_tlv),
>         SOC_SINGLE_SX_TLV("CH7 Volume", REG_MICFIL_OUT_CTRL,
> -                         MICFIL_OUTGAIN_CHX_SHIFT(7), 0xF, 0x7, gain_tlv),
> +                         MICFIL_OUTGAIN_CHX_SHIFT(7), 0x8, 0xF, gain_tlv),
>         SOC_ENUM_EXT("MICFIL Quality Select",
>                      fsl_micfil_quality_enum,
>                      micfil_quality_get, micfil_quality_set),
> --
> 2.25.1
>
>
