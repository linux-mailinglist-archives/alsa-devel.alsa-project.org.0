Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC4E6F9CED
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 02:10:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93A0F1341;
	Mon,  8 May 2023 02:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93A0F1341
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683504656;
	bh=A32A0fMavO0Ip81/GDeG/O8Dt1b/AHEN/Q9Ag7VxJ/U=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aUs2SWcqRc7w5QEuKTH/VS0+VSVx5t8RY8OhkAImxl7qybFcSNED1Dp9977A8uGjW
	 PnkLxWtdR7LZNuEgGiQie2ze/GZEPEdiOFPGH4bkp99P4NXdvakGpHGzlMJf6bIpvE
	 SLzxmuOniz6H6zKumpc6OSrNC/rnRHiZje9Xtd+A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06245F80310;
	Mon,  8 May 2023 02:10:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D2B7F8032D; Mon,  8 May 2023 02:10:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A88C2F8014C
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 02:09:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A88C2F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YzfMivA8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 386726106E;
	Mon,  8 May 2023 00:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E14C433EF;
	Mon,  8 May 2023 00:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683504593;
	bh=A32A0fMavO0Ip81/GDeG/O8Dt1b/AHEN/Q9Ag7VxJ/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YzfMivA8lavBpLa0kuam03gytpAKOIxDo3i/gd5rGSh/fBFIhSC2RTH93vddmU8/d
	 3Bj8mKzdI4jbG3vWlhJ1Wa0SK16Qpvf2ryv/mxvwWgB9SN45Z1Yc0+U4B+mq0Mgg1n
	 U87vTTdAP2X5ed7PeXOrVt3Kvhd5ST2QlTPn8jmAEhYt1zNIhbSIhcnu6Kv7DozjNw
	 GbMVLl54RcV3ohYPrabVLFn5WnsvcB4yh8csgfIPnyUb4IalsjnnJJKkg+t0RzW1PH
	 ggafPW9wR5hSLPRt7fMK8kl4G+eNZHVxoYphhCT0quHS0Q/WABfFnS/B9lqb+JRL5n
	 mkzcg/jceFgrA==
Date: Mon, 8 May 2023 09:09:50 +0900
From: Mark Brown <broonie@kernel.org>
To: Shengyu Qu <wiagn233@outlook.com>
Subject: Re: [PATCH v3 2/3] ASoC: starfive: Add JH7110 TDM driver
Message-ID: <ZFg9zpVEpVSQJrfZ@finisterre.sirena.org.uk>
References: <20230506090116.9206-1-walker.chen@starfivetech.com>
 <20230506090116.9206-3-walker.chen@starfivetech.com>
 <TY3P286MB26118DAB0E0E2BF32C91B19F98739@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9ci+RuukFZBKZOQn"
Content-Disposition: inline
In-Reply-To: 
 <TY3P286MB26118DAB0E0E2BF32C91B19F98739@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: AV56SGTCDLTIHOMY4YQVLUQI2GDB2SRH
X-Message-ID-Hash: AV56SGTCDLTIHOMY4YQVLUQI2GDB2SRH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Walker Chen <walker.chen@starfivetech.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AV56SGTCDLTIHOMY4YQVLUQI2GDB2SRH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--9ci+RuukFZBKZOQn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 06, 2023 at 09:47:55PM +0800, Shengyu Qu wrote:
> Hi,
>=20
> > Add tdm driver support for the StarFive JH7110 SoC.
> >=20
> > Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> > ---
> >   MAINTAINERS                     |   6 +
> >   sound/soc/Kconfig               |   1 +
> >   sound/soc/Makefile              |   1 +

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--9ci+RuukFZBKZOQn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRYPc0ACgkQJNaLcl1U
h9Dmbwf/Xcbsz/f576Mnx9hVH2Cly67ZCtBddqWB7pV+pDcaXRcceHN3aX2c4LRR
wCAYUrX+SQu5hXybB4KLamAtL9zqrf0wUmZIMsPAwVSMCj4pgvabvXjvQBhCC/JE
yF7GbhvWGOIcmO4P4rCUC3wir3XvaZJUTxd31sfqRQ1QuJQld2K4tVn7GpIn+Yqm
TzwVoWu6phAweem94ZbvQD1LUL8P6jaiFTr+Y7CXhbtjKFyDPWsL//xxzqpzpxeY
C7I3om/FG2R7stwBxmjLERGtXg2b+JDKqRvUl/RCL1nUzyWa9MyoPQgkooMqnI7h
sHiUX1OQyLsOMMf6ruvYLbgC28hu0g==
=Mg6z
-----END PGP SIGNATURE-----

--9ci+RuukFZBKZOQn--
