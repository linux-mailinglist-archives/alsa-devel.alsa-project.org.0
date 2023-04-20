Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 750606E9B8B
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 20:23:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50DC1EB6;
	Thu, 20 Apr 2023 20:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50DC1EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682015021;
	bh=MC9bIJY5eEXpsBB/snWTb+aONBCQciptukUfqls2Dqs=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n5VdQyXeXyLfXouMa4GH+h2IKzeBe+8mgQsToALpWPDvMobJAz0IgF6c0e4+rSFTX
	 n6H3m0cEwuXq7HaIH52ShkmLrIjY5OY/PWbMmx0XLCOmRfpodEi5qgIjpIKgBQ9Bq3
	 HmKjeYV7QHgekzZJShLyb5jR6oi/R3J260wcGX9U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01AE0F80149;
	Thu, 20 Apr 2023 20:22:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9325FF80155; Thu, 20 Apr 2023 20:22:46 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 892CBF800AC
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 20:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 892CBF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=j0wtJUTb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 11C8C64B27;
	Thu, 20 Apr 2023 18:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF48C433EF;
	Thu, 20 Apr 2023 18:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682014962;
	bh=MC9bIJY5eEXpsBB/snWTb+aONBCQciptukUfqls2Dqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j0wtJUTbUJ9YsEcniesi3hoBs2Z4jnPDhAgHt6Ibdq8pHeCL4c9ZReNQAZE4DSLmD
	 2t7U1iHmlzBlrm+5haAFX3eoviviORlWRXMls+XSUIUPvm5dvVb1pY5/Qg0VEoY9fi
	 kzFoG8v6wEmuqZG739tXKgncuJjOijRBnZwjrFI3xR/PztHKhqHg0UeJZOnV0I5B2b
	 cQHfIY52eWYlGTGHJ7ZXVXI06KJWqlrTwvk0GxJosCLBnlR3vj/j9N/5pW3dA1L+1T
	 GIFGp0HwUrI4jDWNKXmo5uwm55/foTX+cpzglHMpNJCJhwKeGi2b+i7hrFKwB470LZ
	 u6E3JqOvq9RaA==
Date: Thu, 20 Apr 2023 19:22:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 3/6] ASoC: codecs: wcd938x: Check for enumeration before
 using TX device
Message-ID: <3fa4060d-919e-4e25-8afc-09d3abd13575@sirena.org.uk>
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
 <20230420101617.142225-4-krzysztof.kozlowski@linaro.org>
 <dfe88b94-215b-a86f-60b4-25d2f9ea0e5f@linux.intel.com>
 <41daab8e-e116-83b3-234f-ece43817a0f5@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SQnoPQeFBM8vzH9P"
Content-Disposition: inline
In-Reply-To: <41daab8e-e116-83b3-234f-ece43817a0f5@linaro.org>
X-Cookie: Above all else -- sky.
Message-ID-Hash: QN7TPAJ5SEQQ6QLRJQW6SD4QXYHRJI4C
X-Message-ID-Hash: QN7TPAJ5SEQQ6QLRJQW6SD4QXYHRJI4C
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QN7TPAJ5SEQQ6QLRJQW6SD4QXYHRJI4C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--SQnoPQeFBM8vzH9P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 20, 2023 at 07:57:11PM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2023 16:18, Pierre-Louis Bossart wrote:

> > the alternative is to move regmap to be cache-only in the probe and
> > remove the cache-only property when the device is enumerated.

> The driver wants already to use the regmap in RW just few lines below in
> wcd938x_set_micbias_data().

> I guess I could move this entire piece of code to other place...

The register map is fully writeable (modulo any volatile registers of
course) in cache only mode, it's just that hardware access is
suppressed.  The driver needs to resync the cache when transitioning out
of cache only mode (often in a runtime PM resume or something), this
will ensure any pending changes make it to the hardware.

--SQnoPQeFBM8vzH9P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRBgusACgkQJNaLcl1U
h9D0RAf/cROt/EeqDKM/NmkHJJDxGDcNFwm4k6RUHi9dOYZHqRhsCfzoDktJPj/z
wIEQ4EinB1hj8064fLv0H3lwO4R9neyrRKWn7dPxL3wVIGPN1bzsau1QGwxkCvec
33tnNePJcfiGFNRU1/ibgl4pYack71zaiJgNHA92iS+1Efhn5aaN1DbwCXgP6Acg
LMnIBYG5IMJaw/iXuQEs3lfKeF4y7WZicAt1TTVFuIYbmVTh79gS01oaW4xeSr7K
SGXuN5MgxfrlS2vzl82LshVuHRiyXKtBf//XvEDGHyJ+5NsIURh6XLOZbSMex3mE
Efb5MyFOTtq7X99b1Qhisc0TUyp4Aw==
=WZyC
-----END PGP SIGNATURE-----

--SQnoPQeFBM8vzH9P--
