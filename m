Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 290BE2FA0B2
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 14:06:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B61A21805;
	Mon, 18 Jan 2021 14:05:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B61A21805
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610975200;
	bh=Ea7zAeD0W2JXkKfuviF+qzxlHAccbXfdUv0SX8nfKeQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K40XEelUcGRx8qmeki9mGDAsLtAmu13h42XLVZCvartXIr/MbhU9u7tLAEPyjkvfh
	 Ge/n1bBrbnsuXYyLiaWISrgm7l9raS10szHRyixbYDzQCLLGv1S540iIFZS5Ns+nAh
	 RHT9AuAcPgAePdEzKo3nbPRfmMawohd7vdtKoLmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CC58F800C0;
	Mon, 18 Jan 2021 14:05:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98030F8016E; Mon, 18 Jan 2021 14:05:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C47D8F800C0
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 14:05:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C47D8F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a39Hi06L"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36D6420829;
 Mon, 18 Jan 2021 13:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610975101;
 bh=Ea7zAeD0W2JXkKfuviF+qzxlHAccbXfdUv0SX8nfKeQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a39Hi06L6q6v3p+C6WGHvD0UofceBo//87oBfeypqbjmdV4e2/y1m9mcSF07uH0RP
 rCHWzJrJaTCnoZLzHjcOgjqrYIyo4A2an5tQJ3WUFLSHo2VxO6198O2sglNPEhS4UZ
 B9jd2CwHlVLc/LWPztVJocvWyFZOquHw5fFlYGQzYF3FGrRIWr2X9FOLlKAREGDfYw
 QIAOjtsF4tlcoxenWXyUP6XazsOKC1SNIeEiiDhdyttcp7hXHMNHpJrtgkIpl94zjN
 WEzEzoF9txOAmJUSUGnvsnflbo1Lwh6AY+dHAuHlxsPORuLcqOzlvpUzyEqMS+LVLt
 Nl85IafZ/Srlw==
Date: Mon, 18 Jan 2021 13:04:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Subject: Re: [PATCH] dt-bindings: sound: intel, keembay-i2s: Fix dt binding
 errors
Message-ID: <20210118130424.GJ4455@sirena.org.uk>
References: <20210118102706.6125-1-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cDtQGJ/EJIRf/Cpq"
Content-Disposition: inline
In-Reply-To: <20210118102706.6125-1-michael.wei.hong.sit@intel.com>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 jee.heng.sia@intel.com
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


--cDtQGJ/EJIRf/Cpq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 18, 2021 at 06:27:06PM +0800, Michael Sit Wei Hong wrote:
> Fix devicetree binding errors caused by newly added parameters

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--cDtQGJ/EJIRf/Cpq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAFh1cACgkQJNaLcl1U
h9A6XQf9GtZjCWlI7YfCn62jV4IPQkLrSMGEvmvesAWCZJ8bZsUfl+PS6hRItois
gUfRN0jalhE0YhxW2WLocyfrZlZ6MYD5ECLJr1pMKFYjjKZnzW+IGQqeqiuhpmHk
7mxll4TGGIAEjKy2G79D6cMEEun6F52eymq4l/zc/2iNcTjFHUnBT6+CvikbGSLw
mjD6FnG3EF4XAt/EgAmhdYcaaqn2QimbyZ1pK8IF77aFwyUXO8ZNVYeJpxcZiAjH
YYxl+AyYjD47XV/bnQ4X+XtIqitDEON2w3nORHaUtZwTKiKa/HST6111sLag6Qi3
afhkKCeoziIpUiHKWF1dKQdRjm+n3Q==
=DWAh
-----END PGP SIGNATURE-----

--cDtQGJ/EJIRf/Cpq--
