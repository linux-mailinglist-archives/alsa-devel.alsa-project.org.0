Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 725D2E3BF8
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 21:20:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEDDB1725;
	Thu, 24 Oct 2019 21:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEDDB1725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571944838;
	bh=CkwA7N8/KzawyHpADEtFw2LASrfZosjDhfuZpf70byI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=atbsdbc+RmTwID1crlXIiCIJzngGOATx63gv8EkAYj5J5EaDxZs1rtoX8I4/1yalE
	 A5lztZjHTKqYjNx/VXBl91wxHJmIDC8VGk2o3eMtLO/5lMg315iXHhAp//X5/Ir1X4
	 zPMAegXXN9oVGxqp/DGZkLXBpskluF0wJnbVhGkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B63B1F80274;
	Thu, 24 Oct 2019 21:18:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DB18F80274; Thu, 24 Oct 2019 21:18:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EA3FF80274
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 21:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EA3FF80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bycttnTQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BtJMMk6Glc0b1Itx4YaAQIjSgo1CwyjXyRamYqhUmsQ=; b=bycttnTQ+TdOU+tEejpM8m/RK
 4tlaV6tIT8NO4/RMWoF6LXyxRWx1juXQl9yiy2kOYuhC02m5XWgi3TiAuAlMNi7knR94JH4/o03DD
 gQrnPN/GjO8/Z0k8t8iCMMEMTZa5dRU0p5lvP6lZ/VmW390rxgucZPAD+Z5qJUxGRY94A=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNidC-0003yV-SQ; Thu, 24 Oct 2019 19:18:46 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 5383C274293C; Thu, 24 Oct 2019 20:18:46 +0100 (BST)
Date: Thu, 24 Oct 2019 20:18:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <20191024191846.GJ46373@sirena.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-4-ben.dooks@codethink.co.uk>
 <2eef499e-d9d4-732a-ddd6-8d307d8cb08d@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <2eef499e-d9d4-732a-ddd6-8d307d8cb08d@nvidia.com>
X-Cookie: Filmed before a live audience.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v5 3/7] ASoC: tegra: i2s: Add support for
 more than 2 channels
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
Content-Type: multipart/mixed; boundary="===============7606295208313226982=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7606295208313226982==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J2uG6jHjFLimDtBY"
Content-Disposition: inline


--J2uG6jHjFLimDtBY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 24, 2019 at 05:12:21PM +0100, Jon Hunter wrote:
> On 18/10/2019 16:48, Ben Dooks wrote:

> > @@ -90,10 +92,12 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
> >  		TEGRA30_I2S_CTRL_LRCK_MASK;
> >  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> >  	case SND_SOC_DAIFMT_DSP_A:
> > +		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;

> Sorry, I just saw the feedback on the previous iteration. I don't think
> we want to set the polarity but based upon the format that is passed ...

The polarity should be set based on the the inversion flags in the
format, normally both DSP modes trigger on the rising edge of the LRCLK.
The difference is if there's a delay before the first data bit or not.

--J2uG6jHjFLimDtBY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2x+RUACgkQJNaLcl1U
h9BG7Af/aTUi+TadPqNOylY+6X2Spzqs0gV+LMh/W0yvVf0aL57cGaJ10dMwmwbC
as56JKIZ89JWzfQHg5fBEXQswb9q12ExaVYNdnIjc/XEx9QnSGHD0Wse7J/lCnbD
FjluXJ9sUFuoRH7yayraajy6bnT2b4EQHB2xkzlYib6rsrqR51Xgrs4MH64MpA59
cCMHuxP12rACbUm5atFzeCgt6TvESWJ0pD++r9Ht/vVGyArSMjjt7HZdOFNSDGwc
1TAOqK6xdPvEqt5LJxXyw+1QCPZT8KFJ3He2g7lax4tuW+czSPfsgPxTEEDIRO2u
FZr56e49pYtzzeN6lG9U8XnkqsF89A==
=xWHD
-----END PGP SIGNATURE-----

--J2uG6jHjFLimDtBY--

--===============7606295208313226982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7606295208313226982==--
