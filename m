Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6938825C80F
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 19:29:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E38F816DC;
	Thu,  3 Sep 2020 19:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E38F816DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599154162;
	bh=t7zI8sJOTQOeS2rxXIac2iDol/sgkY7O7+T2zmbo2EU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jZRtGi+Bqv9RDlOplyW21wNT+/J1Cgx9WB++qK7PQi0aTb0hSJ/3vy0v16C91Fp2k
	 v1hZuSL8Y+/KuRY7Sz0x1UMbWWJFGaLpYAtg61cVr5aEh81l5HBJ7AcBh5gqvD426j
	 D0ZaQioz6XAzGJOi8IdX0Ogtg7coiTscniLdRS40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A2C0F8021D;
	Thu,  3 Sep 2020 19:27:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F6B4F80217; Thu,  3 Sep 2020 19:27:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F557F800BA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 19:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F557F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M5hpYffG"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A3EB20716;
 Thu,  3 Sep 2020 17:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599154047;
 bh=t7zI8sJOTQOeS2rxXIac2iDol/sgkY7O7+T2zmbo2EU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M5hpYffGkuaMwxeTg9w9yZBkfc5QohnUY1fywyCxQFvedeIfmMNVy6dlYf+KeHGgf
 RAuk19dUK92EJE+p+Rqp6q1j86iOxf7p12QqYEo89f+4JtAJ5qiiZjpx/k67B4110u
 yXa1mNMsIMsAwr7FfApwH5UHFeS3Kym9lSfm7s1Y=
Date: Thu, 3 Sep 2020 18:26:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: sound: midas-audio: Correct parsing
 sound-dai phandles
Message-ID: <20200903172645.GC4771@sirena.org.uk>
References: <20200830112633.6732-1-krzk@kernel.org>
 <159897179515.47719.6003518135515395142.b4-ty@kernel.org>
 <20200903164738.GA2929052@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Content-Disposition: inline
In-Reply-To: <20200903164738.GA2929052@bogus>
X-Cookie: Murphy was an optimist.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
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


--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2020 at 10:47:38AM -0600, Rob Herring wrote:

> > [2/2] ASoC: odroid: Use unevaluatedProperties
> >       commit: a57307ca6b661e16f9435a25f376ac277c3de697

> This one should be reverted/dropped too. Patch 1 is fine.

There are others?  What's the issue with them?  It'd be easiest if you
could send patches doing whatever reverts you're looking for.

--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9RJ1UACgkQJNaLcl1U
h9CFKQf+M6HSYRnla25/KN5u8rIphL3ZtnOOib9oxzgBC9uVZRtuYXAlFG8B5xt8
olwrYznTD37kK/648QMGn2O+Y9ajhunKSoNMkOb6MmUc124BVRO+2+R+46nmzNRC
XG0lzmhsGxrv2ECStqXP0fQKQLF4AwxUwo/Hsn+P+lusvTTA4zmHJxMpYDj+1QkX
5n71UCRjRztsHXoO2kLTYlrtJmasMeMerrojLo92V4IvhBWc0z7cqr5aDqJVPG9l
swgffAEkPJCqdm6cIckr4r40p59mOELz0eokuujYvdXlhkWgEvOjsPdxv8VpwsYj
KNOdRpg8ssqWMoQQ/rccJO4wIKe4xA==
=/qnV
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--
