Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8BE33937B
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 17:34:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85FFA1783;
	Fri, 12 Mar 2021 17:33:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85FFA1783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615566863;
	bh=EMl1b1pyURApZczx1x0xsw7fa1cXeaE2MfqTv6FESOU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZLpNZW5N6e6romygIh+JHv4/M7+tt3THY9f/SL+RLk1D0s/Gqb8bMuoFpjwcqNtTM
	 YPzHsAT8+xMbDyfQcO7BQzq0hPpxuGfxUkQthedQYSF1aulbJNFKf5BawyW1l1fa/j
	 vDZEsEctICVV2xQfXLoTlSGzkRIsgmUhmCLwp7FM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC58FF80272;
	Fri, 12 Mar 2021 17:32:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE295F80217; Fri, 12 Mar 2021 17:32:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C4E4F8016C
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 17:32:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C4E4F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a6TmfKTk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F36F64F9E;
 Fri, 12 Mar 2021 16:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615566757;
 bh=EMl1b1pyURApZczx1x0xsw7fa1cXeaE2MfqTv6FESOU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a6TmfKTkPSK8xTpMS20k2G71vulcip/IrAyhW6bM/hgGFytiTQMeQlaQ5cNNRarFi
 XKIxO350J6rLEoL5yvhElFXYjCc1uAUGDKS1IiCk2deMB0H7zw68kla/NX1txmxUFE
 Dz1crXvCGeWuH+34AjjVMWKBnUv6Ocu2aG8AUmk/mbiYIjE66PV+HM6HjcAh/n04Jb
 wpRZLFdbvKdeDupoZ8yLOy9YjiI6+ffVawUdtx+v4oCGKd4UB90d4T14bbYCO5In1m
 MTZzoMOnq9ONiE0zv8EZnSxEOh3l5eX4nHQPSrqf0p2D8UsaGa6/hG2G46CzqJZgP7
 SitF638b7QXEg==
Date: Fri, 12 Mar 2021 16:31:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v3 1/2] ASoC: samsung: tm2_wm5110: check of of_parse
 return value
Message-ID: <20210312163124.GK5348@sirena.org.uk>
References: <20210311003516.120003-1-pierre-louis.bossart@linux.intel.com>
 <20210311003516.120003-2-pierre-louis.bossart@linux.intel.com>
 <20210312142812.GA17802@sirena.org.uk>
 <a9caf1c6-d9d0-7e05-31f2-6a8d9026e509@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/rDaUNvWv5XYRSKj"
Content-Disposition: inline
In-Reply-To: <a9caf1c6-d9d0-7e05-31f2-6a8d9026e509@linux.intel.com>
X-Cookie: Lake Erie died for your sins.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, stable@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
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


--/rDaUNvWv5XYRSKj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 12, 2021 at 10:30:32AM -0600, Pierre-Louis Bossart wrote:
> On 3/12/21 8:28 AM, Mark Brown wrote:

> > Commit: 11bc3bb24003 ("ASoC: samsung: tm2_wm5110: check of of_parse return value")
> > 	Fixes tag: Fixes: 8d1513cef51a ("ASoC: samsung: Add support for HDMI audio on TM2board")
> > 	Has these problem(s):
> > 		- Subject does not match target commit subject
> > 		  Just use
> > 			git log -1 --format='Fixes: %h ("%s")'

> Sorry, I don't know what to make of this. I don't see this commit
> 11bc3bb24003

> Something odd happened, there was an initial merge and it seems to have
> disappeared, it's no longer in the for-next branch?

That commit is your patch being applied, which I've dropped because of
the error reported.

--/rDaUNvWv5XYRSKj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBLl1sACgkQJNaLcl1U
h9B/nwf/WVJ7MLmAlhVAmtryaOQ1izrwS2+9b0jCB0uKX6RX1ciqf++LO5nLNePt
+NEFA9UH7Qaa8YN4k3Q8tCgoSb7x7g/S8zGwnufZlqiBtprcZKqGUm+34JhsZhEj
oha1PzPGa7TFGYra5DaMOU2NTNjue7BVZDKKx6LOvpmlNC2uMZkThMIUC+fpCHse
20/5Y/W31QpdZHzCMvo9fY039Olbwt3nvxNmM9850uoPNxD5k/LFOSdy61qJZp9k
LfVVdHdlAPifpb5cRg0XKGAwmgncu1Exutb0lFNUerO4srP4B73mGWFmfMFioPxj
ixtaDpBbx7RaBjBBd6GxPdCwk8KVTw==
=4CYu
-----END PGP SIGNATURE-----

--/rDaUNvWv5XYRSKj--
