Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 285BD174F9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:21:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B8FE1A9A;
	Wed,  8 May 2019 11:20:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B8FE1A9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557307305;
	bh=4rZqaW16QK7PL0Ao04K9i/8Ag9wg0/2NeWxLiuahVUU=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gx6P+Z8QNrg6ru2WeDllz+JQjiX1bcCoMM14SOuaCg3ywZHZGve2Lz2Z3Gzqzuz8X
	 DziBbKHyr7vT52kZZtNw++RO5rZFeL/2gKdYce8vnc9qjFHJgCIT9gPzHxNfpBGPFZ
	 QpldyOYYoq9nys63Y0snKGa/bFyQCzyEEGUvQfV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8442EF896FF;
	Wed,  8 May 2019 11:20:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 123B3F896F0; Wed,  8 May 2019 11:19:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E609F8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E609F8075E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="B5DvYwz4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hfjq2hpZj4xhJ2OEmN8CL7UOKbY/93dEo7VhjtVZWJg=; b=B5DvYwz4tHm0Ozcr1FzlSumkv
 m9tH8to3SEpA0gMVMWmAKhhyYoZdj4B+1IoimCPsHuYrUXirTGOxXYfm05fn/qR6f5swPL1EJRAbD
 s3LPw76Hlok06AYriHE1U2pTB5WuMtPHFv54ip7zIroFYh+SubsfVHVUJnnBh+/Gqd0dQ=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOIjw-0007iv-Iw; Wed, 08 May 2019 09:19:55 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 537B7440010; Wed,  8 May 2019 10:19:46 +0100 (BST)
Date: Wed, 8 May 2019 18:19:46 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190508091946.GI14916@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [GIT PULL] ASoC fixes for v5.2
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
Content-Type: multipart/mixed; boundary="===============2978147015738684841=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2978147015738684841==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gjqXxLgfq8Ns5vfG"
Content-Disposition: inline


--gjqXxLgfq8Ns5vfG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit ce38a75089f70f6380fc63a5478a7659b4eb3f47:

  ASoC: SOF: core: fix undefined nocodec reference (2019-05-08 15:42:00 +0900)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.2-3

for you to fetch changes up to ecc425f06c19a296622c827cde54735ebc5320b8:

  spi: rockchip: turn down tx dma bursts (2019-05-08 18:04:32 +0900)

----------------------------------------------------------------
ASoC: Even more fixes

Yet more stuff that came in through the day.

----------------------------------------------------------------
Emil Renner Berthing (1):
      spi: rockchip: turn down tx dma bursts

Libin Yang (1):
      ASoC: codec: hdac_hdmi: no checking monitor in hw_params

Olivier Moysan (1):
      ASoC: stm32: i2s: update pcm hardware constraints

Tzung-Bi Shih (3):
      ASoC: mediatek: mt6358: initialize setting when ramping volume
      ASoC: mediatek: mt6358: save output volume for mixer controls
      ASoC: mediatek: mt6358: save PGA for mixer control

 drivers/spi/spi-rockchip.c   |   4 +-
 sound/soc/codecs/hdac_hdmi.c |  13 -----
 sound/soc/codecs/mt6358.c    | 131 +++++++++++++++++++++++++++----------------
 sound/soc/stm/stm32_i2s.c    |   3 +-
 4 files changed, 87 insertions(+), 64 deletions(-)

--gjqXxLgfq8Ns5vfG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSnzEACgkQJNaLcl1U
h9DH4wgAhdeod7OXekmNgY3OgUBvvsb4bbxYbIF1BkO+EvHh02xhovE+egkYXfWe
EIqP9wwizi8XX90aG3AroeQe6ZICNhAdq9Ns09fVIOWW/xNyOq2UtJiAWF9qy3y3
7yJp5rMmoDSDgGgLO424XkoZ/R/HuMLmvFO4M3ICDjdBIwg7CjFFCm3YO831EXn4
vuKYYlwPkYQWDYRpQmFIZGCSlhBzaWlGU9x2uNIqscfZQ9p6yY+PGzw8r72SAmkQ
zTEH8MXBwLtr3oA0r20VVOaU+e8JBJEj65CMiXqiYWh/y3ce3ks9vSr9e7pP/UTu
YDpJ7vIjM1jioaovv6Z+5fbsLYYCSQ==
=vz6A
-----END PGP SIGNATURE-----

--gjqXxLgfq8Ns5vfG--

--===============2978147015738684841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2978147015738684841==--
