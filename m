Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB89B9558B5
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Aug 2024 17:38:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9724238F;
	Sat, 17 Aug 2024 17:38:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9724238F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723909109;
	bh=4W/Y6BiJMxSnwgO47spVbAk5tyI3nap6YIH8p8Sxih8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZmN3GGh/oqHngdeYsteXxD0MwtMh/MrxG8ZMcxZJYUq1icJT4lzpeqMS6z8g4o7QZ
	 zJ1+iaVXQ/S1MiqR+aL8X+QZY9wWQMxDAOhOwbUu5ovT3XxJ0dhcnExIqQLaIfZL9r
	 fe6xIMQx7GZuL5AsTQwdtx9JAUiazavLY6PxGutE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B1E1F805A9; Sat, 17 Aug 2024 17:37:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D005BF8016E;
	Sat, 17 Aug 2024 17:37:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D5FCF80423; Sat, 17 Aug 2024 17:34:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08107F800B0
	for <alsa-devel@alsa-project.org>; Sat, 17 Aug 2024 17:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08107F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zs4JISDn
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-8430fdf256bso301882241.0
        for <alsa-devel@alsa-project.org>;
 Sat, 17 Aug 2024 08:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723908862; x=1724513662;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8eoWHKmZrDuz5TVj5RFNMVS0TvpziubW752S/ws51A=;
        b=zs4JISDntVgQqwlHrFnGaLrMGRGjalizsd0Xfmp2FqSaqqrCtrJmqHxDzCxyR1A39b
         uUpyzHeW6v6LAHshCwGI9eHOpus+RrvseD608dsszIKc+pm5IlpJMhVxLQgjrp6dk+7Z
         mfMtbS509rC00IPXEJWmqnA1NQnakqZdEIBhJAX0CnVAVVBjOQz657CiZ5kzDTaxsC1X
         a+qhCokroLhEsHuNMJgVpccJeIHOql4f9PbG+ke8HUdAYvSPp2AKEXiJf8jls6I9E2Yn
         jMCDnuHmZEuoryFOokzSm0r1K+nyLRUqim7F/ruwKyL/xyjE66IwmhEQuIxi7TAZjLRw
         a+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723908862; x=1724513662;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8eoWHKmZrDuz5TVj5RFNMVS0TvpziubW752S/ws51A=;
        b=xTMipID4fhjPHL+rH97mc3rzAH8nUaVlZnq37yIsY73WWidzobCefWsJKI3KN/1PHH
         XgFLlDO4Ru6GvFuz9xDi2YM8BDRh3uATMsuyLAhj0HWtMMtk+GwSO3bO6mT01OdNgRo3
         bZeG9NWk0WtUyrSp3QBDylJrQjPBeFJP3QSCTyIPWAgVEg0f7I7OfwRQjFlCkldKchvh
         hVHDJH+4qv+Nlqwv0kcXyUUQ9q+hbQFxuVIcpSk0qz1Avm1WMHFuxsw2IA4YcYhD3Kwe
         2tZONJYkr5/SShEqP2QvW0bEDaqXasn1rd6eOkce9UG8nXpWMTMC9JDDXDHPsREdoKg4
         HzJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0GmLiJErAEW9B7QKNOZXqGw/XIWSBcF9JnMXZTvqSc6HkEeWmdduBC3/1ZfcGeKUjpzHkE8NaSqq6nNMPwvDyeZww4Phbsgw5D+w=
X-Gm-Message-State: AOJu0YxDwZPGBq/bb0ZiS+f+EUsXdHUMRiunQ7QeHu2i9OZ3D23Mb74T
	mD+Sr22kVXIho4U8IRiWYXMVN7ztsQaoq1boYDbCXdE/MVP5QhbQ6mFTv3xhH5g8oXh+zfRu/UY
	F34oD1AkZjXnK3zY/vymvGApxlwK+f29WOIz2wA==
X-Google-Smtp-Source: 
 AGHT+IGryT/KxWwiBHtKufxRiy8ES1KCnuo4booGpak6/PFr/3xYW4X3k+uP5qw9d5dQpPL/X2iClWn1D103V2/VYxE=
X-Received: by 2002:a05:6102:304d:b0:48f:8ead:7b7 with SMTP id
 ada2fe7eead31-4977997fc1fmr7556666137.21.1723908862208; Sat, 17 Aug 2024
 08:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Sat, 17 Aug 2024 21:03:46 +0530
Message-ID: 
 <CAMi1Hd1bYgmnL5O946rxVK2k8ygYm1ur2nCe3KNpmYHnvPa+hQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: codecs: lpass-va-macro: set the default codec
 version for sm8250
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: TYHNCSR3YWBFF5DDCUSMICHV3ZMAPJ46
X-Message-ID-Hash: TYHNCSR3YWBFF5DDCUSMICHV3ZMAPJ46
X-MailFrom: amit.pundir@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TYHNCSR3YWBFF5DDCUSMICHV3ZMAPJ46/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 16 Aug 2024 at 14:42, <srinivas.kandagatla@linaro.org> wrote:
>
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
> sm8250 and sc7280 have lpass codec version 1.0, as these are very old
> platforms, they do not have a reliable way to get the codec version
> from core_id registers.
>
> On codec versions below 2.0, even though the core_id registers are
> available to read, the values of these registers are not unique to be
> able to determine the version of the codec dynamically.
>
> Add the version info into of_data, so that driver does not need to use
> core_id registers to get version number for such situations.
>

Thank you Srini for this patch. This (along with the DT patch [1])
fixes the HDMI audio regression on RB5.

Tested-by: Amit Pundir <amit.pundir@linaro.org>

[1] https://lore.kernel.org/all/20240815170542.20754-1-srinivas.kandagatla@linaro.org/

> Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Changes since v1:
>         - updated commit text to add more details
>
>  sound/soc/codecs/lpass-va-macro.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 8454193ed22a..e95d1f29ef18 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -228,11 +228,13 @@ struct va_macro {
>  struct va_macro_data {
>         bool has_swr_master;
>         bool has_npl_clk;
> +       int version;
>  };
>
>  static const struct va_macro_data sm8250_va_data = {
>         .has_swr_master = false,
>         .has_npl_clk = false,
> +       .version = LPASS_CODEC_VERSION_1_0,
>  };
>
>  static const struct va_macro_data sm8450_va_data = {
> @@ -1587,7 +1589,14 @@ static int va_macro_probe(struct platform_device *pdev)
>                         goto err_npl;
>         }
>
> -       va_macro_set_lpass_codec_version(va);
> +       /**
> +        * old version of codecs do not have a reliable way to determine the
> +        * version from registers, get them from soc specific data
> +        */
> +       if (data->version)
> +               lpass_macro_set_codec_version(data->version);
> +       else /* read version from register */
> +               va_macro_set_lpass_codec_version(va);
>
>         if (va->has_swr_master) {
>                 /* Set default CLK div to 1 */
> --
> 2.25.1
>
