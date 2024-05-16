Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 713818C75DF
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2024 14:18:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8A84852;
	Thu, 16 May 2024 14:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8A84852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715861936;
	bh=xIBvgUA3GxPMhfgmzaW4zOWO/kjFOkYCDtn0FkIzZSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=esXM/sB49yO8+N1koOc6Zxqyp2+qvUZR91A5bBhpZvIxLjEFomxkHoqslmUWmqi6H
	 1oT3kwv17FBB8hceYODN2YSWu5alFun1YmL1UazOEPilJZjbi7gnasVQZUQ2tdjNHn
	 uIo2m3zeM5Qjhrs1khg+VghHrwa0pXQVhisZ5FHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E89FF804FB; Thu, 16 May 2024 14:18:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3790F80579;
	Thu, 16 May 2024 14:18:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E53EDF8024C; Thu, 16 May 2024 14:18:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2042AF800E2
	for <alsa-devel@alsa-project.org>; Thu, 16 May 2024 14:18:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2042AF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ja4iCsqE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 48BCDCE1896;
	Thu, 16 May 2024 12:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65724C113CC;
	Thu, 16 May 2024 12:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715861887;
	bh=xIBvgUA3GxPMhfgmzaW4zOWO/kjFOkYCDtn0FkIzZSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ja4iCsqEuuzYg8BupkdjBsN2Ry+ctT+W0pZt0icJqpavJRjyEC6s3v3vlQCfyK0s7
	 ovL4vjFh28xGivUCIRHW7v71UTmnB8/VMhCRHqy/zbPf+IavRmmupIfw/iDfIjyDbT
	 tVerabbA1NrsSPHh9hUvUoVLrdw0l6NscBct74hoGACqZ9RlRSY6Ev1cS/DTwXCXWK
	 UZ9SfFemywcbXYcp+Oz60r3FmlZMW4QjeSivnTqEWV69XZeTPkFtCT71vmwnWxJODR
	 dOHSH6To38jOcHOTrHNiWnN8LRAm0axg/+ZEQuQ/NxbNC1m6pIeJgL0VQ5aRt6MfQT
	 nI4tl4RXT24YQ==
Date: Thu, 16 May 2024 13:18:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCHv4 8/9] ASoC: fsl-asoc-card: add DT property
 "cpu-system-clock-direction-out"
Message-ID: <20d8eb96-6346-4341-95ee-74729001c01a@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-9-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qyP2+HTgE4Ups3SO"
Content-Disposition: inline
In-Reply-To: <20240515135411.343333-9-elinor.montmasson@savoirfairelinux.com>
X-Cookie: I'm having a MID-WEEK CRISIS!
Message-ID-Hash: ENCQU6OTGS3VDU4RQQ4Z4FD24E5RIZMM
X-Message-ID-Hash: ENCQU6OTGS3VDU4RQQ4Z4FD24E5RIZMM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ENCQU6OTGS3VDU4RQQ4Z4FD24E5RIZMM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qyP2+HTgE4Ups3SO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 15, 2024 at 03:54:10PM +0200, Elinor Montmasson wrote:
> Add new optional DT property "cpu-system-clock-direction-out" to set
> sysclk direction as "out" for the CPU DAI when using the generic codec.
> It is set for both Tx and Rx.
> If not set, the direction is "in".
> The way the direction value is used is up to the CPU DAI driver
> implementation.

This feels like we should be using the clock bindings to specify the
clock input of whatever is using the output from the SoC, though that's
a lot more work.

--qyP2+HTgE4Ups3SO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZF+XcACgkQJNaLcl1U
h9BOcAgAgLtirZZNkJCJym3Zg2exAkuMznCbG3vzhug2rdyPFeYCt7+q3uMqs9QL
ehCjibTUMcmLCA4pJA5G6l+OS+Fy9fAuaZc3tIADu0AcarzVHsy96kWjlUnkJTTo
IIcoydNZKalL0k4wMPB48k5pxCeo4eOjHql//4G+IauEcMgEOHbzwf+17CJPXsq1
x3NqwVfmrKBUy8ze66Rxjis67wEhMd7360LCdRtiOZQIf/JEzKCV0v/s0UwhmHVP
VR8c5o/YUpMNGefA317nPw8Tw9hVgqtLYV1hLwYn/C7QzIrIhGPn7m16h57m6IPz
N8JFnC+MvXIZjtMWx00is/tRmxqM6g==
=T9W3
-----END PGP SIGNATURE-----

--qyP2+HTgE4Ups3SO--
