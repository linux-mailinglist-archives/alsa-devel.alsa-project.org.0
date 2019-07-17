Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 200E06C0CA
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 20:06:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75E49168A;
	Wed, 17 Jul 2019 20:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75E49168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563386815;
	bh=5MnErjG41YJdwiWhvB/QZ6NRxMRF6M08y8MF7FDyVMI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WGVNks8FmAgVoD/h0s47d8sDA9hpWsUdfeBP5zD5AvP0zISUNzTjqOEYZ9tWlaOqp
	 j6pSW+rMpt30e6NidNvH+nzmZdnYXDlySGGGSUVq2VcGUyDLAriLBMDX1OMfvMJNmL
	 uwS21ZSQTLZPuZNbD5EU/mc6YX8SNcVNcC9F4fQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35AABF80368;
	Wed, 17 Jul 2019 20:05:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14B58F80363; Wed, 17 Jul 2019 20:02:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63F10F800C2
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 20:02:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63F10F800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="C9OXXW6u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CZM2ShQr2AlIScfs2zG21CM3bTMezjUISu8d4TsYAUI=; b=C9OXXW6uyn9XbCFpJpiAXa8fg
 wDzWIX4+guB2+xeb5lEAJ7u9pahNCQ3d3eyrDq78cBE9CcY8IUead4u/BylWF2LyKQNd1pLrnSJa9
 FEbNoiyUnMfCLbMLbCMtjlq0msEGtHXlK0xBlC9wMczUyx3lfxGGU2C8jQ1DAcDUfy5S4=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hnoFi-0001mM-Hf; Wed, 17 Jul 2019 18:02:06 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B16742742BFD; Wed, 17 Jul 2019 19:02:04 +0100 (BST)
Date: Wed, 17 Jul 2019 19:02:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190717180204.GF4459@sirena.org.uk>
References: <VE1PR04MB6479C4D2CD4B9D486209102FE3CE0@VE1PR04MB6479.eurprd04.prod.outlook.com>
 <548bda36-b81f-1811-7969-e80e698ecfa3@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <548bda36-b81f-1811-7969-e80e698ecfa3@linux.intel.com>
X-Cookie: Fremen add life to spice!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "S.j. Wang" <shengjiu.wang@nxp.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Is there a way to support TX master mode and RX
 slave mode?
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
Content-Type: multipart/mixed; boundary="===============6532329951749856262=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6532329951749856262==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TeJTyD9hb8KJN2Jy"
Content-Disposition: inline


--TeJTyD9hb8KJN2Jy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2019 at 11:02:05AM -0500, Pierre-Louis Bossart wrote:
> On 7/16/19 3:35 AM, S.j. Wang wrote:

> > Is there a way to support TX master mode but RX slave mode?  It seems c=
urrent .set_fmt only set same mode for TX and RX.

> good question if you are thinking of supporting the 6-pin versions of I2S
> interfaces with independent bit clock and frame sync on RX and TX
> Looking at the topology definition it could be that this mode needs to be
> handled with separate dailinks. Adding Mark in case he didn't see this
> question.

If the TX and RX sides are completly disconnected then they're just two
separate interfaces.

As documented in SubmittingPatches please send patches to the=20
maintainers for the code you would like to change.  The normal kernel
workflow is that people apply patches from their inboxes, if they aren't
copied they are likely to not see the patch at all and it is much more
difficult to apply patches.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--TeJTyD9hb8KJN2Jy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0vYpsACgkQJNaLcl1U
h9CgAgf8CszPBMJzgRhyN/HYeSk0VXQ907/XEEF6Y6t/FwJdSGDhEwRUHuIEPz2U
3ybKAe1S1qcaNQ83/h0ZbBDcsJYk2FMRdSIP/j5C7O2jgcFRSOg6PGE6QD78KwBm
fnu6d0L6pZ7E+gN5Y7ZU1DIZHh1Y7mrfy3c9Nd4X7ug1s6fh02R5ZSTCkUehMMxx
HLpkyf9aK+7fUFiIFwYhBlYsKGFagztf33dF44eXSZ8p+xvo/Swhm6C4x2AMubRV
2zFK7mYK67JyLMLhfF7RjViRPY5USR20zcFK/6Evijs2bq9Ha4fXmZ3+n5dfRwD5
wJdp3jwk8wt5a7p82sJbNdDn/MILJw==
=WqPe
-----END PGP SIGNATURE-----

--TeJTyD9hb8KJN2Jy--

--===============6532329951749856262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6532329951749856262==--
