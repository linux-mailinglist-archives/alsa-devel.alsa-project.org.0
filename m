Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E92FCFF51
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 18:54:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB34E86E;
	Tue,  8 Oct 2019 18:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB34E86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570553665;
	bh=Pb03JxmCRTmGZKRDRU22THYRtO5mzYXOM3Xbc5xNbBg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pw9SZk/ptuethp3NgEuVOhM+97Ss7ZplpkF7yqO1YypA4huhAt3498/RALrtir8ye
	 YhjqowQJud0XQvKc5bKdjcnW9YmMyZT3PrYzyjMcTwUsvr/XwuTc7MM4G3nlWVhdZy
	 nBN7tR/5MPCrMCBubRPAcE9W8R5lkLP0hT+bcjYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C24BF8045E;
	Tue,  8 Oct 2019 18:52:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF82AF8038F; Tue,  8 Oct 2019 18:52:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6A60F800BF
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 18:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6A60F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LAN2pwMT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bxciPF2qPn6AVINPKLIOVCuywf0FCe9PPs/xWu6z0Tk=; b=LAN2pwMT0t97CtLQP2ucTpwAW
 UE2/K1a7mzPqprHmvlGXliUK2y+1MyChVWUn8Qgf9whpl4Y7SD89JyxScg+PFExLw3y62yrjY7+cZ
 URNkjYrQflcsIYtheCswHdyywCUfG5hGkx2DM+pmgY2oH04f2ZUO8dYMiNLLxK5+06Q5I=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHsit-0000Xu-O3; Tue, 08 Oct 2019 16:52:31 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D4E342740D4A; Tue,  8 Oct 2019 17:52:30 +0100 (BST)
Date: Tue, 8 Oct 2019 17:52:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Ladislav Michl <ladis@linux-mips.org>
Message-ID: <20191008165230.GR4382@sirena.co.uk>
References: <20191006104631.60608-1-yuehaibing@huawei.com>
 <20191007130309.EAEBE2741EF0@ypsilon.sirena.org.uk>
 <20191008163508.GA16283@lenoch>
MIME-Version: 1.0
In-Reply-To: <20191008163508.GA16283@lenoch>
X-Cookie: Do not disturb.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
 piotrs@opensource.cirrus.com, YueHaibing <yuehaibing@huawei.com>,
 m.felsch@pengutronix.de, linux-kernel@vger.kernel.org, paul@crapouillou.net,
 Hulk Robot <hulkci@huawei.com>, srinivas.kandagatla@linaro.org,
 andradanciu1997@gmail.com, enric.balletbo@collabora.com,
 shifu0704@thundersoft.com, tiwai@suse.com, mirq-linux@rere.qmqm.pl,
 rf@opensource.wolfsonmicro.com
Subject: Re: [alsa-devel] Applied "ASoc: tas2770: Fix build error without
 GPIOLIB" to the asoc tree
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
Content-Type: multipart/mixed; boundary="===============4728741462699406682=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4728741462699406682==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o99acAvKqrTZeiCU"
Content-Disposition: inline


--o99acAvKqrTZeiCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 08, 2019 at 06:35:08PM +0200, Ladislav Michl wrote:

> Hmm, too late it seems...
> Patch should actually remove <linux/gpio.h> as this is legacy one (see comment
> on the top and also Documentation/driver-api/gpio/consumer.rst)

Yes, leaving that is an oversight.

> And that brings a question. Given this is -next only is it actually possible
> to squash fixes into 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
> just to make bisect a bit more happy?

No:

> > If any updates are required or you are submitting further changes they
> > should be sent as incremental updates against current git, existing
> > patches will not be replaced.

Apart from anything else I've merged up the fixes branch IIRC which
causes trouble.

--o99acAvKqrTZeiCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2cvs0ACgkQJNaLcl1U
h9AmBQf+LFk5zJqNRstdPMwgLOJGb5LX3O5w3BWeoMJNChq1Mdb1mJ+aaafn3HtA
lgfos+SLHeSz48AHvgTqZ7DvEyjx2abNyeWCc3LH0S0mIp6RQey9Vxtt5eVP3yav
5E6bRHBoX+Nv+0MqM73S31xLehzpo68qL9Iy2a5yh9TIRFjrVHZjIslo2CgNPkd4
EQDMuoYYooV3BBHGFIiCAOpS8RA5eSgIUN6Cg/M9/+BHGsLW4bako+iFjIbHgH4F
32VljVKllo5noLJsauG+ImjqHJGt11YCjp0AJL60CApDiLLFrUucBV3G/Hj5VHDt
taLaofFv9ONyk9UWxKcoCAqTYirgIw==
=rHvp
-----END PGP SIGNATURE-----

--o99acAvKqrTZeiCU--

--===============4728741462699406682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4728741462699406682==--
