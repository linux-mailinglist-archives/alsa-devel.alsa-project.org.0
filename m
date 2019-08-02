Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E497F5CF
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 13:12:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 356CD1722;
	Fri,  2 Aug 2019 13:11:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 356CD1722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564744351;
	bh=6Dvz5IMFYvkh5f8EjWQvdS4Ger2LRnFzYtJcEj8IK6Q=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B2VQtzHPlmCxHgSnIrDGIO1S0IjC/hJcHnL0mswD8mqREeIPdbTKxMWCsefnzEyrc
	 ZkKiXozY/njWXMUqr+HcDMTd4k5oxJgw0nq4EqJCk9HyOu+joMH8U9AEpwGivGnWVo
	 P8eJKxS/iznVrTIM7tmSXm7nypOLiwP0yvxz930c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BD0AF8048F;
	Fri,  2 Aug 2019 13:10:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FFDCF8048F; Fri,  2 Aug 2019 13:10:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD687F800F3
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 13:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD687F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="o3itlc9U"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n3s4BVD5JdIzf1EzOc/HSXfpVMJH3F25dukM4N0R0rw=; b=o3itlc9UEZib7jTg8rBsfV2Ln
 5vlVoO5Nfaqv9ikfYOXKGOZS4hte58Euz9jU/4ttbMW7UVQx9ADRV322SE5owfVZKmgXUWGMI9+4J
 xAqNVRRzYNSf+nYVu/ELr1R/VQKE6+sOe7TAzp2vAVHXTu8GmC6Ex6EtD9yo8/ppO4arE=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1htVSH-0007QE-Uw; Fri, 02 Aug 2019 11:10:38 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E01F62742DA7; Fri,  2 Aug 2019 12:10:36 +0100 (BST)
Date: Fri, 2 Aug 2019 12:10:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <20190802111036.GB5387@sirena.org.uk>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-4-thomas.preston@codethink.co.uk>
 <20190730141935.GF4264@sirena.org.uk>
 <45156592-a90f-b4f8-4d30-9631c03f1280@codethink.co.uk>
 <20190730155027.GJ4264@sirena.org.uk>
 <9b47a360-3b62-b968-b8d5-8639dc4b468d@codethink.co.uk>
 <20190801234241.GG5488@sirena.org.uk>
 <472cc4ee-2e80-8b08-d842-79c65df572f3@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <472cc4ee-2e80-8b08-d842-79c65df572f3@codethink.co.uk>
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
Content-Type: multipart/mixed; boundary="===============3060303463617241759=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3060303463617241759==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 02, 2019 at 09:32:17AM +0100, Thomas Preston wrote:
> On 02/08/2019 00:42, Mark Brown wrote:

> > Yes, that's definitely doable - we've got some other drivers with
> > similar things like calibration triggers exposed that way.

> One problem with using a kcontrol as a trigger for the turn-on diagnostic
> is that the diagnostic routine has a "return value".

You can use a read only control for the readback, or just have it be
triggered by overwriting the readback value.  You can cache the result.

> Hm, maybe a better idea is to have the turn on diagnostic only run on
> device probe (as its name suggests!), and print something to dmesg:

> 	modprobe tda7802 turn_on_diagnostic=1

> 	tda7802-codec i2c-TDA7802:00: Turn on diagnostic 04 04 04 04

> Kirill Marinushkin mentioned this in the first review [0], it just didn't
> really sink in until now!

You could do that too, yeah.  Depends on what this is diagnosing and if
that'd be useful.

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1EGiwACgkQJNaLcl1U
h9Bs6Qf9FgalB0i5dzB7naDLU8yYdeZfY+teIQZhSWv5GUBav5I3hs3vkMQRCu3b
B85CYaqrGqhe/TTBEPeZq6hlAzt91By0DWQ8oYiz9t3Vf9rqAxCe5M9OzKrN/GfS
veomBXXDd4B79HHPW9mGDHsNoflXkdJbyWsx9P6ZvCRs8mc6JtrRssDje474uNqs
fC3oWklOove1G7CStDQ/8QfK8XblO2FZlBzL0H0YbSuUy74Xz8Ioimd2WX1Yvm3L
DPdOR4I6s0MvP1lhgIpTYSXki4plZ3EdwSatWi4VmVmBMVGK1rDmiXhWzBkWheJf
915A2FSIMuUS5Z+2sIRaANFl7lHKVw==
=GrVc
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--

--===============3060303463617241759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3060303463617241759==--
