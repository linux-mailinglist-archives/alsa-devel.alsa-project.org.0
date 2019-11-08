Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AB0F4C3E
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 14:00:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E18D01680;
	Fri,  8 Nov 2019 13:59:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E18D01680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573218031;
	bh=pBmATHZyNwaQd7XyGBXnR9i6Yy2wShXB0H0+D5cRMqE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=clWeDJlJEn1gURFC0tUyJtZk1YStIm/FE/kzirI5QD3/w/WkWCtl0i+LNtVhjJ814
	 PoaTSkJfLIa0a0gKvMGeOLaeMNENMWxFBPw4AG55MG/6+gyfrziGznks4YrLTZwOhi
	 nJ9As/NKgWlNMUu3M+Vc+vg5eEYFkFbl14LQqSAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B99FF803D0;
	Fri,  8 Nov 2019 13:58:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C487F803D0; Fri,  8 Nov 2019 13:58:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3441BF800D3
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 13:58:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3441BF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="hjIquWDD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dZiZReF8PG9WJyyvHHKG+ZfVVpiGHUV6sAFB+h482p8=; b=hjIquWDD/3c1APYBYulrhscVj
 vqGUbsCNnZ5QUP2ptKh9pCY5uYVpRC3FEXEOIgrnJAf6qF8Y1WGzd0jAmy4RxyQ7Yig/KYunQ9yYW
 zigv8+qZeAqWF9QGl43aURhm/CvIml+m2rB85IY9SDV1raqucSoPWrmS9o/E6usKEYVB0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iT3qa-0007IE-7A; Fri, 08 Nov 2019 12:58:40 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6C2BC2741450; Fri,  8 Nov 2019 12:58:39 +0000 (GMT)
Date: Fri, 8 Nov 2019 12:58:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191108125839.GD5532@sirena.co.uk>
References: <20191107125953.GE6159@sirena.co.uk> <s5hwocb231x.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hwocb231x.wl-tiwai@suse.de>
X-Cookie: Life is like a simile.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [GIT PULL] ASoC updates for v5.5
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
Content-Type: multipart/mixed; boundary="===============4388811748123185947=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4388811748123185947==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sgneBHv3152wZ8jf"
Content-Disposition: inline


--sgneBHv3152wZ8jf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 07, 2019 at 03:07:06PM +0100, Takashi Iwai wrote:

> BTW, the diffstat in this pull request was completely bogus...

Yeah, git does that - it's triggered this time by the merge down of the
branches not being final so there's a huge diff with mainline at the
minute.

--sgneBHv3152wZ8jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3FZn4ACgkQJNaLcl1U
h9CBZAf/eSLrO6fgbusgjN+naLgHB7zy/r9hQDoTPjpFPwCZVR89FiI2g7Q/vNFH
HIovTaOuM3VaAQdyquK++Uek6+HGLA3JziX6IksnZVEGwFBSJHT3J/n5TuvVLsM4
MiMfxjs0Ef1ZKme5VLSHyo4LlrAJoH5HSExPyj1+yMzHW8RKiyLLDUNhnaSVArJa
z0TdU8vaSuJr1WOD6haBiA4nKYIlj66CYQ2qHCI2nlzYTC3Cih26HjkxtyC7e5Ya
/cGNSwi6QdPOtQmXMdG5WdvzlhRn8fphA8iRdF0TNkikPmOJE6am7rkVE81z79ok
kFQp0YmLxIL+JZDKD7Nv1X168J8x+g==
=Tx0+
-----END PGP SIGNATURE-----

--sgneBHv3152wZ8jf--

--===============4388811748123185947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4388811748123185947==--
