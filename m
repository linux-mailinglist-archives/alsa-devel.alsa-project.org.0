Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5A05807F3
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 01:05:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72BA020B;
	Tue, 26 Jul 2022 01:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72BA020B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658790344;
	bh=KuI6jPXE59juMwF7FrWJhN68iFyhxdb2/mZjvCRQlL8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YYE2/UhCHU3bRZ6bumIy2/wlpH+frqDLuscBV7oCL0wMoJy9psV+p9EPsO3iFuZ90
	 /VcXPi8/7aB31P4e72k4gtus+wtNn1lzpguOxNKvCK1bczSxNlR131uoIfhF78Ow18
	 6rS51XZesq2no6ZfvZIKqBANkcNvN6fCqhHvq4ck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2362F80128;
	Tue, 26 Jul 2022 01:04:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77BD6F80163; Tue, 26 Jul 2022 01:04:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FDE5F80128
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 01:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FDE5F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bsjEemcF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B0BC6142E;
 Mon, 25 Jul 2022 23:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251D8C341C6;
 Mon, 25 Jul 2022 23:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658790276;
 bh=KuI6jPXE59juMwF7FrWJhN68iFyhxdb2/mZjvCRQlL8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bsjEemcFnWQyMl2nerduGS4f89mA/1pwAQTXLi8ZK2J8eo9GL+Ua5c1t+kGRNh3u0
 s1ellHpQnsirjFDF42o/hQZHaGtq2Zq2UyqPdA1/Py7weV8/zj7uf0VKgVfIXINcI1
 QW6JmIB4hCP4z8/W2F8Q3/t/o9ZHJQQqjqGGm1B2hSlJ5Y47iS+IVTVQiSFpRBYpV5
 ws+oEQrqWMkAd21qZGBvp3hEDx4S7UlLIFTrurIs8kMsotR1riMArUC4Zst38KUdlf
 V/jtvVKP+wzDmxQytR1s2gQZBA1n93c+eWWTXNWN2zrlDiB0cE0In2EjmnbC3a0809
 y/S6vfjJ8vCsQ==
Date: Tue, 26 Jul 2022 00:04:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7] ASoc: dt-bindings: tas2780: remove tas2780 and will
 merge it to tas27xx
Message-ID: <Yt8hf7IqSgKK2VhX@sirena.org.uk>
References: <20220722105345.175-1-13691752556@139.com>
 <20220725224919.GA2887013-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wxpYfeOoU1p11bZe"
Content-Disposition: inline
In-Reply-To: <20220725224919.GA2887013-robh@kernel.org>
X-Cookie: If you're happy, you're successful.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 shenghao-ding@ti.com, kevin-lu@ti.com, Raphael-Xu <13691752556@139.com>,
 raphael-xu@ti.com
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


--wxpYfeOoU1p11bZe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2022 at 04:49:19PM -0600, Rob Herring wrote:
> On Fri, Jul 22, 2022 at 06:53:45PM +0800, Raphael-Xu wrote:
> > remove tas2780
>=20
> Your commit message needs to answer 'why'? Write complete sentences.
>=20
> Though as this was just added, you should do 'git revert' and send that=
=20
> patch.

But please write a proper subject and commit description with signoff
and so on, it's still a patch even if you generate the initial content
with revert.

--wxpYfeOoU1p11bZe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLfIX4ACgkQJNaLcl1U
h9DjDgf/fNoI9c9iDz0cpsaGfZ30y1qwKiCQfjH/aEuFhC82cIuzakvcUsFU5Zrq
n9w3dk1Hwrzuu+dsqBCl2iNkjkUk2SE0zSLqRaThDpamDIbsFsKtWyZnBffapT92
wdvh2f4R6N6TzFOPN1KhvPLtqhSCEzXSjQvKl1I9aN9UIcIrDZ1asO+qTS5BlLBo
8G5PRDRSZM7LGN+ExX9qWfDQnuPGNDxJN7ww5NdWOh5FZAFIBMi7HxsMHyQXyKn+
t3uo4OU3WbJCAYV24QF0apo3gXEr+teZ/xB+7d4AFpU4JjTnmwDrdlox3mSE0jJF
NWogzLkyAb+iwv5s5HdXpICprJpMUg==
=jhQf
-----END PGP SIGNATURE-----

--wxpYfeOoU1p11bZe--
