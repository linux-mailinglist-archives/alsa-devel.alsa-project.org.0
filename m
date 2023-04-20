Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E846E9387
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 13:59:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D4C0EC5;
	Thu, 20 Apr 2023 13:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D4C0EC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681991955;
	bh=8QMlE5Zx8DCMIClYMX9SMYQfx5Q3HK4Ce3RNNDoqSKM=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rf9OQHfJKVUOMubRLSKI90j8wIPgdwClV5O5N6de3D8536zPickhUN71iXEqE9ZyG
	 5NwXKdBT+7sL8samVoG3qfH1A1Xsw0EehrRkBgXI5MfNX01gE2Kzfl5noo0rFwkgpF
	 SIZymhncxLcIPvtTwuUIsRzu7j39yiQX4g5hSo8E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B71CF800AC;
	Thu, 20 Apr 2023 13:58:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41B55F80155; Thu, 20 Apr 2023 13:58:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB120F800F8
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 13:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB120F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uusm797c
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8BA3164895;
	Thu, 20 Apr 2023 11:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF67C433EF;
	Thu, 20 Apr 2023 11:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681991895;
	bh=8QMlE5Zx8DCMIClYMX9SMYQfx5Q3HK4Ce3RNNDoqSKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uusm797cmi4abghVByv4IJFJJr2wT6e9ov88XGGFZ16V3lQaePswCkfdBGoerBi54
	 SfhQ8A9xeSYLDzbTcpjN0d01pnJxAPWWLP6FbHUzihAaHsijc5NbnXkuaNrScqpgNn
	 6zRwGT3xy1jglp8I7yuSy9lpihbE/xSh0O8BoHLf6Nz0MkrHLdTQmbwcgngMr5XJ3r
	 54lW4dRiqrtHU6KDpdTAfC8JJN2aSQwi4v7yS2E0oa3SLbiJggxBcX/8HioP+0k1rG
	 YtWmxoPCOcX1ehOHP4ikMPLDQJXWSWqo6M16PadCHZow7i4lo5NaM57xVI+p3GHRzQ
	 PS+P3I4oMJnvg==
Date: Thu, 20 Apr 2023 12:58:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/6] ASoC: wcd938x: switch to using gpiod API
Message-ID: <6b355201-a957-4fca-a513-d5fa0742fb40@sirena.org.uk>
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
 <20230420101617.142225-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vqfNoi3NLhep8mlT"
Content-Disposition: inline
In-Reply-To: <20230420101617.142225-2-krzysztof.kozlowski@linaro.org>
X-Cookie: Above all else -- sky.
Message-ID-Hash: 2R2IM4RT577YJXEPEVAE6TVSW3XNTTVN
X-Message-ID-Hash: 2R2IM4RT577YJXEPEVAE6TVSW3XNTTVN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2R2IM4RT577YJXEPEVAE6TVSW3XNTTVN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--vqfNoi3NLhep8mlT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 20, 2023 at 12:16:12PM +0200, Krzysztof Kozlowski wrote:

> -	gpio_direction_output(wcd938x->reset_gpio, 0);
> -	/* 20us sleep required after pulling the reset gpio to LOW */
> +	gpiod_set_value_cansleep(wcd938x->reset_gpio, 1);
> +	/* 20us sleep required after asserting the reset gpio */

This is inverting the sense of the GPIO in the API from active low to
active high which will mean we're introducing a new reliance on having
the signal described as active low in DT.  That's an ABI concern.

I remain deeply unconvinced that remapping active low outputs like this
in the GPIO API is helping.

--vqfNoi3NLhep8mlT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRBKM8ACgkQJNaLcl1U
h9CEewf/XEC8aLgWsBDB68psO5wv1ThhV486/JVRhSBnT8ZjXhUzNDx256WlTY2F
SBX+O79Y3aZNZF+SB8XXyVaR816sBKuOd5+XedRI3hrjr2cagr1xnVc3d4JW1X55
+hEVZgyzuqgeq+69p8z9mUxuf3loD9migmJ2m/1IqST8ZjVszErvkCxFeSgewWCz
2WedShr3yGyFmmkqT6BDyjFkPwfKfGbBzpT6yZy9L+C0pt7+rG5VNOSs/J8DWkPq
9S+NBJ0lsY7nlWIEOFS8FtkO2iRxNzVZOzoHDdge4IILLRS9r+9aX2xRmMpHqh2p
uG6xvVDD7fZaOvgTy6XpO3HQfHdy8A==
=ERq/
-----END PGP SIGNATURE-----

--vqfNoi3NLhep8mlT--
