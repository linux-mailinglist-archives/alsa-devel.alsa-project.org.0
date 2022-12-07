Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D403645BAE
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 14:59:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0449E192F;
	Wed,  7 Dec 2022 14:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0449E192F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670421577;
	bh=RIC1Cb1hSR/PoVvVlchvFUy6mScD0XG2dUhLJIgDbnw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sCpwEMwt8m4pnY3IOKaPtWTXavnmXvdUftnE8gPK8Qb7sT2u4lClzj2fY5NM0ELjD
	 y/oVM+EWxRtNQ1h83YSGiPGUMhwoa+AgtED1XUK70L5GS/6RpvuUDogHb928ZIZ73q
	 kJdYr38GiY0TQ+KVnBqPomwEjLG2NWtHtB9Tpj9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BF09F80301;
	Wed,  7 Dec 2022 14:58:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D132F802BE; Wed,  7 Dec 2022 14:58:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E92CF80121
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 14:58:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E92CF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tcHuDKAi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D406B616F6;
 Wed,  7 Dec 2022 13:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288DCC433C1;
 Wed,  7 Dec 2022 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670421509;
 bh=RIC1Cb1hSR/PoVvVlchvFUy6mScD0XG2dUhLJIgDbnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tcHuDKAix1m05GVzFUIB4skjq7TswGJZAvs1HDb4mp9YiO5Jr1/hLbOd/kSnLUjyC
 TIuipnB6EgbXdGKkBoOKKaysXl3oKWpe9IAbFlkuehQRVtH/smAHnFV6EJvP/B7sUj
 PVJIwq57X2tzVq9TWx51dew5jQv3SJLg3wAe0zG3tYvZ2+ttJAQWap2EoCQ15Ft4fT
 ik1dH0vmDfAieN/JzrBgYZY8LYCkaTpPUSgx0EnL4L2X+Vy4CezKbDHOaIdmYQSXn2
 pAgMd+G3cqGw0QuLmopfX0uLuDOHMO86VwYUdYFBLQ00jtA51PoDXPbFPgjKi/u/Oq
 uH0mmVDXPKd1Q==
Date: Wed, 7 Dec 2022 13:58:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Wang Jingjin <wangjingjin1@huawei.com>
Subject: Re: [PATCH] ASoC: rockchip: spdif: Add missing
 clk_disable_unprepare() in rockchip_pdm_runtime_resume()
Message-ID: <Y5Cb/1kRQVOrOT0Q@sirena.org.uk>
References: <20221205024317.2422223-1-wangjingjin1@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Yfqkupk0cs8hEwm8"
Content-Disposition: inline
In-Reply-To: <20221205024317.2422223-1-wangjingjin1@huawei.com>
X-Cookie: What!?  Me worry?
Cc: alsa-devel@alsa-project.org, heiko@sntech.de, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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


--Yfqkupk0cs8hEwm8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 10:43:17AM +0800, Wang Jingjin wrote:
> The clk_disable_unprepare() should be called in the error handling of
> rockchip_pdm_runtime_resume().
>=20
> Fixes: fc05a5b22253 ("ASoC: rockchip: add support for pdm controller")
> Signed-off-by: Wang Jingjin <wangjingjin1@huawei.com>
> ---
>  sound/soc/rockchip/rockchip_pdm.c | 1 +
>  1 file changed, 1 insertion(+)

The subject line says this is a fix for the S/PDIF driver but the patch
is for the PDM driver and I see you sent a separate fix for the PDM
driver.

--Yfqkupk0cs8hEwm8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOQm/8ACgkQJNaLcl1U
h9ClSAf+PYmaTOX76hZfmg6lP/5WGJr8lhDunNZmxMYdQc2BEK/H/wN2l+nR6ES8
v6jxI3ceMQ+78mMpQebV8Hiuvd880D3jjaPh/dZKObPYQvIP6sUthPwAr9nlZh91
s/EDK3rgQcJuOxR2gQdACyfIM+PvJ0HlNaz8RrGKyM3yq2Ik7ZqjeBJ6gPjODOUg
eXG5J5GD0Z64hhs572q95LKTTjtCPtcQ3uXqOSmhSqqPbb/pNqZAik069u3/UesA
JMInss8miBtQv7RfI9ffz4LiINXZpIAFJCeA2BfaLdpenSzz1zfEUfoNZtkQUqJI
6yCz5HFdPCyky7EA/IrsAO8EDNtTUw==
=TDQy
-----END PGP SIGNATURE-----

--Yfqkupk0cs8hEwm8--
