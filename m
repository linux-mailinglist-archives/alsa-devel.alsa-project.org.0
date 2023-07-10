Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A7974F0E1
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:58:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68B54857;
	Tue, 11 Jul 2023 15:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68B54857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689083908;
	bh=CgnlYd6F8QNT9n++b/k47msx5swkm6/AbNv02cH7FqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SowzdnTkis4DK5QvVZ5MDGFrU1TVpSvXvDa0+IjDxRqjEQb9FqAk6vInRuIz7l25W
	 WYhWuXmEt/TwwB5gUtOV6r+FgudixBiqqwWeM+C6Vv5VvyJ8n8dyXXn57qCkO3MWFE
	 0ldywIf5KH+/KQUd+7gQF3JwyANo+fi/3fLNb0qw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F33EF80689; Tue, 11 Jul 2023 15:52:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1E88F8067D;
	Tue, 11 Jul 2023 15:52:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2202F80249; Mon, 10 Jul 2023 19:16:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3F95F800E4
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 19:16:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3F95F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nCNLRwD0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C4A4F61136;
	Mon, 10 Jul 2023 17:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607EFC433C8;
	Mon, 10 Jul 2023 17:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689009395;
	bh=CgnlYd6F8QNT9n++b/k47msx5swkm6/AbNv02cH7FqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nCNLRwD0ouHI8pJTPN00LKshCADBsrezjsyCWSHlUtPA86QMcTtmuANY2THapc+ya
	 rkH5tcQmXa5WkKmxP1SPoeLDBnKChb3smPLszGKE/fOJpIoKZHw2XHyVjIgwHTZ/1z
	 MufgsvMGmS7UeltSFfqOX5aakYX6Oi9D+fdx6r4xTwDjZDukvdOJHqT+HXAuPx0WPm
	 TWMpwYu5OvJq0RnyxMb5KHCGmQeKSlmlgHlItZHKy5JjIjq74cV332HHX8EX4US9YN
	 7LvxZOQBp61R6AEZ7cokvT4lucM8T0YliBj7nuBwioqSX1VDucIF209VQysfZBVMCk
	 jUIpbFJ9ng45w==
Date: Mon, 10 Jul 2023 18:16:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
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
	Serge Semin <fancer.lancer@gmail.com>,
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
Subject: Re: [PATCH v2 05/15] spi: Remove code duplication in
 spi_add_device_locked()
Message-ID: <7557bada-3076-4d6e-a5c5-d368433706e2@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="smwEq19A8LfCcchg"
Content-Disposition: inline
In-Reply-To: <20230710154932.68377-6-andriy.shevchenko@linux.intel.com>
X-Cookie: Do you have lysdexia?
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: BHUJVX4RZS34GLOEDVLRF646VGM3TAT3
X-Message-ID-Hash: BHUJVX4RZS34GLOEDVLRF646VGM3TAT3
X-Mailman-Approved-At: Tue, 11 Jul 2023 13:52:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BHUJVX4RZS34GLOEDVLRF646VGM3TAT3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--smwEq19A8LfCcchg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2023 at 06:49:22PM +0300, Andy Shevchenko wrote:
> Seems by unknown reason, probably some kind of mis-rebase,
> the commit 0c79378c0199 ("spi: add ancillary device support")
> adds a dozen of duplicating lines of code. Drop them.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/spi/spi.c | 11 -----------
>  1 file changed, 11 deletions(-)
>=20
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index c99ee4164f11..46cbda383228 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -712,17 +712,6 @@ EXPORT_SYMBOL_GPL(spi_add_device);
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

I see that this is duplicating spi_add_device() (and we really could do
better with code sharing there I think) but I can't immediately see
where the duplication that's intended to be elimiated is here - where
else in the one call path that spi_add_device_locked() has would we do
the above?  Based on the changelog I was expecting to see some
duplicated code in the function itself.

--smwEq19A8LfCcchg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsPOUACgkQJNaLcl1U
h9DBUwf9Euy3I6rYQCugpUDlBhWVoSMMz7t1ATFjPAfJAReJsl7tNz8zO3ZIBKvo
DT0wuXofoowlS3XkS80I3NNL7wRjCktrPJnRHSBr/n15W3VCvz7cA+vkKlJdt60d
vqLIOGnEqqPBftrOwUjsobHicO0YhL47AxOStev3fjlhFEbS0RrIpvCsVsRI1HDs
5MalNotHe8wd+ujY4p9wUX9c2EZvSWQAE4XUBml+faspwunMGqKbjE+srfTbz+eB
bkym8H1s/H5a/SQn5ya4y6dkDZ0jR9hz4H3HxMm4C/KgUJRnZXiIgNRtghmsQNys
LGdv8LQz0S452H4iaGYZlWdB4IEu1w==
=KWBr
-----END PGP SIGNATURE-----

--smwEq19A8LfCcchg--
