Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B672833C3
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 12:01:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B244183B;
	Mon,  5 Oct 2020 12:01:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B244183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601892115;
	bh=cwFbzPaLaQljsJghDrEikJLDdQ4XtNr33lmmyf2gKxY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ehivAFhysBUUJkfcDOnzXyR9SQYaeOVkplkwr2h72kW405MX5iy96qo1VQ43or161
	 nlwgX4ZsyMOh8t0sqQFx7/PF/vDZvYmMJT+ksHktM4TtL2r2GF7z+bOUQk3KhfB7YK
	 D9xYW4gyziOdMkf2RunBfmR6qbba7tTN6HMWpMXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEA08F800C9;
	Mon,  5 Oct 2020 12:00:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA285F80291; Mon,  5 Oct 2020 12:00:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C34AF800C9
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 12:00:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C34AF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="aiKieFio"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="gFUAnKEK"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EDDF55C0145;
 Mon,  5 Oct 2020 06:00:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 06:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=cwFbzPaLaQljsJghDrEikJLDdQ4
 XtNr33lmmyf2gKxY=; b=aiKieFio127uY2IF6d+JPCHPgfDRQlEjquJQHNyTPnf
 BXE6GojWsTq/w4Cy2Q0O9x04uRGSqGR+LjSFtxAQwrRvq4BksBsG5W+v6KtvtmiG
 G3zLK0Zn6lBn1gQ8LpDy8CB3DBx1ZV/RYSBL//ky9N1deBlGBL8Aej9mSSzqKu6X
 tlOumGKz+fG40Yi3HgLfyq9cSJp3T0YKUOEZ8KcMzoYudjGYS+Vggu0vHDNqVH5Z
 HFTMpL4GkiX0MxqXg8jga35Xh+vNO/d9/+bCBiqNDA4L2i0lQVhTcByHdoYuQcgt
 zzL5AZezCgI230UzLB4ESoHBe4clyx0UeQLDemz7beA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cwFbzP
 aLaQljsJghDrEikJLDdQ4XtNr33lmmyf2gKxY=; b=gFUAnKEK0+eeyFJp1l1Ic1
 ERJkTTqH38HR5xgxqPssEkSnAxFozGRA4YttfdOah2rnr7kg2VOw9sykQEVvaQVN
 6jrAqlELFTnVbPPgIUqJJqoAmx0wHPfbFRqwOyAWhMzkLt2Y/PTqCq0mL3PX++2Q
 Lld2ubjKdoNeJY9t30qRJmi7O1vYNncsjzQSNTLkj0j87v2cb77zgtqlljtYJfIC
 siqxj8jnB/J+W+e8HehAhhllnN3qsfH2Zso4bp/kBt3kX1aS3RiGpk+MdTrpD+uf
 vTL476DFEVL7rmc+jgUWdePSg41bSpr5WAulUfxTLYqDJxjcLib5Ddlh7kQPu8zg
 ==
X-ME-Sender: <xms:wO56X2zPNjrZfsrlbNxHdT1pvp0W7LOz32Uz5ix38Tis4G0nIh6UMQ>
 <xme:wO56XyR1Ny8LZSsolCmQUCgWc9Ig9HVQIzoCl1fUH6-T970XYd7ekbcnXOYBruWpE
 J16h78nUlF6P6qBDzE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wO56X4WQaxob4SMTBBGu8Om8hLpXOJT2kf0iPpzrp1D81NJ34XhGPw>
 <xmx:wO56X8hyI7lHxb7fTEXONvNPOrJhJrzSFkx_KnQz73xaKg4iCAzQTw>
 <xmx:wO56X4BT2ymiKxgKxgUs1qhgWkwJIndxNQUOY4sODIXoI4H8tyEIkA>
 <xmx:wO56X2CQuPKQS8kRN4lVKlx-OFkhhbtcVpQWuONZCT9RFV5GdF1Xfw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 610F73064610;
 Mon,  5 Oct 2020 06:00:32 -0400 (EDT)
Date: Mon, 5 Oct 2020 12:00:31 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 06/25] ASoC: sun8i-codec: Fix AIF widget channel references
Message-ID: <20201005100031.qwdialmcih2jsral@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-7-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wjljtkjgw2izabg5"
Content-Disposition: inline
In-Reply-To: <20201001021148.15852-7-samuel@sholland.org>
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
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


--wjljtkjgw2izabg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 09:11:29PM -0500, Samuel Holland wrote:
> Both the left and right side widgets referenced channel 0. This would
> unnecessarily power on the right side widget (and its associated path)
> when a mono stream was active.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--wjljtkjgw2izabg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3ruvwAKCRDj7w1vZxhR
xZf1AP0ZweL6o9eYl6Q1sEthrDtAAkm6X9jriyM6iOhXcqjcSQD/Yq34ffx/5pL2
SZcHMDb29YGQTzlZAJe3MxSmhzCM3AQ=
=0U4M
-----END PGP SIGNATURE-----

--wjljtkjgw2izabg5--
