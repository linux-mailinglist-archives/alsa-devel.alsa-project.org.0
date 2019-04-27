Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D24D1B413
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 19:19:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 530EB853;
	Sat, 27 Apr 2019 19:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 530EB853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556385594;
	bh=R33FOfOr9/3w9dQAHP0qoQ1GucPmad1kXm61GIsAgX4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z5oY9l0eNHFl2KL+DfcxDlBEnVmDavzBm/df79Wo8Me6okagd1aywL3f9Q6FWA09+
	 U20fOsXj32Jh83Mc1qZ1BtqqdUebJ45UoWVy5fG6Oy42oAFeaXihpMdDgXKljLKJP0
	 k51uXQMQDY8BI5JMPGH9jH5RBEEhDpAenR8dktIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F50AF89716;
	Sat, 27 Apr 2019 19:18:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0F83F896FB; Sat, 27 Apr 2019 19:17:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB430F80CAB
 for <alsa-devel@alsa-project.org>; Sat, 27 Apr 2019 19:17:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB430F80CAB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="daPx8Yik"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Ni2YRPbf4GMMunOYWIHYcrCRiFTp5FPuVt13sVOpXA=; b=daPx8YikwrUepaPWMqT4aN8tI
 SsXhwvgRFVOFZwsMtbroir3Z3uFn2W3wa/io6Npseaelpj5R4Sx10dcqtBSDhLWea/OenRSOJzpt+
 LmrSZnN7aIPhLKz5XY+Vdel7xQqa5tYtZR53RQatBvM5tjlZURKGKY3nLlR4iVaDcDDZQ=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKQxS-0004YI-UN; Sat, 27 Apr 2019 17:17:51 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 1E81C441D3B; Sat, 27 Apr 2019 18:17:46 +0100 (BST)
Date: Sat, 27 Apr 2019 18:17:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Message-ID: <20190427171746.GG14916@sirena.org.uk>
References: <20190421193853.10188-1-daniel.baluta@nxp.com>
 <20190421193853.10188-3-daniel.baluta@nxp.com>
 <20190426100025.GD14916@sirena.org.uk>
 <CAEnQRZCPPr1iHvKEj=fOsE8A2iW=XZd=CaoFqAoUqJftg4pN9Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEnQRZCPPr1iHvKEj=fOsE8A2iW=XZd=CaoFqAoUqJftg4pN9Q@mail.gmail.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH 2/3 v2] ASoC: fsl_sai: Add support for
	runtime pm
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
Content-Type: multipart/mixed; boundary="===============2147783274775429165=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2147783274775429165==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p7qwJlK53pWzbayA"
Content-Disposition: inline


--p7qwJlK53pWzbayA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 26, 2019 at 03:10:10PM +0300, Daniel Baluta wrote:

> The only patch left in the series that needs to be applied is this:

> https://www.spinics.net/lists/alsa-devel/msg89733.html

> I will reply also to that email, to be easier for you to find it.

Content free pings don't help...

--p7qwJlK53pWzbayA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzEjrkACgkQJNaLcl1U
h9AWVwf+KSlrvfBfUuZMLNHSHD7WREpZgHjLFsCPB8QHrdYC2CjypGjl9cjkYFDL
zvVk9IotX8UodiLJN5KwgU9eO38JRbxXR+oVTN4+HnRIJv690m8LztYI9tAcqGIp
2BvosaU2xv5RTitkpD8v3rykVDyAvDNvYDWK6gj8/Mz4UHi68onYaKMmoDNTnTKC
9jAwU6oCeivjDydZIzMbyoQb1lUBpeHXHZrTn4e8iar9AfOEGEoR8QEhD+7D5k01
y/t2YU6KD1U9YlHUK+FEfUeXLAMslI4284MVKw960xesrxvOcSltnQozVvR/tESL
a+JaBF7FAsQc29UsdOCjSKKubkfKQw==
=phjH
-----END PGP SIGNATURE-----

--p7qwJlK53pWzbayA--

--===============2147783274775429165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2147783274775429165==--
