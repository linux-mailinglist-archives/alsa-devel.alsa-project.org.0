Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0839C874DAF
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 12:40:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B990847;
	Thu,  7 Mar 2024 12:40:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B990847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709811652;
	bh=Iuq7wW8jUMuLEGXJxlWdQh1apTqKm177uyslO/azaA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W7CNG0mscinDAX/ido1zwfgX+B/ThOwTWru99eVJWXzB2OmpGXnpCXt6gpoPR+NTe
	 7YWItiqwng4THjaTjkOAEm6DcRTDnDNd6ImXt7jiFQPkkKdjXEmLwARh6QHNz5xUMx
	 O+47M7k0o6GivKDOATGa9zkX4NIdWMtRob72/5lQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 772EEF8059F; Thu,  7 Mar 2024 12:40:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15C6CF805A1;
	Thu,  7 Mar 2024 12:40:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6112EF8024E; Thu,  7 Mar 2024 12:40:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90617F80088
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 12:40:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90617F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YrIOcIyt
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3E49FCE1B9E;
	Thu,  7 Mar 2024 11:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C50EC43390;
	Thu,  7 Mar 2024 11:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709811602;
	bh=Iuq7wW8jUMuLEGXJxlWdQh1apTqKm177uyslO/azaA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YrIOcIyteGH0Psn3UTwqnj74q29j0zZzlNwDb+jOzAT0YfFLtqtJatnHtTqOCLqMg
	 EpEo7/c34kZYqaRx0WgFP6Wy1qLqPnPfzuyxVuJeu2oDalU+ZoAwmn2RNAWE8fr/km
	 7N1Sf0IeqPSgo5CLh/6oJQt5gDUCyKHAEN0Uk6SMqP0RvbL9XkjTbFjwHbZB+uZ5C8
	 lOp9gdYXFT+FeF+MtKeUGj7vcGKLbpbVY64LTDl8/npzoCVS8LoMYVGAvlt38cplnF
	 Y4Yad3S+o3UBFonsHBxFK0adxptiwr7vXxClhuk4ikwaGedXzhuWRtPxrmMkOTbwoL
	 AoJmTjdBDeFOw==
Date: Thu, 7 Mar 2024 11:39:55 +0000
From: Mark Brown <broonie@kernel.org>
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
	"13916275206@139.com" <13916275206@139.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
	"bard.liao@intel.com" <bard.liao@intel.com>,
	"mengdong.lin@intel.com" <mengdong.lin@intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"Xu, Baojun" <baojun.xu@ti.com>, "Lu, Kevin" <kevin-lu@ti.com>,
	"tiwai@suse.de" <tiwai@suse.de>, "soyer@irl.hu" <soyer@irl.hu>,
	"Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
	"Navada Kanyana, Mukund" <navada@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH v10] The tas2783 is a smart audio
 amplifier with integrated MIPI SoundWire interface (Version 1.2.1
 compliant), I2C, and I2S/TDM interfaces designed for portable applications.
 An on-chip DSP supports Texas Instruments SmartAmp sp
Message-ID: <73a4416f-4738-485d-aa5a-431c306e7023@sirena.org.uk>
References: <dff90323b41a4e3a8e0e8540fbb32154@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="13xliTJPAqH3UJDZ"
Content-Disposition: inline
In-Reply-To: <dff90323b41a4e3a8e0e8540fbb32154@ti.com>
X-Cookie: Been Transferred Lately?
Message-ID-Hash: FLBN4QOWO3ZAE5NNQKKOUXXMC2NTFW5M
X-Message-ID-Hash: FLBN4QOWO3ZAE5NNQKKOUXXMC2NTFW5M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FLBN4QOWO3ZAE5NNQKKOUXXMC2NTFW5M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--13xliTJPAqH3UJDZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2024 at 03:56:40AM +0000, Ding, Shenghao wrote:

> > We also try to keep default settings from the silicon except in the most
> > obvious cases, it avoids issues with trying to work out what to set and
> > accomodate different use cases for different systems.

> > If you do need to set non-default values then either just regular write=
s during
> > probe or a regmap patch would do it.

> So, can I remove=20
> ".reg_defaults =3D tas2783_reg_defaults," and tas2783_reg_defaults from t=
he code?

Yes, supplying register defaults is completely optional.  It means we
can't omit default values from cache sync and have to read values back
=66rom the device the first time we read but those tend to be fairly minor
performance impacts.

--13xliTJPAqH3UJDZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXpp4sACgkQJNaLcl1U
h9ARWwf9HcdUwT7bKSmEfdLwH0kU4RDbbNZ1UNhRUruO7+2kcrukoh9IbkAmJHHg
7lUfJI6hks3ir1uTyONS3PVarAim8mvzQfQZmuyu4mrWqHDXcIc/eAuX0mlrV3mv
2h5EPcE050Hi1esdMYb2+ax80Y3VlzPgTgqxkZCFzVNH7Yj4tr2Z3MidZQMlLR2W
vzJ7S+cs2kiq8TFkxMKECTDDEN02cqrC5+KxXPr6vXbQIPP8RP1ouO7wFoLQyvYM
OYSH/d/VB0O47dSfAscE/2aX+kOlBJkViIYHCJUqcUAp0xS5aWXM6il9ihS7tTw1
Awg6yj0cCP6wSRcPknF56znWUqLBCA==
=F7oz
-----END PGP SIGNATURE-----

--13xliTJPAqH3UJDZ--
