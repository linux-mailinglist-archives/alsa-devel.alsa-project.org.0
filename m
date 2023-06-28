Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C4E741767
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 19:43:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B0DB74C;
	Wed, 28 Jun 2023 19:43:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B0DB74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687974233;
	bh=lqDFjemWmplk7HOK0FDXsjyFPEZ6trWi4OmRwLFV/5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=thJ/ObVnysJOcz09WvNx0iluOeZrM08ulz3iBLXJjyKLh8d8sT2NqUyB3W4uK7dEG
	 CYArnk+OHpAcJ0eLtpKaBVRs5gKt+k2RhDQNMT3UG6mb84OHBe6Zvz1bQJo5/mXd8T
	 qkAgB4Us+U+qbEQ61623LpQ9AMfp8zQ+w39iU+Xw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90076F80431; Wed, 28 Jun 2023 19:43:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33DB5F80212;
	Wed, 28 Jun 2023 19:43:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DBA7F80246; Wed, 28 Jun 2023 19:42:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A38BF80093
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 19:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A38BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Cm/4DEX2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2479D61374;
	Wed, 28 Jun 2023 17:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D93C433C8;
	Wed, 28 Jun 2023 17:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687974170;
	bh=lqDFjemWmplk7HOK0FDXsjyFPEZ6trWi4OmRwLFV/5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cm/4DEX2nbNEK3Lyi4lprLSxrrS6BvJE6GZxSx4V7hZoBmtsObVCdDFxffScaEzoU
	 zpoKJDIHPrv6LznJN61cXRAx+tK+xTUHZGrP6fJaMg1HTTK0wrM4fjUCOD7I2707co
	 4uezjJdsVDzYBI1dEV88F0nduy1MZH3/lRdNG/NzkTTKCCZ7u939C0msw9J9gnnC2/
	 5J7ygqQM6/o0Fxrz+IGMxSUfY+9ttOYaWuvg/uqXTdmnAoaGiRi8mnnpX8qUArd6nd
	 1MZ8an89pGr3FubGz43ikVU0pklxkUT+Y2mtsO7c7dUKdD/Z3d4qCC1tlxvpPhcizy
	 ze6YsJIw1OBDg==
Date: Wed, 28 Jun 2023 18:42:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
	robh+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/3] ASoC: qcom: q6apm: add support for reading firmware
 name from DT
Message-ID: <bca929a1-03bd-4854-872a-07060e483d1b@sirena.org.uk>
References: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
 <20230628102621.15016-3-srinivas.kandagatla@linaro.org>
 <f71c8d2b-d5f4-42bb-932f-5b9ec6117ffc@sirena.org.uk>
 <b2aef484-71c9-5655-c1f8-ddde57687491@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Iw1MrnpkR98xnaXf"
Content-Disposition: inline
In-Reply-To: <b2aef484-71c9-5655-c1f8-ddde57687491@linaro.org>
X-Cookie: HELLO, everybody, I'm a HUMAN!!
Message-ID-Hash: FO46OOCDM3UZBFTE3ZWI43CN7WOJ5JIZ
X-Message-ID-Hash: FO46OOCDM3UZBFTE3ZWI43CN7WOJ5JIZ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FO46OOCDM3UZBFTE3ZWI43CN7WOJ5JIZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Iw1MrnpkR98xnaXf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 28, 2023 at 05:30:15PM +0100, Srinivas Kandagatla wrote:
> On 28/06/2023 12:53, Mark Brown wrote:

> > Why not try a series of firmware names/locations generated using the
> > identifying information for the card/system?  That way we don't have to

> There is no consistent way with the current state of what is available in
> linux-firmware and what drivers can generate from DMI, atleast with Qualcomm
> SoCs.

What's in linux-firmware now is not relevant, we can change that however
we like.

> Example for x13s has all the firmwares are under qcom/sc8280xp/LENOVO/21BX
> for two models 21BX, 21BY.

> However none of the DMI properties match exactly to 21BX or 21BY.

> These have to be either derived from product name 21BYZ9SNUS or some other
> dmi properties.

> This logic is not going to be very reliable, can differ across platforms.

But the goal here is to have platform specific firmwares so that's fine?
So long as we come up with something stable and platform specific
userspace will have the information to provide the firmware it likes,
even if that does end up involving a lot of symlinks.

> All of the qcom platforms use firmware-name from DT to get the full firmware
> path with name.

> I know this has scaling issues, but with the current state of things, its
> the only option I see.

When you say "all the qcom platforms" what do you mean, you're proposing
a new property here?

--Iw1MrnpkR98xnaXf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSccRMACgkQJNaLcl1U
h9BRrwf8DRcauWHVO26sbyrZZ2DD0opRH8+s+6Omd6fL+MKJ8WXwMYpBKHxfHWFU
2LchHvPwo+UVu/lj6qhkOM/B3RV8yt0VK1yMpjcKGEPqJWIQn6dH9lEIcnCnVmTU
dIkoxX4fd0FjNthvyVBqjuzKHkHQsaanWH6S6zz2KtDRThROD6EuaJv4ODfOGYST
55BSX3JIZ5rTOVhCsT9fMLCpK353CHOaqrO7xd4UdGDRoLYP8gNxIivjZPBBKnBy
SEAtK3SVxhNBv0xRTYivVY0yvIBjf/XyVRuDrRlllCywc9vTZRDEYT6wXFfcyQ5z
yS96KgbdGB1uTs/blOMFnzxh1peu+w==
=/Cgk
-----END PGP SIGNATURE-----

--Iw1MrnpkR98xnaXf--
