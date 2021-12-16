Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EE44773DF
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 15:01:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D01B1F99;
	Thu, 16 Dec 2021 15:00:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D01B1F99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639663273;
	bh=iSX9H3cMndsPeZXccA2eshknZ/k9JGPkJzSav5vWhGE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BCcc4foXrandUHBLPu9Mh/oZU/ZrZ0enH6Tph94wbyeXJD4sxH17z1lBzF0HBPYFq
	 ciMfl2JvkP2nKC2ov7b5yJATT7c/QbKD169vCF2aNVxUko6GeWeOV6rcOPvQMNx78E
	 QGbiRtGv4AWUPpqrJGBxnhQCSnXPPDF+CC0e7nxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD0B0F8015B;
	Thu, 16 Dec 2021 15:00:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 023A0F8014C; Thu, 16 Dec 2021 15:00:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1653EF800B0
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 14:59:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1653EF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="flpxh0Or"
Received: by mail-wr1-x42d.google.com with SMTP id a9so44370157wrr.8
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 05:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vEL/p+6X4t2RxWiyQBolJiVn1r+GBjsT1ZsJkJj0PPo=;
 b=flpxh0Or0b7P+X7i4LdmbnJYrWfkkN1krgWgekNohPFOYCV/BeW8+4PFx2r+qp/WRY
 GKQYJgImE3HXE+y4A5HuIA6kNZ3LmlAw9IFYi+lO6EZpybHQbVLgYRHBKJdPHU/nonXF
 ZGJjUa3GaSDBf61fX4uPvvrdDTAYhHbsYXUFA7+czDQk6KnFBbvdarSoT18TXEI2kd4p
 53xUMxh+mskr6kZLM9YYeotsFocUf94XPVlSymZBEuCoAbqMGdjvbrxjBXRGXSgPRcFM
 nsM4ApBWhxGYAQcrFOPu9qRfv9N02QfKgPvUOEOx5I1MW6k7/S+iX1urteq6GlBx0dLg
 NOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vEL/p+6X4t2RxWiyQBolJiVn1r+GBjsT1ZsJkJj0PPo=;
 b=jdfEB4kRWRe64sUryRlBMaNV6GupwcCyU62VC3osHuLa7pjUBnlqCoalhCvuMdpLbZ
 ALqxuVGHxD0lcuc3WZQ+IGW31IO9/GfMJ4JvzQehnu2/PHi8xwrtoe6bUWmdWWoicI65
 usKKVlO0a6JdWJ3lc7n0TVFB5K3KRkXzKBKm5L1OPOLp/yBtVYciLvdF0KvDdOmj+7xe
 h/khlG6804gjBjrK2yf6PmfqVacymUlWNfPVNY4T/wjrceUmUdgKbvHA8vUhGy5q7MQg
 mjjbTmSRy5hkgriAXSvkt33gOG/f8ZzljYVj+FAROBpsMMT9aHiB1Cnj4XZZbq4Nv8IO
 CgJg==
X-Gm-Message-State: AOAM530FuicT7lt3DvnhUNLByxG8GsC0iaQf1lcLi2WmF6hgiscj/UyG
 yp8xUMDez6AYTIOUYKoLSJM=
X-Google-Smtp-Source: ABdhPJzm1yiVRK/KgEFXo+3/iCJ3xmvI6CtnldBWGvgBdba8TugGiRs1bmoKZlpDwjIN90mvSarwgQ==
X-Received: by 2002:a05:6000:156c:: with SMTP id
 12mr2694347wrz.104.1639663193349; 
 Thu, 16 Dec 2021 05:59:53 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id j8sm4661904wrh.16.2021.12.16.05.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:59:52 -0800 (PST)
Date: Thu, 16 Dec 2021 14:59:48 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 02/22] ASoC: dt-bindings: tegra20-i2s: Convert to schema
Message-ID: <YbtGVHBogkZG7xEo@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nGNIxp6bVJwYANhE"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-3-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
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


--nGNIxp6bVJwYANhE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:05PM +0300, Dmitry Osipenko wrote:
> Convert NVIDIA Tegra20 I2S binding to schema.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/sound/nvidia,tegra20-i2s.txt     | 30 --------
>  .../bindings/sound/nvidia,tegra20-i2s.yaml    | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra2=
0-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra2=
0-i2s.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.t=
xt b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
> deleted file mode 100644
> index dc30c6bfbe95..000000000000
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -NVIDIA Tegra 20 I2S controller
> -
> -Required properties:
> -- compatible : "nvidia,tegra20-i2s"
> -- reg : Should contain I2S registers location and length
> -- interrupts : Should contain I2S interrupt
> -- resets : Must contain an entry for each entry in reset-names.
> -  See ../reset/reset.txt for details.
> -- reset-names : Must include the following entries:
> -  - i2s
> -- dmas : Must contain an entry for each entry in clock-names.
> -  See ../dma/dma.txt for details.
> -- dma-names : Must include the following entries:
> -  - rx
> -  - tx
> -- clocks : Must contain one entry, for the module clock.
> -  See ../clocks/clock-bindings.txt for details.
> -
> -Example:
> -
> -i2s@70002800 {
> -	compatible =3D "nvidia,tegra20-i2s";
> -	reg =3D <0x70002800 0x200>;
> -	interrupts =3D < 45 >;
> -	clocks =3D <&tegra_car 11>;
> -	resets =3D <&tegra_car 11>;
> -	reset-names =3D "i2s";
> -	dmas =3D <&apbdma 21>, <&apbdma 21>;
> -	dma-names =3D "rx", "tx";
> -};
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.y=
aml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
> new file mode 100644
> index 000000000000..ad43b237d9af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra20-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra20 I2S Controller
> +
> +description: |
> +  The I2S Controller streams synchronous serial audio data between system
> +  memory and an external audio device. The controller supports the I2S L=
eft
> +  Justified Mode, Right Justified Mode, and DSP mode formats.
> +
> +maintainers:
> +  - Thierry Reding <treding@nvidia.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra20-i2s
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: i2s
> +
> +  interrupts:
> +    maxItems: 1

I prefer ordering these by the same order that we typically have in
device tree, so "compatible", "reg", "interrupts", "clocks",
"clock-names", "resets", "reset-names", "dmas", "dma-names". I find
that clearer because it lists the common properties at the top and
the less common ones (such as "dmas") at the bottom.

Anyway, it doesn't really matter, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--nGNIxp6bVJwYANhE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7RlQACgkQ3SOs138+
s6F39g/8Cy821xezorEEzUPmXIFzlPsyeO2N2H+EY19l6SFCrJ0EHpabduqC43rC
g2fcVI0ueQiJUkjZ3NHOqufv3994fF6dJPhN/2ASFCJacvwD0JpYQ231hH7l3Z7l
5X+VfANc2dQErfyMuobk/g2GDEcOlSKb9mEvot/nBI66fzo+NCSl21/lT6w4bruB
JT4b+2ECbjdREcu6gT1yzyOFrbABOiIHRSEno0SZOASiMQDh7xX4i3eaeNKc93gQ
oXWBB7r3NsMoRB/6L4BUuBSLcWnxvAGsw3B57dQQgQt/5pu3uBQSkQTZ1Ds3aOBh
eXerhBJCYopGZAO5iQ3t25O1c3Kg+U9+CFbIQO/wCwVCbVOiPcT5rT3fgC04rqgG
82jW/yJ3eJv5cGV4oFA0NgK21uk2bocAyGOg9II4ewBzjUZQpGQnrJ2OupN7jW/+
8oJmIIMKmLQtsuytx9YHtoWazQ5ewOcKv5y6UOnGB296V2EooxBCqHNdOv1PRF5z
nBNiJlAeuddbeDqB69iVWZ8wyu7q3Jl+jPmLO/9pAO4ta5Bgx6Ain7KrxRhhjYUP
zOIFXcCDepJw4U0m4x5Oou6xG9pseqm9fuYdS6vLMM+dfzXFaVe9aQgWN3kG6aac
SKpnXMfg7Q4rLf8gga6vIOS9/e4JsX87s29LSJtRU/93VJMmaaI=
=Qqas
-----END PGP SIGNATURE-----

--nGNIxp6bVJwYANhE--
