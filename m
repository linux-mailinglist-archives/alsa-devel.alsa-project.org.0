Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 481D65B8671
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 12:32:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E09E6186C;
	Wed, 14 Sep 2022 12:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E09E6186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663151553;
	bh=l4wW4IhHFdzTrRQDPvpAZ3ls+LMCcLxPlRB4jghtJK8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VfVdx2iK8X6rxPpaL7pT/fizWiYYD13NtuskMRVXWUgDaGqExP4AgiO3XJ/sPMWOs
	 k4w9E1bNSmdOPIkX/Z1cghR9Wx2MbZMDDimoL5LJBLJ5B+Zd6yCL+qkLyqhf3CIGRA
	 scYoBsRIPM4pv/um7Pl3Bdqb8sut3vtBuJ+TLrIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C2A0F8016E;
	Wed, 14 Sep 2022 12:31:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F314F8014E; Wed, 14 Sep 2022 12:31:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5DCAF800FE
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 12:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5DCAF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pc4mogNG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0FF461B8F;
 Wed, 14 Sep 2022 10:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30D4C433C1;
 Wed, 14 Sep 2022 10:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663151486;
 bh=l4wW4IhHFdzTrRQDPvpAZ3ls+LMCcLxPlRB4jghtJK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pc4mogNGati1t0kHPVDyVBgeGhO8+K0arXo6U2+5idoDs0DIufVZL88zZ51rz7HYK
 5Bns2n2XXn6VZ127ILfg0d7IgDU+Ij2YcOX/MdqiLbfWrHleCEXkK3sx/MeAW8gSwE
 m88IQjRJqk34Yd5Ae3a8EtApn16cECHYa66w/TY7H2jXGb5SYq6p2EaiPJrGs1hBiG
 gg4mRpI5Z/Ffb2VlGN255pUAdgPEXwkTOHzZFliXsAOaMnoQkiToEY6UK5DfXPaGr3
 iqWJAmg3PUcgP7Pmxg8ZqhqcL6q1rqtRYqw+A9SaPLqCEO6Dx6tOwuQ7DJ9OuN8Kyp
 bQni8vdkg36Cw==
Date: Wed, 14 Sep 2022 11:31:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH -next] ASoC: Intel: fix unused-variable warning in
 probe_codec
Message-ID: <YyGte0fkdquTxLC4@sirena.org.uk>
References: <20220822035133.2147381-1-cuigaosheng1@huawei.com>
 <166314841746.314266.6045600836637107787.b4-ty@kernel.org>
 <87zgf2tfn3.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="C4xa30MXwHAwdNRz"
Content-Disposition: inline
In-Reply-To: <87zgf2tfn3.wl-tiwai@suse.de>
X-Cookie: One FISHWICH coming up!!
Cc: cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 ranjani.sridharan@linux.intel.com, alsa-devel@alsa-project.org,
 peter.ujfalusi@linux.intel.com, Gaosheng Cui <cuigaosheng1@huawei.com>,
 linux-kernel@vger.kernel.org
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


--C4xa30MXwHAwdNRz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 14, 2022 at 12:27:28PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > [1/1] ASoC: Intel: fix unused-variable warning in probe_codec
> >       commit: 515626a33a194c4caaf2879dbf9e00e882582af0

> I thought the buggy commit 3fd63658caed9 was present only in my tree
> for now, but if it's in your tree, that's fine to apply through
> yours.  Then I'll drop from mine.

Huh, right - I think you're right here and it is only in your
tree, it just didn't trigger any issues in my coverage tests
prior to merge.  Probably best to leave it in your tree and
either have a double apply or I'll revert it from mine.  Either
way it'll get fixed by the time it gets sent to Linus.

I'd not remembered that you had any extra stuff for ASoC in your
tree, sorry.

--C4xa30MXwHAwdNRz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMhrXQACgkQJNaLcl1U
h9C+jQf9FQwAjMtYvHZ3if8fr7vf+rJEXBpY25PWq5EI+r8ayTVRgzF1WmM1+WVC
a1JeMj4eyHdSDxCOEkg+DWiE0cxk9MwgmySqmEowRaK8v7H85UDYdeqCToyZLv4J
gTc6MvXhXrO1XStNEcASI0+SVxJg8PcBMpiGi3O3bAfFjpDLoBAkrlGiQnU3hyal
+MZBvmtlMmFbFvLY1ev0/PCwDlRohCPVc2S/uWVa8oPW7qb+Nfkw7AbYcBUsU3KY
kKjf9/m6F90yMW4yUzvlOGp43SJcKP4tqQA1d8Da3s4IRw2FJOzd7R0YN9d7eAyq
fnBS5184hFfUTDFHlMAEFkAQ0N0XSA==
=fVaV
-----END PGP SIGNATURE-----

--C4xa30MXwHAwdNRz--
