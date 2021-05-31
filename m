Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBA2395855
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 11:44:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 518CC850;
	Mon, 31 May 2021 11:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 518CC850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622454240;
	bh=WnQrnLtWZNnyNpO3acQJhJ/bTb/zVNlgSLckx9ud/3k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kqtYdJoZXuEa5SmtDhixuWc4KO72NfnPOFdeOCdSkvbFTjLF75hSmNIs4/jB/9Wgq
	 NUCO0kgIgi6fSMTVbJncxbFyKMoLtxhh588brBPjbSRcUvBNNHnxO0xJqFvL5YA1fD
	 dYD9lMmzP8U0voK0evzfYMXUSe5VFa9NyYM4oT6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDA6BF80273;
	Mon, 31 May 2021 11:42:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 299C6F802E2; Mon, 31 May 2021 11:42:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD8F8F80253
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 11:42:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD8F8F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="IiNPuoSF"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="EP97E+O8"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7AFD3580487;
 Mon, 31 May 2021 05:42:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 31 May 2021 05:42:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=WnQrnLtWZNnyNpO3acQJhJ/bTb/
 zVNlgSLckx9ud/3k=; b=IiNPuoSFaFJ+FLfnMfuu0aEao+0+SQJzPnBdOtZHIwx
 OI5D+UwzLtd7hRao0VOX+54M25thB09hjMV3+TBAFXsF6VqvVBnfc8JbwLsA88uX
 wptoS5MESiCC0w0oyKK43dHB2JMlOgHiCHLqarkclDNVfkGv6Q70Yxuft6uYFDh+
 Xu6WsFskOaVtqg3tYsUAABsHnt0YqgcH10pu/NZvyrPFS0vchctcJ0Ljv9UPJfVL
 Xn/t1MFPoKG3M2qcBJtnjFf0yuOS8HJAa2y2Vf8cv7xPGdXS+6VOhtbCdLtE2Dyz
 Ve1q0L1SMNkMKWpbuFF9FY9yM0Ppq5a8OS8XAoAeR6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WnQrnL
 tWZNnyNpO3acQJhJ/bTb/zVNlgSLckx9ud/3k=; b=EP97E+O8VhXdqGz4Fz+hhl
 kSawOnEOwyehJuxeeevB9mTvHubWVIbysLBVCUsn+Z//mZWJccffGjitbW2fAu1w
 zyJDGQsGivdz0IJ5c51wzy/6HXReypofgir1cYHIDE2vwm9kBSM+QQZg6ZUJ4wgt
 cUWt8Zd7p8TUXgVJn8RbMPWtS4Us9vAuSdpg5VzgP2RyHoVV0iaG4KFMW1kwJkAZ
 dR3N+qurzBW3MLGKVhS9KjbBlifyX0Pyw22aLvfSlWLdsalKyf4gRc8Oru/+ncL0
 e+oGa8P8gnM33JpZHSzWU0wE0mayEBnwdzEoBDdufwn8wU3a4cdwCQoR7amFJNMQ
 ==
X-ME-Sender: <xms:eK-0YENy5kYVKheJHzJSf9GxHJTXE5_iJwRRVu8JQYMU8nJSegoGhQ>
 <xme:eK-0YK_0gPKAdMHAyo2IF2xWG7LSYjPKBmEkbJFNj4VXdSmHgtOL3N3QOyqPYP7eD
 DZVXEB52P2xN21uCtw>
X-ME-Received: <xmr:eK-0YLTAcWdlQVlkfRq_UXtw6KguUqAJj5-prtf6314yvxhpcYnnWEzEa89_h32ikJjWloqg8-xv3DrOLTYgWT_JuO3JpNykUl7e>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelfedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:eK-0YMswZEFbzrn78ajFD2lv6xQMq_J9bLnQk8FCdRIU8cC9oqBKyQ>
 <xmx:eK-0YMfs5hyrB_cMPTjQY60dtY89rf2NN3SVtCL0WL3yHjOoj6GXfA>
 <xmx:eK-0YA03aCFobWxbDcheaY-7ptLK8O9UVrDASHW6Yz_Cju3YwXBIlA>
 <xmx:eq-0YNsM67k5Toi9bS0UE-ngDjUqfh6lXn_l9q-x15hBffqEAGEMLA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 May 2021 05:42:15 -0400 (EDT)
Date: Mon, 31 May 2021 11:42:13 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 05/12] ASoC: hdmi-codec: Add a prepare hook
Message-ID: <20210531094213.kuuunk7ytu3q6sq6@gilmour>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-6-maxime@cerno.tech>
 <YK4lWaB6Lx+SPjpF@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="epjegrbj6kpv446q"
Content-Disposition: inline
In-Reply-To: <YK4lWaB6Lx+SPjpF@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, Tim Gover <tim.gover@raspberrypi.com>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Anholt <eric@anholt.net>, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Dom Cobley <dom@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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


--epjegrbj6kpv446q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark, Takashi,

On Wed, May 26, 2021 at 11:39:21AM +0100, Mark Brown wrote:
> On Tue, May 25, 2021 at 03:23:47PM +0200, Maxime Ripard wrote:
> > The IEC958 status bit is usually set by the userspace after hw_params
> > has been called, so in order to use whatever is set by the userspace, we
> > need to implement the prepare hook. Let's add it to the hdmi_codec_ops,
> > and mandate that either prepare or hw_params is implemented.
>=20
> Acked-by: Mark Brown <broonie@kernel.org>

It looks like you're both happy with the ALSA/ASoC side, how do you want
to get this merged?

There's a build dependency between the DRM bits and the new hook
introduced in hdmi-codec, would you be ok with merging it through the
drm tree?

Maxime

--epjegrbj6kpv446q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYLSvdQAKCRDj7w1vZxhR
xWXFAQDysUxOnMmdBoxWo7OqzkjGIwVcF9ekclQWjJWOn1GNgwD/ZCJRk/ix3+v+
3HrGEoP5DWXcawng2o1uOjuTho/i5wE=
=7cDo
-----END PGP SIGNATURE-----

--epjegrbj6kpv446q--
