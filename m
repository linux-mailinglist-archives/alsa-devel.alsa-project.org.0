Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A77D415290C
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 11:23:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 863D6169C;
	Wed,  5 Feb 2020 11:22:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 863D6169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580898214;
	bh=98mVNk89emHbWahgXjuHq2NLanIRHrCvdTQMocJjrM8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RQkqYnSFTo5+xaYcKRbHWIK7AkNQL0ZUWZbMTZQNPKnwqRGwvBjjBGixSzAdLS3kU
	 nhycagkSm5Ja74PeQFW3LKo+Bc9VXZSJ7LX2pwSibAMdp7ZodDjVKI+Pa00QbrrP00
	 64xCei+31EAYD3EVZH2wGXw307bzHGyZHtTtAg5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0250AF8014C;
	Wed,  5 Feb 2020 11:22:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5219BF80148; Wed,  5 Feb 2020 11:22:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C53ACF800AB
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 11:22:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C53ACF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="P27fPpAO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/rtlxdlFXFw6Im6mj5PCy/VNag7UxeRqSrkOJffVA38=; b=P27fPpAO6EuAqKJkVen6Iqg0M
 4+zR4tbt/Lpfp3hs9Krjct35yrPGoCBcojIOwYeBSX0hzfyjh3Xh1elPHcm86yY7xV3NcIB/XgejM
 XnHftV79L8ej6ObvVtWWqLUFUmBBuYuMSN2zsuTDQYiUWcmHxtdm8Wa8MRcxwGUyfi6Bs=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1izHpP-0003xE-BT; Wed, 05 Feb 2020 10:22:39 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 07415D01D7F; Wed,  5 Feb 2020 10:22:39 +0000 (GMT)
Date: Wed, 5 Feb 2020 10:22:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Message-ID: <20200205102238.GG3897@sirena.org.uk>
References: <20200204060143.23393-1-natechancellor@gmail.com>
 <20200204100039.GX3897@sirena.org.uk>
 <20200204193215.GA44094@ubuntu-x2-xlarge-x86>
MIME-Version: 1.0
In-Reply-To: <20200204193215.GA44094@ubuntu-x2-xlarge-x86>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: clang-built-linux@googlegroups.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: wcd934x: Remove some unnecessary
	NULL checks
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
Content-Type: multipart/mixed; boundary="===============8956454237489866237=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8956454237489866237==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mOr7kNv8EL30+EI+"
Content-Disposition: inline


--mOr7kNv8EL30+EI+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 04, 2020 at 12:32:15PM -0700, Nathan Chancellor wrote:
> On Tue, Feb 04, 2020 at 10:00:39AM +0000, Mark Brown wrote:

> > I'm not convincd this is a sensible warning, at the use site a
> > pointer to an array in a struct looks identical to an array
> > embedded in the struct so it's not such a bad idea to check and
> > refactoring of the struct could easily introduce problems.

> Other static checkers like smatch will warn about this as well (since I
> am sure that is how Dan Carpenter found the same issue in the wcd9335
> driver). Isn't an antipattern in the kernel to do things "just in
> case we do something later"? There are plenty of NULL checks removed
> from the kernel because they do not do anything now.

I'm not convinced it is an antipattern - adding the checks would
be a bit silly but with the way C works the warnings feel like
false positives.  If the compiler were able to warn about missing
NULL checks in the case where the thing in the struct is a
pointer I'd be a lot happier with this.

> I'd be fine with changing the check to something else that keeps the
> same logic but doesn't create a warning; I am not exactly sure what that
> would be because that is more of a specific driver logic thing, which I
> am not familiar with.

I've queued the change to be applied since it's shuts the
compiler up but I'm really not convinced the compiler is helping
here.

--mOr7kNv8EL30+EI+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl46l24ACgkQJNaLcl1U
h9AAXAf+MO8n4UxQtouGrNdxFiwPsOIGewJMPd4vN1NCZTVDUBP55eWyQ4naXCsN
+BfzAWdmmwJn142SlhZV1P6qThjGkZwZft+PMVDW58zVRibxqmypybMitrQXPvQM
hzX56yshLBEYtaeps5/as2Iv0SU07tYFJ7g+ir1K0s8XOkYusOBWTGViOpO4JkH2
Js8aho28jbWGq8UaK8aH2eDhtLVPTmjYpN5Xk7qfbGvy5+Pq+HOmpLW0sM56uw9Q
nYPZOJbkFU+fIKXw8ZmxuuXs/vFeZHUqIdLAqcz+vIdxj6pxNnt9lk0uA6idJ+iH
+UdbUJ0BPsFyvzLEriFJEgwNnbTN0w==
=B63k
-----END PGP SIGNATURE-----

--mOr7kNv8EL30+EI+--

--===============8956454237489866237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8956454237489866237==--
