Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8BC34822B
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 20:50:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E8901672;
	Wed, 24 Mar 2021 20:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E8901672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616615438;
	bh=gqnmGYhk3udJPxquG6cxpNbi49QbqQbwiJwSS2qaF6E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LcZFunSEskjeIPo1TPq65+h4jtG/kHWT3AgiZC8NT1YXWEObnTZUtdMb6GD4xVCbL
	 YtWW3p/mhOM9WHuASBQfNIYLJDA6O4U5VpXmVVzxyz3IyYmDGT0AMsQ5+B3cZftCTk
	 l2cuLxtSly0fJMIP86l4QXmhW3nJnmCx7jPkEUVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E671F801D5;
	Wed, 24 Mar 2021 20:49:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD637F8012B; Wed, 24 Mar 2021 20:49:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7152EF8012B
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 20:48:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7152EF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="elzRZvqy"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C10CA61963;
 Wed, 24 Mar 2021 19:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616615329;
 bh=gqnmGYhk3udJPxquG6cxpNbi49QbqQbwiJwSS2qaF6E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=elzRZvqyeFbdcp5+wIe9XWN9MiOzp9jabGyh/TDOkGAJggPB42fjFD2l30+Bbkh06
 5GE6e7ahe3yjh8mMiiKS0Zi9AEOORTOMxEFYILzcdt3AkLsS3vNaogieTqEpl0KshG
 4p8iOf3KnLfhBSaWCLFqt0yzXsvsV7kcCOasHhtZJbnCmnMiXqg5cT7C3151HQu6Pn
 wJONMHDTd9eIxA27D2EKDiB3UqnZF1mATMiXS1e6k5W/24Rho5MBBkUfxely7PMVbC
 HfVBXFDgY9WAJ0EndgTYwQF3NOHEfLYEYd1ypcWIJaelaJXCodX9P7rNyzrNyhP10p
 bpEhJs7B4hCYg==
Date: Wed, 24 Mar 2021 19:48:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [RESEND PATCH v2] ASoC: wm8960: Remove bitclk relax condition in
 wm8960_configure_sysclk
Message-ID: <20210324194841.GB4596@sirena.org.uk>
References: <1615341642-3797-1-git-send-email-shengjiu.wang@nxp.com>
 <20210310132404.GB4746@sirena.org.uk>
 <CAA+D8ANXcyJ+GrEqTNuoNJ4wGCQfqjRkhcevt-eXSrNj_V128w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline
In-Reply-To: <CAA+D8ANXcyJ+GrEqTNuoNJ4wGCQfqjRkhcevt-eXSrNj_V128w@mail.gmail.com>
X-Cookie: The eyes of taxes are upon you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, gustavoars@kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 patches@opensource.cirrus.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 daniel.baluta@nxp.com, linux-kernel <linux-kernel@vger.kernel.org>
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


--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 24, 2021 at 09:44:26AM +0800, Shengjiu Wang wrote:
> On Wed, Mar 10, 2021 at 9:26 PM Mark Brown <broonie@kernel.org> wrote:

> > Please don't resend for acks, it just makes for more noise.

> ok, but could you please review this patch?

I already had it queued when you resent your patch, that's part of why I
was complaining about the resend.  It's in git now.

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBbl5gACgkQJNaLcl1U
h9Dongf+L99ppnpwQMqPG7xyAvuIy6Yns6XMnbQxoLtLTqs+UrR+mf188mKR6zCI
4f8M6NPIA/S3q8F1/2lO1HIcPKKEk8Rl9Y4MB7PV6wZQfo8Rd5DAkDoHLIX1uqr8
+MTw04/T6ym/h+jeF8MMtaItVDGeCYIcVcBGPvC8zGbsRp6SWYF+5nuPkWqE0OAA
z3vysGMcsA4SprtRLZYWAPLHHPQfzHMKJzymk6IKfbiuHcO7Gci5r94IHJGVggx7
eszVHVmUG9cwWB4Q2JNw3qKFnyvosexq9Dfpokl8+6+e8R3COL1t7jqOzL2uoAUB
1Q3k/8I8anj5SwHjqsDcu2pHHVRAng==
=ltSw
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
