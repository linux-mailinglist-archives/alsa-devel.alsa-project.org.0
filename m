Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4B67D6C2D
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 14:44:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 607B07F8;
	Wed, 25 Oct 2023 14:43:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 607B07F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698237847;
	bh=xFN7wfcpI5IKeJaVpcVe4CyiVilhPV4Rqp3uHIiLo40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FNSKZ6ViVGqe6+Cd3iraz03RjwKLjyG4uYnlRJElT7fORCTuh6KB67doIVErHlZC2
	 Nj6AJ6OhdKtpigRv7bHUlTnDPp/iL84olruJkKaaZHkGKOr7GeGyRw6N4m7Yt4pZDT
	 cAdEpyo7A1ia9Mad4p0K30r7NyvLbekx9Tl0zZiQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C27C3F8028D; Wed, 25 Oct 2023 14:43:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 714D7F80157;
	Wed, 25 Oct 2023 14:43:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2217CF80165; Wed, 25 Oct 2023 14:43:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C047F80152
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 14:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C047F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kCENl4dc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E1A10B82A8C;
	Wed, 25 Oct 2023 12:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D1DC433C8;
	Wed, 25 Oct 2023 12:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698237788;
	bh=xFN7wfcpI5IKeJaVpcVe4CyiVilhPV4Rqp3uHIiLo40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kCENl4dczCBp4463jmUp4115uJ/TaeaDg2enyYz9SP3D+kSoFk4ohOp+HNuO3odJu
	 AiW3xsR5D9K5L9ZR1+ccfTtZsyUNcG+R23Bc+dycYfj0eVs1j02NCw6nGgV1iBZdZm
	 lDRIwMWdSWoVKX+oT6q03g1cayMwx7cvzO3CFw3zduowe5JT6Ukxy5M2MCqoT9q21e
	 NO7nb+7Pyu7kijifIqjkxFJgO3MObhg1UXlRc8YcPUeHmpEB0YRvnq3WsVMuHRJvlV
	 h6DDeYGPUucYI5On4LWwIPworoFY/oXozu2Aa5nRUolVyoSltf8Iq2aHtUHNORdse/
	 HiTNqcWCnjXUg==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qvdEO-0006O3-0u;
	Wed, 25 Oct 2023 14:43:28 +0200
Date: Wed, 25 Oct 2023 14:43:28 +0200
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	johan+linaro@kernel.org, steev@kali.org,
	dmitry.baryshkov@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/4] ASoC: codecs: wsa883x: mute/unmute PA in correct
 sequence
Message-ID: <ZTkNcHAzgnL5xpAO@hovoldconsulting.com>
References: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
 <20230323164403.6654-4-srinivas.kandagatla@linaro.org>
 <ff3eb88a-6941-4303-a4ba-17cad3842b88@sirena.org.uk>
 <2a0aabf5-41a3-cc07-3203-9b0bca6b71aa@linaro.org>
 <ZTjKWHAAfSYfc5px@hovoldconsulting.com>
 <6df45f92-5fe6-4b44-af04-c528d540ac06@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1DRDQSr7JlFP+Vi9"
Content-Disposition: inline
In-Reply-To: <6df45f92-5fe6-4b44-af04-c528d540ac06@sirena.org.uk>
Message-ID-Hash: LH6554E74C7T36G435BSQABYUSI6CJSY
X-Message-ID-Hash: LH6554E74C7T36G435BSQABYUSI6CJSY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LH6554E74C7T36G435BSQABYUSI6CJSY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--1DRDQSr7JlFP+Vi9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 01:36:14PM +0100, Mark Brown wrote:
> On Wed, Oct 25, 2023 at 09:57:12AM +0200, Johan Hovold wrote:
>=20
> > I understand Srini has looked at this but has not yet been able to come
> > up with a generic implementation. Would it be possible to merge the two
> > codec fixes as an interim workaround for 6.7?
>=20
> You're talking about two fixes here but this is a 4 patch series...

Yes, sorry, I should have been more clear. I was talking about the codec
fixes so that's patch 3 and 4.

I believe the first two have already been applied.

Johan

--1DRDQSr7JlFP+Vi9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCZTkNbAAKCRALxc3C7H1l
CPhcAP0bXzqQntT2WVRRpH1rW3mq9js4VcOAQR1+C/pyg2UODAEAlKQgWaSybBLL
8FnIhhB3yIND3bJxgUD9PTa1yhgKoQk=
=Lhzr
-----END PGP SIGNATURE-----

--1DRDQSr7JlFP+Vi9--
