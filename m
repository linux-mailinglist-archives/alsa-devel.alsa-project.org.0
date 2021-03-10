Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3EE3343BD
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 17:54:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72FE71771;
	Wed, 10 Mar 2021 17:53:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72FE71771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615395285;
	bh=LYXEORDDED5ZeFnxA4L4WxHD6s/2iGI2G6icdNZdVKE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U0OV+EIOjDS75mVCHQHmq1dMZUAD6eW4AqBe119xD/5gmZrsPZ+Esjb0qF6MBP1mO
	 Djt3G0NNOIl0bPci9vD+H9UlcjsmISqs+0TdVgfCdV7fIJGBxf0KtWeepNb+0T27wW
	 2TbkiJCSRvtQGC+EetMPaX7BcR1FVBH6EumUJtBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B34A4F8014E;
	Wed, 10 Mar 2021 17:53:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 773B0F8016C; Wed, 10 Mar 2021 17:53:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBF8DF8012F
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 17:53:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBF8DF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ExcjjneF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31E9E64FC3;
 Wed, 10 Mar 2021 16:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615395227;
 bh=LYXEORDDED5ZeFnxA4L4WxHD6s/2iGI2G6icdNZdVKE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ExcjjneF5YUIT7jt4pCyRE7YRNmLVaS/WtF+1RblQWLBGcLMt77NpHs1IC4FbZGZO
 pAvQNLl2SWkih9aGm9vgHhXZppe48rHYejLqckbItCfYzW19x70WX+onP4OyN+o5jx
 rpWRjP8bVkfnTxe241uEFB9R1xj43z8Z2IfFoif9BtS3i0lnoll2jHUfLt6I5R6r3E
 upWZf7APTTSjNJUcuMmLYxq3gt2D/cRw3PJt/9MiSp+TF7743ar1d9snVg9zC6IgAp
 L6PslnyJHs4TbZwu0/W+RskT/G/gKx/YTXX6FGG17mvnMfKRbUXVDVqOxNbIpE0yxQ
 70sZz0VNGDu1g==
Date: Wed, 10 Mar 2021 16:52:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
Message-ID: <20210310165235.GD28564@sirena.org.uk>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
 <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
 <20210310133534.GD4746@sirena.org.uk>
 <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
 <20210310161814.GA28564@sirena.org.uk>
 <s5hzgzbvube.wl-tiwai@suse.de>
 <9b073d01-f2fe-a99b-e53c-4a0b3f95ca05@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Content-Disposition: inline
In-Reply-To: <9b073d01-f2fe-a99b-e53c-4a0b3f95ca05@linux.intel.com>
X-Cookie: Yow!  Are we laid back yet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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


--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 10, 2021 at 10:41:18AM -0600, Pierre-Louis Bossart wrote:

> would this work?

> if (!IS_ENABLED(CONFIG_DMI))
>     return 0;

Build time dependencies aren't going to help anything, arm64 (and to my
understanding some future x86 systems, LynxPoint IIRC) supports both DT
and ACPI and so you have kernels built with support for both.

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBI+VIACgkQJNaLcl1U
h9ADMQf8DUyuTKKeAuKGArtFT2ZzFUBtLWTtT/SYCk1lUWjYDuu/cWrjsKxXPb+4
38AzlvGlZp+/xcNRgfBWe3RdDSQGjp3gzYQky42fW3wo/60nabfEEz1FlEIqUQKI
jXwyDky/dB/E6AHqwUxzGlCQdcF1Ue25iXGJo9pkAfSDUi6xi5Tzytxfx4hJUzQb
ALZU7oUw4iRizAKO8ttEYhO86zE9tuztKdQ5vJn/IcLeWp8NZ3B6h5UM6ReMkm5K
Hrwoi+HnRcWTPH9uX/p5Q/z19J4XthpAVhJQXMbKq+smwble0KKeXTSUhjp9Ql5m
SfCET1DfQtXVxR+PUwStE18DDAtmRQ==
=9tca
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--
