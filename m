Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0F71DB3D4
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 14:40:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7F6317EF;
	Wed, 20 May 2020 14:39:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7F6317EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589978443;
	bh=g7mq7A46A2rwnilYsWelJzFIzIUJhVoiPiT9cEmHRqM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qHBeSDx18PWnopq+TnsMGqo7K6TRmc3kqDK7uP9Ysi+Lw3H1PaYt04kVpXngp2knO
	 Ry2h/d+VmKb+HjRZrQkFpvjlRdPYsnPVypMi30LXHSrZoInOdbmWTvFpupxz9+8ZNC
	 R+gsXZrjQ/Jfa0LhBA6mtfl/ramKerXyuZV3mnPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBA69F801DA;
	Wed, 20 May 2020 14:39:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78338F801F9; Wed, 20 May 2020 14:38:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7031AF80090
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 14:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7031AF80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="y05unyyJ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E16B320758;
 Wed, 20 May 2020 12:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589978332;
 bh=g7mq7A46A2rwnilYsWelJzFIzIUJhVoiPiT9cEmHRqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=y05unyyJD7TNaV987OdTJu89O1CnVTvMOJXBtUxxhoRdPpPwrGFOLAsPQdIHmglCZ
 /TdnyHJTd4wnRuuEc9rHwD1xbrOzJV3PPWqVGYYRc76P5MIZ6Tiib5JDErJJuforA+
 evfuyTPGebwbAc8o+UKJkiW+ST3XQhvcR1GdBas8=
Date: Wed, 20 May 2020 13:38:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in probe
Message-ID: <20200520123850.GE4823@sirena.org.uk>
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
 <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
 <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
 <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
 <CAA+D8APAMRwtVneqFsuBgAhozmQo3R0AQi0bVdUCQO4Af4xVfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lteA1dqeVaWQ9QQl"
Content-Disposition: inline
In-Reply-To: <CAA+D8APAMRwtVneqFsuBgAhozmQo3R0AQi0bVdUCQO4Af4xVfw@mail.gmail.com>
X-Cookie: You can't get there from here.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, shawnguo@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, linux-imx@nxp.com,
 kernel@pengutronix.de, linux-media@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
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


--lteA1dqeVaWQ9QQl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 07:22:19PM +0800, Shengjiu Wang wrote:

> I see some driver also request dma channel in open() or hw_params().
> how can they avoid the defer probe issue?
> for example=EF=BC=9A
> sound/arm/pxa2xx-pcm-lib.c
> sound/soc/sprd/sprd-pcm-dma.c

Other drivers having problems means those drivers should be fixed, not
that we should copy the problems.  In the case of the PXA driver that's
very old code which predates deferred probe by I'd guess a decade.

--lteA1dqeVaWQ9QQl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7FJNkACgkQJNaLcl1U
h9CQxAf/XWB/BDAkTjyNyif7eAXkZvu58koo16rODvQZScO1qMJDv7rgM7PAY3cp
oA8PM6mc2y9ilW+8iJcaRBUazw743WsZy4B8+4zgZ4S+16WavSbW/TcgoP1XHKmn
45dF0NFIESHhxVhwdmHAhRrolV6ukd4taibnCUbPFBbG3AgT7XjvOl8gQmwY5Xbr
4WC83n6SHn8es9HF2g733RvA8jAFMr+biVQ7FnsyxEhi3oMgOYF7LOQ+ZrBM69xC
49iQbno7b5fQ8cPQLKmdt5mzBp0n5anoHWFvvk1zi1RPqM+7gGMv/DBvAB8u7o+F
l8Qr1SUzhOsG/j0FDFUIriQktZ4TEw==
=CLfU
-----END PGP SIGNATURE-----

--lteA1dqeVaWQ9QQl--
