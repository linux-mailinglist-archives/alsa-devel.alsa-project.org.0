Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 961CB8D4A06
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 13:04:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D65284C;
	Thu, 30 May 2024 13:04:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D65284C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717067053;
	bh=i/cH1Oed34nB4rUVqJOO34KFhysDv2OP2yNOxaD2bRU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QWaaPyUA/UzbuvTp6IkNd/T1EpoGg6enIzm3jCxjMsWD6TnmnOvbCFwzprNI550/O
	 xoMd/b3+pw1JITTVMM2SS4xWjMp224XZKkT6HdU3qpDlGSondnYCLDIbmqbk80JABf
	 qncmi37ajQ6uSXVWImJcLcwZOKDybUxyv1ywLss8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DE66F80588; Thu, 30 May 2024 13:03:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2E71F80589;
	Thu, 30 May 2024 13:03:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BCE1F80149; Thu, 30 May 2024 13:03:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A139F800AC
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 13:03:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A139F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=R4rDpLf6
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a6303e13ffeso68627966b.3
        for <alsa-devel@alsa-project.org>;
 Thu, 30 May 2024 04:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717066981; x=1717671781;
 darn=alsa-project.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IN8Ag9dsU+qcO8AbayqXPvzgIuVH1q2hLdD6f3uNqMk=;
        b=R4rDpLf6SR2MmRfD9JKicTwX6JVYqlB0U2FIj6eGcXYm/C9UOzOI3o6N1Em+kRMBy6
         B6rulCLs/24wnKeNBl+VEZZEC4ONWNPzB+oRN2Q6D1GCPq7neTpVb5s9144PJRHmrKHP
         G/qV4zpINxgyUYUVLO4oIHqChBWgKg6m3/EE0QKVvRlM3Dsu/DC2AvsWM7CYzLPOXIWB
         guKmWy1ABgrLCXlNBk9xKlK4CrOmqGGAVNHYtocNr7qLiaOv7jv/JB5GI4eElx3o/KPt
         lI+G+YTb2ozwOCW2aKjz7+keEDqxrs9vuR8c61afBoXRXnkwrwvfYHy+kX3jAn0MbttH
         3G/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717066981; x=1717671781;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IN8Ag9dsU+qcO8AbayqXPvzgIuVH1q2hLdD6f3uNqMk=;
        b=NJbsmQ4wiJ/RZr6oIoxlImG4YX55WFkshhugWZjvtwujZuL6kIjMBcGHsoEd9DjzOl
         VTobe6Jcsc/y5ntiBRra4Mbd3qEhW2Oj583JfikQPDwTOGl8jJH2ms313h/rIaaSWjc4
         qRVLKPP2fk5+dAAKFRgUFLQtkvZQ2YBq8Q6UTXAsx87MzMjR5gOqw9JrGMMYnLwFz+Ax
         Rx6VtdtbJC/UeNpU0gWGEi9MBbav7NjBNdb7U/r+aNdA080S1lwaxFBYJNcWjnglh2AG
         pe1jtgyXEHDuDPYGnWGfPthwvCJB6aRwIHxgjxYx4KyGGGhL3Qtd7L7FczctVY/ik63D
         FxVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv33rf4U0ZzBdgVwVpbPcsne2lVe4nWluZAHHNc4OGK+qWMvvfbsnaRkOEOzEJYrFel3elNim8xYa7f6h7JRL2/pCx0jBFwcLzqvg=
X-Gm-Message-State: AOJu0YxS5yaozCLqU4C39X1hxpB4vhVmtZreWoeC9omJXzLihmf1E8x7
	3vdyCqkTcsFCFT/Fq98ZdKA+g3LLePCMNKTH95Gci8C4SwZiNRby
X-Google-Smtp-Source: 
 AGHT+IHcCmk/btCzRhf9yemPdTTGPMH1O3rBjgm7CRQKcXYJ1AMKlRTHe3fRaWloMB1fhTa7FypVIA==
X-Received: by 2002:a17:907:cc19:b0:a65:d7f7:f3f5 with SMTP id
 a640c23a62f3a-a65e8d3653amr95250066b.8.1717066980545;
        Thu, 30 May 2024 04:03:00 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc8c1a1sm807898066b.166.2024.05.30.04.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 04:03:00 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=b04e15e85d503ad3de99a862da1f51c734f1e4825c9724c1f5249d05531d;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Thu, 30 May 2024 13:02:59 +0200
Message-Id: <D1MXG0PGXQW8.2GBRKOVBQM49H@gmail.com>
Cc: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <lgirdwood@gmail.com>, <jonathanh@nvidia.com>, <mkumard@nvidia.com>
Subject: Re: [PATCH v2 1/2] ASoC: simple-card-utils: Split
 simple_fixup_sample_fmt func
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Sameer Pujar" <spujar@nvidia.com>, <broonie@kernel.org>,
 <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240527125608.2461300-1-spujar@nvidia.com>
 <20240527125608.2461300-2-spujar@nvidia.com>
In-Reply-To: <20240527125608.2461300-2-spujar@nvidia.com>
Message-ID-Hash: ONWVOQVXQE3ZMMKJ7AOUC3SY2QL7BPSZ
X-Message-ID-Hash: ONWVOQVXQE3ZMMKJ7AOUC3SY2QL7BPSZ
X-MailFrom: thierry.reding@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ONWVOQVXQE3ZMMKJ7AOUC3SY2QL7BPSZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--b04e15e85d503ad3de99a862da1f51c734f1e4825c9724c1f5249d05531d
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon May 27, 2024 at 2:56 PM CEST, Sameer Pujar wrote:
> From: Mohan Kumar <mkumard@nvidia.com>
>
> Split the simple_fixup_sample_fmt() into two functions by adding
> one more function named simple_util_get_sample_fmt() to return
> the sample format value.
>
> This is useful for drivers that wish to simply get the sample format
> without setting the mask.
>
> Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  include/sound/simple_card_utils.h     |  2 ++
>  sound/soc/generic/simple-card-utils.c | 26 ++++++++++++++++++++------
>  2 files changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_car=
d_utils.h
> index ad67957b7b48..2c2279d082ec 100644
> --- a/include/sound/simple_card_utils.h
> +++ b/include/sound/simple_card_utils.h
> @@ -174,6 +174,8 @@ void simple_util_parse_convert(struct device_node *np=
, char *prefix,
>  			       struct simple_util_data *data);
>  bool simple_util_is_convert_required(const struct simple_util_data *data=
);
> =20
> +int simple_util_get_sample_fmt(struct simple_util_data *data);
> +
>  int simple_util_parse_routing(struct snd_soc_card *card,
>  				      char *prefix);
>  int simple_util_parse_widgets(struct snd_soc_card *card,
> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/si=
mple-card-utils.c
> index 81077d16d22f..f1f5a1c025fc 100644
> --- a/sound/soc/generic/simple-card-utils.c
> +++ b/sound/soc/generic/simple-card-utils.c
> @@ -13,12 +13,11 @@
>  #include <sound/pcm_params.h>
>  #include <sound/simple_card_utils.h>
> =20
> -static void simple_fixup_sample_fmt(struct simple_util_data *data,
> -					 struct snd_pcm_hw_params *params)
> +int simple_util_get_sample_fmt(struct simple_util_data *data)
>  {
>  	int i;
> -	struct snd_mask *mask =3D hw_param_mask(params,
> -					      SNDRV_PCM_HW_PARAM_FORMAT);
> +	int val =3D -EINVAL;
> +
>  	struct {
>  		char *fmt;
>  		u32 val;
> @@ -33,11 +32,26 @@ static void simple_fixup_sample_fmt(struct simple_uti=
l_data *data,
>  	for (i =3D 0; i < ARRAY_SIZE(of_sample_fmt_table); i++) {
>  		if (!strcmp(data->convert_sample_format,
>  			    of_sample_fmt_table[i].fmt)) {
> -			snd_mask_none(mask);
> -			snd_mask_set(mask, of_sample_fmt_table[i].val);
> +			val =3D of_sample_fmt_table[i].val;
>  			break;
>  		}
>  	}
> +	return val;
> +}
> +EXPORT_SYMBOL_GPL(simple_util_get_sample_fmt);
> +
> +static void simple_fixup_sample_fmt(struct simple_util_data *data,
> +				    struct snd_pcm_hw_params *params)
> +{
> +	int val;
> +	struct snd_mask *mask =3D hw_param_mask(params,
> +					      SNDRV_PCM_HW_PARAM_FORMAT);
> +
> +	val =3D simple_util_get_sample_fmt(data);
> +	if (val >=3D 0) {

Maybe nothing that we need to worry about, but this could be potentially
a problem if the snd_pcm_format_t ever outgrows the non-negative number
space. snd_pcm_format_t is defined to be an int as well, so any very
large number would wrap into a negative value and then would be
considered an error in this check.

Then again, if that ever were to happen, we'd likely get a compiler
error for the snd_pcm_format_t overflowing, so we'd probably notice and
rewrite at that point.

So I suppose:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--b04e15e85d503ad3de99a862da1f51c734f1e4825c9724c1f5249d05531d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYXOMACgkQ3SOs138+
s6Hq1Q/+O1LuOBIU5Ga0AXMC62PY26RnEsxrv6TJtxcqwaolgwRpZlyOUDAzVvsg
ltAPTkzGEK3kTTeilIIMN2ZXK6fmMYH9qwF8AebVBUtNhRqIo/UnQsz9O6gzxPMa
ZbpfwO/MZGm06ZcKidnTDmLtRotFEx/6o0LW/tJhabOow998nCrD1yGdq3oXGFRC
lqovd9U1RoeI5IP4r3zJpJ5GbYSc/a9K04vqwq9nkvClx2xNoA03KuHce2FtkjAj
R6xknIHgcSKHIoh82lQE6pDOPt26+/Fd80b5UwqRtr74IRiUmJOboRxWKMqoJNiY
TQgIE5PN0R1OGKzrBLb/0kMLXM+VYa5LJKQMxI9FWTWNVx0B79Vyrb1lE8hMpcgE
yRuvzBHWeYedzriZDJgwEdVVayBf2u2rAoXTRGRtuBAmywtoek3oakbPxYArfnXb
fjtgV3wq9x/37DJZtPVKBU57IOxu/Pbz2SqWdw81b8DfT931IPeq4sMn+0rnv15m
zXuIMuqKefis9QMHAEmLjsCfPCnDmZCdXQdELspUMXNBprZNYrOmFctd4xStilvs
WKsKuAk0Kgox0qGDKM8fPH2F8LexSIZc41UT1EgLTlO1bZ9keROIUCoFpReQg0ET
xv/16iwcHORl2WGuLvkvBIWQ/AISHDJB8czKV3OB15j2vWTwxz8=
=dpDb
-----END PGP SIGNATURE-----

--b04e15e85d503ad3de99a862da1f51c734f1e4825c9724c1f5249d05531d--
