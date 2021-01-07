Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E22EC2ED21C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 15:30:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79F2A1699;
	Thu,  7 Jan 2021 15:29:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79F2A1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610029825;
	bh=wq0bmkT0v1XJd/qFGy+kwVjV7IzBlnb2YgG9BaaPlAY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c+cn4711fS8pMQp3klbvn4BTF3pS1fNKpJPkN+HtKSENv0V8GoZOThuZpfx8wTO2Y
	 spBNcThk9KxKvJdm61V7/6ucD+kZSnIwQyVpuXfDPyGIYTFOIJhr/zVVyTeDmXhGxA
	 rwuAKzS6ckJx7RB5pre5Ku9uyPZicSv9ePEaWcoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0642F80268;
	Thu,  7 Jan 2021 15:28:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4597DF80258; Thu,  7 Jan 2021 15:28:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84903F800E9
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 15:28:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84903F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Rx27ouWQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45D3822EBF;
 Thu,  7 Jan 2021 14:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610029695;
 bh=wq0bmkT0v1XJd/qFGy+kwVjV7IzBlnb2YgG9BaaPlAY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rx27ouWQ6IOJLohgRuNphzufjwGjIZTKJdUtwm5WUXxfzOtwRWhIhg3DwfS/sxA/N
 2E7nOeEnaEupq/NmPzzorvpPmAGTXdZ5H0DL7XOGYrn4C+ygRrTkyD6daNGIYaCmjC
 +oW1fPsk31YHSy3CY0SXYce7qZxXilkgQUlFhTjacmsSL48lL29CWW6cOGld2Qg7Zf
 BiLYY1zGRuRH6pXwnsPLAhpe3eOkWZ7iSkEPr+lnOwENl6oXPs/yxdjzxvoD3PKXSJ
 iwq2xYGROQ8ujnneTRz/nDp+mmGnqQRzqJebZwmxsIspZ9rd7VosVzTxjfZwTTUvmb
 u/Fv6nTTnmvbw==
Date: Thu, 7 Jan 2021 14:27:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Chris Chiu <chiu@endlessos.org>
Subject: Re: [PATCH 1/4] ASoC: rt5645: Introduce mapping for ACPI-defined GPIO
Message-ID: <20210107142746.GC4726@sirena.org.uk>
References: <20210107090625.107078-1-chiu@endlessos.org>
 <20210107090625.107078-2-chiu@endlessos.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ctP54qlpMx3WjD+/"
Content-Disposition: inline
In-Reply-To: <20210107090625.107078-2-chiu@endlessos.org>
X-Cookie: See store for details.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, linux@endlessos.org, tiwai@suse.com
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


--ctP54qlpMx3WjD+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2021 at 05:06:22PM +0800, Chris Chiu wrote:

> +static const struct acpi_gpio_mapping *cht_rt5645_gpios;
> +

You're adding a read only static variable with no way to set it.  This
doesn't actually do anything?

> @@ -3780,7 +3782,6 @@ static const struct dmi_system_id dmi_platform_data=
[] =3D {
>  		},
>  		.driver_data =3D (void *)&intel_braswell_platform_data,
>  	},
> -	{ }
>  };
> =20

This is an unrelated change which removes the terminator on the array
which will cause issues.

--ctP54qlpMx3WjD+/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/3GmEACgkQJNaLcl1U
h9CLFAf/evzCs5u2gB5dTDWM0EbQ+WNYz3+RPiTWt8YOnZcdvn7CNyuOxA4daHhN
qNtKWt3HL5iVv6N0QVm+KIApX1j/VAN1Wa+LKoSpJHh/+XlL2v2h9Gkcx/JqM2zi
JYUj35rMJnL+TotjeOw+dtDRsWueo3IUN86o2QJX5SLBFwUXMdSFkW9VEsLu+2l7
quPzgEelg/tSwEegKNlPPApb9uedQpKNy2w5gngtpSUQH8IGGxxISSAQF1Cdgt8h
mCVLS53h93BEajHCGRlv6GPuBKTkgRnvyzbYEHgmJEpGihxxQPHzvyzjj+OlAXB5
sSHjR+6+BfSP0CY+bG71x+PSPHwD9w==
=w+Ra
-----END PGP SIGNATURE-----

--ctP54qlpMx3WjD+/--
