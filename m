Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5055C7D8401
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 15:56:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71A70827;
	Thu, 26 Oct 2023 15:55:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71A70827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698328584;
	bh=5Ibq5Q2b6kNTww8PLC2zpz+31ms1Um2eROt680O2BHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XrDthkK4RLLW5KdQt22M8Ci66V3pt6OWqcWqm8KjLU3fXveSz2qZys/7eN9biWnmz
	 eBEfBnNhinfLc3RG0p3JtMcvX8GM1ipqnu0MdN4D1LprEZDocxRQHrUInc64M+n09X
	 R0lSI8PUcb6JkMbvyeiqBbEbe6m1oRhutWWaOF94=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3124F8010B; Thu, 26 Oct 2023 15:55:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50731F80165;
	Thu, 26 Oct 2023 15:55:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96002F8019B; Thu, 26 Oct 2023 15:55:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65441F8010B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 15:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65441F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dSOIYGyV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13556634A3;
	Thu, 26 Oct 2023 13:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8655C433C8;
	Thu, 26 Oct 2023 13:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698328520;
	bh=5Ibq5Q2b6kNTww8PLC2zpz+31ms1Um2eROt680O2BHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dSOIYGyVdy2z/l/T0a1Qwm2GDCF96yyux/z86sMl6qc4VlkUCbNC5IkORopWISQN6
	 K9PK+iV/uonZwpwqV7fwDU1R/mTxv5aySGPgVGo9d6x+Fv8R+krnQXDWCb00ydi0ME
	 1E2NpPTBYf/K3UmKkaKcvyHzkFrTggA9MvUfL/GtHTzgA0MuQJuHE4LyfggjHRMNaw
	 AygmVp8SChcoR4uA0pr9k9D6mCSbi8i88/QGLzIix0FAxFkHmkGLdkYwEl4NEerBXG
	 lWTFz3CIhK4+VWVwXxhvtFghiJWv5cqriP3feotrz1pmMpv6vYF7UYwAdMotwxyD85
	 p6w8vWmWagJmA==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qw0pr-0006of-1v;
	Thu, 26 Oct 2023 15:55:43 +0200
Date: Thu, 26 Oct 2023 15:55:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	johan+linaro@kernel.org, steev@kali.org,
	dmitry.baryshkov@linaro.org
Subject: Re: [PATCH 3/4] ASoC: codecs: wsa883x: mute/unmute PA in correct
 sequence
Message-ID: <ZTpv3_kYTbOh2eUY@hovoldconsulting.com>
References: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
 <20230323164403.6654-4-srinivas.kandagatla@linaro.org>
 <ff3eb88a-6941-4303-a4ba-17cad3842b88@sirena.org.uk>
 <2a0aabf5-41a3-cc07-3203-9b0bca6b71aa@linaro.org>
 <ZTjKWHAAfSYfc5px@hovoldconsulting.com>
 <6df45f92-5fe6-4b44-af04-c528d540ac06@sirena.org.uk>
 <ZTkNcHAzgnL5xpAO@hovoldconsulting.com>
 <9c622323-6b94-4622-840f-5f126942ae96@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VVJx21a7MFh1MrX1"
Content-Disposition: inline
In-Reply-To: <9c622323-6b94-4622-840f-5f126942ae96@sirena.org.uk>
Message-ID-Hash: 2ARKZQCBD22VWS4TWWXG3JNSJUWQ55JE
X-Message-ID-Hash: 2ARKZQCBD22VWS4TWWXG3JNSJUWQ55JE
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ARKZQCBD22VWS4TWWXG3JNSJUWQ55JE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--VVJx21a7MFh1MrX1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 02:05:25PM +0100, Mark Brown wrote:
> On Wed, Oct 25, 2023 at 02:43:28PM +0200, Johan Hovold wrote:
> > On Wed, Oct 25, 2023 at 01:36:14PM +0100, Mark Brown wrote:
> > > On Wed, Oct 25, 2023 at 09:57:12AM +0200, Johan Hovold wrote:
>=20
> > > > I understand Srini has looked at this but has not yet been able to =
come
> > > > up with a generic implementation. Would it be possible to merge the=
 two
> > > > codec fixes as an interim workaround for 6.7?

> So, having gone and fished the series out of lore to look at what the
> patches are I'm pretty surprised here, it's been about six months since
> the original discussion and I'd not have expected this to be such a
> difficult thing to do, or at least that any issues would have been
> flagged up by now.  What are the issues that have been encountered here?

I'm also surprised that this has not yet been resolved, especially given
that I've been reminding Srini about the need to get this fixed
repeatedly for the past six months.

I haven't looked at this myself yet and I don't know what the technical
issues he hinted about having run into would be.

Srini, can you provide some details?

Johan

--VVJx21a7MFh1MrX1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCZTpv2wAKCRALxc3C7H1l
CO+CAP997q0itC7uj37ZLjWkrVX2kK5YCakwXEo2cZ9+7uxGCQEAogaJB3d3AUNc
p78DfnBVBDmH8Dy6vi0L/VNuTvLNjQs=
=H7Nx
-----END PGP SIGNATURE-----

--VVJx21a7MFh1MrX1--
