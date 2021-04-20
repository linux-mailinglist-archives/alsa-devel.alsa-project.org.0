Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9300365933
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Apr 2021 14:46:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B2941684;
	Tue, 20 Apr 2021 14:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B2941684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618922798;
	bh=1PbygNKNA9EvrMlkEWK72bdIa0ZxSTl0x8B6/YQXO2s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OpRoDNV1wER2HNshDBVoGn5RbEVmd5LzjmdHcvilyR3XSuCFlm8WPqmHrV6sL+XlQ
	 KsAfpDG0lobGdV9+Sau9V8MChGaPvEokXRQgfg9Tn51Gd7cP6nNG06iieU5YWIAfIC
	 3izRsxKE9hqcadoBbVq5s0UwVg83NipQfJ0IQq5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0830DF80277;
	Tue, 20 Apr 2021 14:45:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FFA0F80275; Tue, 20 Apr 2021 14:45:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B99C1F80273
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 14:45:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B99C1F80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c1REMYId"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44796613C3;
 Tue, 20 Apr 2021 12:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618922738;
 bh=1PbygNKNA9EvrMlkEWK72bdIa0ZxSTl0x8B6/YQXO2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c1REMYIdhU539VDKxORP0yBu2CXY9emWxY4FW/YkH81b81jshxdkBXmKCeT+IassZ
 wXQxmQFduQp1YC78+jDyIbLhZzDNhlgfbgo7mm8+bYIhYmF9gHfYk/OvvRkUVICZ1B
 YtYWfZpl48rBEeUwhIY+P4R/r+oKXi2i3OYKuRYNKFhw6fbDlgiAmntxiV/2mRCuXs
 QIqsDOH6mCqA/rQrWQkAnbPGkcZYwM6HyXWJn6RotsibV5HuaA/B53GQUkfn+IHnKV
 JYYWvOY63af7bMyN/gvC+rljj0LH0lU9qNO0+V8oUC9iLcprsxRf/s2lNje/5U32vK
 zKUQml7HEhInQ==
Date: Tue, 20 Apr 2021 13:45:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [v6 1/3] mfd: Add Rockchip rk817 audio CODEC support
Message-ID: <20210420124512.GB6073@sirena.org.uk>
References: <SN6PR06MB5342B036562B085C95BDAB42A5499@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20210419165116.GE5645@sirena.org.uk>
 <SN6PR06MB534296C9BA80C56C0AD694FAA5499@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline
In-Reply-To: <SN6PR06MB534296C9BA80C56C0AD694FAA5499@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Cookie: Falling rock.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 lee.jones@linaro.org
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


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 19, 2021 at 12:51:12PM -0500, Chris Morgan wrote:

> If we enable the regmap bits unconditionally, is there any potential harm?

No.

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB+zNcACgkQJNaLcl1U
h9Dqhwf8DwMjOS3ql7o1vVhEAhOHbM0j8T7ks7rSuRBSoqrv5mU+LPb1W0vJovNv
33e7iiwoCCPMvnkxsker7D6+cLPuTpOJXSoeFzXvv93kF07XbcTiBy6jf298mLAq
FyC2cwSQiasp7rS5q+GXmzjMyg7Yymg7O0KswVqM8cqLKFkQN71ElYP8bIL/rQAk
14XnBBevdM7BBYL4AMWHiWOgxr61K8j66w3BkBrSKcZIh7qo4vXdV6j3HdbJElox
WXqejeKgV7bHSRAgg2vXNW8mVFdzJaC3Sq4VhU5jlXZbWj5ozLrHPQgEIC+M/t+/
Fvm2WBosJrq/rwJQGHrybYjkTdt2ew==
=yQfx
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
