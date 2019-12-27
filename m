Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C41012B01B
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 02:08:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB2091706;
	Fri, 27 Dec 2019 02:08:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB2091706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577408935;
	bh=MQ8oQH9F3jpdLicmLFWnKNPz3qZNvqXY+06K3JwXRz0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z/2CwAkC1xFMi2nhpobqZcwYUzEyktawlY2VRUHL3NA7Ie72BNuGYiQ/rGVPLLWMr
	 wSsDrqRrd46Rm2PrbUCtGCYJsWrBMdOcNUmRl3y0MOYEMBFxS0VXrcKbeOElRVU5ND
	 /Dx6bir3+V4ZJMHTUj7W2LNjXii3+h2723DaQFTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B606F80138;
	Fri, 27 Dec 2019 02:07:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B6ADF80139; Fri, 27 Dec 2019 02:07:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89A80F8012D
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 02:07:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89A80F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="HpW7TGec"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C6uqv3n6xouQOgZTOjhS0LjqoNmIDYF5KwS2ioU6ARY=; b=HpW7TGec6HMWofJqvOYl3go7F
 PPRQFn1JYJINXbp7Uz9UxjR3Rlxj0YTv6KYf0cU7UiFbtMhrhe2E5+ZcWWcyl1zgZRxxlfaGovcPY
 eMa0U9m3JBEsHsb9nX5BLjWjOEv6MFsJQ17V9u2ylQRx861l+f5qoO1+eqRnQlhpeJoqc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ike5m-00049F-BN; Fri, 27 Dec 2019 01:07:02 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id B8BD3D01A22; Fri, 27 Dec 2019 01:07:01 +0000 (GMT)
Date: Fri, 27 Dec 2019 01:07:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20191227010701.GK27497@sirena.org.uk>
References: <1575553053-18344-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1575553053-18344-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
In-Reply-To: <1575553053-18344-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Cookie: I have many CHARTS and DIAGRAMS..
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 djkurtz@google.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH v14 2/7] ASoC: amd: Refactoring of DAI from
	DMA driver
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
Content-Type: multipart/mixed; boundary="===============4963867770619669193=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4963867770619669193==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ogUXNSQj4OI1q3LQ"
Content-Disposition: inline


--ogUXNSQj4OI1q3LQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2019 at 07:07:27PM +0530, Ravulapati Vishnu vardhan rao wrote:
> ASoC: PCM DMA driver should only have dma ops.
> So Removed all DAI related functionality.Refactoring
> the PCM DMA diver code.Added new file containing only DAI ops

This doesn't apply against current code, please check and resend.

--ogUXNSQj4OI1q3LQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4FWTQACgkQJNaLcl1U
h9C6Qgf/YaesCjRBOBWjivS9T9BLZkRe0qF/Ot4xyMlnIT8zYH/XQOQWfdZhzmGO
wB/fxqKJRXnbupS3ynhCzNHGbl9Uhj+AuFy9Fb8vFYbVwRuHYckTxBRI2ohK6OA9
/0KDeoGqC7nKKzlYY+R6Z2cBzxNACiVjYPtR/MIrXmjS4GAZ8Lbgdx3pVvA1HDmS
36fr79im8RG4QFlmeIVUl/ZH+9hOoBa3IcxGPA4Qtie/+KJ1j/0gxwUd5wCWnx1E
i9rLojdohEqrM1nvw8oy9QZ35qgkylMPClguzkSPmH2xslXaJgKfaTUd7L+ia07N
sPJt+6bI3gDjJdifhjKOuwUtZ7FiVg==
=mUn1
-----END PGP SIGNATURE-----

--ogUXNSQj4OI1q3LQ--

--===============4963867770619669193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4963867770619669193==--
