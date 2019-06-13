Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F90444A7F
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 20:16:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 313C7181A;
	Thu, 13 Jun 2019 20:15:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 313C7181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560449797;
	bh=8Avt7BfrUeWLSGmw6GNegC8j6nG/QAcDttLJGWkN9pc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=in4RkAmn/Pflujz8AGa3Hu5Xi23JxDIm7RER593s0S8eVW/Q5LFalDVm3bp4gLw/Z
	 lMX2T4nr78eIi0BHIEP8mp6tXHDi/gsDKAORUcAGdQZHZit6z0iMSz4bWuGeK2nc+5
	 QeKr7vdSi6GsZIh+yWxnmSFumwos6MWPaYBEy77Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2344F89711;
	Thu, 13 Jun 2019 20:14:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE4F0F89703; Thu, 13 Jun 2019 20:14:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93AB3F80794
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 20:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93AB3F80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="fS9qeQP9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=urMa43C+0jgItqUyKJ9OgJ7uvJ3NBZiThEq7mP6kNFo=; b=fS9qeQP9mDtbwyTQps7xsg8TY
 Xi5vuZ820jGy9LW6yXfnIKJ/QIfObCgPNLzwy7yiszNFR1GrkwXIe5coL5ZTRb2Dv5FR4SAJVJnHs
 eYtFB45+9apT1zy91xxZCBO99lRTwGbLggEPjQuISbkZ1S0RKNZw1/ohoFLPwPqzqvLc0=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbUFI-0005Ms-0T; Thu, 13 Jun 2019 18:14:44 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 6007A440046; Thu, 13 Jun 2019 19:14:43 +0100 (BST)
Date: Thu, 13 Jun 2019 19:14:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <20190613181443.GQ5316@sirena.org.uk>
References: <20190611174909.12162-1-thomas.preston@codethink.co.uk>
 <20190611174909.12162-4-thomas.preston@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <20190611174909.12162-4-thomas.preston@codethink.co.uk>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Marco Felsch <m.felsch@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [PATCH v1 3/4] ASoC: tda7802: Add enable device
	attribute
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
Content-Type: multipart/mixed; boundary="===============0819496718414029623=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0819496718414029623==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uRjmd8ppyyws0Tml"
Content-Disposition: inline


--uRjmd8ppyyws0Tml
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2019 at 06:49:08PM +0100, Thomas Preston wrote:
> Add a device attribute to control the enable regulator. Write 1 to
> enable, 0 to disable (ref-count minus one), or -1 to force disable the
> physical pin.

> To disable a set of amplifiers wired to the same enable gpio, each
> device must be disabled. For example:

> 	echo 0 > /sys/devices/.../device:00/enable
> 	echo 0 > /sys/devices/.../device:01/enable

This is adding a new ABI completely outstide the standard ALSA and power
management frameworks and ABIs with no explanation as to why or
integration with the rest of the driver.  This is obviously not in the
slightest bit OK.  If there's something missing from the frameworks
extend the frameworks, don't just ignore them.

--uRjmd8ppyyws0Tml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0CkpIACgkQJNaLcl1U
h9BS2Qf/eUVj90LcvztgsSKTKJesxl0D3bt7RMK299c2vYLHkirE0vtrBBYdi4Pl
FJ8puURfuyztbRnoMYrmvkGzoB+kCtwXLSxo2i1Mi6NSlQfnwwg0aoE9RHuB0oOD
/2hT/ekihe5UadF/JGir89imbhQob5EDyVVzjEgyWULQ4ITpkAw8wiaIcF3GNrjY
yFLb/wBrR+BM4SXfJKc+SmWy+xt1btn93sWuiaU7SMS86bIEbT1h0w4vQ1p3v2+/
qjopN+wN8BrUnWRHi7xBR4eocG6hGN9+z6/Xkhr2XL8E0tyaDly5TMDZomOPYAif
beljIAen1oDtCE4MOp25DYHPAJUmzg==
=ioNi
-----END PGP SIGNATURE-----

--uRjmd8ppyyws0Tml--

--===============0819496718414029623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0819496718414029623==--
