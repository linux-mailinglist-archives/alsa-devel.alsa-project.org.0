Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B078369F
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 18:24:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2A57852;
	Tue,  6 Aug 2019 18:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2A57852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565108690;
	bh=iVKlIm7qI8fJO5I+Kz+4g3KyAbu835PKhaQaD7S3T+o=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oaOGnIki0qMxTDKWYBWHmJJ+8PlpRJjBbUi5NzEl4HoyUWqpb39UHKRAimXL1RYNt
	 CNHvZZn12KmFGierMaF5/aVBmtNbm+utpCGPkg90JbsZPp7ch63UDZF3ULSbZuQz+2
	 j0gWxJ6SB4vLJ4aC49lj/yQHELcg1iCHaFzFPe+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CA06F800F4;
	Tue,  6 Aug 2019 18:23:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1082BF800F4; Tue,  6 Aug 2019 18:23:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DF7CF800F4
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 18:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DF7CF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="wQpz+8Sn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PHBgZOImiifU3E3TgoGxSahO4SO99w3yxl5NV5tu52Y=; b=wQpz+8SnmtOtHxBBH84yp4qbn
 lrBVdF0k/imYNHpdaU3d2P0G9nQ23kc3Qb3I7YvayU2pYMmfH77MJLshYdVLKTzqzop573lGDZ15H
 WKj9SBX5gVYi3JGTGKDOIrrbh510PBu1Mdz1yhD0iLOQeyZulRn4Dn/dv71J3h2/p5fqc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hv2El-00056f-Ib; Tue, 06 Aug 2019 16:22:59 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4B58B2742B67; Tue,  6 Aug 2019 17:22:58 +0100 (BST)
Date: Tue, 6 Aug 2019 17:22:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190806162258.GD4527@sirena.org.uk>
References: <871rxz3x7e.wl-kuninori.morimoto.gx@renesas.com>
 <87y3072iib.wl-kuninori.morimoto.gx@renesas.com>
 <f7a47bad-b680-cbd2-2341-7be081ac4b2c@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <f7a47bad-b680-cbd2-2341-7be081ac4b2c@linux.intel.com>
X-Cookie: All men have the right to wait in line.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH 02/28] ASoC: soc-core: set
 component->debugfs_root NULL
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
Content-Type: multipart/mixed; boundary="===============4742733529560076660=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4742733529560076660==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZJcv+A0YCCLh2VIg"
Content-Disposition: inline


--ZJcv+A0YCCLh2VIg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 06, 2019 at 09:49:20AM -0500, Pierre-Louis Bossart wrote:
> >   {
> > +	if (!component->debugfs_root)
> > +		return;

> that test is redundant, it's safe to call debugfs_remove_recursive() without
> checking the argument (done internally).

It's not completely redundant...

> >   	debugfs_remove_recursive(component->debugfs_root);
> > +	component->debugfs_root = NULL;
> >   }

...with this, the two in combination add protection against a double
free.  Not 100% sure it's worth it but I queued the patch since I
couldn't strongly convince myself it's a bad idea.

--ZJcv+A0YCCLh2VIg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1JqWEACgkQJNaLcl1U
h9A+9wf/ZveJix8ujFRvHR9XpYhqJK4aWlzU/QZ1KUPttRWCeGwQhSoda9nhlQut
t3oqq45QS8+bHRegkGLIfjJCU2gFaNweI/xvIvjozDrMB/fua+m4H0VMlWR+Paox
3OcgALUw5fU1bM1sWb6J7CVehXHurzV6sIF3oYmHV59hoWSDDBByHoT9m7JO1r4c
C4qoCurLKl29qB/JhRUJpYe90kulhxC7BQjRcYrI2LLmOpiVG0zO3BgN1NA/e2ht
I38Fe5XlC7MS3SSbe3deezK9/1B1wgANOX/hj+MGkwcuhHdlwFpgSjVjEYR5D+KO
Soz/Oy7jwCgX0PPAr6zY79imbjs5ig==
=z0Wv
-----END PGP SIGNATURE-----

--ZJcv+A0YCCLh2VIg--

--===============4742733529560076660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4742733529560076660==--
