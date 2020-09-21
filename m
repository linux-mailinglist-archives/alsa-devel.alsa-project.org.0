Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D68F1272688
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 16:01:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73F1016CF;
	Mon, 21 Sep 2020 16:00:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73F1016CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600696883;
	bh=dzBvSxVSP3P5OyeQik4NqLLJGyRvLKXSiI/zLVkYnOI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f+GRUG2h9DO54l/exBDLs1+Q3Z7iYYppv7MEvQGJJh6laSxm7F0W8aKvsykaMCvaH
	 TYCvZkSaAwGt8phuByH9LOayRNkL40vRpYzoji4saR+/SxUNMsNlSad7hPimG5kZIj
	 RibY4TFV/qSSmutX0cFshcN+5dlg0bSwi628BB8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF1D7F8021C;
	Mon, 21 Sep 2020 15:59:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54174F8020B; Mon, 21 Sep 2020 15:59:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08F72F8010A
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 15:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08F72F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="qXXYhwH/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ti2L2NgX"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 9E2AF4E4;
 Mon, 21 Sep 2020 09:59:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 21 Sep 2020 09:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=c
 3fNgNGFdjr4v/UDr2lGz3PU9DDItsmFEZI0JCY2YTc=; b=qXXYhwH/GTxVEum3l
 nWjqfA/4M8vVjuJp9aWR0peh/PDyt2l5umtY96hRwVfGZk9V7s0lwMkNSOIFr2RI
 p23MNnUkbm7mxf/7f3MAtUxNuTFI/wBcoVrLzffjDID0JIOkPXZVgKrWs3YGucoN
 tydo40DiUehnf4+Pm3pTCp7ONK1dF6xQDJPOasdrUB/K77BhlihDCcdDqbC5M+u7
 H/yMqEhAzXbgz3++S7mv85WYJ8p4E8tG8XWm+5JkZYRsYvxIlRVZ7r4TgPcvKgnj
 lbl9wOPktju6jc6Z/dSbYmgYb7Y11xcH4x/GbmKNJ1vAuK4C9VIlqq62cZiaIuJ/
 //bCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=c3fNgNGFdjr4v/UDr2lGz3PU9DDItsmFEZI0JCY2Y
 Tc=; b=ti2L2NgXfjI3JLZ38emVWOBmAT9vIL7KEr9CEyixc0TVFJgVdxPzLXO1T
 hSftB5jxVMhxUFD/gtY1sV/O4AvEVd9hBH3/GNpP4DLmn9ZyZZcRNHokdyi4rxUo
 YZeLFPO+GwoND+F4Z6fHAQ6o8AORMdnGp1hNG4AldGpUDMEVwI3zvKyiVRc/jkT5
 RRvSsRX6YxQNvz7q3SMhfcN84gHmLWvFq8GRqVeKoUCR2dhlDeMMT7wrJ7md6zkd
 v0pSvm0i3b4FO/onne6AlfcY2o+eIBU0ArjnuidYrsa1tU6PM5G3N+xDTfsUjPkO
 k5EJgH/yuTZtgDDVs738BNABIiAAA==
X-ME-Sender: <xms:v7FoX5z4tMayKshtbNMi1-Arz-vd1fkDXzb6gVzFMWHjmGRE7q7q_A>
 <xme:v7FoX5QeMPKoUZraeztdGE6z9OaobTLvR0G86JDrUCJMUvoX2ZAlcIWLVHZXafjo9
 u1PNih81xbeGHw4VYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvgdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepheelvdfhkeelgfevleekleduvefftefhudekvdffhffhgeefuefgheegfeej
 vedtnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:v7FoXzVVxtlL5-uki4uBoTXR8Oa9kZ_9eqpAf0rpeyuXWPE7Z-EDrQ>
 <xmx:v7FoX7hRv7E1OLH8fJvBcCrAh48kpC0DJbtvrjA9qmyF0Q6nw0dKKA>
 <xmx:v7FoX7DfxLODG9mfzJvboddmCrCzwT6E2GY9OBY08bY6jQnVXaR-iw>
 <xmx:wLFoX4Ih48dtHtsGWI2BV0cS8vnMURQnbnblNjz0sezZ_eDvCXBwOpHgxM0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CA1903064684;
 Mon, 21 Sep 2020 09:59:26 -0400 (EDT)
Date: Mon, 21 Sep 2020 15:59:25 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v4 09/22] arm64: dts: allwinner: h6: Add HDMI audio node
Message-ID: <20200921135925.q7mde2cnt5jtzkb5@gilmour.lan>
References: <20200921102731.747736-1-peron.clem@gmail.com>
 <20200921102731.747736-10-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200921102731.747736-10-peron.clem@gmail.com>
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

On Mon, Sep 21, 2020 at 12:27:18PM +0200, Cl=E9ment P=E9ron wrote:
> From: Jernej Skrabec <jernej.skrabec@siol.net>
>=20
> Add a simple-soundcard to link audio between HDMI and I2S.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 33 ++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h6.dtsi
> index 28c77d6872f6..a8853ee7885a 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -67,6 +67,25 @@ de: display-engine {
>  		status =3D "disabled";
>  	};
> =20
> +	hdmi_sound: hdmi-sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,name =3D "sun50i-h6-hdmi";
> +		simple-audio-card,mclk-fs =3D <128>;
> +		simple-audio-card,frame-inversion;
> +		status =3D "disabled";
> +
> +		simple-audio-card,codec {
> +			sound-dai =3D <&hdmi>;
> +		};
> +
> +		simple-audio-card,cpu {
> +			sound-dai =3D <&i2s1>;
> +			dai-tdm-slot-num =3D <2>;
> +			dai-tdm-slot-width =3D <32>;

It looks weird to have both some TDM setup here, and yet the format in
i2s?

Maxime
