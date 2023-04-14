Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FFA6E2708
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 17:31:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EF25E75;
	Fri, 14 Apr 2023 17:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EF25E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681486259;
	bh=Oy7IZNDxb+8PVB8hywDrkI7zMdUitr3Ayz89WzF1QX4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L2jcXV+FYcBXGrsQGnJt1PEnf2I53/LlQzrx+3kQ9bU/bQ+I+E/Mn+/SJKF80yMYV
	 dZ1vuBpFyJ/dftvPKCXR/Oe/XvzTH/VoKxsRvLXSpCa3MEMSvVyvrt5KH0hmxXgZe8
	 3GOuA2qBeVgddcHAhtct3Jn0XapXvpyKSwMuuPYg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8807F8025E;
	Fri, 14 Apr 2023 17:30:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EE42F8032B; Fri, 14 Apr 2023 17:30:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CCBDF80149
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 17:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CCBDF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kFM8EmCf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B38361059;
	Fri, 14 Apr 2023 15:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5B8C433D2;
	Fri, 14 Apr 2023 15:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681486196;
	bh=Oy7IZNDxb+8PVB8hywDrkI7zMdUitr3Ayz89WzF1QX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kFM8EmCfsJJw9RouzM3gPpsIj3kED9WCbaEvTzfDqL9sUpnrCRRvzemME77DtQjJz
	 jQ03UsiCuqK5fXBF/+7o/ki1XH6D9PG2X3cyPWifIg6YPDwPhmUEqA7sNSYc9V+iIi
	 T+j4euThusNa+h+4o/dubrs/YuxdtDaLPtUZGC91A3pYflmMJ9vYjc0IFTPpPh14Ab
	 tT+dabmBoplKXEr3vOLTG7k2egJjtknbgGzywsKwFuZYTuhgNHDtocRWuKmg65SN9q
	 AkUah5w5a24IcoTI034nebWQC9MFLefZeXlvAiVpUyDXN+wFQO+EVxTvK71kXy4UCD
	 bCs03OKn2eezg==
Date: Fri, 14 Apr 2023 16:29:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1 3/4] ALSA: cs35l41: Fix default regmap values for some
 registers
Message-ID: <bd4dbfdd-74e6-4cb1-bd3d-cafad479c4f9@sirena.org.uk>
References: <20230414152552.574502-1-sbinding@opensource.cirrus.com>
 <20230414152552.574502-4-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6EaOANoT/PHVQQX0"
Content-Disposition: inline
In-Reply-To: <20230414152552.574502-4-sbinding@opensource.cirrus.com>
X-Cookie: One Bell System - it works.
Message-ID-Hash: 2K4ECIZSE7B2LNAKPM3I6EZ7EIHH4KWJ
X-Message-ID-Hash: 2K4ECIZSE7B2LNAKPM3I6EZ7EIHH4KWJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2K4ECIZSE7B2LNAKPM3I6EZ7EIHH4KWJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--6EaOANoT/PHVQQX0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 14, 2023 at 04:25:51PM +0100, Stefan Binding wrote:
> Several values do not match the defaults of CS35L41, fix them.

Acked-by: Mark Brown <broonie@kernel.org>

or can this just be applied separately?

--6EaOANoT/PHVQQX0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ5cW8ACgkQJNaLcl1U
h9Bcrgf/aqwxlKyZj5mcfULcMCLidR/C2EBHFRwWbp2FHTYko894mSEQVHmdipTI
MjBD/wolT6glCFEolbcSAv7uKxnyXapCd5BHeJU0P665iMh4vBvXjbIvj5KUmLtK
sRoIOyVTWoAwoHyTtRD4fexTQRXtTQJ+uzVueGtilDdeTU/IFdEH7x3rMHKhyMk8
uMGmEWOkjyABUO7tThvCAwKsDoryYeUrd5ExWSbIyCSTC1HMwAlLYMCO8QlveNn0
CHdpF8xfd1U/1fBG8ZRABb6XypUChaCUIXpJ+uP80GYhHsKkHY4hGIb78ykRBObe
Mtb1CC8QElLLcvJZ0BY8xywFRescIQ==
=1T2u
-----END PGP SIGNATURE-----

--6EaOANoT/PHVQQX0--
