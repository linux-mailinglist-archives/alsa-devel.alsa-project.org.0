Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F6E6B449F
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 15:26:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE46F18B1;
	Fri, 10 Mar 2023 15:25:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE46F18B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678458379;
	bh=56bPAkGLjknPj2uqVTwHmmRLjEUDYnki21opaM6odzo=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PKe6DoEVB4UGxdSA3JywCjNm+d2dom6oPgqevUy6+Zn+aehuCaPwWP6hdd2haiu22
	 VK+fkjBWserS3pMRytR0rqkuZ/Mx7oDHaswqKmAEIY7EPtldYxrjpfyWTLwPwecNW0
	 YrRMezUCmA+5G/Qw9XKCFdNjiPJg5D5hkWRDsjwY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 534D6F80236;
	Fri, 10 Mar 2023 15:25:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB758F8042F; Fri, 10 Mar 2023 15:25:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65D34F800DF
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 15:25:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65D34F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dx2jn1E7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8B223CE2912;
	Fri, 10 Mar 2023 14:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218E0C433D2;
	Fri, 10 Mar 2023 14:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678458312;
	bh=56bPAkGLjknPj2uqVTwHmmRLjEUDYnki21opaM6odzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dx2jn1E7p5m62JBNh9AdqCmAFJWc/7/eDTCh68EzesNusp/lRnQbc9s9miZnQPkwq
	 XQQFiD1OxTcaW/dMTMXHx1yVwqsXL2DkUX5VAt8kxsSgl6Ab5F88Axch4mcHyRkOKv
	 DYuhnU2l/VZ9tT8oOzpyQ7F/xgXLIonoQioUhd3IxQW8kotr4cqB43d2uoybDP8BLo
	 aJLfPhhYCww2zsUlCnVeqw/ZQVCysBnbSZ8xSE3BR6BzYmqga3961Z9kt0k240UJW0
	 4I11aEJqTwi5Zw8556ds68QwgfMNSl/X14YKeRktDoAQWDq9ziPcSAZ3bt/HfQUMeI
	 X75JZ0m90y59w==
Date: Fri, 10 Mar 2023 14:25:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] Revert "ASoC: SOF: Intel: MTL: Enable DMI L1"
Message-ID: <ZAs9xYjxo0byx2MB@sirena.org.uk>
References: <20230310133454.15362-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PtJBoBUncChtDcgE"
Content-Disposition: inline
In-Reply-To: <20230310133454.15362-1-peter.ujfalusi@linux.intel.com>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: NIVDPRG3PWGRB4XENTH2GR6VQT7X7F6L
X-Message-ID-Hash: NIVDPRG3PWGRB4XENTH2GR6VQT7X7F6L
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NIVDPRG3PWGRB4XENTH2GR6VQT7X7F6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--PtJBoBUncChtDcgE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 10, 2023 at 03:34:54PM +0200, Peter Ujfalusi wrote:
> This reverts commit 2b5a30cafb2eff4e6a34bc80b1d16ed6ca5c2c71.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--PtJBoBUncChtDcgE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQLPcQACgkQJNaLcl1U
h9CFKQf/YAfIMYKpTstvRQq+dzIRa0jS565um772F75K5QsHdrfxH7aTf6p9zdlL
OvauirBOMAveanm9lgp3RIHKpwQa+qWv8XK0J++rBe5zgMM/8wv6Wbuh+bivCeBJ
Wx09Dwg6PRK2N488fXZuDPBgqOfTj49OQIsQPc0bOMM8JuMLpN09PK6fr6AeR67L
ezydUelQhvXUkj528xNuEuvORXqW7ax8P/aEC9wqpw39bJBlc9KF3+kEFzmI3ror
fYCDi/3gKP4s5wa5qUY9bQrYGWn+UdphK8omkfQF4hYLB+Abh2NIHlNf44BcvDku
KBU4v2SpdsLUn4vHTcjsCUdFOXyJ6w==
=5bCg
-----END PGP SIGNATURE-----

--PtJBoBUncChtDcgE--
