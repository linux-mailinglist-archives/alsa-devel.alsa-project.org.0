Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFE7748DB4
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 21:24:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14062820;
	Wed,  5 Jul 2023 21:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14062820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688585050;
	bh=XkVpsUMAas5eIwMCK29P6mupS9x7AHoqzqeWqww4zek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vp9PaEYNu+WBxVExLmg/E9TFveGqbKbY2Zvluxm4UDbmve+o/2GzDcoKq+KU8+LBm
	 O1KBs6MeuSFUK+yfPz7F2Lc/dT1t+ilPwM56TWjxHS3gjBxhdYR/SaV+0DuvD7c6EQ
	 /350VtTU9MrUZ6+jZiL4e+SXVNP8yRkUFFtNM1Gg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9213AF80125; Wed,  5 Jul 2023 21:23:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 147F8F80125;
	Wed,  5 Jul 2023 21:23:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36B03F80104; Wed,  5 Jul 2023 21:23:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDCC5F80125
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 21:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDCC5F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eNl7MYi7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 12430616C5;
	Wed,  5 Jul 2023 19:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3813CC433C7;
	Wed,  5 Jul 2023 19:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688584990;
	bh=XkVpsUMAas5eIwMCK29P6mupS9x7AHoqzqeWqww4zek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eNl7MYi731YwNgsgM/VwIqWPCoZUNk0bnt3+OStb36lZZCm+6qhcnoPIgV5j+ziht
	 hVr94DU8Jay65as+NyTdkTyby1mDqoTxh1IjK1SHgJSbHhCGbwi5pNEGv8sMiOByOh
	 GKDQZHyNXX+mpxM2tpRqOn4YfMtGFVhZ4qrLn9OBxraO1IZwBGCiSBuzuJTbnkYGXI
	 lqnMqho2MgW3jb/iSaYQTBHqlsR2P1tvYKXreKn4uenMO9QoTIT6MRg3nkvq+27Jds
	 24ZU6wAVtUcid427JvedRqKRIxbIuzDoaI7Nvy33/HD/uvStyPDZaQfCx/8pW2Rzwx
	 +IGEg0bKCFjDw==
Date: Wed, 5 Jul 2023 20:23:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	peter.ujfalusi@gmail.com, jarkko.nikula@bitmer.com,
	dmitry.torokhov@gmail.com, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 3/3] ARM: dts: omap4: embt2ws: Add audio support
Message-ID: <9014a59b-5972-484e-ac70-c013e049b140@sirena.org.uk>
References: <20230705190324.355282-1-andreas@kemnade.info>
 <20230705190324.355282-4-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pcNKJC6KNSizl/+7"
Content-Disposition: inline
In-Reply-To: <20230705190324.355282-4-andreas@kemnade.info>
X-Cookie: Don't feed the bats tonight.
Message-ID-Hash: Y5VXEEOFCOI6CJVHNJPM7MI72GBEHXDP
X-Message-ID-Hash: Y5VXEEOFCOI6CJVHNJPM7MI72GBEHXDP
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y5VXEEOFCOI6CJVHNJPM7MI72GBEHXDP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pcNKJC6KNSizl/+7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 05, 2023 at 09:03:24PM +0200, Andreas Kemnade wrote:

> +	sound {
> +		compatible = "simple-audio-card";

For new usage audio-graph-card2 is preferred, it's a superset of the
functionality and much more flexible.

> +		simple-audio-card,codec {
> +			sound-dai = <&tlv320aic3x>;
> +			system-clock-frequency = <24000000>;
> +		};
> +	};

Are you *sure* the BCLK always comes out at this rate?

--pcNKJC6KNSizl/+7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSlwxcACgkQJNaLcl1U
h9AxHQf/dak+OKZYRo/pero4Ava2YorLLQDCh8ADYq1T+GPQnaWaBTdq0golyC18
AlqjHoluidxXdpB3UWSe9x0dlvNCpGCuVXnlWOTXDEG8DSK3S0PPbbNEEslMQh8c
SBLHqRGCn2PQkurZiWVJYHRmkM79+HlVSC58kHit3ErbDsesSCrdyPSAl8UspAo7
/jtUhvbU7+NmPj9DQ7JDwdJrQouIel015F1YmjLPHBzlMecQ0kernj55wb0l0K/N
ytyuHhQyyadBVaGh0x9EoctC3/Nbk1ETR45Xlg9eIlSGwUTnyDzF/PhmlT9CVj6s
ZrL++EXT411pHGrqVeBIgUE9Ht9fpg==
=QPu1
-----END PGP SIGNATURE-----

--pcNKJC6KNSizl/+7--
