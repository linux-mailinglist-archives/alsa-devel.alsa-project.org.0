Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F65FC2407
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2019 17:13:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6066166B;
	Mon, 30 Sep 2019 17:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6066166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569856404;
	bh=Js7Cj8Cvnxa+d4ynjk0MqKk2dzYWI59UoBxbGNfsAiA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rJ1lMkNsMjIiI1RYcSrbOdi9vEsZTZunEda0DV0Pf6ax6W77iQlVZz2q/eXORuxF2
	 SOZuITaQMLR/HaPa21dYcuojcoV1hozmg+32pIw1EG/W6k4JCQ3cDo7gLGKUyKCYcw
	 +FpHGZ+q1yMg1JaGG3pRlf8qzBEAcyHadpEZpvg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59C01F803D5;
	Mon, 30 Sep 2019 17:11:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86EBBF80391; Mon, 30 Sep 2019 17:11:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48232F800D0
 for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2019 17:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48232F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="p63xC20X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8uSfWCZgaluu7uas+vrNL5RwfSc5wU4qMNPdunevW+g=; b=p63xC20XYZ6IwhINUL0OO9wgM
 /vpVVFPJakns3ost04TDmFPe/gnoUnxo7QBrcPYdE6lxNTLgRcno9ui7wlixQ7MGl+Ktd62P+JG6D
 hZB3c9Gte/f8Y8Pfn5L0M9f6r4yqolks3RsYxdBz1f62QucZ5gnmCDdH+ZLOeVJsTpLUI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iExKn-0006z4-7t; Mon, 30 Sep 2019 15:11:33 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4E9A32742CE9; Mon, 30 Sep 2019 16:11:32 +0100 (BST)
Date: Mon, 30 Sep 2019 16:11:32 +0100
From: Mark Brown <broonie@kernel.org>
To: "Sa, Nuno" <Nuno.Sa@analog.com>
Message-ID: <20190930151132.GA4265@sirena.co.uk>
References: <20190926071707.17557-1-nuno.sa@analog.com>
 <20190926184318.GF2036@sirena.org.uk>
 <6245f99f37c10dcec0a52344bab4b980f08e07da.camel@analog.com>
MIME-Version: 1.0
In-Reply-To: <6245f99f37c10dcec0a52344bab4b980f08e07da.camel@analog.com>
X-Cookie: Mickey Mouse wears a Spiro Agnew watch.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/2] ASOC: Add ADAU7118 8 Channel
 PDM-to-I2S/TDM Converter driver
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
Content-Type: multipart/mixed; boundary="===============3642646242028983781=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3642646242028983781==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 30, 2019 at 09:44:00AM +0000, Sa, Nuno wrote:
> On Thu, 2019-09-26 at 11:43 -0700, Mark Brown wrote:

> > > +	case SND_SOC_DAIFMT_RIGHT_J:
> > > +		st->right_j = true;
> > > +		break;

> > Don't we need to set any register values here?

> The register set is done in adau7118_hw_params(). For right
> justification the device can delay bclck by 8, 12 or 16. So, We need to
> know the data_width to check if we can apply the configuration.

OK.

> > > +	case SND_SOC_BIAS_STANDBY:
> > > +		if (snd_soc_component_get_bias_level(component) ==
> > > +							SND_SOC_BIAS_OF
> > > F) {
> > > +			if (!st->iovdd)
> > > +				return 0;

> > This is broken, the device will always require power so it should
> > always control the regulators.

> The reason why I made this optional was to let the user assume that, in
> some cases, the supply can be always present (and not controlled by the
> kernel) and, in those cases, he would not have to care about giving
> regulators nodes in devicetree. Furthermore, the driver would not have

Have you tried doing that?  Notice how the regulator API subtitutes in a
dummy regulator for you and the driver works fine without custom code.

> to care about enabling/disabling  regulators. Is this not a valid
> scenario? Or is it that, for this kind of devices it does not really

It's not a valid scenario in driver code - the driver shouldn't be
randomly ignoring errors and hoping the errors were deliberate rather
than indiciations of real problems.

> > > +static int adau7118_resume(struct snd_soc_component *component)
> > > +{
> > > +	return snd_soc_component_force_bias_level(component,
> > > +						  SND_SOC_BIAS_STANDBY)
> > > ;
> > > +}

> > Let DAPM do this for you, there's no substantial delays on power
> > on so you're probably best just setting idle_bias_off.

> So, this means dropping resume/suspend and to not set idle_bias_on,
> right?

Right.  Like I say it looks like your power up path is fast enough for
this.

> > > +static int adau7118_regulator_setup(struct adau7118_data *st)
> > > +{
> > > +	int ret = 0;
> > > +
> > > +	st->iovdd = devm_regulator_get_optional(st->dev, "IOVDD");
> > > +	if (!IS_ERR(st->iovdd)) {

> > Unless the device can operate with supplies physically absent it
> > should not be requesting regulators as optional, this breaks your
> > error handling especially with probe deferral which is a fairly
> > common case.

> Just for my understanding (most likely I'm missing something obvious),
> why would I have issues with the error handling in probe deferral?

Actually it does look like you handle this correctly further down, the
normal pattern would have been to have the error handling inside the if
here and not indent the rest of the success path so I misread it.

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2SGyMACgkQJNaLcl1U
h9CkAwf9EYiV4BQm0xxoHsLhEYWWYl4f4l8dyWkSXXJg/n2cm55ZotoM4Rxa3+Ir
L9m1vcsZPqn9T9CR2lBzOUKXfFkPnvpxao2yvwaZHrZrHELKGBtG+g+Kjgk9YT2+
VjvdYBf7czonV8AmRHnvZpgzv69cAfLJM0H4iVfmy0sclAgCMBSesTixTUDGcRgw
IjiCtqt9TkzZBrLUqefaCMDN3k3Jba+3jA580jZS3SUS6geaLyQCzSOnTkPQUka5
BAlftJCTfbAH/dUVLJlvpDTbzN11ivTduZU/y5q5SMvgp17jDU/e7yF0QUVDv0wK
zLChmYfli7ZUEHXi44LPrAeOfZY9NQ==
=syDp
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--

--===============3642646242028983781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3642646242028983781==--
