Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FAB1752E
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:34:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE220193E;
	Wed,  8 May 2019 11:33:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE220193E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557308087;
	bh=z8gntPUtQOARgY9sG7xSTShaOeepgzzZ2ruZvxckI28=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e6WaP6wCHaRCRMap1EC6/m1v9GCK+w/a8XNSX4jvO794gILd5OlHQuqqWGaXmPXWj
	 mBuKx5XwF2VYYVQbtp0nW3LE6MQgZDP8Qjf9o4Y+3xeNsS4m2zYljQry9S7WcyxCsT
	 0aU4ZAfRJ6omv7B7Uv5EFC7ZZeCgU0ELdXHhKwOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E9A2F896FD;
	Wed,  8 May 2019 11:33:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4010F896F0; Wed,  8 May 2019 11:33:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B342BF8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:32:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B342BF8075E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="EjoEQkAC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iThJPXrQYhIEY95HLT+2nVCk5Gqi1ZIMZ0rS6uVCVPA=; b=EjoEQkACs+obmTG2IfG4/hQVb
 rqWPpWFGElMt4CkaqoaObSQVM62MOUXFb6qenlMpOpkkSGk7B2RGfvlOCxsCa01fQ4jbVMcT5DnQB
 gR/thoosEaNvHm77Ff0/yWb46noU68FecaRUenH8HlezZfKI6X8uhxypWqvwXNdzGeGiA=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOIwa-0007ki-NU; Wed, 08 May 2019 09:32:57 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 8A80E44000C; Wed,  8 May 2019 10:32:49 +0100 (BST)
Date: Wed, 8 May 2019 18:32:49 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190508093249.GJ14916@sirena.org.uk>
References: <20190508085037.24773-1-tiwai@suse.de>
 <s5h8svhnx96.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5h8svhnx96.wl-tiwai@suse.de>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] Fwd: [PATCH] ASoC: SOF: Fix unused variable
	warnings
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
Content-Type: multipart/mixed; boundary="===============5229437032674527676=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5229437032674527676==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dOlf0zsnhJ4/ZPgF"
Content-Disposition: inline


--dOlf0zsnhJ4/ZPgF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 08, 2019 at 10:52:53AM +0200, Takashi Iwai wrote:
> Oops, forgot to add to Cc to alsa-devel ML.
> Forwarding now.

Forwarding stuff doesn't work with patchwork or with git am and with my
scripts using patchwork if things don't hit the list they get delayed by
several days :/

--dOlf0zsnhJ4/ZPgF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSokAACgkQJNaLcl1U
h9Colgf/XcQx66qzCVivhIGQjMbsRVyYaD294YWhCk+qbS1jckOqrqcLMmn2A31K
cMZ6szDRR126ka5fWALcPLxCyHRskoWCBWbv2tSZncDe0EBcDFopK13ks02nj65c
agBQVgJONq6xm/jmnEumrVdYJLKcx+C1OfFRh+gh28AF7UnIefO7HGlVHIZtOjAA
GWJhXh7ANn23CFcvnN3r6eErHwKjupMfsJ6VjTOB+cO44LrreMYlwE4lTgWu5QFR
UHvkrkxklY0LiQLZHzRSod53PtJxdvIkDi83GngaQ0lX5Jp9UdB+ohbi2JDa2yiK
u0jh6ttjcOkGmY5sdc5DvziUdqAdzQ==
=XqbL
-----END PGP SIGNATURE-----

--dOlf0zsnhJ4/ZPgF--

--===============5229437032674527676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5229437032674527676==--
