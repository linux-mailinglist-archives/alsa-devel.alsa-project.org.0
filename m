Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EF2799D1
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 22:22:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACC1D180A;
	Mon, 29 Jul 2019 22:21:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACC1D180A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564431721;
	bh=05vMJX2nBIVtp5LpqVoGCr2K/HUl/Co7khE9VCH4d8o=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wc4N1HxPGzBy0Oq0cZkzJ4HVALi3NlIXa/qTFLoEQf8z+BV9mhuv+uJu8HsdK8UTX
	 cg+25jpfhF5J18No5rHDUaxFe1HK/h/1sJGgJlZhz4HKcoZPb4G+dJ9pP3GVM3WYYd
	 LXZ+H0Stwi/s/ACSpoKLNUQvsOL8LGk3fT6UZqgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 686A0F80483;
	Mon, 29 Jul 2019 22:20:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86348F803D5; Mon, 29 Jul 2019 22:20:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02742F803D5
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 22:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02742F803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nn7AqtlN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wwTzfyTq9xH2jVCB72SSD9pIFJfoUBESNUKZEPJQU/c=; b=nn7AqtlNX0eCysL+6//+UX/4T
 +AAPNROZ8E/00SYlmowzHnKikJN/2tuR5XgXgOdSAu891tr8GB/hO0snXfBkcCawN7AVTmMNAoFaA
 FS7E5u5xeF/skleakEMEGT2Lqrl7asvHfRWJavS0/NBOivAh5rdMDIKuJ9E8xW5U8VaZo=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsC7m-0005MB-Uu; Mon, 29 Jul 2019 20:20:03 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6B92C2742AAD; Mon, 29 Jul 2019 21:20:01 +0100 (BST)
Date: Mon, 29 Jul 2019 21:20:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Message-ID: <20190729202001.GC4787@sirena.org.uk>
References: <20190728192429.1514-1-daniel.baluta@nxp.com>
 <20190728192429.1514-2-daniel.baluta@nxp.com>
 <20190729194214.GA20594@Asurada-Nvidia.nvidia.com>
 <CAEnQRZDmnAmgUkRGv3V5S7b5EnYTd2BO5NFuME2CfGb1=nAHzQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEnQRZDmnAmgUkRGv3V5S7b5EnYTd2BO5NFuME2CfGb1=nAHzQ@mail.gmail.com>
X-Cookie: A man's house is his hassle.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Viorel Suman <viorel.suman@nxp.com>,
 Timur Tabi <timur@kernel.org>, Rob Herring <robh@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mihai Serban <mihai.serban@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH v2 1/7] ASoC: fsl_sai: Add registers
 definition for multiple datalines
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
Content-Type: multipart/mixed; boundary="===============7955440088311175544=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7955440088311175544==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline


--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 29, 2019 at 10:57:43PM +0300, Daniel Baluta wrote:
> On Mon, Jul 29, 2019 at 10:42 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > On Sun, Jul 28, 2019 at 10:24:23PM +0300, Daniel Baluta wrote:

> > > @@ -704,7 +711,14 @@ static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
> > >       case FSL_SAI_TCR3:
> > >       case FSL_SAI_TCR4:
> > >       case FSL_SAI_TCR5:
> > > -     case FSL_SAI_TFR:
> > > +     case FSL_SAI_TFR0:

> > A tricky thing here is that those SAI instances on older SoC don't
> > support multi data lines physically, while seemly having registers
> > pre-defined. So your change doesn't sound doing anything wrong to
> > them at all, I am still wondering if it is necessary to apply them
> > to newer compatible only though, as for older compatibles of SAI,
> > these registers would be useless and confusing if being exposed.

> > What do you think?

> Yes, I thought about this too. But, I tried to keep the code as short
> as possible and technically it is not wrong. When 1 data line is supported
> for example application will only care about TDR0, TFR0, etc.

So long as it's safe to read the registers (you don't get a bus error or
anything) I'd say it's more trouble than it's worth to have separate
regmap configuations just for this.  The main reasons for restricting
readability are where there's physical problems with doing the reads or
to keep the size of the debugfs files under control for usability and
performance reasons.

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0/VPAACgkQJNaLcl1U
h9DrPwf9F9mjf8fAHvxxejGLd/jN+TU84DVsVv13Qp3jhAgobbWx/oF2xmX3A+b6
uyfWch7Ud2SYvm2wXm/31JAXXi3aTlTq7niolXa7Hal3cLO4JAGCyFl6ex5knCHa
D6ddUZyPG8Rag+kjm/ef2DQpTGHxKcP9nV6OTsn3v6QfOtZZiyl0nzaZnuEpUoxW
Qz2WR2OxuRoA0Q/KaPiQCCP72GHZ5Vr2qDdteQXunE49dMnI6M0+e/WSbbJu+1tO
toN2vyGNnUtNZK9IKgLbes65ihBd0026Otqg+cQEehLspgy8pwSap7TyZ123sVhM
Z+xhfS+8ong2rDpferXo+La8/+Tx0Q==
=PIWO
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--

--===============7955440088311175544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7955440088311175544==--
