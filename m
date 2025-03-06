Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5FAA54C10
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Mar 2025 14:25:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1061D60449;
	Thu,  6 Mar 2025 14:24:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1061D60449
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741267500;
	bh=yEyQhhaSjqb+DXE9qFOzKvbfoTk79XjOIz7G6/RPWlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J4+QXz+pnu93wJdjV+uTwd5cAiCtOhvR4pJT2GnLvDrl2FYMpKDAP/3SAhmfT8J2x
	 +bkpo5axZyETL1rIerztPVjIVfQrgp04QUF38cY9FjGwUCVbzoWhLfveOYBAUcuSm5
	 1Gb29FDw0mXFH4bucHCjIqSmikNVAfpPQ6t4+j6o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D4BAF805BB; Thu,  6 Mar 2025 14:24:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B8BBF805BD;
	Thu,  6 Mar 2025 14:24:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACD75F804B0; Thu,  6 Mar 2025 14:24:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E205DF8011B
	for <alsa-devel@alsa-project.org>; Thu,  6 Mar 2025 14:24:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E205DF8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iRw0Z3xr
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD3DC5C5714;
	Thu,  6 Mar 2025 13:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59360C4CEE4;
	Thu,  6 Mar 2025 13:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741267458;
	bh=yEyQhhaSjqb+DXE9qFOzKvbfoTk79XjOIz7G6/RPWlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iRw0Z3xrUwm6HrkldP3K5FZHJDnP2PMvFZNZ7Stf26JMngR6hTr7rmlElXAiPdKEo
	 VfpJk69ZwzwyJ34XkRm0Opu354yGBhJxCSlqVJk+zMWhheu3BYbk5t/pCE5hqIoOcU
	 m79kxbY9a+RE4CSXTQnSNJJUQJs6POZTy3EOGbEGgwcubGqIApsidX9bcL2iBZZXzy
	 bXWzyAirvp2WUu80gGopVikk565tJP5j0uGesJVvHRINcTmzkfnyd2DWMuQeDrePA9
	 H6EHPQpR5PKXjGhr7lUA0gAwPK0ERntdcHg9FFYL7rRXgA1CxR8mISAWpOBCqjCgUl
	 EKFCs6wP6Ujbw==
Date: Thu, 6 Mar 2025 13:24:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 1/2] ASoC: codecs: add support for ES8389
Message-ID: <b76309c6-9f8d-48d3-b4ef-9b51efe06acc@sirena.org.uk>
References: <20250306072354.19987-1-zhangyi@everest-semi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aRQddnKmtqkRfvv7"
Content-Disposition: inline
In-Reply-To: <20250306072354.19987-1-zhangyi@everest-semi.com>
X-Cookie: What!?  Me worry?
Message-ID-Hash: R2HCEXMWHVFIIIUKB3CODW2QLJU4XCB2
X-Message-ID-Hash: R2HCEXMWHVFIIIUKB3CODW2QLJU4XCB2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2HCEXMWHVFIIIUKB3CODW2QLJU4XCB2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--aRQddnKmtqkRfvv7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 06, 2025 at 03:23:54PM +0800, Zhang Yi wrote:

> > No, the machine driver should be configuring different TDM slots for
> > each device - that's the whole point of the API.

> We are using multiple codecs as a single device.So we can't use set_tdm_slot to configure
> different slots for multiple codecs under one device.

What do you mean by using it "as a single device"?  Multiple CODECs on
the same link is the main use case for set_tdm_slot().

--aRQddnKmtqkRfvv7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfJofwACgkQJNaLcl1U
h9AckQf/UgA9qYwstgflBVwRziKY7HlztKzqwHQHgRX2fbwt7Qok/EZZBKIXNZqN
yTfd3vYt9eBImhiGKvLsyRLGM1W6tDP0TdNvXDPIQJh5tEGg6mtAdZoHcn+k27Rs
84UcJ1hnIe9LHK1ghy/CprH6tcWmZJnjG67B9K1fc/SmDeIoFHsWxdXsf9O5rKxB
gNCX3mOLBm/dURWhWzjH4Qz+M1uYvTA4tlyTUSM8/fkAfliPsJW94wdXtCm59aNS
gIWyvc3UKZYWWsY/yhpNCUFn0wHR28RQu9Siph5wLexiJ0OQgst4OjBpGFldXaBG
YFpWtxg7xyhOkf6+ZePyEzvNWBBfEg==
=2LCd
-----END PGP SIGNATURE-----

--aRQddnKmtqkRfvv7--
