Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9043871C0E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 17:46:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E27C318CC;
	Tue, 23 Jul 2019 17:45:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E27C318CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563896804;
	bh=EygOllsW6jCvVtvaXis0Gp8Q3HQs6Cs8G9LTMOBCQbU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QAmOcIwmwBDbnxPkG6tqkptCIuw9ZdEMLoB+s2+TKVw1AIrXSPfi4xge8k0euEBWw
	 Cb2g5ltb3NeFumBe1WN6NNdKq4n8YLqVxYrZl7D4Bn+VJZK2vsppx1K5RAtXdblyN4
	 MA+VWK3R3QPdyIDLj83PaYSj3Jtm5z8zCIMIrD9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0077FF80447;
	Tue, 23 Jul 2019 17:44:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45FA4F80447; Tue, 23 Jul 2019 17:44:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDA23F8011C
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 17:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDA23F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="s0GhzVUr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ESE+HvSsu4Wau6TCoUW4UFvzNf1COTouudyjvrmyE1k=; b=s0GhzVUrkt7h7HCehAWEvFnkj
 iJBRal8b16QPmrypkqQ7qJH+3OpVOTfJq/ffLbEj/oQMdeNB86RqKjH465Mjy5M4QRWyZbso9hH4H
 P63fov4lPUwdr/szbIzehdLGKBmUk93XdTmumvifBQDLNVPNciT+sX4R3CwXcvmaojJgk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpwyA-0004BA-G8; Tue, 23 Jul 2019 15:44:50 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 05F6F2742B59; Tue, 23 Jul 2019 16:44:49 +0100 (BST)
Date: Tue, 23 Jul 2019 16:44:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20190723154449.GJ5365@sirena.org.uk>
References: <20190723145854.8527-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190723145854.8527-1-cezary.rojewski@intel.com>
X-Cookie: Avoid contact with eyes.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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
Content-Type: multipart/mixed; boundary="===============6896784038526863184=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6896784038526863184==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yr/DzoowOgTDcSCF"
Content-Disposition: inline


--yr/DzoowOgTDcSCF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 23, 2019 at 04:58:47PM +0200, Cezary Rojewski wrote:
> Skylake driver is divided into two modules:
> - snd_soc_skl
> - snd_soc_skl_ipc

Pierre?

--yr/DzoowOgTDcSCF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl03K3EACgkQJNaLcl1U
h9CdCAf7BKyAUWnPsFPU8GxxuQD5YIx6MRzNOGFZI9/UC8Qag/NTnmxtLCYhzkeR
EkwIeS9yRQhwYWdrLN1omNJs1AdbKH0lPyr/YMuyMewQsdhXrqs/GzvAWuPA/QBO
pDoAH6KrEtAvd4B2pY790b0v4h1Ppq+6O8NA1rdFzqJs98SHvSDAT9QgGHXfAqtP
DAfaUW6g+JAT7vnatJb/Q/SJekm0xWxIOE7yniGiz/M1jCsOGHhC539qRNAwPZU0
IQYPy32tzx528aIFTHcW+65MBKJv6qupLm/IaMLs7CvkQ5dS8DOEREnHEBswYZnU
WQPhwSHvfHJ9B0BI5GnooPv2dg95ug==
=PE1Y
-----END PGP SIGNATURE-----

--yr/DzoowOgTDcSCF--

--===============6896784038526863184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6896784038526863184==--
