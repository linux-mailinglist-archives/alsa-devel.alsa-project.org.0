Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B167B53A9
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 15:05:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B766AE0E;
	Mon,  2 Oct 2023 15:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B766AE0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696251924;
	bh=AFn+gVXbUD0U4Y6bUXqTweEbLHVA0KrcQKlngrIzbJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QM89ZmKgBuFAK6WdJsHdQCOe5MsAr6+Fk32q/cxRyrhAzMDVrJbUk4CeeIeX9yz3b
	 VU+Fj97l6qMmiE0VWyRCDiq1mEDtiy8/iGqSKj0jTqXgs3ggCz05RS73zi60XRa0sT
	 zRlkPUtr/+ExcoxZvqQ7i3TRdX5E4vDwuyjSIaXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4116CF802E8; Mon,  2 Oct 2023 15:04:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5364F802E8;
	Mon,  2 Oct 2023 15:04:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24022F80310; Mon,  2 Oct 2023 15:04:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CE6AF800C1
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 15:04:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CE6AF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m3xKYy6a
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4C860CE0E26;
	Mon,  2 Oct 2023 13:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56B2C433C7;
	Mon,  2 Oct 2023 13:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696251861;
	bh=AFn+gVXbUD0U4Y6bUXqTweEbLHVA0KrcQKlngrIzbJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m3xKYy6amE4sejsfFYH8X2/F22UfVwfhG3qQDtBSK2Sk9lu9vm3DA9+PiIMuDkVIA
	 6x8JSfOzNGbU/scZWI3UbLrrG5R7/sp2z8XbYRJBCetpMRwID/jZR92vJHnwdeuQLf
	 h7ZGaPS4qfsMzcO0bV9IAJHjD7QrbPZy0l5ON0Q+mtw2fPYP1zjHIGtQAbRt/XiVuq
	 1HBp+KOnq6EuJtASfW5G4IxzxtypXIgEJ2Z422Etd7kGHwccAVkAV9ZXoCE6GSjASj
	 9dNj2Tvz9G3cWQxAZv52eUtdF+doS2I4oImit/a0NvNFw1+Epyky0yG5W9ub5STiTv
	 +eysXJ9BIWcLQ==
Date: Mon, 2 Oct 2023 14:04:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Sven Frotscher <sven.frotscher@gmail.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	mario.limonciello@amd.com, git@augustwikerfors.se,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v4] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
Message-ID: <89698b5f-a616-4f49-802a-21326a868c7f@sirena.org.uk>
References: <20230927223758.18870-1-sven.frotscher@gmail.com>
 <46560887-0b6e-42ac-96c3-b4dbc1d7cb61@leemhuis.info>
 <4fa7d39d-dc34-4550-97fa-2b089f364cca@sirena.org.uk>
 <541ac45b-8de7-4fa2-85ee-456d34e60aa9@leemhuis.info>
 <64c78944-4d62-4eda-b92b-3b415fea3333@sirena.org.uk>
 <65KW1S.A6C8VBV29YCM@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T3pA0U+bnE9JGR4j"
Content-Disposition: inline
In-Reply-To: <65KW1S.A6C8VBV29YCM@gmail.com>
X-Cookie: Postage will be paid by addressee.
Message-ID-Hash: BLCH4OTRH52C5GPS7MFS4SFW6FSRJFIC
X-Message-ID-Hash: BLCH4OTRH52C5GPS7MFS4SFW6FSRJFIC
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BLCH4OTRH52C5GPS7MFS4SFW6FSRJFIC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--T3pA0U+bnE9JGR4j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 02, 2023 at 03:00:42PM +0200, Sven Frotscher wrote:
> Am Mo, 2. Okt 2023 um 13:54:59 +01:00:00 schrieb Mark Brown

> > Until someone tests or otherwise provides specific information on a
> > given machine we're just guessing about how it's wired up.

> What specific information are we talking about here? I have the 82YM in
> front of me and could help investigate.

We need to know what magic set of quirks makes the thing work.  Are you
saying that your patch doesn't actually do that?

--T3pA0U+bnE9JGR4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUav84ACgkQJNaLcl1U
h9Cz6Qf9H7niacF30Y0k3OYJeoCcMMTuQYXuwjRZLJuCVOI/Uq8KIC/E3ovi+GX8
CEcICKguhEX6gtzClAEOWWdRRmLubWi4kHEfZAaMMmKdNxa3xMEqazvbKLK1gidP
1Mq4xx7BmNDoK1CSVInPoPl1Q5S9CEUOr9T855Mio0rY+4SjjOcTKjCmw9+SSkPr
mpMTIdixcEm235K5rOh8KNcGtYqXmDvSHE0VFtkPu9iTC5Ik3Rh/CF4iC5Yl7u8u
wkjKg+LSPqSTuf+FNJjqYARLOLFsTYhcbKQIcweBRHSxLDz9XHZSni20mX3V4Zlt
t6c9FH0ejAjo0hZbJ9p8VRqOJJHHnA==
=SH/+
-----END PGP SIGNATURE-----

--T3pA0U+bnE9JGR4j--
