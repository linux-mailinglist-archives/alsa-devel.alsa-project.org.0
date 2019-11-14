Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FA3FD118
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 23:46:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 025E9165F;
	Thu, 14 Nov 2019 23:45:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 025E9165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573771608;
	bh=0C9Bvr2wdEs0CFl25acjy8TL3eheuyhcV6u+UTV+UPI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=clTZsnOuxhJS8qvUG3acLrLhTa7nFhW3Qy/AX8IKSQqTJG+i2sMjxO223JnBEH0yS
	 yVyGKM5M4FMaRjFfXxDagRXK3EBu/k4gzh6udo1UQxzbY/CCJ+x5Po0M1IFtiEgFuG
	 xobeosm63vEf+n0TnH53ZUnDGorYohoQyDSQng1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 684AAF800E9;
	Thu, 14 Nov 2019 23:45:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F09DF800CF; Thu, 14 Nov 2019 23:45:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C75BF80084
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 23:44:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C75BF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="up5DdfD/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VBWSxyqFNu57a211AegG4LgleE/has5MXudCMHIozs4=; b=up5DdfD/1x/hAHbiXVOVPlRfP
 NPuQjpXURVaBXynlhBNx3/LW7UvG/N9gVE5hcrGPKpV1CNS7+Latc0RbONtqvZmyy8m9Cm2o9BSHg
 SE6ywZHp4ILU7svhX+iDbhSLFdcjJ74xMvLJ+GrLSPS5f8iPzqC5wyxrJSgoL+DO3TNJI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iVNrD-0007jQ-8S; Thu, 14 Nov 2019 22:44:55 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 566CF274328B; Thu, 14 Nov 2019 22:44:54 +0000 (GMT)
Date: Thu, 14 Nov 2019 22:44:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Jacob Rasmussen <jacobraz@google.com>
Message-ID: <20191114224454.GD4664@sirena.co.uk>
References: <20191114190844.42484-1-jacobraz@google.com>
 <20191114214301.GA159315@google.com>
 <CAPZ+yN+EP=ffzWDz4hWZ3W=usDoYt7VFKaoMAgzvjo7WL_jW=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPZ+yN+EP=ffzWDz4hWZ3W=usDoYt7VFKaoMAgzvjo7WL_jW=g@mail.gmail.com>
X-Cookie: Santa Claus is watching!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Jacob Rasmussen <jacobraz@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 Ross Zwisler <zwisler@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, Bard Liao <bardliao@realtek.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: rt5645: Fixed typo for buddy jack
	support.
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
Content-Type: multipart/mixed; boundary="===============8081008731487285490=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8081008731487285490==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n/aVsWSeQ4JHkrmm"
Content-Disposition: inline


--n/aVsWSeQ4JHkrmm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 14, 2019 at 03:43:32PM -0700, Jacob Rasmussen wrote:
> On Thu, Nov 14, 2019 at 2:43 PM Ross Zwisler <zwisler@google.com> wrote:

> > On Thu, Nov 14, 2019 at 12:08:44PM -0700, Jacob Rasmussen wrote:
> > > Had a typo in e7cfd867fd98 that resulted in buddy jack support not being
> > > fixed.

> > > Fixes: e7cfd867fd98 ("ASoC: rt5645: Fixed buddy jack support.")
> > > Cc: <zwisler@google.com>
> > > Cc: <jacobraz@google.com>
> > > CC: stable@vger.kernel.org

> > Need to add your signed-off-by.  With that added you can add:

> > Reviewed-by: Ross Zwisler <zwisler@google.com>
> Signed-off-by: Jacob Rasmussen <jacobraz@google.com>

I'd be more comfortable with this if you could repost with the signoff
and the patch in one mail.

--n/aVsWSeQ4JHkrmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3N2OUACgkQJNaLcl1U
h9AMRgf7BSP5AIvGA9TnvKf2VoXlRlNS8DrafSXItt9h4X1RVJgmcCFoF+W9AZrL
2UM5V9NfuB0A+PsVYWTdUWbIvDYrBRb4NecaaYJvEa7XVL+dtvOLrqGZcANn/Trr
lnqwHZhMrHyIRPWXjCdWuM6XymaC8n31ptGJH+OJ6/QJBvwiM/HvMBVPNjFczuU3
1NOVR4shUdS83vqRTWzqNOwQaOfRbSxlG8OH1de0inLiqDXM+4BN6T2BabBfTelI
f/JnxMOvQBaIAnjN2hsY/f4Q3acDof1btff0hSLSH25wOKeUtrWq3MRt6H94CkbJ
1T0d6DDwjKphYDn6J9ijVUWO5pOi+A==
=SPvm
-----END PGP SIGNATURE-----

--n/aVsWSeQ4JHkrmm--

--===============8081008731487285490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8081008731487285490==--
