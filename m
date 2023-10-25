Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E617D6C06
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 14:37:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 788417F1;
	Wed, 25 Oct 2023 14:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 788417F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698237445;
	bh=wyBTthqKcfkO2ojgR97LQEfheUDy16wEYDsyyZztt1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UzuYsg3VB1fJdUBoVVYZJ5DtYG45xFRPILWz7gsAEUT0BtumwfUTmJPGt91us+LSm
	 Xk1HPbMuGwUFrd6qzlb2HX3cOv2JJ86vfT7+Q4nhuDAcEvR287D5a+kgTyxR5JyJB2
	 wCyZjeUXU2rW+A6vpxyeo/Iv2B/2vcBIV05rnJ8M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BCB3F80157; Wed, 25 Oct 2023 14:36:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92DA3F80157;
	Wed, 25 Oct 2023 14:36:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C4E1F80165; Wed, 25 Oct 2023 14:36:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD5D6F80152
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 14:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD5D6F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VF7DP9hW
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A76B56300D;
	Wed, 25 Oct 2023 12:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405C6C433C8;
	Wed, 25 Oct 2023 12:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698237380;
	bh=wyBTthqKcfkO2ojgR97LQEfheUDy16wEYDsyyZztt1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VF7DP9hWihFTYldQ4VlETRZme+Ag7HiUQmcOZgvH8zqbgLchlmqDlwdbofg/cEPGE
	 boahSAC7v2SIV8XypOtiWLxzIzszuTJv7Q4Fb8tf/GOeHwGHaMpk+TKXDNI3KVtx9C
	 1VoJ5dhJhMnu5OR8sqKdqyJqEPIUcBkdSqbXhh+VmiDMTPn77XgnEmVYUPPJc6UJsk
	 au7pRyp5HtTE4nG+yQnZ/6RQFBZfEx6zzTmJdlkBWystY6f+mRMdRQk8ehONPRUYXB
	 U4ujeJ+WgNOys0dUY/qPedw5EspK3hj+yMxuWrSzYpKD4uCi74L0pgigA8udbwB4F9
	 vU6c3esvXIkjw==
Date: Wed, 25 Oct 2023 13:36:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	johan+linaro@kernel.org, steev@kali.org,
	dmitry.baryshkov@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/4] ASoC: codecs: wsa883x: mute/unmute PA in correct
 sequence
Message-ID: <6df45f92-5fe6-4b44-af04-c528d540ac06@sirena.org.uk>
References: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
 <20230323164403.6654-4-srinivas.kandagatla@linaro.org>
 <ff3eb88a-6941-4303-a4ba-17cad3842b88@sirena.org.uk>
 <2a0aabf5-41a3-cc07-3203-9b0bca6b71aa@linaro.org>
 <ZTjKWHAAfSYfc5px@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rt5zetGAX6yWh0JO"
Content-Disposition: inline
In-Reply-To: <ZTjKWHAAfSYfc5px@hovoldconsulting.com>
X-Cookie: There's no time like the pleasant.
Message-ID-Hash: 53AVB3WWCQDR7LNW3IWXWOFY6X7QU2VP
X-Message-ID-Hash: 53AVB3WWCQDR7LNW3IWXWOFY6X7QU2VP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/53AVB3WWCQDR7LNW3IWXWOFY6X7QU2VP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--rt5zetGAX6yWh0JO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 25, 2023 at 09:57:12AM +0200, Johan Hovold wrote:

> I understand Srini has looked at this but has not yet been able to come
> up with a generic implementation. Would it be possible to merge the two
> codec fixes as an interim workaround for 6.7?

You're talking about two fixes here but this is a 4 patch series...

--rt5zetGAX6yWh0JO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU5C70ACgkQJNaLcl1U
h9AXWQf/T9xZ70IX74zqgGEQvJQW8f5WuAjh3quFZ3EGIn0VgypXfRhXm36u8tDQ
B62+t6eMRRNj0YL8nyACWJUJ/MJebuPDNaNU+GUbE0yd5uZ0ByLwDKxN46IOD77V
oNkhPcf6GYPBzO76cNcaZJbkceN2dvGhLImmwGOEZGrspk9dVl/MGMUVUkEoHOgH
l/V2B+WwMJDLMOmzdqyq/FCU26+XpdNhwaR8pELO8VbjyNfa0Z+eu2qKx3TZ7LY3
mrVl+w95kK4H61ilMF3VsJ9NECYjUIGq83lr8SeHtm8qIPpnh2ydz5SNKmkuCFmf
SmfKJZPfodlipTiHHGVeFfZKr/n7lQ==
=btYs
-----END PGP SIGNATURE-----

--rt5zetGAX6yWh0JO--
