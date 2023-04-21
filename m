Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E626EB300
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 22:45:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A28AEEA3;
	Fri, 21 Apr 2023 22:44:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A28AEEA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682109902;
	bh=O9H9MxgRW6KOQIYGXkSs8nkTQlTq0OzApBiCkxxpuMk=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qkp5Fy1u6OvFVQ9LHYJZXkN6rFoKFNvsjL8LFFku8EdUSTkyv6xewe1lFRcHSvmeL
	 zE/3eMdzvPk/FI5JotiaguHvcPLZwvXLWVwIoIu/jECRtjTtIhxPLY4jfTVmkkDBXd
	 I/lvG+syJpuNC4cT0ja6VKSVgq7u9jFOski9eJ0w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25584F80149;
	Fri, 21 Apr 2023 22:44:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 792E4F80155; Fri, 21 Apr 2023 22:44:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A65DBF80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 22:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A65DBF80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ScWKZM8H
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 89E936120F;
	Fri, 21 Apr 2023 20:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C031C433EF;
	Fri, 21 Apr 2023 20:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682109843;
	bh=O9H9MxgRW6KOQIYGXkSs8nkTQlTq0OzApBiCkxxpuMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ScWKZM8Hco7EZtF+nFcPu3plaUfBE3Mxz6PCZ2roMyf2P1unnASz8kf4eMgRsl/ds
	 Hn3XfFOf3UKeYLavRnG2jJF0jIGF+2CmaayKpWW/HX1DLun47HMfXQitMf7iSAKyoZ
	 A+8MNCBGrXv/EOqExeY8Wawz17iskQNC3jjTdeLaozwZ+xQoVXrVjJqZqpWDyznp7t
	 24RYHJkQxS0v0QeN3QQKeGnAioAEpL2vcioiainj6hhw9Bf7mlqJZ6CDrMcdtNW9Gh
	 Awie3n22NgXRrHwYmfji/DHpmHWvj9NKDfFATpbBuiuALbFSpu7Gzo0VzPE+e9k+MO
	 RN9fumZXorHUg==
Date: Fri, 21 Apr 2023 21:43:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: max98088: make it selectable
Message-ID: <444ed682-9c5a-4d5b-8ba2-f1954c7719c5@sirena.org.uk>
References: <20230421200127.16234-1-fido_max@inbox.ru>
 <aa022833-2380-6a6f-6d7e-47b0098ae18d@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cBzkg3h4cAvXV0Fv"
Content-Disposition: inline
In-Reply-To: <aa022833-2380-6a6f-6d7e-47b0098ae18d@linaro.org>
X-Cookie: Hailing frequencies open, Captain.
Message-ID-Hash: JXKC7WELASBAX6CLA3P23LVOUI74IGBV
X-Message-ID-Hash: JXKC7WELASBAX6CLA3P23LVOUI74IGBV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JXKC7WELASBAX6CLA3P23LVOUI74IGBV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--cBzkg3h4cAvXV0Fv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 21, 2023 at 10:41:00PM +0200, Krzysztof Kozlowski wrote:
> On 21/04/2023 22:01, Maxim Kochetkov wrote:

> > There is no way to select max98088 from menuconfig right now.
> > Add a Kconfig menu description to allow building the driver standalone.

> Just like many other codecs used in embedded designs. Why exactly this
> one should be user selectable, but others not?

Not all drivers are capable of interoperating with the generic cards,
some require things like specifically programmed clocking setup.

--cBzkg3h4cAvXV0Fv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRC9YwACgkQJNaLcl1U
h9BA3wf+J8Ec6tLNV+iem3g2W+waPmxDKO+2HqMRykMghD1JLGSinHndsGXVP5U9
c98w5/rc15PP112OMMhJuwKw0ZunNSQ6WSP8c2YXhapVfKuSUMtATIzNzpFNUXKM
DpkvbRohzTqnP0sdFHPJ+wQeQdQlVHBbsQt5aZE20fzXgcqJiosk3R+8KvfI2qwO
9S50vAIFdJ0cFxJszQCHR4CyyYv02TK2VL10BEsncxqpUw3ZkpoMBh6jliRCFdY1
EGSTWt8nYNCFJtlPQIN+INbMxiwCknwTHazvo7OWkcuUzoCgfln9s7+on90uQJT4
n4VoZ0CHdb/RreCBkPPZeKGp0hVvhQ==
=jBYP
-----END PGP SIGNATURE-----

--cBzkg3h4cAvXV0Fv--
