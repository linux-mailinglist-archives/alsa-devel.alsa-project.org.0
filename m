Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D5145AAEF
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 19:09:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72047165D;
	Tue, 23 Nov 2021 19:09:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72047165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637690999;
	bh=lgJrC8hxLXfGZ3Q/W/S+te9K5lGoU4XaUFoj+nHSu2g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ieoGF/cTcZCILsXGEav83Mh8l7XnQcFRjwWBrEuplYmfNI+umUEZ4K3LBICqEnpcu
	 OLzZiUvcu/cF9eHNfkAJMu0UGNWzqNHCFD2XThMEPAsIn+wSqveWJyl/3ILZfSYGJ2
	 1zf7ZdnMcRalrfp0zPCoL+ReZ+NgI5Em4esJFads=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAC39F80154;
	Tue, 23 Nov 2021 19:08:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E951CF8049E; Tue, 23 Nov 2021 19:08:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A3B5F80154
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 19:08:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A3B5F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V4YYDj1w"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F46060F9D;
 Tue, 23 Nov 2021 18:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637690908;
 bh=lgJrC8hxLXfGZ3Q/W/S+te9K5lGoU4XaUFoj+nHSu2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V4YYDj1w5ADBdq4zzsQPKQffdM9AfwERHuSB9wRYlO/RvJNjU2rkQBK9tPfolB1De
 KzCmknULPsYxM60Oj5BwYDGUohZOVkquRGBHYdA3Nnv7cmVBgdK8gz9tmjmcyXKp3N
 xp7Bx0BTUNiT3FNtOZ584pmj6YXQDw1KkBvz7g0ZbPNGRykPN5RxYZ1CxYSf/ggK7b
 xi4gHBJRqiCLRp+0gbDMLSkogC0/bL//2n+uoXq4XfBtpbEZXaLHXWR3GLCA9f4K8F
 ZXhJ+v3ibw62DXuNZjSbNlVndFRLJPf+/sCEQ7rvRS2f/vJfjJWG6/Zd2ic+dOaBb0
 H1d4ZD1qMAqYw==
Date: Tue, 23 Nov 2021 18:08:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH v2 2/3] ASoC: SOF: topology: don't use
 list_for_each_entry_reverse()
Message-ID: <YZ0uF3t9GJXIEO4L@sirena.org.uk>
References: <20211123171606.129350-1-kai.vehmanen@linux.intel.com>
 <20211123171606.129350-2-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Qw3ugjQwRXOrgdtY"
Content-Disposition: inline
In-Reply-To: <20211123171606.129350-2-kai.vehmanen@linux.intel.com>
X-Cookie: A closed mouth gathers no foot.
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--Qw3ugjQwRXOrgdtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2021 at 07:16:05PM +0200, Kai Vehmanen wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> It's not clear why we would walk the list backwards. That makes no
> difference.

Cleanup patches like this should come after fixes rather than in the
middle of them to ensure that the fixes can be applied as such.

--Qw3ugjQwRXOrgdtY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGdLhYACgkQJNaLcl1U
h9A2uAf/UuWPpXeA1EhUOMgu2sXLZJ9d0Op/TL57ZXMDLyG980OuJ8ZumaKV6wYI
ZQDMrI/654ZdZtY7mNjr6SbX2yIeCJUPhkNJTBhG1cx+bq1fHCCsa1HumY09RoVT
sjHbhJpXX5wpb+9glJZiRYq+mkH8VZZqz4qVE9OSVdqAN3mp26Asm43jzevlX2yj
UGldNCAQK2cCHRVQHQykQJEgHZ/Sllv88dcyxdK+1dirK3NtLPDW/WTJ8BYsaZ5s
0SGslhS0Co5i2DYwuTbCKlk/+GPhCrB3rljIcgnOqZJtag0kY7i568Ql0pnuq+8Y
SdYqbj+U51IQ6yS1qTNUcGFJg7Lf+w==
=XXhX
-----END PGP SIGNATURE-----

--Qw3ugjQwRXOrgdtY--
