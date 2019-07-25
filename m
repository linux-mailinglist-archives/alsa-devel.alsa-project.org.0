Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB8375631
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 19:50:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEF9E1F15;
	Thu, 25 Jul 2019 19:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEF9E1F15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564077031;
	bh=lncTO+VLv+mmQnxY3poCSHez0u3WUGyWG5p4fLvU210=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q6QSTo2SnFnqsSDVaIlgjjTKjFRRCWJjlGZw91X1e/lHJ73mLzqR1KuNOh+YpMQE+
	 v8wd9uEsAtgZx9vnN4zEIZ1L+k8liYBZNUM/YYLywOP9QNwY9DlKZoliBU+GW36LRz
	 wVpUVms1cbnHcG9D8BXIW/4zrU2vn30iwffgX3Jk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFF5AF805F6;
	Thu, 25 Jul 2019 19:44:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45FCAF805E2; Thu, 25 Jul 2019 19:44:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14B9EF805AF
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 19:44:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14B9EF805AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="M45asfun"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QxIxcHtSGkV0O4puDpt6kv9EWAyrdZDebfpnewAIWIk=; b=M45asfunHm1cRA+Puzb4+99gr
 z5d0TeMHJrypKXbUH1TZQUE5EscTWrwlcBzW3kk22y8wRNlShau8AEqw4pEjgauwlfpMkDSDgYeKc
 px3h9FCeLELdUxcJ9N81TRLI6phWyPUAz7E4MUGEi41cvLn3COuo5bh3Ud2L0s++B16Io=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqhmj-0003OO-My; Thu, 25 Jul 2019 17:44:09 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 315802742B5F; Thu, 25 Jul 2019 18:44:09 +0100 (BST)
Date: Thu, 25 Jul 2019 18:44:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190725174409.GF4213@sirena.org.uk>
References: <20190725130112.3j2vi4dyngyr6yh3@flea>
MIME-Version: 1.0
In-Reply-To: <20190725130112.3j2vi4dyngyr6yh3@flea>
X-Cookie: Jenkinson's Law:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] Best representation for TDM devices
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
Content-Type: multipart/mixed; boundary="===============2322101066006431301=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2322101066006431301==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cpvLTH7QU4gwfq3S"
Content-Disposition: inline


--cpvLTH7QU4gwfq3S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 25, 2019 at 03:01:12PM +0200, Maxime Ripard wrote:

> Since I have two codecs, I have two links (described through
> simple-card) and thus two subdevices. However, the microphones
> connected are really separate streams, so ideally (I guess?) we should
> have 1 subdevice per microphone.

> An alternative would be that we capture the whole 4 channels and use
> dsnoop to demux them, but trying to use the device directly (using
> arecord -D hw:0) results in the ioctl to change the number of channels
> being rejected, I'm assuming because each codec only has 2 channels?

> So I'm a bit lost at this point about how I should go and expose
> this. I couldn't really find any similar setup either in the
> kernel. Any preferred way of doing this?

What is the actual hardware - what do the microphones physically look
like in the system, what functional role do they play?  My initial guess
would be to combine them into a single PCM for userspace, there's some
support for that but it's not surprising if that's broken somewhere
along the line as it's very infrequently tested.

--cpvLTH7QU4gwfq3S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl056mgACgkQJNaLcl1U
h9C4xgf/ecGx+yNE7q7BDjXryu/S2MaP2MoLVGeNAfqFdg6Q37hZnvDBkvS1FclU
ZhvpOy6AmwKHeMEsjIi6nloIBgwAy4xuuTC196fRfZPF6vm8anCEkNgy50L+1LHL
aMumVuDGg+lhdwpw9nNs+7Igf5aPYQ9GtNMRqO7Fzzlc016IzfwZfVuGTGLtmKYb
UPuDnCjbAfZ2y3bd4R2N6upPwykZQEobYTKg6bKecYw/m16OMlayRyXw7Cl/jjQ1
Qc/zIcgcAlPjJGdDmhmU0q9ekigKN9h2oXcyEOFXnHH3ofxa/Pv1NCnlIdjV29+L
VuBX4FLparLISadUL8FIIwxuvGUaZA==
=XGrz
-----END PGP SIGNATURE-----

--cpvLTH7QU4gwfq3S--

--===============2322101066006431301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2322101066006431301==--
