Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F7B2B0AB5
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 17:48:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C875D184D;
	Thu, 12 Nov 2020 17:47:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C875D184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605199702;
	bh=zCu1KkUnZaIjySKcsiWb5OyBsIvN+qEbRFuUY9ZZBe0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kqVJjdibJ3aqEXJxvlmN07bksSbZkQCjJutw9nwpwJETGIaRhSuMBI3LLS5uDAuZA
	 4gr7N0YZWJ0CckoUE2eOJRULBKZ72nX8tO69UzREMBhpWi5RMBE1m5Nlffd/il4wCp
	 4EvIMexP7K6Rg6WvsmgjX6pWlQsvMLyDtjH/wLHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81C2BF8007E;
	Thu, 12 Nov 2020 17:47:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08089F801D5; Thu, 12 Nov 2020 17:47:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11747F8007E
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 17:46:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11747F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DB3Mxvo+"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D018216FD;
 Thu, 12 Nov 2020 16:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605199615;
 bh=zCu1KkUnZaIjySKcsiWb5OyBsIvN+qEbRFuUY9ZZBe0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DB3Mxvo+RgPOn9VuNm+kVlKjkWjw7mLrV4ULihbOLsO7sUwq+V3kkskFZl42qirOI
 iEXDR6Fj8e9vyocXHBktQdexLLci10735TavEIFPnfxQYzW1tojlCwFkMBEx+6bCAh
 4cLF5DjD67T82NJWzk/bX0+ceGcU1CN4zUfIE7qQ=
Date: Thu, 12 Nov 2020 16:46:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 0/4] ASoC: SOF: Kconfig corrections
Message-ID: <20201112164639.GC4742@sirena.org.uk>
References: <20201112164425.25603-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aT9PWwzfKXlsBJM1"
Content-Disposition: inline
In-Reply-To: <20201112164425.25603-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: Danger: do not shake.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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


--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2020 at 10:44:21AM -0600, Pierre-Louis Bossart wrote:

> v2: rebase to remove git am issue (worked with --3way before)

That only works if I have the blobs you were patching against in my git
object store, if they're out of tree chances are my git repository will
never have seen them.

--aT9PWwzfKXlsBJM1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+tZu4ACgkQJNaLcl1U
h9Ad0Af+O0EDkNo7n/RxHehDYSUqtff+kI9BY6RTAfA8VGZJFDCucdJz2Vbuw6JB
C3vVIVe1v9FLVCfbvRb9jERhu2z49ocAJIYCOwt3i1Stse38kJYS3JJbX/t2oMrR
ccisGqLojnGyPKq8dw0Mo29Vcs9dOT13IGTW0y+NGDEfvk2dCABgMHAWvDZPOpp4
O7mSuE5P85zwadqdTDYo/cgkUF8pCkIP7jWuKUdhHP9k9/JqsCGu4tJmcslL6yjG
NrvmMcuDqqziCMgLCkdvzd0jgq/kQInez9Gk6jD03vOIcWKAxeCKChBJ/27hBH5t
sRtMmMPdvjMCLKuddeTEyCJL/sSKjA==
=yCG/
-----END PGP SIGNATURE-----

--aT9PWwzfKXlsBJM1--
