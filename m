Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE80571861
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 13:16:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08ACA822;
	Tue, 12 Jul 2022 13:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08ACA822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657624590;
	bh=pl+XSTy71759ycCBgu9SNDcZUWjRzFBZrxHr5o4NhkE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G087qTPrKGq70MRecfy8+vUgFZhPdFAE/1POgKn9yCkBg1Lw7I8zSCNmUIeef4N8H
	 bHfX1Sp5Vs2XuPXLnAtU1qc1IeFWjSAaaZghoJsWlZiV4vUzYo93TV8QlNSVkr0AJr
	 NZZzAieCDpaPqy2qDNTZWnalI83VxdC0ZLNrsX88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78DDAF800E8;
	Tue, 12 Jul 2022 13:15:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A826F800BD; Tue, 12 Jul 2022 13:15:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BFB4F800BD
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 13:15:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BFB4F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ij/VftPg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E3A7261248;
 Tue, 12 Jul 2022 11:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A7EC3411C;
 Tue, 12 Jul 2022 11:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657624518;
 bh=pl+XSTy71759ycCBgu9SNDcZUWjRzFBZrxHr5o4NhkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ij/VftPgtX3+p7oZlqQcNN5X4dIQyuD2oyvEMy/kkK0HkdTOPivSOS9gdF6Faz3Nf
 aUaNyyqRK1qIcgwuhwiki0AUEcELQlz9tmwnVSshklWq2Sxy39jfBLdPiJTyDh+qC1
 dA/R/95PdNkPd9CvjIYA5JxoRSNcPWiD1bikxvks11Alkp9kv6x0NwKT0H78aWQHYA
 IfTbm5APcUCzxBmtj1hwiCk/SLcIOooR1hvG+WjDP/oxLEhTgKplMI6ZTk5iBNx2Ck
 Wp0a77ITRnEpA1c1IOB1y0l7kqsa655UY9kOthW/QvuecFdALJmOnG+g5WvS7OXk8F
 qzZAj0r1/JzlA==
Date: Tue, 12 Jul 2022 12:15:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s: Fix NULL pointer dereference when
 pinctrl is not found
Message-ID: <Ys1Xvp+IMIUpzNzo@sirena.org.uk>
References: <20220711130522.401551-1-alexandru.elisei@arm.com>
 <CAGXv+5HyD63MSmnNSoHX6euR2qpnqh-Fn9rdRYRYz4Ci90+w8Q@mail.gmail.com>
 <Ys00vczqcIGzOadV@monolith.localdoman>
 <CAGXv+5G=YvDkm8a=Wyui4mqSskqPq-kQJfU4HGNXSGzz0hXiqw@mail.gmail.com>
 <Ys1UqkHRyvv91UC7@monolith.localdoman>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9fEy3WxPqrp25A5C"
Content-Disposition: inline
In-Reply-To: <Ys1UqkHRyvv91UC7@monolith.localdoman>
X-Cookie: I like your SNOOPY POSTER!!
Cc: alsa-devel@alsa-project.org, heiko@sntech.de, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 judyhsiao@chromium.org, linux-arm-kernel@lists.infradead.org
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


--9fEy3WxPqrp25A5C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 12, 2022 at 12:02:02PM +0100, Alexandru Elisei wrote:
> On Tue, Jul 12, 2022 at 05:25:43PM +0800, Chen-Yu Tsai wrote:

> Any suggestions?

I think Chen-Yu's suggestion of reverting both patches for 5.19 is
probably the most sensible one at this point.

--9fEy3WxPqrp25A5C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLNV70ACgkQJNaLcl1U
h9CbyAf+JJJlABFoNhMUptCoSgIxg6keunheh8+GJnPLI0O/NtsiaWYFVqZXpuwR
4boFSbhWcQ5u2r03Utj676hsh7pGIztD0DgmlPrz8mDrLkxBJOxCBD/pLgGjgIBE
ET844Y3Bvfd+3YEPZ/oBNYH6/IALfruWjCoNeT8gbLLbFuxh8b13Vi+m/+YCINK0
Wx/upzf3+kzP70TytIzjtOE3lFmvalhbXg+2L9KI/KuTshS49kARSbx88KyHLlDx
4pF/HG6rRxqlIkCZYnWF+BVwuDqWlxl9zG10PAauBoOfflhoccMb6mk0nhW8hlpP
fRJ/16Nq5K+4KFtQN9U/lSG2jERAwA==
=X9aC
-----END PGP SIGNATURE-----

--9fEy3WxPqrp25A5C--
