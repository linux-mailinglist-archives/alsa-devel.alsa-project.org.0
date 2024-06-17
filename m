Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4AE90AD6B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 13:56:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5E2EAE8;
	Mon, 17 Jun 2024 13:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5E2EAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718625359;
	bh=jUYkLcHNVMGAKmmAya+2zPkcEa9Bqe1QYQq6BZcZcHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y9vRRThzLLVYd/2UW2SqJ6ie/f+wjxWM9aO3RkLnfhixNa3baj4i4HTvGHVNrU0Mv
	 2dQYkIbvdsPiMN8Kk+2oHBe7UFX/Q4d6YLpunWN5FNl/OcuHOkXb4bSL1GQ7SU7ZL3
	 ZSb6A6MHbeIw2ncOTZWrFIaJTdDQ2bbD5SQ6tGnE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDF69F805AD; Mon, 17 Jun 2024 13:55:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39F51F805B0;
	Mon, 17 Jun 2024 13:55:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFC17F8023A; Mon, 17 Jun 2024 13:55:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0899F800ED
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 13:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0899F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r61JJ5HR
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 741EFCE114E;
	Mon, 17 Jun 2024 11:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B76C2BD10;
	Mon, 17 Jun 2024 11:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718625307;
	bh=jUYkLcHNVMGAKmmAya+2zPkcEa9Bqe1QYQq6BZcZcHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r61JJ5HRwAWeK+V5dXT3Trn5Ly+Ls5Xb2ENHZz6MPzH+S6jxyaoH1ZkkSeePRuVA5
	 62dkADdkS+wL+exFW3KOPtePLeuFMDarSUcdHg0Bh4Q3feTFJfMT9UZvNuiMQDUkjL
	 Qg1qKTXBKUY/+vBEq6JNrqkianvWPn6D1L7ekEWbN9vRQW6cGu8PmNuGAPPZG4wa7B
	 E71jkxkXIpefUJhncHzRGZW2E0eJfi9SvIjxf/WRtFS/RbDEloIJKrVOZJU6bAcTS/
	 k4ikJSYxgo119Nr6vIHuPELJkgyTENDfUBy39P1LE4fhb9yrSkWaQW8oVZaD3tZEXu
	 F6+sX7+nS8bsg==
Date: Mon, 17 Jun 2024 12:54:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Banajit Goswami <bgoswami@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>,
	Rohit kumar <quic_rohkumar@quicinc.com>
Subject: Re: [PATCH v6 3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
Message-ID: <a6d17f27-51f4-47a5-8798-37bcdf3b103d@sirena.org.uk>
References: <20240611074557.604250-4-quic_mohs@quicinc.com>
 <6e1dd5d1-8c5d-44f5-99e8-f42cfbdeee04@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8N8IFlNCqkTciz3E"
Content-Disposition: inline
In-Reply-To: <6e1dd5d1-8c5d-44f5-99e8-f42cfbdeee04@web.de>
X-Cookie: Life is the urge to ecstasy.
Message-ID-Hash: GZMDHIOWJKR7GCA2VTYEOHZJ3SL6HVEP
X-Message-ID-Hash: GZMDHIOWJKR7GCA2VTYEOHZJ3SL6HVEP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GZMDHIOWJKR7GCA2VTYEOHZJ3SL6HVEP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--8N8IFlNCqkTciz3E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2024 at 06:38:58PM +0200, Markus Elfring wrote:
> > This patch adds basic SoundWire codec driver to support for
> > WCD9370/WCD9375 TX and RX devices.
> =E2=80=A6
>=20
> Please improve such a change description with an imperative wording.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.10-rc3#n94

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--8N8IFlNCqkTciz3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZwJBAACgkQJNaLcl1U
h9BPYAf/Te6gQtKt94WX0v+W7HqLZ1BnLN1dLZG0bLUDwYe4sJh/EFbwzvyHXx9b
KO0bBawxSl2HfrCGJ9JyfXGAuJJNkrSWhEqprY0JyUQgsLb0xuanc0eK2USUhb3V
WtK56o6Yt449MKzhg7GDg1yYCIiMBU6pJKJbE+eN8TEP0zw6M/9gVHsdVxBzHUXr
dzKJvbaNFklSSh0EuZGEWgSRR+U7oDB7D8PkDlVj6V0IROnqcl+aW4KcdH91xgxx
rPKiSkei4Kk394a8b+x2iVUfDHDjPg9pMT6aKfWQj0ejf1Vq9aSIf4QDGCq/z7M7
ZCgh0SEis37Y3kTSnUZqAaxngSlzog==
=8S2L
-----END PGP SIGNATURE-----

--8N8IFlNCqkTciz3E--
