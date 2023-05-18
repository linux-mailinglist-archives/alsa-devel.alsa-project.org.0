Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F90707DFA
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 12:25:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6286200;
	Thu, 18 May 2023 12:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6286200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684405524;
	bh=1pGxFJKVsFgx9sHnBjgyrJFnknmvGRQVn6I6HxYpR38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t8X5BQkZV/iuBEV3topKeFqhvaZS7/xQMDOMsU7w7S1yvKBtrDMhUG231JRRFLIH2
	 1Ecs81SQ2k7pTIBegjIYNHFQqaDdyOlSQ8kkSw1QwkGHniof3WTUsnLRgxOHPg1CCt
	 v/uw/Ze/83yVDum/nQ5V7l7vb+e/AyJgalU6XbTE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56D3EF80087; Thu, 18 May 2023 12:24:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5D85F8025A;
	Thu, 18 May 2023 12:24:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F994F80272; Thu, 18 May 2023 12:24:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 970E9F80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 12:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 970E9F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Lg/erPjB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 77A00612D3;
	Thu, 18 May 2023 10:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72816C433EF;
	Thu, 18 May 2023 10:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684405442;
	bh=1pGxFJKVsFgx9sHnBjgyrJFnknmvGRQVn6I6HxYpR38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lg/erPjB9safp6ndjCEjf2pz5kM1JFom8Dc77sjAoLssDE9lEI7/bgqcVRgShC9vK
	 929kfFg6vVdZLve4G/Ymp344fT3n7jYyVgNg9a3Kl84ehQyqaYAnu3FLgCVFz3oIXG
	 PvxnO3d5FGvYLQD+a/5oH8p7Ng3RB2bhx6wvqRTBbp3Z/5UqLA91bHLs8mdWczB4Us
	 FJtZ1F/T4B6/mXoPBvWpBgJXFLEO0VLOgLDJiJk+PdRiVqWuDvgfWp7P3U7QwRfiz6
	 zjsWEACi86yVv/a6UvTOxF3tqVCpVmVmStHrjW24kC3RWf46SGXEzCVUWVBLEjFxza
	 pEkTRsUGnwjbw==
Date: Thu, 18 May 2023 19:23:59 +0900
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 00/12] ASoC: codecs: do not store status in state
 containe
Message-ID: <ZGX8v3qjkmfMf+J1@finisterre.sirena.org.uk>
References: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vz0g0BGUIB+KZY51"
Content-Disposition: inline
In-Reply-To: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: YDMJV2W7XLNEV2EXY67JBZUNOCY2FYOC
X-Message-ID-Hash: YDMJV2W7XLNEV2EXY67JBZUNOCY2FYOC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YDMJV2W7XLNEV2EXY67JBZUNOCY2FYOC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Vz0g0BGUIB+KZY51
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 09:27:41AM +0200, Krzysztof Kozlowski wrote:
> Hi,
>=20
> Resend due to missing cover letter, so adding per-series tags was
> not possible.

Please write proper cover letters, but don't resend for this.  You
constantly raise small review errors in other people's submissions...

--Vz0g0BGUIB+KZY51
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRl/L4ACgkQJNaLcl1U
h9Cexgf+KRsmqRLc+Mv6QpRpmZzZ4GsbY04hPjjRyc1gjPvhRPDs1A6sqpiY1xjL
TWRRILxQqaJjf373PNFZ5yPrJoRLq2e50u/EqsEdpgU7XhZNP8nrPuPHM/sqXd4c
yGAmGSJ75kCHZ913882SxrOdGeuev8D6Wkoks386HxiNZGopSEwmyhIBkAvmotm6
eiDDUD0X/5ZTcGyAXkdG1o7cIjeNMa7JZMM3b73dNAzQHFUenOycYA1i9F8A9S7V
QufunZzyLloK1N/CkCNNzgyMXaJLtWpE57qA3nChWEQkE5s/CpUKSLSpn0CINlyn
armBQapnhqt7H75uI0p4oCEL5jWXSw==
=9F8V
-----END PGP SIGNATURE-----

--Vz0g0BGUIB+KZY51--
