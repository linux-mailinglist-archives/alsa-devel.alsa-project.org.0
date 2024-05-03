Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 136308BA516
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 03:48:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 276FBE69;
	Fri,  3 May 2024 03:48:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 276FBE69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714700891;
	bh=jnztmxuaRUJ/EUjiAcJ6LSXXmWw6auqF5LGM5XsjF8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZKy0o1/Z2y5QDEdy9e/0d/OlE3J3fY/w9Rq21SbdZWfO2K9veft8NPmN3TLYtp10U
	 kTdIlfwsb4/bWdMmicQT74jXxIse2MYYSm4NBWQ7iSnL/Xqr6g92R7lWePAA7YFEoz
	 Gb4sgKkuObCNx5EiUSy0p4mTUHfkM3tp/Vj7N+aQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DEBCF80587; Fri,  3 May 2024 03:47:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5CE3F805A1;
	Fri,  3 May 2024 03:47:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9975CF80266; Fri,  3 May 2024 03:47:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55041F8023A
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 03:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55041F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=huJ8dvqB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 195B961BF3;
	Fri,  3 May 2024 01:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB22C113CC;
	Fri,  3 May 2024 01:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714700842;
	bh=jnztmxuaRUJ/EUjiAcJ6LSXXmWw6auqF5LGM5XsjF8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=huJ8dvqB+TN/5IgJ6rtnCXfVgXOlZfAdZYA/7vs7YuLO962TFb+avL/V+5+Rni204
	 u9/f/fRre6WsTm1XAt3biIJ7MtrAkKMlIcdBiezfCUBrbLhc4GQOvDOFdoMrywy15G
	 HVDUuTPVvWfCo/LWmMR/YAYd76bJuAAZMqubdIdTqLpUHdoyUTiJr/OhqWHi1DQwX/
	 TTfuZAYA+OBxUo5XMadmDCz6i1lMZq0CwsUh/khAN9yCvtk9LCjCamRsZktG50n/EX
	 TDY9n+egIwFoWC/EpRvSADEFoGvRx918hONbY9legxC9/dh+ROPGl1a4VHgQWky9Ab
	 R0tQiZIJgiz0A==
Date: Fri, 3 May 2024 10:47:19 +0900
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
	sakari.ailus@iki.fi, tfiga@chromium.org, m.szyprowski@samsung.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Message-ID: <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
 <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
 <20240430172752.20ffcd56@sal.lan>
 <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
 <87sez0k661.wl-tiwai@suse.de>
 <20240502095956.0a8c5b26@sal.lan>
 <20240502102643.4ee7f6c2@sal.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YhSjxC/xCHptpvaf"
Content-Disposition: inline
In-Reply-To: <20240502102643.4ee7f6c2@sal.lan>
X-Cookie: lisp, v.:
Message-ID-Hash: Z72J4A7OWODXBZ5FGTU3CDPEOS3IFT4P
X-Message-ID-Hash: Z72J4A7OWODXBZ5FGTU3CDPEOS3IFT4P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z72J4A7OWODXBZ5FGTU3CDPEOS3IFT4P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--YhSjxC/xCHptpvaf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrote:
> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> > There are still time control associated with it, as audio and video
> > needs to be in sync. This is done by controlling the buffers size=20
> > and could be fine-tuned by checking when the buffer transfer is done.

=2E..

> Just complementing: on media, we do this per video buffer (or
> per half video buffer). A typical use case on cameras is to have
> buffers transferred 30 times per second, if the video was streamed=20
> at 30 frames per second.=20

IIRC some big use case for this hardware was transcoding so there was a
desire to just go at whatever rate the hardware could support as there
is no interactive user consuming the output as it is generated.

> I would assume that, on an audio/video stream, the audio data
> transfer will be programmed to also happen on a regular interval.

With audio the API is very much "wake userspace every Xms".

--YhSjxC/xCHptpvaf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmY0QicACgkQJNaLcl1U
h9DEDgf+OxkntU8LcfqnvW2Z51UqNQJ0p62Te/DmJ+wZWQotYcbwAQdb4fMKfeyw
TU+Kka5bvWBtYfhoCnXFlDqQUh4Ldk7wZEWfHS2KCCM+o3mr/WHvxCRqSvy2geXZ
+76U6qA5/RPQnAFUlNe9Kp4LK4LpvGg9KONljKpsIdFBEDvJG84wr+zLwDuboy4O
rVP1hJQmucWST9qsBWFT+7VmJt9tbK2I3iwIB2Z3utiJvBFvyyj8bVMx5I1ssxfj
Rh5yL+iQ+aEQkTwEBTzuAS055XYNxzl/eBa25iRWCgoYOrMiphGpWBDWp5qUoPiB
SWVL9dU2q9I5o4Y+GNohSdEw9Rctfw==
=OLs5
-----END PGP SIGNATURE-----

--YhSjxC/xCHptpvaf--
