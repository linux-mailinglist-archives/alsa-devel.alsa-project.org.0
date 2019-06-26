Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1FD56786
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 13:25:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EB1C1664;
	Wed, 26 Jun 2019 13:24:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EB1C1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561548323;
	bh=X7UdWFNwmeOyXW4qjuREbZQ6MNFMfrm995+d9aKsnts=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RLgQ/x/ljBFGSfy8rwJ9kae1r7nopghtij7/WzLKEluriOVDddKMtEeZPAH/35GwJ
	 mjz0o7Wqh2MVNbngr0FRyXJrSjIgLy12tc0amNZf7qNLYcJ0jnmh38Ja9G5z2p3BYy
	 PInMFKWZFuqJcUeHCPZvousXpduHCSQd8zJu9KOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9D8AF896CC;
	Wed, 26 Jun 2019 13:23:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0A23F896B9; Wed, 26 Jun 2019 13:23:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90CB5F8070C
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 13:23:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90CB5F8070C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="F05n5gh9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ietyuIcaBatOPYfddSSylJ4sxAZ+ZLKOiAKxLzp6es=; b=F05n5gh9dgVKij6KvK7Jni2sH
 EpeOadTX2njYnxIy/4tL586k+XHd3PAuDNzyWFoNrkPfQvszMo0pMX+orsIoIjRWPWlE/GXoEMRms
 keb34VYGi2rDr7DuZVl17wH4XqywWKeNJooQcH8gstxaCL4pTEz6TqN/a/JIGYp8xZWUI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hg61U-0007me-6n; Wed, 26 Jun 2019 11:23:32 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id B4DFD440046; Wed, 26 Jun 2019 12:23:31 +0100 (BST)
Date: Wed, 26 Jun 2019 12:23:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Message-ID: <20190626112331.GB5316@sirena.org.uk>
References: <20190626104947.26547-1-codrin.ciubotariu@microchip.com>
 <20190626104947.26547-2-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20190626104947.26547-2-codrin.ciubotariu@microchip.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: codecs: ad193x: Reset DAC
 Control 1 register at probe
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
Content-Type: multipart/mixed; boundary="===============3715424481198154270=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3715424481198154270==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0LPhsWsL1Ga+XLL0"
Content-Disposition: inline


--0LPhsWsL1Ga+XLL0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 26, 2019 at 01:49:47PM +0300, Codrin Ciubotariu wrote:
> Since the ad193x codecs have no software reset, we have to reinitialize the
> registers after a hardware reset. For example, if we change the
> device-tree between these resets, changing the audio format of the DAI link
> from DSP_A with 8 TDM channels to I2S 2 channels, DAC Control 1 register
> will remain configured for 8 channels. This patch resets this register at
> probe to its default value.

Would it not be more robust/complete to have a set of register defaults
and write the whole lot out rather than individually going through and
adding writes for specific registers as needed?

--0LPhsWsL1Ga+XLL0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0TVbIACgkQJNaLcl1U
h9B5dQf/cxYmztEqqJW7n7EhRXlsxlPo8LHdNVs1D7b4aSBNJZTPs4ydlpRlCQga
MQ7cYmznzzNCJSNwIBi/ra/arsQWHoyM1gHaQH01vhjaEoMYgm3Tbtn2IDR16tR4
sU1ffhFgQmve2BD6q5fRVYdZldcvJuBkY8fnYO5BktFrQXil/YiQXudVjAiP0/tW
tZMoigVLniRxERF9FwQ5XWzVeW8Pa6/tSZ1xAs+MyXNdvXa9jrL1Wrwze6S/i12U
yT0QVxnVBhOBZfgH1bGHO8V3Al2lAn6P1n9uHfvl63HeZgnPp6qfScLVkXLzCpO1
hb2duf3THhcgLRM+qZA88qsgyyRW4w==
=ZAHw
-----END PGP SIGNATURE-----

--0LPhsWsL1Ga+XLL0--

--===============3715424481198154270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3715424481198154270==--
