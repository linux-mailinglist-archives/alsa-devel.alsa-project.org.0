Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C3C871004
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 23:21:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD27F829;
	Mon,  4 Mar 2024 23:21:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD27F829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709590915;
	bh=dn1OEeIDzz4G35w1BiyVDjN4QI9kgHdUa6oJDuc0nR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B4c2m0qdV8sgiDzz9vbKqysJevVqrWRkYtVlUgi2WtO/ogMf9r6sDxvKHT4iDlNQp
	 r76l4iGbmEIN0yC4TrDgC96twDKYRcxVp8TPT720mVL4VNK3aYbOb9FsTHVJW9TW3P
	 WBjx9XauNGyoI3wWNITWfSQpn8wuI0DO1QzFK7+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50AF6F805A8; Mon,  4 Mar 2024 23:21:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29BEBF8059F;
	Mon,  4 Mar 2024 23:21:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76A45F801F5; Mon,  4 Mar 2024 23:21:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 624EEF80088
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 23:21:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 624EEF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xte+K9aQ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E1AF1CE13AF;
	Mon,  4 Mar 2024 22:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4F8C433F1;
	Mon,  4 Mar 2024 22:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709590858;
	bh=dn1OEeIDzz4G35w1BiyVDjN4QI9kgHdUa6oJDuc0nR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xte+K9aQEusZVNdEv/obqAmVK4nx8/ylbTR8pjdbSnULAmqiif5NizCjKscGlUS63
	 LUsthUNBa5/IDZIeMga5rQh4/Buf3SGzre2O6eKoUfW0yvEiAgHS1C1NdXBMKLhMV9
	 eSpYIYI09n+UCyHjKS309Uq8dh7QNyTX6EvEzcVjUP7Mea+lguM6zotMJU5LjvR2g+
	 /gnkN7rEn4lf1/zsj8f5yg7rGV7dK7xkDxBsRqFX/oN2JYdMaCBCmyMhHyMSNyjl6/
	 8WZbMm5dQR8MLl6OjF99+QNW+mjA0Y6039DXMUZWQAe9YwP05LaZdIBB54f+Bs/VR3
	 rw/WOg3Jg9N9g==
Date: Mon, 4 Mar 2024 22:20:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@google.com>
Cc: cujomalainey@chromium.org, alsa-devel@alsa-project.org,
	Akshu Agrawal <akshu.agrawal@amd.com>,
	Karthik Ramasubramanian <kramasub@google.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: da7219: read fmw property to get mclk for non-dts
 systems
Message-ID: <797e3fb0-5d95-4f11-a638-dd5e8ea511ba@sirena.org.uk>
References: <20240304211444.1031693-1-cujomalainey@chromium.org>
 <fcd7d8d8-3e71-4c43-b5e8-075369b4b9ec@sirena.org.uk>
 <CAOReqxgDYtsF0RTLnpA5WaFtyf4BYND6a796NomFo1cAsFGJKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4PGFXUqy9Z82ERpq"
Content-Disposition: inline
In-Reply-To: 
 <CAOReqxgDYtsF0RTLnpA5WaFtyf4BYND6a796NomFo1cAsFGJKg@mail.gmail.com>
X-Cookie: He who hesitates is last.
Message-ID-Hash: CNKRPT2EJSDZ3JR33YB2EIWX2UMSMUKS
X-Message-ID-Hash: CNKRPT2EJSDZ3JR33YB2EIWX2UMSMUKS
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--4PGFXUqy9Z82ERpq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 01:50:27PM -0800, Curtis Malainey wrote:
> On Mon, Mar 4, 2024 at 1:23=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:

> > I would never have guessed from the changelog that what this change
> > actually does is provide a mechanism for overriding the name we use to
> > request the MCLK.  I had thought this was adding clock handling to a
> > driver that had none.  The changelog should say what the change is
> > doing.

> No problem, I can clean it up, I figured a good starting point would
> be to just revive the original that was sent in 2018
> https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.=
org/message/26IVUCF7KMKNL7LZWAWWNFF3KB2TURSA/

That seems to have had 0day find build failures immediately so didn't
get looked at :/

--4PGFXUqy9Z82ERpq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXmSUMACgkQJNaLcl1U
h9AjOQf+MegNFaJwokvcCg2yXVIOuTq2Y6/pinrJmBpf6hTOLiD8Mim+0WmV3iGs
suAcsCtZrg5eWBMu7uF7ZrKqjxbiyO4fSXMcAIBmclDO5hKpSEDVGGd/gLp1ice6
Ysc3hx0mO/xJ4eT1gtyW8KNMyTUhVvEu6Pb1bCV5VDR+poDPI/WtkV6FbLVGBxoi
z26rrQFiOiThOKhOM9iKJ2g5ZXFP2J3jI8D4Bc0CwXdOZcm8f6EmWUaLhIS+Xfzc
WdM3QoCZ/FDpNiGSby7vaXy4j29ZLOD/5F/UgoL+hfvBpbizXdYweIjr3FhXhOlI
N40QpyYXrwKhk96T0oTiDakIxwLMwQ==
=QpUV
-----END PGP SIGNATURE-----

--4PGFXUqy9Z82ERpq--
