Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0900940FA9
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 12:41:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BE0914E0;
	Tue, 30 Jul 2024 12:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BE0914E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722336084;
	bh=qu2Pv08OrvKfaJH5pTaBnMemTX9a+jS+z+H+/i7Jqjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U/I3bKYyMz/kmxddV/y3NmpR0sDtlTfdaz4GfYNRP/ADBgFd4XTwuMPG0H6r/Rdoa
	 lxdYivQZRUx3XpFmeba3nX+NEmUPD0t+CPeotYqYGSYd0vFbyDt0nWeZ6IC8k8+7Lk
	 hmvT7WPieVu6XFvPgus0X4emOjzxUwlVLXnkNqFo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F636F805D4; Tue, 30 Jul 2024 12:40:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44924F805D8;
	Tue, 30 Jul 2024 12:40:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6F87F802DB; Tue, 30 Jul 2024 12:35:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30EDDF8007E
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 12:35:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30EDDF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kS5KfIM9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9FC1261E7B;
	Tue, 30 Jul 2024 10:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30199C4AF09;
	Tue, 30 Jul 2024 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722335742;
	bh=qu2Pv08OrvKfaJH5pTaBnMemTX9a+jS+z+H+/i7Jqjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kS5KfIM91AFndH8uSyBHWVcJBgKpUSq1m2v9SK/lS9nranqql+fX7fySfhDzTepRp
	 0o4Btxlh7n18zvBrlG8w1tYy422Zlh1JmFk2Fj/z1Qb/cWKuzPdsz22eXHUsZKS8VH
	 gI8H2fUoUpg6LACblBYlQct8HEh7xpiS9OWiXcgcHAMZ+H+7Fci/eavvPxkCA7SVv8
	 BwFlm4PJKRj9MlRw89b0Zfc6JkKqE1FpCuJIaS5l4Sjj+gCV9XAMrJ9XVgPGNJor03
	 uw9M0Q6teETOkytUioyg4A3Wc40xIqhwNXogAjBN/czj/8obNh59yNMG4LEFXfsQ2D
	 zRDoCaIsdrpNA==
Date: Tue, 30 Jul 2024 11:35:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Adam Skladowski <a39.skl@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,apq8016-sbc-sndcard: move to
 separate binding
Message-ID: <d7067720-5524-4f8d-82fa-b2636be79676@sirena.org.uk>
References: <20240723083300.35605-1-krzysztof.kozlowski@linaro.org>
 <ZqVXUI37fNB5D0DM@gerhold.net>
 <3d9f76c1-2e14-43dc-b438-5fac94ffc73e@kernel.org>
 <ZqjAzgoKo-5vaCtK@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S6y8uV4MuB6RROEa"
Content-Disposition: inline
In-Reply-To: <ZqjAzgoKo-5vaCtK@linaro.org>
X-Cookie: Don't SANFORIZE me!!
Message-ID-Hash: 2U7O66CPUHTKDF5JKAW7SKNB5N3ZUNU4
X-Message-ID-Hash: 2U7O66CPUHTKDF5JKAW7SKNB5N3ZUNU4
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2U7O66CPUHTKDF5JKAW7SKNB5N3ZUNU4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--S6y8uV4MuB6RROEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2024 at 12:30:38PM +0200, Stephan Gerhold wrote:
> On Sun, Jul 28, 2024 at 12:30:12PM +0200, Krzysztof Kozlowski wrote:

> > This was added to the common driver code but it does not mean it is
> > reasonable binding. I don't understand why for example we even accept
> > here aux-devs, instead of putting them into one of DAI links.

> The auxiliary devices (typically analog audio components) are not
> necessarily related to one particular digital audio interface link. It
> is typically the case (e.g. an analog speaker amplifier connected in
> parallel to the headphone output of one of the codecs), but I don't
> think we can assume that as a general rule. There are often multiple DAI
> links that go to one codec and then it might be tricky to decide which
> of the DAI links the aux-dev belongs to.

Right, aux devices may cover more than one DAI link (eg, if there's a
CODEC that can do mixing and they're connected to an analog output) or
may in rare cases not fit with one at all (there's use cases where you
have a sound card that has no DAIs and is all analog bypass).

> > The pin-switches and widgets could be used, but are they? The only valid
> > argument to keep them is that you added them to common driver code.

> These go hand in hand with the aux-devs property. If you have multiple
> analog audio components connected to a codec output (e.g. an analog
> speaker amplifier connected to the codec headphone output) then the
> pin-switches/widgets describe that the output paths (speaker and
> headphones) should be separately controllable.

Plus the above cases where you don't have a direct mapping with aux devs
and DAIs also apply to pin switches since they're in the analog domain.

--S6y8uV4MuB6RROEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaowfcACgkQJNaLcl1U
h9DMeQf+JjZ3Zel23S9ESTi6xAdBKDTMAIMzoNtWk1WtyW5Ckxp1zdhqAqsxcSbF
JUO9AtiCUxts+cG6rulPJunQzZGzVAxN916GHlwd+eeQH3YJCcIZ/Pc/iaMmNKUr
4qR4I+hNFITFB8NmL2PAImPBiHIhc838R7zu3Nuf4vmbKqpMArc0VFRMNURTYswf
qFyxJ+PMHilhp2rNtvonTwRNAUu5POT11PblCLkqLM/t2lfLiaUbBW3lLCruTi3G
XeYGSUzSWTxT1zr7uNuw47iE+eVfCMegJ7OVK9TZ1Be/4buOeYIEP7h84YYZ+pv7
6KMc/28yL1Y8dgAis4b2Kz/uhp1XSQ==
=/e6J
-----END PGP SIGNATURE-----

--S6y8uV4MuB6RROEa--
