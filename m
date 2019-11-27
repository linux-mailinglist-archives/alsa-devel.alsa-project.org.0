Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0879510B296
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 16:42:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D2011701;
	Wed, 27 Nov 2019 16:41:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D2011701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574869343;
	bh=M+L7qPA70Tq+DW+vJCnmqHegAJ0m1kGDdpbwnD4MWH4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f5PP8ASN9rJ2MPdDsPKAT9GA8AGdgfDaVWoKYyxU9rFzXLMd3g9MUNnP9v6RCaHYk
	 WhR7Oe8/Wi8mcJZ5+5Hj1IttzfFB3JM86wsqeIxIDVVwGOADJ0g3Fi3vN12Dthh6E9
	 F4/oE6Xte6mlEPdlX2RwG+RAsxP7b/ZH82ge5Wrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6B00F80171;
	Wed, 27 Nov 2019 16:40:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 530F2F8014D; Wed, 27 Nov 2019 16:40:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E9469F80109
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 16:40:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9469F80109
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4A7630E;
 Wed, 27 Nov 2019 07:40:32 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4305C3F68E;
 Wed, 27 Nov 2019 07:40:32 -0800 (PST)
Date: Wed, 27 Nov 2019 15:40:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Message-ID: <20191127154030.GD4879@sirena.org.uk>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
 <20191120152406.2744-7-sebastian.reichel@collabora.com>
 <AM5PR1001MB0994720A0D615339A978E35C804E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <AM5PR1001MB0994E628439F021F97B872D480450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191126170841.GC4205@sirena.org.uk>
 <AM5PR1001MB09949D557742E8817545637F80450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191126175040.GD4205@sirena.org.uk>
 <AM5PR1001MB09940CF764711F1F13A6B37E80440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191127123317.GA4879@sirena.org.uk>
 <AM5PR1001MB0994D842A2D7051F81A7765B80440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <AM5PR1001MB0994D842A2D7051F81A7765B80440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
X-Cookie: In the war of wits, he's unarmed.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Support Opensource <Support.Opensource@diasemi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [alsa-devel] [PATCHv2 6/6] ASoC: da7213: Add default clock
	handling
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
Content-Type: multipart/mixed; boundary="===============1248701854371703723=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1248701854371703723==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TybLhxa8M7aNoW+V"
Content-Disposition: inline


--TybLhxa8M7aNoW+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 27, 2019 at 01:42:54PM +0000, Adam Thomson wrote:

> nicest solution here though. I guess we're stuck with people having to manually
> configure the PLL for bypass when a non-generic machine driver inits, to avoid
> the initial double config, as I don't see other options unless you have
> something to specify at init that it's auto or manual, and this doesn't feel
> like a DT device specific property thing as it's more software than hardware.
> At least Sebastian's patch has a good comment block to highlight this.

Not sure I follow here - if we're configuring the PLL explicitly then
I'd expect the PLL to be configured first, then the SYSCLK, so I'd
expect that the automatic PLL configuration wouldn't kick in.

--TybLhxa8M7aNoW+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3emO0ACgkQJNaLcl1U
h9BAnQf/Q4HBT+E0Q86c5T5kw3hIEfvjSfcdzKbqvPYBoxeiJPWz6BgtIYowJOk/
VIMobVK2PGfli24WdMYQtG8lwdNCUo5ff2DmOFSEc5U90CRHfaaHh1agqu8g+xX0
XENPmJDKQNV+T5AhrkNyulGeIwPqn2sOssOTTBzIRlQ5TeD8PvqDFmbNwQ1ty/wh
pJijH+imJpNcTVQtey9tEP29W2HUqqEURJK6n7QVOFseFXQKLv+KpQaMmsx0Jqrd
Js/kclZ1np41N3D15cACh/ANKG6RNaT5i03P9imE+ujeWPWFW92Z6P70vf5uzUug
Q/qbBvhCvX6qIgrcOnsmLYLAlZfXyw==
=bhaa
-----END PGP SIGNATURE-----

--TybLhxa8M7aNoW+V--

--===============1248701854371703723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1248701854371703723==--
