Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4281C12BBB9
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 23:57:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B36401762;
	Fri, 27 Dec 2019 23:56:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B36401762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577487466;
	bh=UIhwTa0wSvgI5uhTtypl5RkqptmfQsy9RHjzQhxi2b0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IvbkOesIT/RbgfoczUl3BC0HJTpAM7BQ/n+uhTqOmh6KEhlDtkVWeYF0mW2aWHEKN
	 bTBLmnGfgGe1xyHSGBK6QSkrvby2/qliWOj16cuECFRhG8WpXwRxnZcdM+AgxUukRT
	 eZdQfMdX6X3z5dfcD/fg4upoFuhxxpQJH5yptWPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D474DF80145;
	Fri, 27 Dec 2019 23:56:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35870F80132; Fri, 27 Dec 2019 23:56:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE181F800E3
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 23:55:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE181F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="t/3p7NnT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2Me3W1CcQYRUaMjjW7RP9yGrYFxAf8aGHpvTMfD4pMI=; b=t/3p7NnTTB+32zGkG70ymdoQV
 nQXEGjm2MkflE9oplm5CNCG0kaF53p7x1nn2jFgiFahN/KxZW9Ivu4LWDzpZ6T1SEHun+d8TUOK9j
 i8cq1IiJPOW4gfIQf3WT5wt9kY1XkpegDiWEok1y1xA0oktZsWRYKKTZdAWnH/Cn1Jzck=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ikyWS-0006bi-9H; Fri, 27 Dec 2019 22:55:56 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id AD55FD01A22; Fri, 27 Dec 2019 22:55:55 +0000 (GMT)
Date: Fri, 27 Dec 2019 22:55:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20191227225555.GA3897@sirena.org.uk>
References: <1577451055-9182-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1577451055-9182-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
In-Reply-To: <1577451055-9182-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 djkurtz@google.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH 1/6] ASoC: amd: Refactoring of DAI from DMA
	driver
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
Content-Type: multipart/mixed; boundary="===============5794372588989260403=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5794372588989260403==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2019 at 06:20:50PM +0530, Ravulapati Vishnu vardhan rao wro=
te:
> ASoC: PCM DMA driver should only have dma ops.
> So Removed all DAI related functionality.Refactoring
> the PCM DMA diver code.Added new file containing only DAI ops

This breaks the build:

  CC      sound/soc/amd/raven/acp3x-i2s.o
In file included from sound/soc/amd/raven/pci-acp3x.c:13:
sound/soc/amd/raven/acp3x.h: In function =E2=80=98acp_get_byte_count=E2=80=
=99:
sound/soc/amd/raven/acp3x.h:94:19: error: =E2=80=98SNDRV_PCM_STREAM_PLAYBAC=
K=E2=80=99 undeclared (first use in this function)
  if (direction =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/amd/raven/acp3x.h:94:19: note: each undeclared identifier is repo=
rted only once for each function it appears in

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4Gi/oACgkQJNaLcl1U
h9BQiQf+New8Dfm5hPPcu9h4aqIHcTz0z6dH4Zl6/A44Bhe0czd13P/r9M/6mFVu
radVO29d8A7ntQzZBxk5hXN/z5mt2OdXSknoE8tGnr+PTl7h3V+iPMGgOnK3KzRv
KnbUDB1FRdBMlS+y9SrSDMZ01rqmf59d++wmaXLb/hSyycjTcGcFbD8Y0VtcboeN
QcbcqfHLyneiWOfGzlEPl9EiYK5l8qVHiN8Ey/O6kCvIJS+bXjXwB1/uS7DY/MzM
s0aSahTt8CaOCTimfp7QvBmfxW7gXiGKcaVp+dk/DVnDRJ5UOf8JNiCl26boFKJh
72JSSFqQywYn0Qf7LcjiYQGNqmH0EQ==
=QKCx
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--

--===============5794372588989260403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5794372588989260403==--
