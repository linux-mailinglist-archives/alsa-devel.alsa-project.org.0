Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3162DACC4
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 13:13:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6FB917DF;
	Tue, 15 Dec 2020 13:12:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6FB917DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608034419;
	bh=c2r9lfpSJ4qUEj+mjRLVrMrrc10/Xm02J2Np3cRKLl8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QpmN82IlfbvugrWWtxfW6CF/J5EV4LeWIv7MmKASyBokge/gtA57Y/DIHrdjARVYJ
	 BdomyHQs0tLroErigbxojJIdyCnXLzyp8VXxPs/d3VimsItM3xHIcIXuhR6tYcAzqr
	 hN6F36eMRV6t3Z+ti6gJvGO1weV8ZvPdrOpXp0j4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ABFCF80129;
	Tue, 15 Dec 2020 13:12:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66181F80129; Tue, 15 Dec 2020 13:12:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC7D7F80129
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 13:11:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC7D7F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J+MLxBvB"
Date: Tue, 15 Dec 2020 12:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608034315;
 bh=c2r9lfpSJ4qUEj+mjRLVrMrrc10/Xm02J2Np3cRKLl8=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=J+MLxBvBt4mZvbzaExzp2DhRvZvxL0YZPwneEbCOMEL7JKO+HPKBmn0YxSm6Afcc5
 C4alHbZgCcWUQC4OGfAWi68FrVgunZuiVsTfajLxIHVGTLK/KwtiqRC3+DUC/ZGKuK
 DK7j8jOvndjNMiOFAeEF5PuviBcLfbqBEQInRYop5q5ueNfXr4/IgC2zsVNbxG2iy5
 una93RSrljNtlzjXHH18ZcnmiBHSRJu4tz32+UmBkxomO2Z/hfs+tqe6TPZbgfjO+/
 YeidALlLrWSqV+dr3TK1vKpRd1LJuZh1gK8v4B1kY2STe0k4V7Q9TdZ2na2fFi1V4W
 DSmhdg61q5v+w==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: max98373: don't access volatile registers in
 bias level off
Message-ID: <20201215121143.GB4738@sirena.org.uk>
References: <20201214064237.15763-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline
In-Reply-To: <20201214064237.15763-1-yung-chuan.liao@linux.intel.com>
X-Cookie: In specially marked packages only.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, ryans.lee@maximintegrated.com, tiwai@suse.de,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org, bard.liao@intel.com
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


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 02:42:37PM +0800, Bard Liao wrote:

> --- a/sound/soc/codecs/max98373.h
> +++ b/sound/soc/codecs/max98373.h
> @@ -203,6 +203,17 @@
>  /* MAX98373_R2000_SW_RESET */
>  #define MAX98373_SOFT_RESET (0x1 << 0)
> =20
> +struct max98373_cache {
> +	u32 reg;
> +	u32 val;
> +};
> +
> +struct max98373_cache max98373_cache[] =3D {
> +	{MAX98373_R2054_MEAS_ADC_PVDD_CH_READBACK, 0},
> +	{MAX98373_R2055_MEAS_ADC_THERM_CH_READBACK, 0},
> +	{MAX98373_R20B6_BDE_CUR_STATE_READBACK, 0},
> +};

This is declaring a variable in the header, meaning there'll be one copy
in each of the object files using the header and that if they get linked
into a single object you should get warnings about duplicate symbols.
It would be better to both allocate the version used at runtime
dynamically (in case we somehow get multiple max98373s in a system) and
have this list of registers be a static variable inside the driver code
which is used to initialize that.

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/Yp/4ACgkQJNaLcl1U
h9DzMAf8C/D1aPuwe63MmG6NDqCW0KPZckhPnJJYD8C0fnX4HB59Rehqwyaq5dPm
pXKCUKw9zYgpA7FZFm05BojjHkhmbk+JqS4M4b5eZ63d+goEu6+q+wj3bd0cTe7n
Sa9iUY6eSDWQ5qisNGWi9/o3xaJ/zCyD8RjUENpiFuE9nYQqbjn7lG6A3zoYyoLH
WmvRYYPB3ihFKtK8PzI/TTiYWg7G0d0RIpD/V38rqrTv42Bhd4tKV0KFNEvpnYIr
iAlziKGugMPC9+xZSTCokJED4J4F0LcZ0bF1AmFoSPu1lJjMQEoeTsYiS+X5OxLg
g0rhXU16htP6QBH2ZV+L71m9vkmPFw==
=fmSH
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
