Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C80B41BB8A4
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 10:15:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3368A16B0;
	Tue, 28 Apr 2020 10:14:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3368A16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588061746;
	bh=lyI9lFku9vkYS1yKZ+kqHIQk/BGmnbjmlEcJbr8Xhgw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h6TFrlpTGbD5PK8V/dlRo6Vo9VslwnHXP4CKca8N+yVKrFYBc9g8QLX2Lrd+GnmaU
	 fA3NNv11EWbt05uG0E/25wSspmiIbUidExw7G270AOU4y/JA8aKtp3lqgdbVH36l8s
	 lk8l7b4tykrtRdDKKS83nz+EfBgZjNMRwbiQlVVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA8B6F801F7;
	Tue, 28 Apr 2020 10:14:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D179FF801DB; Tue, 28 Apr 2020 10:14:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17EE4F800B8
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 10:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17EE4F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="V7lGextH"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="0KR9/7Z4"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id EC5E25800DA;
 Tue, 28 Apr 2020 04:14:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 28 Apr 2020 04:14:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Rl2dKFp212hN23zX63f+C/P6dfS
 tbQu0uWJ4H7pCcec=; b=V7lGextHwtaxIFTLlazW3bKC48l9uSC2as9K94BLlMN
 z+AIrtVYMgFeI5s1fzR2vZJLTgCYuMiBHXX8XjwKg40/GBOj9YbDA8X3/9dtlL2p
 Ej2qudOwnoPoD9HGVJLJ8dtKa7sjd/lGCFZcVV8/0BYE+V4Gw1pSyKcpfTroKhkf
 KwRym875pnQhhDJwsEA7HoCRGs+5gYjlAisfoxfEoDdudnOXt9J8mFNU/VNRKi9H
 ae0dMzVTUQpVx/8162Z2XjOeCVGYggcWGm1Z92aTlEUDLmUxdFlyHdO2VWBzGMqi
 ic9o79CB86xGTeVdfrkOBgE+nJARcul+d1ZZceJiOAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Rl2dKF
 p212hN23zX63f+C/P6dfStbQu0uWJ4H7pCcec=; b=0KR9/7Z4PvGy27sTQOgVhj
 fGBAcavBXb62ROKnUOLF+FhaTXS1GLunRIez5dtgmzfkV37pamU2rRkRFGMSVzpL
 9flAOJrM3Xg9COKeQPuLSHSw8gwvwjQ9zWKuCLxiXWDdrGuxQ/rVVkzMBg4KSOXn
 6TlxnGOu3BsGNZ89VLacYb9DB+bll6azrrXztMMNlwksskTU/cC1HtY2ZjW7Tk6p
 OdosNU7dG2H61smxEyfMxjjLcLOKqIHFAMA3CNthGapohsg2TmBAzu2hZ29P2idq
 W74I9/CgUDRPa56fZZ7sxMSLHirhyUyXf3U1jUdVkLPFWRamKxx/JUM0z2SJ3RFA
 ==
X-ME-Sender: <xms:9uWnXsCpwV72yiqvxhE4nlArD6ON2JmAIoGATUy4T4viAwDmIL002Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedriedugddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9uWnXgYfvH5yydUG2zNGQbmZvHRp1Jgmr6I2BlxSAswQCOVr9Hd72Q>
 <xmx:9uWnXkvL3rjW4j_ePDEEF4RS3SbMxrhRIp6P0PFVwJegIDnkOFqqrw>
 <xmx:9uWnXi9ad555hJxDt44hBAfwSzBHkpTsqqS5RQnRq1C3b-mP-reWIg>
 <xmx:9uWnXgFEU8EeGc3Pciue44v7fhSNlZ52z06WyNWJc36pdBh_avXZxQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BBFA13065E8D;
 Tue, 28 Apr 2020 04:14:45 -0400 (EDT)
Date: Tue, 28 Apr 2020 10:14:44 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 7/7] arm64: dts: sun50i-h6: Add HDMI audio to H6 DTSI
Message-ID: <20200428081444.vddwswsorl5tf7yp@gilmour.lan>
References: <20200426104115.22630-1-peron.clem@gmail.com>
 <20200426104115.22630-8-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="34tj5oypfixbg5ni"
Content-Disposition: inline
In-Reply-To: <20200426104115.22630-8-peron.clem@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Marcus Cooper <codekipper@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
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


--34tj5oypfixbg5ni
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2020 at 12:41:15PM +0200, Cl=E9ment P=E9ron wrote:
> From: Jernej Skrabec <jernej.skrabec@siol.net>
>=20
> Add a simple-soundcard to link audio between HDMI and I2S.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 31 ++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h6.dtsi
> index a5ee68388bd3..558fe63739cb 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -88,6 +88,24 @@
>  			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>  	};
> =20
> +	sound_hdmi: sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,name =3D "allwinner-hdmi";

It doesn't seem to be on purpose, but the name is different from the other
series you sent.

Maxime

--34tj5oypfixbg5ni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqfl9AAKCRDj7w1vZxhR
xSzfAQCyUP2gys2O31vFV8nbzG01R6D7k8xImWeYCJji+veaSgEA8v2gBNki9GaR
+i4rWPFMYJfnRvxQOzIiQzMgStA4hQ4=
=PQem
-----END PGP SIGNATURE-----

--34tj5oypfixbg5ni--
