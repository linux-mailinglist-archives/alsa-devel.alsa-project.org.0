Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BDC4460BA
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 09:35:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 555C7167D;
	Fri,  5 Nov 2021 09:34:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 555C7167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636101334;
	bh=RQbdD6c35orKj2i6OoFppZeDzmmD8f1rDen3vatBrkE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=utNPXHgTll1VNhzO7MQ+phGfT3ufegGU/YPsh70btPfwtWj01CDLCrMl7eI1cJ/Z8
	 T/mih1SzmlKYxCuILA6M6JWzyR+b3rNo931dykhqFSDG8PEzPqnPKJLNj6+t2Of9pa
	 99UKz7r5PAI1Wg9ZGuG7nYL+9iGbSmCOYkluJhtk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABC7BF80279;
	Fri,  5 Nov 2021 09:34:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CECD7F8026A; Fri,  5 Nov 2021 09:34:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E1C5F8012A
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 09:34:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E1C5F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="l1peGZfu"
Received: by mail-wm1-x333.google.com with SMTP id z200so6425441wmc.1
 for <alsa-devel@alsa-project.org>; Fri, 05 Nov 2021 01:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tV5qMR1OcPP5P1RfQxDT1t80Tbdqvd2SPmssw47ismA=;
 b=l1peGZfuladvUzI3j1xu1WNpEgsoXzPDGt6/+qh34nW2x2m4ViXID4qCFXRykIpPxt
 +4Bf31+AArwFcGDPqyjE83q68WY5CfgOsrA51nt6XVkR3jgjB4JMg5XTYDL3J05oy/A3
 8xRjbkq8fZ4NzQonoVrYtJYwmQoLdLOIYMChU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tV5qMR1OcPP5P1RfQxDT1t80Tbdqvd2SPmssw47ismA=;
 b=YJ7FTsNvOrqHT6vIxcbienEdQcdYyPnIwDPlsae9EPDlTpAUAgVxjRf/568HRKNka5
 t5m5Hf1itT0/WKHNsrHZJ9PTVvG81itPcnC+WAgMiR945REUVZZL9WbsON5239vUGEz2
 rhezcK0RTXLpar9oSY2o02Anqv+hvYj3/e2yBJ0VN7YcH/52NRUffw/McbmdzVt4Ykdx
 SKHXFeP1BHEcQd3EqvZ04rDpj8eBbZM00ubwKS+AUhunYkAi2i2UVWoROXNsJQPjo/iL
 xofQQrmGL30SchO1GtARbiyUordTupYyR4ApZESCwDGjhhgxBCTc9JKmOptDiK3jSJbR
 lyag==
X-Gm-Message-State: AOAM533TytZ6I9QhdySIjh9xOaslnB1fkmaCqsI1IRTvs6TwGH0UreeG
 l+60qyJxxYZknBhXU9KhiCRCQsq3QGYyRcj9omJMhg==
X-Google-Smtp-Source: ABdhPJzf65l6+JfleQS2h6XrS6RWfdYfKU0Lo/n9NEmtkEX15pObo11N/XaeskWYtktiG5D24lscq3CxP9kOb6tf/AQ=
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr29336030wmc.117.1636101243410; 
 Fri, 05 Nov 2021 01:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAGvk5PoVp7LoFbaq93_F0Mf9xHzOqSt-HpK0gYh4WMAHrJ6vag@mail.gmail.com>
 <s5hmtmjgir3.wl-tiwai@suse.de>
In-Reply-To: <s5hmtmjgir3.wl-tiwai@suse.de>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Fri, 5 Nov 2021 16:33:52 +0800
Message-ID: <CAGvk5PoWi9sCiEAG84qmfH67nshFZOtX2r+z6P3vsJ5=7_pPHA@mail.gmail.com>
Subject: Re: The regression caused by snd_soc_dapm_enable_pin
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA development <alsa-devel@alsa-project.org>
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

Takashi Iwai <tiwai@suse.de> =E6=96=BC 2021=E5=B9=B411=E6=9C=885=E6=97=A5 =
=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, 05 Nov 2021 03:58:46 +0100,
> Yu-Hsuan Hsu wrote:
> >
> > Hi Takashi,
> >
> > The patch 5af82c81b2c49cfb1cad84d9eb6eab0e3d1c4842(ASoC: DAPM: Fix
> > missing kctl change notifications) caused the regression on some
> > ChromeBook.
> >
> > The reason is that some drivers check the return value of
> > snd_soc_dapm_enable_pin, like kabylake_ssp0_trigger(Which caused a
> > regression). In addition, some SOF drivers may be also affected by
> > this change(e.g. sof_sdw_max98373.c). Could you help to fix it?
>
> Does the patch below fix the problem?
>
>
> Takashi
>
>
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -3589,10 +3589,10 @@ int snd_soc_dapm_put_pin_switch(struct snd_kcontr=
ol *kcontrol,
>         const char *pin =3D (const char *)kcontrol->private_value;
>         int ret;
>
> -       if (ucontrol->value.integer.value[0])
> -               ret =3D snd_soc_dapm_enable_pin(&T->dapm, pin);
> -       else
> -               ret =3D snd_soc_dapm_disable_pin(&card->dapm, pin);
> +       mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUN=
TIME);
> +
> +       ret =3D snd_soc_dapm_set_pin(dapm, pin, !!ucontrol->value.integer=
.value[0]);
> +       mutex_unlock(&dapm->card->dapm_mutex);
>
>         snd_soc_dapm_sync(&card->dapm);
>         return ret;
> @@ -4506,7 +4506,9 @@ EXPORT_SYMBOL_GPL(snd_soc_dapm_stream_stop);
>  int snd_soc_dapm_enable_pin_unlocked(struct snd_soc_dapm_context *dapm,
>                                    const char *pin)
>  {
> -       return snd_soc_dapm_set_pin(dapm, pin, 1);
> +       int err =3D snd_soc_dapm_set_pin(dapm, pin, 1);
> +
> +       return err < 0 ? err : 0;
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_dapm_enable_pin_unlocked);
>
> @@ -4527,7 +4529,7 @@ int snd_soc_dapm_enable_pin(struct snd_soc_dapm_con=
text *dapm, const char *pin)
>
>         mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUN=
TIME);
>
> -       ret =3D snd_soc_dapm_set_pin(dapm, pin, 1);
> +       ret =3D snd_soc_dapm_enable_pin_unlocked(dapm, pin);
>
>         mutex_unlock(&dapm->card->dapm_mutex);
>
> @@ -4618,7 +4620,9 @@ EXPORT_SYMBOL_GPL(snd_soc_dapm_force_enable_pin);
>  int snd_soc_dapm_disable_pin_unlocked(struct snd_soc_dapm_context *dapm,
>                                     const char *pin)
>  {
> -       return snd_soc_dapm_set_pin(dapm, pin, 0);
> +       int err =3D snd_soc_dapm_set_pin(dapm, pin, 0);
> +
> +       return err < 0 ? err : 0;
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_dapm_disable_pin_unlocked);
>
> @@ -4639,7 +4643,7 @@ int snd_soc_dapm_disable_pin(struct snd_soc_dapm_co=
ntext *dapm,
>
>         mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUN=
TIME);
>
> -       ret =3D snd_soc_dapm_set_pin(dapm, pin, 0);
> +       ret =3D snd_soc_dapm_disable_pin_unlocked(dapm, pin);
>
>         mutex_unlock(&dapm->card->dapm_mutex);
>

No, it's not compilable. There is no variable "dapm" in
snd_soc_dapm_put_pin_switch. After changing to
&card->dapm.card->dapm_mutex, the issue is fixed. Thanks!
