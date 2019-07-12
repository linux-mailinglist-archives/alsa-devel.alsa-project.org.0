Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5169F66B2F
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2019 12:58:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4CB41685;
	Fri, 12 Jul 2019 12:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4CB41685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562929092;
	bh=SXmeaD9fJqC8ry3pYwqeOZlwcztP3D6GHHAludBauWA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lm+AL01/iD4X6qGxOhaykXtdHrcF1bg3eObB3PfjN+AF+wMre0b20S6VG1Bq4pOt0
	 ZyRbSCYrZfUJYHqthtGP+zbTGbzdZDbOuo6VeAv6Cnd1n6cbwYkZBt/Ca4AZ+fq2iq
	 v+cs+aD8LS5+MgADYIyaglt99x64Bk461xD1RQx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16EFEF802A0;
	Fri, 12 Jul 2019 12:56:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75563F802A0; Fri, 12 Jul 2019 12:56:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43E4DF800D8
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 12:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43E4DF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Nc4DglWL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R31OTluumCbFh2Wq31EACJNPV9PVLFkU904R5DpMCmQ=; b=Nc4DglWLq32b6Q41Fp8lXJdIp
 np6/G6hkVmv0LaMlmjuouu3lOkuLsMNKDIwwzqFWsgk5hGw2KtNFfIzpj/VmQtQwisTLlQcvOdClm
 +qObwFo7QHEYdhD0xUWeL88AcT+i+snqELMLwjfeyWRXvB2qx7OvIOQDp697kIzsY5L20=;
Received: from [217.140.106.53] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hltDw-0006AP-9P; Fri, 12 Jul 2019 10:56:20 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 685D8D02DAD; Fri, 12 Jul 2019 11:56:19 +0100 (BST)
Date: Fri, 12 Jul 2019 11:56:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Message-ID: <20190712105619.GL14859@sirena.co.uk>
References: <20190709182543.GA6611@hari-Inspiron-1545>
MIME-Version: 1.0
In-Reply-To: <20190709182543.GA6611@hari-Inspiron-1545>
X-Cookie: Visit beautiful Vergas, Minnesota.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, linux-mediatek@lists.infradead.org,
 Shunli Wang <shunli.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] sound: soc: codecs: mt6358: change return
 type of mt6358_codec_init_reg
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
Content-Type: multipart/mixed; boundary="===============5402747408072303898=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5402747408072303898==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bPg9NdpM9EETxvqt"
Content-Disposition: inline


--bPg9NdpM9EETxvqt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 09, 2019 at 11:55:43PM +0530, Hariprasad Kelam wrote:
> As mt6358_codec_init_reg function always returns 0 , change return type
> from int to void.

Please use subject lines matching the style for the subsystem.  This
makes it easier for people to identify relevant patches.

--bPg9NdpM9EETxvqt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0oZ1IACgkQJNaLcl1U
h9DBvQf/bEOPmabOAkiJN59jKdo0Gi0w05y+5JDO15GfjfCufMDcc4Ul9bl0aH0X
sBwwlklO0yJM4Szsx4dy8rVPtdU6GldTUUIprkzTyzb+e2jO63BxyTzR85GKXwkt
0UFKK8ZOp74xrpxkc3ViFRwnfKNQ8qm2eqcoszNwUH8xrqPOFYhrmIjBrmlikuEB
+ojxODhzc18uqCo8YUHrqFHW85L/bxomSFWVP5Uyv+R1STDaZHJC/8uXlBdNu8C/
B+DDhV8hBV8YLAS8fYeNTARUhBf/IX9Yukc4h6hECKdK80l4mhqK/mOVeMXvtSUW
E+3CB4XK/4FDzc1nlg01L9omlgrGAw==
=pELE
-----END PGP SIGNATURE-----

--bPg9NdpM9EETxvqt--

--===============5402747408072303898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5402747408072303898==--
