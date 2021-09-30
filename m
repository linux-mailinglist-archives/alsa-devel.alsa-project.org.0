Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C019B41D99A
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 14:17:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FFA116A0;
	Thu, 30 Sep 2021 14:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FFA116A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633004258;
	bh=Andi9G/gMKUS68TGKpb4u8TvgVtoSQ1wFSQgd0kyVG0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JE83oCX9mVZID5CYBzo9jTibC35gvFUBaPKmmB/OyzjR+KIUHjgk4sNd7j0L8HNnu
	 /GpnzlB4UskGKm1AF9xdxo5a9JrUji6LizBlpJ2Ofl98OWxja/k8bztXyRrtHkM8xg
	 yHnALbak3gjVMdKiFwNZ9SLWy5j61barcj6HIAm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3465F804BC;
	Thu, 30 Sep 2021 14:16:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE3F2F804AD; Thu, 30 Sep 2021 14:16:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0D30F800F3
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 14:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0D30F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OfFoQe5K"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CC91613CD;
 Thu, 30 Sep 2021 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633004165;
 bh=Andi9G/gMKUS68TGKpb4u8TvgVtoSQ1wFSQgd0kyVG0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OfFoQe5Knb/GsjxpoQO51JYrAWwLmzIbiINsVBv373vDpkp8yAtfUt7mAWxCojymn
 nmUIEmDZzKgoSWFQGHI461GyxBks85OgJ/uADJ299rIInuIrWNK7PJCmZfAlLALSTh
 6bAl88SOEnzLNwsjSyi/vf7Td1ciLJyFcZqlF/SGqr8Y/wR0zAhy/LsgIM4EScLLV9
 g0QBkEPnPoGLsLKZgfikBypJQsXsNbdHuaCI2LmA951kIXHdBXDpKVtDo/B2ebS6QA
 bZpdGl0/5cbJUywgqsKVpiDvprWiwZZxap4q6cKMuRd7yiO2k0jdXJPEOgBg7daXdJ
 5zl+RgbS1JxJA==
Date: Thu, 30 Sep 2021 13:15:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 00/16] ASoC: Add Rich Graph Card support
Message-ID: <20210930121515.GA19842@sirena.org.uk>
References: <87tuitusy4.wl-kuninori.morimoto.gx@renesas.com>
 <87pmsr9g39.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <87pmsr9g39.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Academicians care, that's who.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 30, 2021 at 07:23:06AM +0900, Kuninori Morimoto wrote:

> 2 weeks have passed, and nothing happened.
> Do I need to repost this patch-set ?

No, it's still in my queue - I'm hoping to get to it this week, between
Plumbers last week and a big internal conference the week before I've
not had much bandwidth for complicated stuff like this.

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFVqlIACgkQJNaLcl1U
h9DKaQf/W5HnX/YGAOLHqzbcTGlTdhcZlEwjwtU9pvqFeeEgkn1OsU84ELFTxtki
otPxB0TsZ2potjnp4kxg4qq/wgqbh8OgN5fK/Cysu5McSuaxU3e3oMHcQnzCdfjX
lVJg6P5nHjGD5EmwUbIXMgclo89hwIcU8tQsc65zFGWy/BvBKqY44HWRA16C3dIz
rJN6bARBWRRKVt/un1Y/F+jgAcMJZ2xlILb9ZzW0sTXXJ3D1WWUIlVxYD2lesE3V
zGRUhjRlAESF+IcGaTzi0i4zB53QcpIUKmNR/E2oBauJctlzK7WkX7pOOJXwmsZX
GtZ/H+FUvl06pbKLk7Gn1GCAOz3vLQ==
=4DKA
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
