Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10267A2F661
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2025 19:05:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4938E601EF;
	Mon, 10 Feb 2025 19:05:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4938E601EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739210734;
	bh=KBxW8DsHcZ87unV3h7k+wL2Y32A/tCtJpwYI2YBwfmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LY2Jyoh/6a+ailoBapF5waqRESeKv48KtdQXbn6u9f6IAK5b2immQsAimk/x5NqCG
	 K/nUEqBEioLQvAl7U+cq7q5VUTCVOyJywaD1uqNeYzf4NQsBwWKCQO01bY/xu6jrh3
	 i0FOHfh5DGv3uUrsbD3YMQ4KE78LQMNkLb//TqI4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C7E0F805B6; Mon, 10 Feb 2025 19:05:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ECF1F805B1;
	Mon, 10 Feb 2025 19:05:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4003FF80424; Mon, 10 Feb 2025 19:04:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5EC13F8010B
	for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2025 19:04:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EC13F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B9sIvQqi
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 54F385C5BB3;
	Mon, 10 Feb 2025 18:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92305C4CED1;
	Mon, 10 Feb 2025 18:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739210687;
	bh=KBxW8DsHcZ87unV3h7k+wL2Y32A/tCtJpwYI2YBwfmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9sIvQqiKNR85NrtwtdLbUVamdboEBsD1afNju1mIgAROt6Ybx39weQrbuf/Yr6Gu
	 UK1qAQSkYyMyln+kAI3JA2w2yru4cUwZ2Ms/YXrO5iuYVzKJ4I9bvoA+DGFtHQbzg1
	 G2EQmep5PqBStYyaOKq16rPGzZtbvE/345L92+RkWQ3sylwBVoJKC7X5NhEkZb0JJg
	 eOo29uAcuW8z7D51IpS1dR3sy33XNoUDnO5yRxwvt+gzgn/I2ccY29ndAa64p544XI
	 nAcsSY58NNdbEj6/Gt1kLwM4fWODhkiuUnmvK4bOrsGZO6UYfveSRMJn4xP7hEK8Pm
	 A+GWGovFjpULQ==
Date: Mon, 10 Feb 2025 18:04:42 +0000
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	Mario.Limonciello@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 00/23] ASoC: amd: acp70: add soundwire and acp pdm
 support
Message-ID: <d1d08149-3b4c-44ff-99f0-34cdf70eb67f@sirena.org.uk>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
 <173920499691.65690.5029473211250633476.b4-ty@kernel.org>
 <d16ce74f-3320-49ec-a195-a473e03a9fc4@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fHWqgVKdO1j5+E9+"
Content-Disposition: inline
In-Reply-To: <d16ce74f-3320-49ec-a195-a473e03a9fc4@amd.com>
X-Cookie: A beer delayed is a beer denied.
Message-ID-Hash: MNICXFE7IRIRJT6AEWTGY4GQSJDCWZAR
X-Message-ID-Hash: MNICXFE7IRIRJT6AEWTGY4GQSJDCWZAR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MNICXFE7IRIRJT6AEWTGY4GQSJDCWZAR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--fHWqgVKdO1j5+E9+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 10, 2025 at 10:16:05PM +0530, Mukunda,Vijendar wrote:
> On 10/02/25 21:59, Mark Brown wrote:

> >> [...]

> This patch series should be dropped and V3 version should be picked.

All the "no commit info"s here:

> > [01/23] ASoC: amd: add register header file for ACP7.0 platform
> >         (no commit info)
> > [02/23] ASoC: amd: acp70: add acp pci driver for ACP7.0 and ACP7.1 platforms
> >         (no commit info)
> > [03/23] ASoC: amd: acp70: add acp init and de-init functions
> >         (no commit info)
> > [04/23] ASoC: amd: acp70: add logic for scanning acp child devices
> >         (no commit info)
> > [05/23] ASoC: amd: acp70: create platform devices for acp child nodes
> >         (no commit info)
> > [06/23] ASoC: amd: acp70: enable driver build for ACP7.0 platform
> >         (no commit info)
> > [07/23] ASoC: amd: acp70: add acp pdm platform driver
> >         (no commit info)
> > [08/23] ASoC: amd: acp70: add acp pdm driver dma ops and dai ops
> >         (no commit info)
> > [09/23] ASoC: amd: acp70: add acp soundwire dma driver
> >         (no commit info)
> > [10/23] ASoC: amd: update ACP7.0 KConfig option description
> >         (no commit info)
> > [11/23] ASoC: amd: acp70: add soundwire dma driver dma ops
> >         (no commit info)
> > [12/23] ASoC: amd: acp70: add acp ip interrupt handler
> >         (no commit info)
> > [13/23] ASoC: amd: acp70: add acp pdm driver pm ops
> >         (no commit info)
> > [14/23] ASoC: amd: acp70: add pm ops support for soundwire dma driver
> >         (no commit info)
> > [15/23] ASoC: amd: acp70: add acp driver pm ops support
> >         (no commit info)
> > [16/23] ASoC: amd: acp70: enable wake capability for acp pci driver
> >         (no commit info)
> > [17/23] ASoC: amd: acp70: add soundwire wake interrupt handling
> >         (no commit info)
> > [18/23] ASoC: amd: acp70: enable soundwire host wake irq mask
> >         (no commit info)
> > [19/23] ASoC: amd: acp70: enable acp pme enable during acp init sequence
> >         (no commit info)
> > [20/23] ASoC: amd: acp70: create a device node for soundwire machine driver
> >         (no commit info)

mean that these patches weren't actually applied, it's only these ones:

> > [21/23] ASoC: amd: acp: add machine driver changes for ACP7.0 and ACP7.1 platforms
> >         commit: 638ad2bdb2f994c8bd99cc40e0c4796a8617ccf3
> > [22/23] ASoC: amd: acp: add RT711, RT714 & RT1316 support for ACP7.0 platform
> >         commit: 187150671d83324f1ca56f7ab5e00f16a3b9f2a9
> > [23/23] ASoC: amd: acp: amd-acp70-acpi-match: Add rt722 support
> >         commit: d0252b0b945ec67fd09fc764dcadf445fb7757ee

which were actually applied out of v3, they just didn't change much if
at all between the two versions and the tooling knew about v2 as well.

--fHWqgVKdO1j5+E9+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeqP7oACgkQJNaLcl1U
h9CedAf/ZsWCQs6/Mc2bvzKDmUHyv5gG0Cth/lHH1QMSF7IeUH/+2IMIVFQf52vY
TrVmfy28j3JArmW2dUdvJTyNd++0xYXJohvfzFqwmwVSg12L7ySc/V0DKfWJdA5Q
IBMVLjHPRsM95fLq/H7vZzM0YhbGOY1cELC3Q07NmjJY2wGpTe7jetGeY2UPtuJt
p1Jn+7jMICABm+yl/k+XRetRwm7AeE8IX08PlN8wHGDLmM9HGU7zRm7TNjpXR+l4
LOBDApBYtLucv6ayJoAm08K3hBbKsrnlKtMNQshYmmL0tH2+UBq122p8eV/jt3AE
2MFE9Yzk9Pqj1Fzz9a4b+AJsyh9aKg==
=ZnvR
-----END PGP SIGNATURE-----

--fHWqgVKdO1j5+E9+--
