Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E476A1C2C
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 13:31:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 482A0203;
	Fri, 24 Feb 2023 13:31:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 482A0203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677241915;
	bh=z8vuGuWFSWV1LDUDxZzIaVe2aeHW5pFI5rwMEdFeI1A=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oWRuBWYnfyLMFW72CPT6FsKiCC4uEzBsMX/a1cDX/fcKVb5LwY4QH9nd8gUZp3K1E
	 FBDvrnnorVw3TbgoJ3oH81/x738aYZr8I/+IewryyNvi8PxEYDOG8KcdrTn+oUxwcD
	 ctvsgDHZ343vE74Sp0dUYpGOladbI5xr3jDn6TYU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FA6AF80116;
	Fri, 24 Feb 2023 13:31:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90356F80125; Fri, 24 Feb 2023 13:30:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 800F6F800DF
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 13:30:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 800F6F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IMKF78ZW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9776861826;
	Fri, 24 Feb 2023 12:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CC7C433EF;
	Fri, 24 Feb 2023 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677241849;
	bh=z8vuGuWFSWV1LDUDxZzIaVe2aeHW5pFI5rwMEdFeI1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMKF78ZWMxd4xvTEW+AVmZ3d41ZJg8DPdi1BaQ0uMAGnKtD5vy1/GDubE10u2hTBH
	 m0XPtCvlhBAIS0LXtXOfGo9CZjE6wu28ej1BB2jfjc8xYGyZIeJB9p8FlVJ6/tG115
	 Bz+/wnzZZsikeuQR9hMK1a2+Ui+yURwYv1Z8d8dyLrXOZn9VTiZNN/w+ffdPFCzl9e
	 Z1gcELmhSGVMVlNeKFfQhMBF3UjR/ze0gJGOgO21fxlFd8g61wW3fUN6fc2Inmi+zb
	 M63t1SyR3r3mmfgU4dpAECPsyV9ROe7yiv6dBOz54FeWwiTFL+VfVShYKAS8j2cEwD
	 iWfzov8Xt1gJA==
Date: Fri, 24 Feb 2023 12:30:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: Re: [PATCH 4/4] ASoC: wm8524: Delay some time to follow power up
 sequency
Message-ID: <Y/it8z/w2c+gS/85@sirena.org.uk>
References: <20230222113945.3390672-1-chancel.liu@nxp.com>
 <20230222113945.3390672-4-chancel.liu@nxp.com>
 <Y/YPNMGMZcVZs3xy@sirena.org.uk>
 <VI1PR04MB42220617033D1DE404AF445DE3A89@VI1PR04MB4222.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h1Fxj73TV969Kz5/"
Content-Disposition: inline
In-Reply-To: 
 <VI1PR04MB42220617033D1DE404AF445DE3A89@VI1PR04MB4222.eurprd04.prod.outlook.com>
X-Cookie: The early worm gets the bird.
Message-ID-Hash: ONRKBVXSZZI37MJRHHYFIHV4FQMVE55G
X-Message-ID-Hash: ONRKBVXSZZI37MJRHHYFIHV4FQMVE55G
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ONRKBVXSZZI37MJRHHYFIHV4FQMVE55G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--h1Fxj73TV969Kz5/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 24, 2023 at 10:54:59AM +0000, Chancel Liu wrote:
> > On Wed, Feb 22, 2023 at 07:39:45PM +0800, Chancel Liu wrote:

> > Doing a 100ms busy wait in atomic context does not seem like a great
> > idea, never mind a 1.5s one.  This shouldn't be done in trigger, it
> > needs to be done later - digital_mute() might be a better time to hook
> > in, though longer delays like this are really quite bad.

> Yes, such long time delay in driver is very bad. But this device requires
> waiting some time before able to output audio. We have to wait otherwise the
> beginning data may be lost.

It's not just that it's doing this in the driver, it's doing it in the
trigger() function which runs in atomic context.  That's unreasonable.

> The power up to audio out timing occurs after MCLK, BCLK and MUTE=1 are ready.
> I added the delay in trigger() because some CPU DAI drivers enable BCLK in
> trigger(). You suggested moving the delay to digital_mute(). It seems
> digital_mute() is called before cpu_dai->trigger. Please correct me if I'm
> wrong.

Hrm, right - in any case, it needs to be somewhere that isn't atomic
context.

--h1Fxj73TV969Kz5/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP4rfIACgkQJNaLcl1U
h9A1lwf+OS+A++3bwTMcv2PfQianyzMlPcFLYR42hoFkNYSf1dY/omT9tJyVpD1x
ioWTgVrm4rhgyUmsGODd3WFJ4WeUq4E3mrKpy2xpSvH6u2z3J50F8WNuHVYxq1HN
6bH/LMog2u2HINCyatYyEz7XID0YPqfzlNiRBfG8zZ3DCLFhPRpFQySy8EC5ShNK
ih+rrKeJbC/ZO4Ob+Ziw50d0ifrqQxSq8vlcnqPryImayJj1jYoQLYuUv1D1TBQx
BONmKLNc6OELYJois8Jlni3ld43Tanxvb0RmebhQjYlPqHx03PwjXQ1N0J1UWDRD
0aNN+NG0jyxp5D895Nax9Hz6F6fw4w==
=MHUI
-----END PGP SIGNATURE-----

--h1Fxj73TV969Kz5/--
