Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AD04B99E7
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 08:36:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A95A818F8;
	Thu, 17 Feb 2022 08:35:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A95A818F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645083376;
	bh=/VOyMnc8qNs9Goprscke0HifeA/+0gM/2Q4ClEizzOg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dPguqmbKrMJnTbMimOj3EzQ2Px4KaBGo7wpOrpEtte7AboT/QZJ+aQEHtCHmgWUza
	 GRkhA6VRAPLnMdMU2FWZQzOTU7d700QxqWDBItfLgJ5pLGRifcMNJyCidT3JFTgv72
	 4wl6jHzg3B6x2oZijQzl4fCQEPiov/O3EAT5JCV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20608F800C0;
	Thu, 17 Feb 2022 08:35:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FF21F80240; Thu, 17 Feb 2022 08:35:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAA95F800C0
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 08:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAA95F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="po2VcBKQ"
Received: by mail-wr1-x429.google.com with SMTP id e3so7450688wra.0
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 23:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xPL+09khBYV8RItKtpzdQuIqr8WWC0DLKqJPTa3LDKw=;
 b=po2VcBKQKTamBBBBaXEQhUyyZbCWMQux6CI+7Qrkva5Bj4pzsuE87SAnqEwNj4V1Ga
 RJOnxqn90soXyp3/xLT5xQMwiyDD+Ve/3Qi9F7SshuX43g1SusUC4tkbcxAs0F4VR8Kz
 ptxToypmbaHTKb+FOcTgd0i4CWay8lxRZViii5WI0KZjuwSU/o2e1D3BABfh1PLS16IY
 7Xdxu2sq75ARv1Ys466UjviCKYMW3CHtxLjzIA50bW7Tlv09LW4+96jN4MaeGdyNz+RV
 v7GV3HLMwrcj4o9wCIFdj4gD2MQlcwhaRbDAA6K8x+J+j2+DxDlzUKzRhlFqlXtxMZ4O
 Ah/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xPL+09khBYV8RItKtpzdQuIqr8WWC0DLKqJPTa3LDKw=;
 b=eAyLrD7KwaFKrlb7Q5PttwRXB0ZyCRpzQ5kvjF9G4Yoo026SlB59qgKasrgXv0B2Py
 GzUoFAqhttRyH77YnAIC2zdQlhPYM10tI882ORUC1p891eufu0q1BuPnV+GcQy9LGMHp
 vgflmhh1ry1cQfEAT76IU+kj78gQXJOxiJOoaHMQJ4J/OcVbpVol1kGqRNzfBAiENh4L
 nMqfw7d3U7e/f7yHe98kzHwVPFphwLs0WJ/0R2RbbRITqRXno0I/XWZ07RBrCc3I6mRR
 lVu1HUTAlxLBplLbDBnEEoNhyQ6yf8DALBtbsPGQtOVRa7gtThUkgLv6tfbDE74gjfyo
 isOQ==
X-Gm-Message-State: AOAM530VaJDqLPSqThA1r5nBzn6ah/vtetQl2r2PSRztAe0NhcNrTVqN
 X0iv9vjFJRWj9iOGcKMF0x4=
X-Google-Smtp-Source: ABdhPJxhGgAhRLb4mOGFtIHKutI5wjGBXoSwwtqIMocgzYakd20/sX20pkYG0oJAAmM5fSBjnhp38w==
X-Received: by 2002:a5d:5221:0:b0:1d9:2680:5fb with SMTP id
 i1-20020a5d5221000000b001d9268005fbmr1243143wra.23.1645083300515; 
 Wed, 16 Feb 2022 23:35:00 -0800 (PST)
Received: from orome (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de.
 [2003:e4:1f0a:6900::43a])
 by smtp.gmail.com with ESMTPSA id ba14sm15366890wrb.56.2022.02.16.23.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 23:34:59 -0800 (PST)
Date: Thu, 17 Feb 2022 08:34:57 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: Add Tegra234 APE support
Message-ID: <Yg36oUdUiB/H+Ngf@orome>
References: <1643373476-8538-1-git-send-email-spujar@nvidia.com>
 <1643373476-8538-3-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Bq7R2hPdkx7Mharn"
Content-Disposition: inline
In-Reply-To: <1643373476-8538-3-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/2.2 (7160e05a) (2022-02-12)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, linux-tegra@vger.kernel.org,
 jonathanh@nvidia.com, mkumard@nvidia.com
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


--Bq7R2hPdkx7Mharn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2022 at 06:07:53PM +0530, Sameer Pujar wrote:
> Add clocks, power-domain and memory bindings to support APE subsystem
> on Tegra234.
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  include/dt-bindings/clock/tegra234-clock.h     | 74 ++++++++++++++++++++=
+++++-
>  include/dt-bindings/memory/tegra234-mc.h       |  7 +++
>  include/dt-bindings/power/tegra234-powergate.h |  9 ++++
>  3 files changed, 89 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/power/tegra234-powergate.h
[...]
> diff --git a/include/dt-bindings/memory/tegra234-mc.h b/include/dt-bindin=
gs/memory/tegra234-mc.h
> index 2662f70..444e62d 100644
> --- a/include/dt-bindings/memory/tegra234-mc.h
> +++ b/include/dt-bindings/memory/tegra234-mc.h
> @@ -1,4 +1,5 @@
>  /* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/* Copyright (c) 2018-2022, NVIDIA CORPORATION. All rights reserved. */
> =20
>  #ifndef DT_BINDINGS_MEMORY_TEGRA234_MC_H
>  #define DT_BINDINGS_MEMORY_TEGRA234_MC_H
> @@ -7,6 +8,8 @@
>  #define TEGRA234_SID_INVALID		0x00
>  #define TEGRA234_SID_PASSTHROUGH	0x7f
> =20
> +/* NISO0 stream IDs */
> +#define TEGRA234_SID_APE	0x02
> =20
>  /* NISO1 stream IDs */
>  #define TEGRA234_SID_SDMMC4	0x02
> @@ -20,6 +23,10 @@
>  #define TEGRA234_MEMORY_CLIENT_SDMMCRAB 0x63
>  /* sdmmcd memory write client */
>  #define TEGRA234_MEMORY_CLIENT_SDMMCWAB 0x67
> +/* Audio Processing (APE) engine read clients */
> +#define TEGRA234_MEMORY_CLIENT_APER 0x7a
> +/* Audio Processing (APE) engine write clients */
> +#define TEGRA234_MEMORY_CLIENT_APEW 0x7b
>  /* BPMP read client */
>  #define TEGRA234_MEMORY_CLIENT_BPMPR 0x93
>  /* BPMP write client */

This usually needs to be accompanied by a corresponding addition to the
memory controller driver. Unfortunately it seems like the changes
targetted at v5.17-rc1 never made it upstream, so I've queued them up
again for v5.18-rc1. They should show up in today's linux-next. When
they do, can you please follow up with a patch to the memory controller
driver that adds the various registers for these clients?

Thanks,
Thierry

--Bq7R2hPdkx7Mharn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIN+p4ACgkQ3SOs138+
s6HXzg/+Pt32PqWtDsespPZuvsrN9+Q2VO1sd3mIrkZIHBZFTPHrIEo0LSpJFuwB
4cjq/re93NRotAh3oOc9UbEhXLCq7sGMpUqFMiwvASLqLOJ+O1EJnokqyqrxXXlm
T407gBsg/+95avKFbgoOCC+D+5nK48HziZL1BLyFBj2jRbkFH08uPcHRWcj25kPh
ANh1sejoM+GIa7t6dARwh0jX5QdZCErIM7jCL2uHKH5dJawCclfNNv1qsMTqIol/
F17NEcLjtC3XrZ00JB6akE2r8iLdga0PO8QyE8c1REWTvwD3KFqkKorw9Tup5/u/
i0JzJi0dsf6yTT/IAPjMUOU2HlEmmbgHWkvBw4MaLJYlefq5/XQQgEXpcKYcPo0Y
y1C9XWyNfRbdn8yM6JLP5LHo8UdvNV1mZFZf+LMoQ3VbIcl9sbPRgvP7Sc8LoT61
1tDmq3yW9ViRj9XHdvlhDGt2yipDTEG9LLn6XwpxcOpWHAa/UuSLtEzF362YLvZ9
mZXAewuzIGWzOHxKT9h3F8rSr6J8Ep8pS2M4i1YyQwIS+CWhIdL5Q6OdU0QS6aaO
po2J0PR8FQ1PZaLnikMHz1/potg/8+SzmKrUI3HuJSNa2ImpDdU8+msJJLtimjLh
4U6UwCfQXuGhttj/rv3S4F/TTBlFhXV00TY2J6Ow4AAZ1R36raM=
=udsN
-----END PGP SIGNATURE-----

--Bq7R2hPdkx7Mharn--
