Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC05A6F6D74
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 16:03:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE7C6198A;
	Thu,  4 May 2023 16:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE7C6198A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683209015;
	bh=boqOdA3P9ek3eoEYJAtDXWA5q44SKyVZQf1j6xosNfE=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gC93DMiQEfDrxbuIigHnt+fPWzy7b8q411xaljXlzYFmgvvhb8Tnji3EiPETXpCMX
	 K0PoQHPMW3IcXrfbNsWSkQQoNdArB7eeHaDI9qhYI2iYfbFOuH+NboUJhHSAlKFN/p
	 5oxRPHJjpGXYU5zSQ9as/F75Aq7JHYVMv1yEwS/8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B605F80529;
	Thu,  4 May 2023 16:02:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B26FF8052D; Thu,  4 May 2023 16:02:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 944DDF804B1
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 16:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 944DDF804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Zjf0dUQf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E4A76336D;
	Thu,  4 May 2023 14:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BCDC433EF;
	Thu,  4 May 2023 14:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683208932;
	bh=boqOdA3P9ek3eoEYJAtDXWA5q44SKyVZQf1j6xosNfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zjf0dUQfun0fJ3towXh4X1xrW6TzRS3wHAnAIhfctBc2ydojtSG9oQb0JXERwWhqw
	 PodtB6j2yDXU2Q+/FYwQ6WKJDaTNTfMDbvEl6QYI8g1mwMdOm+8XiKIhfhyXYK5oCz
	 RBsX4VSsHX2rORRotB9E00knXDBZkiy93FgG3rNxB33mPkbkDuuR5K7Sgl+OnuxRF0
	 L7/uIYaMc5KnMU5TWYF14CTKg/tUNxDHzVFhuV1yEHkIpOio8EBkJ/Lhj1G+85UNGO
	 72581MPvkeNCSidcEADeyvpu1SJKVYcX9Pc4zsMHs6Ujh+gQSbPjv+fnUP3QCTu4X3
	 Nz2bIHf9qNGMg==
Date: Thu, 4 May 2023 23:02:09 +0900
From: Mark Brown <broonie@kernel.org>
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1 3/5] firmware: tasdevice_fmw: tasdevice
 firmware loading lib
Message-ID: <ZFO64aZtVGNkNpZW@finisterre.sirena.org.uk>
References: <20230502053235.27066-1-13916275206@139.com>
 <ZFGqhM0VYFdorkRa@finisterre.sirena.org.uk>
 <82b9ac35631a4c4993dd2cd75f137273@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yXUEvluyKD4ppgaS"
Content-Disposition: inline
In-Reply-To: <82b9ac35631a4c4993dd2cd75f137273@ti.com>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: 36GGFF6IPSSNRFRGRMD3XYXXNAOT5SAO
X-Message-ID-Hash: 36GGFF6IPSSNRFRGRMD3XYXXNAOT5SAO
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Lu, Kevin" <kevin-lu@ti.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Xu,
 Baojun" <x1077012@ti.com>, "Gupta, Peeyush" <peeyush@ti.com>,
 "Navada Kanyana, Mukund" <navada@ti.com>,
 "gentuser@gmail.com" <gentuser@gmail.com>,
 Shenghao Ding <13916275206@139.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36GGFF6IPSSNRFRGRMD3XYXXNAOT5SAO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--yXUEvluyKD4ppgaS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 01:55:21PM +0000, Ding, Shenghao wrote:

> In fact, we have a dilemma whether to put the code into firmware folder o=
r sound/soc/codecs.
> As you know, most cases are audio-related application,  such as a pure au=
dio device or=20
> audio2haptics device, keeping the tasdevice-firmware lib into sound/soc/c=
odecs would make sense.
> However, in other cases, tasdevice(such as tas2781) can be used  as pure =
haptic to drive the Motor.
> moving the lib into firmware folder would make sense, although such an ap=
plication is a niche.
> Would you be so kind and give some comments on it? Thanks.

That sounds similar to the other examples where you've got some
non-audio applications and keeping things in firmware as you've done
makes sense.  If you resend then mentioning this in the commit message
would be helpful.

--yXUEvluyKD4ppgaS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRTuuEACgkQJNaLcl1U
h9A7zwf/b6ny0QHL9iLXXdY4D9Cs76zcHWGK02RlFjksYRlREn/AzRhh8dXugkzu
9csP6zKqAPpXNiVwd1OSJ1eDphIykU2RA7FBZdD+yFbEsng5RvOf8xV0l4lEJN2/
6xXVora+UzezqmrUsx/3n+jUaflmXA8NV5k2JxuCxeSwuyyE3rV1kfxfdYULa0m8
MxarzrbyiYruWlyXGNJRH6sWIcE1fdmvamFHzJHFqVyuaD9Osn594+YL4dgtGwl2
Aa0AtJw6o/FXxtHP1eWlbrDsI6n4wit6DpG7oakRotroYFPYMS/crIFB5/VsC/Cc
KINDpd67o74N7AQlc85gr73tBobeQA==
=jKYb
-----END PGP SIGNATURE-----

--yXUEvluyKD4ppgaS--
