Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED93B177665
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 13:49:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 725A5167D;
	Tue,  3 Mar 2020 13:48:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 725A5167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583239768;
	bh=UbXuZRyvxQEDOwMNOUPOm66QPzbIXhylpFRPvHLl7So=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dG7C/c2XS4sO3+rdE4+h6lwXIvNTGj9nHr4r2OBWdHlNZaphbk/bqamCnm8tfCGH3
	 chSIdytTDetOVE7OvxWsULzYS1t4TWUIxDfwMeUrmo7myLv24aWF7jTQ/TSKwf+4Xs
	 4+3SliYRK9KbhYAjgf50Gkp7u1RM4az1/QNUWT6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78E56F80266;
	Tue,  3 Mar 2020 13:47:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52391F8025F; Tue,  3 Mar 2020 13:47:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CB3BFF80131
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 13:47:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB3BFF80131
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBA03FEC;
 Tue,  3 Mar 2020 04:47:40 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FB513F534;
 Tue,  3 Mar 2020 04:47:40 -0800 (PST)
Date: Tue, 3 Mar 2020 12:47:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v4 1/8] ASoC: dt-bindings: fsl_asrc: Change asrc-width to
 asrc-format
Message-ID: <20200303124739.GE3866@sirena.org.uk>
References: <cover.1583039752.git.shengjiu.wang@nxp.com>
 <872c2e1082de6348318e14ccd31884d62355c282.1583039752.git.shengjiu.wang@nxp.com>
 <20200303014133.GA24596@bogus>
 <CAA+D8ANgECaz=tRtRwNP=jMXBD0XciAE0HUYROH8uuo03iDejg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Content-Disposition: inline
In-Reply-To: <CAA+D8ANgECaz=tRtRwNP=jMXBD0XciAE0HUYROH8uuo03iDejg@mail.gmail.com>
X-Cookie: Drilling for oil is boring.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Timur Tabi <timur@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, shawnguo@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, linux-imx@nxp.com,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
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


--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 03, 2020 at 11:59:30AM +0800, Shengjiu Wang wrote:
> On Tue, Mar 3, 2020 at 9:43 AM Rob Herring <robh@kernel.org> wrote:

> > > -   - fsl,asrc-width  : Defines a mutual sample width used by DPCM Back Ends.
> > > +   - fsl,asrc-format : Defines a mutual sample format used by DPCM Back
> > > +                       Ends. The value is one of SNDRV_PCM_FORMAT_XX in
> > > +                       "include/uapi/sound/asound.h"

> > You can't just change properties. They are an ABI.

> I have updated all the things related with this ABI in this patch series.
> What else should I do?

Like Nicolin says you should continue to support the old stuff.  The
kernel should work with people's out of tree DTs too so simply updating
everything in the tree isn't enough.

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5eUeoACgkQJNaLcl1U
h9AJywf/bSiQfVDbeUAktcdvjHCRmCvZQ5r/DETvXQh3jrq8ZMfLbfd8mIoxnaPL
QCqx6aL0X4owNuPMZ8fq3jStJL1uCFJudtfA9a+H/n57opep5mhmsAw0VTUSRKxV
3YPmdTKQtoGd3GnxrcUo9Z62ssQY3K0bCy5wGjcCxOW8alaFlJqj2st0dMbC6UNb
UbxOrZp2jWpVH3U+/0qh5i5QiV9h+ctw/f1BmEPzZYb32S4Ie9Q2ldINFhbMbnMQ
gwAeyISGShAYVLuWzbVCe8e09slQqGYmKprtmCn4xgokE2+UvnQNCIuxyx+TLeXY
6xJH0vBb6D/26k+09f8BENOxCCBv4w==
=EdGJ
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--
