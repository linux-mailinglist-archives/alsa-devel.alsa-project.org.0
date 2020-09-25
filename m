Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D1F278F2B
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 18:54:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AFFD18E3;
	Fri, 25 Sep 2020 18:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AFFD18E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601052869;
	bh=pAs4PaULX4H5SxYmIVtY8k566DgwXqnpA8RvoFzZpYM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oFtRDGiY2IYV6hyGm/CIjci+0BMPzj9O4hdQraCA3JAsqTeIMi9IX3FG4rIOrPuNY
	 Rcy0kgTNhW5fKz5pyNz+uOzTTyc8uZa2iSU2Axyp6JQ+7Z98SbcolMUCXuol76+gV8
	 /5eC/mq9lJvGzmco0TgyhOhRmyIBJE4zS3dbq/jQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A7FDF801EC;
	Fri, 25 Sep 2020 18:52:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25431F801EB; Fri, 25 Sep 2020 18:52:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE0F8F800DA
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 18:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE0F8F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YTdBKkL5"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 414C2208B6;
 Fri, 25 Sep 2020 16:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601052754;
 bh=pAs4PaULX4H5SxYmIVtY8k566DgwXqnpA8RvoFzZpYM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YTdBKkL5tYw/mImn8swZhrGk9vzf6nzl7Hw0XikzigszJWCPBiP+hWaf/13VbN389
 5FIClElHwfvwmJnLWq40CsK3iFZD6ElWocTEo+6s1fIGB2yQyY4hiuAK019ZjvVNCA
 cRFeddNyhDjvsggDQf+fZfo+WddkNz8XZaVKIJ6A=
Date: Fri, 25 Sep 2020 17:51:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Tuo Li <t-li20@mails.tsinghua.edu.cn>
Subject: Re: [PATCH] ALSA: rockchip: fix a possible divide-by-zero bug in
 rockchip_i2s_hw_params()
Message-ID: <20200925165139.GH4841@sirena.org.uk>
References: <20200830095106.4412-1-t-li20@mails.tsinghua.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VaKJWhUROU/xPxjb"
Content-Disposition: inline
In-Reply-To: <20200830095106.4412-1-t-li20@mails.tsinghua.edu.cn>
X-Cookie: Onward through the fog.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, heiko@sntech.de, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, linux-rockchip@lists.infradead.org,
 baijiaju1990@gmail.com, linux-arm-kernel@lists.infradead.org
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


--VaKJWhUROU/xPxjb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 30, 2020 at 05:51:06PM +0800, Tuo Li wrote:
> The variable bclk_rate is checked in:
>   if (bclk_rate && mclk_rate % bclk_rate)

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--VaKJWhUROU/xPxjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9uIBoACgkQJNaLcl1U
h9BPeAf9H4D1Q4H2endgDKFyhv77X9QSGBc0ttIMBIVm0+Sak3GDEkoTnPh6d9Ug
JUOIrJ0MsnS1f4sLC2Vj/NASTEa+cBQLQ2Vup5OBfkCQXBaWSm3J+UwQzujiX3o6
K/1Z4eyCfi83a5nWTlGqrzA7VLcG8Og4YcttIXGxXcOOctfzXrH+NUtZDzXvxxfm
Bn7o/Ja/4wlLRPpbXPowMn7sNlZrxwNAtNhmOobCOgZtCGPhJLvdrEk035oQK/82
y+s3JQChKzfTsDyyo10KR/nC7unePe9EWdsuEobaX47B2OywzsjRX4nD9Jw8NjRD
WRUxBaZJYk3Pblx0uegXkIv09S+Z+A==
=kTPr
-----END PGP SIGNATURE-----

--VaKJWhUROU/xPxjb--
