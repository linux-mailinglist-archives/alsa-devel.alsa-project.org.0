Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2999D3C88AC
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 18:31:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C98901670;
	Wed, 14 Jul 2021 18:30:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C98901670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626280280;
	bh=pmQetu+Bir8TxMBj+0fiQ8Bjc4bVEbxamtjh0p8vBxY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uidUosze/pLedWwJFG/TDjmNSJut+yRPoDH42YgOgWD3w6rJLMOQRaO9pV7WcEBOe
	 vVwSK5bQJo22VE207BldRCHt0zTJfveB2qXtmZhpPlWcp07uW5Q1zPlcgp/8HSC6l0
	 ABc8GU7UeLMbcNTOQEc2h+tFKoTGhDdCnF3yuKRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AD96F8025B;
	Wed, 14 Jul 2021 18:29:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A86CF80254; Wed, 14 Jul 2021 18:29:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4E5DF800D3
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 18:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4E5DF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZryUHeq/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B9A8613AF;
 Wed, 14 Jul 2021 16:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626280178;
 bh=pmQetu+Bir8TxMBj+0fiQ8Bjc4bVEbxamtjh0p8vBxY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZryUHeq/hyh6nZg+WCjZjGBej0gnLhVOBxT7tySR1TH9knORamI6mIxWA2QUfwx/o
 ThCbYmNn0hjo/uZbEEQ9Zkv7meZpR5mTLCammWE/vS9mc1bcKsxdOVi/4R7AE87jM2
 nknVGxDkK+/L+Es03Vw42xZ+7RTMGojSlzIvbiv+UW7S6+7yuwLASW95D7CPW534+7
 puphms/4fratOIyDsnRPAwDeYT7yryc6wKpTEzviTDw5TLGGhlCa0NVtnsj3zvVW2n
 wx1c6Udk/3bpPrDEbu1I0FjyhiXxcouG+TadNyhiwr5A3upDD5/GhV6X7yLeCLMPnL
 gJ66D3By2nfbg==
Date: Wed, 14 Jul 2021 17:29:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 2/2] ALSA: compress: Initialize mutex in snd_compress_new()
Message-ID: <20210714162901.GF4719@sirena.org.uk>
References: <20210714162424.4412-1-tiwai@suse.de>
 <20210714162424.4412-3-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KJY2Ze80yH5MUxol"
Content-Disposition: inline
In-Reply-To: <20210714162424.4412-3-tiwai@suse.de>
X-Cookie: C for yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Vinod Koul <vkoul@kernel.org>
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


--KJY2Ze80yH5MUxol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 14, 2021 at 06:24:24PM +0200, Takashi Iwai wrote:
> Currently the snd_compr.lock mutex isn't initialized in the API
> functions although the lock is used many places in other code in
> compress offload API.  It's because the object was expected to be
> initialized via snd_compress_register(), but this was never used by
> ASoC, which is the only user.  Instead, ASoC initializes the mutex by
> itself, and this is error-prone.

Reviewed-by: Mark Brown <broonie@kernel.org>

--KJY2Ze80yH5MUxol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDvEM0ACgkQJNaLcl1U
h9DsdQf8DPO4wkGqNtQ7M/uGD9u0/JtlzJQT1YkJ6bbq7dOCWuZQHCP9fiR0QGVv
0Gz5kiI5zpvfxpQEduIxxn1SQ0g5xy9PledC/BJ3Xb3CmWIwqx+DPtxr094RzW+x
jWWYYuDNekn+QrpCaOh4TDDENV9CMtEY8ymTzPdmSGx7BbUn7fui6aCBRRDd3kRV
Oj5l8s8EbdNEasTRLynkq4c4fImtuxrokos6Rv48QiZkQl0GqWD+97cE+TpdYzIM
/7uQ0e8bY9oTJKYe6h2036MI6nnXFH9oCMfD9MYdE1azi/ogY4nsVkCYAxiuVr0D
EC0nTS9EomDNV6jvX7Q+8AyPqSDeYQ==
=ihlo
-----END PGP SIGNATURE-----

--KJY2Ze80yH5MUxol--
