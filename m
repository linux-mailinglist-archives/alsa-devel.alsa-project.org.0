Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F319D38FDC2
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 11:25:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5062B172C;
	Tue, 25 May 2021 11:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5062B172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621934743;
	bh=qhdCG6Qg5hhTfUV1qjjJLTSxYnhgWog/DLM8gX+Rusw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TVEdROVvKOv2UVFrJ8PZqLb77eOuZIq/EcbfmhFkprZ6kbFq2HQ7todiRDXDPlskW
	 n6birRVegRVsGax8gYYxyjZ4F2q9MANm7BYFF26s5R/vNQJsoP9es2Z9ZlAmhLLmMG
	 oqhPhgvuFBdYxxXddg5qzsewuyce7v1HUT/tpz9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC66DF80137;
	Tue, 25 May 2021 11:24:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C8F2F801EB; Tue, 25 May 2021 11:24:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA267F80137
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 11:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA267F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="kQDf+JuM"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Mklc8vs2"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id CD5F4146D;
 Tue, 25 May 2021 05:23:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 25 May 2021 05:23:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=qhdCG6Qg5hhTfUV1qjjJLTSxYnh
 gWog/DLM8gX+Rusw=; b=kQDf+JuM1XOO7yWY/YL1k0CL6e3A113Z8bh5JDuafz+
 z94tfBfnQQg27AIRT06Rsgw04DasL3N7qVNihNOHmNB/G2naEPIbd3IF7gkHRQyB
 GEOBjUVfRWivgP1xck9qrC1uNcmBo9yo8Un68paBoq041Vx/GXXHQ/6YK4FXF+Qd
 TVTm+VbQFLJ8GIMReDS8wl1NP8vQ+0iSQDxM374HcGzl3FLB/rs5aDvlKyG/LRMD
 VioNeGIx+W6JPj7NnkxKevxhJ+A3aLUYm4kgdU3J6VCIzMK3HPlyAO7x7D9SqTyF
 CaPBvmn9ZdA6U1s50PSQ9L3LCpChe/bJZlqHAEE+fug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qhdCG6
 Qg5hhTfUV1qjjJLTSxYnhgWog/DLM8gX+Rusw=; b=Mklc8vs2/D9YTg3aQo2JtP
 t1TF8RrAeXK7XLX2eSBz97ykXhYUVrOxgzC9LOclpg2Uzteh66i6r5sfPqWjqCkm
 toZtkPuHZjeSPpOC2TdW4M2tN7B3MgLT2N4A+kxDBYt1+3lR7Gc6r5fU2sywDv/g
 1Mn4ZMttFyaHlRZY73A/wa7VE1odVJ3oV97BlAZnk3dh73SH/HNwoNFChwYNYska
 UxNm6UTU8HInw0Hyii5M9vRPMrv1I8PdYpj108UpqfUgIoAgBRm9qxLELzxPRCCk
 0DiVLKYtuI0vX69CIkZ2AumhAjQuERrORIGaf48N5Mppfj5/GkweCvxHRhhNmEBw
 ==
X-ME-Sender: <xms:KsKsYLdnP2618sd6zawCSXHzcX4_-iddEzx-a9ZGhUJT-T8BXksu2Q>
 <xme:KsKsYBOv137-AxhPN7UQOyCS3Vs5OTGg3xC2kbq5T2sc3PjxwfhWs34-jruzrfHcI
 ImRi_SGooe4rB41IRE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KsKsYEj1BKBHEYxHgdXquEgl9aODqOdbjh81TC1TUIoIW1fz3qZ83Q>
 <xmx:KsKsYM-Lvmk5qwORpR_7TxuKVFsUgAiFezeESRtA3kTmDRpOXmzWaw>
 <xmx:KsKsYHtF1dgQHFCO7z2LcUUFfWYHrxXzK_UMXQbLCW-aP837jwl8UA>
 <xmx:LMKsYMWVbhzXzkPmZC0FkNMnr7FA9uoPQal5hT7tFwKc-vh_jYejiGByJRk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 05:23:54 -0400 (EDT)
Date: Tue, 25 May 2021 11:23:53 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 00/11] drm/vc4: hdmi: Enable Channel Mapping, IEC958, HBR
 Passthrough using hdmi-codec
Message-ID: <20210525092353.mvqdv4bi4i4rkqsu@gilmour>
References: <20210507140334.204865-1-maxime@cerno.tech>
 <20210524133904.kgkh6xd3m5c2j3xa@gilmour>
 <s5hzgwjcit9.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="edyfacc36enjbeyb"
Content-Disposition: inline
In-Reply-To: <s5hzgwjcit9.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Tim Gover <tim.gover@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Takashi Iwai <tiwai@suse.com>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Dom Cobley <dom@raspberrypi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
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


--edyfacc36enjbeyb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

On Tue, May 25, 2021 at 10:35:14AM +0200, Takashi Iwai wrote:
> On Mon, 24 May 2021 15:39:04 +0200,
> Maxime Ripard wrote:
> >=20
> > Hi,
> >=20
> > On Fri, May 07, 2021 at 04:03:23PM +0200, Maxime Ripard wrote:
> > > Hi,
> > >=20
> > > hdmi-codec allows to have a lot of HDMI-audio related infrastructure =
in place,
> > > it's missing a few controls to be able to provide HBR passthrough. Th=
is series
> > > adds more infrastructure for the drivers, and leverages it in the vc4=
 HDMI
> > > controller driver.
> > >=20
> > > One thing that felt a bit weird is that even though
> > > https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-al=
sa-driver.html#iec958-s-pdif
> > > mentions that the iec958 mask control should be a mixer control and t=
he
> > > default control should be a PCM one, it feels a bit weird to have two=
 different
> > > control type for two controls so similar, and other drivers are pretty
> > > inconsistent with this. Should we update the documentation?
> >=20
> > Any comments on this series?
>=20
> A patch for updating the documentation is welcome.
> Currently, as de facto standard, we allow both MIXER and PCM ifaces
> for all IEC958-related controls, and it's unlikely that we would
> change that in future.

Ok, I'll write a patch for the documentation make it clearer then :)

Do we want to make sure that all the iec958 controls are on the same
iface, or is it also left to the driver (or should we just leave the
existing drivers as is but encourage a consistent use in the future)?

Maxime

--edyfacc36enjbeyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYKzCKAAKCRDj7w1vZxhR
xT6GAQCmK74YyTmGnQSUD3qsdks6qIaoPcyMDO73ebQeXm4xZwEAzb0RQ+6uvdWf
9lgi7PPwMH7RXPFAdijTOOtf4OHrLAU=
=kqaK
-----END PGP SIGNATURE-----

--edyfacc36enjbeyb--
