Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 361003B19A4
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 14:14:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD0BB1663;
	Wed, 23 Jun 2021 14:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD0BB1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624450491;
	bh=bvlEN71gEJw8dTddmdc2q2Vwa/foT2HV1h2HUMGGpWk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jrU1feWke7LCou4LSPu1zzl4QAl6MxcmvXSS5ykkSebVbvfTq6dvjY7aHaV/KRLRc
	 iLOG69cnw5EFrHwrTgI1FeQ4PEavZpJUoj4gZZ1aRi2ISmZD5fvERoQoo8f7E5q3dy
	 Uhq01w0psdoA12Iv4WDQ5W+LyE2ILV0CknLp+Xco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 039B7F80137;
	Wed, 23 Jun 2021 14:13:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C147F8016D; Wed, 23 Jun 2021 14:13:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20F3CF80137
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 14:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20F3CF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="QYV3LZdL"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jHJeARFs"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 53CB05805EC;
 Wed, 23 Jun 2021 08:13:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 23 Jun 2021 08:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=bvlEN71gEJw8dTddmdc2q2Vwa/f
 oT2HV1h2HUMGGpWk=; b=QYV3LZdLpqmkM4L4+cnqSa9HU9oU+rMprHSsb/GpRe9
 GWY52E7PipkKUevdhlO+ajgvcc3aj0gLNpPLP+UjaGmBv4A28YWKy+1jWG2pOHe6
 SDBQOVDw+l6ZA82FeCqFPJ3u/4XxxsbwHBCRTYM5hrF46sz1F7uLhshZmbiK8bnQ
 hpaPiZYKnIpvd1Le0A15a6GRd6HPPloI9UEMkzWK7QFnkH2pGGPFAq7rKgIEUGFZ
 XEEAHECCcQBU8WymCYPRZ+BK2E1gd7VA535ODx4izTEbsVhvWgfok93dbS1vDSzj
 1bBbZK2GmiOZga74UEFtgvcO7FxmdlYCDRuGc1baUhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bvlEN7
 1gEJw8dTddmdc2q2Vwa/foT2HV1h2HUMGGpWk=; b=jHJeARFsGYkV+1k41dYd+p
 6uJzJBWNE4MSFYijIqiOo00ZPHFYzJWOc61a9Yc4kQWeLAQxlJW5WHk5RT64ajet
 QFXddb2XshDyU18V6QWl8R7TwpY0j3u2UbjpRov+SlxxUyww62RXsUGAbDjB34p7
 5GZDUWEf6zEQ1b5NVm7phrJIODeKzT88VXxqNlzwaxORcJHAPmIjVRxPNxODRr9W
 30DFG2I1Kg8xrNtGmttYIhhof/5kYRVGItSRl0nr0rrMEUTxGVTVYjLPZRCBgV8Y
 i8SjgqtqGDImToat70xcPZvsUvJUU3F+70xnrTo7j/s56EbdwRpiqXAWwtPOmOiQ
 ==
X-ME-Sender: <xms:WCXTYGUK8xceoJrOxy2UUQELe-vEVQAbyxc_dv_f83XITRI6TkIZdA>
 <xme:WCXTYClH5AAS0C0ZHLHb9WwanAZZEb7wOBxhQxoQ7OvWpuZYYGKVLpjXZU_ONHNMV
 QgogFtMI7Q-qa7wdAM>
X-ME-Received: <xmr:WCXTYKZ6TZjLlypY3q-xGLUlerQc5WZaOoMc3V2CwquMjq2Qydr-eV3bdJdI_cNwY7TMj_RN64Qxbqoj5KhKCOhBT2gMjs1Rk8qG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegfedghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WCXTYNXIGb-bFSIrhvw-sjJ6GagaRged1569H6I9Tl7EgBswtCtLvg>
 <xmx:WCXTYAmlCZ8X-KS48Y-6CAg-g7OH88Db6db7OqPDE7PPfO0zGA2sGg>
 <xmx:WCXTYCf3k9TpbenJgrE388JwyVpL123O1fj4qUTuYue-rLrINppWwA>
 <xmx:WiXTYNjItrZulxglOXXEKAnrELpJgs_SyR0F0mLHVMAJoRNq-y5bpQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Jun 2021 08:13:12 -0400 (EDT)
Date: Wed, 23 Jun 2021 14:13:11 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [GIT PULL] HDMI codec improvements, v2
Message-ID: <20210623121311.qlbnije5gn7o7so7@gilmour>
References: <20210610122550.jnriewchqspdcrwk@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ttfcqn3oaqjqblfs"
Content-Disposition: inline
In-Reply-To: <20210610122550.jnriewchqspdcrwk@gilmour>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
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


--ttfcqn3oaqjqblfs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 10, 2021 at 02:25:50PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> Here's a PR for the changes to hdmi-codec that need to be shared between
> drm-misc-next and ASoC.
>=20
> This is the second iteration, fixing a bisection issue with compilation
>=20
> Thanks!
> Maxime

Merged into drm-misc-next

Maxime

--ttfcqn3oaqjqblfs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYNMlVwAKCRDj7w1vZxhR
xX3xAQDxAGQmBeNhyLP7BR6FrulVySLHaiWkeiGlePaRir2uugD+NyFXqQyaAFJX
OHqA+RuGw5JNpbnPtgsQYEU3Aj+Efwk=
=homM
-----END PGP SIGNATURE-----

--ttfcqn3oaqjqblfs--
