Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECF3867612
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 14:09:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8FD993A;
	Mon, 26 Feb 2024 14:09:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8FD993A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708952974;
	bh=4I3RhXtBZX5OMS1orfIVhwSdCHuuX6f8mq6Wj0gtZnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hzTvi6IXfv4JmyvGN7QEWpeLIkkSwbMeZAOowrEL/1PxUX5PX++659Cl+JEamqf/5
	 cswQjzowQvyBuCVVEwMY48iFf/XMbtEIwFl7c6UBgK/9iPFP9wPqlDxAbqx5toY1qh
	 xP4kDUvdrDy70yn/974cIqvbkXbi2zkwe0F8Xk6c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19EE1F8059F; Mon, 26 Feb 2024 14:09:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D65B8F8059F;
	Mon, 26 Feb 2024 14:09:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E2DDF80246; Mon, 26 Feb 2024 14:08:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCE6BF800EE
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 14:08:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCE6BF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=i4MQPSVw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E47D7CE0E93;
	Mon, 26 Feb 2024 13:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52256C433F1;
	Mon, 26 Feb 2024 13:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708952926;
	bh=4I3RhXtBZX5OMS1orfIVhwSdCHuuX6f8mq6Wj0gtZnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i4MQPSVw3XtdgHB96J2XPs1a5xP8BWaggsHWOVzkgLdhJ9jDEorKezr0o5zkC1rlU
	 YwfUj/FgqO79fQ4FaPOCWrh44rEAaNMQ8fBCCRGFeoXkk7Q5y28TqLuVZdm3nmRfMn
	 tFOXbboHD+2rjZcToXXaGO2h79+E5NtEEsEX9o2/gJIBVkstkmgJIbh2yYhIP4m+NP
	 bHgSAmkRmraDvGw1k+Z+8YfhsIN2M6tsDQAxPWzfFrcEt3Uj5fXKpilhCgXntGdTNA
	 /GGqwNOtotzSKRpNXWP/EXLqQyh4QztiOkGYrEs4f+Wy8XcsxsW450G3thi8UVedet
	 9bGMiGH20dMag==
Date: Mon, 26 Feb 2024 13:08:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v4 0/2] ASoC: codecs: tx-macro: correct TX SMIC MUXn
 widgets on SM8350+
Message-ID: <ba3d3695-cde9-4aac-83ac-ee8aa949d57e@sirena.org.uk>
References: <20240226115925.53953-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I5r0FAbl9DxiaVsF"
Content-Disposition: inline
In-Reply-To: <20240226115925.53953-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Walk softly and carry a BFG-9000.
Message-ID-Hash: NCORORABB3GZINME74IWBA7I5PZ2WJEP
X-Message-ID-Hash: NCORORABB3GZINME74IWBA7I5PZ2WJEP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NCORORABB3GZINME74IWBA7I5PZ2WJEP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--I5r0FAbl9DxiaVsF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 12:59:23PM +0100, Krzysztof Kozlowski wrote:
> Hi,
>=20
> Changelog in individual patches.

When sending a cover letter please write something in that cover letter
describing what the series is.

--I5r0FAbl9DxiaVsF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXcjVgACgkQJNaLcl1U
h9Covwf+NRfuyXK8kzRR1j16coiFwpz6tb4kpW28h/xI4oxMxLg+7Fo36uOmi5pY
fxGsJqk8KWby7nw0SLcxsvRRBZ+fkHyotIrDcLjS+hgUMMA76vZcxafKEUmu2QVu
NJnJAwFwMd5ghEmMhCy0K3ca6uilnO26t/FF1o2UsCErxCmpw7UuRkkajluFZfdA
uyYhYC4D9YBAlbZCYbgpohAY4+QvnLjlYaP7t4nylBP1cXGBK973g7J96n2xBaE1
AecjWOfjyg2Y7BkjpNWN+4akAH6y/bxUMnW7PpXbW/QTVIF05ZK11zfMW1ju8fhB
46uWNSN3NH++6KUaF61n/rSwKJdxDw==
=fq70
-----END PGP SIGNATURE-----

--I5r0FAbl9DxiaVsF--
