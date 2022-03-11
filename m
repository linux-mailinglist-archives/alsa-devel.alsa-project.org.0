Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F354B4D61A2
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 13:35:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63E471868;
	Fri, 11 Mar 2022 13:34:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63E471868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647002125;
	bh=l52G/3EL1DzyxVZx84teUiSVNYNzHgNdsdEWIqzH+nM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jc2FbNfKX8lL/SE/eEV95a66BfDLl3kzNu1+t3CiYSqw8X2gmXlAbbwcNdHvUnJwK
	 3G7TSq3Esd1wZ9sPLnF/NwbD+ijGX9JLMt3kwiARhd3aqNVhIRqahRvwE6t8rw1xE/
	 gqR1GhtpXB517xJCF+HM/4xK0N+CgI5awFaZbSpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D738F80238;
	Fri, 11 Mar 2022 13:34:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FA12F80227; Fri, 11 Mar 2022 13:34:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 178CEF800D2
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 13:34:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 178CEF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N5/bTy2r"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D82D61CFF;
 Fri, 11 Mar 2022 12:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17000C340E9;
 Fri, 11 Mar 2022 12:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647002049;
 bh=l52G/3EL1DzyxVZx84teUiSVNYNzHgNdsdEWIqzH+nM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N5/bTy2rv9QBUzQ2bRdsCm6VeUwy9CIGdIOBquIYL6I99MTvSnxzZziRTE4O+J75X
 SoYIA4WiYWI8NG2sLAXK1UDLDP6JJtaljYaH+mI3FGupXiuQ7n3dpJ8wuJjcOFkVnV
 ky5oPNsx2FQgslvSCJ2RfhBoy4k14Je36PsS5+nc/4ApnboqWb8afbDM27RhjXnLfz
 mmOOjBEUAKQ++HaZGTS2vxmnFlLkH3Qkjd4LrPHHXzfXG/3ksiTEuywunys3f0/F/k
 crT2DEhKWXvQ22HnV44eyEopUnsvdNmFQUPxhqBLki2HOtGY/a/ORTB0rxeoTsCd1M
 OjrqPPbu1YDsw==
Date: Fri, 11 Mar 2022 12:34:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH] ASoC: tlv320aic3x: add dmic widget support
Message-ID: <YitBvMce9OAh0Jx5@sirena.org.uk>
References: <20220311100627.2181756-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0/mZOjcrntyubmya"
Content-Disposition: inline
In-Reply-To: <20220311100627.2181756-1-gregory.clement@bootlin.com>
X-Cookie: A fool and his money are soon popular.
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--0/mZOjcrntyubmya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 11, 2022 at 11:06:27AM +0100, Gregory CLEMENT wrote:

> +static const char * const aic3x_dmic_rates[] = { "off", "128x", "64x", "32x" };
> +static SOC_ENUM_SINGLE_DECL(aic3x_dmic_rates_enum, AIC3X_ASD_INTF_CTRLA, 0,
> +			    aic3x_dmic_rates);
> +static const struct snd_kcontrol_new aic3x_dmic_rates_controls =
> +	SOC_DAPM_ENUM("Route", aic3x_dmic_rates_enum);

...

> +	{"GPIO1 dmic modclk", NULL, "DMic Rate"},
> +	{"DMic Rate", "128x", "DMIC"},
> +	{"DMic Rate", "64x", "DMIC"},
> +	{"DMic Rate", "32x", "DMIC"},
> +	{"DMic Rate", "off", "DMIC"},

This isn't really idiomatic and won't be power efficient since we don't
automatically manage the power so we'll have the DMIC clock running even
when no recording is in progress.  What would be better would be to have
an enum equivalent of the _AUTODISABLE() controls, providing an enum
with the clock rates backed by a field in the driver data and then a
DAPM widget which writes the value to the hardware when the widget is
enabled and sets it back to off on disable.  It'd be fine to open code
that in the driver for now rather than actually implementing a generic
thing if that's too much hassle.

--0/mZOjcrntyubmya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIrQbwACgkQJNaLcl1U
h9C3mQf+MZ6RAdMcQME2mOpeWnIsDmZZPFSSU8cOluACvtIjnUW7yQzFcud3e5xx
02IFdEI/NLYAVRuU0cYoaNEi3/GZ1GUzsCHl602xePfPEDDbzZL4wqoA2XyjHvUp
TA3V8WzYphFsFouUPg+/4Pz6dqTqgQdDqx1OcCicGEKRY7P33LgN0tzghGmcJsvM
eB0Mf4ygBDmrVam2o4LSJHeL4l91/iMSjy1IOFdY8cFfzQyDX0892GE6ZZcfKD8l
1OMWsArMhMTzeDQgwDKrEgEgLuE6h7hn5FJRE2LDYYEFaX75m3p4DBkNy+eIywFx
aWVMtZIyNATOcOrXWzmfJ/kfDPu2yw==
=uBhC
-----END PGP SIGNATURE-----

--0/mZOjcrntyubmya--
