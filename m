Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3D16A75E0
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 22:09:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA03F1E8;
	Wed,  1 Mar 2023 22:08:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA03F1E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677704962;
	bh=p6qGjDoDT+44oV4iOiUYUowNT/TFjvtfCr2WQQ5zZJE=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LTWdkmvNELBQdeJWRGHx6BCcXj2WKunFeIHUaAIlh+vP7kvfoSozcF5iRK/qqJmf3
	 0PYFYofJ570ND32VQsJ/Upp0uoGcLNVa+Fdkzt4Lq0z/uQuJ+NE28+MRsnEfrT+n68
	 tSjxZe7oliefrQIUU3xchgMZPbwHn76PNH6mwSOY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 239BAF8051B;
	Wed,  1 Mar 2023 22:08:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E1A8F80520; Wed,  1 Mar 2023 22:08:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0276BF804B1
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 22:08:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0276BF804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AacK8/b8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA8E96142F;
	Wed,  1 Mar 2023 21:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B4AC433D2;
	Wed,  1 Mar 2023 21:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677704894;
	bh=p6qGjDoDT+44oV4iOiUYUowNT/TFjvtfCr2WQQ5zZJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AacK8/b8OP2n3hOU48sDUVulKN3hqjiXm4CFUgRhyaHzqPyYqqf5AnhgWwoynJut/
	 TG1cQmkoTnHh3X9wClTdPwPRf+dS3dYLf0UEJYUv7Shf8s0iS6QJWoU8D0uN2h9s6/
	 rWCD6nut18wMtty4Qc9D7Ye67zF1RNGPueNE94PR+234L2cKwcOEKNwnXrya+l/HVB
	 fp6hWNmgamv4F0/VzytypfzvM6fUus4qzfE+E0JKPlMgUHo9twOOVMLTBcp/jmUZTo
	 mMR/iLAUpQx3AZTwp8xXfdwIKQ1yl5Uwl9u7KUARhTuznXZs5+WjAXfkuTzH5F8xq2
	 3AnJnsgogRA+A==
Date: Wed, 1 Mar 2023 21:08:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: wlf,wm8524: Convert to
 json-schema
Message-ID: <Y/++uAN53uxRf93i@sirena.org.uk>
References: <20230227091938.1671416-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="72yOwOM5yKv3D7VK"
Content-Disposition: inline
In-Reply-To: <20230227091938.1671416-1-chancel.liu@nxp.com>
X-Cookie: Life -- Love It or Leave It.
Message-ID-Hash: PAB2UXSTDZODXW7VTEFKORTMFXXO5MGY
X-Message-ID-Hash: PAB2UXSTDZODXW7VTEFKORTMFXXO5MGY
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PAB2UXSTDZODXW7VTEFKORTMFXXO5MGY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--72yOwOM5yKv3D7VK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 27, 2023 at 05:19:37PM +0800, Chancel Liu wrote:
> Convert the Wolfson WM8524 24-bit 192KHz Stereo DAC device tree
> binding documentation to json-schema.

I've queued this, no need to resend.

--72yOwOM5yKv3D7VK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP/vrgACgkQJNaLcl1U
h9Duywf/VGO9Z1UIpM9orCVmcjeFQkaNL2qivXVVAaH5fpnvmcT76lulq4YD9kXc
29dBThZA64N0IAWauaalgUs0Mng4w8bKmDjkv3tsUNi+luChrgf+8Lap3ImOh6HL
COYTQvw1qK9mP6PbeRtho5NWvCtNsOfbdouws0ti0hYEVaX0tzz25Rkp+X3h/A8v
yCTJlkO9YN8X7Ghsy5gRvwnFsmrxFoD0p//VA8zqA3waweb2DEnmcwqDsxfdUKUm
5WUvi/hUwj1BkN9I6ppzVbUN2CQs6T7TRScTgQtbvrwb/mWL7nyOuhJyDx8CLV9w
Iswoxkkyzk+yJyW2sDR8jhRtqy9K1g==
=1kFC
-----END PGP SIGNATURE-----

--72yOwOM5yKv3D7VK--
