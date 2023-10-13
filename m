Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 455827C879C
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 16:15:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8B4B84A;
	Fri, 13 Oct 2023 16:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8B4B84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697206530;
	bh=xiakfY2yzTf4fr07QKBhbaZia1Xj2Zm55HyF6h2uAk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=akItTWp/13kHbCilHg64FVu3SHpvCEQw9haKvb7Tk+A9XnMiENhsuNC0OkUeP0pp1
	 ghcccaQ0pNzkUMzwftwttqx03h7BM/+7J8qrReesbNEi5HNMxoC2NamUklF6nGL+vX
	 rWY6nURU58qI+iAabFMk5KdU7dRIYGSCYq//OlJc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6438DF80552; Fri, 13 Oct 2023 16:14:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C856F8027B;
	Fri, 13 Oct 2023 16:14:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3B9CF802BE; Fri, 13 Oct 2023 16:14:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1CFE6F80166
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 16:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CFE6F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eie1oeb/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C435DB82B40;
	Fri, 13 Oct 2023 14:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97711C433C7;
	Fri, 13 Oct 2023 14:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697206452;
	bh=xiakfY2yzTf4fr07QKBhbaZia1Xj2Zm55HyF6h2uAk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eie1oeb/SCDdqnrwYuRPCFdXKakAcbC4fy0M9ybafZEXiNV3IeqYb1gvNpDVkEE3j
	 Www067T/upZIUOG9A+eM9To7syVYOSs6IcdGRvfc3pKtEc+j59snOOmCI0aXOfNwKw
	 ZyRFGRH2Z8mb5jpMOW6oJzHZleZmD+fm4o+YkilcRholE/pm/IaGdRlhdQHoR/QSGh
	 4myH/6Swbjp/PL20e8IlsuI7TyX+d5aF2KwlopT/Ue3kCUFTPznyoj544KT6s34ZM3
	 2ekxKjK+RXQ+xVdq5kSQPHxNAe7g+iiZT13j0YJ3iFWj2WkcArLg8Jlx4Xgw2TGh+X
	 lrjqV830Nn2IA==
Date: Fri, 13 Oct 2023 15:14:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: wangweidong.a@awinic.com, lgirdwood@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	perex@perex.cz, tiwai@suse.com, herve.codina@bootlin.com,
	shumingf@realtek.com, rf@opensource.cirrus.com, arnd@arndb.de,
	13916275206@139.com, ryans.lee@analog.com, linus.walleij@linaro.org,
	ckeepax@opensource.cirrus.com, fido_max@inbox.ru,
	sebastian.reichel@collabora.com, colin.i.king@gmail.com,
	liweilei@awinic.com, trix@redhat.com, dan.carpenter@linaro.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1 3/3] ASoC: codecs: Add aw88399 amplifier driver
Message-ID: <ZSlQsDzNXqyRVXAf@finisterre.sirena.org.uk>
References: <20231013104220.279953-1-wangweidong.a@awinic.com>
 <20231013104220.279953-4-wangweidong.a@awinic.com>
 <37a2d2d1-5ede-4f88-b4e7-d9750336465d@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Bt6tNOD8qhkOtxB"
Content-Disposition: inline
In-Reply-To: <37a2d2d1-5ede-4f88-b4e7-d9750336465d@linaro.org>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: IKBKJNOT7WFG7EP2WYISI3PIQXFH4D6H
X-Message-ID-Hash: IKBKJNOT7WFG7EP2WYISI3PIQXFH4D6H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IKBKJNOT7WFG7EP2WYISI3PIQXFH4D6H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--/Bt6tNOD8qhkOtxB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 13, 2023 at 01:50:41PM +0200, Krzysztof Kozlowski wrote:
> On 13/10/2023 12:42, wangweidong.a@awinic.com wrote:

> > +static void aw88399_hw_reset(struct aw88399 *aw88399)
> > +{
> > +	if (aw88399->reset_gpio) {
> > +		gpiod_set_value_cansleep(aw88399->reset_gpio, 0);
> > +		usleep_range(AW88399_1000_US, AW88399_1000_US + 10);
> > +		gpiod_set_value_cansleep(aw88399->reset_gpio, 1);

> Why do you leave the device in reset state? I think you wanted these
> reverted.

I imagine practical systems aren't using the inversion that gpiolib can
do via the bindings, this is already the case for the other drivers
sharing the binding.  TBH the use for things like reset lines has always
seemed like it causes more confusion and error than it solves.

--/Bt6tNOD8qhkOtxB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUpULAACgkQJNaLcl1U
h9D31wf+LSw0mI4Eah0LGJWQfl5PpXcpkbD6bVg/ql2yS7Exi2pm5cMxMf5Thmhw
7Js/Io7XmJ+vFRJsDXRuEWdoLwvhpR/Tnaokvf6XEyEh5FA/vbvkMQae1aA0s9xy
1muspCbfG18y4N+lkzSzBL34kfuMZvUimK8e8VxCQqUdQK9hwvPeEkcA+Ujij+Mn
yhjBAuyHcR7/Mz8SM9Y+CU0rmca4QEtZQfHZvU9jKoRnEYJvX9c1LVdGjXrABPIi
cTY7xj33xVXMn496S2fG1eBwZUm38r1FWKzLW4dT8Yv1ncwETMkTJPPgEATFqvEh
5kWjYdboiDHre3ELXVH43f/6tiRpfQ==
=POXu
-----END PGP SIGNATURE-----

--/Bt6tNOD8qhkOtxB--
