Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9568E9B70
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 13:23:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27B2B2308;
	Wed, 30 Oct 2019 13:22:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27B2B2308
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572438199;
	bh=sAqroiQgd3nda1a20v2r9UhgWL663N61RU9x5GWBs3E=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bRkfEcHjYykoO02ExyWyXX+NKm/1/XOu6JHM7SRXSdjIFlADWJG12Sfp/HuzWU3JH
	 8Z8PHvCxWPRRjguPtcv0S+lfFzt0sReaqzO7CqV34JIzaIhUHdYnaJ4gTTV7Fi5ov5
	 vVfDwiGvo1+j3dqGzsIqqiz2G/WnS49hL7uNtt/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96383F8044A;
	Wed, 30 Oct 2019 13:21:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53469F80361; Wed, 30 Oct 2019 13:21:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 374A0F802A0
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 13:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 374A0F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="usqaic5L"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=48voixcHnRdFxNC3czopNEeKps1EW3SSA2ugEojtyEY=; b=usqaic5Lktt1REEhklUHrTpgq
 UVH8bez+u5tlEMfB96K5klVZ2ncCtsi4DN8zYEu8jqRyjXEiaEhhTMizjL9X2DSTJfh8gji7pslS/
 ZvauJ5KtuFx6Czmy3OvLCEQELrqDO1J0CrPBwnmAFAeRLZ2jkmoNSpVrHYYwY0vHP/vH8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iPmyb-0004ui-LW; Wed, 30 Oct 2019 12:21:25 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D8E4327420F4; Wed, 30 Oct 2019 12:21:24 +0000 (GMT)
Date: Wed, 30 Oct 2019 12:21:24 +0000
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org
Message-ID: <20191030122124.GA7218@sirena.co.uk>
MIME-Version: 1.0
X-Cookie: Celebrity voices impersonated.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Daniel Baluta <daniel.baluta@gmail.com>, Takashi Iwai <tiwai@suse.de>,
 Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [ANNOUNCE] Schedule for 2019 Linux Audio miniconference
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
Content-Type: multipart/mixed; boundary="===============3392840563375146194=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3392840563375146194==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline


--LZvS9be/3tNcYl/X
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

The plan is to gather at 9am and start once enough people are there and
ready.  I look forward to seeing you all tomorrow!
=20
The agenda is looking pretty full now, what we've got so far is:

 - Introductions (me)
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
  - kcontrol issues (Takashi)
   - Standardization
   - Confirmance testing
  - Virtualization (Liam)
  - User experiences (Jerome)
  - Unified graph (Patrick)
  - Componentisation status/plans (Me)

Thanks again to Intel for supporting this event.

Thanks,
Mark

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl25gEQACgkQJNaLcl1U
h9DExgf+OeXwqc+vBgQk8ZqU2cipuYsUMvDu3ChkfGIy+u24lSV6aDNhfJ00csVM
RqT9esLZ15zaS6GM18mOA86/XxaYh+0F0QP/HIgpT1NeKIu+8rLP3/D72LnHHugW
0Ktdv4q5kQVGyF3iuPvNTHp8zC5WHkuoS4xmluWuSkSLScXLLgbAoRQLBDt5RH1c
PbKyL0B/2uyC8flU1Fe1FupsWQcHPZSgOHjYGYazZMvYlV1zm6HcnpnmS5FwxXLs
9SJ8NeLFIA22WeDN/55pLgetD0xkCmB5t6WvmhF6fgtsXt79aNodC7Sz3cINkmkp
cZ4cKqE+E/xn2hS92Z5V0Vh1yiqtvg==
=TbPv
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--

--===============3392840563375146194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3392840563375146194==--
