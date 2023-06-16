Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E50733141
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 14:31:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6730582A;
	Fri, 16 Jun 2023 14:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6730582A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686918702;
	bh=Cj+Wk0BwYW8r8EUY/TzZICqsApqGJ5k+uKM7KjKEwUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JJ/1q0l0WOwUKa90w7briNGs9uQbc5tUX0Eb/Wj5fEnPeFK9Lxi88WrGOaogtZcFF
	 SPmyCu0QM5eKfwTsife+2r3XdVz8x9wCkMVo+MDIrBKgmp+ovT+KjJ8wxqPgsHC4ur
	 7q/6IlUMd1e6++KlcHgQoPQZXPeugEpmm3PxUInk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A241F8025E; Fri, 16 Jun 2023 14:30:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FB02F80132;
	Fri, 16 Jun 2023 14:30:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F351F80149; Fri, 16 Jun 2023 14:30:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67D2FF80093
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 14:30:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67D2FF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qQPl7pv8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 89F4E61DB4;
	Fri, 16 Jun 2023 12:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2587FC433C8;
	Fri, 16 Jun 2023 12:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686918642;
	bh=Cj+Wk0BwYW8r8EUY/TzZICqsApqGJ5k+uKM7KjKEwUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qQPl7pv8SnN6vVdFbJ0RBIjxiGIjUQmSY1sgv5lLTp4jjTcJP3OoK5HvqI6bP/Ypu
	 5kpPJ2BwVQ7qwaO1o8T4KnmMsx2ZZqHX2Y21c8a9oVOxCLWAVM35bN9qRKvNaiJw2n
	 GK0qUhd180e++VIBOtSWbGQ6b9kHGnPg6Dk1sYcR+LMltWGv3e6xgdvQlf5SutvEu9
	 LqSXTjkFDAvO2nBUwJUQ0h9vfuIJo24iBoTqcycTGSQYCUT5B8RFelk4uEuIMZFCaM
	 Up7G8vBCXrKy4qsAXOSwaNJPjOTDbVxKU9zTr18dv+tvtFUFqI8Lp9ebv7lgEyMZ6N
	 nBWYS7DZxzghQ==
Date: Fri, 16 Jun 2023 13:30:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: tlv320aic32x4: convert to DT
 schema format
Message-ID: <993767ab-d7eb-440a-9f13-026821fd1f61@sirena.org.uk>
References: <20230616083549.2331830-1-alexander.stein@ew.tq-group.com>
 <4930994.QJadu78ljV@steina-w>
 <3ddb3d09-2a9b-4a25-8108-a79ea83a9dd5@sirena.org.uk>
 <24617723.6Emhk5qWAg@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HTPZ85NJJ/wNaNFk"
Content-Disposition: inline
In-Reply-To: <24617723.6Emhk5qWAg@steina-w>
X-Cookie: P-K4
Message-ID-Hash: GF4BW3HMK2FNHACDYCYNCFRHTUCEKCQO
X-Message-ID-Hash: GF4BW3HMK2FNHACDYCYNCFRHTUCEKCQO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GF4BW3HMK2FNHACDYCYNCFRHTUCEKCQO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HTPZ85NJJ/wNaNFk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 16, 2023 at 02:24:17PM +0200, Alexander Stein wrote:
> Am Freitag, 16. Juni 2023, 14:21:29 CEST schrieb Mark Brown:

> > That'll be the issue, yes.

> Ok, there is nothing I can do, right?

You could check for dependencies and tell me about them.  For example in
this case it turns out the issue is that there's a fix to add supply
names that went in which is only on my fixes branch.

--HTPZ85NJJ/wNaNFk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSMVewACgkQJNaLcl1U
h9CYJwf/YE21gNPFb/6PxnNe3XkUBbbIUIS7j43aaipTwoIvtSBe5Mk2EplxjCHO
y/MgVq56mF4rQ4pSD301IsCW2Ls9yspsIVOnnx94uxkcsjpZ2UAjgTAbVkdWdbCq
rp8f5WpVBBqB78HmvRqyvlKfxQa6dRNQby7Q6WiqPp8RuiwAOFQz8rI47FVLU81n
y7QgwrJBNW4baqcGRbWrf/foTOxYJTsEnT1jYA4sLuEcTvrAa3/svDs1y8+EHPaa
3WJG9CALR9paLEJF+DRSjiifN95qekn14fP/Yn+MHACZM5VC/MnSjT8Wo9Ad7eXG
YA9i2qtt2w85GOELYTo5k0mnqQsf7g==
=C+td
-----END PGP SIGNATURE-----

--HTPZ85NJJ/wNaNFk--
