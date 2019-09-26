Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59490BF586
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 17:09:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D440D1757;
	Thu, 26 Sep 2019 17:08:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D440D1757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569510554;
	bh=0D7YTwRcWknmc/o1CgNXgE0fSwHXEDrTIvFzLr0C2a4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WQDPCrYyudHEiMXOy7rmLPyuYCUNJ9PV2y286NrdZ8XCXcGXmzaEMS+54H3rdpXpW
	 5FTRzLOpDKcppy5ulyQySY27lDH7oeP6YBx4/qbHng37T4gKP3pULIWic/dPwGyUAs
	 Pjkzn/TTA1knAi+Pgzew/PumvfgRXl0bfrTwWx38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4993BF802BD;
	Thu, 26 Sep 2019 17:07:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9841F803F4; Thu, 26 Sep 2019 17:07:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF623F80140
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 17:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF623F80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KeNWxeAB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4pLPnynkA7HWtaMnNTV/PFGoJgytgfbQyorJh3FSgNM=; b=KeNWxeABWoN68sqX4gBVJDfP/
 wWk4rBUtHmI3WxTduOxdRh7KduW0Q5aEvuGQBUxON+jYBB1PmomPdae8lJFMLcWwVZUEtjzORYWMf
 djVTMWhN4yMp/9K40cmouwdPg3BjPzXbFMZ5HZk+MQwC9jEWQrsKKna09q/EQv91C9H/s=;
Received: from [12.157.10.118] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iDVMY-0003rq-UH; Thu, 26 Sep 2019 15:07:23 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 6C02ED02CFF; Thu, 26 Sep 2019 16:07:21 +0100 (BST)
Date: Thu, 26 Sep 2019 08:07:21 -0700
From: Mark Brown <broonie@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Message-ID: <20190926150721.GT2036@sirena.org.uk>
References: <20190926071707.17557-1-nuno.sa@analog.com>
MIME-Version: 1.0
In-Reply-To: <20190926071707.17557-1-nuno.sa@analog.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/2] ASOC: Add ADAU7118 8 Channel
 PDM-to-I2S/TDM Converter driver
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
Content-Type: multipart/mixed; boundary="===============7741625905344322906=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7741625905344322906==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zQiiCAM5ptAyb9EE"
Content-Disposition: inline


--zQiiCAM5ptAyb9EE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2019 at 09:17:06AM +0200, Nuno S=E1 wrote:
> This patch adds support for the 8 channel PDM-to-I2S/TDM converter. The
> ADAU7118 converts four stereo pulse density modulation (PDM) bitstreams
> into one pulse code modulation (PCM) output stream. The source for the PDM

This is the third copy of this I've got in the past 24 hours -
there's no versioning or anything so what's going on?

--zQiiCAM5ptAyb9EE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2M1CgACgkQJNaLcl1U
h9A4EQf6A7KkdqPiVOYmb+wMLdzwvMZ5a7NT59t1LTN1pQxfvhj9DFWW5yC2kn4U
vV2EtKpQhx203WjJiTOTffygZYyOLLFqoG1rB8hdHkmbrk5Oc3qHvNiP0FZSBQue
ExwQdk1eDpvLU4SVcoD9Wy6/YjLJCs1KnABIAdPqbKyIpUZnUwi11n4NKg4HPBo9
LzytHc+Wt68kmbadQDVGM/u4hMi8vCD93mWyjyYwsZGgMWppvianVMyEE8x02iEF
KGlLC8HpaafCHTEgVOghdXzyiDr2pz0fyqZUG+Cp1uL9sTWTr53PfoMxx52J702h
B1RKOXoQIveEeCemwYq0E5tNXNIhwQ==
=4BYm
-----END PGP SIGNATURE-----

--zQiiCAM5ptAyb9EE--

--===============7741625905344322906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7741625905344322906==--
