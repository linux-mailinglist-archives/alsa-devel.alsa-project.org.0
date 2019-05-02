Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B5D111B0
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:42:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7232C1782;
	Thu,  2 May 2019 04:41:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7232C1782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764932;
	bh=fG0m+Tm3HqGW/xZCN7XhmRngruL3FTNnZmmvKxOcPrI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DVPaJcm8E785PTX5Q+G79Ds8+JnoKd19QEnlA3YudAgVCUUWH66gmsPkWsQDSa/Pz
	 hyPgcOnnp/Q1Cxe8sCJLdaHjgv8v83fv1LwhpK5iuh9gs4YaQitZSuVWdZCHERbHOY
	 nKmfL0C+rwLFag5MGeFrCMVALrgZNGcQjKOYaJB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7889FF89723;
	Thu,  2 May 2019 04:39:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82F68F8971A; Thu,  2 May 2019 04:39:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B932BF896E3
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B932BF896E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Cb5V6HQQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AOg+ZncfoqT6OZPyimiwJ+flH8XXCIhe4A54zI2KK28=; b=Cb5V6HQQ4gnGG3LZN1YTJSqcw
 pulWeJA0UGmo7LW4DpqAG6I4UuXXDLRLzIDRKL+XkUg3SdVIEaZ8q1FeB1/44M+YWpm/ZqUWVxrNV
 +e/NtKkTZ8jt/JEG83MKeTPQA7Po//H3Id7lWSYCTfnhB3P1+t6BATI/zGJEh3O65Bi5U=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1dU-0005zv-N8; Thu, 02 May 2019 02:39:49 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 6F730441D3C; Thu,  2 May 2019 03:39:45 +0100 (BST)
Date: Thu, 2 May 2019 11:39:45 +0900
From: Mark Brown <broonie@kernel.org>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20190502023945.GA19532@sirena.org.uk>
References: <c4cf809a66b8c98de11e43f7e9fa2823cf3c5ba6.1556417687.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
In-Reply-To: <c4cf809a66b8c98de11e43f7e9fa2823cf3c5ba6.1556417687.git.shengjiu.wang@nxp.com>
X-Cookie: Vax Vobiscum
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [alsa-devel] [PATCH V4] ASoC: fsl_esai: Add pm runtime function
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
Content-Type: multipart/mixed; boundary="===============4827439706414677254=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4827439706414677254==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 28, 2019 at 02:24:54AM +0000, S.j. Wang wrote:
> Add pm runtime support and move clock handling there.
> Close the clocks at suspend to reduce the power consumption.
>=20
> fsl_esai_suspend is replaced by pm_runtime_force_suspend.
> fsl_esai_resume is replaced by pm_runtime_force_resume.

This doesn't apply against for-5.2 again.  Sorry about this, I think
this one is due to some messups with my scripts which caused some
patches to be dropped for a while (and it's likely to be what happened
the last time as well).  Can you check and resend again please?  Like I
say sorry about this, I think it's my mistake.

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzKWHAACgkQJNaLcl1U
h9DAmAf/ZznWBwoyQXL+nQLRK1eWpBZg9ma0CiFNxH/eUHzwZYIKALZvQ/XtxTgU
loMrwMJLbC8TRCPxVnH77AQRIKS0VJMheOaYCv9wmu+hFNjnEuuhRT0wg/30oMba
gt6LFb/SdSap+9uDN0x6m6BEAoM44d9efhi8M2zc9F9TegdXH1Vehcg9Z+andnzx
0zj6hZtkD22iTm7Cc866VIvc8SfOEsn3TK7mtFUtH3dwX7uJC11HFQnlBcLqyMrV
Wxny0faTSxjZXYxrMJMd7vk7ekzyvb57Rg58Si3234fbU8yL/vOJS8xLNbWjvjYX
4+wYCtvBSLTk76eOCZIBx+Hi2ifAGw==
=YKw2
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--

--===============4827439706414677254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4827439706414677254==--
