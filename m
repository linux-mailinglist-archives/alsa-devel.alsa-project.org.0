Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3977789DB8
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 13:55:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0F217F1;
	Sun, 27 Aug 2023 13:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0F217F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693137342;
	bh=HCKLU4HFrSpkJ4paDMdbG9pku8cUYKPpuatOjyuNsbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kj5NCvzmipYf/5p/F+lCwpgRiPqmPdUyYaI5SyOAIe8jlztFtiKyMTo3hoDu1+DUD
	 kjplDNy5sr/sMUz1eEOhzU52Iol/Zc5O97FHAOsR3KmGOdhQSX/xpxee/tY69cMDfX
	 HMZM+ejR7kr15706rIZaJF5T06723GW8PokZJMX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C9E6F804DA; Sun, 27 Aug 2023 13:54:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6175F800D1;
	Sun, 27 Aug 2023 13:54:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA3A0F80158; Sun, 27 Aug 2023 13:54:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05716F800D1
	for <alsa-devel@alsa-project.org>; Sun, 27 Aug 2023 13:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05716F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iW45c6CF
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 24DE860FDF;
	Sun, 27 Aug 2023 11:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C82C433C7;
	Sun, 27 Aug 2023 11:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693137278;
	bh=HCKLU4HFrSpkJ4paDMdbG9pku8cUYKPpuatOjyuNsbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iW45c6CFIS1kelrm4x0b8zs7WioFmM2OjgyGFXP3jcNJk0+8qKXZpJFips+FVuPJm
	 7IHW2a6YO8q+NeZxxBGmrGWyDTqKBZZCegYrY7u6wiBcm74B1Jlg27aphea8Lsv8By
	 ILZWiF+MOv0GpLn+1/Uyiykqs6XZO3D7zRoFAcb7MtL+0wqyyGIYrexj6+srE98VRr
	 igbKIvFoy8WXYefXXwjGaVKH6zsE0ElTGd7uzg8/+4qsyySR/9CxTep/TDo9lxtdTp
	 DIfuVagnM6TnF8myMijK0OgNBeDiOMfqayAKc5Kw+p2TUMYTN5GsqIyhSbyNS2WJ+e
	 uge25g38OXc2A==
Date: Sun, 27 Aug 2023 12:54:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	ALSA Development Mailing List <alsa-devel@alsa-project.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>
Subject: Re: Question about simple-audio-card with dummy CODEC
Message-ID: <ZOs5exw+95zzzawK@finisterre.sirena.org.uk>
References: 
 <CAHCN7xKQ549ExO83Yur=_MPv3aYFdR0nfzUSuEXO74OddAr5gQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T0pIQEA2r2aEwbrh"
Content-Disposition: inline
In-Reply-To: 
 <CAHCN7xKQ549ExO83Yur=_MPv3aYFdR0nfzUSuEXO74OddAr5gQ@mail.gmail.com>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: EGTKZF6TXVPPM5HNRJAUXWEEVFBUHK6N
X-Message-ID-Hash: EGTKZF6TXVPPM5HNRJAUXWEEVFBUHK6N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EGTKZF6TXVPPM5HNRJAUXWEEVFBUHK6N/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--T0pIQEA2r2aEwbrh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 26, 2023 at 11:15:30PM -0500, Adam Ford wrote:

> I am asking what is the best way to let simple-audio-card  use a dummy
> codec?  If the dummy codec is the better option, what compatible name
> should I use?

We have a driver for DMICs, dmic.c - you should use that.  In general
you should never use the dummy CODEC, you should use a driver for the
specific thing on the board which will at least describe the
capabilities of the hardware even if it doesn't have any ops that do
anything.

--T0pIQEA2r2aEwbrh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTrOXcACgkQJNaLcl1U
h9BzZggAgccl5OyRQ19/3VMkvr0tLY6x0rAQCt8tQ7ni/4Dy4L/4RAIhcPc3jqJv
eORZtWbC4Gkj/vGVY9qEV78awLZsZ3+77LuwX1bznEJBzV0pe/RFeOSA+BdJ8UGd
cKopGGCieXIaW9t3nwGQbzd/Co4YST7r3dKlXctEy0WiD/tMTyAj809hhoWA5Ipj
BXpnMvv8Z4HtUbNyULHyzCNWYv5ZqGYjDmIbRmzmpVFHaPLOSjyJqOzro8KxbM13
f7bX0kfn4N4KgIXSr1yDWib/Pp3Uoyds5NEyN3XbEWCKANWRtKXcx/rZpV4ZHJhr
xDHPWsW6job7+554QriRZ98Lg+KzcQ==
=XbPJ
-----END PGP SIGNATURE-----

--T0pIQEA2r2aEwbrh--
