Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5EAF8066
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 20:46:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29834166C;
	Mon, 11 Nov 2019 20:45:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29834166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573501583;
	bh=6SfHZIvEL+W5A74lYtVlC3zW6prmagcHJE5CcG0hVCs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tpNwx0BgFVoOJKeb8f7+Ojj3vnXcMtlRcPjl4XCHWy84SMHbXnRTL2nWcR7cMMwZT
	 OJiUJbyTjGobeC25/+IiPwRG3lq7K/Y4nuX/iW7tkuUO0PUHUMeUG/zEo33GJWULE9
	 FISNniAJpDwC3/Ot0aaEv9Z1XMFPtcNQ4tlbxqEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 770F7F80518;
	Mon, 11 Nov 2019 20:44:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FEBFF804FF; Mon, 11 Nov 2019 20:44:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6577DF80275
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 20:44:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6577DF80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="r1eXBIHX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w2Rvj75LepKCR7yvJRU6eUm9bZCoooUrRGcsFZAdp44=; b=r1eXBIHXW8wElBLNHdZkZCM3A
 AzP12bMWZmuFGCNc3Bi6CGesg8gdD53umqic2PQVCUR3UIugiWiPa7ujoBTx3ybggJVIXeVYPR3jf
 ZQXUwKDwu4PuUGdIZ6r3b9Kw/tEzDSaALuVUptZa1o6C4+Ev9GTjtCzihZ9TGxEc7pfpg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUFbw-0005Mj-Rw; Mon, 11 Nov 2019 19:44:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1777D27429EB; Mon, 11 Nov 2019 19:44:28 +0000 (GMT)
Date: Mon, 11 Nov 2019 19:44:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Jacob Rasmussen <jacobraz@chromium.org>
Message-ID: <20191111194427.GA29859@sirena.co.uk>
References: <20191111185957.217244-1-jacobraz@google.com>
MIME-Version: 1.0
In-Reply-To: <20191111185957.217244-1-jacobraz@google.com>
X-Cookie: Do not flush.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Jacob Rasmussen <jacobraz@google.com>, Takashi Iwai <tiwai@suse.com>,
 Ross Zwisler <zwisler@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Bard Liao <bardliao@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt5645: Fixed buddy jack support.
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
Content-Type: multipart/mixed; boundary="===============6401854056264440600=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6401854056264440600==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 11, 2019 at 11:59:57AM -0700, Jacob Rasmussen wrote:
> The headphone jack on buddy was broken with the following commit:
> commit 6b5da66322c5 ("ASoC: rt5645: read jd1_1 status for jd
> detection").

This commit has been in mainline for a while but this doesn't apply
against my fixes branch, I'll apply against -next but it'll need some
work backporting to make it back as a fix.

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3JuhsACgkQJNaLcl1U
h9BNCwf/b+3c+eWRNxNuFVB11hWjuEPm4L52Y+EEJtvjLT46mZx+Z8jfIMRSG42T
C6geE4W1VszoICq/jDP7ayx/PrzKtrLMw+7O2lIrHCELt3ZZvBs5JuVg4LUHrgmc
mHiUESFuh37PreCB/b9Hb3YDpDr0Azw1RlMBPXTInl40CAwZUzKxFbMNb4fcuW1n
cPgu+tH9CCzJPeFuB8xNZhtGIRlSeoXEwsM0VyNvrAhrVQSufPvhB0RTVUT+0/pb
rYnW/4r0rT5qZPS018onIyqU7xuSxXnXrZaBfbsGv1rgXz68KZfnPzx/TMTHWxrp
mKfqF7ylJs7SxL+RyWywD+q1i27aMw==
=ue85
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--

--===============6401854056264440600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6401854056264440600==--
