Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 880B17EF64F
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 17:37:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAFDB886;
	Fri, 17 Nov 2023 17:36:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAFDB886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700239041;
	bh=y6Shd7bmKCsekpBRoYhpQ2ZpMh78XJxTVe4sGB2BHac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PDoq0QBndlYcpTo905fpr5Yb7k8c2bKzlJZGgmpOprT/5ijOQFO6ulI2InNI7lQaE
	 tZ2kusAqrvnuztByz5JA53ip18OAPjUTV6ZTyZBWkkyxwBZeT5lc93wB1kkm5AOqNH
	 METm/7yPhs34BUmz/4ptqOjGEgcZGF3wYqkR2vCU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 664A6F80557; Fri, 17 Nov 2023 17:36:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF59BF80249;
	Fri, 17 Nov 2023 17:36:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1558AF802E8; Fri, 17 Nov 2023 17:36:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5410F80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 17:36:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5410F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WG0Grb75
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52B2A61DB0;
	Fri, 17 Nov 2023 16:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D0DC433C9;
	Fri, 17 Nov 2023 16:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700238976;
	bh=y6Shd7bmKCsekpBRoYhpQ2ZpMh78XJxTVe4sGB2BHac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WG0Grb750dwkd6qBwm5RB8YkQ4mrl5JAMjtpfNcuKssNdb9OFAXz5WSD1cW2RBtc8
	 ClVZ3YDwldl+qYkE1FOjKn/WsD+PpkuS3Yl7yGRorawaOkEt8KIDS96SkhL+IQCDkp
	 uXNgQgoQWmAVXE6fdypg0aPN0VzVlCrIz9Sa1KlV+bnaAiqtNa8ka1FPlp24rezmVN
	 BF9cUwKKWGxy+RpUfjQw9WGTXZzQzBAWFm7DziGEA9fMuutr3/WDyQTiT16XTMDnjd
	 9MCPWsP+YbQuMjWKYRcTEasvcdYbJdvbxYRxBVPMS7EodVsrZqNgB5MUEW3zPjsAlC
	 koOKG9Jof7kBg==
Date: Fri, 17 Nov 2023 16:36:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] ASoC: cs43130: Allow driver to work without IRQ
 thread
Message-ID: <ZVeWfefrEQJIx0YL@finisterre.sirena.org.uk>
References: <20231117141344.64320-1-mstrozek@opensource.cirrus.com>
 <20231117141344.64320-7-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jNsZootFS+OqjmoX"
Content-Disposition: inline
In-Reply-To: <20231117141344.64320-7-mstrozek@opensource.cirrus.com>
X-Cookie: Slow day.  Practice crawling.
Message-ID-Hash: EWHFEKNIV3OIFIPQ5GUJG5PAAMJAO7G3
X-Message-ID-Hash: EWHFEKNIV3OIFIPQ5GUJG5PAAMJAO7G3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EWHFEKNIV3OIFIPQ5GUJG5PAAMJAO7G3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--jNsZootFS+OqjmoX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 17, 2023 at 02:13:43PM +0000, Maciej Strozek wrote:
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---
>  sound/soc/codecs/cs43130.c | 56 +++++++++++++++++++++++++++++++-------
>  sound/soc/codecs/cs43130.h |  1 +
>  2 files changed, 47 insertions(+), 10 deletions(-)

Why?  This isn't some obvious fix, you need to write a changelog
motivating open coding interrupt handling if there's some reason for
doing that.

--jNsZootFS+OqjmoX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVXlngACgkQJNaLcl1U
h9AIgAf/YwFU+24iTCyBD2p7T4hTxXe88GHpeNfoDy4xmZqQ93P5hdHXUVgC/dPC
YyQ10xS2vXHlTdHUF61h7mI8sK7SQ19P+1bdNGEKc5JDok4qKxG8k9PxWlbS09n+
uOGhfpKyH326+gLfbNn5PyDg8O5JG8w0rCDSq4xEaeR0Vw1eMmNB8Ub1TCUlNvtB
sI6xGKkyi7gw8kqk8tQza69iPYJNXsIW4ar/oM6FjH3ZjzPhDS8ZKMEbJWGhtUda
YsYIk47TfXUs0f+bZNRcmhYUnTJfdy8VgHQSrSKp9Lmb51q6q2sqhS+Ah3icNlJU
uwTHiuhzkeufob+mFz0/IyIqoKcA+g==
=qhs0
-----END PGP SIGNATURE-----

--jNsZootFS+OqjmoX--
