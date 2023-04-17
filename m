Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3910D6E4E4D
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 18:28:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BFB2AE9;
	Mon, 17 Apr 2023 18:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BFB2AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681748919;
	bh=WKjAMYMuM+y3ujS2vtZ+fs/f9P1qWkcq9QJHC90TkbQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zv7f688doRmK8KBu6DlBga7o0fI1E4cMqMk4b47wS8OiVGE2X+l11q2dvl7XmaivB
	 EDSudPR1AYiA1mzmPYBb0CPN9Zq6mVoqr8GGcSWAHVCn9/l0gKdqQrOx/0zdMtp8g4
	 14boFUNlMCDOiCdf8GzxtSYhcDNIQvl4eMgiL5MM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF7E6F8023A;
	Mon, 17 Apr 2023 18:27:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97E16F8025D; Mon, 17 Apr 2023 18:27:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54004F800E2
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 18:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54004F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lhHc/xfQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BDE4761C4A;
	Mon, 17 Apr 2023 16:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617B4C433D2;
	Mon, 17 Apr 2023 16:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681748856;
	bh=WKjAMYMuM+y3ujS2vtZ+fs/f9P1qWkcq9QJHC90TkbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhHc/xfQdwO+Y8MYWUNsWDjcCly/MMlJ3PNQhYTm4HKEO1NHDT4DA88DyoxH1fic6
	 i13misq6696wbT4xyfYvtEt9zljfUrEV9hnUzCBq0SyPVjWFIfN7NM88O6fn9cduVc
	 NRN3/cBMMWP5pX17i1s8waDfm1psZ9V1swMX95kMIP3yNDiW1PF/EEgSrEodz17gOm
	 JYlGcr/BiR7EVKcDMTpFf+MopbGhZpilrNoZPMjPw0vLzoSKMwy2Xl9r2T5XyRjIfe
	 vK7hDXvTCovNvrEYJwRlBxnkjhigHT3arTbRYtzkTNhLgPZbI2r+gkY7agyqSv2A4T
	 PeZJj8ScB7rzQ==
Date: Mon, 17 Apr 2023 17:27:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/4] ASoC: codecs: wcd934x: Simplify with dev_err_probe
Message-ID: <80be967f-b831-4a73-8474-09bb96bd2c32@sirena.org.uk>
References: <20230417141453.919158-1-krzysztof.kozlowski@linaro.org>
 <20230417141453.919158-2-krzysztof.kozlowski@linaro.org>
 <20aa9662-9cbb-4fbe-b6ed-3a6ba33e820a@sirena.org.uk>
 <c294d672-c2fa-7468-f02d-18d5230a1d95@linaro.org>
 <5d753a8a-b979-43f6-a403-8a51f69bac29@sirena.org.uk>
 <752c2dc1-65a9-a74a-d9ce-7db5ddbea5f8@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H+Aw/4yb0pHe+F4i"
Content-Disposition: inline
In-Reply-To: <752c2dc1-65a9-a74a-d9ce-7db5ddbea5f8@linaro.org>
X-Cookie: Two heads are more numerous than one.
Message-ID-Hash: GXBB4ORLCUAOBOCPGJPXD3MN2OWYLUXK
X-Message-ID-Hash: GXBB4ORLCUAOBOCPGJPXD3MN2OWYLUXK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GXBB4ORLCUAOBOCPGJPXD3MN2OWYLUXK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--H+Aw/4yb0pHe+F4i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 17, 2023 at 06:00:59PM +0200, Krzysztof Kozlowski wrote:
> On 17/04/2023 17:58, Mark Brown wrote:

> > You've replaced an unconditional dev_err() with dev_err_probe().

> Which is the core of this change... so what is here surprising? Yes,
> that's functional change and I never wrote that dev_err_probe is equal
> dev_err. It is similar but offers benefits and one difference - does not
> print DEFER. Which is in general exactly what we want.

This may well be what you intended to do but it's not what the commit
message says that the change is doing, unlike patch 1 this isn't an open
coded dev_err_probe() that's being replaced.

--H+Aw/4yb0pHe+F4i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ9c3IACgkQJNaLcl1U
h9BvZwf/a5vH9V/AMxblNgbtBRuqa5NmfkaQzg/ZNhgXcbrHxMBUEKvFPINPvpRH
nmZqDushKc2myJjrkKtC8cu+kOSM7pTcqh5BWV2uXYCWNhWV10uqeXIs6DQTmgvK
ySLJ4dHyD/jFSy702tJSE3cE+iQlSY1rYM9QAIaaJET87vvPYZ4TJLksWu0cws0y
i2ok1dm8fq7kdyOegG7X/zzDPgFgmKe2Xf4FoLrGKkwVqryyJt5sjHHxV9nWEalz
FVMAiakPgGVTpJkdNH5M58kIO9a41dIxfGPIembfGJrxQFaNg37qEv4xQO0+JTPB
L+lyV7oJqAkqoEBXt9O6c5eTMbtVTQ==
=7ozv
-----END PGP SIGNATURE-----

--H+Aw/4yb0pHe+F4i--
