Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 716AC2FFD8
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 18:03:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAA671667;
	Thu, 30 May 2019 18:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAA671667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559232180;
	bh=mV/LtgmOG4fR90+huhxKNZBv/LGhtkCT/z95YbjP0HU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hpRYdkOHVlOzxj1XAb0wvQuvEpmf5/7LHtG/thgriU/61gdv2e2EzVsUIMs8Bx0xR
	 kG3xiqsrXil49fY6ygoYQn5YgT6kAVKYGCXyujABsiynDLsHn8P23EFOi2q1OORZq9
	 /jo6srf3VO319wzCBZOKEL6BQES5FAZMACzn/L8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31328F8072E;
	Thu, 30 May 2019 18:01:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21A57F896F8; Thu, 30 May 2019 18:01:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E77AF8072E
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 18:01:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E77AF8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="cdCmRmdS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3AgLvFFPVCY5eGzzBkz1roLmxH2e7oZrCgiDzCAcCUQ=; b=cdCmRmdS36vnnRstytPQWmZXi
 Gw25YUFt2VB73budqhCNwAT8U/bsbkrJeOUE4B/Vni0SnemjNc4G7z2nRCV/Aslr760trB7c8pEcO
 dYE/7KVQSncTQZxjNrtpatqCBeeLr99HNTDi721N7Y4HzrBluGdC9UbzYFHK1DHykNawo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hWNUH-0007D4-SC; Thu, 30 May 2019 16:01:05 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 1EE72440046; Thu, 30 May 2019 17:01:05 +0100 (BST)
Date: Thu, 30 May 2019 17:01:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20190530160104.GT2456@sirena.org.uk>
References: <20190528200206.2793-1-perex@perex.cz>
MIME-Version: 1.0
In-Reply-To: <20190528200206.2793-1-perex@perex.cz>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: uapi headers - add missing
 include for stdint.h
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
Content-Type: multipart/mixed; boundary="===============4259184781253772828=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4259184781253772828==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ep5m4srWGXPl6O+g"
Content-Disposition: inline


--Ep5m4srWGXPl6O+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 28, 2019 at 10:02:06PM +0200, Jaroslav Kysela wrote:
> The modified header files depend on types defined in <stdint.h>.

This doesn't apply against current code, please check and resend.

--Ep5m4srWGXPl6O+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzv/kAACgkQJNaLcl1U
h9Chzgf45u8mFRSS2x91VfzxXpKA182jYEMSNfLkABrgLvzgyJqXGiO/32nNdEOe
LMhpwVDUdsw15uFPRaGDpbwZKFRaMgnqDhNyDxrmOFCuKdBGXoxiTkIs/oBKZXM3
zRyJ7ROQrFYYL0PY/zhuQ2ws+VifNYKMC/kIp0mIg4p6fVCCyK/QqlirvkYt61iE
VAE3Z5figOtl1+rcSuMC7anbpzKTRQ2WEN2Keruk9pNpSYA3aXY9voLzXMctNNt0
q4Fbn3oPDxyuuOZ4WCGdBs7hvrExU5nv5cpfgFZM9TLDHenVy6kjgSGdd45xwBOm
O7v2y0LeCmMiDjNBHylSX+KEmwYM
=H0Gd
-----END PGP SIGNATURE-----

--Ep5m4srWGXPl6O+g--

--===============4259184781253772828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4259184781253772828==--
