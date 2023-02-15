Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95199698875
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 00:02:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1FD7100;
	Thu, 16 Feb 2023 00:01:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1FD7100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676502141;
	bh=qUAQ4o1k3Tx16YTQ5EJjEyz2cYifF3N6njNHqinnFqk=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C+v19bF9S9HmC53orRSHDkTkXVC6CHdSFS3+e2WS/mOB0PJ0WtpGQp1GH0XhI9vVh
	 CAxFQIsON+WIg4m1JepRg2YWmdwIbXJnxwIB3clyKtSY3MDi+0jqWYpOycbEXcL62X
	 0amED/erNFOpVpTy3u+gPpXko/aPys8BvE5tYEwA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FEEEF800E4;
	Thu, 16 Feb 2023 00:01:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56F91F80171; Thu, 16 Feb 2023 00:01:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDE7BF800E3
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 00:01:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDE7BF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WCpefWQK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 77D4DCE2772;
	Wed, 15 Feb 2023 23:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63738C4339E;
	Wed, 15 Feb 2023 23:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676502072;
	bh=qUAQ4o1k3Tx16YTQ5EJjEyz2cYifF3N6njNHqinnFqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCpefWQKqXBMBJNBJ/9+pRNem0PAWlKM61g89lD3yJ/ioHm1Sd3cHUz20oaDrU8q0
	 hmFi271nnK2TGxryySurJCjh8gsAPpY1TsRpnyh9tL+6+XLfCVYS1qXUooCXJrqXrG
	 VDPFtyNsrieJIpT/1/5Wx8trJiBJg6h4gGlLnFcKaFKG93JPSCKm1U5sgEdEQ9rbtk
	 P6xYMINwaww1aXpSAixISAsHC/tVGg5ySFRRPHAMkq+DvHpgdVA7ekjW3hweQMpEY5
	 pjdjmCvfPTqvSkFLU0kLMRsfW33OjnpGaUj7ctmzwDh9RRskxLTTE/cdGLNY9nXgp1
	 cnrNLV7KpdOoA==
Date: Wed, 15 Feb 2023 23:01:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <groeck@google.com>
Subject: Re: [PATCH] ASoC: da7219: Improve the IRQ process to increase the
 stability
Message-ID: <Y+1kNa8KYCUzgAfo@sirena.org.uk>
References: <20230215101045.21456-1-David.Rau.opensource@dm.renesas.com>
 <Y+zZwKFX1gMC5/ac@sirena.org.uk>
 <CABXOdTdv=+n8+UCgWUvyrZ6R0uAu48bODa3TA_2nUuMbUT7MUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e1E9LnR+Ahmxjv3e"
Content-Disposition: inline
In-Reply-To: 
 <CABXOdTdv=+n8+UCgWUvyrZ6R0uAu48bODa3TA_2nUuMbUT7MUg@mail.gmail.com>
X-Cookie: Serving suggestion.
Message-ID-Hash: 2YHMKSPHMJU4H5U3VL4AMUXC7P4UBM4E
X-Message-ID-Hash: 2YHMKSPHMJU4H5U3VL4AMUXC7P4UBM4E
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: David Rau <David.Rau.opensource@dm.renesas.com>,
 support.opensource@diasemi.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bailideng@google.com, Guenter Roeck <groeck@chromium.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2YHMKSPHMJU4H5U3VL4AMUXC7P4UBM4E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--e1E9LnR+Ahmxjv3e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2023 at 08:06:35AM -0800, Guenter Roeck wrote:
> On Wed, Feb 15, 2023 at 5:10 AM Mark Brown <broonie@kernel.org> wrote:

> > Copying in Guenter given the issues he raised with this, not
> > deleting context for his benefit.  It looks like this should
> > avoid the issues with the interrupt appearing locked up.

> It should since it limits the delay to cases where jack_inserted is
> false, but on the other side it hides the delay in an odd way.
>=20
=2E..

> Effectively this seems to be quite similar to moving the conditional
> sleep to the place where cancel_work_sync() is called. I would assume
> that will fix the problem (after all, the msleep() is no longer called
> unconditionally), but I don't see the benefit of introducing a worker
> to do that. Also, since there is no guarantee that the worker actually
> started by the time cancel_work_sync() is called, I would suspect that
> it may result in unexpected behavior if the worker has not started by
> that time, which I would assume can happen if the system is heavily
> loaded. It also makes the use of the ground switch (i.e., when to set
> and when to drop it) even more of a mystery than it is right now.

> Having said that, I don't really know or understand the code, so maybe
> this all makes sense and my feedback should be ignored.

Yes, I would certainly welcome more clarity especially around the
ground switch.  OTOH it does seem like an improvement over the
current situation so I think I'll go ahead and apply it for now,
hopefully it can be improved upon in future.

--e1E9LnR+Ahmxjv3e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPtZDQACgkQJNaLcl1U
h9D+3Qf7B/pdT2c5Gz6fLqeKbf9iXv7oOvDmvUhZUnPiTDyuuQ5fDNg+WDBp/i7K
6Y7Je3c8seM0sdixYFrb3zG52ob3NMmU9a/cdcjpTaRGl7FI+BJDjApQPCY5Usbu
7Sai0SVpv+mMPo5lzsyfAD7E0YjrfvvHWved7r8plXhsVCZK0Su4idwBczw6Axn4
cCV7f0f0Vp2nihlDJQaSeX+j3qgkR4yq8Da33GJQnaapiens51aZDsmQrvuLOxUO
cDr+kcKa5rlvXM77XHqX1N0xI0Ev+pESxSkcCGrOwq3CtgeWdXyeeATNEUn8rKXC
pXmYs3mBaH3o3lywQLh9MITFtHuG/Q==
=LJK/
-----END PGP SIGNATURE-----

--e1E9LnR+Ahmxjv3e--
