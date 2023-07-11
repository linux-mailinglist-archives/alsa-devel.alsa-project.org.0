Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A81A5750971
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 15:17:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8041950;
	Wed, 12 Jul 2023 15:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8041950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689167859;
	bh=xTQ0mmZSKT6xaRW2cSSnwsyXZRn21W+fLOIKOFiv5HU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m938oCz7m+Qz/TsfYNEdHlkQ7JnrDEWK5HpTg3ZcDU1TRLAj1QXz5FcFvyQ2QkBHv
	 J6lJ7zvDphIhkLz9WhcfdaLKq+ddiFIRbgRoUK6+EzIL0VhjDLRnmqDxZOtapMeASh
	 WH8nlgw2tM92Z/hGnrEgVVD+5JyZ4CvQ3E/j0DvE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9568BF805F0; Wed, 12 Jul 2023 15:14:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAE29F805F2;
	Wed, 12 Jul 2023 15:14:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98478F80249; Tue, 11 Jul 2023 19:34:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86FB3F80093
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 19:34:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86FB3F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=H4apaSnH
Received: from mercury (dyndsl-091-248-213-212.ewe-ip-backbone.de
 [91.248.213.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 033A86606FD5;
	Tue, 11 Jul 2023 18:34:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689096844;
	bh=xTQ0mmZSKT6xaRW2cSSnwsyXZRn21W+fLOIKOFiv5HU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4apaSnHRDvSkpSCkk+wyU65Ngqr9P5JyDBeie6RLPAeIF/a84cxGH59ddGSbX5qw
	 63kfAbpaiUnhKnAjL7v46VWmzE4FkX9fEEyauEpMkG3DYbKmfvZvGjPGtA+xeI6swf
	 kjXbLmO76/FOA8FnaeGqaVHoSCSKZ347Op8QNSbAV1AHFtd/woPULZ7cp0Xe7t6lvK
	 j+oEiKCypr4OaNiLGZi4zRujwMiEhT9wkldDGMRFDyKdZJ0dEmjL8X+4AzL1KA1Sn6
	 6BSpra8CwZ37kLECStDWmCD4Br675HzuR2KsJ6ZFQzDp7r6efy1uSO15+pqJdv0f+r
	 Or4DZYoJuC/iQ==
Received: by mercury (Postfix, from userid 1000)
	id B8CBE106765E; Tue, 11 Jul 2023 19:34:01 +0200 (CEST)
Date: Tue, 11 Jul 2023 19:34:01 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v3 04/14] spi: Remove code duplication in
 spi_add_device*()
Message-ID: <20230711173401.kz7or6ucurhoe4er@mercury.elektranox.org>
References: <20230711171756.86736-1-andriy.shevchenko@linux.intel.com>
 <20230711171756.86736-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nr4764lrwkknwz4l"
Content-Disposition: inline
In-Reply-To: <20230711171756.86736-5-andriy.shevchenko@linux.intel.com>
X-MailFrom: sebastian.reichel@collabora.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: F5JCBVKRO4GE5YIWYUBE5PZSPHGU4E5S
X-Message-ID-Hash: F5JCBVKRO4GE5YIWYUBE5PZSPHGU4E5S
X-Mailman-Approved-At: Wed, 12 Jul 2023 13:14:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F5JCBVKRO4GE5YIWYUBE5PZSPHGU4E5S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--nr4764lrwkknwz4l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 11, 2023 at 08:17:46PM +0300, Andy Shevchenko wrote:
> The commit 0c79378c0199 ("spi: add ancillary device support")
> added a dozen of duplicating lines of code. We may move them
> to the __spi_add_device(). Note, that the code may be called
> under the mutex.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> ---
>  drivers/spi/spi.c | 32 ++++++++++----------------------
>  1 file changed, 10 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 6d74218cf38e..876d40d2c708 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -631,6 +631,16 @@ static int __spi_add_device(struct spi_device *spi)
>  	struct device *dev =3D ctlr->dev.parent;
>  	int status;
> =20
> +	/* Chipselects are numbered 0..max; validate. */
> +	if (spi_get_chipselect(spi, 0) >=3D ctlr->num_chipselect) {
> +		dev_err(dev, "cs%d >=3D max %d\n", spi_get_chipselect(spi, 0),
> +			ctlr->num_chipselect);
> +		return -EINVAL;
> +	}
> +
> +	/* Set the bus ID string */
> +	spi_dev_set_name(spi);
> +
>  	/*
>  	 * We need to make sure there's no other device with this
>  	 * chipselect **BEFORE** we call setup(), else we'll trash
> @@ -689,19 +699,8 @@ static int __spi_add_device(struct spi_device *spi)
>  int spi_add_device(struct spi_device *spi)
>  {
>  	struct spi_controller *ctlr =3D spi->controller;
> -	struct device *dev =3D ctlr->dev.parent;
>  	int status;
> =20
> -	/* Chipselects are numbered 0..max; validate. */
> -	if (spi_get_chipselect(spi, 0) >=3D ctlr->num_chipselect) {
> -		dev_err(dev, "cs%d >=3D max %d\n", spi_get_chipselect(spi, 0),
> -			ctlr->num_chipselect);
> -		return -EINVAL;
> -	}
> -
> -	/* Set the bus ID string */
> -	spi_dev_set_name(spi);
> -
>  	mutex_lock(&ctlr->add_lock);
>  	status =3D __spi_add_device(spi);
>  	mutex_unlock(&ctlr->add_lock);
> @@ -712,17 +711,6 @@ EXPORT_SYMBOL_GPL(spi_add_device);
>  static int spi_add_device_locked(struct spi_device *spi)
>  {
>  	struct spi_controller *ctlr =3D spi->controller;
> -	struct device *dev =3D ctlr->dev.parent;
> -
> -	/* Chipselects are numbered 0..max; validate. */
> -	if (spi_get_chipselect(spi, 0) >=3D ctlr->num_chipselect) {
> -		dev_err(dev, "cs%d >=3D max %d\n", spi_get_chipselect(spi, 0),
> -			ctlr->num_chipselect);
> -		return -EINVAL;
> -	}
> -
> -	/* Set the bus ID string */
> -	spi_dev_set_name(spi);
> =20
>  	WARN_ON(!mutex_is_locked(&ctlr->add_lock));
>  	return __spi_add_device(spi);
> --=20
> 2.40.0.1.gaa8946217a0b
>=20

--nr4764lrwkknwz4l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmStkn4ACgkQ2O7X88g7
+pormhAAnK4ipkeSKHu0xl8agX+r1Ks97iOFEMGG8+gzX4xY/hXNKVPfgpoWdNZa
rN+CMPEFa2M5kKdm7v6s7wv2A/R0bRMIwUrHhMxAVBKQSNlp47s2N/PBkCgghK7x
dOCmH/DDN17c1ODn8FJUD/WO5p1/grLRg1mUoNQvVqLVz7jQBx+oOZxG1Fm2e5pb
suAySbAqDtYVper0iqZhu1BwDjFxj7l/+kXhJWt+mtgFq1shfCwdfK+gm9Z1hJ4B
kDa1PZSzlIbs8znfYFu8n7gPJIN/nplWGmWgFAbwex3GxdZbSrO58X4m2B0fooFg
xQ3w3b710ONolovhZktxkx7nibXjJiVFQwgS7BPRquCjCEok5jNmuyVJmu9Pud0s
nRDWYic0TKErHny9NYCTwdJQX5ZkDIV9QpjVyp5FR7e/ylT8chmX1LwnsKZSd91j
TN9+lh3yU6BjbjopIAFAhP5BvYeYMI2tvbXpCC3iiqGno53AZUyP5dXBupB/zri7
bwN6fXNXsuVX0JJH3CHCm13ZK9IFY8GHGqLJBUulYVyaXSLOimXhi/l6bkkhvzxN
IKpuSWUPTxAVu9q5LxsOWS45GXR0oWiiKL7tOcaX1yJypn+5lKy+4yStvF0cER9d
NdLreesrYaGS2zSH4qIA7m8dd2oaqPtYCa1VHzxRfLcNsnyCoXY=
=zPs/
-----END PGP SIGNATURE-----

--nr4764lrwkknwz4l--
