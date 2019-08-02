Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7107FF97
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 19:29:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7929316CD;
	Fri,  2 Aug 2019 19:29:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7929316CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564766995;
	bh=0VN6CEzljrUhs09GZlRjUbciHWjPm1sxc2sfEy+FFDc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sYIQgs6865LqvRbVhozxh+rW1DYaDDNV6tPA0NAaLrluIIJxQJGHfwaWuT0jaB78t
	 dM4TYengnT27rh0mV8DPbqddeDnVSAeE9ajZ4rlqpbXMClOtXTxyI78vmmDSjalzit
	 ygPoA6WwyUJLb4Fkd8rEdupb+MU8tmOakpnL4ULU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7B53F8049A;
	Fri,  2 Aug 2019 19:28:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04283F8048F; Fri,  2 Aug 2019 19:28:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F0B4F80214
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 19:28:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F0B4F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="wiA5cjO8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=19SYug1X49A7OlFCjT3NjS7tzEer+iU5emT8mMkyYto=; b=wiA5cjO8vCzDaLIC1P0dzbRa7
 Rk7kC51x8BNo8WA7vM0Xch+d3tG7JZSqG5p+v8h8C0Dw0J7/qn+B9D6hMGdWU7QX8ClO3GtsJHoak
 2NmuwXqYqSJma1EVrnxieTPDr+R/A+gPKCGjM+iS10Ud40Hkf0/aLil4k7Fmlw7ySGY0U=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1htbLR-0008U3-VA; Fri, 02 Aug 2019 17:27:58 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7EE982742DA7; Fri,  2 Aug 2019 18:27:56 +0100 (BST)
Date: Fri, 2 Aug 2019 18:27:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <20190802172756.GC5387@sirena.org.uk>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-4-thomas.preston@codethink.co.uk>
 <20190730141935.GF4264@sirena.org.uk>
 <45156592-a90f-b4f8-4d30-9631c03f1280@codethink.co.uk>
 <20190730155027.GJ4264@sirena.org.uk>
 <9b47a360-3b62-b968-b8d5-8639dc4b468d@codethink.co.uk>
 <20190801234241.GG5488@sirena.org.uk>
 <472cc4ee-2e80-8b08-d842-79c65df572f3@codethink.co.uk>
 <20190802111036.GB5387@sirena.org.uk>
 <ab0a2d14-90c0-6c28-2c80-351fccd85e68@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <ab0a2d14-90c0-6c28-2c80-351fccd85e68@codethink.co.uk>
X-Cookie: She blinded me with science!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Annaliese McDermond <nh6z@nh6z.net>, Marco Felsch <m.felsch@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [PATCH v2 3/3] ASoC: TDA7802: Add turn-on
 diagnostic routine
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
Content-Type: multipart/mixed; boundary="===============4780565417383196572=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4780565417383196572==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Content-Disposition: inline


--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2019 at 03:51:09PM +0100, Thomas Preston wrote:
> On 02/08/2019 12:10, Mark Brown wrote:

> > You can use a read only control for the readback, or just have it be
> > triggered by overwriting the readback value.  You can cache the result.

> Keeping the trigger and result together like that would be better I think,
> although the routine isn't supposed to run mid way through playback. If
> we're mid playback the debugfs routine has to turn off AMP_ON, take the
> device back to a known state, run diagnostics, then restore. Which causes
> a gap in the audible sound.

Whatever method is used to do the triggering can always return -EBUSY
when you someone tries to do so during playback.

> >> Kirill Marinushkin mentioned this in the first review [0], it just did=
n't
> >> really sink in until now!

> > You could do that too, yeah.  Depends on what this is diagnosing and if
> > that'd be useful.

> The diagnostic status bits describe situations such as:
> - open load (no speaker connected)
> - short to GND
> - short to VCC
> - etc

> The intention is to test if all the speakers are connected. So, one might=
=20
> have a self test which runs the diagnostic and verifies it outputs:

=2E..

> I think the module parameter method is more appropriate for a
> "Turn-on diagnostic", even though I don't really like grepping dmesg
> for the result. I'll go ahead and implement that unless anyone has a
> particular preference for the kcontrol-trigger.

Right.  It's not ideal for use in production systems for example but
perhaps fine for support techs or whoever.  Up to you anyway.

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1EcpsACgkQJNaLcl1U
h9APwgf/Q4KWsYkJw+Dyy8wm8pDjOkyVsUY1B9NZLLVp7mVndWT2ywIcipH0hV+Q
DeDX02ZUjkRup/AwNN/Ptwcy4GHnREbe7g6sJPgAtPFtXcuzUCJdUJsLDt4oXl5f
Nk2TjjELzuKqFz1E1zkIl8h1CowLDljJRTgCOp7mOhmT+x6kCjvURDzhkcXYPiib
wj2Rcu4thxX+oVvl7YkOpd0Wv+ZNGyM+8gEpjI22sy2MVjpMLT9SmzMp4OdfgT0h
dRVXoXKFIDT5zDpQEteTsuJdIS+NlBGM6yfKQ1fRu/+2gSh78+c/4dfT79d/h2ui
1ZJ5R45/kE4lb4xqQ2+hfM6IeKQQZQ==
=kN6B
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--

--===============4780565417383196572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4780565417383196572==--
