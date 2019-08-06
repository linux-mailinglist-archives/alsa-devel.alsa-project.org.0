Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B79C8386D
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 20:09:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1236F15F2;
	Tue,  6 Aug 2019 20:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1236F15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565114943;
	bh=3vnelmEMJz0BNLCEFKB3g6hP+3I5iYDhcXM0Q/NB2KY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h/1DL+Y3K9z/IbaH8ZE1IBzPoFfoNEUJMtgq3E5KhNVgSVCbkO+mLVgFbMJclO628
	 H9aB0jAgvAbrM/Imshcb40cgKGcaxUY58v2YdGXh++N1y3L0NhFml7Fv0kKydHKZS8
	 GlAzzvaSsXQkRfwhclvFVMD8R4UHCYGFWTWviUgE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 350A4F80290;
	Tue,  6 Aug 2019 20:07:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9131AF80483; Tue,  6 Aug 2019 20:07:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CAFEF800F3
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 20:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CAFEF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sjBcKqRv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bMExUEarcFRV8p4k4HWERXNtn0fEgeGffsRxj2dsHWQ=; b=sjBcKqRvGY3bztQNmzX2mFNwf
 hjH0VGp8hZTM4HPIJbIp8YqAU5qA4m3SBpfcWaBUqofuGKkyJC08wCSIhYPwk5m6S3k5518sO0X8u
 ek/TXFZaHL7dZNSpfzt0k+BLPEgkgbnbMnFJgcf6oJ0IEh/+U4EQpXSKqDBvowRcAF7VY=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hv3rc-0005LF-AR; Tue, 06 Aug 2019 18:07:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9C9D12742BDD; Tue,  6 Aug 2019 19:07:10 +0100 (BST)
Date: Tue, 6 Aug 2019 19:07:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Message-ID: <20190806180710.GF4527@sirena.org.uk>
References: <871rxz3x7e.wl-kuninori.morimoto.gx@renesas.com>
 <87r25z2ihd.wl-kuninori.morimoto.gx@renesas.com>
 <203f012de6a77b8994060448b30dc795f03a0528.camel@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <203f012de6a77b8994060448b30dc795f03a0528.camel@linux.intel.com>
X-Cookie: All men have the right to wait in line.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH 07/28] ASoC: soc-core: don't check widget
 for snd_soc_dapm_new_controls()
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
Content-Type: multipart/mixed; boundary="===============0577432686455028227=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0577432686455028227==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ls2Gy6y7jbHLe9Od"
Content-Disposition: inline


--Ls2Gy6y7jbHLe9Od
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 05, 2019 at 09:35:58PM -0700, Ranjani Sridharan wrote:
> On Tue, 2019-08-06 at 10:28 +0900, Kuninori Morimoto wrote:

> > -	if (card->dapm_widgets)
> > -		snd_soc_dapm_new_controls(&card->dapm, card-
> > >dapm_widgets,
> > -					  card->num_dapm_widgets);
> > +	snd_soc_dapm_new_controls(&card->dapm, card->dapm_widgets,
> > +				  card->num_dapm_widgets);

> Should the return value be checked here?

Preexisting bug but yes.

--Ls2Gy6y7jbHLe9Od
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1Jwc0ACgkQJNaLcl1U
h9Aj0Qf7BvIDkZATcOjgqjyaHnBkFVcL9CKKmwNmkmyw/daxDGA3IqKGauU4oeM3
WmcKquqdTK9kNcqNeumOvDIcrYxbvM0HzfUKYc8bT++yNBXL0E13yw3HRGBDqBkt
uofcuqrF2ASQxOa/Xlti1CmuS8kMKHKEoSX2/J7d584UjdAV3wn3PNWnoWgpez/O
JXXLLznC1Wown9xQg1oTBT84gHXrm2kV/T+HpDq7YyJL/1yyY54G8wEQLE+uit62
7dHfOPw9P1XRL1DA77m9Oao2XSpaXv5HQjEdZ0B/6+cpE5v1VoPv5rLCfVDcQYoI
rtB1sQ89hlA2mjNHGc/tbp5D2pn/LA==
=6dh/
-----END PGP SIGNATURE-----

--Ls2Gy6y7jbHLe9Od--

--===============0577432686455028227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0577432686455028227==--
