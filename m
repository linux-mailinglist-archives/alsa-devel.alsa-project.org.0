Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5D76C4B77
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 14:15:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 810FDE7E;
	Wed, 22 Mar 2023 14:15:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 810FDE7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679490956;
	bh=u9GikT43rfqNNchHEzB4MC9MRag1S1z9pDfJEAUESrA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=buVyKdi3BXuNDfh2HDQftHHVIxceh60HMhKECkS8Upy7Homn68HO0SCyEBNYyU+H0
	 rQ1LXIZsN5aBk0MiJuCjYApHGCN5FBE2OiJ/hDqnWB3qBac3NjNSDgPTJ8PuFRNgG6
	 +AQ8r1Au86G/AtixBAHO4Wq+4OHufvFeiM32Sshk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B867EF80254;
	Wed, 22 Mar 2023 14:15:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 272FFF8027B; Wed, 22 Mar 2023 14:15:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DAA4F80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 14:14:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DAA4F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HqdlowXM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E3B8ACE1D97;
	Wed, 22 Mar 2023 13:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73ED7C433EF;
	Wed, 22 Mar 2023 13:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679490891;
	bh=u9GikT43rfqNNchHEzB4MC9MRag1S1z9pDfJEAUESrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HqdlowXMk3DZJFG71QvOsdJ3Nt3cdYJHXOru5Q51NotqX9F+albV1whddzlSd9Vof
	 ShfquJWr2WtURNplk+TdeRhaGnqRVGV6ej0sL4l61cjjfewsHbFG1dlKjKcWlSzfrF
	 DpJWWjNpW1rmXGzWmX3xvSE9LWpS+r1M0hgFMpqC5WM3MXSq6e8HaeZJnoNcl2MyFH
	 cOhFaD0o2GPbnA10rLOn9XN4pf6STgYxSYlcbFcdRVmDb3XKkUAeDBj/BWf1+eQnL3
	 KbIRlc5khLIPwtPGUsAKNxs3OZXNoRgorioDh+e7ixpV1lT9cSRA5Uc1PQCKVx9mYq
	 JaSryf9u1o9HQ==
Date: Wed, 22 Mar 2023 13:15:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: (subset) [PATCH v2 0/8] Fix sound on ASUS Transformers
Message-ID: <ZBr/V8kEJqan38Nw@sirena.org.uk>
References: <20230308073502.5421-1-clamor95@gmail.com>
 <167933710348.198283.16107220354236772396.b4-ty@kernel.org>
 <CAPVz0n2AuCb7fmLkzdimiZvqneQw7gXCfMTRvhp1n1zwRckfaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MsWazqoCnTV+oHgS"
Content-Disposition: inline
In-Reply-To: 
 <CAPVz0n2AuCb7fmLkzdimiZvqneQw7gXCfMTRvhp1n1zwRckfaA@mail.gmail.com>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: I2RIRCTLX4I632AAQQY3OPPDYAHT3X4Z
X-Message-ID-Hash: I2RIRCTLX4I632AAQQY3OPPDYAHT3X4Z
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Takashi Iwai <tiwai@suse.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I2RIRCTLX4I632AAQQY3OPPDYAHT3X4Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--MsWazqoCnTV+oHgS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 22, 2023 at 12:56:06PM +0200, Svyatoslav Ryhel wrote:

> Thank you, Mark Brown! You have asked me to update commit name for
> codec machine dts schema commits (those, which contain CODEC in the
> subject), should I still update and resend them or you will handle those?

> I still need v3 to update existing device bindings to the currently working
> scheme. Should I exclude commits you have picked?

No need to resend anything that's already been applied, drop any
commits that were applied and don't worry about their changelogs
any more.  If there's fixes needed in the newly added code then
make incremental patches for those.

> I have DMIC fix for wm8903 codec driver required for tf101 and tf300t,
> should I add it into v3 or I have to send it separately?

Just send it as a new series.

--MsWazqoCnTV+oHgS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQa/1YACgkQJNaLcl1U
h9B5+gf/QdroK8bOm9/dNaSen/YbUl4L0XULQYZIRiHx0f8gYEP4ym0OV82dgFxg
3zi64foG8GRXipaY4+F1m8xPrKaetXjKcLu2BlqH6mKISmle4eUtbs5J+CYlrEFn
g2/XRw8UNhK6/U6fWCqIjT273HYOXESDXJodKAhgCKH4w+oT0xJVs/RIWq4wXQXa
vh/C9ewbN+xD1IUWnQ8hdIkHwsttxylFR/RwKXuooGC41hL85IGYMztsLqii/5BZ
ypxgQPO6KIhh8fo6uEfpWKcaW8ktA5S/zSDXNYSLpYj3JKkYvKrzqzaRyPyIYaHv
llA+8HogqAGyDQh6UnsU/2OPXuQHfw==
=YegK
-----END PGP SIGNATURE-----

--MsWazqoCnTV+oHgS--
