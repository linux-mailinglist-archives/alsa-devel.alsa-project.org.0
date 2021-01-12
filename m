Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B252F3934
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 19:51:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3EB416BE;
	Tue, 12 Jan 2021 19:50:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3EB416BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610477473;
	bh=+wilW7PR6EUwuOxtL99UfUGxy2Y3s4HM648aqDLGvwQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UvW1Lm6a2O8rX6W0C2nxK9V9KMbT8yWKNuBaI5TKT23GEHo4jSICJxcj+1PhWOmKU
	 DpzDsM19fV3A6uNJ0S0DYf+TIV3xXaUJvlE9L1kbxoxZffhQKfKloANE8JdIwEeSh4
	 SCyFtCLFqPLvGcYmDd6vSqCbgH9BGXg8Uij/Obbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F03C5F8026F;
	Tue, 12 Jan 2021 19:49:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B867DF8025E; Tue, 12 Jan 2021 19:49:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FE6FF80113
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 19:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FE6FF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WiSTIs/5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F14B022B4B;
 Tue, 12 Jan 2021 18:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610477361;
 bh=+wilW7PR6EUwuOxtL99UfUGxy2Y3s4HM648aqDLGvwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WiSTIs/5MU3rCUxPQxxY/GuKYx1VicPZeMoEfe9QgXpL6SNF2KfL2sxOGcKTFPnvq
 zSCMSDbeHOt2/UyUpwPt6m4obluPhqZKH2mSGyEEhnrhSrgiLfRv6NvM2AjZIjMEjE
 fyPy8uYlPfq+CHXXns6yleUqwKsP6nalVhu2sA/4+8GTGuve3q6C4yyKSmG0GIw4x1
 LkysKVr0ypvfhDlGvovfK0QGiTRV84Q7LFIbaeIB6z4cvj89h4xteLNFfb8mhPptqF
 BMHPGvKmpBVsqnpUyan7x5MjXsyJyqeXkKjANBcLIcqkEMIWjvMcLF0j+JX4Ujry4N
 XsSS0/5UigVPw==
Date: Tue, 12 Jan 2021 18:48:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] ASoC: imx-hdmi: Fix warning of the uninitialized
 variable ret
Message-ID: <20210112184848.GG4646@sirena.org.uk>
References: <1608115464-18710-1-git-send-email-shengjiu.wang@nxp.com>
 <20210112181949.GA3241630@ubuntu-m3-large-x86>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6BvahUXLYAruDZOj"
Content-Disposition: inline
In-Reply-To: <20210112181949.GA3241630@ubuntu-m3-large-x86>
X-Cookie: Stay away from hurricanes for a while.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 tiwai@suse.com, nicoleotsuka@gmail.com, festevam@gmail.com,
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


--6BvahUXLYAruDZOj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 12, 2021 at 11:19:49AM -0700, Nathan Chancellor wrote:

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

> >
> > Signed-off-by: shengjiu wang <shengjiu.wang@nxp.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > ---

> I still see a warning in v5.11-rc3 that is fixed by this patch, is it
> not going in this release cycle? It is a regression fix, seems like it
> should.

This is a random warning fix, why would you expect it to be sent as a
bug fix?  This is the first indication I've seen that anyone is seeing
it in mainline, in general the people who report and fix warnings are
doing so based on -next and the patch seems to be from a month ago.  I
don't have this in my inbox so I assume it's applied already or needs to
be resubmitted anyway.

--6BvahUXLYAruDZOj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/97w8ACgkQJNaLcl1U
h9C44Qf/bxW+CXB4DwJTofrPuzVBuAQ6vUrmIqtZSde3b3oZ60V4fS3Weuw63ihH
QkztqOp+rn7uoHY3X1+XDUwi4+suPoag7X04Q8EKvLyhtovjOZP0Tp+gC+FXEPad
SM9gdRlMJLyJoVQSvjzJueO9vkXLy9OZoq73zH444VcmzTzGXP6Bz5wug2m9LHC2
rMEMY3mbhLDLD9zGqL/CVE5OOsFHRfAlqWb+QMJaa9QY+IrPri8XqO72mNceYFbg
grmrNQjES0IvzOa+7mxrK58M/L6iT+m9LybUHxxxINucdDdEYMV5hIY1OLzretHi
4BhzHK5m28Q8w3p+a7ZXY2D59aZbOg==
=DgaF
-----END PGP SIGNATURE-----

--6BvahUXLYAruDZOj--
