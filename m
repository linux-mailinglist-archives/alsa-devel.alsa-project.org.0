Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 663607343B
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 18:52:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD50E1A93;
	Wed, 24 Jul 2019 18:51:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD50E1A93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563987148;
	bh=9bBqdNCGl/NFZV/FUg1Yurw/f7J0iYeQwO+lptBPDGk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G3xWoSwchiS/uG6OC/k1TsOyTLrxCOMJNBloIRSfxz6pbJ3qJIj5c7dtcECoSPvE7
	 2LzkRuTufxaGcLTNDFocsWHqmxlUg9hYHjYF7OE9Tr1gmxWnJnUhy1oeWO+NRIdy8M
	 AhOl2MKe4oXfNrFD5tol5+LSEBvpQNCSDXkUI2No=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E75FF80368;
	Wed, 24 Jul 2019 18:50:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D3C5F803D1; Wed, 24 Jul 2019 18:50:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B75FF800E3
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 18:50:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B75FF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="aDJlGutE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5yLBkc1wRexrEkgLKwvnQpWRDNe7rLbSmbRGB6nZv30=; b=aDJlGutEBsNWoIjlpE6ZEBjAb
 yvif8uPRUzQPDD3qm9IB2vJz8gN8LiXmosueii85D06+4lKJCbyyf7hvz14dl3oBg/WDVKEOmeuI9
 skKQrA7jQyrh2U1PHMBcfrlI88ZJp+aU+iS5kA6yEbeXrKhhG172kwa7e3cgrky6chSsk=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqKTJ-0008Ab-9F; Wed, 24 Jul 2019 16:50:33 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1EB0E2742B5D; Wed, 24 Jul 2019 17:50:32 +0100 (BST)
Date: Wed, 24 Jul 2019 17:50:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190724165032.GB4524@sirena.org.uk>
References: <20190723145854.8527-1-cezary.rojewski@intel.com>
 <20190723154449.GJ5365@sirena.org.uk>
 <cac0d84e-61d3-5379-cbce-10f8d637310d@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cac0d84e-61d3-5379-cbce-10f8d637310d@linux.intel.com>
X-Cookie: Matrimony is the root of all evil.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.com
Subject: Re: [alsa-devel] [RESEND PATCH v2 0/7] ASoC: Intel: Skylake: Driver
 fundaments overhaul
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
Content-Type: multipart/mixed; boundary="===============2162554400612889834=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2162554400612889834==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 23, 2019 at 01:07:31PM -0500, Pierre-Louis Bossart wrote:

> Overall my recommendations would be to:
> - give Cezary's team the benefit of the doubt for their Skylake reworks, and
> add him as mandatory reviewer for the skylake parts. That doesn't mean
> merging blindly but recognizing that no one else at Intel has a better
> understanding of this code.

This seems like a good idea, Cezary could you send a patch adding
yourself to MAINTAINERS please?

> - draw the line at "no new features" after e.g. 5.5 and "no new platforms
> when SOF provides a solution". SOF was expected to reach feature parity by
> the end of 2019 so it's not a random date I just made up.

Let's review that nearer the time?  I don't want to impose a deadline in
advance and have people needlessly rushing to hit that deadline when
things might wind down themselves naturally.

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl04jFcACgkQJNaLcl1U
h9AQhwf/YeiSNmz8/Pok2f0VH9Pzu8YoGxTj/LTegQwAIr6zYvTxy7a8p3xGKjT1
eU/p/uIK2OATqVUMQQvDFdUiiMaN5/j2Arfid1jeOJVwVmhP4N4420J0adkFWdLd
OHX8ObPVQGXFttbEz2fk/FmD14N61qxY8wcUUf9zQfbz5a+9iQINe3QFjAdly8NP
QBkgiE4rqmsxOd/JLrU/GNApjkDG1YZzaKXdXVX4zRYvhMFLhWCZRljfvlPuyn5u
D0cFzmlW2gRjDspaocTFWzMz5N03vAOXff6cdA05bUKdvJnDAjhJCot0NEe6RtLm
uvU4Szdw2NYWjrzTPzz4qEVrYiRgWQ==
=Oz1G
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--

--===============2162554400612889834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2162554400612889834==--
