Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2C47E7BB
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 04:08:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74531169B;
	Fri,  2 Aug 2019 04:07:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74531169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564711706;
	bh=PPNW9qO91DPoextPD4aSFSRH/fBlE7EZ5XnfLbKxQcw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hf4KZ55xrYLOfTEaqT/dBAZBdFgM1xY15fiN8GVIoLVZjxF7y9ryfbz09XPxo+C3F
	 yBPzP5ePQL15Y8r4JzONJ2Zxf6iyyfqwoxywwV1TRTFn2qqgksU9bw0tsz+XBUCajZ
	 ELPCAD9f862hqbtHwNia15VAWBYiflSk2qOtd2YM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8602F804CF;
	Fri,  2 Aug 2019 01:42:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C5E0F804FD; Fri,  2 Aug 2019 01:42:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D549F804CB
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 01:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D549F804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FYVwCyEd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UeFWpR2JBrWem/9wSROF50ByE9BuApCdhL94heuW2BI=; b=FYVwCyEd7AnlQexu483HI2L9k
 DYlSzQ5esEFQ/VMRiooF73uvH+7gblU+e7zpBAgF9Libs4rQL6vl4nTrZJDV9s3zN7fRlZASzf+cR
 d0pzhLiN1qGiRjqK+RNCWdEbr96Va3K2z8bpwT9/vNV8XEvWzgKnyIkajwxd8NcgWxl/s=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1htKiY-0005pu-GG; Thu, 01 Aug 2019 23:42:42 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id AC9EF2742E3A; Fri,  2 Aug 2019 00:42:41 +0100 (BST)
Date: Fri, 2 Aug 2019 00:42:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <20190801234241.GG5488@sirena.org.uk>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-4-thomas.preston@codethink.co.uk>
 <20190730141935.GF4264@sirena.org.uk>
 <45156592-a90f-b4f8-4d30-9631c03f1280@codethink.co.uk>
 <20190730155027.GJ4264@sirena.org.uk>
 <9b47a360-3b62-b968-b8d5-8639dc4b468d@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <9b47a360-3b62-b968-b8d5-8639dc4b468d@codethink.co.uk>
X-Cookie: Love thy neighbor, tune thy piano.
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
Content-Type: multipart/mixed; boundary="===============7061930548061458656=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7061930548061458656==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kjpMrWxdCilgNbo1"
Content-Disposition: inline


--kjpMrWxdCilgNbo1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2019 at 05:28:11PM +0100, Thomas Preston wrote:
> On 30/07/2019 16:50, Mark Brown wrote:

> > Like I say it's not just debugfs though, there's the standard driver
> > interface too.

> Ah right, I understand. So if we run the turn-on diagnostics routine, the=
re's
> nothing stopping anyone from interacting with the device in other ways.

> I guess there's no way to share that mutex with ALSA? In that case, it do=
esn't
> matter if this mutex is there or not - this feature is incompatible. How
> compatible do debugfs interfaces have to be? I was under the impression a=
nything
> goes. I would argue that the debugfs is better off for having the mutex so
> that no one re-reads "diagnostic" within the 5s poll timeout.

It's not really something that's supported; like Charles says the DAPM
mutex is exposed but if the regular controls would still be able to do
stuff.  It is kind of a "you broke it, you fix it" thing but on the
other hand it's better to make things safer if we can since it might not
be obvious later on why things are broken.

> Alternatively, this diagnostic feature could be handled with an external-=
handler
> kcontrol SOC_SINGLE_EXT? I'm not sure if this is an atomic interface eith=
er.
>=20
> What would be acceptable?

Yes, that's definitely doable - we've got some other drivers with
similar things like calibration triggers exposed that way.

--kjpMrWxdCilgNbo1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1DePAACgkQJNaLcl1U
h9BbgAf9HMcTl/Pb+iJa1dDcV8qVUzhtY4Qcn3rqBYU+aGzm0J4NOtjtrA70Hdna
sTNCLx5kaaX9kA5IKWbzwBC1qcf0S8io9cJUgJOYGHitLHliifYiZLX2KpJp/JFf
GlSodNZf43W45fkhOO5+1xyiI5/KcDbu3U5IBYXVSmCSQsSeZWcydts0VhFTdXGC
epXFQGet/BGcQ2yfZTuykkV+YepjF07Tk7KOm/4Gdbv7peiwv+dvI2Lef/x8d61y
cUBhDvFOTToajfBJfwBhZ7dx7OgqLs2/DJdgvRZnE/q1VCq/1YyDl9uUXqvnAgCs
2XlNTqpd0yH1IjQwz+/8lsGUht5MXA==
=1ie6
-----END PGP SIGNATURE-----

--kjpMrWxdCilgNbo1--

--===============7061930548061458656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7061930548061458656==--
