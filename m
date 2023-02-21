Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 707BC69EA5B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 23:42:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5474BE85;
	Tue, 21 Feb 2023 23:42:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5474BE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677019375;
	bh=0jWSrZiIEN4x32uRTklDrYs3W6jpjgamnp/3khg4KpM=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KpYYb9jUe/Xq4OcQ9t0bmBFCrVAGNfwynIeb4hKKcX17n60S+/YPkiuPVL/IZAPe8
	 MW93uo2Rq4kvSZIVxlIiCrLvo4DG47uWH/YSMvLf8jt3AQg/YVTx45Ax4QVVtKG1gM
	 R6/xicXIVX5FuT0YIjGvexeAJOAq+k0CuV2uvlfM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4D84F8025A;
	Tue, 21 Feb 2023 23:42:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9877DF80266; Tue, 21 Feb 2023 23:42:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94455F80125
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 23:41:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94455F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a8Cw740x
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 583DA611F4;
	Tue, 21 Feb 2023 22:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B47C433EF;
	Tue, 21 Feb 2023 22:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677019309;
	bh=0jWSrZiIEN4x32uRTklDrYs3W6jpjgamnp/3khg4KpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a8Cw740x+y9QfrLGKgcC2J8j48ETLPsHL6ZB57DG9jiyQejRF3aPx3uXfKG+AU76M
	 hnEJ0G5VrTVkQ15o8E626ubweoVSpx19c1CYVkf/krW0rlN98dt/3C0pgS7KX/tEG3
	 7oWCM/2NtObu8QWigvFXcAeaOLQ6sAo3Ic+2IJLuQhbQq9c8LuzZJUvfg9LfSDQF3U
	 8vlM3KCInnerWHFqeQcH6FNaC2JdIu+9jVf3T36nMAsvVHrZgK/IbyY4PnpSWqxE6l
	 2FVrtdTK+JWX33aOgsPTLmQVrrQX7OJXBzfQATXkeyxcFA5Vg/EkntAj9oOuZvNN+9
	 vekCI7YvuWHfw==
Date: Tue, 21 Feb 2023 22:41:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 09/10] staging: dsp: add support for Fortemedia FM34NE
 DSP
Message-ID: <Y/VIpVwFu5gUUcsz@sirena.org.uk>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-10-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t+XYRlFjbWnfVnHi"
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-10-clamor95@gmail.com>
X-Cookie: Serving suggestion.
Message-ID-Hash: C2EO2WIFABSW3VZV5IUWH6PGJZZ7465T
X-Message-ID-Hash: C2EO2WIFABSW3VZV5IUWH6PGJZZ7465T
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C2EO2WIFABSW3VZV5IUWH6PGJZZ7465T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--t+XYRlFjbWnfVnHi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 21, 2023 at 08:32:10PM +0200, Svyatoslav Ryhel wrote:
> FM34NE is digital sound processing chip used for active
> noise suppression mainly on ASUS Transformers.

This looks like it should be fairly straightforward to support
within ASoC without too much work, and since it's in the audio
path it should probably be referenced from the sound card it'll
end up having an ABI impact on the card.  Take a look at wm9090
for a moderately complex example of an analogue only device
(which this appears to be in terms of system integration).

--t+XYRlFjbWnfVnHi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP1SKQACgkQJNaLcl1U
h9DDVwf+K70Y1qVzg5TOp77al5H538FgUpnrUexBgtqevxsnf2pfTG1u1FhzAIPx
ailEywGHqikGuQiQnRlJ7QJ/nq2PVnZ48f+yjdRrvE5Y6gPfuVAVaXMUlO0cVF+g
gHuBj6tIxjz+ovqg9plyLwp0+6Pq2hkBOfMgRLU5YrfK2uUa991io9enHztwPJ1K
EDBwItdOm7Z7rA3eYR6SYwDaA/DrGoqcrZkj4JCsOYi6yxHUyoXWeRKUQUcC9G8b
KBTABkNAykYsDQpp1ePy5k3DNPeTzWCTlnp6FkEeVI2CSbiCO2WCNUamZR+LPS9o
DHJiBUmskQVX14bLBWBufAXsfXgFsw==
=ItYQ
-----END PGP SIGNATURE-----

--t+XYRlFjbWnfVnHi--
