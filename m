Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2444A87CE25
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 14:34:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBB412319;
	Fri, 15 Mar 2024 14:34:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBB412319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710509668;
	bh=JfFjAgEhqLnBfKgjQe9qzywYHRntA6N/TCPrlY0SO3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vSjmRXXw1SbLKGwyuldfJTdgcOoMYBRujRR+SomRUpzUi0dkllKev10HPVw0vaEjb
	 yujoTctBGewLsFU+l+qMZXQq5B2Hu6AO5ns9jJqaYq/HKWzIuVXy+eFEyzBcRPTa6W
	 LBtSmTe8VmNAb0RiM3rhrvd8yFV/nR6WvIcrV/Iw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 821DCF8057E; Fri, 15 Mar 2024 14:33:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F3DBF8057B;
	Fri, 15 Mar 2024 14:33:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B824F8028D; Fri, 15 Mar 2024 14:33:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8506BF80093
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 14:33:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8506BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aqYoumkN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FBD4616D5;
	Fri, 15 Mar 2024 13:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1682EC433C7;
	Fri, 15 Mar 2024 13:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710509612;
	bh=JfFjAgEhqLnBfKgjQe9qzywYHRntA6N/TCPrlY0SO3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqYoumkNxTsioqSB8CHVWJv6WqJg7w80kOK6LuxD1ntomlPu2KhueYUskFagoOWcV
	 +/GjL/DAHUdcNR9lvwtkhKtwlRxaMhAv/b+c2X1Wr1J/+op42sMSrJYd11dOIStcRe
	 sD8Wsy1gnp7j/MgKDTbm6sc1Vi6hOZ9PwGlNWJBVz5Hl5puzNVm+BIwNOYT7l3I9Up
	 q3w9tASq5ZFgvWlIwcQlOstwahLObdzOuPViX3fhg+nIJyjfoqcWW1G4cdjJUe6JVh
	 40RmBTRBjMvoflBe/rhfxo04DMidctU7GO2AIDeYBE4zZ0/4hurR2VoNINr8LCSNyE
	 FFrSLJjsySVZQ==
Date: Fri, 15 Mar 2024 13:33:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
	kernel@salutedevices.com
Subject: Re: [PATCH 09/25] ASoC: meson: g12a-toacodec: add support for A1 SoC
 family
Message-ID: <2a41e8b6-7e8a-4995-a1d7-c5d30e53c2d5@sirena.org.uk>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-10-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="whZtyi24go8F2IXG"
Content-Disposition: inline
In-Reply-To: <20240314232201.2102178-10-jan.dakinevich@salutedevices.com>
X-Cookie: A well-known friend is a treasure.
Message-ID-Hash: 26P4TKYG37B52JBOBS7KTCTJKEMMTU4Z
X-Message-ID-Hash: 26P4TKYG37B52JBOBS7KTCTJKEMMTU4Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/26P4TKYG37B52JBOBS7KTCTJKEMMTU4Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--whZtyi24go8F2IXG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 15, 2024 at 02:21:45AM +0300, Jan Dakinevich wrote:

>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
> -	.reg_bits	= 32,
> -	.val_bits	= 32,
> -	.reg_stride	= 4,
> +	.reg_bits		= 32,
> +	.val_bits		= 32,
> +	.reg_stride		= 4,
> +	.max_register		= TOACODEC_CTRL0,
> +	.max_register_is_0	= true,

If the maximum register is 0 how does the regmap have a stride?

--whZtyi24go8F2IXG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX0TiMACgkQJNaLcl1U
h9CfZwf9FCsJlpA0ZVHlgM+29kv/xJWAC/kxB2g9thms8cg6YPHLUd9VqS+DpK4u
Q1506N0mbJUukxVui6tAnM0IUp+AZDr/ZmpdA1+qqTmHXWJYdGW9AlLdwMKLrURg
HfnYEEeIqCizK2nTTVhOJfkIR9W7ynS35aFJvmsO4BYd1LD4eh4SeD+Qg+L+rW/p
rmEIYL1arUZjZy0n7oFuinL7TImzcPP64lNK2AN9ilTmp5QtoV6TX+Vs/3bifpct
GmTkrmSC7N+jX9S9djridoNIVNXjWGZIofNCpNZbOm+vnkwmAZ+jyKz5uPt+twrQ
R4METAHd4l9JPhWejRP3JBTwMZ3pug==
=VGfS
-----END PGP SIGNATURE-----

--whZtyi24go8F2IXG--
