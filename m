Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4950F2FA0AF
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 14:04:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA6F717FE;
	Mon, 18 Jan 2021 14:03:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA6F717FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610975089;
	bh=RbUnzS/4nrd4iAPnXubrFVzey/trFbxTEw8uynBL4vo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AoPzBRT5XXuua3haB3A4938Mr8XFEkrL/AwFmDLdhzOXTF7rFcpiv7o/WUUTP8IFu
	 zdBnHFbYY0x8An6LIK0YBRz51YuszNGJP2Yuw3rQRTiEvx2dqwFgJ9G7z+f4vTDEgr
	 2QIWNsItn7sTZykdjq/5kfvsZMYmRiTDBLpFnpio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59427F80137;
	Mon, 18 Jan 2021 14:03:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29653F80166; Mon, 18 Jan 2021 14:03:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63EBAF800C0
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 14:03:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63EBAF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="URept8pF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0B2722571;
 Mon, 18 Jan 2021 13:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610974984;
 bh=RbUnzS/4nrd4iAPnXubrFVzey/trFbxTEw8uynBL4vo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=URept8pFVDB9rwLoEwDMKPFgawKQQErcGW+41JY9ajp9+488Qm62OqabuqQXQayyM
 AWv1aDQVmufIWjRqhW6SYCN1zq+Z/RMy1S+5tfVEZwFv6MGqVCSqPlFLE1DzKSNqct
 gTErdRypZnsa4alg1jpx5XVVP0zUGUjXEuLthu8jLLhsQkoAee1gMh9oOGsD/VT2US
 DqDxxdD6BrDsHt+Y8dO9xNnFATFZpRVgHLW50hDgslMDU2rnAtTHvklw544Q8xCq84
 IJDPbfbAcynYwCtHLwv6hLnvKIblOsY7+ASWQxUZ1g1nQmrjyBMxrB2DBGQqAFXFyv
 50n/WYEB4CCaQ==
Date: Mon, 18 Jan 2021 13:02:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 3/5] mfd: arizona: Add support for ACPI enumeration of
 WM5102 connected over SPI
Message-ID: <20210118130227.GI4455@sirena.org.uk>
References: <20210117212252.206115-1-hdegoede@redhat.com>
 <20210117212252.206115-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CNK/L7dwKXQ4Ub8J"
Content-Disposition: inline
In-Reply-To: <20210117212252.206115-4-hdegoede@redhat.com>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Christian Hartmann <cornogle@googlemail.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Lee Jones <lee.jones@linaro.org>
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


--CNK/L7dwKXQ4Ub8J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 17, 2021 at 10:22:50PM +0100, Hans de Goede wrote:

> +	/*
> +	 * Some DSDTs wrongly declare the IRQ trigger-type as IRQF_TRIGGER_FALL=
ING
> +	 * The IRQ line will stay low when a new IRQ event happens between read=
ing
> +	 * the IRQ status flags and acknowledging them. When the IRQ line stays
> +	 * low like this the IRQ will never trigger again when its type is set
> +	 * to IRQF_TRIGGER_FALLING. Correct the IRQ trigger-type to fix this.
> +	 */
> +	arizona->pdata.irq_flags =3D IRQF_TRIGGER_LOW;

Are you sure that all the relevant interrupt controllers support active
low interrupts?  There were issues on some systems with missing support
for active low interrupts (see the bodge in wm8994-irq.c to work around
them) - it's entirely likely that there are DSDTs that are just plain
buggy here but if someone's copying and pasting it smells like there may
be some systems that actually need an edge triggered interrupt that
they're getting it from.

> +
> +	/* Wait 200 ms after jack insertion */
> +	arizona->pdata.micd_detect_debounce =3D 200;
> +
> +	/* Use standard AOSP values for headset-button mappings */
> +	arizona->pdata.micd_ranges =3D arizona_micd_aosp_ranges;
> +	arizona->pdata.num_micd_ranges =3D ARRAY_SIZE(arizona_micd_aosp_ranges);
> +
> +	return 0;
> +}
> +
> +static const struct acpi_device_id arizona_acpi_match[] =3D {
> +	{
> +		.id =3D "WM510204",
> +		.driver_data =3D WM5102,
> +	},
> +	{
> +		.id =3D "WM510205",
> +		.driver_data =3D WM5102,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, arizona_acpi_match);
> +#else
> +static int arizona_spi_acpi_probe(struct arizona *arizona)
> +{
> +	return -ENODEV;
> +}
> +#endif
> +
>  static int arizona_spi_probe(struct spi_device *spi)
>  {
>  	const struct spi_device_id *id =3D spi_get_device_id(spi);
> @@ -77,6 +191,12 @@ static int arizona_spi_probe(struct spi_device *spi)
>  	arizona->dev =3D &spi->dev;
>  	arizona->irq =3D spi->irq;
> =20
> +	if (has_acpi_companion(&spi->dev)) {
> +		ret =3D arizona_spi_acpi_probe(arizona);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return arizona_dev_init(arizona);
>  }
> =20
> @@ -104,6 +224,7 @@ static struct spi_driver arizona_spi_driver =3D {
>  		.name	=3D "arizona",
>  		.pm	=3D &arizona_pm_ops,
>  		.of_match_table	=3D of_match_ptr(arizona_of_match),
> +		.acpi_match_table =3D ACPI_PTR(arizona_acpi_match),
>  	},
>  	.probe		=3D arizona_spi_probe,
>  	.remove		=3D arizona_spi_remove,
> --=20
> 2.28.0
>=20

--CNK/L7dwKXQ4Ub8J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAFhuIACgkQJNaLcl1U
h9DDuQf+K/1+R35NC7d0uVDYwSsGKNopg9Q3xtbFzKERm2cKHfqao/bdeSkrbhhD
kSUm+L9X1I/LHkGzdao5920MXJ9gmzbIeolpSH6ygVv8KZ7odJPV+H+Bkly+ZTe7
ZRAoBiuUFSVpe/3lZV7YBMlbH1j8U8lIeJ3SFPzz0dokrgezToTeBJopK/kI1z7k
7GHKPF00b/CDy2A5abeXIE7pn2fUwVascc95pz9aVgtO638joDZiczuKmlrOiv/v
g83/Wc36+jmZqVR7ptTGKXK6KyQzScNYlTWCnZBeWzkhx3KE0PAe1Ez2kyozu6Vw
wG3vYuzhX/7yelouc25AU/i3lruPkQ==
=lhY6
-----END PGP SIGNATURE-----

--CNK/L7dwKXQ4Ub8J--
