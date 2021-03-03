Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 592A132B7BD
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 13:11:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC32A18DA;
	Wed,  3 Mar 2021 13:10:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC32A18DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614773503;
	bh=89eKz3gUtgGrZCWFlcqAsC5qI5BV9n/XotdV7YhLoNY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H8t4qWMJZd2hLEkizKC5fxspMHTBRgYawzAFiopy5rpYVTWpbk+ERPpfcbyWFQpBQ
	 I7LTE67wCW7idvJuOTuLnBMtt61DtQhJsyL6bG8fEJkiuIyXEBJYzpvkSJ2+KE1cQ1
	 nl8gMXxAcu1JSbpDktoefQEvBdV5kgkpdzYIn3n8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 473D9F80257;
	Wed,  3 Mar 2021 13:10:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01C4FF8025E; Wed,  3 Mar 2021 13:10:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59CBDF8012D
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 13:10:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59CBDF8012D
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lHQK5-0002tf-66; Wed, 03 Mar 2021 13:09:49 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lHQK2-000228-HX; Wed, 03 Mar 2021 13:09:46 +0100
Message-ID: <f581865a299091371a8450349e23ffdc8abb7b37.camel@pengutronix.de>
Subject: Re: [PATCH v1 5/5] ASoC: tegra30: i2s: Add reset control
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mark
 Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela
 <perex@perex.cz>, Paul Fertser <fercerpav@gmail.com>
Date: Wed, 03 Mar 2021 13:09:46 +0100
In-Reply-To: <cbb1f0d4-ddc5-733d-896d-dd76ce01ca69@gmail.com>
References: <20210302112123.24161-1-digetx@gmail.com>
 <20210302112123.24161-6-digetx@gmail.com>
 <cbb1f0d4-ddc5-733d-896d-dd76ce01ca69@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Hi Dmitry,

On Wed, 2021-03-03 at 11:28 +0300, Dmitry Osipenko wrote:
> 02.03.2021 14:21, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > The I2S reset may be asserted at a boot time. Tegra30 I2S driver doesn'=
t
> > manage the reset control and currently it happens to work because reset
> > is implicitly deasserted by the Tegra AHUB driver, but the reset of I2C
> > controller should be synchronous and I2S clock is disabled when AHUB is
> > reset. Add reset control to the Tegra30 I2S driver.
> >=20
> > Note that I2S reset was always specified in Tegra30+ device-trees, henc=
e
> > DTB ABI changes aren't required. Also note that AHUB touches I2S resets=
,
> > hence AHUB resets are now requested in a released state, allowing both
> > drivers to control the I2S resets together.
> >=20
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  sound/soc/tegra/tegra30_ahub.c | 14 ++++++++++---
> >  sound/soc/tegra/tegra30_i2s.c  | 36 +++++++++++++++++++++++++++++++++-
> >  sound/soc/tegra/tegra30_i2s.h  |  1 +
> >  3 files changed, 47 insertions(+), 4 deletions(-)
>=20
> ...
> > @@ -579,7 +587,7 @@ static int tegra30_ahub_probe(struct platform_devic=
e *pdev)
> >  	if (ret)
> >  		return ret;
> > =20
> > -	ahub->reset =3D devm_reset_control_array_get_exclusive(&pdev->dev);
> > +	ahub->reset =3D devm_reset_control_array_get_exclusive_released(&pdev=
->dev);
>=20
> Thinking a bit more about this, it looks like we actually want something
> like:
>=20
> 	devm_reset_control_array_get_exclusive_released_named()
>=20
> that will request resets by given names and in a given order, similarly
> to devm_clk_bulk_get(). This will be very handy for both Tegra audio and
> GPU drivers. I'll prepare a v2 if there are no objections.

I do have an untested reset control bulk API patch that I've just never
finished, because I had no user. I'll send you an RFC, let me know if
you can build on that.

regards
Philipp
