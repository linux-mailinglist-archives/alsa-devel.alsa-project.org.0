Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1678F808FC1
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 19:21:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCFA183E;
	Thu,  7 Dec 2023 19:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCFA183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701973310;
	bh=AkGup3hcznxKyD5qZYbWXUKeQrXywPgfm2PxkeN+ljQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dZJE7FElVdARu99/GmRbHqO42YZhxwjtH79dbWwAL/PEK38Iakn17SWlfhOt7gFfN
	 HizFhAwkTKGlrUFRMvwVfK9QQlKzXLnYVngTHKZGcKMpPB0hMesO6zKXsM72cvNDFR
	 2Bs7az/tW/544wfcdVDxH73vrFvPlhKQYOza41Vk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A241F805A9; Thu,  7 Dec 2023 19:21:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96F17F80571;
	Thu,  7 Dec 2023 19:21:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1BCEF8025A; Thu,  7 Dec 2023 19:21:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 058C1F8059F
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 19:20:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 058C1F8059F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UGL1d6BE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 43176B829CE;
	Thu,  7 Dec 2023 18:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40FAC433C8;
	Thu,  7 Dec 2023 18:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701973254;
	bh=AkGup3hcznxKyD5qZYbWXUKeQrXywPgfm2PxkeN+ljQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGL1d6BE3R6ufSUslO2HlhwFKBs6wMppMCBwaPeb4FwdrkazLQsjoONXUKTvwqja+
	 uA9l5dia46T7nQmI7KuGEwanRLoYCiKSpEgh3yeA2FKi1Mup9uadrMnBZ3griSY/51
	 ejn3vv1ysc3Ri54FHMTPlnZX/WsHMlU/zNsivz3XjhCQ/X5BgcRfUXAZDxRdSEjGPj
	 FhoH9sD53vMhDFjY4KIpMSQ6kdzmNedftxFsWiR0JDuMqJm/7D4bTbCyAxM/ONwHpT
	 /CQ4D3rh5i2TGw93hZLaIH0oeqEDlLmPNHi6OWz+jIX+aq2UQV/hk74L45uGQVdAM2
	 DPyfao3RO9hwg==
Date: Thu, 7 Dec 2023 18:20:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 03/16] ASoC: tas2781: disable regmap regcache
Message-ID: <0b836c10-b21b-4275-8dd0-254dd5467497@sirena.org.uk>
References: <cover.1701906455.git.soyer@irl.hu>
 <21a183b5a08cb23b193af78d4b1114cc59419272.1701906455.git.soyer@irl.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="87ASVyUZXk4suEIf"
Content-Disposition: inline
In-Reply-To: 
 <21a183b5a08cb23b193af78d4b1114cc59419272.1701906455.git.soyer@irl.hu>
X-Cookie: Two is company, three is an orgy.
Message-ID-Hash: ZXIF2A7KAOVILGTQE2YD756N72AJ6DYT
X-Message-ID-Hash: ZXIF2A7KAOVILGTQE2YD756N72AJ6DYT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXIF2A7KAOVILGTQE2YD756N72AJ6DYT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--87ASVyUZXk4suEIf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 12:59:44AM +0100, Gergo Koteles wrote:

> The amp has 3 level addressing (BOOK, PAGE, REG).
> The regcache couldn't handle it.

So the books aren't currently used so the driver actually works?

>  static int tas2781_system_suspend(struct device *dev)
> @@ -770,10 +758,7 @@ static int tas2781_system_suspend(struct device *dev)
>  		return ret;
> =20
>  	/* Shutdown chip before system suspend */
> -	regcache_cache_only(tas_priv->regmap, false);
>  	tasdevice_tuning_switch(tas_priv, 1);
> -	regcache_cache_only(tas_priv->regmap, true);
> -	regcache_mark_dirty(tas_priv->regmap);
> =20
>  	/*
>  	 * Reset GPIO may be shared, so cannot reset here.

How can this work over system suspend?  This just removes the cache with
no replacement so if the device looses power over suspend (which seems
likely) then all the register state will be lost.  A similar issue may
potentially exist over runtime suspend on an ACPI system with
sufficiently heavily optimised power management.

--87ASVyUZXk4suEIf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVyDQAACgkQJNaLcl1U
h9A5HAf+Nlxq4xn9n9KdkGpBh57gkb+jV1RuCOHHhqKL7UAdfrt91gUdNVLq1Gvi
ReW5ZeaUE9EjXZo9FGiFaEc6WEP0TzDJi1a7bOyjtR09RU3ec03i8qd32LO7seEd
n/zyRK+X7umxfYsZGTJiXpzLyN9VC96bh6jNkHJmeToQ5LXZsicJ1bolctD6gfXK
8c7YEYL6Jrfx4Q3yfloOfHPHMzFrIrA+08fny0Dx+kaMfsWYGk2VcmaSYUbaP9y4
OhDEOF1sy3RiXsHJxDNIZubb71fuOqSszQQbS2At9b98GwTVTs8xnM61Xx/Yv1gq
8oQk2dsruB2j4P0IeFFcVp3UOQGKiA==
=F7Ae
-----END PGP SIGNATURE-----

--87ASVyUZXk4suEIf--
