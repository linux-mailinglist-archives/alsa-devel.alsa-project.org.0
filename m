Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D18C8720098
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 13:45:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E199820C;
	Fri,  2 Jun 2023 13:44:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E199820C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685706321;
	bh=qyj2TnFG9Q0Dqv/yetg95LBFYsBmGWLoH4r/LKwHNFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cEFPurmNLdC6nPS9+pufu3oY3QrrAw/FaR/KOtIUcm1bTxvM8ZLyHsy+cxV5I9KcR
	 dKHET6T17nGRsymzETiHfXGILlA1V+vMoDffr9saKyuG2f1EZeqNhBuu465/egd34c
	 i0BD3ieYSwb4DPdKYsH8Y1TThI3kUUXNSOv1X0Mw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB3BAF80494; Fri,  2 Jun 2023 13:44:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ED4EF800C1;
	Fri,  2 Jun 2023 13:44:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AAF9F80149; Fri,  2 Jun 2023 13:44:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D20A3F800ED
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 13:43:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D20A3F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kAlxMoP/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD10064F20;
	Fri,  2 Jun 2023 11:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC21C433D2;
	Fri,  2 Jun 2023 11:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685706237;
	bh=qyj2TnFG9Q0Dqv/yetg95LBFYsBmGWLoH4r/LKwHNFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kAlxMoP/qBc0mYGcWpYHeVsa9+r7EDw01E7qngnPnA87Tv0sbunfoocMmS0lWr0IO
	 xzTgsYDl/xjWuRMFdC/paiH3tQuz2xNEamizJmn5Jg5X97Q+xh3JBOKOEa3DbOQWlI
	 R0gUicxEfXmC9PEeI2Mrz23WWJ6luwzf3Wv+d8OXgwN3Y9pLhE/6dLm4WoQJTWz8i1
	 bb/ziz/uyfqIMztFJDty5LMV3rIVyt3iMADd2W9+TEfyE49g+MutpJ+WdcCviVuliE
	 tPGj795nypFMC5LsLLRXBEkMTkScWCtGx0AdLzjBpsIWn7Qr4IiqHjY7WNRgW9EX9c
	 +ivng4bHzEtIw==
Date: Fri, 2 Jun 2023 12:43:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: document new symmetric-clock-role
 flag
Message-ID: <3fe93662-82b0-4834-b6c3-473669c66210@sirena.org.uk>
References: <20230602090322.1876359-1-alvin@pqrs.dk>
 <20230602090322.1876359-2-alvin@pqrs.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yljCHQatclI9IIDH"
Content-Disposition: inline
In-Reply-To: <20230602090322.1876359-2-alvin@pqrs.dk>
X-Cookie: War is an equal opportunity destroyer.
Message-ID-Hash: W2SRAGKJTTSDVESUPFKY4J65ELA7DFTA
X-Message-ID-Hash: W2SRAGKJTTSDVESUPFKY4J65ELA7DFTA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W2SRAGKJTTSDVESUPFKY4J65ELA7DFTA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--yljCHQatclI9IIDH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2023 at 11:03:18AM +0200, Alvin =C5=A0ipraga wrote:
> From: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
>=20
> The new flag specifies that both ends of the dai-link have the same
> clock consumer/provider role. This should be used to describe hardware
> where e.g. the CPU and codec both receive their bit- and frame-clocks
> from an external source.

Why would we have a property for this and not just describe whatever the
actual clocking arrangement is?

--yljCHQatclI9IIDH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR51fYACgkQJNaLcl1U
h9BNRAf/dP2YV4uOYvx3LXMZqRrfypjgfWwbbFEufSIelAq8lZS5puJ+MvumnDqL
XR89aM7F6DDztwC4eCpUETQ1JsAz5EHnoaLe+uxnG5c2wV+AOXi2SVoXLtA+S6lX
3IGObHfe4FnxwvIX2N0wZX0XH20MEpJhJCO71zo+t9dOZo7OykvYEQA+4kkBcePa
7zx9TAhm0VkpEUY3RkT4uymkkyIczcaDkaF2HTNDIG0DEtrw02lXVYi1WmhiY5Ah
C4IlcYDVqwVpAQGboONnZoF8+9IFeZRynit9kSNKajMK9EVz1T+NmXQzUYD/UxfY
sOiGK2eIY2eai/KegHSKFnIOBmOw7w==
=htpo
-----END PGP SIGNATURE-----

--yljCHQatclI9IIDH--
