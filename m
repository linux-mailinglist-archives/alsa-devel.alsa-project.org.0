Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC14E78CB
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 19:53:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF38920C6;
	Mon, 28 Oct 2019 19:52:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF38920C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572288786;
	bh=TTICG4bXBxhKTtbAsmykC45hEo7z6ghUN3NOuIuKwrw=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BYIdANhGSd2GxBOB0Hqw8Yh3pUwZITOkhIiBBdB3DUt5ZsNyagZJW68GmOXjhFD+e
	 u1534dCfZKs5CF4AR1VeX+vd/zQ37OeSitgU9w985mP4gs5RCmBCoHf3tRo7kvkNBJ
	 VVeDttLb28IHeiUNW9dRmNjPZka212rjCj2Kay0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BB1EF802BD;
	Mon, 28 Oct 2019 19:51:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 488ABF80361; Mon, 28 Oct 2019 19:51:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4ADBAF80145
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 19:51:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ADBAF80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="B9Ch+rhX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uvlr1YBGaWlMxUPE+pps1Gq8AArAoEsvJG3X9s5ZoDQ=; b=B9Ch+rhXUTmUc4kmshSD8B0yg
 TIO+ay4bW5v8taT+kVCACYmfGNkp2dc0vgcNvzB4exMdUTX/XiPUd71YtVRvyK/AjO6xka94oeWgp
 cs62AdnKi273JNsXr6JZlTxcsITRUvM5SC64p/vQRKzlK/zLallyWx/okLNGMY4V7SuoM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iPA6l-0000Qf-Bj; Mon, 28 Oct 2019 18:51:15 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id AF69727403EE; Mon, 28 Oct 2019 18:51:12 +0000 (GMT)
Date: Mon, 28 Oct 2019 18:51:12 +0000
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org
Message-ID: <20191028185112.GA22457@sirena.co.uk>
MIME-Version: 1.0
X-Cookie: 1 + 1 = 3, for large values of 1.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Daniel Baluta <daniel.baluta@gmail.com>, Takashi Iwai <tiwai@suse.de>,
 Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [ANNOUNCE] Draft schedule for 2019 Linux Audio
	miniconference
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
Content-Type: multipart/mixed; boundary="===============2759508554424645924=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2759508554424645924==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

As in previous years we're going to have an audio miniconference so we can
get together and talk through issues, especially design decisions, face to
face.  This year's event will be held on October 31st in Lyon, France,
the day after ELC-E.  This will be held at the Lyon Convention Center (the
ELC-E venue) and will be free of charge to attend, generously
sponsored by Intel.

The agenda is looking pretty full now, what we've got so far is:

 - Use case management enhancements (Curtis)
 - DSP framework integration (Liam)
  - SOF integration with ACPI and DT (Daniel)
  - SOF support for non-modular drivers (Daniel)
  - Gapless compressed playback (Patrick)
 - Soundwire status (Liam?)
  - Multi-CPU support
  - Mixing with HDA/I2S in a single system
 - PCM issues (Patrick)
  - PCM device volume control
  - Attaching timestamps to buffers
 - Virtualization (Liam)
 - User experiences (Jerome)
 - Unified graph (Patrick)
 - Componentisation status/plans (Me)
=20
If you're planning to attend please fill out the form here:

    https://docs.google.com/forms/d/e/1FAIpQLSd6FV-tWYZ1fHlCmyzQhG98OtYH9W9=
GX-1dQ88mnLxVRGyPww/viewform?usp=3Dsf_link

This event will be covered by the same code of conduct as ELC-E.

Thanks again to Intel for supporting this event.

Thanks,
Mark

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl23OJ8ACgkQJNaLcl1U
h9BLegf/a/NKQxIX2g3duoA1ID3qPKU4/tQ3YyRTCzRy2chNk9y70JfwzTfOLmnO
yWZGV0m53Z4tWZxQ/kTH3npGCX/NMymRCh4TT6ydUrt0l+55bR9+ZA4lKYKxLJiS
4/P4mTgSi2wviwk+xXksznXRz1cE6Xk75F0mVkFO+wbtxI3U33fTkN1mS3aJsUPW
DCz32xMDG3vspwOtatdxBAPw/6lzNYuaW4MRz2YwFwXLQtNOAiCI9WyQGCmutuOZ
PEbIA/+VyUkOBC5cNFLZlq1DbFtqpbeBv93HqDZIQzn9GSSo3WaVIuKZOy/z6D4Y
zj0nAf0cVioMN1j5Bm50nAoUYHZlXA==
=Lmu/
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--

--===============2759508554424645924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2759508554424645924==--
