Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF33638E654
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 14:10:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6292616A0;
	Mon, 24 May 2021 14:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6292616A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621858229;
	bh=TrAeQ1+Hu7z8acma0Y+agrS27l4spK/NLy2PnnHDRSc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uq0eKBWxWRnjty9Wwfvq8+wR5acFIyifNEZmQE9mTyJy13q9G7XkeXnPxbF5Q4RHf
	 Si+0VV+18gICr5/T6zpFGsdshr6RF+coh4W4/oHqsa5Cm+CCwjKKS+qNs3Yynw9YRh
	 jns3CGYM8/AI6vmLfVpXrVLas2L8GtYj1R/ttqls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9AA7F8022D;
	Mon, 24 May 2021 14:09:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22848F8022B; Mon, 24 May 2021 14:08:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBEBEF80149
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 14:08:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBEBEF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="VY3TRQAG"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jEbiZcEM"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 279FD15FA;
 Mon, 24 May 2021 08:08:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 24 May 2021 08:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=KuYrmIVCiLVbSSTdfz4ZTMoPZUe
 vG5TsxBnT23F3ZtI=; b=VY3TRQAGB0UhY9VLyddLVz+IvpoHtPjcngvTgKLIcEi
 uuQGdI+ldIF0njPwa7GstT9j793TjzmhDvFzCzEdx0mXw4E5ONfI3CvQab9MndbJ
 2j4ZemUAdZBPZ6M4V+Vp2c5fUZZ7ITC3gQalja/LRTi/5QgAdQzos0+er8dL86hx
 IXbTR1i70BBjR3YXzViHjzxFGZQ1/KYn5iGkPoY2ZnvEew7nk1C72YcaOftAzKF5
 7/nfNeYppr/DxeTWgewHJ5a/ddJNcmAA2/HRblqIOgIzpS99HEK/DLyRhT4W1Rc7
 sKAD9lfoE/xmas58MfK3R+yE63n3X32UIbTjg4O2V2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KuYrmI
 VCiLVbSSTdfz4ZTMoPZUevG5TsxBnT23F3ZtI=; b=jEbiZcEM/wdt6YhmQUAb5u
 uFGA+dO8AHnmT04TSkF/5BZIS11Tr7cqaSIuorT/9ynk3bMTk8JS+MuXWFs9Itci
 VoFL0Rtl+nrqoY9OaJKqDVWjSnsD81E77HIfZ9H/7gpC6dLNdD+WwG3fKK6pInmW
 EG3yMurED35jNYa6Z/sWAmKJTKnTQP8YixdkQD6xwYN4wc3rgvXOt3kcKMtdUTcU
 aAyVmNKiPpySK+Jx2Mc/e7ZXSjIjmDnPAgqN+IeB1qb/hObGfelwINQ5gzd0gh7A
 xcZrnZPkug6ACe615JzEFo5WyKswwZ1GzQZ7xbWmvKWZu69upPnKZSQ1x7Em/yoQ
 ==
X-ME-Sender: <xms:S5erYMFXDAp7GelPYNjYPpJ6R9YtvkC_c-gJ9u5MnQOP1UYgYHijQw>
 <xme:S5erYFXf-un_Yv355xrw8xwZKtBCafNs8hGjvtoycWUR2OJh7K1N5tgTuyLXiF9rJ
 UxxMxrqY5Af19vvGZI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejledggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:S5erYGLNM5SH-F3h4MFTEctwD0cBHagL0Vvqrsh_TNZJqd21kYAI8w>
 <xmx:S5erYOHqzzv3wGHrWlTQRJRvsZ0uLIypJOXaIGGYqeQa-ks2C_4WTQ>
 <xmx:S5erYCXsPCbR9eFCO6HEDu3BxZuxLthG5XVHv9j9GSvY3KcuXaGxaw>
 <xmx:TJerYOSFqbod4Zu3njaEggk1J3P3aVbmiV6T9k9qqsgDuIQcclvRCmfP7pk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 24 May 2021 08:08:43 -0400 (EDT)
Date: Mon, 24 May 2021 14:08:41 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 7/7] arm64: dts: allwinner: pinephone: Set audio card
 name
Message-ID: <20210524120841.bj6fohyxrhpp3i2u@gilmour>
References: <20210430035859.3487-1-samuel@sholland.org>
 <20210430035859.3487-8-samuel@sholland.org>
 <20210507080942.lxysxdbrviv3ys7m@gilmour>
 <2c8e512c-59f4-8869-be2e-0bf4c3cc2415@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vdqks5dqd2amw37s"
Content-Disposition: inline
In-Reply-To: <2c8e512c-59f4-8869-be2e-0bf4c3cc2415@sholland.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>, linux-sunxi@lists.linux.dev,
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


--vdqks5dqd2amw37s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 09, 2021 at 08:54:36PM -0500, Samuel Holland wrote:
> On 5/7/21 3:09 AM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Apr 29, 2021 at 10:58:59PM -0500, Samuel Holland wrote:
> >> From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> >>
> >> Add the "PinePhone" name to the sound card: this will make
> >> upstreaming an ALSA UCM config easier as we can use a unique name.
> >>
> >> It also avoids an issue where the default card name is truncated.
> >>
> >> Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> >> [Samuel: Split out change, updated commit message]
> >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> >> ---
> >>  arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b=
/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> >> index 51cbfdc12936..02712f85f6bd 100644
> >> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
g> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> >> @@ -433,6 +433,7 @@ &reg_rtc_ldo {
> >> =20
> >>  &sound {
> >>  	status =3D "okay";
> >> +	simple-audio-card,name =3D "PinePhone";
> >>  	simple-audio-card,aux-devs =3D <&codec_analog>, <&speaker_amp>;
> >>  	simple-audio-card,widgets =3D "Microphone", "Headset Microphone",
> >>  				    "Microphone", "Internal Microphone",
> >=20
> > Isn't that reported to the userspace? I'm not sure we can just change it
> > without breaking it.
>=20
> Yes, this is seen by userspace.
>=20
> Ideally, we would add this property with a unique value when enabling
> audio for any board, but as you mention, it would be a breaking change
> to add those properties now.
>=20
> In practice, all distributions supporting the PinePhone are already
> carrying this patch, because the ALSA setup needed for the PinePhone is
> very different from most other boards. So it would be similarly breaking
> for them (and their users) to drop this patch.

Ack :)

Since no one else complained, I merged this patch too

Thanks!
Maxime

--vdqks5dqd2amw37s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYKuXSQAKCRDj7w1vZxhR
xQeqAQDH3EOIl439YaZCsAopMTIIpwmTqAD047YX53owNIwA8gEAr3PT+rxlJ51k
fqTfXb4QIVbfh/RtIUWCrNx6tU+MGAw=
=V5lB
-----END PGP SIGNATURE-----

--vdqks5dqd2amw37s--
