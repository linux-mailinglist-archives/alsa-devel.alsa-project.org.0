Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFD28309A6
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jan 2024 16:23:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAABD20C;
	Wed, 17 Jan 2024 16:23:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAABD20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705505005;
	bh=6UDS8FkhexYyc0wVvVp2lu16oGdbc3OgmsT1Ttvx59s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qdlA3RIOpOryk8k/hRM3FdtlUk14GKS/xdXAyaM3dK42p0rUPU8F2dbbcjAueZPZm
	 QYMHDWumIsaQkdMWLhjLoMEMMrN5TE/MovheJlHd6zz0JFeuF3jssmn0pyuxbZPpq0
	 XymK3KAf2sSKqv6mVSg5SAZ+RoOsFINcm9WETrcQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25D41F80563; Wed, 17 Jan 2024 16:22:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41D73F8057C;
	Wed, 17 Jan 2024 16:22:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63A05F801F5; Wed, 17 Jan 2024 16:22:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1674F800F5
	for <alsa-devel@alsa-project.org>; Wed, 17 Jan 2024 16:22:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1674F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jW9TIUFP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0372BB8110A;
	Wed, 17 Jan 2024 15:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537DBC433C7;
	Wed, 17 Jan 2024 15:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705504964;
	bh=6UDS8FkhexYyc0wVvVp2lu16oGdbc3OgmsT1Ttvx59s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jW9TIUFP9KDG4Ij8h3pVU6tXgCy10WhUVNamkwrhWjcgaEdGH3EpulWFFa/O8r/aQ
	 eXT/7OeVf84d98rPS5CIspPkHFAv9SPdbUqDJOF+8xWH/vIrFK/z3zTde+4/8Uw07G
	 tAwd5DVPLPEAo0E+eKb9W3RMkC4zBgyTdEA2CzGOrwFXP0FeH2rbcQXIumEmu6kdRx
	 mfAMwkgM78p1+i25aPvFZIJdtS0zMWxeEGYMiaZ9itMlb3iCHBGsybrkDyM+X+sJol
	 sFGcpFK51Kvo9AauRdxRm2QvHVkJHhm9vbMI1DtpGr4QGd3aw/Tmuu/UaBTZLm16vi
	 dyEWqwxH3mDcw==
Date: Wed, 17 Jan 2024 15:22:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: codecs: wcd938x: handle deferred probe
Message-ID: <8c30a417-20fb-4d61-b5e5-deb5cd579e50@sirena.org.uk>
References: <20240117151208.1219755-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QFFyemF5MjRQpF88"
Content-Disposition: inline
In-Reply-To: <20240117151208.1219755-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Nostalgia isn't what it used to be.
Message-ID-Hash: 57UY5G46T3QPU4X6BIPM6UXENSR3WCI4
X-Message-ID-Hash: 57UY5G46T3QPU4X6BIPM6UXENSR3WCI4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/57UY5G46T3QPU4X6BIPM6UXENSR3WCI4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--QFFyemF5MjRQpF88
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 17, 2024 at 04:12:06PM +0100, Krzysztof Kozlowski wrote:

>  	if (ret) {
>  		dev_err(dev, "%s: Fail to obtain platform data\n", __func__);
> -		return -EINVAL;
> +		return ret;

Should this be a dev_err_probe() as well?

--QFFyemF5MjRQpF88
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWn8L4ACgkQJNaLcl1U
h9D0ywf/ZnguSawFPSvLSmZVVE26qF0aj2D0OQ7gHQ8FtL2H9VCflICbGytH79B4
2RSVIuvM5MNinmoWSanljMuwBI4feZeS10CmQJKnrqvGVhOnpvlmJew0W6KeJbIb
46fOJDk52PGNpkMtXDpuhXy1/SsrH3WLQhEKhDHPtJRl7uCS2qS/8QE8y6eZ8drW
+JlONFb5emSDvHvz2U0hPSZ0X6uEDI+M4xw4xlTbtBFCTdoj6Lmal/BWuIq5R474
iIdPpur9UKzxXTkQWo0lFiZw5vIjaU91o5tczCZDAkhW/Y5Yrk/a9BqcgF1W1t2E
Pnfa/E1hImH6vtUIPE3npI7IAhN7zw==
=sotV
-----END PGP SIGNATURE-----

--QFFyemF5MjRQpF88--
