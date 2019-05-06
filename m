Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB19914B39
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 15:50:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F87218BB;
	Mon,  6 May 2019 15:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F87218BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557150655;
	bh=ly7Y1I7rlO+wao3uzOVCncfRDckYpsF5xnMU2PkXNYc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o5iFUj2xLRCR4w6x3mYCo3Gg1Yu6wZSPyVmSrd8w/xwLMsOtb+2WLV+6CmV7cTvli
	 HF5KkDELc0B0MiRU/ux4/z6zHpVDBUGxSY8mVOh8lvt3xl6AxrZOJreE+dZY1Ai05b
	 qs2eOOE/aB5BMzvLQ4ovMY882aZs1/hx9RjsCVg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90D70F896F0;
	Mon,  6 May 2019 15:49:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD06AF896F0; Mon,  6 May 2019 15:49:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BB51F80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 15:49:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BB51F80C07
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="IpcmFoi3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I9EiUjZlbYKmooOFJUET9HVO4ocU1gDF+rwLUJaLGx8=; b=IpcmFoi3IrhULEHGeRD7blImW
 YiKOp6ScN0OaVEqHyJZwEtdSZv7ONiqBHdwFF5mwV3p9W7HWjJPLZwYkcnum4sf1LqcOko2CujeVw
 ItzPS1eVBnk4B2vLOsTYbTBILiY20VSV6ryN0ux2dEiWp58G7rqhrzbbcnt7BI4MmLkWg=;
Received: from kd111239184067.au-net.ne.jp ([111.239.184.67]
 helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hNdzK-0001ii-60; Mon, 06 May 2019 13:49:02 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 2481744000C; Mon,  6 May 2019 14:48:56 +0100 (BST)
Date: Mon, 6 May 2019 22:48:56 +0900
From: Mark Brown <broonie@kernel.org>
To: Baolin Wang <baolin.wang@linaro.org>
Message-ID: <20190506134856.GP14916@sirena.org.uk>
References: <ee4a22c3491628abf94c8d356dccd67984604811.1555049554.git.baolin.wang@linaro.org>
 <20190418102606.AE0181126DA9@debutante.sirena.org.uk>
 <CAMz4kuLK_XS93Wpq+BkXVAJA3M+vFnL8pR0gR7aRpYxBzwLv9w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMz4kuLK_XS93Wpq+BkXVAJA3M+vFnL8pR0gR7aRpYxBzwLv9w@mail.gmail.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Orson Zhai <orsonzhai@gmail.com>
Subject: Re: [alsa-devel] Applied "ASoC: sprd: Add reserved DMA memory
 support" to the asoc tree
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
Content-Type: multipart/mixed; boundary="===============4953219266918424522=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4953219266918424522==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s33OSBZCP+C8M/FY"
Content-Disposition: inline


--s33OSBZCP+C8M/FY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 06, 2019 at 03:37:39PM +0800, Baolin Wang wrote:

> I did not find this patch in your sound git tree and the linux-next
> tree, so could you check if you missed this patch? Or did I miss
> anything? Thanks a lot.

Something seems to have gone wrong at some point which caused some
patches to go AWOL, not sure what.  I thought I'd caught all of them but
I guess not this one, I restored it now.

--s33OSBZCP+C8M/FY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzQO0cACgkQJNaLcl1U
h9DxWwf/Z4m9LSBTKOW0ZcozXoq+zc8N1up5BJlh6maPOLrNHFrLRSNN70sdMwzu
KsGvHfwhVyXjm9iS0c7cCo08wFeiez/RvVdDNqi3GIiNg7YfmnyJeyca59Fz23EC
9oJFIRnOYAzQ/jb/2MbrnimwVVEvyo1gGwWa0Hge5nR/Y8kxN3S0GptO6UQGbYqb
V6CiaramWldvBYJ+qvp2Sl55gty02bYy9ZXIU+3c/a9f6bMK/UNl8e7suhAEmTtS
5kXaB27gDIFbBqX34uYtB7LAZ0sv7aIwDlmT7U/ijB4c2DH7I4YGNzmP4k9+3CUm
ayYVK3lDdxGhLOQLOaTLfP4T4b6zVQ==
=2eW6
-----END PGP SIGNATURE-----

--s33OSBZCP+C8M/FY--

--===============4953219266918424522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4953219266918424522==--
