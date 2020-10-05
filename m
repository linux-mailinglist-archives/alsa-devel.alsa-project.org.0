Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D9028350C
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 13:36:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D118717E9;
	Mon,  5 Oct 2020 13:35:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D118717E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601897766;
	bh=9iIjp37/XhLE+k5I1qJsgVwVqmwywet6IjVcigOxNS0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CtG7VjVH4Zm+q0r0m8Lrx+3Qo8tVMOjxdgOl7jRBopxUChV3qbaloPnOIIJ58BJY1
	 0Krn5WCN/3amLOOnLEp6qWWCUsN7/waDmPq20uMLZCPxzzPU5rTQW7PwwyPutLNndv
	 A2zm4CWkmytd6u3OzxRI0t/tKK8binotOmPuM/fg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D3B4F80260;
	Mon,  5 Oct 2020 13:34:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2ADFFF8025A; Mon,  5 Oct 2020 13:34:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE994F80245
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 13:34:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE994F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="M9X+L1pm"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="rI+DRxbr"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CD02E5C012B;
 Mon,  5 Oct 2020 07:34:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 07:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=9iIjp37/XhLE+k5I1qJsgVwVqmw
 ywet6IjVcigOxNS0=; b=M9X+L1pmIK++lhVSejPaypeMI9cyxCGoyaAfU7Lvgl6
 oXNOr+IJsTnRMltDQ5KxcR0CRefq4tZRq5XrdKN98pIoSFiSSXoRHENZAz31crRh
 anut5oPPVqPUAN7ZdXqkAKhGOpD5GYGUFMvxb/N6PVCIgLo47oYAXQI3CDln153o
 4zzA1TgORP88QtvruTCWIpHXkHgS7ShMRQNBuFn1jLwqSk6mKNQvKOEW4i62yjpT
 KTRypUhlq5FkJg4cFVLnoYLVPWQuZLpw616JcuF+yX1/ZrexN6xHsOp48FdZQ2OM
 8DZ5eb4ecu2eHWjtCdPqlgYieibdS7SH+5QkuPE4knw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=9iIjp3
 7/XhLE+k5I1qJsgVwVqmwywet6IjVcigOxNS0=; b=rI+DRxbrK6+Dnexg5ebja4
 MfuwzeW2CygVksd9JZ+WV3HU6ILmw9tvHi4rxhAa2gayLxt/6VCvSN/3M0K0yIaF
 /BnAvMqfXhFnbAWdiTMj62CNZslC7955Gh6n0apwi75GwCYNGiHTZpBfxV4pTxoj
 clsKXZhaaOgEaXu70U6w8Ou9/SMRt/jqeP1z19FRcKE6dfvVFFtlcUe7ufOoyCV/
 AJYc4xP6SXoWzW2hBLHSFniFDzHi9gctkzaywuPHbkONPfffyCZAHWUtBZp1mjOH
 jEEJClwhA+/X9AOpIw5pn6Nq1Y1s6+5mZlBo4XJcfOxGQV7zxHfxH/+nD8fCNQIQ
 ==
X-ME-Sender: <xms:twR7XyS2H1BZm5vgAcOs8fwrXtllH5hIkVuam35ePKQH0lynmnVjaA>
 <xme:twR7X3wBSwS9tqnPIaf5ZLWxaCoXWUkknWLr-9OSIwx4t_o4gnoqiEZ3em_eX5diT
 1IoCHIkZYNvc0ubMj8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:twR7X_1h9RSBJRF7mJc3CHhwIG4Yt4P2z28nsTMVcCm2D2POXz1nhQ>
 <xmx:twR7X-Byo2JIim8pub52T6pPHBAT3CWC4WoaP1EAaHzMwQejItV4Gg>
 <xmx:twR7X7jtkDsm12PE9DBgDMK6buMgYVPMKgA6KmSsMc19xSx2Ot27RQ>
 <xmx:uAR7X7jip8syoh_MOTaf0N85NYdYdLmsc8z0kTC5lNVgXL4hyt4Spg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 04A4C3064687;
 Mon,  5 Oct 2020 07:34:14 -0400 (EDT)
Date: Mon, 5 Oct 2020 13:34:13 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 14/25] ASoC: sun8i-codec: Correct the BCLK divisor
 calculation
Message-ID: <20201005113413.5f6gcval7hs7t3jr@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-15-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xhjd3ry3gdnm7vqm"
Content-Disposition: inline
In-Reply-To: <20201001021148.15852-15-samuel@sholland.org>
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


--xhjd3ry3gdnm7vqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 09:11:37PM -0500, Samuel Holland wrote:
> Previously, the BCLK divisor calculation assumed a power-of-two slot
> width and exactly two slots. In order to support the TDM slot binding
> and 20/24-bit word sizes, those assumptions must be removed.
>=20
> Due to hardware limitations, the BCLK/LRCK ratio is not as simple as
> "slot_width * slots". However, the correct value is already calculated
> elsewhere in this function, since it must also be programmed into the
> hardware. Reuse that value to calculate the correct SYSCLK/BCLK divisor.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--xhjd3ry3gdnm7vqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3sEtQAKCRDj7w1vZxhR
xfxfAP0esmwfQCVq01Q98p9I/iUqCg9zaDuw6iXkxrg0ErmHoAD9E+T4urVQ6q4x
a5FysRZMNc4J+LMqT6SWbTtm1gjZLQ8=
=ONxU
-----END PGP SIGNATURE-----

--xhjd3ry3gdnm7vqm--
