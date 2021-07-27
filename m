Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 185203D7AA6
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 18:13:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B059F1F1E;
	Tue, 27 Jul 2021 18:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B059F1F1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627402396;
	bh=8NvfuJawLzbM/fVF1eKVBvd0OVlOV+tspw22b+4ukNY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DQgIqmjOyk+u6OTkLJKyeSxzJ4T19Z+ZvJZxfmf19zB33f+N86mgWQJHF0RP97P8B
	 76dq4idtnRdSc0Ro8NHDMT/Zf26T70/6ehiclCdWx18KZskrXBv0EhP2Ddin/kypaH
	 I2aW22ezN0rVAiBFNqquMSNM+bCG4DKyoDSSE5BM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DCC1F80276;
	Tue, 27 Jul 2021 18:11:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45895F8026C; Tue, 27 Jul 2021 18:11:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C94EEF80159
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 18:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C94EEF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Xqa+fbPN"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FEDA61B08;
 Tue, 27 Jul 2021 16:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627402302;
 bh=8NvfuJawLzbM/fVF1eKVBvd0OVlOV+tspw22b+4ukNY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xqa+fbPNxfGShpPstJU7hTPpS3PVcEgDtgCMvkg0BH2ldKXISaEIuuJK2xGDoztZb
 lGx7h1ngNiVBeO2zLX29X8HT3B3huMBnmgWaiuJv5JtQZK+15cuk3R0gM2AuvH1p7/
 ZhnUgn8CvUhn3d+axvNcSGywgjh/6W8D4JG87QvFYcQDhfP9hhVbc6miQPy5Bum5Vl
 qFXX97qDhzC+GKdZX9XWe8GgwMrZm/0BfVPKtGPXYybN1Cis/ubAGhp9hNqLiQGVB4
 lvFrSmDqc0CjrgfIcYrnCIsW0y5M7z2BGpSSjoGX1aHxoLORf+i8HeD+TXfdHTUd3B
 piTwYs3JCQObw==
Date: Tue, 27 Jul 2021 17:11:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 0/6] soundwire/ASoC: abstract platform-dependent bases
Message-ID: <20210727161133.GY4670@sirena.org.uk>
References: <20210723115451.7245-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ECAkxgSy0pGoHfdA"
Content-Disposition: inline
In-Reply-To: <20210723115451.7245-1-yung-chuan.liao@linux.intel.com>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org,
 sanyog.r.kale@intel.com, bard.liao@intel.com
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


--ECAkxgSy0pGoHfdA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 23, 2021 at 07:54:45PM +0800, Bard Liao wrote:
> shim base and alh base are platform-dependent. This series suggests
> to use variables for those bases. It allows us to use different bases
> for new platforms.

The ASoC bits look fine to me, what't eh plan for merging this?  I can
apply to ASoC if people like, or should the Soundwire bits go via the
Soundwire tree?

--ECAkxgSy0pGoHfdA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEAMDQACgkQJNaLcl1U
h9CdKAf6AtOXcvqOdSyUtr2jdrGRPbpwr3waPLn4GDw04ZKgYdJrho0PBzAxlxaB
d0EQAW4ObIVUvo6T7TdeLXmm4fmG2Vw1g3tWpBlRQCEy0LW0vr+SlIvRWf3HrUnd
49125Ol3XCBcQOFtIY4EDnUsSeV77MZiY4O+vwHqMC16p4fYS17CMPfuw9dTrOEc
rSm7F6KG7umoXFKegbHqEIp2x7eSPmYNI6EcfaIo6dMDVcHB5auiUo89pMZM3T/b
c47Pgb3iDAiYXk8+qL+6A2Pd0p5CVmLVFG+JSP8GnJw3okpHw4IMdclRtRrEQj9G
flvy6V2bpUwCWiHrGTI7U5X1SAw37w==
=Wttv
-----END PGP SIGNATURE-----

--ECAkxgSy0pGoHfdA--
