Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CD788C6C9
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 16:24:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 775482BBE;
	Tue, 26 Mar 2024 16:24:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 775482BBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711466671;
	bh=+K8e/fYuyVDvRpEXJ6MEqprpqClNLUw96QDT9d7KkGw=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RKEkg5mwsp6LkKnDFlNIKGotlq6Ora2FpiGxQG1pqZRkgxL9IuE4IJ+CsSvYAxpne
	 3VDFFZjfQ8kRgvqoxQf1V74GWfz1iGqz1zAAyuQDSdW6geKgscMeo1M9SvcB76CLr9
	 9vkvdUXui81o82Ttbmcnn/Wp9RjoCnsLhvpaYHhw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72B49F805AB; Tue, 26 Mar 2024 16:24:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF80CF8057F;
	Tue, 26 Mar 2024 16:23:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16771F802DB; Tue, 26 Mar 2024 16:23:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDC5DF801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 16:23:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDC5DF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Q9rvPhJQ
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-34005b5927eso3959735f8f.1
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Mar 2024 08:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711466622;
 x=1712071422; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=aM+9RXmEYQB5vl1fffTAMXMZVqZ/ACCmOiJ2FPQkdAA=;
        b=Q9rvPhJQ5nobQ/+o1gz4Gk952eptKp2q0P0SNK/zA4pQLVyOchm2ynVz7X68zO5f3W
         7CQCkD+cbhc43XOV3uqLVtfAr0cR54SxSfVSPERumB6hwVtRiDQO42g91kvCzwCyLXXv
         i46cN1vHJAGlS7LA4pAAAf4buszNf4VmI1FBJ/mYIVLJRoTE+3B7EW1o0G3n+8DYrnhO
         OHnlhUE5X2RLHs2Zq+QImppywM/X6cS6e0SgJd47a4hPQmuhmeWdfl684sXmDQWFtCsQ
         WPchEF1tz1HFLYVOMkCFOZUQVrU+QquaLyofPlH/UO0m93v2D+Atr0BRc9ROdACLGkF4
         I9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711466622; x=1712071422;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aM+9RXmEYQB5vl1fffTAMXMZVqZ/ACCmOiJ2FPQkdAA=;
        b=LHnReKW7Yxug9Jhcti/wAuv4aFPfkFRacwC/prOytwDDUXECy+goTJwD4xcF26oMlu
         3+/k8AZVvA+hx/mvXmwj0P9KO8fx//n+yP7zz8jD9zWQQJ2LFtNbFwElRAHwV7C5KU+m
         Suv7vcJUTK3JbOHNFlmXWKlNUTVGBH2HIHh6plxJ6buIkKBxfh0GIq7267wEKfhIzGmQ
         zgDvYSqE4KvG2t+pU12vR8Huc/4rkKdEiWNWRx4eQNlxyRlmUjUkNW7tcKHrcqjfCZ0s
         qSfo4wjAutbxs39rL3b4y3qI6/4wP1EtCZmlIwNgkVdx3PqhqDPjVuVsuc4SCjDXmK/D
         +i2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1ILLCs9GChogI33+95uXtQapOI/u13o+As1gRH9qlYnOHwI7Ar/+bahGiXWWTAvvl+5V7YKHkM9bIeVf5PQ3ZIwjs2MxEVg6aDuo=
X-Gm-Message-State: AOJu0YyB/koR1PcWrAlBjjNF/nwiV4l4aamHNc3NnrxYFRm2496xG0mi
	HFGnonqNDXdk04Wf3VzkQwlahWG+PgtofVtugLk3L33dXK68quYyczq6W0Q6H1U=
X-Google-Smtp-Source: 
 AGHT+IHsYZJ/uOqZnp1TmWFGMlVgZ+AivccEHh8xx3hUmGEHsDKWJ4EN0Xf/+CitijnbkfltJZVucg==
X-Received: by 2002:a5d:69ca:0:b0:33e:7adc:516c with SMTP id
 s10-20020a5d69ca000000b0033e7adc516cmr1290781wrw.57.1711466621739;
        Tue, 26 Mar 2024 08:23:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:97a2:bb9f:463a:6468])
        by smtp.gmail.com with ESMTPSA id
 ch9-20020a5d5d09000000b00341c6778171sm8083186wrb.83.2024.03.26.08.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:23:41 -0700 (PDT)
References: <20240325235311.411920-1-jan.dakinevich@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2] ASoC: meson: g12a-toacodec: rework the
 definition of bits
Date: Tue, 26 Mar 2024 16:15:51 +0100
In-reply-to: <20240325235311.411920-1-jan.dakinevich@salutedevices.com>
Message-ID: <1j34sd9fur.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: UINEIWU4JJIOALZYBC6NYTK3OR3TMKY3
X-Message-ID-Hash: UINEIWU4JJIOALZYBC6NYTK3OR3TMKY3
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UINEIWU4JJIOALZYBC6NYTK3OR3TMKY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue 26 Mar 2024 at 02:53, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> There is a lot of defines, but almost all of them are not used. Lets
> rework them:

Thanks for noticing. Please start by removing what's unused.

>
>  - keep separate the definition for different platforms to make easier
>    checking that they match documentation.
>
>  - use LSB/MSB sufixes for uniformity.

I'd be in favor of dropping these suffixes completely.

>
>  - don't use hard-coded values for already declared defines.
>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
> Links:
>
>  [1] https://lore.kernel.org/lkml/20240314232201.2102178-1-jan.dakinevich@salutedevices.com/
>
> Changes v1 -> v2:
>  - Detached from v1's series (patch 7).
>  - Fixed my wrong understanding of SOC_SINGLE's input parameters.
>
>  sound/soc/meson/g12a-toacodec.c | 79 ++++++++++++++++++++-------------
>  1 file changed, 49 insertions(+), 30 deletions(-)
>
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 531bb8707a3e..22181f4bab72 100644
> --- a/sound/soc/meson/g12a-toacodec.c
> +++ b/sound/soc/meson/g12a-toacodec.c
> @@ -20,26 +20,37 @@
>  #define G12A_TOACODEC_DRV_NAME "g12a-toacodec"
>  
>  #define TOACODEC_CTRL0			0x0
> -#define  CTRL0_ENABLE_SHIFT		31
> -#define  CTRL0_DAT_SEL_SM1_MSB		19
> -#define  CTRL0_DAT_SEL_SM1_LSB		18
> -#define  CTRL0_DAT_SEL_MSB		15
> -#define  CTRL0_DAT_SEL_LSB		14
> -#define  CTRL0_LANE_SEL_SM1		16
> -#define  CTRL0_LANE_SEL			12
> -#define  CTRL0_LRCLK_SEL_SM1_MSB	14
> -#define  CTRL0_LRCLK_SEL_SM1_LSB	12
> -#define  CTRL0_LRCLK_SEL_MSB		9
> -#define  CTRL0_LRCLK_SEL_LSB		8
> -#define  CTRL0_LRCLK_INV_SM1		BIT(10)
> -#define  CTRL0_BLK_CAP_INV_SM1		BIT(9)
> -#define  CTRL0_BLK_CAP_INV		BIT(7)
> -#define  CTRL0_BCLK_O_INV_SM1		BIT(8)
> -#define  CTRL0_BCLK_O_INV		BIT(6)
> -#define  CTRL0_BCLK_SEL_SM1_MSB		6
> -#define  CTRL0_BCLK_SEL_MSB		5
> -#define  CTRL0_BCLK_SEL_LSB		4
> -#define  CTRL0_MCLK_SEL			GENMASK(2, 0)
> +
> +/* Common bits */
> +#define CTRL0_ENABLE_SHIFT		31
> +#define CTRL0_MCLK_SEL			GENMASK(2, 0)
> +
> +/* G12A bits */
> +#define CTRL0_DAT_SEL_G12A_MSB		15
> +#define CTRL0_DAT_SEL_G12A_LSB		14
> +#define CTRL0_LANE_SEL_G12A_MSB		13
> +#define CTRL0_LANE_SEL_G12A_LSB		12
> +#define CTRL0_LANE_SEL_G12A_MAX		3
> +#define CTRL0_LRCLK_SEL_G12A_MSB	9
> +#define CTRL0_LRCLK_SEL_G12A_LSB	8
> +#define CTRL0_BLK_CAP_INV_G12A		BIT(7)
> +#define CTRL0_BCLK_O_INV_G12A		BIT(6)
> +#define CTRL0_BCLK_SEL_G12A_MSB		5
> +#define CTRL0_BCLK_SEL_G12A_LSB		4
> +
> +/* SM1 bits */
> +#define CTRL0_DAT_SEL_SM1_MSB		19
> +#define CTRL0_DAT_SEL_SM1_LSB		18
> +#define CTRL0_LANE_SEL_SM1_MSB		17
> +#define CTRL0_LANE_SEL_SM1_LSB		16
> +#define CTRL0_LANE_SEL_SM1_MAX		3
> +#define CTRL0_LRCLK_SEL_SM1_MSB		14
> +#define CTRL0_LRCLK_SEL_SM1_LSB		12
> +#define CTRL0_LRCLK_INV_SM1		BIT(10)
> +#define CTRL0_BLK_CAP_INV_SM1		BIT(9)
> +#define CTRL0_BCLK_O_INV_SM1		BIT(8)
> +#define CTRL0_BCLK_SEL_SM1_MSB		6
> +#define CTRL0_BCLK_SEL_SM1_LSB		4
>  
>  #define TOACODEC_OUT_CHMAX		2
>  
> @@ -108,7 +119,7 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
>  }
>  
>  static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
> -			    CTRL0_DAT_SEL_LSB,
> +			    CTRL0_DAT_SEL_G12A_LSB,
>  			    g12a_toacodec_mux_texts);
>  
>  static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0,
> @@ -210,7 +221,7 @@ static int g12a_toacodec_component_probe(struct snd_soc_component *c)
>  {
>  	/* Initialize the static clock parameters */
>  	return snd_soc_component_write(c, TOACODEC_CTRL0,
> -				       CTRL0_BLK_CAP_INV);
> +				       CTRL0_BLK_CAP_INV_G12A);
>  }
>  
>  static int sm1_toacodec_component_probe(struct snd_soc_component *c)
> @@ -229,11 +240,13 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
>  };
>  
>  static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
> -	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_G12A_LSB,
> +		   CTRL0_LANE_SEL_G12A_MAX, 0),
>  };
>  
>  static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
> -	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1_LSB,
> +		   CTRL0_LANE_SEL_SM1_MAX, 0),
>  };
>  
>  static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
> @@ -266,16 +279,22 @@ static const struct regmap_config g12a_toacodec_regmap_cfg = {
>  
>  static const struct g12a_toacodec_match_data g12a_toacodec_match_data = {
>  	.component_drv	= &g12a_toacodec_component_drv,
> -	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 14, 15),
> -	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 8, 9),
> -	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 5),
> +	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_G12A_LSB,
> +				    CTRL0_DAT_SEL_G12A_MSB),
> +	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_G12A_LSB,
> +				     CTRL0_LRCLK_SEL_G12A_MSB),
> +	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_G12A_LSB,
> +				    CTRL0_BCLK_SEL_G12A_MSB),
>  };
>  
>  static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
>  	.component_drv	= &sm1_toacodec_component_drv,
> -	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 18, 19),
> -	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
> -	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
> +	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_SM1_LSB,
> +				    CTRL0_DAT_SEL_SM1_MSB),
> +	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_SM1_LSB,
> +				     CTRL0_LRCLK_SEL_SM1_MSB),
> +	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_SM1_LSB,
> +				    CTRL0_BCLK_SEL_SM1_MSB),

Those defines are already platform specific by the structure holding
them and the defines you have added are not helping readability.

I don't see the point to see.
I'd prefer to keep the field defined as they are.

>  };
>  
>  static const struct of_device_id g12a_toacodec_of_match[] = {


-- 
Jerome
