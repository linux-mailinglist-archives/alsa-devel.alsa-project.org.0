Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0710716CE
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 13:17:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69C9C186A;
	Tue, 23 Jul 2019 13:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69C9C186A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563880630;
	bh=IeGcIcO/ev5aQMrdk0Y6Fg6vhrkWtIoWjjWwxDr5tIQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R3qqBT3NhszduJ35zmy/Esci4ArF8KcdULzmVABjEh8WQOc23lfKtfCq+5SYKATtx
	 I5ivDEDsRMsUno2py9Zf5K5eTmGFT6O4pEEgaTEeo6FgM27XW2wGytcVEjz5zDAbnp
	 z+JJ1gQsxLchSCi9ruq/KPj1Uu0wp5N3iK3OkXTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79460F80448;
	Tue, 23 Jul 2019 13:15:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F60BF80447; Tue, 23 Jul 2019 13:15:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86E6AF80227
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 13:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86E6AF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="UN7NYWOQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CnOuU1r832inpQ3IfTsdbHRXbDI+uTko7xCi/8tQEOI=; b=UN7NYWOQxT6tEzEfPkySHdaiv
 RjMDuUCkCxX2mRQulws38LyD/ZMs89AvjpUwDCqVTFAmUHpH/UMtDJRe0ggwTwH9HQ0AAV2LAHWYM
 MMnHWELA/0lKexubC4Td4d1hScb2J//HpMgb2QGmidZb0t8bZKPv+LsI5lvol0xph5vAg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpslI-0003H4-1y; Tue, 23 Jul 2019 11:15:16 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4F70B2742B59; Tue, 23 Jul 2019 12:15:15 +0100 (BST)
Date: Tue, 23 Jul 2019 12:15:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190723111515.GD5365@sirena.org.uk>
References: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
 <20190722141402.7194-19-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190722141402.7194-19-pierre-louis.bossart@linux.intel.com>
X-Cookie: Avoid contact with eyes.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 18/21] ASoC: SOF: Intel: hda: fix link DMA
	config
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
Content-Type: multipart/mixed; boundary="===============1387984660245432647=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1387984660245432647==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Content-Disposition: inline


--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2019 at 09:13:59AM -0500, Pierre-Louis Bossart wrote:
> From: Rander Wang <rander.wang@linux.intel.com>
>=20
> For this bug, there are two capture pcm streams active, with one
> stream and its related stream tag released before suspend. Later
> when system suspend is done, the stream tag for the remaining

In general fixes should come at the start of a series so that they can
be applied as such and sent to Linus without getting caught up with
dependencies on development work.

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl027EIACgkQJNaLcl1U
h9ClRAf8CFImBgkY9i3eGjeByGyWctkrSFYh3EQlp1p3IuU1WaRma7JDnLrIdKOv
lMrAlzf9+48dMT/lWq2ZfVvZVsiI+9NdND74EX7EstGsxl4lV4Q3QWUYXykkZkwO
iA86GOEAFXgVJ0UcrePxG5U1amwB99xbTdV3cL19CDn3hBqzTWhCwJ5QoRyOmUGl
ku/D6aOQyK5kPOc8BNM/Po0Vv31Ie78sb5ngMWjJ84w0OS8KX7fXq/JRxeNDHauw
aXWIfDTTRwKQOQ50Et+cA+Mvhn5iY7DtohKKtKUeLTs4iYQKBGl07h6+HJrnMA5i
m37D9RQJm7NRmiwg3Eo/rFnnBnF++w==
=S8q5
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--

--===============1387984660245432647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1387984660245432647==--
