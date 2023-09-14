Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF29779FC22
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 08:37:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB979DF9;
	Thu, 14 Sep 2023 08:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB979DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694673457;
	bh=8wG2mWFY/MOhwdR1E+RFFBu/Xu6lYoo9dwKO8X82dDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N5E3uyUK76+U198mUL3AY8vdwkIBYMQ73x0K260oimOQrl3ixMqkpPEN0DovroOm8
	 1IlcYwjpTDRguC5ckaRO0WIrNxaHbSCJGurJe8Nvo71GxJ311xaXedsUrF77h+tMi1
	 jvwZrfCuv6LFuWk661vEnww0/53kT0h4LZVuk5+c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17E89F805F2; Thu, 14 Sep 2023 08:33:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B368BF805E4;
	Thu, 14 Sep 2023 08:33:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A0BCF80425; Thu, 14 Sep 2023 08:33:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10E49F801F5
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 08:32:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10E49F801F5
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qgfuH-0002S0-Ns; Thu, 14 Sep 2023 08:32:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qgfuD-006EyS-B7; Thu, 14 Sep 2023 08:32:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qgfuD-001WMf-1c; Thu, 14 Sep 2023 08:32:49 +0200
Date: Thu, 14 Sep 2023 08:32:48 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Myunguk Kim <mwkim@gaonchips.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, fido_max@inbox.ru,
	kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
	xingyu.wu@starfivetech.com
Subject: Re: [PATCH] [v2] ASoC: dwc: fix typo in comment
Message-ID: <20230914063248.rquitqthmddgm5oa@pengutronix.de>
References: <64683b6c-1e31-4037-a47d-b8a19ea77c72@sirena.org.uk>
 <20230914005633.2423696-1-mwkim@gaonchips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tnq7qun57gracq7w"
Content-Disposition: inline
In-Reply-To: <20230914005633.2423696-1-mwkim@gaonchips.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: ZNVP36R5VNBETFMFJDS7QHDU4GRE44ET
X-Message-ID-Hash: ZNVP36R5VNBETFMFJDS7QHDU4GRE44ET
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZNVP36R5VNBETFMFJDS7QHDU4GRE44ET/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--tnq7qun57gracq7w
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 09:56:34AM +0900, Myunguk Kim wrote:
> > The patch is obviously corrupted, the { there should be on the prior
> > line and even fixing that by hand there appear to be some other issues.
>=20
> The patch file should have been attached as shown below.=20
> Is there a problem with my git send-email?
>=20
> ---
>  sound/soc/dwc/dwc-i2s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
> index 22c004179214..c71c17ef961d 100644
> --- a/sound/soc/dwc/dwc-i2s.c
> +++ b/sound/soc/dwc/dwc-i2s.c
> @@ -138,7 +138,7 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev=
_id)
>  			irq_valid =3D true;
>  		}
> =20
> -		/* Error Handling: TX */
> +		/* Error Handling: RX */
>  		if (isr[i] & ISR_RXFO)=20
> { 			dev_err_ratelimited(dev->dev, "RX overrun (ch_id=3D%d)\n", i);
>  			irq_valid =3D true;

FTR: I get this mail directly (so no mailing list server involved), and
the patch is mangled in the same way as broonie pointed out in his mail
earlier in this thread.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--tnq7qun57gracq7w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUCqRAACgkQj4D7WH0S
/k6/MAf+I/52SaIDC1qZLMYxlnyDxUjH539VR2QRgRXO7DXBqXvj68ubzhtEuFwM
SZZxtZucf7jjCjpu6IW64QpuZ8JoTZhlf6u5LBn008ADG0juzr4bNsMbP8R5M+ra
kqPd2n1kLRPf9G1BSiwnPDpL7Lfj0jjMZBHG88VRYsypYfbzK9zxPfeYi71wK52q
1IYtflj9ZlHbmSdcpNrKj7jXo4+FeBZzT8e8xcHgI0S2QBKK0WUdBgzzgLcCXKQD
J2uWgCChBfBrGn8FMMsB1OBtENbca0zcKPswZ0LKLDqwV2/OC8GIU+tpRxluCEw7
m9vSAczJxZVEAaJPNFOEbNyGGvT4MQ==
=PYSR
-----END PGP SIGNATURE-----

--tnq7qun57gracq7w--
