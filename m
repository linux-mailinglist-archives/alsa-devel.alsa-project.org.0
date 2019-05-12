Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1941AD6A
	for <lists+alsa-devel@lfdr.de>; Sun, 12 May 2019 19:07:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 003F5172D;
	Sun, 12 May 2019 19:06:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 003F5172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557680851;
	bh=qjOrelfCnhDy+cYfwREk7aonquBSQrwUpRlSULWjC9E=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ipx6DFII3sOK8UMeuTJpS8XuovbNyft9SnbQFhLLTH1v+PATiwjTcf6XwPXGDbCc0
	 5yCJYSah46kFcwsVHWPs8NTVypOj7sV7FL534ArtEMSSNlMyNRUY4BkjawUWrFmbvy
	 e4jEOnlxvYQQP0RFHejxMvg2IvB7OyMZoEMzuVa8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99FC3F896B6;
	Sun, 12 May 2019 19:05:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FAEFF896B6; Sun, 12 May 2019 19:05:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DATE_IN_PAST_06_12, DKIM_SIGNED,
 DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75159F8961A
 for <alsa-devel@alsa-project.org>; Sun, 12 May 2019 19:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75159F8961A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="YcPgH/wO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i7AIbl3LuWCqd7OLDSbBZZ+JZVLRCdFPtZTLEmXFlX4=; b=YcPgH/wO+xi9sH9dzNiWeGDnh
 aut8UScY9xKtjJf0ZSIy0pUP4FNY/xtfCuKYjbjLkdWva3AZvyNCnW35thx+T4VdaF0gkKNAJ8hpL
 mwDObNGZGo8C0jJ0mQ50lzj40EZfdK0a1mK92z7NZLMISwwWGQ1OYGJCXiM1ccBafV3dA=;
Received: from [81.145.206.43] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hPrut-00044U-NA; Sun, 12 May 2019 17:05:39 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id EE2C5440056; Sun, 12 May 2019 09:27:26 +0100 (BST)
Date: Sun, 12 May 2019 17:27:26 +0900
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Message-ID: <20190512082726.GL21483@sirena.org.uk>
References: <20190506095815.24578-1-jbrunet@baylibre.com>
 <20190506095815.24578-3-jbrunet@baylibre.com>
 <20190508070058.GQ14916@sirena.org.uk>
 <fd633a5597703f557d75e43c14213699efe295f0.camel@baylibre.com>
 <20190508085758.GE14916@sirena.org.uk>
 <5b677f1581565bd8c915a14cd91352ec4bcabdd7.camel@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <5b677f1581565bd8c915a14cd91352ec4bcabdd7.camel@baylibre.com>
X-Cookie: HOST SYSTEM RESPONDING, PROBABLY UP...
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 2/4] ASoC: hdmi-codec: remove reference
 to the current substream
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
Content-Type: multipart/mixed; boundary="===============2566124925335371649=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2566124925335371649==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="00hq2S6J2Jlg6EbK"
Content-Disposition: inline


--00hq2S6J2Jlg6EbK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 09, 2019 at 10:11:48AM +0200, Jerome Brunet wrote:
> On Wed, 2019-05-08 at 17:57 +0900, Mark Brown wrote:

> > Probably using a mutex for the flag is clearer.  I'd rather keep things
> > as simple as absolutely possible to avoid people making mistakes in
> > future.

> I received a notification that you applied this patch.
> Just to confirm, you expect a follow up patch to re-introduce the mutex, right ?

Right.

--00hq2S6J2Jlg6EbK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzX2O4ACgkQJNaLcl1U
h9DTqgf+PkO76Y2CBGrPX0MuFUXOjE2QlNeHbqPtBweMBUAI8bHZbVVwZzd4RWQc
MO9Na+UlPDBKHaxlfkC8HqV5Tud6PMmAcXYj/qJCiGewOTwVI+C472JBLfsYfont
dfAkAhqUE+XZ/WlF1MELpoXCWAY3AP/i8RLP7it1dD0Y58HZl3/ofjtB0eIXevAr
HnPMmyv9VzSA9RmD7bEwzeuURho3714tlQs45grB3UtW6h39hDUWHanl8v+uet1u
gyHtxg9tE90edoV83T8lkqwiRuO7Pd+V0XVKM1bvGpNVMEAgR6iAQ02UUgULBzh9
qVZx8lrwwvTjCIQVH+VUw2B5NwV1Rw==
=m9x5
-----END PGP SIGNATURE-----

--00hq2S6J2Jlg6EbK--

--===============2566124925335371649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2566124925335371649==--
