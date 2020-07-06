Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCA9215229
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 07:26:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66AB61680;
	Mon,  6 Jul 2020 07:26:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66AB61680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594013217;
	bh=ILtDYkio/SxGrWXtWU7LPyleNA3WUTJwA9dGmCAgkyw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=umUfNC+PphrgxEcMHta36k7LkbOxFUcmfTBJAIp590JzBpjbc+4u9quza0TQNArHh
	 EkgnvtScmQpJkDpChZ3+KV5AwYeQ2saojnkayVzptXMVr91LiyZeNO3YMCKsYLqPmA
	 KvVquFzsZR9pMh1coaZpB6b+zS/NDfmUUwhZByw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ED7EF80161;
	Mon,  6 Jul 2020 07:25:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D8B6F8015D; Mon,  6 Jul 2020 07:25:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9453CF80150
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 07:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9453CF80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="pKROQzTh"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="psUvSDYH"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 895A4580508;
 Mon,  6 Jul 2020 01:25:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 06 Jul 2020 01:25:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=ILtDYkio/SxGrWXtWU7LPyleNA3
 WUTJwA9dGmCAgkyw=; b=pKROQzThHBEr3YKqA4b5+DBlRQ5YqCAY6brTw5BnwVG
 YSvPlOXP1YXl67f1BpwN+nD6Apve5wYvfjPRszyzFqe61AEDefGo/EG4LvRKdJgV
 y7ZmfFBcdKhnlGeHbEBNX+gt4NtRZUlWF0WAdFxP28SqoDk6uNTthwVLvs2BZ7ds
 7vslUokACLpO1o4Pkym8rQml1Gr9jz23/g6CiW6pqarwuBTBrw5gXXhrytwjZm10
 vs49tOls91eObKrGS0DLDTZiRtdLQzXBjQAl2jBOhP4WZm0t/XB/k8JcZsmtO1yo
 uBkGLLc4hvyzR9Q15fCJkuSf+fVbc1uIBHJRX6fSEMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ILtDYk
 io/SxGrWXtWU7LPyleNA3WUTJwA9dGmCAgkyw=; b=psUvSDYHzkbxrV9w+cdSYZ
 TVXoE5M7QJ8ZGXDfudSqtgOqgalwyjTqznZmtxROQmT9XzTw+1qBIzJQcj61vzC+
 /TuNNT2wUaW5bXFFef+HD1JgeanjyNu0eKmHK3G48mpXETIRt2UwhO4GFomHKDFm
 pGcCyYHcsF1zYOWfjk/K7mVWzdgmZAhQDg3DGr0RiznDpOOiNnkMdRsSHsUDqrlU
 HpTxQ6uCwfJPppMemHc6e3rjxR/NW6BkgBxIrA5AL47wi7rkcCo5mPgy0kFSrLsI
 x+/CJimEijc0kbf9SZPKFsKrAgMK9hFq+V1M7lnyDpeh0PCdH759LCc0KnQgbayQ
 ==
X-ME-Sender: <xms:wrUCX2dBjFwvsvtOxD7_RvlqJiR77MYTDLvtd2ZitXC0_2p99A93XQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wrUCXwN_ZE8qGSmdak-441G_T38ovrUYtStxothvrUCQywRRYT0nGA>
 <xmx:wrUCX3geC8BW4QRTddTmUYtaV9EapVt84LCGzSiw7-Qzr3hBxNUTUQ>
 <xmx:wrUCXz81ny3fJebnTlAQ7YH_1ICOezutZe9Ub09HklsT1wnDLLPP3Q>
 <xmx:wrUCXzl98WTYIhwjq6_AkhE7oFYCnt3-WCunjYPPtlA7Zg0WGe3bZw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 27FE630653F0;
 Mon,  6 Jul 2020 01:25:22 -0400 (EDT)
Date: Mon, 6 Jul 2020 07:25:21 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH 07/16] ASoC: sun4i-i2s: Fix sun8i volatile regs
Message-ID: <20200706052521.cpsqkd3yadrzbu7u@gilmour.lan>
References: <20200704113902.336911-1-peron.clem@gmail.com>
 <20200704113902.336911-8-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nj26snxgljor52zn"
Content-Disposition: inline
In-Reply-To: <20200704113902.336911-8-peron.clem@gmail.com>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-sunxi@googlegroups.com, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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


--nj26snxgljor52zn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 04, 2020 at 01:38:53PM +0200, Cl=E9ment P=E9ron wrote:
> The FIFO TX reg is volatile and sun8i i2s register
> mapping is different from sun4i.
>=20
> Even if in this case it's doesn't create an issue,
> Avoid setting some regs that are undefined in sun8i.
>=20
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

Acked-by: Maxime Ripard <mripard@kernel.org>
Maxime

--nj26snxgljor52zn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXwK1wQAKCRDj7w1vZxhR
xXHGAP9d880O5SZa3z/uz3yCWB6TSyGRZRO+OMed5HGlkeLCKQD/YIx7mGEurwoI
Enjw6MbwmQcouqRr3IIZqVom3vvcQw8=
=5Pi2
-----END PGP SIGNATURE-----

--nj26snxgljor52zn--
