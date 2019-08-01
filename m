Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C08F7DC74
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2019 15:23:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C62B1697;
	Thu,  1 Aug 2019 15:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C62B1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564665786;
	bh=YbDb721mSm6feQVWPnuKPn5nNqHOWd/AM66tcwtyphM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uEBc2fidne2RMvpuHfdKsnLSQO7c2DUP7tqcG6MhJoPlLWFbJCoOYfxF2kLPf4jwE
	 uo/QJAy5CPW4OXCNHKaGsJa4Yl9voIhVUCS1e3TcPQdT0mOHoGlKrsbFLNP7WUtLsZ
	 dYlaWhmgaIMXecQFECD5mvif5RAh5pbl58x+4VOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D02CF804FE;
	Thu,  1 Aug 2019 15:21:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63A0CF80529; Thu,  1 Aug 2019 15:11:41 +0200 (CEST)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1952F800F3
 for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2019 15:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1952F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="W54wwL11"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tZI3KTKjRpHUbTZ9xFHXOBJ2TvEhJBVLT56qlP1UV90=; b=W54wwL11CImP68WRPJyAxMIh7
 wZwd4UHxY8TN0idZpHY/wNLyqUT+eGMt5cgvfmM8ztjgN1ecfkrcm5FKFZI4rmeJFXCjgsHoj3n9x
 1BIwoJ3l027hSqtXZS/HQPIMu/t+eLPP91XLfyIyxoUjDRbplTV4kA4jn8uTyFrEwJ8JQ=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1htAfm-0004hM-AB; Thu, 01 Aug 2019 12:59:10 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 13EE12742C48; Thu,  1 Aug 2019 13:59:09 +0100 (BST)
Date: Thu, 1 Aug 2019 13:59:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20190801125908.GD5488@sirena.org.uk>
References: <1564402115-5043-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
In-Reply-To: <1564402115-5043-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Cookie: Love thy neighbor, tune thy piano.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <vijendar.mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: amd: use DMA addr rather than
 CPU pa for audio buffer
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
Content-Type: multipart/mixed; boundary="===============6495866705274509903=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6495866705274509903==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RYJh/3oyKhIjGcML"
Content-Disposition: inline


--RYJh/3oyKhIjGcML
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2019 at 05:38:29PM +0530, Ravulapati Vishnu vardhan rao wro=
te:
> We shouldn't assume CPU physical address we get from page_to_phys()
> is same as DMA address we get from dma_alloc_coherent(). On x86_64,
> we won't run into any problem with the assumption when dma_ops is
> nommu_dma_ops. However, DMA address is IOVA when IOMMU is enabled.
> And it's most likely different from CPU physical address when AMD
> IOMMU is not in passthrough mode.

This doesn't build for me:

sound/soc/amd/raven/acp3x-pcm-dma.c: In function =E2=80=98acp3x_dma_hw_para=
ms=E2=80=99:
sound/soc/amd/raven/acp3x-pcm-dma.c:356:2: error: =E2=80=98pg=E2=80=99 unde=
clared (first use in this function)
  pg =3D virt_to_page(substream->dma_buffer.area);
  ^~
sound/soc/amd/raven/acp3x-pcm-dma.c:356:2: note: each undeclared identifier=
 is reported only once for each function it appears in

Please check and resend.

--RYJh/3oyKhIjGcML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1C4hwACgkQJNaLcl1U
h9C3Fwf7BOfEN4vmffpRJH10Vx7KKitOuorUGoZ4MzdoFmDEvZdkppuWO4WKlp1s
KoulKALI7savBZjmK+EgHjLCgxfg+hDlXd06YhxKf3RRAA0ocYtbMkjpCbzuu1Oi
+9ov2FjktSCXcGTH2/ozG7EBkUsj4BYcMAHRxrjM9RL25BLY0ZnGdBzNfxQUOId4
joH3Z68hx0+X32BPAELE9/8aujIOta+AIeDcMc7mHED2g2HjdeK6IaRRGYAr49CU
pDoQe1N+gw+rzO5IYG4E9q4+ptdLGWxMkeX16vPem/21TWsXZJln0ybieo9XRBI0
bd//ujEu7ChIeKelc2b+VjO+A++Ojg==
=BI5i
-----END PGP SIGNATURE-----

--RYJh/3oyKhIjGcML--

--===============6495866705274509903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6495866705274509903==--
