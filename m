Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABF4508C0C
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 17:25:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 158891AE0;
	Wed, 20 Apr 2022 17:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 158891AE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650468315;
	bh=pTegFcEzPPzXHOlhThQwB50tWAx2IuniG5QgJSoNRBw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NAmM5xldwea++rg1jLlKsGB6P9rxl+PSoPruIS/kF6TD85SHIlowdcfw91WLHU+0C
	 oL9zBghSAkSUAMln3EheWQz0zRa/VlutzDV1c4nQeV+bSecXfHMSaYdq6TcNN5zt5Y
	 DIyIDca4CCLUBajVbLgk5y6ag5MX/6jp9b6vaoQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68510F80128;
	Wed, 20 Apr 2022 17:24:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36250F8010B; Wed, 20 Apr 2022 17:24:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0ED10F8010B;
 Wed, 20 Apr 2022 17:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ED10F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vDjy4Cei"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EBE43B81F95;
 Wed, 20 Apr 2022 15:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B52C385A1;
 Wed, 20 Apr 2022 15:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650468245;
 bh=pTegFcEzPPzXHOlhThQwB50tWAx2IuniG5QgJSoNRBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vDjy4CeioT1M/pnJcfekxFqW5ZiVgGgJ4riZPiFjYyv5YRgdNXA2FU5IwW7dEsm10
 KuO08g4r4BCEqyGP6W7+e87bzcnrszXjrjMuR+G9AAU+x2gwKyN7acwx7C+giY7iYK
 McjEEGACHuMZboB671mbAjyvYrhWbTh98YCJI9RepNSU2DO4qyAnO8m0VQQ/C/CSQz
 VUWuFYZC0KLt5+oI9olTL2IL0dLsnFSXvHuKv1cHnCMZGYXkEhesEcoOv6cFHwgruA
 Zng0osQR/cnHAQ857cuBLQ3XEggOsvi0r0GkucgosS6A1yYXgfpFeV2l2p+0FQTY6U
 PiicTLOhar3CQ==
Date: Wed, 20 Apr 2022 16:23:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: using pm_runtime_resume_and_get to simplify
 the code
Message-ID: <YmAljQjpLCoBv+nj@sirena.org.uk>
References: <20220420030315.2575691-1-chi.minghao@zte.com.cn>
 <78c7edc3-f431-9735-238d-9aa2b45ec45e@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zeKpAx+TuuUhkCBw"
Content-Disposition: inline
In-Reply-To: <78c7edc3-f431-9735-238d-9aa2b45ec45e@linux.intel.com>
X-Cookie: Will it improve my CASH FLOW?
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cgel.zte@gmail.com, Zeal Robot <zealci@zte.com.cn>, lgirdwood@gmail.com,
 Minghao Chi <chi.minghao@zte.com.cn>, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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


--zeKpAx+TuuUhkCBw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 20, 2022 at 08:28:31AM -0500, Pierre-Louis Bossart wrote:
> On 4/19/22 22:03, cgel.zte@gmail.com wrote:
> > From: Minghao Chi <chi.minghao@zte.com.cn>

> > Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> > pm_runtime_put_noidle. This change is just to simplify the code, no
> > actual functional changes.

> Well, maybe that's a simplification, but we've been using the same pattern for years now.

> Is there really a clear direction to use this new function?

It seems like a much better pattern and there's been a steady stream of
conversion patches.  The whole get/idle thing is pretty much just sharp
edges.

> the overwhelming majority of drivers in sound/soc still rely on the pm_runtime_get_sync (111 v. 7).

We'll get there I'm sure.

--zeKpAx+TuuUhkCBw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJgJYwACgkQJNaLcl1U
h9ByVAf8DXE7lOFokxmahlu7hkfvPBsSrIveu11ngt9J9BUWxMgtsaM8uX7VcAEl
7si3QcSbzKxs4nTCChbLWU8ok7JZ06ArH2cKnKlDyeEC4u4nvUchV5CV3BkxrnKR
y/afCq90x9JXGnBD3UzdYDR33Myi6EQZ/mjIB3bM7Mgvf1O5ELCHruTkBdQADnTJ
gOgYg3AEGyQQCeDNJfLN4Ss8h0ofay9PGoYs9ibb0jnMP/qCfL9Z0Upo/KmfivHn
Zr9U4JasNeArdoGexSCe0Z0jyZlInbX2xqQBa03XFo6lzI2NAZzsyPSj6wprDgXR
h1QIOFvzTsQWTKbcXYd6wEIgbgI0Rw==
=qioF
-----END PGP SIGNATURE-----

--zeKpAx+TuuUhkCBw--
