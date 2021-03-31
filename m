Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1E034FFE1
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 14:04:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79B8C1682;
	Wed, 31 Mar 2021 14:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79B8C1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617192271;
	bh=ftBJKeSakF7XMeKo9EWSc1ghqWc3O5MDjEvFKjFi+3c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MJg5TSujAvT6raW9FtOCP/3KdGaU63t/xvdBYxChyk/L0sfB3YiOhd+l/RfZH/iZc
	 5AZmJxGZvCFICApsjqjsbdsHNpTbCG1o1YX7ExGdIwSyZWAOskFfaY3EvkBL/6+34E
	 tHe7teS+qHo2cXYQl3jx1EtvccQszMNSoRCARCuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEE4AF8013C;
	Wed, 31 Mar 2021 14:03:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7746BF80166; Wed, 31 Mar 2021 14:03:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 007FBF8013F
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 14:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 007FBF8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uAoNjg5b"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E256961998;
 Wed, 31 Mar 2021 12:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617192171;
 bh=ftBJKeSakF7XMeKo9EWSc1ghqWc3O5MDjEvFKjFi+3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uAoNjg5b951dWWlc12n04W3gXcNDMZ4PaavYsgkSRzDUsb2v6tuRZuBcSpBrr8B3W
 fydI57os6aO/jkq+3pFgKUbSkgNzvoFU8srGOS4G6cSG+kOfAjtWdMrJRBp+iyjXcU
 gz/L0ZnI+Oaqxqh+gJQDJobjHgNpmJec2vyRTDKHjncKWA+ZqUl1NNzJpGsuey+tub
 qvfs+qv96jluN2EoVK1l5EIHjsPkZTe5Z3XhVkWaPbPD0MdEpF+Bi0fR3h6jcDioUq
 uGlhqn3tFRdcwtQZDVmb/vQSIv7uGdXi4TdsSCK9taLHWes2Vy57LEnO2cOpi40j7P
 GNeMlDJHfYmaw==
Date: Wed, 31 Mar 2021 13:02:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH] dt-bindings: sound: add address-cells and size-cells
 information
Message-ID: <20210331120238.GC4758@sirena.org.uk>
References: <20210331071046.12526-1-jack.yu@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Content-Disposition: inline
In-Reply-To: <20210331071046.12526-1-jack.yu@realtek.com>
X-Cookie: You can't take damsel here now.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, robh@kernel.org, alsa-devel@alsa-project.org,
 lars@metafoo.de, kent_chen@realtek.com, devicetree@vger.kernel.org,
 kenny_chen@realtek.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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


--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 31, 2021 at 03:10:46PM +0800, Jack Yu wrote:
> Add address-cells and size-cells information to fix warnings
> for rt1019.yaml.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBkZN0ACgkQJNaLcl1U
h9Az1Qf9EUsAnv1GNJ5Ggh+zxAswVpGZsiGdpMhjmCSiMwbU584ZI9XN8q05Fdzs
jRENfkjkwiZy7xkGg+6LY1pplZdKeWxVF1KF1ZJwJ93G6acTy6c0XS0a8rgWxXHP
nu9PvSiwB9ehWnUdTf9DLdgs91JjAWBGPfSC3TPPtooxS1nJAjFbqVmuqcd6bs5J
fo3y8OjgyJzn2x9Zoz4tHd7/sFX3tQisSzZgUPYNH6yQQrHnSelviP/i8ktOFgNg
tNT7aZnb2SxMmNoT7ZlWLyw5IANvThlT3cSfC6oXCRK4ylE+fK+vamKllPqAJmfy
oPBuSYAz+JNrTezUwpeQh1M4B5EVVw==
=63Oa
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--
