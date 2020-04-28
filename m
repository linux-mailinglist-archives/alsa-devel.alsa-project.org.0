Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F381BB867
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 10:03:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15B931690;
	Tue, 28 Apr 2020 10:03:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15B931690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588061038;
	bh=AjbPceObFVbKf7vnyNyvtFoqL2bXtcejBrFAh+9ba0Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J2kWfijUIvW9j3IZCw2k6ozFRd9Uta3JMBPMwVAJVjZuxSjeXriwBL/ypNJ3pcVU8
	 y+JwXhf/wTqwOmnyFvFyfLpEHyJAgRrEvh+r/aVDbE0yQMEbf3AxFfiADmXIvWRE19
	 G38A9z9iDcwl4aJOKZxPeNTEDEuJoIfD0lVmWvqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FFA6F801F7;
	Tue, 28 Apr 2020 10:02:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01F8AF801DB; Tue, 28 Apr 2020 10:02:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6241BF8010A
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 10:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6241BF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="rPrCkZZl"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="fMrR8klV"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 65BEE58031B;
 Tue, 28 Apr 2020 04:02:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 28 Apr 2020 04:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=rgw/xMhvmtBFVnJEJieJuuX6oqE
 JNwtIrwF23ef3G7c=; b=rPrCkZZlKnK/4lvcnBnc5GbS1IXoysk2ALvP6IoJ3pO
 X7TY4hEjjaw/Vu5Sfj2cld0y7gpcMITeylr7N29uEzIwTmQPa4pM4YH1YuIWZIrF
 FFvs5xeWzyMORxjjWL4gyYDs8oPq0hp71SssLZWhy4lngd/CtD6kiOVvOUElc68i
 +OdhjqRZfLhye13LPThW6kxc4/QzkCzeFh9QadqrxH42EFMu1WWS0mHj7PnTv1lP
 gmqYLYPw3Rb5Yafh4JbyiqkDX7VM0BmdwGW9cjPuuoBwlQx8TAij7sxIdPtuQ1hW
 8ylbIJbYT/3TmpLGD2/FwCGTAKnLy1B4/qz1sBCZnFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=rgw/xM
 hvmtBFVnJEJieJuuX6oqEJNwtIrwF23ef3G7c=; b=fMrR8klVr6SLP+PoH7M9vZ
 WiZ4vuAsb3YryyOMTs1cKZc2SNQXMGkSux3MsnM5yezkRj7+LptPjiSgTMxU8f0i
 +2IEiHr7I4FTdSwLvxFwX4d8NNnjZIca3/AOdkzwTBXX9eJLuoVACh49Z8UtLZ3n
 lchiJYs5v9erT0rPHWdJGvLFk/RfZdANEv1iGLdQYI8ztm3Z6PmTTOZxo5gnECqa
 I+2+tPpROkkjBfsOP+3+Pxaos7CR8wZXuE6CAuj4pgRYdblGScxo//mgeGVKiWTl
 0sCk9RU3DmqYlZrQKNTEqXFculOs3nuZ4zYCzdwGHDpXGoXsyU5rK/RqBpZh0kjA
 ==
X-ME-Sender: <xms:AuOnXgcGCuDMch6YM8lSZxKuJBJqQNakEroCMWRotKCW98kqNsyVtQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedriedtgdduvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AuOnXrkmideO35ESHUCljugD81INszOX0Np_il6r7qfw5634zI8dNw>
 <xmx:AuOnXqDwuu7c1NbDMhZ7kKkcRx8F3EKSg6xszfDHI-xVVak5KvxjQA>
 <xmx:AuOnXleygGlaT7k0NHSa9CaIelT_5SB_A3dBY6_IyKIStZcTSd1ZEg>
 <xmx:A-OnXj7zoCfq_gjZ4KwWaLsGpWqEar0zZ23KM9qOd5WqVbFkBj5mKA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5B0083280063;
 Tue, 28 Apr 2020 04:02:10 -0400 (EDT)
Date: Tue, 28 Apr 2020 10:02:09 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 1/7] ASoC: sun4i-i2s: Adjust LRCLK width
Message-ID: <20200428080209.2n7eeaksfze7jicn@gilmour.lan>
References: <20200426104115.22630-1-peron.clem@gmail.com>
 <20200426104115.22630-2-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qwt7wotkij5dx55c"
Content-Disposition: inline
In-Reply-To: <20200426104115.22630-2-peron.clem@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
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


--qwt7wotkij5dx55c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2020 at 12:41:09PM +0200, Cl=E9ment P=E9ron wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>=20
> Some codecs such as i2s based HDMI audio and the Pine64 DAC require
> a different amount of bit clocks per frame than what is calculated
> by the sample width. Use the values obtained by the tdm slot bindings
> to adjust the LRCLK width accordingly.
>=20
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index d0a8d5810c0a..4198a5410bf9 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -455,6 +455,9 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_=
i2s *i2s,
>  		return -EINVAL;
>  	}
> =20
> +	if (i2s->slot_width)
> +		lrck_period =3D i2s->slot_width;
> +

Acked-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxime

--qwt7wotkij5dx55c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqfjAQAKCRDj7w1vZxhR
xW9rAP9E5eTw2YKxU5C8kBBozs78d4lLnoBuIYyVxy8RIdQnUgD/ZqU2MRZZPXQ/
K2A3JMxDdOeMf5EQwLUdDtKXLCralQ4=
=F0Hq
-----END PGP SIGNATURE-----

--qwt7wotkij5dx55c--
