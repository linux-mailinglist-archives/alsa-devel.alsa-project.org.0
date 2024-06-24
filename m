Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5850A915299
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 17:36:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D232E825;
	Mon, 24 Jun 2024 17:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D232E825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719243398;
	bh=EgQFS3N3hCwlYCyajVqk4Zaaf9e5hnpWdPb+4aYNjC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rlBzAkbXw3s2hmGc60s4K2di1YK5NLt9vnFCzGV7P4TEtLqcC/cMdYw1zX5LHhDS5
	 7gDP0/PzjjP6dxaoYmCOWwlq0bRu6hX144Zrqi/XdbqgdI1Pp2EAGA8J3A79ZlyPtm
	 vxaqYyf62dauh5mZzilyQNagDqD+JUMKqwFpAeeU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EC73F805B3; Mon, 24 Jun 2024 17:36:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84ABEF805B1;
	Mon, 24 Jun 2024 17:36:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4A00F80495; Mon, 24 Jun 2024 17:36:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8861F800E4
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 17:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8861F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VjdGYeA4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA8CB60CF6;
	Mon, 24 Jun 2024 15:35:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0105BC2BBFC;
	Mon, 24 Jun 2024 15:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719243356;
	bh=EgQFS3N3hCwlYCyajVqk4Zaaf9e5hnpWdPb+4aYNjC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjdGYeA4syzMQZkxTRcer3cCsEaZxlx6PKpC99s07L7jeXNfAmqzvLSO+v4dBYaxQ
	 AX0b77QZbhnNZ7Qy7JtrjGDQto6t2gz7pFX92K3sXHG+xeSp6gErNWRSOYIvyrja6D
	 wg1GUFhI9hVdaGAdrJ31iPl3w8xs0q+iKi5WMyuTl+5I06itUm5nlEtjpW8f3AnM1F
	 yPnRlJtChYQDVVhA68QbC/tOZC7wCSZ7gEqMvpOpq2Di2PFvOzQauYzX7PLFL09j7q
	 czo90fYVYggkHsFmllID/Z4qSPsQkbTo9dquxtKWd7rBtCrUAolJLKYUMYzIDu7YpS
	 EpxZ3cL/IDbvg==
Date: Mon, 24 Jun 2024 16:35:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 2/4] ASoC: Intel: maxim-common: add max_98373_get_tx_mask
 function
Message-ID: <93abf3e8-ceef-4ad4-923f-ad7f9d9d7f85@sirena.org.uk>
References: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
 <20240624121119.91552-3-pierre-louis.bossart@linux.intel.com>
 <f3b5caee-a27e-42f9-b541-4f6bf8e8d2f2@sirena.org.uk>
 <9394ab7c-d628-489b-9b88-66eb11fca0d7@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gELP69sMmSUr3IJ+"
Content-Disposition: inline
In-Reply-To: <9394ab7c-d628-489b-9b88-66eb11fca0d7@linux.intel.com>
X-Cookie: Allow 6 to 8 weeks for delivery.
Message-ID-Hash: CD5T6WN6QCFVLMPV34L3U24YBA7SAOM6
X-Message-ID-Hash: CD5T6WN6QCFVLMPV34L3U24YBA7SAOM6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CD5T6WN6QCFVLMPV34L3U24YBA7SAOM6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--gELP69sMmSUr3IJ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 24, 2024 at 05:26:37PM +0200, Pierre-Louis Bossart wrote:
> On 6/24/24 14:37, Mark Brown wrote:
> > On Mon, Jun 24, 2024 at 02:11:17PM +0200, Pierre-Louis Bossart wrote:
> >> From: Brent Lu <brent.lu@intel.com>

> >> Add a helper function max_98373_get_tx_mask() to get tx mask from
> >> max98373 ACPI device properties at runtime.

> > Similarly here.

> I may have misunderstood Brent's patch but this isn't a fix really, more
> a cleanup to use ACPI when possible, with a fallback to the existing
> hard-coded setup if ACPI properties are not found.

> I don't think it's a real 'fix' impacting users, in the linux-stable
> sense, nor that this needs to be back-ported with case.

> Brent, please chime in if I am mistaken?

Yes, in this case the issue is that everything else looked like it
should be a fix but this isn't.

--gELP69sMmSUr3IJ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ5klcACgkQJNaLcl1U
h9ATaQf7BS0MRUDq8ll2yZy/3GxQTDr1QWBMj4d8XiPFn1wPdMU4X105ErVUPZSa
hRop3SqlCJlrJ+YfqaCfjtq26517mHXrUtADTN3zmGcJIjG6UTmjox2pFxI82yFa
wxxDrRUCTLnZwIQJDZGy2zQPvXueWy9+psxHKMM2K7t47feb43Iw2drpxByKUUYQ
H1DCxOT1Dv6ZEsVLqpzrhfAuE8MAxBB75g76BoiDvJBpvyDheuVZqMfFIHbsCmwZ
sUPE7SvN04hbB5xaj88TFxcBoe1AfmL9roQAGUcd8w08QdNBRuOHht4291Dpa8mm
ss5+gq0LDmeHVQjVJo4Dq8yf7oeXpQ==
=0k7m
-----END PGP SIGNATURE-----

--gELP69sMmSUr3IJ+--
