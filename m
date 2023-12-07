Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3351A8095FF
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:57:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E5ED83E;
	Thu,  7 Dec 2023 23:56:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E5ED83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701989827;
	bh=Gk4izPLJryxMUzNd/B9l1Pz1NWeIrxzkdQLr+umc/kA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DEbFcMslG3T7SF3p0vWCecENeru0JmWQyQO019wc6xfr5F2pcfihVtKhlNTFkmB0k
	 GumcQVSgoze80mG0qRa5f6gt3cgNC2+FXiT+j2+MOjx6To01PlLdVArc3IMmytkFHR
	 snE82NOfAr1VY/a5HuzaPnvpmj6spKZx4nXWjKZU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0F3CF8057D; Thu,  7 Dec 2023 23:56:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D746F800D2;
	Thu,  7 Dec 2023 23:56:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55AD1F8024E; Thu,  7 Dec 2023 23:56:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A89DF800D2
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:56:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A89DF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=T4zvvZUe
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 07D6DCE258B;
	Thu,  7 Dec 2023 22:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1597C433C8;
	Thu,  7 Dec 2023 22:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701989781;
	bh=Gk4izPLJryxMUzNd/B9l1Pz1NWeIrxzkdQLr+umc/kA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4zvvZUe1aof6SXqLH99lYfNvR3nBI1MUfVzUoq5fY1DoFL2bnyKzBKDOSvpXHZfY
	 72f4gdW4c4yJMm+NTxGyejeytMwAP+zmhplLQTe555tT9u71+oxO2LHF2HTHB2wCEa
	 rrD35ymKIrmXA17VMf1PmBvgzL6fRxaTIXnymu1ieqrBEBhg+9OKKqGiXP01C4SvL6
	 MszTP5Oo4tY+bOcG7TVdp5pdB3+A8TA42F9/DBUILcXPgOsfYRD6xu2blqzbNtwFvk
	 rtlDNRMnctxDCvL5Hke2xQCsd1ffu8MYjZ2SocKWvRY3VlsRVb4TcdQk9NirgMC24r
	 4PxywW6dMmVQQ==
Date: Thu, 7 Dec 2023 22:56:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	vinod.koul@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 00/16] soundwire/ASoC: speed-up downloads with
 BTP/BRA protocol
Message-ID: <eb50a35d-9d77-48c2-ba76-bf5c1c3f1959@sirena.org.uk>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1XLs3TFacXRp3blk"
Content-Disposition: inline
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: Two is company, three is an orgy.
Message-ID-Hash: 3XBNJKLJSOGUW3F5LWKLVLX2NZTEVWZP
X-Message-ID-Hash: 3XBNJKLJSOGUW3F5LWKLVLX2NZTEVWZP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3XBNJKLJSOGUW3F5LWKLVLX2NZTEVWZP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--1XLs3TFacXRp3blk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 07, 2023 at 04:29:28PM -0600, Pierre-Louis Bossart wrote:

> The MIPI specification and most of the new codecs support the Bulk
> Transfer Protocol (BTP) and specifically the Bulk Register Access
> (BRA) configuration. This mode reclaims the 'audio' data space of the
> SoundWire frame to send firmware/coefficients over the DataPort 0
> (DP0).

So the bulk register access is accessing registers that are also visible
through the one register at at time interface, just faster?

--1XLs3TFacXRp3blk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVyTY4ACgkQJNaLcl1U
h9CPsgf+Nv6pIfHfZ2c0n0F2CCuIV+9NeaccprxAy2mvTo+tvoLIo58KmmqNdrHn
D4ENuSDWyDXCu0qOc9szZlOZXFZGZ9iDVRIs1M9KjhEBp4lU4F6mGofRXyDOoQim
h50/WaoCLmNG/U5wu2Q9lrpnidrY0sS8gZTNwXFFTpwqOwQLeasdXbD+iKRd6T/g
Ph8VyAeSHcOMucuaaq2RoH1MyjO9OFNsjeUE+eCIwHcZme6rOAIhBRmfOBUjhBeO
hhOhTW97ZrsvjkXlZq+/VLrZ9rzlBl+N1qJcGYpt4vfXcKllWaYCumt3Ds8EWa7x
3ogKAU0HoJwuAvg2txUUgpGdm+aqtQ==
=YcQ/
-----END PGP SIGNATURE-----

--1XLs3TFacXRp3blk--
