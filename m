Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 036BEF1C21
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 18:08:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73644169D;
	Wed,  6 Nov 2019 18:07:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73644169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573060088;
	bh=PMz2fT9mdgcMcCLYoH2nPUg8fGsvvcXf+o7Lsu901wA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aJxkhD2Qi7SCZeF42oNlQZMnSLrK0bNHiey4BvTFjPbC+3U/JFmTnPzPXl+Hx/5A0
	 +CiroJXdv/SKqQfhWxLnkVrX/OhUpsjVj9aDxC3brdMzSwXmCA3Ojiqw4WW8UyRxd3
	 ehEg+Df//7VnphBNA2q9k4EvCXxJ/705bwgLCOpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A8B6F8048D;
	Wed,  6 Nov 2019 18:06:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88FBEF803F4; Wed,  6 Nov 2019 18:06:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC4EEF80291
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 18:06:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC4EEF80291
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="c9wFz4hR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ezCIO+lFqtUT0UzJR4NajfDokaUzH2Q2R0P2sNn9les=; b=c9wFz4hRgvRc99LLWN/T1GTg+
 LbpdvxRZK3g+vpD+YTqTSa+GJTHT5hVm86y3as1T4m2JOELIUK0FF8rw0VDuT3Iy+tgOIdR1jI5zl
 ZiqQOznz4ptyNKfqEwsUv9QGpUtlZcXmciI3WYAzPPNydQ/nNRw5NEG5GtSNfeRBf+z1s=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iSOl4-0001tA-Iy; Wed, 06 Nov 2019 17:06:14 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A3E9E2743035; Wed,  6 Nov 2019 17:06:13 +0000 (GMT)
Date: Wed, 6 Nov 2019 17:06:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191106170613.GE11849@sirena.co.uk>
References: <1573137364-5592-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1573137364-5592-4-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <99656586-8512-ed13-6174-12e0b1fbb3dd@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <99656586-8512-ed13-6174-12e0b1fbb3dd@linux.intel.com>
X-Cookie: Shah, shah!  Ayatollah you so!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, YueHaibing <yuehaibing@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Sanju R Mehta <sanju.mehta@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 djkurtz@google.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Akshu.Agrawal@amd.com
Subject: Re: [alsa-devel] [PATCH v2 3/7] ASoC: amd: Enabling I2S instance in
 DMA and DAI
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
Content-Type: multipart/mixed; boundary="===============3411632086170611559=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3411632086170611559==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lteA1dqeVaWQ9QQl"
Content-Disposition: inline


--lteA1dqeVaWQ9QQl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2019 at 10:34:54AM -0600, Pierre-Louis Bossart wrote:
>=20
>=20
> On 11/7/19 8:36 AM, Ravulapati Vishnu vardhan rao wrote:
> > This patch adds I2S SP support in ACP PCM DMA and DAI.
> > Added I2S support in DMA and DAI probe,its hw_params handling
> > its open and close functionalities.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--lteA1dqeVaWQ9QQl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3C/YQACgkQJNaLcl1U
h9ArOQgAht7bgmnQJdpVp5l7IWMftkKi3ziKEPuoEkjW98IEYZ3al7FiJ/Eg+Cc8
AD8ry73ti7FFnGIgJrCiMZf/eDLbzcZxN+zWCjNmW2s0GozS0N9xw/dEJ97OH01/
fZNRjMjGmfloux+wZ3o/2OXnMBZEtYBmv62I6Qoc0uRH5boJZAh6RIovWyZgIxWe
qJ/UmfqFIqf9X+RqDfsgTdB3+qaGkGBWw0o1uMbZunkRHmlouS8tdFPPkP0pPfo2
wncn1Cmg0HK1iSnDuLghAHWQdxhVdfHn7h6v1ljN7Rr5lIbwVuh4bUYMW9Tdz1PX
Pz0X5ICSXHDtW7SkjpnACVQ0I/mU0g==
=2GZw
-----END PGP SIGNATURE-----

--lteA1dqeVaWQ9QQl--

--===============3411632086170611559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3411632086170611559==--
