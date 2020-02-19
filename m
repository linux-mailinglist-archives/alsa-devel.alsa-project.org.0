Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F41D21643ED
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 13:08:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 410171695;
	Wed, 19 Feb 2020 13:07:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 410171695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582114082;
	bh=IpLhAi9AooA4Gf4th3c5XahCCwCq9g4w7rArbqpTPwM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RHgpUJv+6AlsIuui2Q3nBgli0n3Z2Kbrxvm9K3ggWwM92UEMqiDUYnoc8ymPDZgiK
	 ByC5VxwJkfaftkqs+7xfPsgF1FvZYdkCSmaRclVrZB8LD47jUip4X7kcGDo7TXypHe
	 WQbzzyFyZB8JaPCdIIUyGxbAatXFFWCFCKRpgt+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BEDDF801F5;
	Wed, 19 Feb 2020 13:06:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97964F80273; Wed, 19 Feb 2020 13:06:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 07788F801F5
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 13:06:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07788F801F5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6B9731B;
 Wed, 19 Feb 2020 04:06:13 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A28E3F6CF;
 Wed, 19 Feb 2020 04:06:13 -0800 (PST)
Date: Wed, 19 Feb 2020 12:06:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 2/3] ASoC: rockchip: Make RK3328 GPIO_MUTE control
 explicit
Message-ID: <20200219120611.GB4488@sirena.org.uk>
References: <cover.1581376744.git.robin.murphy@arm.com>
 <5bc383ed1832f0f5d1dcb3c97ad92fd68e5217e3.1581376744.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline
In-Reply-To: <5bc383ed1832f0f5d1dcb3c97ad92fd68e5217e3.1581376744.git.robin.murphy@arm.com>
X-Cookie: FORTH IF HONK THEN
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, heiko@sntech.de,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, pgwipeout@gmail.com,
 linux-arm-kernel@lists.infradead.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 18, 2020 at 09:31:59PM +0000, Robin Murphy wrote:

>  - add fallback case to avoid possible Rock64 regressions

This should really have been called out in the changelog, were I reading
this cold I might've stopped at the changelog and said you needed to
keep the ABI stable for old boards.

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5NJLMACgkQJNaLcl1U
h9A6EQf+M4FxgJh7NoGwjteEBX6uwLvxHTrgo0677EFqqDjc/b5TNCDU720Q7dbi
Mead2pPB06lQOHGO2piOu+A55lWuHX17hfnh9t1AECnZmZDQv/kTgZ/qb/yYU02d
rJLGP0+Uy8bYU3SAzIGZyC0RJ3MydsaHp5/w3qXNiTQ/RB90k4CkqeYpCw0uT9yX
8fgIUqUdiOgOvGjDn91teqXcoAjIU7VXfvz6yijqhqNynx1ybjgXklR1TJ2S2bZc
kY35dvMUXpVraf/NcNJMYZVBaMRHMqj7LmRGUUAcVZZ982bWNAXx1FOPzY19ri6v
NZyWPTowIagAhp65YyKen9nUh3a4sA==
=Inf+
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--
