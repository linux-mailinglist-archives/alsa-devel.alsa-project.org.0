Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 935386ECB2D
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 13:19:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5983BF22;
	Mon, 24 Apr 2023 13:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5983BF22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682335175;
	bh=4mQdcfkDR4Z65AevOz3ZaExDX20jDuLa+KuFQEBBQXw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EVENqICaVBF3JJnq1++VR/YKf7w/nOG1Gwq/5798e6J1GwY6ZpL1RunPIkd+/Xstx
	 wO6/cWSXD7tbsYDDeUj/cMdomqQIn1tZyRGKNJvXWIrgJinlSB+lvmjnQuWjZk2MnL
	 DespEpbZIaEF1W18xdn5m4sJTRQ6vO5E7Rp3CaHI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF0AFF80162;
	Mon, 24 Apr 2023 13:18:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA3D0F8018A; Mon, 24 Apr 2023 13:18:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36E75F80104
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 13:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36E75F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RaxeCC5B
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D88A46125A;
	Mon, 24 Apr 2023 11:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F62C433D2;
	Mon, 24 Apr 2023 11:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682335110;
	bh=4mQdcfkDR4Z65AevOz3ZaExDX20jDuLa+KuFQEBBQXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RaxeCC5B9yRnETueKys1OhIiL4bftnlcg1VROXzWSbHLbKb60VpNJahhV+z1PTVkD
	 da8TFC7ZKvNysgPiWLqXFBSHiJp5e6J+A4Di4eK+2QoOF/zuuN3LUY1KCKuatzWh5D
	 hh+UlwtP/vDr+pwBQReKbzBh/Jka+CYiOhYxtSZlCB3hCYG1JRfqhqAc8+2rw3UKXr
	 jfGxRBnKqEGahDXfS5QHTV42lYpouY6Tor9kcZHKIaREORenLhubfhqNjopiGmqGUb
	 efwci4ZTqrC7hfRztQMHfiaKmmXPnY/Abtc4bU6GoHrYw0V6oorS93GmPfmEBWanSk
	 JqKza24jeFdrw==
Date: Mon, 24 Apr 2023 12:18:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] ASoC: max98090: make it selectable
Message-ID: <45939030-c511-4b61-bc44-52120495bbb8@sirena.org.uk>
References: <20230421211950.20972-1-fido_max@inbox.ru>
 <0a2eca07-f266-164c-4a9f-f1000ae4efbc@linaro.org>
 <7fdf1f95-a9bb-8560-729c-b12bee302376@inbox.ru>
 <600d0c3e-0b5a-88a8-fade-edf3e4dd8ac6@linaro.org>
 <8805da0f-f79c-f6ad-bdec-7e1183242a79@inbox.ru>
 <2c308d01-8b9f-5132-6440-ee9166499b55@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aYt/HAvkdawYBBIB"
Content-Disposition: inline
In-Reply-To: <2c308d01-8b9f-5132-6440-ee9166499b55@linaro.org>
X-Cookie: A rolling disk gathers no MOS.
Message-ID-Hash: 22QRWZUSGTUDN2T7C2R5RN35IQBTAH5P
X-Message-ID-Hash: 22QRWZUSGTUDN2T7C2R5RN35IQBTAH5P
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Maxim Kochetkov <fido_max@inbox.ru>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 rf@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 shumingf@realtek.com, ryans.lee@analog.com, herve.codina@bootlin.com,
 wangweidong.a@awinic.com, ajye_huang@compal.corp-partner.google.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22QRWZUSGTUDN2T7C2R5RN35IQBTAH5P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--aYt/HAvkdawYBBIB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 24, 2023 at 10:57:38AM +0200, Krzysztof Kozlowski wrote:
> On 24/04/2023 10:55, Maxim Kochetkov wrote:

> > Exactly. I'm trying to use this codec through generic card.

> Commit msg does not answer in such way. It suggests removal of
> unnecessary extra sound card, but extra sound cards are necessary.
> Otherwise just write in commit what is going to use it.

The commit message is perfectly fine.

Please stop doing these pedantic reviews, they are creating a lot of
noise and causing hassle for both me and patch submitters.  If this
commit message has too much information that is most likely a result of
your prior review.

--aYt/HAvkdawYBBIB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRGZX8ACgkQJNaLcl1U
h9CjxQf/fToTOv/WYLyCP5kph6fJ6iScq3x0yC5EocbcCjTmt1Ls0+KpmOQaraFT
SoezpNwa+ImkODboDPNOt8pTzk5VRE6y4j4R4fD2CXVNvtSaUrNMtSif3bR+445D
jDN8Y5yRmKJrmyfEXYRoxv2ksbeXLXKtaxff3wLZmCF4FO6PE6GE6fsK6pSTohNZ
3dEjXGKM72CamkBtSz/cYcukSNzJYNE3MX6t7tWeTbpOOudotkEDCIX1kZqVbWTT
uir2DoQVCz1AuK25DS6Igv10fr24jffeNAEB1xALprqiNIiASCLpp8Fqx+pXeUru
w9nPqUlKVeZnp9X1I09O7XgrLdQuRA==
=joOZ
-----END PGP SIGNATURE-----

--aYt/HAvkdawYBBIB--
