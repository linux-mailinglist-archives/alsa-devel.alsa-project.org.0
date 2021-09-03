Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74952400837
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Sep 2021 01:23:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFB561901;
	Sat,  4 Sep 2021 01:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFB561901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630711439;
	bh=tchsqUj+OfPK4wG9xezTZ/SvhX1irYZ1qa7IOGO6KLM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p5mvyz4mQSei6w/OCNhrtz8IcJoK3soOFrJwNC5fDooyS/tJQ1gkahCtAutipgbnr
	 Cp1B/mo7JndhKcyIAnqi+RB5f9OsZjx3ne3aIZb2ry3m+fTlzSXaq2oZBZVtt8Yut0
	 Gj7v7vCdXlJ7VwiW1gJyzKNgPpaavZIJoj5ztyPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C0A7F80088;
	Sat,  4 Sep 2021 01:22:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48595F80227; Sat,  4 Sep 2021 01:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dnyon.com (dnyon.com [82.223.165.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E67E9F80088
 for <alsa-devel@alsa-project.org>; Sat,  4 Sep 2021 01:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E67E9F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dnyon.com header.i=@dnyon.com
 header.b="Mo89RMoN"
Received: from dnyon.com (55.red-81-39-194.dynamicip.rima-tde.net
 [81.39.194.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dnyon.com (Postfix) with ESMTPSA id E27503FEB7;
 Fri,  3 Sep 2021 23:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dnyon.com; s=mail;
 t=1630711356; bh=tchsqUj+OfPK4wG9xezTZ/SvhX1irYZ1qa7IOGO6KLM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mo89RMoN243CTz4Z3TSYPsPPR7+S9ZVK9v/JFPzAwQM1o0plDtLKp8OU7iYHaGCHH
 WFYC6/GMynzNweAVzwbvbrbNgBlJcfAPnnGNljK8h6A6rROebEmrXWs9LywTmuETi8
 J6qokAgPzwa+SOLlIbN9Qok1b/+y5/ClwBFQKP7xKlRKAmL8qbM3/jxyNaJ6XFtgy/
 2QY65Pc6Dpzu3jNjKQkdFUlxjQf0dpNU/Lhcu2W3gOeY09inbkdvTiSj5CwDg0V4dm
 HNHkrapIghO84BULOW9Hz+yfVbxCsICJFNx4cnXqC3O5RMrKlOscpGMFcJ4uelyczH
 U++nWCwdyuVyw==
From: Alejandro Tafalla <atafalla@dnyon.com>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v3 1/2] ASoC: max98927: Handle reset gpio when probing i2c
Date: Sat, 04 Sep 2021 01:22:26 +0200
Message-ID: <5503823.DvuYhMxLoT@alexpc>
In-Reply-To: <80973391-4579-e14b-6def-ed81f367a4a5@linux.intel.com>
References: <cover.1630632805.git.atafalla@dnyon.com>
 <04a18f4115539752429da55fb857834cea0944e5.1630632805.git.atafalla@dnyon.com>
 <80973391-4579-e14b-6def-ed81f367a4a5@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>
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

On 3/9/21 11:20 P=E9ter Ujfalusi wrote:
>=20
> If this is a 'reset' pin then it's ACTIVE state is when it places the
> device to _reset_.
> GPIOD_OUT_LOW =3D=3D Deasserted state of the GPIO line.
>=20
> If the reset pin should be pulled low for reset (GPIO_ACTIVE_LOW) and
> you want the device initially  in reset then you need GPIOD_OUT_HIGH,
> because:
> GPIOD_OUT_HIGH =3D=3D Asserted state of the GPIO line.
>=20
> Same goes for the gpiod_set_value_cansleep():
> 0 - deasserted
> 1 =3D asserted
>=20
> and this all depends on how the gpio is defined in DT
> (GPIO_ACTIVE_LOW/HIGH), which depends on how the documentation refers to
> the pin...
>=20
> reset pin:
> low to keep the device in reset, high to release it from reset:
> GPIO_ACTIVE_LOW
> gpiod_set_value_cansleep(0) to enable
> gpiod_set_value_cansleep(1) to disable
>=20
>=20
> enable pin:
> high to enable the part, low to disable
> GPIO_ACTIVE_HIGH
> gpiod_set_value_cansleep(1) to enable
> gpiod_set_value_cansleep(0) to disable
>=20
> In both cases
> electrical 0: reset/disable
> electrical 1: enable
I'll change it to be consistent in the next version. Thank you for the=20
explanation.
=20
> > +	if (IS_ERR(reset_gpio)) {
> > +		ret =3D PTR_ERR(reset_gpio);
> > +		return dev_err_probe(&i2c->dev, ret, "failed to request=20
GPIO reset
> > pin"); +	}
> > +
> > +	if (reset_gpio) {
> > +		usleep_range(8000, 10000);
> > +		gpiod_set_value_cansleep(reset_gpio, 1);
> > +		usleep_range(1000, 5000);
> > +	}
> > +
>=20
> You might want to put the device to reset on remove at minimum.
Okay, thanks.

=2D-=20
Alejandro Tafalla


