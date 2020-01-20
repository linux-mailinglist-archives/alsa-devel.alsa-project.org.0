Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6480C1430BB
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 18:19:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD1581672;
	Mon, 20 Jan 2020 18:18:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD1581672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579540753;
	bh=oWlYoNs4NCqUMQ74wvaQsqJdmv+5qcqLNfXENDRKHqg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uFrUhvTHl/37LT0B5SRG4lTkYLc53wO1a0BEyZQ5TZ0E38cgjP+6dZRcjLGGUnt6Y
	 4I3XAluRcH9swHOEIcBp1wGFr7U80xmr3DSwXsaJF3/DkWUXkSWttr/SNiFbeim5q2
	 kFZVsBmXPC0d+e5Vr6n3JdMoyLy+PUErWbG9NM4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3B3FF8020C;
	Mon, 20 Jan 2020 18:17:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35A3EF8020C; Mon, 20 Jan 2020 18:17:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8553EF8013E
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 18:17:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8553EF8013E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FAF531B;
 Mon, 20 Jan 2020 09:17:20 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1CAC3F68E;
 Mon, 20 Jan 2020 09:17:19 -0800 (PST)
Date: Mon, 20 Jan 2020 17:17:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200120171718.GG6852@sirena.org.uk>
References: <20200120160117.29130-1-kai.vehmanen@linux.intel.com>
 <20200120160117.29130-4-kai.vehmanen@linux.intel.com>
 <s5hpnfe2hvb.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hpnfe2hvb.wl-tiwai@suse.de>
X-Cookie: I invented skydiving in 1989!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: cujomalainey@chromium.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 3/3] ALSA: hda/hdmi - add retry logic to
 parse_intel_hdmi()
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
Content-Type: multipart/mixed; boundary="===============3896868306998093797=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3896868306998093797==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eVzOFob/8UvintSX"
Content-Disposition: inline


--eVzOFob/8UvintSX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 20, 2020 at 05:49:12PM +0100, Takashi Iwai wrote:

> It seems that this felt out of Mark's hands, so I picked up now to my
> tree, as this doesn't seem depending on other changes.

He only sent it on Thursday and Pierre hasn't reviewed any of this stuff
yet.

--eVzOFob/8UvintSX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4l4J0ACgkQJNaLcl1U
h9CH1gf/Q4OvsoXDbgZc0zqGShB/Ljgj9ndnQMu/nh/ac6Ny/XYa5Jjh/lZOxkt4
Pz3SqgnjNgiAvPdqh433y0rcxRPlglxl54uRwR+S0jiqLs6LcH+EH0+3F7rf5e82
aXzHCaimZ+EVEVpQh6TOBwVE5xTfmi1Hp7WAGhjV6LFU4DdWLlUatIi2jMWgBqTa
h1Za0TYTPq9uSui4yQVOC7xsn9OFz/LRArE18CfgKFPeG+I3XJZG2J4+kHf7qv0B
DGgQMDse9D6gVUjUb3HvrfM5qOq6KoY6fH+YjHKFfYUyW/zjLOHGVD6ZjVTLTsuy
Mk6Vg1CYD3JbBgmGOvDQyz3GdGU7OQ==
=oo+5
-----END PGP SIGNATURE-----

--eVzOFob/8UvintSX--

--===============3896868306998093797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3896868306998093797==--
