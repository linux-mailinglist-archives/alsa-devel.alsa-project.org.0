Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFD957CDF2
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 16:43:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46DDD17E7;
	Thu, 21 Jul 2022 16:42:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46DDD17E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658414612;
	bh=PpnwXm3ZuUhE0qo+2U0StDRkyurCa/SzJ43F3CrCXTg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lsOmf/a5wipv07TFFzlyFVYXw1D9AJldB2FkCchNrJ9CXabmmYnTS/yrCPD/MzyGm
	 q5X6JEKnokSsD+/tbF2G3sr9ub/wX4hLk5JcnqbwSn2NKuCTmDeMNSBZpA1u+d8fZW
	 CUPAOpiRbPQr0uszDVeWp9sIlwdjXfiDLuPDFe5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8813DF80256;
	Thu, 21 Jul 2022 16:42:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D931F8016D; Thu, 21 Jul 2022 16:42:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B557F80166
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 16:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B557F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uYg/9KRG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1DB6A61FF2;
 Thu, 21 Jul 2022 14:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FACC3411E;
 Thu, 21 Jul 2022 14:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658414538;
 bh=PpnwXm3ZuUhE0qo+2U0StDRkyurCa/SzJ43F3CrCXTg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uYg/9KRGJmSMJp1EMQ7FStO2WEfFJB2wq95YO8tG89hXZL2xaf6ey8FrWtv75v7l+
 HtfwaTukDYR/OBSHs8qcEhey5USVBSXAGYlnvGnCEmmX14xOeDI4qoDpkOCG24UnV+
 BYrRCB1bcroMGro3QhzItHjvJrilIfXFZKd7a66K1y73XTIsGcysAxQPz61ayA5zQc
 1e86NyzPQakngQXdDtMQ8BlqlRAlljLoO4So1ZYb2cj4L1oWfXMGAYPaKc4ZTjuYeh
 XlMv7qYh2E2npXXAkoHH0BCOPBC7ApPojl7s0WCLqVUadXoO/g3ZMXE6UBV1x89ulh
 qQnrp3w5tb4HQ==
Date: Thu, 21 Jul 2022 15:42:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Mark avs_path_module_type_create() as
 noinline
Message-ID: <YtllwRY6F93uYRxz@sirena.org.uk>
References: <20220720185228.3182663-1-nathan@kernel.org>
 <c00a8b5e-6def-971a-d4f2-cd65c95fe430@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ajHU/ff5Es7EyDXb"
Content-Disposition: inline
In-Reply-To: <c00a8b5e-6def-971a-d4f2-cd65c95fe430@linux.intel.com>
X-Cookie: Exercise caution in your daily affairs.
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
 patches@lists.linux.dev, alsa-devel@alsa-project.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org
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


--ajHU/ff5Es7EyDXb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 02:25:20PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> On 7/20/2022 8:52 PM, Nathan Chancellor wrote:

> > This warning is also visible with allmodconfig on other architectures.

> My first question would be what clang does differently in this configurat=
ion
> (ARM) than in all other configurations (x86, etc.) and gcc.

See above from Nathan's commit message...

--ajHU/ff5Es7EyDXb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLZZcAACgkQJNaLcl1U
h9BaqwgAhNdNCBam0uI5GOf9ZPo7T8imcXF+ulBeP3Q0Ve0ZcM5jJKpWyJY/xuKk
vKGrKJxJu9IU9AXKBppPBM1SxYIBPUCjoLBkrUYKXQyKglTbcx3Oy+lmmwxaLBoo
jpGuetXcc1czReyBzu8ySfmKkMx9S2z3O8kn8vRJ4jfF4taSE0j6gPJjMTGDdjJq
weZB3dDZGNEtWT687UK+NcY2HaMDEi/ULMN8p/Z/ZuDPlPhHUotyKBl71GMCuCD+
Fgquc2rxOUl51tNMTK9h0J3u4CtDsbi/5eC0qHdkebRdwmOhIJssiUiu2b+IEU69
Rz17RBTZkaL+qs5JW1SFAPJ57tJO2Q==
=xgGL
-----END PGP SIGNATURE-----

--ajHU/ff5Es7EyDXb--
