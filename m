Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADF66E953F
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 15:01:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6902BEC2;
	Thu, 20 Apr 2023 15:00:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6902BEC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681995677;
	bh=CbmhJ3ZmVyg2k2Wza3FXUHP83EnEg08C0pPRDzyTo5c=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kGpPqtgZvHPVNpSd80yh7y69V0N3ynIjmrnfGzLnukjos8wd5jCJ6bCuqKMtjwFhk
	 xkX7pAad6qAKYkrygriYyphe0s8xjX0oowR4/Bzj59oKkU6I2Cla47MCrXFdgvCQZj
	 z+esvlrfDAF8UOHzHXX/zuxWf4HQnhsfl55A+KsE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C989DF80149;
	Thu, 20 Apr 2023 15:00:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 615B8F80155; Thu, 20 Apr 2023 15:00:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB679F800F8
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 15:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB679F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bAnJ6mgo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A6EEB612A8;
	Thu, 20 Apr 2023 13:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A9DC433D2;
	Thu, 20 Apr 2023 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681995618;
	bh=CbmhJ3ZmVyg2k2Wza3FXUHP83EnEg08C0pPRDzyTo5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bAnJ6mgoMDNZ3IS69NorlaK/rufDvakTN1i7fT5q559Ukqs3hl+WiRBur3cF6T74O
	 vISmrHH9rSPS9BEUt4DjfjA7n5Tc9obUVfJwQUucBA4Sez3TpKs3WufBtpROiWwolb
	 Wto99A1LUUgOYiD20XqGjDWc4x7pg9sSk4rGLgXTdU/ag41t8hZhVi2KbPwyqhGz8l
	 KWh4IymK+Ug9WONtMrPTMp5Hc2nuXiBc5R64rLKp/UA+znk5ZhjfIKhhxDmfAqTXXO
	 WjQ2cSueIwsrPTHlsNfV7QXo260JSHc8OHjA4OFSbw7Feh/cl9GytBQNYH8d00jO41
	 fvau9+erQLAgQ==
Date: Thu, 20 Apr 2023 14:00:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/6] ASoC: wcd938x: switch to using gpiod API
Message-ID: <d746ee5f-283d-44ce-b72c-18c8955d38b1@sirena.org.uk>
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
 <20230420101617.142225-2-krzysztof.kozlowski@linaro.org>
 <6b355201-a957-4fca-a513-d5fa0742fb40@sirena.org.uk>
 <fe6202ee-2552-8b5c-c2d5-f2f7042b901d@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PfnKUriuZ2R4YLEv"
Content-Disposition: inline
In-Reply-To: <fe6202ee-2552-8b5c-c2d5-f2f7042b901d@linaro.org>
X-Cookie: Above all else -- sky.
Message-ID-Hash: ZAEW7RBOZXTGKFLNKDHQFIJ3DOZPVTW4
X-Message-ID-Hash: ZAEW7RBOZXTGKFLNKDHQFIJ3DOZPVTW4
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZAEW7RBOZXTGKFLNKDHQFIJ3DOZPVTW4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--PfnKUriuZ2R4YLEv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 20, 2023 at 02:30:17PM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2023 13:58, Mark Brown wrote:
> > On Thu, Apr 20, 2023 at 12:16:12PM +0200, Krzysztof Kozlowski wrote:

> >> -	gpio_direction_output(wcd938x->reset_gpio, 0);
> >> -	/* 20us sleep required after pulling the reset gpio to LOW */
> >> +	gpiod_set_value_cansleep(wcd938x->reset_gpio, 1);
> >> +	/* 20us sleep required after asserting the reset gpio */

> > This is inverting the sense of the GPIO in the API from active low to
> > active high which will mean we're introducing a new reliance on having
> > the signal described as active low in DT.  That's an ABI concern.

> It's bringing it to the correct level. Old code was not respecting the
> DTS thus if such DTS came with inverted design, the driver would not work.

Sure, but OTOH if the user didn't bother specifying as active low it
would work.  I suspect it's more likely that someone missed a flag that
had no practical impact in DT than that someone would add an inverter to
their design.

> We were already fixing the upstream DTS users and I thought all of them
> are fixed since long time (half a year) or even correct from the
> beginning. Now I found one more case with incorrect level, which I will fix.

That's just upstream, what about any downstream users?

> > I remain deeply unconvinced that remapping active low outputs like this
> > in the GPIO API is helping.

> The code is mapping them to correct state. The previous state was
> incorrect and did not allow to handle active high (which can happen).
> This is the effort to make code correct - driver and DTS.

We could handle inversions through an explicit property if that were
needed, that would be a less problematic transition and clearer in the
consumer code.

--PfnKUriuZ2R4YLEv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRBN1UACgkQJNaLcl1U
h9ARLgf8DLC7sm26xjBonZJsiIb04p8lxnLkqb2sEIpOo1F5Wjc4SP5X97YAICDM
E/UU3m0cvSWhzwHCy6JhM8IeudyRAOdzUeg5mfDt6QSE/bhynllmcgA5lid8/3IQ
SPdchu68hQL8tsFn0QCtSapGBDfpHJ2Np0URhl/Ej4k/1Iij4uWIC9BNNg+oyGt5
Cj6wcxugplyc3Mjnb/qW263HNA6cDNXUl6zxNBkPckbdFhuTQGazigpv+sdA7ZFc
i4quuojHDlbkABb8Cs2oT/rYFH5hBLRVaa+2hwHWX0hLKPmzZSeqkMz7Xq9/2R4k
VXlD4DkgX5ctElHSCn/c3mVLzvaa+Q==
=ksk9
-----END PGP SIGNATURE-----

--PfnKUriuZ2R4YLEv--
