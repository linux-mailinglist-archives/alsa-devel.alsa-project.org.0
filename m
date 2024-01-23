Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E99AC83909E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 14:57:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 196A0852;
	Tue, 23 Jan 2024 14:57:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 196A0852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706018274;
	bh=bjE7cKFCXNgqexa1XbHJgB/+EEGcugDZWlZbQses+y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JnogAgAxl8JYHvw4UYlKbKX6LDf6evJMHBV0/wIcQa3COqRGAuJ3sJC+Z06XldREO
	 xFJM1nt7mhSc6wTFhkhRYi6KjhS4sFtHioG1CgIjvJosyADNC4R9dWNB5zteVo4TMi
	 8hWwe3OINL5j5ugIfc2mr6d1/4Z1xq9uaOy1MoGE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B843DF8058C; Tue, 23 Jan 2024 14:57:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2B66F8057A;
	Tue, 23 Jan 2024 14:57:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D90BF8028D; Tue, 23 Jan 2024 14:57:17 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 24FCDF8003A
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 14:57:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24FCDF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=boMxB21b
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9900C61B8D;
	Tue, 23 Jan 2024 13:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24751C43141;
	Tue, 23 Jan 2024 13:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706018232;
	bh=bjE7cKFCXNgqexa1XbHJgB/+EEGcugDZWlZbQses+y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=boMxB21b8V/JsPzmax4mUS3X3B46r/qfkuS2WXL6YSp3qOSqvWVYIJE4JLgE+/pUK
	 StUQNLHlNgxRbahrI4qQD/2FAU1SIQs0612LK5G9NMiUGUWx+5oniMu/vlJ5mn1sDD
	 7igsYCYu0f/2fjhApDopnkt+rLy1F29564CfJH+igbGQylQYpwcpIZkG6iB0yqt45H
	 CkAG4aETuQ6ET/7Owun10hx4+Qv7WjkzG1RBliLLCHy4RcM8S0zTr+fMemtqbN5aib
	 LAzbQ7VcxFA4CR89fqX6/8l/bVbgo0piu3Dh3bSGomc9TGdpDoGI09916oqzgoRHBG
	 CdVlQXrPHXJmw==
Date: Tue, 23 Jan 2024 13:57:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] ASoC: qcom: volume fixes and codec cleanups
Message-ID: <05c38299-bc8c-4f24-a82b-4c4e66801cce@sirena.org.uk>
References: <20240119112420.7446-1-johan+linaro@kernel.org>
 <170596045016.161959.16318695944363636291.b4-ty@kernel.org>
 <Za9xnEXYczA5rsw3@hovoldconsulting.com>
 <93fee0e1-ce92-4aba-8e4b-0861f78c32c9@sirena.org.uk>
 <Za-_jrByhGnKJo66@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BoaR20KATVigOpGy"
Content-Disposition: inline
In-Reply-To: <Za-_jrByhGnKJo66@hovoldconsulting.com>
X-Cookie: Stay together, drag each other down.
Message-ID-Hash: OB52BMJQ3AFSXGGW4VGJ5ZWHELXPDVYU
X-Message-ID-Hash: OB52BMJQ3AFSXGGW4VGJ5ZWHELXPDVYU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OB52BMJQ3AFSXGGW4VGJ5ZWHELXPDVYU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--BoaR20KATVigOpGy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 23, 2024 at 02:30:54PM +0100, Johan Hovold wrote:

> The merge commit for the series does not include the volume limit patch,
> so it looks like that one got applied separately before you applied the
> rest of the series:

> 	https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?h=for-6.8&id=7c70825d1603001e09907b383ed5d1bd283d61a0

Yes, loose patches go before serieses.

--BoaR20KATVigOpGy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWvxbEACgkQJNaLcl1U
h9Bdngf/atygantZE8Loeo+W18IGt6CE9ghCmzgjV5VSGh0boNMyi2DrhGABuQXC
COMLo5JZPokZSO+TBTwD8z09fBXlNzW6n8uAT/hgKiH/8x2kI1FGN6StDilZiIJM
AOZBBcZTRQauGIiLUhl66Vt3/UfCIBVykBpK9PIq/2L/Ys3tScF9v+LgV/K8KvMq
CFOxyi9R0o1TvssNdrDUfw2ZKOOiqcCQNSCF6t0ZfTQVFSX0kV4MFqW5XVeTeguJ
fD8wDpMq/SsD/KwFlaU0UDcH8i/P18dSlpp54kmAZUrvTVs5aujrOEtsa2o4dM7/
LbqUxbpsO1o/QgzVSzrWuX41GtdkYg==
=R1jG
-----END PGP SIGNATURE-----

--BoaR20KATVigOpGy--
