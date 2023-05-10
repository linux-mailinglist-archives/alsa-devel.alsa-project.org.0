Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 601E66FE4FB
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 22:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B0C1FE4;
	Wed, 10 May 2023 22:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B0C1FE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683750232;
	bh=K0GUlOR4QFLJUalaWA8czdBLmxA0PE/dUqa1IdlNM58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZKNAF+/zqhWhTld+yIz8BYIMtboiaofs0q+KZWHYqWbCbNCQt6ypFc5fLBQU5gKzt
	 kPBiEtNOBhHjnmu6ndDlNqdpMOWfoIt/OjqTlX5/ePSvh05o26LkcPp9Y7LIJRwmTK
	 HF2ADARb0o0SX/C+1HjZwa49U9AGnBuAtj9AmU70=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72417F80310;
	Wed, 10 May 2023 22:23:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7984F8032D; Wed, 10 May 2023 22:22:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F4C1F80087
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 22:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F4C1F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TQSM9Jbd
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EBD2C635DA;
	Wed, 10 May 2023 20:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E19C433D2;
	Wed, 10 May 2023 20:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683750168;
	bh=K0GUlOR4QFLJUalaWA8czdBLmxA0PE/dUqa1IdlNM58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TQSM9Jbdo2MKbuEXEtf8mlc1NHfEJWAenPeiZ6OuxEetwTlENaz1zIaRwYfYm8Ybl
	 mFykHJOoMFRz9OcYJXjpEmX9rqgPXAw3sak4bRETTvDhiUaYwVlA3KXUNot/XL1ZM/
	 29aQj849FvN6rVYc6+QrSrevIUkvmUgDYXkwwqulhNuuRljN5Zhm8FP6j4u7OdGIlQ
	 oho0Pg8DGjdD9ccVsy9tnExQr6FOdhaTCaPZS+OVCnE+n5LzfTDGDiM+AlJ9ZL+nGq
	 Yau74pkriEmOH3fDEUkGLRn2Szn8IjR1yj/TCkSDIDk9zPXHGuSMkQyuMt0LnwT+Ut
	 zgnqc0soAI51A==
Date: Wed, 10 May 2023 21:22:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: add tdm node and sound card
Message-ID: <20230510-riveter-ridden-3f056251e623@spud>
References: <20230506090116.9206-1-walker.chen@starfivetech.com>
 <20230506090116.9206-4-walker.chen@starfivetech.com>
 <a0932e84-3813-bbbe-762d-948d75fbcd8a@starfivetech.com>
 <20230509-overheat-pliable-00d60523637e@spud>
 <CAJM55Z9AxMVw=ymfFBb=45nODq89O8dMebzRgo-XD0GKduDBYg@mail.gmail.com>
 <f27b7ee7-f23a-35a2-3b82-71f50871dfcc@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R5rGeiM6/5QEp4La"
Content-Disposition: inline
In-Reply-To: <f27b7ee7-f23a-35a2-3b82-71f50871dfcc@starfivetech.com>
Message-ID-Hash: H2ULRS6NHUNOBPGKNI22CDKNRX64XIG2
X-Message-ID-Hash: H2ULRS6NHUNOBPGKNI22CDKNRX64XIG2
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H2ULRS6NHUNOBPGKNI22CDKNRX64XIG2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--R5rGeiM6/5QEp4La
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 05:21:21PM +0800, Walker Chen wrote:
> On 2023/5/10 16:33, Emil Renner Berthing wrote:
> > On Tue, 9 May 2023 at 20:05, Conor Dooley <conor@kernel.org> wrote:
> >>
> >> On Tue, May 09, 2023 at 08:52:48PM +0800, Walker Chen wrote:
> >> > Hi Conor/Emil,
> >> >
> >> > DT overlay is used to describe combinations of VF2 and hat.
> >> > Do you have any comments on this patch ?
> >>
> >> I seem to recall that he said at the linux-riscv sync-up call that we
> >> have* that he was not in favour of overlays for hats like this.
> >> I'll let him confirm that though, I might very well be misinterpreting=
 or
> >> misremembering what he said.
> >=20
> > What probably meant was that I didn't want a bunch of different device
> > trees for each combination board * hat. An overlay makes a lot more
> > sense. However, looking through the kernel tree there is a surprising
> > lack of overlays for hats committed already, so I suspect there is
> > some sort of policy around overlays already in place.

> About the specific usage of overlay for this board + hat, referenced to t=
he following example in kernel:
> linux/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtso
> That board is connected with imx219 sensor via mipi_csi interface. That p=
atch was accepted in 2022.

Hmm, so spoke to Emil again today about it. In the interest of being
fair, I did go looking at that particular board & looked through their
documentation for more information on why there are overlays.
They do actually sell the bits required to use the overlays, based on
what I saw in their datasheet for the board & wiki. That said, what is
done for one arm64 platform does not necessarily apply elsewhere ;)

I'm not against allowing in-tree overlays for hats/capes/daughter-boards
that come bundled with a board, but accepting ones for a hat that
someone decided to use theoretically has no limit! The "someone" in this
case might be a StarFive developer, but it could be any random one of
your customers next!
We've got to draw a line somewhere, so my answer to the overlay *in this
case* is a no. Sorry.
When you submit your next version, please drop the overlay from this
patch.
Thanks,
Conor.

--R5rGeiM6/5QEp4La
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFv9EwAKCRB4tDGHoIJi
0pgOAP9eU2ZWh7+ycauV2k2tsHEtiJcGiCvC1lBDQL6aVqzqJQD/St1K7BA7Q9BW
NSqEGApfEX6ctSZmnzWY8/sp72lCmQI=
=JAZI
-----END PGP SIGNATURE-----

--R5rGeiM6/5QEp4La--
