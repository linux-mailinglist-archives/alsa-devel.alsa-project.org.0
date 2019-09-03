Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75692A71B3
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 19:31:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7F411694;
	Tue,  3 Sep 2019 19:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7F411694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567531890;
	bh=zX6drHX0q88xCxulCqdb7IyWVi2naJYhvNNDr9VP0go=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IEwSjBNjZIdKjwToZNr7BUxzKGI/sm+q8v197cChQaoYWCPMZvUZNPvV025k4LoH6
	 BjmsGeQDvd69ClRLpHplGBYz7ENEo2EQPoofm2tfiZBKwEwGnJW93KusbpkjilyTMS
	 2d3HKwbkPG7Eh5veV1UgVH7xdsZND903KkjwwCYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F086F803D7;
	Tue,  3 Sep 2019 19:29:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A507F8045F; Tue,  3 Sep 2019 19:29:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09587F8011E
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 19:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09587F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="i32rHdvm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vPOV2xwpaRhp0OMl1Ga/s7x5wzmL8WG9D2hn+PwaTs8=; b=i32rHdvmlzW0spU4KU2ob0FEP
 xZi0E6SIkJkRqIhsQt8J3l5MBedhNdrVGCRqSGq/ymrk4OsRpAIyxCvZqrc8feD3NvFz78ohTxlr4
 HEe0gLTgCn8k3yfVRkxPq7U6pTYp3P9ii76PtpNjTCJCutoF7JceoA9LbDpNmot64KhDc=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5CcY-0000rp-8E; Tue, 03 Sep 2019 17:29:34 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 408CB2740A97; Tue,  3 Sep 2019 18:29:33 +0100 (BST)
Date: Tue, 3 Sep 2019 18:29:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Message-ID: <20190903172933.GC7916@sirena.co.uk>
References: <20190903165322.20791-1-katsuhiro@katsuster.net>
 <20190903165322.20791-3-katsuhiro@katsuster.net>
MIME-Version: 1.0
In-Reply-To: <20190903165322.20791-3-katsuhiro@katsuster.net>
X-Cookie: You will pass away very quickly.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, David Yang <yangxiaohua@everest-semi.com>,
 Daniel Drake <drake@endlessm.com>
Subject: Re: [alsa-devel] [PATCH v3 3/4] ASoC: es8316: support fixed clock
	rate
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
Content-Type: multipart/mixed; boundary="===============8806368542219531551=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8806368542219531551==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sHrvAb52M6C8blB9"
Content-Disposition: inline


--sHrvAb52M6C8blB9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 04, 2019 at 01:53:21AM +0900, Katsuhiro Suzuki wrote:
> This patch supports some type of machine drivers that use fixed clock
> rate. After applied this patch, sysclk == 0 means there is no
> constraint of sound rate and other values will set constraints which
> is derived by sysclk setting.

This is to support variable clock rate isn't it?

--sHrvAb52M6C8blB9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1uovwACgkQJNaLcl1U
h9AZzQf9HH0Db1wJ+XWQDgxQgcVuonUvv5+nYIakBUPCwszpWPe2bSJaYOmA//d0
U1FmJCCpd/fKXHa1BfdQsA60q9u08qHcd4k2aWsbx3RwhO69rqPJu5V/OGG9mHL2
XyeyZ5mwLYbSTWEJW+AOfqqHq8gTFrJro9vWc3jfXZXLwxAdLPRZJpeiKYPZR2ZI
b2nyd9MZR4Zm4gTXPzb90ASOHnfe0/N6sFY8m8f/XWRluI1rZ1YySFHIB9ik3YNO
vzU5s7fGrvGcXLpvaFdBhbP/KdZpJo9VUGWNvSopmk1Jep0EfTy1/z5dMiRemHAx
/ruhvBhzpRS5yuFFqpgDj6VidFhPaQ==
=beyQ
-----END PGP SIGNATURE-----

--sHrvAb52M6C8blB9--

--===============8806368542219531551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8806368542219531551==--
