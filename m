Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93947836EF8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 19:07:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA48283B;
	Mon, 22 Jan 2024 19:07:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA48283B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705946833;
	bh=kyRl1N9Q/dQhytK5rUW6BG9+l/1vrFhgo42ePkJfkkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TE4hrojSHu0zt9YVkX5S8gczlTsync3ne16PtFijuz4mhMe8hw5vP6/aglYSduWKt
	 sXL1QUPmje5GHcn6bw6tLhHQLXmRONcIVtoom8yKE29o8xONQxi89j/FLDekfUfU8Z
	 jhaeQJ7fwxAeJXMQJlm643Z4uULRKlfIvpoTm0LA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11723F8057C; Mon, 22 Jan 2024 19:06:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 734C0F80563;
	Mon, 22 Jan 2024 19:06:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9789F8022B; Mon, 22 Jan 2024 19:06:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78C59F800C1
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 19:06:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78C59F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kEW3ozoj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65AA661770;
	Mon, 22 Jan 2024 18:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE0EC433C7;
	Mon, 22 Jan 2024 18:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705946791;
	bh=kyRl1N9Q/dQhytK5rUW6BG9+l/1vrFhgo42ePkJfkkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kEW3ozojryUaFqJeewEJEvDyi2f/KWTnppNBa4N7s4zyU7sdQkK3ar00wfaNpRlhJ
	 K3DiEMvUkVOswNvJWjEJRM+OczTCmLApyovnaWgJ+t6ZOh7tJqLIeQW3qOB19Btxxq
	 rjuPe92x5BoG/KKtblBxXjFeJPzFd4j064Rze6cN1oM1KDjyBXPQIqQwW4MKFpfCvP
	 w6OireLjH0tjGeb7eyfwhsVyUnlosSCpj+Y1+8xfhFUI7F9P5oY0n0qKAVT4D1XXEl
	 zIenD0lJ4oyZyd3wn3RSsdT+0wwQbJrKDASIGVVcwO844i3fGlpVDMJo4yO0rmjhjN
	 waIKUjbhX1iEg==
Date: Mon, 22 Jan 2024 18:06:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 2/4] ASoC: qcom: sc8280xp: limit speaker volumes
Message-ID: <8c6fc7e6-7694-4718-be47-d9fc3f893947@sirena.org.uk>
References: <20240119112420.7446-1-johan+linaro@kernel.org>
 <20240119112420.7446-3-johan+linaro@kernel.org>
 <d54d3640-49bf-4a2f-903b-4beeb0ebd56c@sirena.org.uk>
 <Za4cR90XoAaATq8X@hovoldconsulting.com>
 <aca2b125-acf8-4791-a3eb-ea19826d3ee4@sirena.org.uk>
 <Za6l6EP7OqXPU9mj@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PKIws8OF8mXQ1io0"
Content-Disposition: inline
In-Reply-To: <Za6l6EP7OqXPU9mj@hovoldconsulting.com>
X-Cookie: Nice guys don't finish nice.
Message-ID-Hash: 4IM3YNV2XLWSLCYRNYBHKEOJRY5UVES5
X-Message-ID-Hash: 4IM3YNV2XLWSLCYRNYBHKEOJRY5UVES5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4IM3YNV2XLWSLCYRNYBHKEOJRY5UVES5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--PKIws8OF8mXQ1io0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 22, 2024 at 06:29:12PM +0100, Johan Hovold wrote:

> Could you please try again, and tell me which patch fails to apply and
> how it fails?

It was the specific patch I replied to, just the standard "this patch
doesn't apply" message.

--PKIws8OF8mXQ1io0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWurqEACgkQJNaLcl1U
h9DSHAf/T3WNfXxLvAbJenp11DA/SEjMQj9/GAixxPGAr04YGXfFCHS+BU6RwG18
nfNEGntA5qkyWDqYJl7XiMiRn6VcG5yklGOgJAM0BltZFbCGw13HsTnFaMOj2to2
Oo9RdzNeY1iuE57nu5yvvTt3VkMAXaEtFskwAhcG6xXDBac0TWbTOb5WWCeijGua
ZtVT0iG1DF7SEhqdee8Lwr9Q+46VBcu0pChiLmycGGkb/jN1lpT4D6YF2gKUIunH
7f3yuN7asZHZ4VpP8YEsPkCyR2hsQfXYgzjufQWkIvH+YBetfle5X/3GecV3FIeS
mH89vrcQ7v4mkN1BgRpac5XjX9oaqQ==
=Vhot
-----END PGP SIGNATURE-----

--PKIws8OF8mXQ1io0--
