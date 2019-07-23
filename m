Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B81371699
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 12:54:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA6B1868;
	Tue, 23 Jul 2019 12:53:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA6B1868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563879284;
	bh=HlgdWp3EIHywWQs+wozWzmNNKBcG0Kayk6LWn/TG3I0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gMUtWMVwrAfFXLpMam8W/sGuYmGrORuanvjM0UFOovAdQCQOlLbvItHLcfm5wY+Ck
	 GVGHc2A/e9TlTOcvxymhVI0XpDwtGlm8K81eIp6vQPZToKl6M7NT4J1mxDMjQbOz6Z
	 AMzXDJglWKBDtjMAboyH4mCckfQ2t2uyC18wk3k8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A80FAF803D0;
	Tue, 23 Jul 2019 12:52:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 131A1F80447; Tue, 23 Jul 2019 12:52:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A943F80227
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 12:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A943F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="V500iGVo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hX+2JwJqGh+wbW3mQeHAqWKxuSWAO7EymA5leOFa6ek=; b=V500iGVoajupXPt4fMNjTip/9
 VzACXhXWYED6JcJBLKSU3h9AMTyPaI9wnkikz9agqSV02zjKqHAy1bZCwSjV6XM3jw1viCxrUe8Fj
 Pq38AZl/NUeDJGxbajWi8iSP5+xin9IhD6dkc4hsyORVoe6t1KGRnozmhtOJbscbKrjwU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpsPZ-0003Ek-T4; Tue, 23 Jul 2019 10:52:49 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C061B2742B59; Tue, 23 Jul 2019 11:52:48 +0100 (BST)
Date: Tue, 23 Jul 2019 11:52:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Message-ID: <20190723105248.GA5365@sirena.org.uk>
References: <cover.1563817201.git.mirq-linux@rere.qmqm.pl>
 <3e104cf18cb4e26096f0fe065a2c0e80373f861c.1563817201.git.mirq-linux@rere.qmqm.pl>
 <20190723082716.GM54126@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
In-Reply-To: <20190723082716.GM54126@ediswmail.ad.cirrus.com>
X-Cookie: Avoid contact with eyes.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, patches@opensource.cirrus.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: wm8904: rework FLL handling
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
Content-Type: multipart/mixed; boundary="===============0666719488422948264=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0666719488422948264==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2019 at 09:27:16AM +0100, Charles Keepax wrote:
> On Mon, Jul 22, 2019 at 07:57:21PM +0200, Micha=C5=82 Miros=C5=82aw wrote:
> > Extract and rework FLL handling. This makes it possible to reuse
> > the code for other Wolfson codecs and makes codec adapt SYSCLK to
> > exactly match frequency required for used sampling rate.

> Do you have thoughts on which CODECs you would be including in
> this? These older parts often have small differences between the
> configuration that might make this challenging so if you have
> plans here would be good to have a look from this end.

Right, it's not like it's the same IP being dropped into multiple chips
in an identical fashion.  There's a lot of high level similarities in
the register interfaces but also many small per device tweaks, and it's
not clear what benefit we get from refactoring at this point.

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl025v0ACgkQJNaLcl1U
h9DOowf/WDgZBySU0jWlg/QFS4oUrBe7HjNw+NaR6p/jMVG5sH32OA6j/bqDQqSa
azket/qyOR7WAAIo6bPHx/XC00MsPnE4AD5XONbzqDCs/KnksYKxES9J5xZl3q2I
vYcrFTFzwgrcmhseRBIsBSWhyhs4KdnehDwRjGM4T1TPxmREvd+j7jKl6fT9CNUN
7MGfsIyje8IB/0epyP7Cf9yLq1DtZsY25ZYSCOLG/UevvLVHZaylG+NHqaKk9s+L
aZySTA0/7RkajswN/oEuNRfB/+oef1xYe55kZff11pxv45k5ot6kzfJxBkso40hv
70tjPno1LOppgb54+216zbt8/nNNmA==
=/SRd
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--

--===============0666719488422948264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0666719488422948264==--
