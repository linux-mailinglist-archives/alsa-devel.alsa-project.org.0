Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36184BD2B2
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 21:32:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5F3F16B4;
	Tue, 24 Sep 2019 21:32:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5F3F16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569353574;
	bh=TaEdQzweMR5Z8GQ5v5gZs+c45bcRpRQ5MSlzGHjFQRs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lf0igFj3OD+VGgCUlmUOymtNvYIQi0R6EeLHiG/BOxFKhHqewG9RArBQ//9M3tJ77
	 VHAN8aZY1tNhPw1EVVkmr/dara6p16RlLs2b3nmutW33jPafYGAv4/+DSeAxpGvky5
	 SUv+kFEFcO/unr/LHU7/mdm6eC2BD4/ySVKqyoh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43AD1F803F4;
	Tue, 24 Sep 2019 21:31:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EF1CF8045F; Tue, 24 Sep 2019 21:31:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A163F802BD
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 21:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A163F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KjCjr+W9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DrBtTxxkLszFiuHPo7GDHoCKEnvcTR1rRDeCm07fFwE=; b=KjCjr+W9bc+b1TSG9fy1bf91z
 zqxP9M6Vy/ZZQJhZjSX1gNaDvfT31TxBxr3GA5zPLgMPNNqN1LJknyITCu/qcnS4bOFkeFNYtF4Hh
 ZQhDnnritbGqx81UA2wz4+rQ2sIz7ZuRjH2HKNxESYQH4R+8DXN9TqwILBSSchV++BKN0=;
Received: from [12.157.10.118] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iCqWd-0002zm-6M; Tue, 24 Sep 2019 19:31:03 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 639B5D02FC7; Tue, 24 Sep 2019 20:31:01 +0100 (BST)
Date: Tue, 24 Sep 2019 12:31:01 -0700
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20190924193101.GD2036@sirena.org.uk>
References: <d828cf2f-03e2-5609-9561-54b1ad301a62@perex.cz>
MIME-Version: 1.0
In-Reply-To: <d828cf2f-03e2-5609-9561-54b1ad301a62@perex.cz>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] alsa-ucm-conf repository - initial import
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
Content-Type: multipart/mixed; boundary="===============7429209656243163319=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7429209656243163319==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4kYG1Ol6LYbfFhUk"
Content-Disposition: inline


--4kYG1Ol6LYbfFhUk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2019 at 02:45:31PM +0200, Jaroslav Kysela wrote:

>   The question is, if we need automake/autoconf tools to package those files.
> It seems to me that it might be clever to keep this ASIS for now.
> Users/packagers can just do 'cp' to the appropriate directory.

I guess the only advantage would be that it'd tell people what
the expected directory was but otherwise yeah, I don't see a
pressing need to have the makefiles and whatnot.

--4kYG1Ol6LYbfFhUk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2KbvEACgkQJNaLcl1U
h9BkMAf+M+h8lOdzZpIFUtqMhkUwQgfRVhYnhlWfXNVkMjZgxTyRCdlINgGSRsEG
FgFUgFHZ97kqmP9Ib1+T8W1+KbCh7RhCsIuzD8BntxxwpE76ExLOL7BCuM0WF3iw
YwTXr2A5vaWm9PooQAx8HIxfg3hEQkoJb6jDVZ4bLCNmAfdX12XWvaWUI/yBkFcd
MSueu8hfuAwwTpXELreKKJsLYZeHCp5hVvDVeH1rH5+9BMOC+spz7Mgy1upt06/R
GVTBARly/UYCkXJDTC/FdCQnU2f+jC8PUj6/x9b42vBdg7QuBZrs0qhh3K6gSuGx
OIxnb02IOxh1LNbaW7Br0w2pJ1yKaw==
=pu7O
-----END PGP SIGNATURE-----

--4kYG1Ol6LYbfFhUk--

--===============7429209656243163319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7429209656243163319==--
