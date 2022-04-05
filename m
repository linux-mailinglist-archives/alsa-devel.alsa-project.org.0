Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D2D4F2998
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:45:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0BF31863;
	Tue,  5 Apr 2022 11:44:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0BF31863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151921;
	bh=I7N5ZTge/HpMiy4bW+5+PVtzIh9pvkUkVrCwN8eIMtA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qFv+FOZ9/PB+675RdT9u4f0zun0fpycVCgOldX+5UIkqvbpwUOHEIPxJ6GNpD2xl7
	 msh+0X5r6E16wfsfCoGaKqz/G/ZCKcWpwEATRyZyIPxDXfvwk3ZIRV4MEw/G4RkVwZ
	 lUtV7ccxvTIwZkDSsKz8L+HDg9JPWIBiw+o8q0MI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1F08F8016E;
	Tue,  5 Apr 2022 11:44:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9424AF8016E; Tue,  5 Apr 2022 11:44:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7819DF8012C
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:44:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7819DF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RT1Ya5K3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C7E3861368;
 Tue,  5 Apr 2022 09:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0480EC385A3;
 Tue,  5 Apr 2022 09:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151849;
 bh=I7N5ZTge/HpMiy4bW+5+PVtzIh9pvkUkVrCwN8eIMtA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RT1Ya5K3CUAgZ9b1Icx2eokJZXHHLPki8f5IblGNODgfE7Dup0r3B/wPaCrYtZYw2
 LRF4JNjlY3YM+woaqtF7WY8qVy4WR51ICnQDKqkjdvrx1iHR6/6cX8CbML2/mA/JG5
 UyXCZn0aryIBt9SUmsKHNYXFSeootNLn/FHeJK4xoxKsG0YwUVAlZYiZR8hyLcMfKs
 HqAfu/V3668iD9vSRUFQ+zBOU+6cS9vp/1xtT3JtO9MTgzczBngagw5WiP7G5Ya7tM
 IWcf/Kn7/iIxVJl/msK8xW1Ea6WjS78m9ST1PROheKz4VPmbrnfXKwDW/16A/8oYKu
 nLvxiNbr1JQ1Q==
Date: Tue, 5 Apr 2022 10:44:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Raphael-Xu <13691752556@139.com>
Subject: Re: [PATCH v6 3/3] update to support either TAS2764 or TAS2780
Message-ID: <YkwPZJLnxDe9YyZp@sirena.org.uk>
References: <20220401150301.1011-1-13691752556@139.com>
 <20220401150301.1011-3-13691752556@139.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="O/18VVxbDPCfi3ZQ"
Content-Disposition: inline
In-Reply-To: <20220401150301.1011-3-13691752556@139.com>
X-Cookie: Avoid contact with eyes.
Cc: alsa-devel@alsa-project.org, raphael-xu@ti.com, shenghao-ding@ti.com,
 navada@ti.com
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


--O/18VVxbDPCfi3ZQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2022 at 11:03:01PM +0800, Raphael-Xu wrote:
> fix no sound issue on some platforms
>=20
> Signed-off-by: Raphael-Xu <13691752556@139.com>
> ---
>  sound/soc/codecs/tas27xx.c | 405 +++++++++++++++++++++++++++----------
>  sound/soc/codecs/tas27xx.h |   2 +-
>  2 files changed, 295 insertions(+), 112 deletions(-)

This doesn't apply against current code (with your first two patches
applied), please check and resend - should just be a rebase.

--O/18VVxbDPCfi3ZQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJMD2QACgkQJNaLcl1U
h9CSpggAgLA3V+y06zBInxSiJxnjfcOuIgekvMJMgrtmKAnBVhHyWEV485wGOzCk
329+VccVHhChKYvqNu/m/Ar/tls4n05voxQVMTjJofMIjxRlTGw1rN7Q2dIAOifa
k0YI1/DObYX6+h0QR5CvpWfxTZftRSpUswv4r0yi3BhfL2dl0LS2KEVeLZ9JND9V
A/D7uyVnM8U3Cm5dV/OsRCPO/RQNZ3kaCSCaYx8e/EbD+1n8DQVC6fT+AigOQiNS
su5m7Kw9OLNO5JvN8qy/r0mlmJnYfunnSI7GsFL7qF8oNFSOG2/mjS7Qk2ieOOuX
uaSWdZON9VipbHSGO7/lsHXj7X7W6w==
=BAbP
-----END PGP SIGNATURE-----

--O/18VVxbDPCfi3ZQ--
