Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8984E7ACEC
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 17:54:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F9C317C1;
	Tue, 30 Jul 2019 17:53:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F9C317C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564502071;
	bh=toibt24gplVmXPcwilg3Gj+2PeARiFmK0UV2jIgYXw4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jjFpY9yuQYiqh1GhiivdEJY9H5qxH0PodnPlZTGeXGJgWjSy3AdZab6wOX/9SnGHG
	 XlH9KS+hmzjUfdnFXXnoOVf1RQxnY9QMA9ICtXYWMuy7/vXSETIybC/ZBZGUHH8S9Y
	 JHwv+MqsQ9+QFcWCFQx5EDd3iGr1Ff29xsVoLxGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52EEDF804CA;
	Tue, 30 Jul 2019 17:52:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98221F804CA; Tue, 30 Jul 2019 17:52:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46E06F80214
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 17:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46E06F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="J1ZC52QI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Satq2eEMXIbB0aB+E4vC0WoAtw8SMBMHI0WXpWtRuYs=; b=J1ZC52QIsMjMi5k2i2Fvr0+nV
 AuizVSMIB5ohxsLuqMXvxPDnGN3s7Ru76VojFpPcd5fQqygq3HMaOXKDD0VEBrs7Btv2YSwqH73rL
 2gC9VPKgK6bIMpJY5oFm8wW8bzuPYLpVtZ+MBg74aqkS+Q2G++Vy42i1p1GAoxDhc9XAc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsUOT-0007rr-3R; Tue, 30 Jul 2019 15:50:29 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E52FC2742CB5; Tue, 30 Jul 2019 16:50:27 +0100 (BST)
Date: Tue, 30 Jul 2019 16:50:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <20190730155027.GJ4264@sirena.org.uk>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-4-thomas.preston@codethink.co.uk>
 <20190730141935.GF4264@sirena.org.uk>
 <45156592-a90f-b4f8-4d30-9631c03f1280@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <45156592-a90f-b4f8-4d30-9631c03f1280@codethink.co.uk>
X-Cookie: Times approximate.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Annaliese McDermond <nh6z@nh6z.net>, Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
 Cheng-Yi Chiang <cychiang@chromium.org>
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
Content-Type: multipart/mixed; boundary="===============3288033514692683783=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3288033514692683783==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DesjdUuHQDwS2t4N"
Content-Disposition: inline


--DesjdUuHQDwS2t4N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2019 at 04:25:56PM +0100, Thomas Preston wrote:
> On 30/07/2019 15:19, Mark Brown wrote:

> > It is unclear what this mutex usefully protects, it only gets taken when
> > writing to the debugfs file to trigger this diagnostic mode but doesn't
> > do anything to control interactions with any other code path in the
> > driver.

> If another process reads the debugfs node "diagnostic" while the turn-on=
=20
> diagnostic mode is running, this mutex prevents the second process
> restarting the diagnostics.

> This is redundant if debugfs reads are atomic, but I don't think they are.

Like I say it's not just debugfs though, there's the standard driver
interface too.

--DesjdUuHQDwS2t4N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1AZ0MACgkQJNaLcl1U
h9A+KQgAgi4HkmsbIandzuTrFA6N2E9Zrc7WMisuFB9GE/OnLiU559yFfrABha81
2AJ4vwv4WOwP6Cl48kFT7W90WgsJljB6F0d/SaiwvhNmwf2ifUVANo+tkNv8L2kn
W/7p0/OQ1tuFhU9OI98e1YbqSI/TEcgQx3CEp0diUdcmv1C55X6cn1tjj5Mn0+hz
Mf2IV9Q1KMJQBeHqm6PvdWjzxbnQ7iUEPQ6SoP6PwTjEvpWN/+Cv7q/wo1FCs1hb
1nYLoWrVYhOaQyzAxxJ/S2bRl5TybnmgSJOpj1ZNMRcHdED93sk3GMNSqqAOD68L
nQQV16tM/EvyPsbQE+AMJFrAKfZLdg==
=H0id
-----END PGP SIGNATURE-----

--DesjdUuHQDwS2t4N--

--===============3288033514692683783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3288033514692683783==--
