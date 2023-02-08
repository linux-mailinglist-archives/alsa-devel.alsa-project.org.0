Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E47868F077
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 15:13:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EEB0828;
	Wed,  8 Feb 2023 15:12:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EEB0828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675865600;
	bh=CM9X2AuKUJbsYimacCNPKUAK4TpbgQFBIKIrx7h4lJw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M4Rm/DWHKLZ5oV/+uQqECPvYiYLOuVDE/ix6do+Vv6t6vNi6qa7axgkt0BmRjmJ5t
	 wGSIilXkkTkxAOF/1Bz7R/Zv61pXWxL1XWdXTtmG4nxq6AklV7+gN2v1qk5R2W2I3E
	 6txpdAH9A/3+BiaH0dTGQac/5Ev+955gk3yGGkd0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2725F8012B;
	Wed,  8 Feb 2023 15:12:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A96CF80152; Wed,  8 Feb 2023 15:12:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4A16F800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 15:12:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4A16F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LVucjxu+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 75F1061554;
	Wed,  8 Feb 2023 14:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EF7C4339C;
	Wed,  8 Feb 2023 14:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675865539;
	bh=CM9X2AuKUJbsYimacCNPKUAK4TpbgQFBIKIrx7h4lJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LVucjxu+REx2vxJaU73V9LeqN0VfNlpVqOVjlgapAR7+Js6CJh2wUlBGjryat06Mx
	 D9i30JRbIJdOspvFUtAoFUTSjc7q9zKrJAeQbeBiwFIiiX8euIEbk0Ty1Tz6V657+T
	 FLA5gRRVsKUOtlkaWGYAvOyX2NIaQlgKRJiFZbCRwtUw7qjRf/eGTg/jPYZv/0q1tt
	 FcUOC2BCeTia4s8YYIZRIs5mKBJvajFbiu7xD8C4mv+0OOcBl6e5vyuvgWOBBh+MUZ
	 xz5q4YEAPB/J4RrPpxV69F8ll/mVwhh9Od/sV4/BiL8f+TOBF8F2/I8j5Fv6bLISdE
	 LVYCGEEzxvGgw==
Date: Wed, 8 Feb 2023 15:12:16 +0100
From: Wolfram Sang <wsa@kernel.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: remove arch/sh
Message-ID: <Y+OtwCqt26UjCwkZ@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christoph Hellwig <hch@lst.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sh@vger.kernel.org
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de>
 <60ed320c8f5286e8dbbf71be29b760339fd25069.camel@physik.fu-berlin.de>
 <0e26bf17-864e-eb22-0d07-5b91af4fde92@infradead.org>
 <f6317e9073362b13b10df57de23e63945becea32.camel@physik.fu-berlin.de>
 <CAAhV-H57bV855SMr6iBqoQzdak5QSnaRLjQ9oAbOtYZnik5SoQ@mail.gmail.com>
 <91be7f6b52d8ed74798e86270d59bc5cddefe130.camel@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H/y3lZ2MEalioY2m"
Content-Disposition: inline
In-Reply-To: 
 <91be7f6b52d8ed74798e86270d59bc5cddefe130.camel@physik.fu-berlin.de>
Message-ID-Hash: T7BHTBZN5HCAFHAYT4DPBSQHVHY3HK57
X-Message-ID-Hash: T7BHTBZN5HCAFHAYT4DPBSQHVHY3HK57
X-MailFrom: wsa@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Huacai Chen <chenhuacai@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Christoph Hellwig <hch@lst.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arch@vger.kernel.org, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sh@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T7BHTBZN5HCAFHAYT4DPBSQHVHY3HK57/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--H/y3lZ2MEalioY2m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Yes, that's the plan. We're collecting the various patches people have se=
nt
> in for arch/sh, review and test them and apply them.
>=20
> My test board is running the latest kernel now, so I can test new patches=
, too.

I am just witnessing this development, but I want to say thanks for your
effort and congrats on your progress. Looks like you do the right things
correctly, cool! Kudos also to Geert and others for their assistance.


--H/y3lZ2MEalioY2m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPjrbwACgkQFA3kzBSg
KbYHCw//YV/RG0PWJ1txmpgpA0mLX7EfhxqJS6vwNlqziCSd910A+/ZNL7p2Q5Hx
wVdeRoLHd9OcZFYXr0HLH0VCIJUYpr57DCy0AoIKL9q9CWET1hAMZjsIv5Kx2uVa
1obdyCX46XEMqpSBhcsq8Vsq0TMQ4sCLdpVq/wPqBEDGUBGAIhkWX1UMQv2kiS1T
uuYPKgsFmI2kl52owcOU2yZ42SVZNTEWiO2A8/4BXFfhhzKLWVcZQpEV9OInJ30n
iXm6abMFAsFavgI90NZl1H4UKKLOzD5Jgr9Rv6DfYuyeADsKe2oQN1NvioHHVqvm
qWG2b2UnZ7oS+dXxhS7YsQeiiTyZP/mpUprmrCrm0HMsl6iKCgCU8ceuRzy80Obt
7u9CpA+ceRJ05Gfgo18YElk42l4Qhwk4zSWDQdOwtOlk1FpX9TBxOtOVngYEprMM
UDRSSXFIJZTEyUAbqWqsMDuGRVcq3S9XAPYINbzig3H+Iy7an/wpxWBnYrRm+eCz
/eb7eQ/iQYmBd7Zn8XO74E6vvH+pG8f9nqr2sRPpk89ZDPsZEk0wFCHpJQShIYJt
iSeMDaLVGP+e+YlW7qvKavsdPISxlLhNFA1kj66ccHNZVbNQ5xyGhps/8qefpitG
nN9N+KCLmNvyC8QCuMiMRDD9RVq8OSQ3VcL2zT8pj3XuJo2po4s=
=9hIS
-----END PGP SIGNATURE-----

--H/y3lZ2MEalioY2m--
