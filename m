Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FDC90D7F8
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 18:01:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B92984A;
	Tue, 18 Jun 2024 18:01:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B92984A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718726486;
	bh=gGAzyIFzGGDKK8SXh3zCzIQoM2rl5XEz/31HIoG9EVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QPyzPGTrOvHQEDTJoBx0AHU98fEUe8Cj1zlF8BUAmVSvxaYNrkTprSpmB/nZKaRoW
	 LrvlJ8LEthflwEb2abnvYr//0/3M57YfCCw76MztEMH9fAyvPKAENUCHamLs1UikVh
	 Fej6eMXRIYP9WWkHR8YXUQFNMMXf/NcQt6tAaxcg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A31BF8023A; Tue, 18 Jun 2024 18:00:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E6CBF80589;
	Tue, 18 Jun 2024 18:00:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B92C9F80266; Tue, 18 Jun 2024 18:00:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3D35F80236
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 18:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3D35F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NKfKnfHY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4B437CE1B75;
	Tue, 18 Jun 2024 16:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDB8C4AF1C;
	Tue, 18 Jun 2024 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718726426;
	bh=gGAzyIFzGGDKK8SXh3zCzIQoM2rl5XEz/31HIoG9EVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NKfKnfHYIzr74jn4RAxwFojT5SFTDksL1/d/wNaroGzQogdN5LNVWqUaO2ZMNe7+t
	 m5UmF0zimg/97dCATCe8BBFIeprEEx+3DVeJD2O9PDC2tr/VIBLiLNsQozt1dEOEdx
	 uwbhpoRI6AnGYEWNWPRntOJ+9rgxsw51fIYX2FmvEAO4eSKitxdJ6BYv/WzCb8K3Pa
	 zhORkJirpA98Lt84Pqa2evcuJT8Ut87XK5SOSIgFpXh9fvSLcDKU4lgKQ9sjzLsXcc
	 S/2ZB+Izd3SCxLCj/oDdSE0yj8iaisaUB1RWJuyeNE3O4m5z8EAzQp0lyqwni3fKi0
	 VspO/rkQ6ap2Q==
Date: Tue, 18 Jun 2024 17:00:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Simon Trimmer <simont@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l56: Accept values greater than 0 as IRQ
 numbers
Message-ID: <a2946d8a-1ead-4514-b1a4-9c04e37cd8a8@sirena.org.uk>
References: <20240617135338.82006-1-simont@opensource.cirrus.com>
 <917507e5-dc6c-4e18-a7e1-554625de604e@sirena.org.uk>
 <3451fcf6-ff33-4f72-83d1-945b026b925b@opensource.cirrus.com>
 <007b01dac0c5$7807ac30$68170490$@opensource.cirrus.com>
 <f04958f0-b9e9-4f80-8a83-af9740fa83a0@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Atk4irYPm/lHjafU"
Content-Disposition: inline
In-Reply-To: <f04958f0-b9e9-4f80-8a83-af9740fa83a0@opensource.cirrus.com>
X-Cookie: If you can read this, you're too close.
Message-ID-Hash: HD5MQKBOB5W2NCI2QDGQEOB4G7USGVRW
X-Message-ID-Hash: HD5MQKBOB5W2NCI2QDGQEOB4G7USGVRW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HD5MQKBOB5W2NCI2QDGQEOB4G7USGVRW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Atk4irYPm/lHjafU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 17, 2024 at 03:54:04PM +0100, Richard Fitzgerald wrote:

> So 0 is invalid. Question is: is it also valid to pass -ve errors, or is
> 0 the _only_ invalid value?

Negative values should be fine.

--Atk4irYPm/lHjafU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxrwcACgkQJNaLcl1U
h9CZCwf+MWegKStTJHnfpzHkwKbAeRVIQymvXLtQy3ewdm0Ii4UsrIG1892Nxa2g
2GD3D6wk6vtRahK9Ek6WTjg81a/B2v6CMwFeUWmb0CV6n1KXyicgFVyKtw4jJcL6
M/G0D6Z6KKfRsKcot4JstoeMaepv8pZ+znOn0vmDPRQrTk3gwDkPPyTTkbiVtYbc
PwJg4VtHZfyUgPzEhRSXz1LYp0npuxf17FBjAZFley2VwqmM6BLrYFrypqtXopM6
GS/InTSR7BsUYmcAfWc7WXdCy9BT+ibj5D8BY9/FRhHDv5nvyxrGavUEIv1SzIFc
dfx0dIe2RZMGDt4XBHsrpu2sr+Hu5w==
=a8if
-----END PGP SIGNATURE-----

--Atk4irYPm/lHjafU--
