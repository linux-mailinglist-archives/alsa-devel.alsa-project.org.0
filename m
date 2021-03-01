Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 163D83286BA
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 18:17:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A38961660;
	Mon,  1 Mar 2021 18:16:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A38961660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614619019;
	bh=OUgGRkLl/hOSzPKNv3nNLuyPs51rf6GgV/wlMIsSb54=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YPoqFE6SVeVNyFG0qFO8DAWVlaDNEBaNNm9710R/SibEni2U701qc6dY9b/qSCXIK
	 9l6KUhs42lclGIlDPXHxTcQDYlWL9xP+17VG67DPxzFfSJqWlWtCbnyJ/Cc7Fq1EYK
	 7e72gqWzbMM1HPtLdAbDRJhTcToAonPot6TbQIQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 197B2F800E0;
	Mon,  1 Mar 2021 18:15:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E7F1F8025E; Mon,  1 Mar 2021 18:15:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93F18F800E0
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 18:15:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93F18F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YYFn6xkv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 036AE64DE0;
 Mon,  1 Mar 2021 17:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614618922;
 bh=OUgGRkLl/hOSzPKNv3nNLuyPs51rf6GgV/wlMIsSb54=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YYFn6xkvTIfePGM6mTZdxElEIQIEdG0WU9uQaYgD4l4ywNGRfhXgLjEi2a5OM70Ch
 a2q3TMeuzxuYynrtpSKLHdbTbHl0RKhF3AjDMaw2rNFNNOQPZU+OGIR5F7kK06ScPq
 MRmfDRyJGB9LwTV5GJ1vWlZxLsyFYMnXFlN6nDvP/F+B4crRmk7oAtCS+poy+4tJYW
 CdIEs5DjodByeVHSKPeR1CNr+MUictH9beYQ4xJst+1XXbDPCw5JfR6tMqKS8zXvsQ
 DPQ6TVzFPRbaGUDV7u6j+Emv2BedelwWHwFP1iXGTd1nyTYmuasBT59XJlbdA3WsvK
 HkdbEjb+Yp7ig==
Date: Mon, 1 Mar 2021 17:14:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: codecs: nau8825: fix kernel-doc
Message-ID: <20210301171416.GF4628@sirena.org.uk>
References: <20210301165349.114952-1-pierre-louis.bossart@linux.intel.com>
 <20210301165349.114952-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eNMatiwYGLtwo1cJ"
Content-Disposition: inline
In-Reply-To: <20210301165349.114952-2-pierre-louis.bossart@linux.intel.com>
X-Cookie: Body by Nautilus, Brain by Mattel.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, vkoul@kernel.org
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


--eNMatiwYGLtwo1cJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 01, 2021 at 10:53:46AM -0600, Pierre-Louis Bossart wrote:
> v5.12-rc1 flags new warnings with make W=1, fix missing or broken
> function descriptors.

You've sent five patches (for multiple subsystems) in a thread but not
as a series - please don't do this, it confuses tools like b4 since they
can't figure out if this is a series or multiple revisions of a single
patch.  Please don't do this, if things are a series send them as such
or if it's a collection of unrelated patches send them separately.

--eNMatiwYGLtwo1cJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA9IOcACgkQJNaLcl1U
h9AqQAf/WlcTUojHRsOO0bYNNYW/C9y5uDyqTiy71lsrMkKyRQ/TQ3CXhfnflscN
imwgt4zjwYOwtuuyGucsI4ICo62iYsjXbzG66eBk3NxMnBWhL/e/ge/LOK0oo12T
h7KxZHRRsJ9l9X9cN4SbfNaJ/ZF9mzSFaB4IiIQ8ZI0UYvlnH0umqfCifrI9aJU0
Ylm3pHEM04tpaPyLrvqDX/apqDwcyXytU+i5IAjOZBJigOizI9kl4A+w123Bf/OW
+yc3pTm5gXW0gJlc+1Fu0mVtAgsB4sIgSKk9LmctIbAKT7786vgvjomY6plqOl+a
cLtyVthSGpr4xMh+ppKKAGZ6+UpTeg==
=w5Wg
-----END PGP SIGNATURE-----

--eNMatiwYGLtwo1cJ--
