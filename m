Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A5BF1B09
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 17:19:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A55EA16AA;
	Wed,  6 Nov 2019 17:18:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A55EA16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573057175;
	bh=EoT5pAs9uTcVRqKJe/7ulI3HDaznnoAkLH6fH4nIPiU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AJVgYfa1PKDfjn6ZXBAdcGklgCYeAac5yUpXvK35NxYhgYXeivr4fjokZKCE+XRzJ
	 p4IG46omeK+3u/SpNQepm8MyAYN5uDul//WGpQ2bPifx+naY2ZGsjMOKbTpfDnKVEo
	 HqyvMknFTKffGH3XTCQMCDcM72cnaLffVDE1++to=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EE36F803F4;
	Wed,  6 Nov 2019 17:17:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1954AF803D0; Wed,  6 Nov 2019 17:17:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60C7EF800F3
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 17:17:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60C7EF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ojXMQ6xa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fz+idqcv18pmIfwgsT5BGEuhP72lplSqQsRt41wSOiI=; b=ojXMQ6xamE0y7R3+prR1sZKNs
 QI6bzkwy3IL6swjWEEhzhPrz85txMWqHFpEwtI6v43KQYXGFciO28ZG/Hh4e2YvUdCBJnr5ks8Gh+
 latj2XPFHHV/RgNmruJUDQSY7HUrtzEPYAlq7EhdzNuqcCbxnhYXrgHoYTX/LKInEfOXg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iSO08-0001oO-LK; Wed, 06 Nov 2019 16:17:44 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2E19C2743035; Wed,  6 Nov 2019 16:17:44 +0000 (GMT)
Date: Wed, 6 Nov 2019 16:17:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20191106161744.GB11849@sirena.co.uk>
References: <1573137364-5592-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1573137364-5592-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
In-Reply-To: <1573137364-5592-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Cookie: Shah, shah!  Ayatollah you so!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Sanju R Mehta <sanju.mehta@amd.com>,
 djkurtz@google.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, Colin Ian King <colin.king@canonical.com>,
 Akshu.Agrawal@amd.com, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [RESEND PATCH v2 1/7] ASoC: amd: Create multiple
 I2S platform device endpoints
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
Content-Type: multipart/mixed; boundary="===============2318026769186161222=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2318026769186161222==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 07, 2019 at 08:05:58PM +0530, Ravulapati Vishnu vardhan rao wrote:

Something is still up with the clock configuration on your system, this
claims you're sending this tomorrow.

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3C8icACgkQJNaLcl1U
h9AWAAf/c3futrq+tAcyQ5tc5iLHHRmfkzlISVSWO5JMxlRJlKhuaTSBGNRT8niC
Kdii0aRuPoeCzn3BklTilvCRdeuw/sjYp/5REaIRDCljVBI3gMp+hAtal99wnFnf
2bjvYqSZaHeOW7Gb26u1ETuI8NpQOxEHxQTNR2K5OyNwWwthMolB2uU1B4KldE3I
9sz1kOrj5GJwVMadWFOyQaaI0lczuzadpHBoHeZjpmivqX0MQ8Cb/KDgCpu7Jh7u
o+4twWNqdZCP0IWrrtdmJRmzSirXwBoK4QYm3nJBRY7J9yWOPbxkHVdPO6C0EKDd
nXe4/gIbzyux9sRR2So8u0wat1yQeA==
=skY3
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--

--===============2318026769186161222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2318026769186161222==--
