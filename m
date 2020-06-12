Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CD21F7BB4
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 18:36:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E611D167C;
	Fri, 12 Jun 2020 18:35:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E611D167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591979771;
	bh=L/66D9w5PWgrjPupjgMN8jneXeXB+Jo5RE3BP+FQTTk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IFRpDHpP6+xsiXEqaAnuo42GbYRhMmQcityWhwrfhvCWc5atlQ0pouKfp5uXn/rVG
	 OLtFNc3oho+fl5cvUwD8JVGG2rPbGQkTeWh+Q5owEgBo7Lpsy5TkdBH/EShJB0VJiH
	 Ez2nDoJegyhQlKlT65oBBy1VpBsu7Qt1kdUAV+OE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E30AF8021E;
	Fri, 12 Jun 2020 18:34:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D888F8021C; Fri, 12 Jun 2020 18:34:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A9D0F800CC
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 18:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A9D0F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2WB72oxs"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5755207ED;
 Fri, 12 Jun 2020 16:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591979664;
 bh=L/66D9w5PWgrjPupjgMN8jneXeXB+Jo5RE3BP+FQTTk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2WB72oxsVSbKDCYu9szi+iBvsuMz8j9lFjkRzEYleNJjnccD5AFohXTqE0cMMpqPq
 aDFFGi5io14zkc6qyt9VAhp8AwJCi3qrQ2iSUFZvlvDNsyR19anip0937+UR/+14Xv
 LT+ugjdMZIUPmTCjKKGUFfgz8Bkcf3GMLxpU6eyA=
Date: Fri, 12 Jun 2020 17:34:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Akshu Agrawal <akshu.agrawal@amd.com>
Subject: Re: [PATCH] ASoC: rt5682: Register clocks even when mclk is NULL
Message-ID: <20200612163421.GO5396@sirena.org.uk>
References: <20200612163111.11730-1-akshu.agrawal@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3snK74p7ddXn3Qrx"
Content-Disposition: inline
In-Reply-To: <20200612163111.11730-1-akshu.agrawal@amd.com>
X-Cookie: As seen on TV.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 yuhsuan@chromium.org, albertchen@realtek.com, derek.fang@realtek.com
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


--3snK74p7ddXn3Qrx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2020 at 10:01:11PM +0530, Akshu Agrawal wrote:
> Fixes kernel crash on platforms which do not have mclk exposed
> in CCF framework. For these platforms have mclk as NULL and
> continue to register clocks.

Derek already submitted this:

    https://lore.kernel.org/alsa-devel/1591938925-1070-5-git-send-email-derek.fang@realtek.com/T/#u

--3snK74p7ddXn3Qrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7jrowACgkQJNaLcl1U
h9DhtQf/W6wAWiy0Be5YPFAbq8u/x9HyjuNGc0oFVWM19OqtJzFCw4L+1oUe6oD+
uensM/lznoIPZTPdaey8niws1eRHFedflX4yhd2nHptRAswaFstK01FqZmQTXtca
ktWQeC+OIJvAwL3JUU7W8SI5hMWdeHfikrOI35wrmefjp7jW69orxHiBbKX5PdlQ
bIeudAohj8PyAx/IonmaieZNW+Vw4UvZ7UUk7Yuztk8rmIomzxW/pSSjIgSVbJmt
gVeNgRx/G2ivUsXbmSG0aC3CwMwV9Al+PSASLmhO5Rk8L2mIb6lglHd5UlrXV4mV
bRpOPPlyhG3LifoCx9EZmjnijdFEcw==
=jECX
-----END PGP SIGNATURE-----

--3snK74p7ddXn3Qrx--
