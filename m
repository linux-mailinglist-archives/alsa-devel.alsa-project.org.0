Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA5E268A0D
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 13:29:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 512941677;
	Mon, 14 Sep 2020 13:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 512941677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600082994;
	bh=WSvRNlnZj5Cwr+qRlG+10hyAiSBHrTO0oxgaSGrKU3w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cAEJBhiynnvZ18VJwwzj8kZY4lDmbG/tFW+fKRX5Mhkm7gmY3KkQ0XJBSMqr/D6mu
	 g3e4xJY9qWzRk8v8MAga25PmS9708af25uqByHYg99kak3v/thIvjld5JZvTG/MXv7
	 o+DPC6A9fyt+STiabbP9hETi52S4XmdG0Yo0Nano=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 648B2F8015C;
	Mon, 14 Sep 2020 13:28:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 781E4F8015A; Mon, 14 Sep 2020 13:28:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68A3EF800AA
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 13:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68A3EF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F6/W9ykp"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE01E208DB;
 Mon, 14 Sep 2020 11:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600082878;
 bh=WSvRNlnZj5Cwr+qRlG+10hyAiSBHrTO0oxgaSGrKU3w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F6/W9ykp9+MrWdueGqQHRzNUAIo5wWkX2SitgREKqvODzX4dtj5S8cmfVSo33yKuU
 WmLwYqVqCB9Ppy5x5S0rxH50Xnj1id0B7Xep9bvSVHqXaywEYkBmCbmRdL7GsXf2AC
 MVOh09iIDQurp2xiaLw4w66ACWFS2Tqrcwx2qx28=
Date: Mon, 14 Sep 2020 12:27:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Chanho Park <parkch98@gmail.com>
Subject: Re: [PATCH] ASoC: tas6424: disable regulators when probe error
Message-ID: <20200914112709.GA4821@sirena.org.uk>
References: <20200912023151.213930-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <20200912023151.213930-1-chanho61.park@samsung.com>
X-Cookie: Disc space -- the final frontier!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Chanho Park <chanho61.park@samsung.com>, dannenberg@ti.com
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


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2020 at 11:31:51AM +0900, Chanho Park wrote:
> To fix up below errors when tas6424 chip is not available, this patch
> disables regulators before returning error.
>=20
> [    9.367234] tas6424 2-006a: unable to reset device: -6
> [    9.499118] Call trace:
> [    9.501550]  _regulator_put.part.21+0x158/0x160
> [    9.506065]  regulator_put+0x34/0x48
> [    9.509624]  regulator_bulk_free+0x30/0x50
> [    9.513705]  devm_regulator_bulk_release+0x18/0x20
> [    9.518483]  release_nodes+0x1b8/0x2a0
> [    9.522215]  devres_release_all+0x34/0x50

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9fU4wACgkQJNaLcl1U
h9CoMgf/d7gPB7J+0S5yjOttDw+iYAFKuIPmGUlZS2gMkwOQjnlfe5aor1bucEy8
H2dwboPi42UHq4+t17fag5behAbNXGtHTLNTAlXUOfQWtJLAlYXEN1xf6eRINuEd
ybrbCklKEst//tWMGXr9zC76BQK48zNDeiPIZkufJ1WAjK4dgcw3qkX64VCjjQ/G
1Y/p2KE5V/hzE4anNkbuQ5AtTIyBbLkEg8PbAl5Fihg+uptktKMZIwZwkK8jAWdI
GLsaAUHDpx+e0Y/VHDv3lC1iXQqLXwFd91SGeC+R9pu6W88S2iSiaZDyCBKCxfqC
+mSUVE6v95Q5NGUUz9+oDuPahLztlg==
=NemM
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
