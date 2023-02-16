Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6256999F1
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 17:25:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A37C7F09;
	Thu, 16 Feb 2023 17:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A37C7F09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676564723;
	bh=oLvmzj/aD1EWM31O5yP403IS6djcAMB15JbOPF/P86Y=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PO6Sv1OivNJgMcmvI2RyQRZwN7gb8du0ha0EA7e1MRpdH0vNbEd3w/6CkglFyUC+g
	 r5gfVPJEa4XhUieCQ2ZTftj5cWRM7nVL685r+EdN1r6v5xpJZcD/Y9p007cyVVtImG
	 64MXKSPq2Kmq3cKQaGS4iDxiohshyRYXIBFlAGVQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADE00F80496;
	Thu, 16 Feb 2023 17:24:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACF81F804B0; Thu, 16 Feb 2023 17:24:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDFA1F800E4
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 17:24:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDFA1F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=b1lOndDX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0136361FFC;
	Thu, 16 Feb 2023 16:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12194C433A1;
	Thu, 16 Feb 2023 16:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676564638;
	bh=oLvmzj/aD1EWM31O5yP403IS6djcAMB15JbOPF/P86Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1lOndDXJsybp2Y/ndgl5YqHzz8Eh153f99+6Kj5X+kVjptb0AmOa8IxOe48Clag4
	 fTiFACAsiIgg3etck8YWzVjetmzlv0OPpHRfzhXxUQjpmb7q3qG3pi79C81V7wORb7
	 ocigi+qO5JZCuN+FgGyhxKNA/UAGpMBRIhi/5oG2eD1x0UxrLSyXJsnwIdy3tYHkD1
	 axZKc1/ils3+jUrXDwVIPp8qrZMe8CSR+U6FgVM5YMhHqcUInQNYPwGnUNR288nXF7
	 vxy8AqTZbnVkUzYu2qYhVZrnpo//P5F0WNx8qoOtlvw7MYS8f6IwmjFRa5yaulpp+/
	 cfKR6O0OVs7mg==
Date: Thu, 16 Feb 2023 16:23:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Joseph Hunkeler <jhunkeler@gmail.com>
Subject: Re: [PATCH] soc:amd:yp:Add OMEN by HP Gaming Laptop 16z-n000 to
 quirks
Message-ID: <Y+5Ym5rUWLK4TOAf@sirena.org.uk>
References: <20230216155007.26143-1-jhunkeler@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZHmiD/lW1n2dysJL"
Content-Disposition: inline
In-Reply-To: <20230216155007.26143-1-jhunkeler@gmail.com>
X-Cookie: Serving suggestion.
Message-ID-Hash: W2VPMK7ZPRDR6U7ZW5KCAF3XJFB52OWE
X-Message-ID-Hash: W2VPMK7ZPRDR6U7ZW5KCAF3XJFB52OWE
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W2VPMK7ZPRDR6U7ZW5KCAF3XJFB52OWE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ZHmiD/lW1n2dysJL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 16, 2023 at 10:50:07AM -0500, Joseph Hunkeler wrote:
> Enables display microphone on the HP OMEN 16z-n000 (8A42) laptop

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--ZHmiD/lW1n2dysJL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPuWJoACgkQJNaLcl1U
h9BDugf+KiFB1aCtgMW8HYgkiyjEMXRY2YaLCjP00x4Q/ZM6OqsHagCyTwPglQ8W
0rZewh1DfY9IgIdKz18aPg7FtdyvRLZFRAivGM6LOi1YcY8kg+kTB4BexybQu1UU
PwBozdLDfJZeWZJ0sXn7P8Za3+5Z+fIJdmg7jNJFUyzSMqNM4oP2xKYgLTAhmRhf
TtU12XPL4vEu/dOAbAnfWZv/OH0zJBxzi/DKbbNkYgdyY9X3+6WHYYHAuXyO/IK9
UPfny2HXGaOJGiFLId3p4rRiOv4sDP9HKnPMrUXs0Tt/b8a85najXG+7hVDvbPnZ
wBhoV9WbkRaeRoImS1nj3oALxjJvMw==
=XVyk
-----END PGP SIGNATURE-----

--ZHmiD/lW1n2dysJL--
