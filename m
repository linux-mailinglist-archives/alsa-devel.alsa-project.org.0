Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DA0AFB28
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 13:10:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ED4B1737;
	Wed, 11 Sep 2019 13:09:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ED4B1737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568200200;
	bh=5NUurhzWA4SfYw4F4r09NYW0g5eB0szfvestCyURLqU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SupNYSEhuAGg/4M10qASRBzOCeoMy4/7aVFE5Vo5ycUuYjGiSdVCjqx7fWUcUlLgU
	 zhg5D+Vt4Nt14TChhkk5rDW6CGAHjqVpoL6pIKzII/rj9cIPVylAfCN4lYar6v+oGr
	 rtik8ZxxljWZm+e4K132Siy6IAvdKY7N/3TO8c8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9C8CF80323;
	Wed, 11 Sep 2019 13:08:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3437F80323; Wed, 11 Sep 2019 13:08:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92AB5F801ED
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 13:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92AB5F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qK7u45WB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HHnXmjuPtzS2mOWRO4aXJSHL1FSaP/89qlf1dDrZaEE=; b=qK7u45WBdtW6VEw40C6FxeWOV
 TomAOJYtYL8dsv7+JXT0kLU+drfE1E/Z6mE4zWCgcOXC3ybMerTnM1uvNko2zCF6ExJLedM6oEnl0
 xpmIwJrtBW4K6IKp60dsSjADNbuq2+Ip7RAq4yX6CVESBdxmCboPFgiP3y1/OhtRQAQHY=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i80To-0008Rd-Kh; Wed, 11 Sep 2019 11:08:08 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id E841FD00451; Wed, 11 Sep 2019 12:08:07 +0100 (BST)
Date: Wed, 11 Sep 2019 12:08:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Message-ID: <20190911110807.GB2036@sirena.org.uk>
References: <cover.1568025083.git.shengjiu.wang@nxp.com>
 <2b6e028ca27b8569da4ab7868d7b90ff8c3225d0.1568025083.git.shengjiu.wang@nxp.com>
 <20190910015212.GA16760@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20190910015212.GA16760@Asurada-Nvidia.nvidia.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 tiwai@suse.com, lgirdwood@gmail.com, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: fsl_asrc: Fix error with S24_3LE
 format bitstream in i.MX8
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
Content-Type: multipart/mixed; boundary="===============4435384036925218416=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4435384036925218416==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1ozVqH6bFr/3sC51"
Content-Disposition: inline


--1ozVqH6bFr/3sC51
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 09, 2019 at 06:52:13PM -0700, Nicolin Chen wrote:

> And a quick feeling is that below code is mostly identical to what
> is in the soc-generic-dmaengine-pcm.c file. So I'm wondering if we
> could abstract a helper function somewhere in the ASoC core: Mark?

That's roughly what sound/core/pcm_dmaengine.c is doing -
possibly we should move more stuff into there.

--1ozVqH6bFr/3sC51
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl141ZcACgkQJNaLcl1U
h9BiLAf/TB2E4wy6DNKmjy1tOffUwKYDmy9RgufK7HCIINZHzoiiwRgXY0IcsAnQ
/l2Qpn8LKUi3uc4Db4urdP6TaWvOecadb/PX8ifkRVAUSIEWkbYumPmdfNeKQ2Sq
oUXlxF682VrGakytUZlz4dh/BFhiWxda52tfs4WUuzO4TyHjpmCM3dZg3Em3J536
FjgP4H1tnb1d/6j1am+7o5b4YBuQRmYo39ZJrEHOCliEZk6L7ycncUV+Ye4QSYCk
iOYjeb9FmZxK0JZErs0Eu7rXsk5JZQptegeJ8kTSZv7darXCSpVltusGB92mMij5
akx0MmeZQdSoM83elUgbLWuJtBnkjQ==
=7lNC
-----END PGP SIGNATURE-----

--1ozVqH6bFr/3sC51--

--===============4435384036925218416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4435384036925218416==--
