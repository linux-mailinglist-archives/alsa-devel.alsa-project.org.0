Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1057B537D
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 14:56:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE889E12;
	Mon,  2 Oct 2023 14:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE889E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696251391;
	bh=M1E0aQTcKPqPpOVXRkLzvTlr/tOXmy+Lm7ozsdfR5Ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rcrm92LRXHQqBZm9TJvA5SnnTK+sv7fTpm+8yiVt28lmYWCiPjBKGIZPPeX+o2vus
	 A+fxdrus5ZWpuGgUM0G5KF+vo9jAw823keB+kYW2E3L0RyoVi6At32sVhrxxT9n99p
	 WI9ufH/G5eHiuRRkJJlD5OgySUshPmebejdEfDU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4B42F80551; Mon,  2 Oct 2023 14:55:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48F59F802E8;
	Mon,  2 Oct 2023 14:55:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 507DEF80310; Mon,  2 Oct 2023 14:55:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED28EF80166
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 14:55:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED28EF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Njb26VRY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 840E4CE1025;
	Mon,  2 Oct 2023 12:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4116EC433C8;
	Mon,  2 Oct 2023 12:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696251305;
	bh=M1E0aQTcKPqPpOVXRkLzvTlr/tOXmy+Lm7ozsdfR5Ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Njb26VRY73ArbIxu8CRCs71wwrsFTmbqx9OjEgbl+CpJrJ08n0s3qz/JHx7YWzD+t
	 IEESmQ6T9NOY4jy+wFSELhDxOApdDfNP0mXvTA2+1Ey+8v+4RI29hIo3xbAY+f2LyA
	 nK9YhljTUPkuwxCXtIeBNtKV6awphJ+N1oY/Vh0ukvOP2lFhpUJngplgYvBGc3eVAk
	 kZscP1ItCutXmpWM0Dy/T5ZgXTPwPJF5uMeV6CRKve4wI120zaf9wDWKGcLEUj0Tal
	 FsIQtylvIWy8Z1/C8FFdB74Y5fVKEJJPIgaSdqzkCVnCHkFDZHrk+VpiO9LIfPrSJm
	 eYIwKOQZlk2Zg==
Date: Mon, 2 Oct 2023 13:54:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Sven Frotscher <sven.frotscher@gmail.com>, mario.limonciello@amd.com,
	git@augustwikerfors.se, alsa-devel@alsa-project.org,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v4] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
Message-ID: <64c78944-4d62-4eda-b92b-3b415fea3333@sirena.org.uk>
References: <20230927223758.18870-1-sven.frotscher@gmail.com>
 <46560887-0b6e-42ac-96c3-b4dbc1d7cb61@leemhuis.info>
 <4fa7d39d-dc34-4550-97fa-2b089f364cca@sirena.org.uk>
 <541ac45b-8de7-4fa2-85ee-456d34e60aa9@leemhuis.info>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y3s07sEkApCR/FW0"
Content-Disposition: inline
In-Reply-To: <541ac45b-8de7-4fa2-85ee-456d34e60aa9@leemhuis.info>
X-Cookie: Postage will be paid by addressee.
Message-ID-Hash: 7WB7IJM4ATT5NDMKEPMULCP45SKKGF7B
X-Message-ID-Hash: 7WB7IJM4ATT5NDMKEPMULCP45SKKGF7B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7WB7IJM4ATT5NDMKEPMULCP45SKKGF7B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--y3s07sEkApCR/FW0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 02, 2023 at 02:28:47PM +0200, Linux regression tracking (Thorst=
en Leemhuis) wrote:
> On 02.10.23 13:52, Mark Brown wrote:

> > x86 firmware descriptions are terrible, it's just an endless procession
> > of quirks.  The model for ACPI is not to describe key information in the
> > kernel and instead on Windows load device specific information from
> > separately supplied tables.  On Linux that translates into these endless
> > quirks, on Windows it's platform specific drivers for otherwise generic
> > audio hardware.

> I know all of that, but from the many recent regression reports and
> patches it seems quirks were not needed for a bunch of Lenovo machines
> before c008323fe361bd ("ASoC: amd: yc: Fix a non-functional mic on
> Lenovo 82SJ") [v6.5]. That made me wonder if that commit really did the
> right thing or if there is a underlying bug somewhere that the newly
> added quirks hide, as I had a few such situations during the past few
> months. If you or others the experts in this area say that this is not
> the case here then I'm totally fine with that, it was just a question.

Until someone tests or otherwise provides specific information on a
given machine we're just guessing about how it's wired up. =20

--y3s07sEkApCR/FW0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUavaMACgkQJNaLcl1U
h9BfhQf+NMxz5LFXKKLUI6Fkw2l2NPDiDWIevr7NcQr0fjBmf4mJei8Jv9zUXHWb
GctXb9s6EQvNS6lbUPhWPBsz5+U5knIFWIFpLuhs8N8MoSVWO0IltodXKPCIX7cx
ZxKiNV7JN0s/YSzQpRr+wPWXTUyYVRDpCCgJ/Fm+JH2TV4MU5dPnFTSb0eHTkEsZ
RjMlhF9RG81Vm1J+srCzUp2UaiTrA7g0ibCf5+iSf6fu18rOnyZw/THhhXlRQmbW
gCuM3yaySZZqhQoppGz5UjWfN11bw8wrDll9kDIOLGj1nvbWCJS3XvLOCjRUY1U3
6nnzwCZV39gIKRz8cIb3KwIjEUYlFw==
=fv+B
-----END PGP SIGNATURE-----

--y3s07sEkApCR/FW0--
