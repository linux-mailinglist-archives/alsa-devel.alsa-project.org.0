Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9139861874
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 17:50:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D63A8844;
	Fri, 23 Feb 2024 17:50:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D63A8844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708707018;
	bh=wsLHvynhU6z1GefHwQExyJOvrdLzMQ/mqdXsNft5llk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j1q6MgySNSv1gsz9kq4DaqCZiQ8eY3NHRu+ugLlib/s96Xa/FeyaiG2GjX9oU3RIF
	 Wllb82NZD4IsdxFVevpG46+2asD1SpD2lPnrWPYYG6QUbdXQ8WsUI609PMkhlnLoz3
	 hBF8efrO/BQ0AQY277jwm78cRSHnr2QPjKnRxprk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A66BF80571; Fri, 23 Feb 2024 17:49:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 617BEF805A0;
	Fri, 23 Feb 2024 17:49:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F51CF805AD; Fri, 23 Feb 2024 17:47:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8588EF800ED
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 17:47:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8588EF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k1OIUjnn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4A0563330;
	Fri, 23 Feb 2024 16:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF91DC433C7;
	Fri, 23 Feb 2024 16:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708706852;
	bh=wsLHvynhU6z1GefHwQExyJOvrdLzMQ/mqdXsNft5llk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k1OIUjnnzR3bcdJrhXjHDcRKbVeXEG/hqgEpXErt+sGy0AG9+VOW9QUb7IRibNB2v
	 8owmndFnwuMOOB9HhbCSPZISsq+xIU89/thAZO8w4+IxML1KdI2Q0fPJIOnGFxmeDR
	 GOVYuiwQAfr6+0GQ8kSLfS4xT+cja2xNGrqvAYkuMREqH8QpipISNzbqlL3Cre+X1c
	 821O6ZjngP+7EYqyClS+/e2w64YYEaj3uiK3dGotwcJtiwcfEL9oM4BYHzUao7rDM0
	 YxzYTVuhblDwUPBBY3jtgC6KpJudnkH7IJrAouup3wm7RxbIFA3n7WNpBceDMf0ljO
	 8VQGPKXPumGNg==
Date: Fri, 23 Feb 2024 16:47:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v2 6/6] ASoC: cs-amp-lib: Add KUnit test for calibration
 helpers
Message-ID: <ZdjMIVYp7Qb/Tt9d@finisterre.sirena.org.uk>
References: <20240223153910.2063698-1-rf@opensource.cirrus.com>
 <20240223153910.2063698-7-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+NiID9uOcNnKcD/H"
Content-Disposition: inline
In-Reply-To: <20240223153910.2063698-7-rf@opensource.cirrus.com>
X-Cookie: You might have mail.
Message-ID-Hash: 65FHAECP3AAYQ2ZMUJMTXWTZOMC6CQEC
X-Message-ID-Hash: 65FHAECP3AAYQ2ZMUJMTXWTZOMC6CQEC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/65FHAECP3AAYQ2ZMUJMTXWTZOMC6CQEC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--+NiID9uOcNnKcD/H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 23, 2024 at 03:39:10PM +0000, Richard Fitzgerald wrote:

> +config SND_SOC_CS_AMP_LIB_TEST
> +	tristate "KUnit test for Cirrus Logic cs-amp-lib"
> +	depends on ACPI || COMPILE_TEST || KUNIT

Should this not depend unconditionally on KUNIT rather than KUNIT or
some other stuff?  ie

	depends on ACPI || COMPILE_TEST
	depends on KUNIT

or equivalent.

> +#define TYPESAFE_ACTIVATE_STATIC_STUB_PTR(test, fn_ptr, replacement_fn)		\
> +	do {									\
> +		typecheck_fn(typeof(fn_ptr), replacement_fn);			\
> +		__kunit_activate_static_stub(test, fn_ptr, replacement_fn);	\
> +	} while (0)

Should this be somewhere more generic in the kunit headers?

--+NiID9uOcNnKcD/H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXYzCAACgkQJNaLcl1U
h9AdaAf/Vs9JrSrEhXziKNX6iqehN1Sj3RcplxRM30tl9i3P1mw5PLxE07esKYUj
hHzcS+MzZt3Jo30134eXcbH4IwAQW5KwQoGlaAaqSmZq57heZrFmAkxYzyHjmO3Q
PYD4gmPiKY6suY1M8Hc2x+MbJzKGXLutlIUnUlyfZFJNRK9vuEUr1jdsfIOVd8AP
fjE6pUBRi79IKlNBDur55KdFgzt9q9J+x6uDWOz1GizJbNWrd8z9BjRcXJtVnLMY
xobl/4INIePPiblwq3X8d46UUez1xmo/XgoXEYKelQlt6E+dmGO90/cp3bokDUw5
Wl3swEjTyJThlczRmjZitXH7JqCUUw==
=uxPg
-----END PGP SIGNATURE-----

--+NiID9uOcNnKcD/H--
