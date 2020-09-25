Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51093278EF1
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 18:44:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF75718CA;
	Fri, 25 Sep 2020 18:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF75718CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601052260;
	bh=c2rgj1TrFsx3rd7S+ls7DxSAVWsEziKWugveJnbh7kQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YJP1SVd0RThWpNj+W6lMLMFliAlL9n+pXG2WuvVAYJnkrcZ1C47XgMvpUKkAAjp88
	 pNGIZf+zzJgDNxDpI533LweqXdeinEKEHSX579MUc2a82KtCQRK58y3bt+N1ex0JR/
	 y52+MDcVrY4NLAmkhStGXU6nyYNdy9+lYDT8Bgg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3A46F801EC;
	Fri, 25 Sep 2020 18:42:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE6C0F801EB; Fri, 25 Sep 2020 18:42:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A255F800DA
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 18:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A255F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nefj7iIN"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB53A2075F;
 Fri, 25 Sep 2020 16:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601052144;
 bh=c2rgj1TrFsx3rd7S+ls7DxSAVWsEziKWugveJnbh7kQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nefj7iINudouOnBVczHq0yRaRFAX3LLVlPa9t1Dh3TEwpgDSCalLiOGeQADo7qjQL
 HZNAxK6TRR8mZtf4CaynVgxNpRebRR0dMp7FLvAKRYzgQuFC+EBjCPqvWIJII3T0SV
 8p9EtjNCfIHQ9iGeluJREcYmSk89R0R8yE0I7Vl4=
Date: Fri, 25 Sep 2020 17:41:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 2/3] ASoC: cs4234: Add support for Cirrus Logic CS4234
 codec
Message-ID: <20200925164129.GG4841@sirena.org.uk>
References: <20200925105908.20640-1-rf@opensource.cirrus.com>
 <20200925105908.20640-2-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LiQwW4YX+w4axhAx"
Content-Disposition: inline
In-Reply-To: <20200925105908.20640-2-rf@opensource.cirrus.com>
X-Cookie: Onward through the fog.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
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


--LiQwW4YX+w4axhAx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2020 at 11:59:07AM +0100, Richard Fitzgerald wrote:

This looks very good, a couple of small nits below which should be easy
to address:

> @@ -282,7 +283,6 @@ config SND_SOC_ALL_CODECS
>  	  uses them is also built since they are only usable with a machine
>  	  driver.  Selecting this option will allow these drivers to be built
>  	  without an explicit machine driver for test and development purposes.
> -
>  	  Support for the bus types used to access the codecs to be built must
>  	  be selected separately.
> =20

Unrelated whitespace change.

> +static int cs4234_i2c_remove(struct i2c_client *i2c_client)
> +{
> +	struct cs4234 *cs4234 =3D i2c_get_clientdata(i2c_client);
> +
> +	pm_runtime_disable(&i2c_client->dev);
> +	cs4234_shutdown(cs4234);

You used devm_snd_soc_register_component() which means that you won't
unregister utill after this force powered down the device which isn't
great - you should use snd_soc_register_component() and manually
unregister here before force powering the device down.

--LiQwW4YX+w4axhAx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9uHbgACgkQJNaLcl1U
h9BwAgf/cvrCRNPtVmQZoCMjhnRTU3sG6jDhpuGmfUrnOdGyu8jSiZLkPqX/tWRI
BXpR19icljIVCFyLzA/Y1W77ry9U8oGrywn6hVNLxp6cYntlPzTNiY+ZXHhZTv2i
SNYxq6g1Bx3CRIg42QPO79PRQ6rxZgiuuXPieN1+m4mfdCTDdgYt9hhhMyYLpkDu
9oAXiUlcvyWmVyPmlwq3MebWms77Mo7/9qH6TruQXZDXGAnAH7UcMdxrejFF481i
6Cv9Ym39lubA20QU0w/AALqPvIxHyvme2ERSxXWBpTnYkotdC5X3dd2K1ewKwQ/+
H8J6WqhPI3hSArB0Xr7yTMtdqpRYvA==
=j4b0
-----END PGP SIGNATURE-----

--LiQwW4YX+w4axhAx--
