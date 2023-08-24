Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A26787B94
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 00:39:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 448DE852;
	Fri, 25 Aug 2023 00:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 448DE852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692916739;
	bh=4IaqTr1n49PG1aUlZXm7H7/81HA3rJ61LtRLVKDZ3H0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P/FBIeXj8CelXV7O2UOEqrfEwiyj+buVlDnR9zMLrg3Tliqdz1tRY3epSraeAtYVt
	 tTLwso703VGSERvkmZoUenrtZRhWbuQCALh2ZabkK9BO7F6wwCWYd0maYHsWpikBQw
	 +xjo9znSmqYT26tCL72CazB6uhw/YJpZ/8GqR33Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C089F80549; Fri, 25 Aug 2023 00:38:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC9F3F8023B;
	Fri, 25 Aug 2023 00:38:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AF70F8023B; Fri, 25 Aug 2023 00:38:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 44564F800BF
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 00:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44564F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=L5Mb6GTA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F28C06427F;
	Thu, 24 Aug 2023 22:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76B5C433C8;
	Thu, 24 Aug 2023 22:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692916680;
	bh=4IaqTr1n49PG1aUlZXm7H7/81HA3rJ61LtRLVKDZ3H0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L5Mb6GTAf7Ji93VgzSgH2IL7EHry//x8NPsLYDh3uxBlIcsZtJA/hyYRIl/115JnH
	 9300jBxEWknj6HHBGqBmRUAv4jJz1Y0pl1Uu4AwUyWn+Y0cDNgbDDkfB3ScB2J6Psd
	 BJ14Q07i2o6DQzoNMBRyw9cKRJqrOJufZE7GlvJUnHThlhNjpecxD1HG+l9QDFCryn
	 yvKX1qDOI5krTHL/1rIv2wsk0OKMBjigSDmOWxGEBTe4f9WU5naGWN21U0Dzy/IriS
	 bYyel3FIFZJ6TpplsA4y/twN54bc6afVuvHvNCAgW2U1AHyVO4zBblCG+U3hko0MDx
	 3an4HUejhh78Q==
Date: Thu, 24 Aug 2023 23:37:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH 17/17] ASoC: Intel: avs: Unhardcode HDAudio BE DAI
 drivers description
Message-ID: <ZOfbxARqVr8nbQI3@finisterre.sirena.org.uk>
References: <20230823080546.2224713-1-cezary.rojewski@intel.com>
 <20230823080546.2224713-18-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9bFgNhs+XvL4Esnw"
Content-Disposition: inline
In-Reply-To: <20230823080546.2224713-18-cezary.rojewski@intel.com>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: 5BL5DTQ6MBIYE527LVFSCAFMXD6LXMZW
X-Message-ID-Hash: 5BL5DTQ6MBIYE527LVFSCAFMXD6LXMZW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5BL5DTQ6MBIYE527LVFSCAFMXD6LXMZW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--9bFgNhs+XvL4Esnw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 10:05:46AM +0200, Cezary Rojewski wrote:

> To not expose more than in fact is supported by the codec, update CPU
> DAI initialization procedure to rely on codec capabilities instead of
> hardcoding them. This includes subformat which is currently ignored.

Acked-by: Mark Brown <broonie@kernel.org>

--9bFgNhs+XvL4Esnw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTn28MACgkQJNaLcl1U
h9C9gQf/adiE9gXr+CyAhDCo7/UQzND6p+ckaDhzUdCXrJJO2xO6SW3EDRikRv1O
LNwnPyXHfmHThx/J3rnxBdBgLpJ32PiC092r/Jr6CYtAYQKuSP5kiARrHYY3GAAE
WwgmucWsuJuPXIKpJtfhvvRK0TywHaBdM61mJz0+ukMhWaAbJ7IuwXAbrX4LbQaW
FOxC5t1/+0q0S2UHdOnxQqrvx+AG14DWy89ADed9EVNf8rfRKmLtO2eCHJijd7yG
BEyDQYnMl4QZ/VfY8vCTl2Yiwo2524Ql+6J7yqp1HzR1Zvv1EuBATuThgR63p4jT
ed/a8iiPEG+TkAOp0pTJgAKwC1Jv1A==
=TIf9
-----END PGP SIGNATURE-----

--9bFgNhs+XvL4Esnw--
