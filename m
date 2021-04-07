Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE5A356CB5
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 14:53:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D0611662;
	Wed,  7 Apr 2021 14:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D0611662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617800022;
	bh=cyfjEk9jthcsbMRdXa22ian2dfCApQqG6xTpove5ejg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aXOBmUu5QaTeEHnssxB5Z/WD5EJ291LAaf3COZPRIVkJfcoaKCzWnpqvOILOUfGfp
	 Qo63zoESmdbkWa8S81UtvaggkbnY00UeGObTAwXZXaaJ7vQMhIwOflsm3pN6P9V1zT
	 K1+qGm4vuMtbpXZxfDL2JTqaP1A+rGHsrjEw5UE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D843FF8016D;
	Wed,  7 Apr 2021 14:52:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E43E6F8016A; Wed,  7 Apr 2021 14:52:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 237ABF80124
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 14:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 237ABF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RCn0Ot8A"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCC7D61279;
 Wed,  7 Apr 2021 12:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617799924;
 bh=cyfjEk9jthcsbMRdXa22ian2dfCApQqG6xTpove5ejg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RCn0Ot8ATDqpyS4C66rj2NwsNmng3SdIotwU/xRgyy/tZ2P2byZVLVcD+/+GRWW59
 XX/AWOQW22nip9SoRXn/W+INkjDuNPFotVxX+hZYgC1Vx/Q0XuU0JIzWjlQUdRBohL
 zvReB+RpACqLQuLVS54IPk3fDzDF1GxS00o2RjCZr5Nr6LnCCwhNcvIKDCKXjzamhr
 PShKbXs4RyeuhNS2bIL8IIjniNYZlXZX6SXi4YyLZ6kGEWDALxo374XiikYIbDhW4v
 hmxtBE1ec42rJwgfEF5chbAuEqc4pEm3L+9kdHQ7ZYzPT4BND22OU6Y8gjbJvX4MGp
 i6zVANALjAJOg==
Date: Wed, 7 Apr 2021 13:51:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
Subject: Re: [PATCH] ASoC: codecs: Fix rumtime PM imbalance in tas2552_probe
Message-ID: <20210407125147.GD5510@sirena.org.uk>
References: <20210407065402.17729-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="J5MfuwkIyy7RmF4Q"
Content-Disposition: inline
In-Reply-To: <20210407065402.17729-1-dinghao.liu@zju.edu.cn>
X-Cookie: Dry clean only.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, kjlu@umn.edu, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>
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


--J5MfuwkIyy7RmF4Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 07, 2021 at 02:54:00PM +0800, Dinghao Liu wrote:

> -	pm_runtime_set_active(&client->dev);
> -	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> -	pm_runtime_use_autosuspend(&client->dev);
> -	pm_runtime_enable(&client->dev);
> -	pm_runtime_mark_last_busy(&client->dev);
> -	pm_runtime_put_sync_autosuspend(&client->dev);
> -
>  	dev_set_drvdata(&client->dev, data);
> =20
>  	ret =3D devm_snd_soc_register_component(&client->dev,
> @@ -733,6 +726,13 @@ static int tas2552_probe(struct i2c_client *client,
>  	if (ret < 0)
>  		dev_err(&client->dev, "Failed to register component: %d\n", ret);
> =20
> +	pm_runtime_set_active(&client->dev);
> +	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> +	pm_runtime_use_autosuspend(&client->dev);

It's not clear to me that just moving the operations after the
registration is a good fix - once the component is registered we could
start trying to do runtime PM operations with it which AFAIR won't count
references and so on properly if runtime PM isn't enabled so if we later
enable runtime PM we might have the rest of the code in a confused state
about what's going on.

--J5MfuwkIyy7RmF4Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBtquIACgkQJNaLcl1U
h9BQtAf+I2hjUyL/9OkE3eGicNAX7nsxLA+2RCglYcJbnP+DPP0fV9PuPWnUP/v+
AyaTLilVvUCfW/mSQXCrS8s1YZtRjmcWM+C21dyyejn5PTFp2q02jEfVZUsHE1b2
wbspUe0X+/tNp8AifCdgMfHN0i0MvxsVVwnDTwTy64sF7escwM7LaCsJXOvIo8Q3
Jfnq/TJFt40FgSRe30GEzoJEVfiWdAGmfOvggULT2iX3tp7F6Dcl1OevhObFFTmX
SETQzdLXqih7npx1k1RQBBqFPo3mKJ4syuTn3MV4pDWrWqVPFxU1Z2QsNYlslGtk
V+WLnEHAr27p/pTbLLxjB6XTo549EA==
=Tb7U
-----END PGP SIGNATURE-----

--J5MfuwkIyy7RmF4Q--
