Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F222F782B31
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 16:10:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54490827;
	Mon, 21 Aug 2023 16:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54490827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692627048;
	bh=Cr7450NcU+poqsVMP6DJMTkqMYUeVml3N8Z7plQPus4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pck/MnlaXfDHvsJR0exnwj9Fd/O3fduzeQCQ8v5PRjCrXod0WlTWMrWtDkiSpkXXo
	 TT6L5MmT28jTJSPCn6Mgdwb5v4MooOABg7g+35smyFDjIR4tI32KaIL/kQbaLXG7W1
	 RG92hRRAY/dGUcBRaSh6b/kqYB5fHs6fZOd+oF98=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2A20F8014C; Mon, 21 Aug 2023 16:09:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F4C9F8016C;
	Mon, 21 Aug 2023 16:09:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60B8DF80199; Mon, 21 Aug 2023 16:09:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6B3CF800F8
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 16:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6B3CF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LrJ2/tT6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A4476386D;
	Mon, 21 Aug 2023 14:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190A0C433C7;
	Mon, 21 Aug 2023 14:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692626990;
	bh=Cr7450NcU+poqsVMP6DJMTkqMYUeVml3N8Z7plQPus4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LrJ2/tT6o+w9nQWLvVzxTUpuOSLWrCHaPG0N4DDyHsjqtvJnm3MQGaAta5PULhsEm
	 F59UR7e8va114+bU7R1V8rWby/L3X10wn6XeQsEtljTFtTjINQfucnXeYS1Roc/sj5
	 bBbyUw4QuWAd5rKHTLVx/ML0+ntNVQPaT9ARYqasfMAZfMpkIQsnySKbSYhD55sWaZ
	 xlDn8YsCHoUQLlAcgBw7gFHeIZ8B6tRXcdPm7/MWH5lCWo0Ii2WXmjFH/gS6H2v0Dj
	 NaxyPAjznq6E7Rnxe+t8oJ0JF+VgH28gd//2vWluX6mFKNleJtfqALGONFGkkQGKxp
	 ruxsLcwb4XE3Q==
Date: Mon, 21 Aug 2023 15:09:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Marian Postevca <posteuca@mutex.one>
Cc: =?utf-8?B?5rKI5LiA6LaF?= <zhuning0077@gmail.com>,
	yangxiaohua <yangxiaohua@everest-semi.com>,
	Zhu Ning <zhuning@everest-semi.com>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables
 sound for systems with a ES8336 codec
Message-ID: <9432532a-efed-42bf-8f58-f1dd898ccf61@sirena.org.uk>
References: <ZBr9rJn50ovG1w9W@sirena.org.uk>
 <87ttycjyw3.fsf@mutex.one>
 <ZBty1CdPaWm0IcRi@sirena.org.uk>
 <87r0t9uc08.fsf@mutex.one>
 <ZCRCqJ7oG6oefo9g@sirena.org.uk>
 <87zg2pxtog.fsf@mutex.one>
 <d2be9183-87fd-4cc4-a239-9401b5b88364@sirena.org.uk>
 <87o7j5b9bd.fsf@mutex.one>
 <8cddbe1c-20d7-4b8f-ba02-f86bbb5a54c5@sirena.org.uk>
 <878ra683ej.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y9KCLMLORcJiQMW9"
Content-Disposition: inline
In-Reply-To: <878ra683ej.fsf@mutex.one>
X-Cookie: Do not write below this line.
Message-ID-Hash: GTWGWVSBK5MD6FUZV3DEXAGRUBS6LKTQ
X-Message-ID-Hash: GTWGWVSBK5MD6FUZV3DEXAGRUBS6LKTQ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GTWGWVSBK5MD6FUZV3DEXAGRUBS6LKTQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Y9KCLMLORcJiQMW9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 20, 2023 at 12:32:52PM +0300, Marian Postevca wrote:
> Mark Brown <broonie@kernel.org> writes:

> > You'd need to pull the relevant supplies out of DAPM and handle them in
> > the CODEC suspend/resume callback.

> Can you please suggest an approach that would be acceptable to you?
> In the original patch series I sent, you didn't agree to the approach
> to disable the jack detection in the machine driver suspend callback

Put it in the machine driver.

--Y9KCLMLORcJiQMW9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTjcCgACgkQJNaLcl1U
h9DIbgf/ePAP6mIHmngqcNGJ9WWvAls9RCxkXUYoDJC36pZKS8DtrisjdsyaIyZn
MWnzzkYz8M/YFjStIwrnRxEDnB/RtyxSvL+5iBkke6gKFwO/T4LJDT8zpvYI2nCk
AyFwKgwjhgQje/odaGEqzXtONe4ilRwubSNJUfoNr7anCKyMwvAbecAf2sRjghFm
CPr1LicS/GHMQIHX9v2wE5glJKZLEvZbO5Z/BmffClM76mcnJqZPhz338isptuv4
fSpqzWFENQdnUlVOxX2YZY1uuZPp+OIzh8jGXYMxD3wm8flRl/1Z/dijz3hOt6n9
aaC5hA+XJp71zrElrnaLbagQ/VXXVA==
=mjl2
-----END PGP SIGNATURE-----

--Y9KCLMLORcJiQMW9--
