Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1D198AF29
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 23:31:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7BC91931;
	Mon, 30 Sep 2024 23:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7BC91931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727731903;
	bh=sG0WjLTVUV4DLkeZIrde7W6dgLLQSQa+eK0I6BJYcWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AMyTfA2Z12/IQd5KJQHtCL/DrbRIcLSOSNjzcC21vm/EV0Y3uzjg/0G6TTdhCTYE+
	 CxW+PiZwOx9Cqhu97Ck7n3saN3PCJ4jVWePmgs1yYarDyoJvly6uW5WnhbJ9FOyvbq
	 aXgGoYgQnGnPJkqQCXyELLPfoR63rOZ13Rrh+63c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82FE0F805A1; Mon, 30 Sep 2024 23:31:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C9DDF805B1;
	Mon, 30 Sep 2024 23:31:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C256F80517; Mon, 30 Sep 2024 23:31:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27018F80007
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 23:31:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27018F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rw4MlEot
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6F987A416D3;
	Mon, 30 Sep 2024 21:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4759C4CECD;
	Mon, 30 Sep 2024 21:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727731862;
	bh=sG0WjLTVUV4DLkeZIrde7W6dgLLQSQa+eK0I6BJYcWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rw4MlEotZEFE5Npk0WTvCl1Fvj9NKs0Gg30zelvD9leBFFOzoYZbKcblUYbQ46VBa
	 abAXJ7v9Pznolkbs4xHDTfm09ofvSUt5R+14FGbMxCGD6yeoAN8p5Q6PU2MY0K2PBS
	 DJmvz1+gjt6iKyplREY8EMYD9FXssBJwW2OWV5bV8iPlA63/3F7LNDBmuFuShyFJ6T
	 NNzaFSgYIB4/lVJkNcw9U85MQmq+Rbgd9x6rfFZHB8Y6YBos5RCp7UOTc8+lxH9sYg
	 MP/J2eagbdSEVNY6csQvo1z8Eyyl21Mqaq/9JdaBwW/tdO2uJY0YMCjQKyHFvIfv2h
	 DqVLfiwzQcIpg==
Date: Mon, 30 Sep 2024 22:30:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Benjamin Hahn <B.Hahn@phytec.de>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Teresa Remmet <t.remmet@phytec.de>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH] sound: soc: codecs: tlv320aic3x: Fix codec gpio-reset
Message-ID: <ZvsYk4aGCPvR2kyf@finisterre.sirena.org.uk>
References: 
 <20240930-wip-bhahn-tlv320aic3x_fix_reset-v1-1-c040d86a4b93@phytec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ss51HuvtAhdbVrv8"
Content-Disposition: inline
In-Reply-To: 
 <20240930-wip-bhahn-tlv320aic3x_fix_reset-v1-1-c040d86a4b93@phytec.de>
X-Cookie: Editing is a rewording activity.
Message-ID-Hash: UAMBYL6AWADUUQDMVMVAH5SJRCYCQFF6
X-Message-ID-Hash: UAMBYL6AWADUUQDMVMVAH5SJRCYCQFF6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UAMBYL6AWADUUQDMVMVAH5SJRCYCQFF6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ss51HuvtAhdbVrv8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 09:16:46AM +0200, Benjamin Hahn wrote:

> The TLV320AIC3007 requires a hardware reset after power-up for proper
> operation. After all power supplies are at their specified values,
> the RESET pin must be driven low for at least 10 ns. Even though the
> datasheet sais min 10ns, I needed more than 10ns when testing this out.
> 15ns worked for me.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

> -		if (aic3x->gpio_reset)
> +		if (aic3x->gpio_reset) {
>  			gpiod_set_value(aic3x->gpio_reset, 1);
> +			ndelay(15);
> +			gpiod_set_value(aic3x->gpio_reset, 0);
> +		}

This seems obviously buggy, it leaves the GPIO with the opposite state
to that it would have prior to the patch.  It's also not joined up with
your changelog, that talks about actions taken after powering up the
device but this is a callback run after power has been removed from the
device so nothing in your changelog motivates leaving reset deasserted.

>  		regcache_mark_dirty(aic3x->regmap);
>  	}
> =20
> @@ -1813,6 +1816,10 @@ int aic3x_probe(struct device *dev, struct regmap =
*regmap, kernel_ulong_t driver
> =20
>  	gpiod_set_consumer_name(aic3x->gpio_reset, "tlv320aic3x reset");
> =20
> +	/* CODEC datasheet says minimum of 10ns */
> +	ndelay(15);
> +	gpiod_set_value(aic3x->gpio_reset, 0);
> +

This seems more relevant to your changelog, but I don't understand why
aic3x_set_power() is not also (instead?) updated?

--ss51HuvtAhdbVrv8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb7GJMACgkQJNaLcl1U
h9BieAf/Vp5HfjKUfjOE+hQQ22cmOPcRL2UDliOw+WcX/kxj1TfBpi34eMlq9njN
D/tYemfgRJ6+oro0mi3vBb+tETc3XkQWqOXBEtogrOmQyjZLRW3SBYqcFUX2rwBA
iG2U+132Mw6cGF6HA9obD+W9zIlB8vDg+FktjJ1FTkyo2Wjk7IFgkbNl1q+V5gk5
5t2PIRfDuxCG9GwN8QZzDXZUlsN9Q8kF647JXP3CezOxr8UwUfjZENRD/UaENwol
rUW+5drNKUk+brOMPKGSD2IRY6nE9rnWpGRkoNQuFbwZgyALOZ5NHpJdBsHrV8hc
aUvt4u7yfr6Q1+pM2GT8sO9lSABsWQ==
=+A+z
-----END PGP SIGNATURE-----

--ss51HuvtAhdbVrv8--
