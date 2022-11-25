Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BCA63904A
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 20:33:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E028174E;
	Fri, 25 Nov 2022 20:32:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E028174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669404826;
	bh=Y1v9FWURYksz9fHen0arQZhYPgnLZQsNKuoyVGBXZq4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A7YX3uBbq9FYeB5pZ49Kh6EK4TOjeh9hYZYt7whNjbwBgCQrccEaX1Vd91b4klfMp
	 pzVTS8wp3ksWYN0puur6vcUnTM4rKO41syb1OMaqjO3vi/7pPoZO5RA6AzHrXjckLe
	 VPBRey/ABJopqscM7R7YmfDQhvPU+K8XlBw7bYJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9A84F800B6;
	Fri, 25 Nov 2022 20:32:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35B76F80236; Fri, 25 Nov 2022 20:32:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45B36F800F4
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 20:32:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45B36F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eUkFs1Py"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 438C2B82BA2;
 Fri, 25 Nov 2022 19:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54959C433C1;
 Fri, 25 Nov 2022 19:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669404768;
 bh=Y1v9FWURYksz9fHen0arQZhYPgnLZQsNKuoyVGBXZq4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eUkFs1PyOK7NxweBivmv9oCAe3TneIQBDZJEGTiN3JoJR7ydosNdqZ2risWTsxqct
 SqyFIbHJpGSQaEQO1Wn6hmCAMwU/C/VFg5YJ59UxDXPhAGNCgO8BEDkj0cyOPNO5YM
 wP7gHKsvvzjN7Xt6OQ/rLrcPksHpHa3OiL529NGZyLEqR8Ac2m9DhCig0qdicj2nmr
 3/BMT9jWEvJCc/RmhZ3SQujeAfZ1RovrycD0Wl4vvXGmqbS97WFllAdblRqI/0MMRm
 08q6P2JwWCXUiGaCmGSV3d/lpQwSuzvMjNm+5BOnJHZV7SSuHW5LIStb7V52V5naJO
 /KSKcVaToLtTQ==
Date: Fri, 25 Nov 2022 19:32:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Maarten Zanders <maarten.zanders@mind.be>
Subject: Re: [PATCH 2/3] ASoC: adau1372: add support for S24_LE mode
Message-ID: <Y4EYWwS/TSHtS6YY@sirena.org.uk>
References: <20221028152626.109603-1-maarten.zanders@mind.be>
 <20221028152626.109603-3-maarten.zanders@mind.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CTm34KFJgvYlATpl"
Content-Disposition: inline
In-Reply-To: <20221028152626.109603-3-maarten.zanders@mind.be>
X-Cookie: Dr. Jekyll had something to Hyde.
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--CTm34KFJgvYlATpl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 28, 2022 at 05:26:24PM +0200, Maarten Zanders wrote:
> The ADAU1372 contains 24bit ADCs and DACs. Allow the driver to use
> its native mode which uses the same settings as the current 32 bit
> mode.

Normally new features like this should come at the end of the series so
that they don't get in the way of merging fixes.  No need to resend for
this though.

--CTm34KFJgvYlATpl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOBGFoACgkQJNaLcl1U
h9D3Mwf+KPSYbzaBMaX8a1l1Rw5piPOad6g17prchlI0G/6S31mIMHcY7jyePJC7
SEzaZEsa7A6UZEsCKLnhLRwvPm1322RIpscb3u/XOrKfgWtMEKItKnpz9vsK10DB
u/CPeSF8Rju7br3b2fVlfK6DfI+JV5SqMr9D/T2XaHmei7BGkHshaRObT2ehGJAI
VnXneT2lJm+XQ8dqjt1wNnwbnGINbxxZYq6tjzLsI3MbybVepH1c9yIDkNS3yGdX
dZPKQ1zHpXGH7JvH0ZuE9u8SjOPrzzS0qPOHZ0iCeKmb+d6ezsWCYKQw9T3MBdc3
G39JtZ4DX1IPV6I94BZeErpOFmiWEA==
=Isv5
-----END PGP SIGNATURE-----

--CTm34KFJgvYlATpl--
