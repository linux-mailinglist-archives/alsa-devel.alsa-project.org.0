Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2AB81CA7C
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Dec 2023 14:04:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57AF2DEC;
	Fri, 22 Dec 2023 14:04:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57AF2DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703250288;
	bh=P6RchKud5vgMjzbvRjvY3ZB1//7tLLhnXqUKBSc92I0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A3RuezKkFbxeUsAnDeKALydxfBxrfctizWlwyrn8i4l39d3ifasV/qHXLtc65psVd
	 gFY7ezt4CzDHOnkOXlOtPfGrAuyZtySePulbqiN1mQevcnapthR45fDmEk+wi3g6Tm
	 RWJHhEnVuJehj+KOvl5sMCLG0WFPZwcjW/nR7bbk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F1D9F8056F; Fri, 22 Dec 2023 14:04:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85D6DF80563;
	Fri, 22 Dec 2023 14:04:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5110F8016E; Fri, 22 Dec 2023 14:04:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A098F800F5
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 14:04:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A098F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pm5QMgQ4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 155E5CE21B6;
	Fri, 22 Dec 2023 13:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42371C433C8;
	Fri, 22 Dec 2023 13:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703250242;
	bh=P6RchKud5vgMjzbvRjvY3ZB1//7tLLhnXqUKBSc92I0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pm5QMgQ4DLb1krxsWqV35IGAmLhCCz25h2kZ38RlD06CeeuKavLCsKuBniU2q85Fq
	 729zCkjw8x/amd5OacXBI9y8bcqVi+BhXVvJNp5wxzuAfbwetJL2Hfue28eQ4c+fTl
	 3W81bX555/Lq51zVZxD8xs50tUIGCido9PcQY5UGHIPKliwou2l3Y6aBMopPO6OhsI
	 zrg+3lBsUeWxNYErcFskeA7I2AwUlb4ecrONZeV3s//WUuguZrWFXdYP98vYy1tuWj
	 TovdIyInkeiYE8LNXQ81wRn5kF103bz5zu5BRmxhbNAPI5aUYle+Qr5l8/oLrP2xMn
	 mQiwk3W5uSQqQ==
Date: Fri, 22 Dec 2023 13:03:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Walker Chen <walker.chen@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: ASoC: Add Cadence I2S controller for
 StarFive JH8100 SoC
Message-ID: <229ffec0-3a8d-4ce8-a4bb-ef6ece639ad8@sirena.org.uk>
References: <20231221033223.73201-1-xingyu.wu@starfivetech.com>
 <20231221033223.73201-2-xingyu.wu@starfivetech.com>
 <20231221-saddlebag-tricolor-d02a17d66795@spud>
 <f1210b31-25af-4cbd-b73e-2a72aa6c41bf@sirena.org.uk>
 <11c932a8-5596-4186-9c9d-ec8ca5a6ea35@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w+SYfEWNEZ7TqPiO"
Content-Disposition: inline
In-Reply-To: <11c932a8-5596-4186-9c9d-ec8ca5a6ea35@starfivetech.com>
X-Cookie: Familiarity breeds attempt.
Message-ID-Hash: 2HSBLFK42BHSDYDF3V7DMI5NPJLMIHPR
X-Message-ID-Hash: 2HSBLFK42BHSDYDF3V7DMI5NPJLMIHPR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2HSBLFK42BHSDYDF3V7DMI5NPJLMIHPR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--w+SYfEWNEZ7TqPiO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 22, 2023 at 05:55:14PM +0800, Xingyu Wu wrote:

> The Cadence I2S can support 8 channels. But on the JH8100 SoC, two
> instances of this just provide 4 channels to use, one just provides 2
> channels, and the other one can provide 8 channels. Should I use the
> property name of 'jh8100,i2s-max-channels' instead for some special
> instances on the JH8100 SoC?

No, your current name is fine if the binding is generic for all Cadence
users.  I do think it would be good to have a separate compatible for
these two channel instances, if there's been one customisation there may
well have been others.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--w+SYfEWNEZ7TqPiO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWFiTsACgkQJNaLcl1U
h9At3gf9HMiV97V67JGVkqTyZ1zrmOry8r0gKK8wtSM1JZMTyh+tLXWfvH3z5QF+
7R4AzB7A+oYf8tMW7lTlkWL2SFXaWHXL57EgRuWJ72f9/pSQeOVsCdyPb/SlTDho
DXCYHa/88/UPXJeQmvV7spyAvPbMcgid6rThjtPUXPhIH1TzhuwOTDf4jbBRScwe
bpwsDzd4Tp31yJSGHJ+fmCWfCY5aMBg32/4a9PUmkgLtFzNXbs2T4d4nz3TQxIQW
yGSB0T5OfmrTi/l8UZX0OicD4M5P6EF6YPSq/t1tz/h3n7Dr44zdeI6eOrbIv3BR
7ini0mK6YD9+oBUCxvPHtKrUS0fHCA==
=sDbc
-----END PGP SIGNATURE-----

--w+SYfEWNEZ7TqPiO--
