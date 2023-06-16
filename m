Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D20733112
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 14:22:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20DB4836;
	Fri, 16 Jun 2023 14:21:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20DB4836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686918157;
	bh=lcb93UyauGjanSidvqpH8YqMun+SYig4FM52t4gM0L0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LgaN6xflIXl1nzRV7EsV5kL0esAVtuEtfhpSxNZUSrJqNH8dSp9ikZxogFDzXwyP0
	 ZC/PIuJu9CrP1IZYJxzcvWR+CKHRq8bfl8jj5UnegD77wDKCg7rbVS942Pf6j3GK+5
	 PZBGi5815S5I5bOvjRqH+raRah6cRNqouDGAfeos=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6D63F80301; Fri, 16 Jun 2023 14:21:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1599DF80132;
	Fri, 16 Jun 2023 14:21:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB38DF80149; Fri, 16 Jun 2023 14:21:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A824F800BA
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 14:21:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A824F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gCP5rmGi
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3BE6D62C48;
	Fri, 16 Jun 2023 12:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71ACC433C8;
	Fri, 16 Jun 2023 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686918094;
	bh=lcb93UyauGjanSidvqpH8YqMun+SYig4FM52t4gM0L0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gCP5rmGihmwrXYl1izXvZHeOWpY7EBrp8d+rz4wyph8U/HopwLx3yNzcOrI2VkwtZ
	 mq7hMlYlFD7RIQBqAgGzXaQfK3qaCUtblW26cLC5jCVGzg95RWn6g8R6sbRKk0vKbR
	 gMb4UbsvG0m5R24PE81Xzv2Flz0KL1grvRvrcCmKfKfWo76SM9gZ1fW/45UOhLxvHc
	 W4SUbCRVIzB1gapVFpYE1ogHq7GoYXrX6JR6vmXUNCk1kP2Upwqd+vi/FOFE+S3/9R
	 QwqWkQdtJGHptQkYELC06DR/0u42xk3La0pSxstm1qqw697L++r+IUa+G3B5KOk0Pi
	 rAb9BMjzGP/aA==
Date: Fri, 16 Jun 2023 13:21:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: tlv320aic32x4: convert to DT
 schema format
Message-ID: <3ddb3d09-2a9b-4a25-8108-a79ea83a9dd5@sirena.org.uk>
References: <20230616083549.2331830-1-alexander.stein@ew.tq-group.com>
 <5a562bbc-9bba-4829-8998-af12041a434c@sirena.org.uk>
 <4930994.QJadu78ljV@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fKDuqabGFWUpzE8H"
Content-Disposition: inline
In-Reply-To: <4930994.QJadu78ljV@steina-w>
X-Cookie: P-K4
Message-ID-Hash: UOKO2WMQPLSPF4VPOVJKWOSLTYHUPJ72
X-Message-ID-Hash: UOKO2WMQPLSPF4VPOVJKWOSLTYHUPJ72
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOKO2WMQPLSPF4VPOVJKWOSLTYHUPJ72/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--fKDuqabGFWUpzE8H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 02:17:40PM +0200, Alexander Stein wrote:
> Am Freitag, 16. Juni 2023, 13:54:49 CEST schrieb Mark Brown:

> > This doesn't apply against current code, please check and resend.  This
> > should be an incremental patch perhaps?

> Is there any change to original .txt file I am not aware of? The to be cr=
eated=20
> .yaml file is new, so there is no increment.

That'll be the issue, yes.

> To which base/branch/tag should I rebase this?

As ever

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-ne=
xt

--fKDuqabGFWUpzE8H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSMU8kACgkQJNaLcl1U
h9BUcAf9G7CPLU2eWfY5FglRTT5eSN2hsyUQzpxU5q3tcoyx38HkKsR49fRnvMtd
k2Qotg1rHf2bcyuCbzQhd5lS0khMjyEFTznkWpUyAhLhvnMrO1jhBO0Chhxyndpi
v09npGyzYgZUySR+g2boyw6eGbjHaWf707Q1PCRqeiwDoUVVmQbm05mdQetavckq
HgCM00ZGPq9fkdYtf+g9s7iAW/8giZndtL0P+Iu56aAQISP28qi5G5kJswe0l4Os
ATlmp+Svkd5fWZPSXkjAgolQ4OgZNNbY/648vsqBuHNW874DeJr3VowD8JvxT275
EsqelHTY81AIYqbVZOF9/oJrKtfwfw==
=ScV4
-----END PGP SIGNATURE-----

--fKDuqabGFWUpzE8H--
