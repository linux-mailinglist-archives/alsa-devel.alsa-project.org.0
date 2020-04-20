Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D291B0C71
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 15:19:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6749167E;
	Mon, 20 Apr 2020 15:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6749167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587388789;
	bh=WDmMrY4XuXzvQ/ayyl+vRlEAwJJYDLoIhcx8iDAn7Y0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j7FMlVQVm7JKDuPrQpzkx4DIhUFo8nBCGOig5uAF7Ad5P1lOXaBlKyCQgyw8+z0ZS
	 IDCLl+8Osta4/qJTA2KHM6mN18wsFZWIV3XV1d7Yx0soIMKGKOt6OMKq7CISOyESqA
	 25zjCDz0wUJbeBKSh1eSjk8prptM56skJtlYI6P0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BC90F8020C;
	Mon, 20 Apr 2020 15:18:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 174F2F801D9; Mon, 20 Apr 2020 15:18:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B8CBF800C8
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 15:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B8CBF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="w4G0e4ft"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2FFD6205C9;
 Mon, 20 Apr 2020 13:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587388679;
 bh=WDmMrY4XuXzvQ/ayyl+vRlEAwJJYDLoIhcx8iDAn7Y0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=w4G0e4ftejFBfctUk7iD6yNHRASBSCrVhFvNd0VIMMYgPMCdDBZx/jjo3alQlQoKJ
 +nAaR6hTLiCXrx4kZ81fM+VtPbExoCGd2s3pUi2ECG7rTw9PlqVCorig4rZWJojsZw
 Gd/6G49g5jAdqGtfVICaSQM+0i1sVBeBZdeg21E0=
Date: Mon, 20 Apr 2020 14:17:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: intel/skl/hda - fix oops on systems without i915
 audio codec
Message-ID: <20200420131757.GA55537@sirena.org.uk>
References: <20200417075957.24811-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <20200417075957.24811-1-kai.vehmanen@linux.intel.com>
X-Cookie: Natural laws have no pity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: hui.wang@canonical.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 jaska.uimonen@linux.intel.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 17, 2020 at 10:59:57AM +0300, Kai Vehmanen wrote:

> Recent fix for jack detection caused a regression on systems with HDA
> audio codec but no HDMI/DP audio via i915 graphics, leading to a kernel
> oops at device probe. On these systems, HDA bus instance lookup fails,
> as the first ASoC runtime of the card is connected to a dummy codec
> (as no HDMI codec is present).

This doesn't apply against current code, please check and resend if
required.

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6doQQACgkQJNaLcl1U
h9BmmQf+IrcmDmUw8SisKDi1zC6sz1krzWdgCcBLbtLUuP/6BTsMZXscP5RoyGM/
nruVfZc6QwM2Tcqhhedfsn1Eaji9OKokh9XRyfpo9acueFE9fnUSS0byf3D3mOC/
a/cTEnlm4LdDABxdWUxojr3DdsBcDV6LCdiDdp6QVmWTGfo8d9gh1rXtLmyOeVvx
CvsXkBbu9AmGVL/sCG7yXQ5PCL1+ePMXQn5Z+YZ9xjdwT7ax1ut0AXlFJmI0IdpT
q84+5lkIIad7zQ3PCXy2c9RTJn+Mqf0G9CNUJRMCDBnRjkzT1T1X17U6TiIeLoUv
cmuSEvvrmT0F/yYbrJbkU9rLMBd07A==
=KR8t
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
