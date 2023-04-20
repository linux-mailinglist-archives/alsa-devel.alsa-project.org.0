Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A6D6E9A86
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 19:20:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06463EA6;
	Thu, 20 Apr 2023 19:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06463EA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682011219;
	bh=OWzPbivqRUEkhrItNBGzj3uBQBlq9cqwvTC3adE53q0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=if/z3xHjmbIxRs9Ar3WryZZaS4nH/uMeazK9PBKc07VC4REcrWXXYYgU8SuW6LVyJ
	 GgMdbFmS9+YcHbHmkYd1LbiK4NISnpk4UKexvmu/AJ0SWRjeI+EpHVlI85iu6PGb5g
	 7A7DNCye5qLhd519qckqIKi82Ga5aDStg3Mnhc4g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48A99F80053;
	Thu, 20 Apr 2023 19:19:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2758CF80155; Thu, 20 Apr 2023 19:19:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAED7F80053
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 19:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAED7F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SQkPpxk0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A60B4632CE;
	Thu, 20 Apr 2023 17:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E8FC433D2;
	Thu, 20 Apr 2023 17:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682011159;
	bh=OWzPbivqRUEkhrItNBGzj3uBQBlq9cqwvTC3adE53q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SQkPpxk0F41RWEvt9mZlhml/5Ue2gMvM3/0Y+EGA9DRDe3CHJA6Q3ZmfLz58rRkIr
	 gG2bFuwUZyJKO/HZhWbKYX4rASVX1W01ccvAva2p1Cc+jTgA4XHn0WpdgSFi4HL8kg
	 +k4E1/XIkd85hm3iCThlryDuaE2QGxRNpnvh25uNusC5NhamQrl5nR+a4BnN3BRl/E
	 czd7vpZLtLzhQ8V4MSKCwf9jRpnbUFedXZwJ6wiQ0eFkgoQkrJePOtTYXSjWe6tVzJ
	 teQIcXV9cbGXlieQm0MiU5eiwO2D7xXptKXHSZoUriqXnV/XXq5Oz78JgtOXgi0aqp
	 vPrh3brRNy3OQ==
Date: Thu, 20 Apr 2023 18:19:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/6] ASoC: codecs: wcd938x: Check for enumeration before
 using TX device
Message-ID: <3147a427-f6db-45cd-967b-dba1b9ff8bd5@sirena.org.uk>
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
 <20230420101617.142225-4-krzysztof.kozlowski@linaro.org>
 <dfe88b94-215b-a86f-60b4-25d2f9ea0e5f@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UlUxRv2aKVH/fZyf"
Content-Disposition: inline
In-Reply-To: <dfe88b94-215b-a86f-60b4-25d2f9ea0e5f@linux.intel.com>
X-Cookie: Above all else -- sky.
Message-ID-Hash: A2PID6HKXMKEPP2FHO5CK7OXVCETQCDY
X-Message-ID-Hash: A2PID6HKXMKEPP2FHO5CK7OXVCETQCDY
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2PID6HKXMKEPP2FHO5CK7OXVCETQCDY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--UlUxRv2aKVH/fZyf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 20, 2023 at 09:18:15AM -0500, Pierre-Louis Bossart wrote:
> On 4/20/23 05:16, Krzysztof Kozlowski wrote:

> > +	/*
> > +	 * Before any TX slave regmap usage, be sure the TX slave is actually
> > +	 * enumerated.
> > +	 */

> the alternative is to move regmap to be cache-only in the probe and
> remove the cache-only property when the device is enumerated.

Right, it's generally a better approach unless you need the hardware to
actually do something immediately - if you're just setting up what's
needed whenver things actually get started then using cache only mode is
much less complicated.

--UlUxRv2aKVH/fZyf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRBdA0ACgkQJNaLcl1U
h9DeLwf+PvFmR3k+omskMKofJfXaRqx9gNhO1EIxPyysnIvGc8wp1CjH0rSUBHDa
/AurDZBZQ2WDs5jx9E0QumJHVU+EG+Jr8n2hVCCdEv/QkRSEPV5A2ozhxHG7JhBy
+WqEZ1CdQE7b8L0PiKqEcsJrRoWSnA6UN15mWBpxlztInIDkmqSKTd6u6JyylH75
wcLspRhFTeT4HA4aQC6adaQNa4OgI5x7uDFL9eHVSrqUnug4KPRI2aGkafizjdtd
F2bMA+NTrX9oVu4FhDWyMTUzGtRPJA1A4SKUqVFe5oIY5f5UXaBdLeBq2ew7ToQT
tmufOOhU+U1jpP1CoA5QDQMaTRkjnw==
=o6u7
-----END PGP SIGNATURE-----

--UlUxRv2aKVH/fZyf--
