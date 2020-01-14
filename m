Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B906513ACA4
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 15:51:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A0BE1943;
	Tue, 14 Jan 2020 15:50:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A0BE1943
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579013501;
	bh=PT0xvoQGiNtYN5L7b2uZ0uBR7/Jqg3YftlrZyk+K2Wc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p6r1NI9JzWs7JUXWnSrLQ4rShRV+int7znVqEMlt54hVCbGBG5SE+oo+PQLA8xvLZ
	 NFfLTcK/Uh+ZEF7mYD73qClK9vWAK099QQo9iV8dComhGFxwanLWVSPG7T09uou0jf
	 w/P0PALUsUMHkNHG5PttbarnzoO7OCYID1g0K1Yo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BC85F800B9;
	Tue, 14 Jan 2020 15:49:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8CFBF8014E; Tue, 14 Jan 2020 15:49:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45561F80121
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 15:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45561F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="amMLuROl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6nJUJhhumQt0VjlRrHEVPz0UIG6WR97W9B6Dcn2o5bo=; b=amMLuROlHT/tLBsR+5kwzWHb7
 naLAfg3uDbdvdIcSpnBKTj9lHHnRZCrjQukY2soUdDUpHasEnZRnagbYgTHyiHQlKJeHF//0nrZFK
 WLr+qr0loLSfVMA5aBNaftPEU3fCh1PvgjHcwFkbtPPYOHhak//E+0XGT2DyOyHtjc3GM=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irNVp-0008Pd-SH; Tue, 14 Jan 2020 14:49:45 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 32656D01965; Tue, 14 Jan 2020 14:49:45 +0000 (GMT)
Date: Tue, 14 Jan 2020 14:49:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200114144945.GU3897@sirena.org.uk>
References: <1578968526-13191-1-git-send-email-richtek.jeff.chang@gmail.com>
 <s5htv4yfpnt.wl-tiwai@suse.de>
 <36357249c6ed4a989cd11535fdefef6e@ex1.rt.l>
 <s5hwo9uqrbu.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hwo9uqrbu.wl-tiwai@suse.de>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Jeff Chang <richtek.jeff.chang@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 jeff_chang <jeff_chang@richtek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v6] ASoC: Add MediaTek MT6660 Speaker Amp
	Driver
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
Content-Type: multipart/mixed; boundary="===============8734989415564864318=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8734989415564864318==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/7+LvQqw8N5lf/3J"
Content-Disposition: inline


--/7+LvQqw8N5lf/3J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 14, 2020 at 11:12:53AM +0100, Takashi Iwai wrote:

> So, for the codec, it doesn't matter at all about the signedness and
> the alingment of 32bit / 24bit of the incoming signals, but magically
> handled as is?  Interesting...

On the playback side CODECs sometimes don't care that much, they
clock data in and if it stops early they just go on to the next
sample with the width being used to configure filters or
something.

The signedness is a bit more surprising I have to say :/

--/7+LvQqw8N5lf/3J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4d1PgACgkQJNaLcl1U
h9D7qgf+KdBUSPJ38rdTjpyt2K7lYvMyXL5+ZUVws3WSh8Mf6NKFkc2TRAtLJLMm
cqQxLWHy6m4R7X+tZtn2iwoi5f+RDi8uYHOcvSfU9qoI5KQeCgHQjXwaU6tnx7fx
UeeJ0kwtqgsO3xcGpn6DUjoujSvxI9dyr83h0MS3EhX216xvzEDBgF/ujsbnYfCj
ukYd9ZB/jD9aFtelkTHgJh6zeKPkcLTLhBB+/i3AalSM+yBR2eLgXkVUGBB7pPMD
k4LL/2R2f91ziU7J/6NgZuO+X6RzXAmYNDs2nH28v9sQotj1KTXXFl3/t5L42zm7
3XPg4S+5Q5SefOGfY4kvylDWjank2A==
=ff88
-----END PGP SIGNATURE-----

--/7+LvQqw8N5lf/3J--

--===============8734989415564864318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8734989415564864318==--
