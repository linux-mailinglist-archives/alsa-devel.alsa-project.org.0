Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1E05106D4
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 20:26:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF9AC1729;
	Tue, 26 Apr 2022 20:25:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF9AC1729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650997585;
	bh=OksuMB9hG5LUIlbuUVk5xh+Yh/J295j9MF6wPymUUmw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oWns+Bx6WXKR37FmlRDlsS2+onS20RBooYck9PJV5aczVFgM386UYHsoZq4StpygZ
	 O2jZUw9XIcPEF7g12jsIcxGR3pazsbT0ndJIS4Qa4syohvSx7u0ASh6v058lQv1s1/
	 VsUtD8s1j1+T9G6PMNXFhJjfe64nT/evvbH7VSd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FEC3F800AE;
	Tue, 26 Apr 2022 20:25:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55763F80152; Tue, 26 Apr 2022 20:25:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC9BEF800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 20:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC9BEF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cDHxkV2v"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E589361847;
 Tue, 26 Apr 2022 18:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F887C385AA;
 Tue, 26 Apr 2022 18:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650997517;
 bh=OksuMB9hG5LUIlbuUVk5xh+Yh/J295j9MF6wPymUUmw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cDHxkV2vtYiNGKDh9y7z5kGAZQA9E47uJru+373WUX2Pe8ZG1Uf1Rh3763k3WPaoh
 J2IAe90FRPib8WAmDbOn2K2guIeS0/YvenSsgH3txZEVlWuQ3kngVM6eC0o6IIJAuV
 Ah+3kD62+nicap/dwRUw3HPZA/bWhVtbd2GEJQa8QewML5sqFGeAvvUefvpplAprCM
 nlYBJootJXH0hP1a8/v9dxA/3HHpNUQ2gQTM6MWx0r7tXHMGepAfMVieRQuMGCGE6n
 j8oHobzML3MT7whni17PC/DMiwtnIIGqjLjmv/cAx8iGtQciJZQBkhhHnyKJjbCCyB
 M7ASjzR76FVzA==
Date: Tue, 26 Apr 2022 19:25:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Depend on CONFIG_ACPI
Message-ID: <Ymg5CAbwf/UxUOff@sirena.org.uk>
References: <20220426115454.685787-1-amadeuszx.slawinski@linux.intel.com>
 <eab567f0-73a4-bf23-76bf-8d576fa942f0@linux.intel.com>
 <YmgnE/HKNmI+agNs@sirena.org.uk>
 <726c58e5-241d-053f-8b4c-d56a5a228f0f@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o+Hes1gcLZ96T+Yk"
Content-Disposition: inline
In-Reply-To: <726c58e5-241d-053f-8b4c-d56a5a228f0f@intel.com>
X-Cookie: I'm a Lisp variable -- bind me!
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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


--o+Hes1gcLZ96T+Yk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 26, 2022 at 08:07:22PM +0200, Cezary Rojewski wrote:

> Would you like the change proposed by Pierre to be part of this patch or a
> separate one?

Either is fine.

> Also, I assume the above code does not change, just:
> s/select SND_SOC_ACPI/select SND_SOC_ACPI if ACPI/

> is applied on top of what's already in the patch. Is my deduction correct?

AIUI the current patch and associated hard dependency on ACPI could be
dropped but I've not checked or thought too deeply about it.

--o+Hes1gcLZ96T+Yk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJoOQcACgkQJNaLcl1U
h9CSPQf8CA6U7oFVQj5YYjqC3Zh5DM3I4Mm+SlOar3nEFphIMSWdKpYtwDKlYsOh
5CHKGKTpAaNn3keMt0AU1IkLYZkJqTQBVuG/Vx98ILeqBNJBIFTTXaDU56qgMiFp
9+AyKi19js+vDaKaMvcKcHjG6uORmqOVQsEC0D6FHuEY87QObbjjRx0sKE78VM19
0M2aD0R2Z9TAfyCt+SnG3SoMzRcAfQoKHzLAWbkZ+DSgz1GgOGka3+qxCZ+yn/k6
xY0u6KYdLEk6Y6G/i5l5XYrzeY530kX6V+T4vuQ7MBSxnl+PaJcq4vp9iQw5p/it
gvNsDBuASo6Vve1rrpvC13Oqd5C/ow==
=FZrt
-----END PGP SIGNATURE-----

--o+Hes1gcLZ96T+Yk--
