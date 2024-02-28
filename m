Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7234186B5E0
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Feb 2024 18:24:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E663847;
	Wed, 28 Feb 2024 18:23:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E663847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709141036;
	bh=tMjIhEv+h3b2Ps+WQU7FV8OtoGXlbPLUgVjp/OLsuF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JU9I3e8QoS8OPcOUAeveHwILwkYzrLqbrhO8nKWpo4CMTEv35OS4ra2YeOwcjRN7A
	 PNW23qwuCZqJ0wi+4cGOtybonfWqYFYr/ovCYQ15PaM1ybnts7aKQB+2f+N/BOfr7V
	 zspPubNVFiijbeWKkDoGwqLjJ/l53CFTuiaIcRcc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84DE5F805D5; Wed, 28 Feb 2024 18:23:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE163F805CA;
	Wed, 28 Feb 2024 18:23:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 560D7F805B0; Wed, 28 Feb 2024 18:23:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47968F80571
	for <alsa-devel@alsa-project.org>; Wed, 28 Feb 2024 18:23:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47968F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kBGKA6FY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D51C9618E6;
	Wed, 28 Feb 2024 17:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E67C433C7;
	Wed, 28 Feb 2024 17:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709140984;
	bh=tMjIhEv+h3b2Ps+WQU7FV8OtoGXlbPLUgVjp/OLsuF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBGKA6FYaVSm3RnV9qMC9BLabmJ4All978c9MTGrsnDB+XCxY5qF3KHEiakEJIbWQ
	 Lwoz+w2xF82MxKbZf+upqEXxoVEm892h6YOTZUZqhLbzP/5mjw6QVVXGvPcqY1koIr
	 cZQuR7b+Nlhg9Mcf+nYf/Jt8mIZFopetxxtNTfYMbcjYBQwBu6V7tAHF7mOIUMEhch
	 A/S9XccJQOQsI9dBoqvMo49QQAOiTgDNTl/+qnOjDYqvPywp7W0TKQW+8JcvlUyDF8
	 zTYBHeDOMigUmry4U7c+lhnHDRVyZtOfF5R9Ec+vR2zqWcsPYNACufStwjFfRmTnhF
	 xFry5VCluJIRg==
Date: Wed, 28 Feb 2024 17:22:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	tiwai@suse.com, perex@perex.cz, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH v3 4/5] ASoC: codecs: hda: Cleanup error messages
Message-ID: <af0c782d-8625-46f7-a347-2d21df3f6ac0@sirena.org.uk>
References: <20240226124432.1203798-1-cezary.rojewski@intel.com>
 <20240226124432.1203798-5-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5d8EE8aWTInID7GB"
Content-Disposition: inline
In-Reply-To: <20240226124432.1203798-5-cezary.rojewski@intel.com>
X-Cookie: Function reject.
Message-ID-Hash: G3QJXZ7TR4IKL3MPPZ5YRH5G3KVRZD7M
X-Message-ID-Hash: G3QJXZ7TR4IKL3MPPZ5YRH5G3KVRZD7M
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G3QJXZ7TR4IKL3MPPZ5YRH5G3KVRZD7M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--5d8EE8aWTInID7GB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 26, 2024 at 01:44:31PM +0100, Cezary Rojewski wrote:
> Be cohesive and use same pattern in each error message.

Acked-by: Mark Brown <broonie@kernel.org>

--5d8EE8aWTInID7GB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXfa/IACgkQJNaLcl1U
h9B3RQf/UdU0M9FMYbw47kPs/ZdpM9qN/4dwPDRM5n4ZnxN33cVWytfI7w60ysye
ziXIITDE6a7V/A587Q/TV5NO8Ie1z09zImkQ74gdR4DdbuFmMT39wQyXPRJJsUab
qrvH10h7bJ1hBz52wBw/mNeLV5/hydr5Qh5cmlR5BLc7VxXPHC2ebBPJQsqBENce
/Jr1A8+pRLg2ObR0px7sX7g5oAMorzTn/GCLYsKx3rUFxiXBHXAZjO0MPM7coK1x
HzteTCuC3mfZ8IwYgbyS5MyjCHn/oVGgruDzffetPVK2+JLdb5l4tTwcarowYx1U
xLPD46/pS22hTsY3n2jlct4koCrlIQ==
=WiEM
-----END PGP SIGNATURE-----

--5d8EE8aWTInID7GB--
