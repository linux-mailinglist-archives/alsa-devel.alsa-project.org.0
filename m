Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1BF4114A3
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 14:37:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98EF7169F;
	Mon, 20 Sep 2021 14:37:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98EF7169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632141477;
	bh=ywph2O72bB55A0SZOZeKnv7szm1alhRoV5amvQ+xdmk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=llJ0OVuidd9fHxzRrCv0e6ItEyyBCuHIQrkCCMDLQNVpoQoJJafJEzy5Ua1GcShey
	 xL2MVDDGct/wPtI3hKKucUIYjj6DYakKrwBH2cxhGpKFdx0njnJc9nwaG5l4rM7Pg5
	 xpoBoZT1rlPGRjM71tiCWIGRT2WvHTqN4MeBipQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EDC3F80279;
	Mon, 20 Sep 2021 14:36:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F03EF8025D; Mon, 20 Sep 2021 14:36:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD612F80129
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 14:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD612F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eTCnsEGV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DAD260F4B;
 Mon, 20 Sep 2021 12:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632141386;
 bh=ywph2O72bB55A0SZOZeKnv7szm1alhRoV5amvQ+xdmk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eTCnsEGVHfxv7QPlvq9V/ADyNY1gD58w0YYnz6K82QCLN3WSrOpG6nJiegqCZCQ63
 Ztix/126YwnBRKjAaPv5qDC5WV1fH7gqbKJhOozE1nXIDCP1p4I0aypn/CjBUHO+c5
 5HNI1booHeRADuJ7eLDAQVVU8ydqH3vKbUeea4VxcPe+RL5DG4TqWgdfWoYV6nlMeN
 XzrCEJ4Yrs0XA21xUyqjIlExj2T201bpD00DfJbostrihBT7SyZFTymelI6smm9v4h
 YW6utw6HSFtrd7IDzQVvsqCbDzpbJOqC8gpvwOZdRfVOBB0epBek1gDQjcnCKdOiTj
 N8RXyfCGtY0Vw==
Date: Mon, 20 Sep 2021 13:35:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: force COMMON_CLK dependency
Message-ID: <20210920123542.GA14852@sirena.org.uk>
References: <20210920100206.1418649-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <20210920100206.1418649-1-arnd@kernel.org>
X-Cookie: The only perfect science is hind-sight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>,
 linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 12:01:58PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Without CONFIG_COMMON_CLK, this driver fails to link:
>=20
> ERROR: modpost: "clk_unregister_gate" [sound/soc/mediatek/mt8195/snd-soc-=
mt8195-afe.ko] undefined!
> ERROR: modpost: "clk_register_gate" [sound/soc/mediatek/mt8195/snd-soc-mt=
8195-afe.ko] undefined!

This doesn't apply against current code, please check and resend.

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFIgB0ACgkQJNaLcl1U
h9CgTwf+MjdtdtiCsDwjnRIAJ8Zkv9hB5KXV0gHoCPjSyFF5tGeALEPdRb0NkkV/
SJJtvwBCG7RiNaaERXhF6hsxIXjivKxoz4gk8RmNLCgWrXxCEVJdSCO9ck/7dBtU
v4qjpA6YwPs6vNNmdRCqco+ftpWaCsfI+/WUvkYuyWX3nVFctr1/36ZX1bNpyIKh
yGkM1sSaM0hFA76VEsbTuL5DWZmwhcU4JmAf1xJXV/PwnCtk6qI37uptD8jI2Boe
g3ocEvaCCN0VUfaCW63TTAKvNmnsuQYItaBFEtmkoJlZqAi2toQmPtRGvp4Hzl07
AfnIDu5F+SVROur48PzSi2k9eeNkCA==
=FMjp
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
