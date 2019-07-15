Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB9269B85
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jul 2019 21:37:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AE071669;
	Mon, 15 Jul 2019 21:36:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AE071669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563219462;
	bh=CWn66TrfA7V4IKXDJCP7C2X7eoGVd6bNR9y//WgrY/s=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I21f3vIg3laBg0Wty9RRNOL9yTj/De37ALK4MBoC/gTbbPHXYUxy4/4y6GplurmJQ
	 vo5jo321faVwxPUObFXerNjFP/N2HNOBjAnYC75pj+6pSA8FMSF+GdhsONAIXA/hFN
	 38SxX5Jk+nHTfv54OTnqO6HpO+77RwJ97lpio99M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFDA8F80369;
	Mon, 15 Jul 2019 21:35:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 231F9F80367; Mon, 15 Jul 2019 21:35:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2D76F800C6
 for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2019 21:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2D76F800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="v4cd+jLb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SV+R2p38oTDvSS0utNV8uqhr2tpoddUXXxMNgcMLImI=; b=v4cd+jLbSPmyHauWbwUy501C8
 GABm4Sh6E7PGZjMU7+ePDHiAxSNfsnzFXy9kLGz6RFjsqC9mVjCB7q+AZ4Tul3PDyVB/8SyPMRVdZ
 aEwTpSRrf+mv+kHcHieRYHB8MnUhOhBrGgFWxbmgCZ0cf3XgC3r5lbOm2AlLWZL9BKv4k=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hn6kw-0002Mg-Cl; Mon, 15 Jul 2019 19:35:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 994B12742B39; Mon, 15 Jul 2019 20:35:25 +0100 (BST)
Date: Mon, 15 Jul 2019 20:35:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Message-ID: <20190715193525.GB4503@sirena.org.uk>
References: <20190707235633.7114-1-ranjani.sridharan@linux.intel.com>
 <7fc6fdf3461c8faff4d853f80e282f3830a04724.camel@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <7fc6fdf3461c8faff4d853f80e282f3830a04724.camel@linux.intel.com>
X-Cookie: Fremen add life to spice!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, libin.yang@intel.com, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [RESEND PATCH v2] ASoC: SOF: Intel: hda: Make
 hdac_device device-managed
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
Content-Type: multipart/mixed; boundary="===============1972974111910854007=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1972974111910854007==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Content-Disposition: inline


--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2019 at 08:27:55AM -0700, Ranjani Sridharan wrote:

> This patch is needed for the module load/unload stress tests for the
> Intel platforms with SOF. Could you please help review it?

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0s1XwACgkQJNaLcl1U
h9B2dAf/d81W9qjuyvaXzR/iy0mjye0GkYW5M0RY9uteDwAq4XHwBRSb5rK19z4X
2Q5KMX2a0A+tSR36Pl4pEXnzGN8lWrh/IeSUgdgfi/SV1fXnqaHhFi11Fk8HdtAt
TeX5AtAj9l0c8Sel+H6TcSQGVk6+ucuiz6NZTLPEeyhiLp1N4E1GFPZNjN8Iorop
PzNJz6vKpFlgrGtaw85F52mrq8Q910RJxIJsBGz8LpOkGHRopkVEFJLQ8UZUMoCS
m5x91YrHfuJvZsm9rALHyotlO+5u5B6N+R8cb2vrO9RykNjuwW4tuAFBIHf1Gauc
E8TCkIs0wlUWesoqMfdZX3Q24xw1Ww==
=Vn42
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--

--===============1972974111910854007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1972974111910854007==--
