Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE9D3FFE4A
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 12:38:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F6E517E0;
	Fri,  3 Sep 2021 12:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F6E517E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630665517;
	bh=ZSwDuNXYbuxx+IfoWU11J1pUxp2fFxpYQBQbyqPO+64=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pjz9OvV0GBGrBDdv0JsjPmjP+TWiJZwGVrC02AR78bRRaMNCItHYxQSs7DFqvyLBn
	 dy2Vp2rHtzhN+x2kO6z1aM7jLSU7gX2oFE6oIhDooHGiqr3bCxsX28IWtff0vUOlSG
	 Zgrn+EJ2J6uxK/rgF8cpxIMDCSBM/Qj7I15Vzzeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82006F800B5;
	Fri,  3 Sep 2021 12:37:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9C28F80254; Fri,  3 Sep 2021 12:37:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11FC9F80088
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 12:37:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11FC9F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="uqd2z0PK"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="vbkAuAeX"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 8E39E2B011F0;
 Fri,  3 Sep 2021 06:37:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 03 Sep 2021 06:37:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=92f0ToILxLd4qqC7uwuiv16lIYd
 cRF20nOyTcl2xBHY=; b=uqd2z0PK/3fEi+nR/cs8fCE/vKF6g+2s6A3ovsdxLeu
 lnHj2q551kmhSh4txQ0uqND9WI0AlQSynb+G8PNXJO2k5wRg06BwzoZWMWGxooQ8
 OAhJDtr48ZOZOpPRceKE53w7n1DwgMCsAGtteAy9vPVHbxuzwcnECU6REEN0lEy1
 6+wL4SicCG3pZVPbHVB8BTfcHl2qduhDrQb/T/fPIs1YlYOBucrSB33iTQRHF2Yt
 fSPUuWR9dvavC4Rr8Y+uasAHtOKV7xiXWq3/XfaXBkZ2qgrOAOZbkajPyKBeX/nn
 HuI6GX2QPBkKECePr26BoQJZrPjlz1/Xy4f0ashb9kA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=92f0To
 ILxLd4qqC7uwuiv16lIYdcRF20nOyTcl2xBHY=; b=vbkAuAeX3kSJLKJZ9Aebrv
 jFjdJzFujZanHKgba1OXh+4kCaio5VCQZUM1xB4T8tc6WLllUlRkJSrjnCzh9WKt
 SG+AuXL/VAanT+uxmAp+1oRmSHq9DlMzpfdvNxfyoMx9hfkOe80nfOzI8bE7LWLc
 iQ5QFz7U2BP00ttaE77k/ZyjSlKdXLMKXEnGIvDqW/i4L/A6UAZdazxXk0wqCP5z
 NXZMzl7zTEgFANAg+MNyFCjGfaHV4mBTOlWXSt1SaAj+VZREF3dSsLkaszK789VD
 +oUBpnNmLqSf08u9eAAVbShzNrY5wRmvNwxWMxZrFtPdraeuQ5paoO2QvW072sxw
 ==
X-ME-Sender: <xms:1foxYbsRGdURdXauFO1mA0UlRilNERl2oBfdlU0UvSUeOHyYwNNeaQ>
 <xme:1foxYceq9AsUd3pkUsDTLnlJj0HcHH6Sh23VEtX7hlFyy8QCtwGFzBuwnV3kIj9ZF
 dMNJw5-sqXGnTfUwSI>
X-ME-Received: <xmr:1foxYezYb-HzCojHZSe9AE8E_lkJ9to5TJvLzqMNnQ9LRqA5h4hmViadLVD32Xf9qC_wJgoRuFZXHv0f2cWy3TNbzz8tuxT_4Tsv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1foxYaPQ9l9EC7rMyP1oI9beED63jwIqw8A4b1uKm4Y4G3NooF_hcw>
 <xmx:1foxYb8LEYhrABQIEOsLktUO4Xhjy4PBI8wvkbheim4F8a9hCh4DGw>
 <xmx:1foxYaU2yjYeG-ZG2HCYuOy7EQhLhorDLirNoJk0-_sCnC5-bI2w6Q>
 <xmx:1voxYc0LXjH3j21YzJCXtoz4QQ7cInCChNpg1ZMO5s7FJHHWZeydzGRD6Pc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Sep 2021 06:37:08 -0400 (EDT)
Date: Fri, 3 Sep 2021 12:37:06 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 01/52] ASoC: dt-bindings: Add WM8978 Binding
Message-ID: <20210903103706.jhyn4ancyfr6bjcy@gilmour>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-2-maxime@cerno.tech>
 <20210901143950.GE5976@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nn7t3ny4bscqmydq"
Content-Disposition: inline
In-Reply-To: <20210901143950.GE5976@sirena.org.uk>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh@kernel.org>, patches@opensource.cirrus.com,
 linux-sunxi@googlegroups.com,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
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


--nn7t3ny4bscqmydq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, Sep 01, 2021 at 03:39:50PM +0100, Mark Brown wrote:
> On Wed, Sep 01, 2021 at 11:18:01AM +0200, Maxime Ripard wrote:
> > Even though we had the wm8978 driver for some time and a number of
> > boards using it already, we never had a binding for it. Let's add it
> > based on what the driver expects and the boards are providing.
>=20
> What's the story with dependencies here?  I don't have a cover letter or
> anything and there seem to be a bunch of tangentially related patches in
> a series here.

There's no dependency, you can pick the ASoC patches safely

Maxime

--nn7t3ny4bscqmydq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYTH60gAKCRDj7w1vZxhR
xUMgAP4qpnWTe63yyrkomVlN9dloDX9xwfM9GEQUIexQad/NFgEAsqbdW/DtCEBr
+apb+G1prVt3kAcIYdWWOnzqrMrKww4=
=a+YU
-----END PGP SIGNATURE-----

--nn7t3ny4bscqmydq--
