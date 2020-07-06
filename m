Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 242822156A5
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 13:45:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4F241677;
	Mon,  6 Jul 2020 13:45:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4F241677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594035955;
	bh=0H/Ci4Yl7iO19bQj63isObhR+3JKKIzIIzqXWiKHn4Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QCNq9o24UKqYyl8BFNRceSVoEJNm0laSbsLLSXO0lly1MQuTv8OP1aUxQ0DLr2g9y
	 os0AbrVTufsEaWjZXFYz+P9lBp5rwQHXnvpp/kdNcBRmdToU7ib2LNXWFeKeIYIhrK
	 sBcsbSWaYgbG3sKSkrURdikRKh1t233Iw7yXnJZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAC35F80150;
	Mon,  6 Jul 2020 13:44:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6C21F8015A; Mon,  6 Jul 2020 13:44:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, PRX_BODY_4, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4981EF8010A
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 13:44:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4981EF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bax21XBo"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2B082075B;
 Mon,  6 Jul 2020 11:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594035848;
 bh=0H/Ci4Yl7iO19bQj63isObhR+3JKKIzIIzqXWiKHn4Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bax21XBoYtg09OgqEwpKq8jl7FrAnaaM6FUk6WVqXijIL5akmKIvBQhpFh6OQ8sv9
 y7yCyz/PlxGgpMzQELqP2le84UyWwo1CPdteZTAWGXx5Svg4xuRFwI++SAY5kW/z1a
 Jv0+FLvidDsrEDJkTMY5BVSVUG1ZDprKMHKNZDII=
Date: Mon, 6 Jul 2020 12:44:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Rohit Kumar <rohitkr@codeaurora.org>
Subject: Re: [PATCH v2 1/7] Documentation: device-tree: sound: Update
 lpass-cpu driver binding
Message-ID: <20200706114403.GA6176@sirena.org.uk>
References: <f44e2526-3497-7900-0db6-39b6b5af2d9b@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <f44e2526-3497-7900-0db6-39b6b5af2d9b@codeaurora.org>
X-Cookie: You will be married within a year.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org,
 Ajit Pandey <ajitp@codeaurora.org>, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org
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


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 06, 2020 at 04:59:39PM +0530, Rohit Kumar wrote:

> @Mark, I was planning to post v3 patchset series for this and keep yaml
> change as

My name is Mark.

> driver change will have checkpatch errors. Can you please suggest if should
> make

> first Documentation change in text file itself before driver change and
> finally have a

> patch to convert it to yaml at the end?

As ever make the YAML conversion the very last thing you do in your
series so it doesn't hold anything else up.

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8DDoMACgkQJNaLcl1U
h9BXMgf8DNoFvq0IrXAIU2aU8cf2VGs/LC+PJRHbN66SiyRr5VQSchf5GjLi71k+
BJ86YKPLly27ab3Xq/sDsHkNZ2nFi0LPQBJIdQxnm/cbY/iAnKYUxi3lj3OiPauA
NvWjfiWa/qCuixLhj8UOF2zkuEg9bKtboZ986MBvdAmSYzYMuERaSYCwh2rsYsv3
2/pBPzGieCWfQbTWEd8TTg17sgK0jPCwEePJlYlXZ6Rg2cF4MADj207FikGmS83O
1baJtYl84UR3aynPIvzNjX9JIkG3Ffks00738Y6PQ/PQfvg48iEQx0kXFfQzgKHo
2MRtuTCsphZrhghRuKAvOXsO04NkfQ==
=HNKc
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
