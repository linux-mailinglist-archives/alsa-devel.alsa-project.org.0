Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6240B8CFD7F
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 11:52:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C06CF7F4;
	Mon, 27 May 2024 11:51:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C06CF7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716803525;
	bh=siXMFcd/YZJ/krD1ElQNCMZYcM6Cs/xuMd+BVeICYQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RhXQS+eULNxcKKaLl0koppGNoV+uODeQQm6oEWQwkPaT77XhkB6DGP0NciuQfaBVh
	 K3xhY9Pt6GJN0BnpyZfqMWFf1fgJA0yNQDUPekCPFi9HToCmXzRMNvM5uElytH9IW+
	 EZFeLFsToHW6y09ZOkxS1dCGAhmZk8lmTGVvmyK8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 028D9F80525; Mon, 27 May 2024 11:51:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7C6FF804FF;
	Mon, 27 May 2024 11:51:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D017F8026D; Mon, 27 May 2024 11:51:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4FCAF800BA
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 11:50:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4FCAF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sNH9o6s+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E24A4CE0E38;
	Mon, 27 May 2024 09:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6674C2BBFC;
	Mon, 27 May 2024 09:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716803449;
	bh=siXMFcd/YZJ/krD1ElQNCMZYcM6Cs/xuMd+BVeICYQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sNH9o6s+Q1kmd8WNsDNbk5w8UiLJ7Y5W4l9dTvGR/YJawYoFhQevC5EN46i5dkEba
	 UjlXSOdtAPoMP3Emf/japi6wch2CYakoaRRURmEdMF2Y48Xoogw5jaiEmThfmlz3j8
	 exROQHgp/rRTl78+H4bCTEZsJ7i/p4AhrmS1kW2cp1rwezfP10W9ubQb8aPLawk6wX
	 qV0FJK5rYaHNaI5d+R8kn1pnK11BckEeMrbGWtqclxIES03fReerX6LHDKQr/El57v
	 xxKMYt4Rbk5TRP2q5g/nqYDwpJ0uiKbRMpkCg3qnrNLkmcD9Wmpew35+jLcPL1v1of
	 3YBfiSrLiuX0g==
Date: Mon, 27 May 2024 10:50:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
	quic_pkumpatl@quicinc.com
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCM6490 snd
 QCS6490 sound card
Message-ID: <091aa382-32fe-4f5c-8ebb-440afaf37827@sirena.org.uk>
References: <20240524035350.3118981-1-quic_mohs@quicinc.com>
 <20240524035350.3118981-2-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QlFvzjBH2dX8pMN1"
Content-Disposition: inline
In-Reply-To: <20240524035350.3118981-2-quic_mohs@quicinc.com>
X-Cookie: Teutonic:
Message-ID-Hash: Q5BCHSV7HSAMDQDEXUEVDDIPYOQP7KOW
X-Message-ID-Hash: Q5BCHSV7HSAMDQDEXUEVDDIPYOQP7KOW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5BCHSV7HSAMDQDEXUEVDDIPYOQP7KOW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--QlFvzjBH2dX8pMN1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 24, 2024 at 09:23:49AM +0530, Mohammad Rafi Shaik wrote:
> Document the bindings for the Qualcomm QCM6490 IDP and QCS6490 RB3Gen2
> soc platforms sound card.

This doesn't apply against current code, please check and resend.

--QlFvzjBH2dX8pMN1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZUV3IACgkQJNaLcl1U
h9Bv5Qf/RC/79S61kz29d+HPO0dv1aYHxWJa9jdbC6za/XxQjXzCqxwmH9Iwl5qp
u9a60OfG9lV2kVFsr38Eo0Gzp60n3ILfLQ2noRN4QtWDeM4Z3iVA9aYeXvxzGD+T
YKNQZZAiEaSPL0/yu9rjpZNukGumbB1ZrIkziy2JtxdrYF871n3XM5yJPJxo6AwZ
ECxwvmPt6QE9jwGhnuUK4dApotHFSC14GG3cuotymq5GKv+5tKpxGYvcbW5ukI3Y
wEuWMtDErIr8X6Xstk4U8F8smKh4Tw3KjLTL6M4NKZO5hSReesnOe5dZipPjpA5j
V5vlHp5uPs3a4sXBwXYVlWbM2ICK1g==
=b4rM
-----END PGP SIGNATURE-----

--QlFvzjBH2dX8pMN1--
