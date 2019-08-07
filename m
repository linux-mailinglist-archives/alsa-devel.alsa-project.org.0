Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6652384D00
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 15:30:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E810484F;
	Wed,  7 Aug 2019 15:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E810484F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565184657;
	bh=1YFHMJWlmnGcq82UKUkI3B0wqTt3mJxJNy5iKlLQMy0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fNx7itbNkZ39odpeHm6sCTUVbKRfqLCCkPnHK3HmXHeBkNpeUa3e3tfS/PTthRVjx
	 tEwkHiCe68VIW2C6pFuSETsTF3BzxBPxZYUi8KaHu2aFrH1ExliVdoGFkODctUS8+r
	 UfAzhaNgh6M9NyY0A9ro7sF5cabaZ6VXQzP9IWCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E40FF804CA;
	Wed,  7 Aug 2019 15:29:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BAF4F80290; Wed,  7 Aug 2019 15:29:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B40BF800F3
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 15:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B40BF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dEPPhRYX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rEAFvNb+sYqs0XUT2igL57BrRLvuF7Ey24I/wNG+XDo=; b=dEPPhRYXoTCrY3k5sqw0o4R0X
 3BgkEOsWhgkJC3RVvtPxMJsdPnwVMjQv059lHFES/SN35SzU1LGUPxaUjS2idqnwEuPv/kFh8xUh2
 c4Z7C2qKiATmVwx6mCXBRtrU9Dgr80vIHxLJNIMRVmNEFb9gAna2er6XLTorx1QJ8xsE0=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvLzw-0007eU-Lv; Wed, 07 Aug 2019 13:29:00 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7BDC72742B9E; Wed,  7 Aug 2019 14:28:59 +0100 (BST)
Date: Wed, 7 Aug 2019 14:28:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20190807132859.GE4048@sirena.co.uk>
References: <20190723144341.21339-1-cezary.rojewski@intel.com>
 <20190723144341.21339-3-cezary.rojewski@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190723144341.21339-3-cezary.rojewski@intel.com>
X-Cookie: Dammit Jim, I'm an actor, not a doctor.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v2 2/2] ASoC: Intel: Skylake:
	large_config_get overhaul
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
Content-Type: multipart/mixed; boundary="===============7185630423781472824=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7185630423781472824==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/2994txjAzEdQwm5"
Content-Disposition: inline


--/2994txjAzEdQwm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 23, 2019 at 04:43:41PM +0200, Cezary Rojewski wrote:
> LARGE_CONFIG_GET is among the most crucial IPCs. Host is expected to
> send single request first to obtain total payload size from received
> header's data_off_size. From then on, it loops for each frame exceeding
> inbox size until entire payload is read. If entire payload is contained
> within the very first frame, no looping is performed.

This doesn't apply against current code, please check and resend.

--/2994txjAzEdQwm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1K0hoACgkQJNaLcl1U
h9D2Qgf+KlTV9j2+wgO4G10ROipBPUMRw24G4bLFMCR+SOUqioAl0Xn8QdCYjZpm
Y1tse3pfeCO2YVv3Ws8MSOCpJliRE2Jia9qcxx1ELHHp7uOCirN/ZWdKrWOmhdkU
4PfZNkRAPHofntv/qPqiCPciXD3lbxEqDWgySGHvSLzbj79PCBW/ZbciMgCFdstA
DWbhyPNELpf4OlqHXYQ2pYD01WmDKf2m+55q7nT74fot5n8lCdVIuQizkzZLZXk0
LZ8WJypIUtlbM4lJeUMYm3/xVoS8r4cdP/zk+lHTl0/kP8HQLjR55J0PRG600EFx
CMpF49pYhGNe2ud9FSzAt15CJmET+g==
=AqUh
-----END PGP SIGNATURE-----

--/2994txjAzEdQwm5--

--===============7185630423781472824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7185630423781472824==--
