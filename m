Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C20F2D7C8C
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 18:14:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A61F1174F;
	Fri, 11 Dec 2020 18:14:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A61F1174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607706893;
	bh=F5Kv0EXSh42CiQPNz++tgaA25ukosSBxIT5Ldln1VW0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ad9WJnWKjwH8beUk2gf+jDZPrOktRVt16crIFCZ+eaK2+tGZSwNkklSiosWlJBc9J
	 654+BP/n7miDWos09sFXlnq4Y7oA3XqM8ChFZOcFS2jBAh8sQ73BDKgur2JQrbpkR3
	 +wFpKGjQUrjH/CaUc6XiCA951WvvPfnb9GOf7J0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1448F80217;
	Fri, 11 Dec 2020 18:13:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BABE6F8020D; Fri, 11 Dec 2020 18:13:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B9AFF80105
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 18:13:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B9AFF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aeTm2w7J"
Date: Fri, 11 Dec 2020 17:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607706792;
 bh=F5Kv0EXSh42CiQPNz++tgaA25ukosSBxIT5Ldln1VW0=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=aeTm2w7JomXu7/zgHHiMeR4oCW71Aq6UxyutXI8Thdi556rSRJ5CyYkaTu7CXjOFO
 LsVO9tEWQ+fCdApLj4ciVqdOdON91FuoYJDAYFH2+nbVVWQnHvrcWGF68Rb1LVJg/v
 vb36vlRjQBQhk5A+NUHF+DmeJzThdzkuerm5hSGOgHtP8F2W2R3hHLSHAH9nM3ZzP5
 wpBGuvxgZkl/VJpqk+EpU1+hGfR7Qgca0Udlu4sdXwGDLlUGiTG8RPAhXE6ZUKJFvv
 /9QWNsCkuK2BTFTDQSw0SqXtTcqGb9TKwOV+97GU1qci41swM7AIE4TzInvO08Ja4s
 tLUPJwLY4SZzw==
From: Mark Brown <broonie@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH] ASoC: Intel: Skylake: skl-topology: Fix OOPs ib
 skl_tplg_complete
Message-ID: <20201211171305.GG4929@sirena.org.uk>
References: <20201211170629.871085-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="df+09Je9rNq3P+GE"
Content-Disposition: inline
In-Reply-To: <20201211170629.871085-1-ribalda@chromium.org>
X-Cookie: Nostalgia isn't what it used to be.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>
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


--df+09Je9rNq3P+GE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 11, 2020 at 06:06:29PM +0100, Ricardo Ribalda wrote:

> If dobj->control is not initialized we end up in an OOPs during
> skl_tplg_complete:

>  		for (i = 0; i < se->items; i++) {
> -			struct snd_ctl_elem_value val;
> +			struct snd_ctl_elem_value val = {};

This bit looks like a separate fix?

--df+09Je9rNq3P+GE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/TqKAACgkQJNaLcl1U
h9BQeAf+OFcaJQh4d/Gjojcw4mPYxpP3Kwf7I4v7LvLnqMTDdaE1mdliR1JM+2YF
P+dKGxT1sP9q8FpsjAIDl20dRdGHa/yMdJcIGs8CZj9uEBxMuUu2OZVlHnTZ5kzS
tNxszxGAuQop+kJRlENIQ19TsOGpmgMYlllysVFyHGg6ZYi/yQA9ugqqjwoMlSg6
9A9leB+N1XfdvD6SqOFx904JpWoAh2XgD9W4CbjogSSg+lqroPBl2cQGaOkvhzOY
/jiYg7pVDqss0Hw6PHHLLBUqnzdfrd+G8XerW9ZK8PXcAroXfBYA9KlV+4UT14Fo
MPH2vmMrMbj488G0uYfsB3RYMQA5iw==
=DfZj
-----END PGP SIGNATURE-----

--df+09Je9rNq3P+GE--
