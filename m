Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5006F9CC9
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 01:40:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18AB612BA;
	Mon,  8 May 2023 01:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18AB612BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683502810;
	bh=WmmGaEaDKGwBE2JtCM7J4OMGZbrbtEfQo53Aio6mxLw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=swxjnWvXms6OGHzD33ShAr0Y5kfn97VqIypcpwi0+o/me2ws5H1nl5W7YuQadzJuk
	 AKCtAt44WhRkrj9jzxJrqxrotcwOfcH0OaWgCOkPOVtedPrQEMKKtlm8bju5ruDJfZ
	 MKup3BuP+JpcP3DM/F2VxkfN+gNcfry+FezWvlRw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAF09F80549;
	Mon,  8 May 2023 01:38:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 601D4F80557; Mon,  8 May 2023 01:38:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 262A9F80548
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 01:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 262A9F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lKufYhEJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 07C9C61C50;
	Sun,  7 May 2023 23:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13EC8C433EF;
	Sun,  7 May 2023 23:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683502729;
	bh=WmmGaEaDKGwBE2JtCM7J4OMGZbrbtEfQo53Aio6mxLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKufYhEJvGRZrv9rtyK9CX6lt1XhzPJ0jCW+mBWu0ovohMHGsODOuJ4PeypDLyXm1
	 yF8ENUuOXKaDuLTzTjU+0OICsRkc1OaFrhc1J/ZALBvYiOSh+l2nl4cBH0PF3fcmQ/
	 ZTaLJjzxeCoixomjbRL2/209wSiK/bQlGUnmfa+i+gEWCEJrZqZFdMQNbvkscaYT/+
	 kNaV/T1mWTUzp9aaztyA7PH/0FnL/+Pcr3atssBwDYwlJb55HsaxO8A48xZQPEVx/W
	 Xs+t3r27Snzf0Y5KGdQeMa/TAIrXl+oNv5bUsn6EymPU3w4ViMdpebLAnmUogHHhAO
	 c4Xm+TmjOkU8Q==
Date: Mon, 8 May 2023 08:38:44 +0900
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 6.3 06/24] ASoC: tegra: Support coupled mic-hp
 detection
Message-ID: <ZFg2hP9ed1hz+tAl@finisterre.sirena.org.uk>
References: <20230507003022.4070535-1-sashal@kernel.org>
 <20230507003022.4070535-6-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y59NH35YlGEIWGGV"
Content-Disposition: inline
In-Reply-To: <20230507003022.4070535-6-sashal@kernel.org>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: EYKG4FGIU2TLAEXZGFYXXRPT25LGZWAH
X-Message-ID-Hash: EYKG4FGIU2TLAEXZGFYXXRPT25LGZWAH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, lgirdwood@gmail.com, tiwai@suse.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 jiapeng.chong@linux.alibaba.com, ion@agorria.com, robh@kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EYKG4FGIU2TLAEXZGFYXXRPT25LGZWAH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--y59NH35YlGEIWGGV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 06, 2023 at 08:30:02PM -0400, Sasha Levin wrote:
> From: Svyatoslav Ryhel <clamor95@gmail.com>
>=20
> [ Upstream commit eb0b8481c2e03a5ae01f6bea60b42109bd12b6fe ]
>=20
> This quirk is used for cases when there is GPIO which detects
> any type of 3.5 Jack insertion and actual type of jack is defined
> by other GPIO. 3.5 Jack GPIO generates interrupt and MIC GPIO
> indicates type of Jack only if 3.5 Jack GPIO is active.

This is also a new feature and obviously out of scope for stable.

--y59NH35YlGEIWGGV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRYNoQACgkQJNaLcl1U
h9DUfAf/fJSrvAFvB2PEgnbZ7+HVKFhP+DVHDcWAPVfRTxH65rP2P7zHxSCvw2bl
io/USGxVZvTVnbsIp/rn/SLjv0SuLrazlhSuWED4ejyX9OsZQa4H0bRHOqRPmVjw
001Af8uWmnAScDqUc/aL7H90QpkEqeLA+K/QKn0xS4hIdTp22mW+fY3YV2J72EMc
VYb6vlxT9Pf0lLKYYUrKmUXsodwPiG0kggfdRlNg6iTR65+ZKI/JcuZAR9p7jAyf
jn4JxG34aEhZ8p9dqA/OxJx/KQPik76KZKE/ECDGRzYDbBPdQgSSkxqUve9y/dwI
oplIizRdi8O8D6jw+CbfEH6UjCXvZA==
=rKBH
-----END PGP SIGNATURE-----

--y59NH35YlGEIWGGV--
