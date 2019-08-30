Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D9CA373C
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 14:55:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FB821686;
	Fri, 30 Aug 2019 14:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FB821686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567169718;
	bh=RRERcLWdjoxFiC1SiH1nsCdTawZTcRuBu23NIaqiv/0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dnAbIjy2EQJhRenEKi17o81a/OalnVpZBO8JzB9ow0/JNM820zhODjBS0Xjyt2vzr
	 gWWy5vESvVFlYBpQVokTLSS33QvDnLJsP10F9bwv8x+WzfgU/Qp2y2oJq0PVBiozhR
	 v9DglzM36hbV8Q4UKGMeSLzMGR2z2zUDwJhFv1wE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 605ADF800D1;
	Fri, 30 Aug 2019 14:53:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ABC5F80369; Fri, 30 Aug 2019 14:53:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F33C4F800E7
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 14:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F33C4F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BhlqZlUs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fks3hb+0onEzY5mvz6dhUCYAlYTQv7HaA/Z5kKLucHo=; b=BhlqZlUsbowTCxQCvXqTNgD8J
 8sJKHnLn6uqcKVuzmAj85Q/8FjJ9uwDVbLMCx6TdpKr9MaRI84jJ9dd81fjG7atikRpmjWbVrJqTX
 BtlgYIaKPxCq7qOIYQKy+YAxKHMr1x4VkHaNZW7THgNKZ8U+RuiNjhuN5WI5m8yFZTHO0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i3gP4-0006Yr-7G; Fri, 30 Aug 2019 12:53:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 37EFE2742B61; Fri, 30 Aug 2019 13:53:21 +0100 (BST)
Date: Fri, 30 Aug 2019 13:53:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Message-ID: <20190830125321.GF5182@sirena.co.uk>
References: <20190826090120.1937-1-shumingf@realtek.com>
 <20190828104938.GF4298@sirena.co.uk>
 <10317AB43303BA4884D7AF9C2EBCFF4002BE5727@RTITMBSVM07.realtek.com.tw>
 <20190828132055.GJ4298@sirena.co.uk>
 <10317AB43303BA4884D7AF9C2EBCFF4002BE6083@RTITMBSVM07.realtek.com.tw>
MIME-Version: 1.0
In-Reply-To: <10317AB43303BA4884D7AF9C2EBCFF4002BE6083@RTITMBSVM07.realtek.com.tw>
X-Cookie: Send some filthy mail.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "cychiang@google.com" <cychiang@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: rt1011: ADCDAT pin config
	modification
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
Content-Type: multipart/mixed; boundary="===============4170512778534190113=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4170512778534190113==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OBd5C1Lgu00Gd/Tn"
Content-Disposition: inline


--OBd5C1Lgu00Gd/Tn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2019 at 05:54:00AM +0000, Shuming [=E8=8C=83=E6=9B=B8=E9=8A=
=98] wrote:

> > So really this is setting up a loopback for testing?

> We would not like to change ADCDAT pin to input mode in normal case.
> That's why the driver enables ADCDAT pin to the output mode in default.
> The rt1011 supports the feedback signal which could be playback data or I=
/V data, etc.
> If the system wants the AEC reference data, rt1011 could feedback the pla=
yback data.

> The product could connect 2/4/6/8 rt1011 chips on the same I2S bus.
> In a test or debug mode, we could toggle ADCDAT pin to input mode that al=
so
> helps HW engineer check the slot of feedback signal for each rt1011.

I think this needs more than just a straight userspace control on one
device, these use cases make sense but they'll need to be configured
over multiple chips simultaneously otherwise there's some possibility of
hardware damage (eg, if two chips try to drive the signal at the same
time).  If this really can be usefully varied at runtime then the driver
bit of this should probably be an API that the machine driver can call,
the machine driver can then expose a control that sets all the chips
involved up together.

--OBd5C1Lgu00Gd/Tn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1pHEAACgkQJNaLcl1U
h9DD+Qf/ZTC6o5tnYajPcCGVYiHvdv33N3XUZHUDq0C1Z/u5tqV5ZBqqQLQ+yPpm
0CRv7X6cQDtpDgIahdj17+R+4QVQA9A9Fte2YWQ/VD4w/63hlDNE6pEdTT5k4ZaV
vMfkkfJ3vQMkO0bqv2R5Cb3OGXJHvJH6uB0wQK3uTNb6K16PdLRQCmai/m2hB8St
k3bJZeKd4LgtRukI893JVIwl+P+nk7mrVGGQCKDH6xP5huQe8olnYTVgcka/R0CK
zeBpywRO6ELtcFXFOUf1jD1/18Vm7nEkUZ554byj13iU88cTAp22s8Zy6hdvaGO5
XsGJWsxAOa3VnJPDTNShdXb5n79z7A==
=6gjn
-----END PGP SIGNATURE-----

--OBd5C1Lgu00Gd/Tn--

--===============4170512778534190113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4170512778534190113==--
