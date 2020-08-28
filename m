Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 809322558E5
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 12:51:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 216AD189D;
	Fri, 28 Aug 2020 12:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 216AD189D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598611909;
	bh=/gfjnM86qHopg5RtM/lW9LCvWwSmzPBMEV4wucs/1pM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=atEX4QnrSM8Jun4gClGuZBk9BnjKyek3RpVN0tKAuOEtwCJHVHqZ3jaAH9I4YexJc
	 eQ5H8y2E9cK7tfbHB67OAxXJtEYICH/7aPaynw/E9YiYIe1dyveNBe4stTJqZVH7k6
	 2Cj/Vd7qOXzNSZsoyeat/Noalxjz5SaEP54FKQ/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D9D6F800EB;
	Fri, 28 Aug 2020 12:50:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D823F8016F; Fri, 28 Aug 2020 12:50:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0184BF80105
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 12:49:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0184BF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="Vozv8aET"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="WW3lPhXU"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id A6035580587;
 Fri, 28 Aug 2020 06:49:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 28 Aug 2020 06:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=VtuzJ97VVsG3s9xSqH164E5SJoT
 +rY8ff3DHViPD1PI=; b=Vozv8aET6hkYKrEPdb/7OVUKbM2nH6HAv6Yyq5G8xOY
 EZGPjeE7T4VPUJetB1DFsNAyl7zfyPkpxDEsj0eedPwfJTWwb452cWfUEm2VLDXp
 Bv8VxsRnbWY5EfffptUa+S/CzAGR5i8PbLBRsDKF1ea8tXIhkvFYTj3DT8ZvXOCM
 RALkvKKJaycbbBo5ASosQIFIbm+9TgI1peq9Xj7JID6g7vvOYfkiYaWVqtVkdPSS
 GsEgdghoPAOXg8UQPhG0A+nxZYNq9HiFqE3qfU6ZVlrRfiue5lJBB7Of/v81uu2B
 DduyRZwaKzo4VOkN5PpEywph9KJV2nz1NojC9mPs5bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VtuzJ9
 7VVsG3s9xSqH164E5SJoT+rY8ff3DHViPD1PI=; b=WW3lPhXU34aIyvZ/6Of4yB
 TCD435sw0/iEpLBxnEnlkzQWQthOGqd9SybhOQMLSuunjA7zxwXbobfX1pkT3pJi
 xrfh/wEF44sTwS0U/nqhJf9f7P/UzxaR//fUVcsVzNz5nbe28NSz4klZAspPDT1d
 urv7ywgQxlmN9otdg0JC4wljaMxBOGJxT4sezwPmNfO1/I2zNKkbisAPJuyADX+S
 Tviy7nO4uH5h8HBMOGS/E4oQ5VzZVREh2bSPsrmBuuFfU9Jut31sIJra4bEsvnEg
 JC53vnSNUY5rqZw8bzoZnn8U+AdVctwVQT4qvZXe+/lyFGxWKc7L3E3n42swKBGQ
 ==
X-ME-Sender: <xms:TuFIX-Nkm23jogQTjpLvEvjy3ZmWcMTWo4U4S8k8nSZL69AYsUS18g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvjedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TuFIX88CCGvzHU3tvY9WQ4BV1RQ4Ev_xCXisSaOgerLE1Z6vVRpjMQ>
 <xmx:TuFIX1SEI9UADz-KsxytxCxThchCSt3ZPhsnO0uMOcbmDjsvfY83EQ>
 <xmx:TuFIX-s7VsMHIWCPpqeh1Jwvsfp9FS7mvZzFivhkPecp9dHIQbp71Q>
 <xmx:T-FIX3UjdOEP5w-yE91lgpQqsGdwwSdwXBIuJscXYc7axoFX7P8fQw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F0E1B3280060;
 Fri, 28 Aug 2020 06:49:49 -0400 (EDT)
Date: Fri, 28 Aug 2020 12:49:48 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 0/7] Allwinner A64 digital audio codec fixes
Message-ID: <20200828104948.sdq2ftwiwyjhh3lc@gilmour.lan>
References: <20200726012557.38282-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yat6lg3ldh2xkhmw"
Content-Disposition: inline
In-Reply-To: <20200726012557.38282-1-samuel@sholland.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ondrej Jirman <megous@megous.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
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


--yat6lg3ldh2xkhmw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2020 at 08:25:50PM -0500, Samuel Holland wrote:
> This series fixes a couple of issues with the digital audio codec in the
> Allwinner A64 SoC:
>   1) Left/right channels were swapped when playing/recording audio
>   2) DAPM topology was wrong, breaking some kcontrols
>=20
> This is the minimum set of changes necessary to fix these issues in a
> backward-compatible way. For that reason, some DAPM widgets still have
> incorrect or confusing names; those and other issues will be fixed in
> later patch sets.
>=20
> Samuel Holland (7):
>   ASoC: dt-bindings: Add a new compatible for the A64 codec
>   ASoC: sun8i-codec: Fix DAPM to match the hardware topology
>   ASoC: sun8i-codec: Add missing mixer routes
>   ASoC: sun8i-codec: Add a quirk for LRCK inversion
>   ARM: dts: sun8i: a33: Update codec widget names
>   arm64: dts: allwinner: a64: Update codec widget names
>   arm64: dts: allwinner: a64: Update the audio codec compatible

Applied patcehs 5-7

Maxime

--yat6lg3ldh2xkhmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0jhTAAKCRDj7w1vZxhR
xZqWAP9GxoV0XxQnuXpla7KwCEoiiBC9jsLVHXrAH8rtQoc2PwD/eELvNUMYy0wh
D/rC/j6ImujUJPGQcP5cCV1lOoISLA8=
=Pxl4
-----END PGP SIGNATURE-----

--yat6lg3ldh2xkhmw--
