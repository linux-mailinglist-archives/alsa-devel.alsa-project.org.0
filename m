Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7927AB22
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 16:35:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43B7417CC;
	Tue, 30 Jul 2019 16:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43B7417CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564497334;
	bh=o+MTWbxUYy7JdncEuPepJ3wsXL7ANrlrGh31e5NI3Fo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IVZe0x6v9gNRuc01woX/6j4mL69WnSPPgQY0l63Kd4DoZeKN2RhVJ7iFmdyigqSt5
	 EeHKkT1f4tuirIx8TNyBAEGbKlcxzCCsZ4lEn9rA3JDdeswW9Vxc0o+RUOJdhOXyl7
	 osLcoBx9JBc7ZR1s5WgV10VuxhEbm5GVQ/RRbIcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D2ECF804CC;
	Tue, 30 Jul 2019 16:33:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78135F804CA; Tue, 30 Jul 2019 16:33:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3457F80214
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 16:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3457F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ABK7ohS2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bnSwB9Iwevew2RMS+oCUNWcQXcWmO0icV8safm3Y+7k=; b=ABK7ohS20te6PnMvyuuZd28/i
 TAkwBE7yPSt13/jqJ6SNPDPP3lgrEmoMtDV9UHHsHPJhOh1xvle6oaupTJMQ05802ahdVKb2UB8+K
 YY0hfF+0oCFnz5IWGYJ+cIgCRN6hWP67y7J2CEy2IxvLOelH9ssjwuEUH8Vt7YJAZz2Q4=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsTC9-0007ku-23; Tue, 30 Jul 2019 14:33:41 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 093CD2742CB5; Tue, 30 Jul 2019 15:33:39 +0100 (BST)
Date: Tue, 30 Jul 2019 15:33:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <20190730143339.GH4264@sirena.org.uk>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-2-thomas.preston@codethink.co.uk>
 <20190730122748.GF54126@ediswmail.ad.cirrus.com>
 <20190730131209.rdv2kdlrpfeouh66@pengutronix.de>
 <16a99e45-fd5a-2878-acf9-63518f9ca527@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <16a99e45-fd5a-2878-acf9-63518f9ca527@codethink.co.uk>
X-Cookie: Times approximate.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Annaliese McDermond <nh6z@nh6z.net>,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Patrick Glaser <pglaser@tesla.com>, Rob Duncan <rduncan@tesla.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Nate Case <ncase@tesla.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [PATCH v2 1/3] dt-bindings: ASoC: Add TDA7802
 amplifier
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
Content-Type: multipart/mixed; boundary="===============2244871063734404047=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2244871063734404047==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+QwZB9vYiNIzNXIj"
Content-Disposition: inline


--+QwZB9vYiNIzNXIj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2019 at 03:12:21PM +0100, Thomas Preston wrote:
> On 30/07/2019 14:12, Marco Felsch wrote:

> >>> +- compatible : "st,tda7802"
> >>> +- reg : the I2C address of the device
> >>> +- enable-supply : a regulator spec for the PLLen pin

> > Shouldn't that be a pin called 'pllen-gpios'? IMHO I would not use a
> > regulator for that.

> Hi Marco,
> We have multiple amplifiers hooked up in a chain, and all the PLLens
> are connected to one GPIO. So we need to use a regulator so that
> i2c-TDA7802:00 doesn't turn off the PLLen which i2c-TDA7802:01 still
> requires.

> This is why we use a regulator. Is there GPIO support for this?

If it's a GPIO not a regulator then it should be a GPIO not a regulator
in the device tree.  The device tree describes the hardware.  There was
some work on helping share GPIOs in the GPIO framework to accomodate
GPIOs for regulator enables, you should be able to do something similar
to what the regulator framework does.

--+QwZB9vYiNIzNXIj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1AVUMACgkQJNaLcl1U
h9Cu4Qf+OOSeubUr69q1X65qxycxElWJauRAa8zN5ZCS6Corf1z/+hgxkei5GI7D
p242D+7O5/QHuGlsws3pHfiD3BUJbV+/D05v8DDX1GOEf54+8wv+dnX/1AZKtYzS
IU/5aki3+oYGj76dQKpAhuTJFnJGGmkMg+O5SWXocr3KZO5P740PKZG0+wVX+yQp
OdZbJOEfztfQ8AfQQ4vtSjun2grcmxeEyxPo7LiL+iNs2ifAOZW6TWNIl7Y/Xftg
UNGdYVAtOL9s9G364+UmdAbLbQtKDtLLnotRd98S8NGElOoOGoLss6/pwrW2BHd4
CgdgNotIdcr1q2Me8acJM2d8pxjKWA==
=aDlD
-----END PGP SIGNATURE-----

--+QwZB9vYiNIzNXIj--

--===============2244871063734404047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2244871063734404047==--
