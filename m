Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AD08B6F6
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 13:33:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F8821665;
	Tue, 13 Aug 2019 13:32:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F8821665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565696004;
	bh=CJbR+Za3F6FHxM5R7LanWjw1W4PwHr5TRIQOXVh71u0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=axorED9QCvkVQpa2bI+YJST4xU7ypSMVZKksBcXRx7T865+9gyR9jK18JsJLfggxQ
	 P+XHK3DFnGSNqRlj8v0t7EiauJvWT3vXyMj8QS4/cxhAykshPMyQZ8wjddyVndxHY/
	 yaBKJ02PPv9jMtESR8CTjkINDBMr3fhp7qw8roHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4EFDF8026A;
	Tue, 13 Aug 2019 13:31:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 519C3F80273; Tue, 13 Aug 2019 13:31:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7314EF80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 13:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7314EF80120
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ZwZWUKiU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zq++AH36LcJV8AEMAUwSGNdy/skc7edYjMJDAHmF7M8=; b=ZwZWUKiUxBj9FOa8Z3s5c7GoJ
 gxwgBVHVPGQ1V7ib3cLwm9AnJDH7Q8QWguLFsVEuAm+7DWkAaoeLwvHz63FLLjr8UUVAkcDi7PQR1
 C/oixVlRFcRW+k+7Hl6NEAaolSkzzgHYlUYl3tz7AgQm7Rzmg4KyjeJWVRlb3CGAvxwIc=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxUzR-0007lv-EK; Tue, 13 Aug 2019 11:29:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 983992742B44; Tue, 13 Aug 2019 12:29:20 +0100 (BST)
Date: Tue, 13 Aug 2019 12:29:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Message-ID: <20190813112920.GC5093@sirena.co.uk>
References: <20190809070003.GA52127@atomide.com> <s5hwofmhkbs.wl-tiwai@suse.de>
 <20190809074643.GB52127@atomide.com> <s5hv9v6hhm9.wl-tiwai@suse.de>
 <20190813102451.GJ52127@atomide.com>
MIME-Version: 1.0
In-Reply-To: <20190813102451.GJ52127@atomide.com>
X-Cookie: Poverty begins at home.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] Regression in next with codec unload and
 snd_soc_component_get/put
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
Content-Type: multipart/mixed; boundary="===============3878980137807100351=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3878980137807100351==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Content-Disposition: inline


--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 13, 2019 at 03:24:51AM -0700, Tony Lindgren wrote:
> * Takashi Iwai <tiwai@suse.de> [190809 08:24]:

> > ... and it was already fixed in the later commit 0e36f36b04e7
> > "ASoC: soc-core: fix module_put() warning in soc_cleanup_component".

> Mark, looks like this commit is still not in Linux next, forgot
> to push out something?

There's a build failure the Intel guys haven't fixed.

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1Snw8ACgkQJNaLcl1U
h9DF/Qf/WDdJEsNmRPfcsZFd9wcH/l/YYYCUVgA62rjOVqjdmJimIzjWXlc+W4xw
CZk3JtYhXgKz31j0/toBAkOS8bbArTQtWi5+40EuzExrZKV/MYBA2dlSSYKazuQO
bDQBxTg5kKAafEyViBEVMxCey+ubNGO4Ms69de/KW1lmZeEqtfSHPzOjWgrEI+H9
1xjLx4KVTDk2o3TaSc0iKj7MNCKJy0nBW/VnW8RxJiOnKu+kO2G4lBpCu+/0afjm
f+oufYCVjGXJKKv5SBsfB30/c11H+PindiU1ECSY5mn0YytmPY+cC2d00aE20GXY
v3jxVVy7d8M5zo4qooHjGF84oeCX7w==
=XIoR
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--

--===============3878980137807100351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3878980137807100351==--
