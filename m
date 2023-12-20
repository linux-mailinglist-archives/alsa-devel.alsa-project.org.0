Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6B781A6E2
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Dec 2023 19:29:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E272C1FC;
	Wed, 20 Dec 2023 19:29:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E272C1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703096989;
	bh=bwfx1VrVY/TB4NsCugn+B4teBHmThgHszcjdmmNdGtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YXUnrmO8Epn4k2iIW6l0bfI0rlcfTPCQgKhK3AlylskS5TTbMbKkyC+qkkcsGqeEj
	 XBPaWsChSizNJWsHxJffPMWTcrAzQxLnQRJi6L+wOhRUiyll2V9UkFZ+y/TbtoV6s4
	 6AJP5KTs42X/xDJ8qolHdpl8A+FKawcA8oQ2g0GU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35983F8057B; Wed, 20 Dec 2023 19:29:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6BDCF80570;
	Wed, 20 Dec 2023 19:29:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F09DF8016E; Wed, 20 Dec 2023 19:29:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 254CDF800D2
	for <alsa-devel@alsa-project.org>; Wed, 20 Dec 2023 19:29:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 254CDF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AeGZaNVc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 07F23B81A3E;
	Wed, 20 Dec 2023 18:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51684C433C7;
	Wed, 20 Dec 2023 18:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703096945;
	bh=bwfx1VrVY/TB4NsCugn+B4teBHmThgHszcjdmmNdGtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AeGZaNVc8nIoIRi5bdfhEOv5SnQ3PAoOnWrSLFIalUohTAEGNh0SSvA/Vo/Yc0JaH
	 nlf+xJF4LeO2E4LBVyefLUbJDwV9aLQwBJKjvAH2dlHMmhoIG+R06T3IwZtzT4SEbC
	 ZTWhMZ7jeV0Tyc7gofnm/+fCAG4o/ii6b8y3jhdg2Di88P8zyCDGXd3w83agGUwRU2
	 +3PWY44u6ErbN8tWzTgMxhXauc3WHONHpTkDXGBOb/OwSXbXUvNz0BaoQ2Fxe/h4kR
	 +pSbrumyilR6B9zqWXQXMLANLmIaeYXC8CyDw9poFpR41VnJS4/6RgYsocvzzsG/W5
	 UWm0LE0y8wYPg==
Date: Wed, 20 Dec 2023 18:28:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	tiwai@suse.de, vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Message-ID: <f555a9f3-2c84-4cff-9eed-725514fb443b@sirena.org.uk>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <5b8e74ad-460f-4e68-a17b-3131d810f29b@linux.intel.com>
 <ZXOPWRWvrRddOWpT@finisterre.sirena.org.uk>
 <700e564d-7e87-463a-a764-c4713ddf11cd@linux.intel.com>
 <bec481f0-5361-4090-b69c-1123f83ac8ac@sirena.org.uk>
 <f24a2a89-3d8a-4a6d-849a-cddbae4c1e03@linux.intel.com>
 <20231220151631.GD14858@ediswmail.ad.cirrus.com>
 <546d698c-3e23-4a92-9081-f1bebd6b33ae@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C8sfTuKxQW1uWAiD"
Content-Disposition: inline
In-Reply-To: <546d698c-3e23-4a92-9081-f1bebd6b33ae@linux.intel.com>
X-Cookie: Apply only to affected area.
Message-ID-Hash: ICZJG5EETZE7TSOZRZWEWMAQOCRAZOLO
X-Message-ID-Hash: ICZJG5EETZE7TSOZRZWEWMAQOCRAZOLO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ICZJG5EETZE7TSOZRZWEWMAQOCRAZOLO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--C8sfTuKxQW1uWAiD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 20, 2023 at 07:26:24PM +0100, Pierre-Louis Bossart wrote:

> Put differently: is there any sustained objection to the proposal of
> extending regmap with async BRA transfers?

Not from me, and I agree that it makes sense to do it once the
underlying SoundWire bits are in place.

--C8sfTuKxQW1uWAiD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWDMmoACgkQJNaLcl1U
h9BjQwf/dNHgBeN2zx7LCtcnwVHRQNvrDRedglZRXkijstSryyabkdcC0CyMyhjr
b/B0oi8HSbl988Oo84IweKRh7xzSS5Gh4hD8r1iEHYpSO2/Jhi1Bkoiv+bRyaUrx
m3XvTepWfmSZHQNNigiq/wdtl6zbY5uKuxEiTxIxkIJohIdm4Nwq8Cfrr0t/Ew7i
thuk7rc8n/QO4KY3+csruF482kDATXr1wCJEo4wzs/jgDa8nRNiTUju/74XfUzG4
5RAwx9bZZA++FgDLuODqlbDIXmngSStPp95xVMQThceYiH1cSA5PLRXbcW4rWi7b
jJXiYlibo8+z+wBYcc2pjzCTbHGBqA==
=j7/c
-----END PGP SIGNATURE-----

--C8sfTuKxQW1uWAiD--
