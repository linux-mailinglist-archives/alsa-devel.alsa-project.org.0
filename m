Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE6A7CC615
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 16:42:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BFD2836;
	Tue, 17 Oct 2023 16:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BFD2836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697553734;
	bh=f9d0zGBhs00nFFQclzyYWTcvhKNRisLZnjvZjUAgmI4=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aHh8971O/RjEYaL/e52ZhLTFzT5cH64iWPQaIf9Fgqw3Sh6ZjpIquyX+Yg7lb/2Q3
	 JFqua8oh3FHUbtGe3HuwqnzQulRSb5o+rRJ+baFLToRkYxL/VPnsCAzRiIoc8lOcLK
	 hKMeZJDov8+OEbJP2xHrZSPMcVdQPp3AVwuqSZjA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2AD0F8019B; Tue, 17 Oct 2023 16:41:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EE80F8024E;
	Tue, 17 Oct 2023 16:41:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FF8EF8025F; Tue, 17 Oct 2023 16:41:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0E9FF80236
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 16:41:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0E9FF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=aI9CQqS9
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3296b49c546so4628821f8f.3
        for <alsa-devel@alsa-project.org>;
 Tue, 17 Oct 2023 07:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697553667;
 x=1698158467; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeSuhOAfe8uX1nxMYhxXrKrbGF4+PCa5XD6SY0VOMwo=;
        b=aI9CQqS9GCgZzOHzc+7KrIk8L7keEdH2tfvq/zSyZOt1fJvh3uNi61eFs1aZdXT3Pc
         tI7a/rAPLVTsJWT5nfPeupRPMiRFt44pfOvkVV7iSkpKbq7LIt2EgiElj6JgXu73++Nt
         A37JMsXhNW2rXjStcRAvGuCwwl+gjhfK+Lc0vdqUdqgXRkqHu0xN6/YzLGPGYQYXPi09
         OwSdJvwPgCv09AMs3P9ftx5OUkH5Zg64z6h7My4JlV+BzxYBeZgUkDxIGuqtff/bl/Y3
         zF8bvkDnFfT3mlMPXnUGpr7aau9A7i5ng3mK3eAFTbcQ+B+fNVHabcMwLt/PYHyDjP7/
         Zm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697553667; x=1698158467;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NeSuhOAfe8uX1nxMYhxXrKrbGF4+PCa5XD6SY0VOMwo=;
        b=fvk0DFLT4LGBumjYUDqhZrbA80oIzegGL2zoJRGN3p4721dTVTdIUCA7oUjaFlIe+t
         8gRNuC9FmE6zzFCnPTkchEnppfkc8TWeY6yO5q3/EVYrWk+zxErPjoKEDwHF+g21gBqe
         IgLDMKE1QFvaxrQS0OE8xutpdlMgFKxXe2cVkZsv48M55/X4pRwIcb9g+g4VROIk2t+1
         me/lxET7q+lN0t+mAjYlqyLvfXShPzD3vP6j+0hTDM9/UaepoG58/H+X/Z5AlcLedB6J
         hn8u7ZZpzmkeXXlOpREJHQ5xO8jbzQdZtO8Ud8WCSMAaIE6XcU0t6u+VKr59lggkX8/x
         aUcQ==
X-Gm-Message-State: AOJu0YwEiuV6ONcbS7CTRqrQJz9NCZLwZw/aYUz7pvB5oIpw+epyAeU0
	xCd48nrs9j82wQ1MzYmcVKG2VQ==
X-Google-Smtp-Source: 
 AGHT+IHhrchh4iIbdk+aSFRRGdmVqCLZoJcJXWRoGMfMw5EbnIjIa1N2pkVKS00Q7mYarILCif/Z/w==
X-Received: by 2002:a5d:4e90:0:b0:32d:a4c4:f700 with SMTP id
 e16-20020a5d4e90000000b0032da4c4f700mr2208044wru.38.1697553666986;
        Tue, 17 Oct 2023 07:41:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:93d3:2aab:95bb:3a09])
        by smtp.gmail.com with ESMTPSA id
 q6-20020a5d6586000000b00317a04131c5sm1825996wru.57.2023.10.17.07.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 07:41:06 -0700 (PDT)
References: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
 <20231013221945.1489203-14-u.kleine-koenig@pengutronix.de>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Liam
 Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 kernel@pengutronix.de
Subject: Re: [PATCH 5/7] ASoC: meson: Make meson_card_remove() return void
Date: Tue, 17 Oct 2023 16:40:41 +0200
In-reply-to: <20231013221945.1489203-14-u.kleine-koenig@pengutronix.de>
Message-ID: <1j7cnluxa6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: XV4SMS4PPE47WPYYIDZOSLLC2UD3C43Q
X-Message-ID-Hash: XV4SMS4PPE47WPYYIDZOSLLC2UD3C43Q
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XV4SMS4PPE47WPYYIDZOSLLC2UD3C43Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Sat 14 Oct 2023 at 00:19, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutr=
onix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code.  However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> meson_card_remove() returned zero unconditionally. Make it return void
> instead and convert all users to struct platform_device::remove_new().
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/axg-card.c         | 2 +-
>  sound/soc/meson/gx-card.c          | 2 +-
>  sound/soc/meson/meson-card-utils.c | 4 +---
>  sound/soc/meson/meson-card.h       | 2 +-
>  4 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
> index 18b16274449e..3180aa4d3a15 100644
> --- a/sound/soc/meson/axg-card.c
> +++ b/sound/soc/meson/axg-card.c
> @@ -360,7 +360,7 @@ MODULE_DEVICE_TABLE(of, axg_card_of_match);
>=20=20
>  static struct platform_driver axg_card_pdrv =3D {
>  	.probe =3D meson_card_probe,
> -	.remove =3D meson_card_remove,
> +	.remove_new =3D meson_card_remove,
>  	.driver =3D {
>  		.name =3D "axg-sound-card",
>  		.of_match_table =3D axg_card_of_match,
> diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
> index 01beac1d927f..f1539e542638 100644
> --- a/sound/soc/meson/gx-card.c
> +++ b/sound/soc/meson/gx-card.c
> @@ -130,7 +130,7 @@ MODULE_DEVICE_TABLE(of, gx_card_of_match);
>=20=20
>  static struct platform_driver gx_card_pdrv =3D {
>  	.probe =3D meson_card_probe,
> -	.remove =3D meson_card_remove,
> +	.remove_new =3D meson_card_remove,
>  	.driver =3D {
>  		.name =3D "gx-sound-card",
>  		.of_match_table =3D gx_card_of_match,
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-c=
ard-utils.c
> index c81099218597..ed6c7e2f609c 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -327,13 +327,11 @@ int meson_card_probe(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(meson_card_probe);
>=20=20
> -int meson_card_remove(struct platform_device *pdev)
> +void meson_card_remove(struct platform_device *pdev)
>  {
>  	struct meson_card *priv =3D platform_get_drvdata(pdev);
>=20=20
>  	meson_card_clean_references(priv);
> -
> -	return 0;
>  }
>  EXPORT_SYMBOL_GPL(meson_card_remove);
>=20=20
> diff --git a/sound/soc/meson/meson-card.h b/sound/soc/meson/meson-card.h
> index a5374324a189..a0d693e4f460 100644
> --- a/sound/soc/meson/meson-card.h
> +++ b/sound/soc/meson/meson-card.h
> @@ -49,6 +49,6 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
>  			   bool is_playback);
>=20=20
>  int meson_card_probe(struct platform_device *pdev);
> -int meson_card_remove(struct platform_device *pdev);
> +void meson_card_remove(struct platform_device *pdev);
>=20=20
>  #endif /* _MESON_SND_CARD_H */

