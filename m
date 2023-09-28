Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5DF7B1CE5
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 14:48:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0098DEE;
	Thu, 28 Sep 2023 14:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0098DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695905291;
	bh=ZojkhVyYvjOakBy/EstOH1IibvwQIUhtEQYi7Jm6Uxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gj4Clcm/Dit0wYdJY6+HJ6ykxvDwOvpGIsIVDu3bgqFpW6wNCV9wt4q50q8q3Jbwm
	 vLIrKHaY21s1o26rRJi8Jgomql7iZ0HkvSeYiQtecLQBCFihyUxo5ILcj9yFL+dcA7
	 ycYFSHYmGjQGuaIhMLMGi9rg0MyDqxxs+JqFg9ek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DEB5F80549; Thu, 28 Sep 2023 14:47:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15724F8016A;
	Thu, 28 Sep 2023 14:47:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01E01F801D5; Thu, 28 Sep 2023 14:47:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7795FF8007C
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 14:47:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7795FF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BLGAhnFB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 85DF5CE218A;
	Thu, 28 Sep 2023 12:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CBFC433C7;
	Thu, 28 Sep 2023 12:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695905227;
	bh=ZojkhVyYvjOakBy/EstOH1IibvwQIUhtEQYi7Jm6Uxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BLGAhnFBbY1GdJsJjoae7P5CsecMYfOFJpPo2TtoyI6Pzj0N4ZliVLS3+JUh/3niY
	 P0vKtoSbnIBZgrAIe9+SkItxISCEPiqPa9NveBevZZJAphkxxSxDJAPXJvs9ty+YxZ
	 xpZXM/hfLLlhe93p4ujvwFUBxv8yNcu3aWFTsj9zkDnIeazYLGvCBM07n+PipWgk3i
	 bmoI6pEfvL18yak+DGgEGTJADo4zHx+fHAmpXUvmzWRKjP/Vc3Glu8dUIAAt/rBeYz
	 ErK1BSsggZ904QBvtjU1fFl1Jwth9bC+NBbm7Lj8KbXjnfgFMA/VOf2vpbrQ9j+SVb
	 frrY94zQfXYxA==
Date: Thu, 28 Sep 2023 14:47:05 +0200
From: Mark Brown <broonie@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>, alsa-devel@alsa-project.org,
	linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/4] ASoC: rockchip: Convert RK3288 HDMI to GPIO
 descriptors
Message-ID: <ZRV1yYs/xOXjlJ79@finisterre.sirena.org.uk>
References: <20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org>
 <20230928-descriptors-asoc-rockchip-v1-1-a142a42d4787@linaro.org>
 <9199562c-65ac-d8b1-20bd-429a32ede6c9@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6/w6Gx2e/XY3z/8g"
Content-Disposition: inline
In-Reply-To: <9199562c-65ac-d8b1-20bd-429a32ede6c9@arm.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: 4MQGXENAPCHBUZHRJHR63X7LPCS747VZ
X-Message-ID-Hash: 4MQGXENAPCHBUZHRJHR63X7LPCS747VZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4MQGXENAPCHBUZHRJHR63X7LPCS747VZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--6/w6Gx2e/XY3z/8g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 28, 2023 at 01:34:56PM +0100, Robin Murphy wrote:
> On 27/09/2023 11:47 pm, Linus Walleij wrote:

> > - As the probe() code is very insistent on getting valid
> >    GPIOs out of the device before it will continue, there
> >    is no point to carry all the code handling the GPIOs as
> >    optional, drop all these checks.

> Isn't it allowing them to be optional as long as of_get_named_gpio() returns
> -ENODEV (which I guess may come out of the chip->of_xlate callback)? Or is
> it implied that that's never actually been able to happen?

Right, I *think* it's just trying to open code optional GPIO support
(possibly it predates the core helpers?).

--6/w6Gx2e/XY3z/8g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUVdcgACgkQJNaLcl1U
h9DbSgf/bknMA1yTgPBPmmYPOHEHbjEGSeEmCX+Jh1W3Rrr6qLA0okNqn7DqGgKo
9jtRrzKcEIEgFMq7vhkyUtCLieHFdK0XBufLw/Eob4dNcQ53OTxxJI7n/o7iDlv4
LcAUFF3qzHFEd0HwA99vTPEnpUoL9duZgWiiWBY/iZ8/F76QUG5ED4H/3b2PlbZb
krLL1pRMD3gm7ToaaYcZnaCfH7MW+/VIlGmftGJa0uaS+f+VnLo1wqHX6NZTjqM7
DsI2KVG6SkdZZcxPgs8SvMZHMJ6R/6zrdlfTbUjXNZnWkj9MwHSlF2bsJzg4AcD1
FjQR7HVyTsaezL54ftcdpuOWMMmCwg==
=OfPk
-----END PGP SIGNATURE-----

--6/w6Gx2e/XY3z/8g--
