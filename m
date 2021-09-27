Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A78419AE1
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:12:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BBDF16AB;
	Mon, 27 Sep 2021 19:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BBDF16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632762769;
	bh=YIj1ttTgSoJXrNem4LCwjOWEjR6amIHkBClahFPqxCk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U96TGDM3CgbNs+0+rZ5EaYZHZZHtpcSPws+a+OVRWAmYkVQy1KuppTzMcVvr3jKhu
	 EmdqE8Ar1vn8SFbZ+2oMVnYf1KPBl6AdxqmaQqfVLGGgMdxGsJescmwdX83ntuGt/5
	 YXRtdEYuPQuI9PbjsNfdD/+WZIpg+kDsaJ7OHToQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DDC0F80147;
	Mon, 27 Sep 2021 19:11:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4164F80227; Mon, 27 Sep 2021 19:11:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38EDDF801EC
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38EDDF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bQpDrq44"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4496161206;
 Mon, 27 Sep 2021 17:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632762681;
 bh=YIj1ttTgSoJXrNem4LCwjOWEjR6amIHkBClahFPqxCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bQpDrq44YdtHSTvkRChK+pqC47EzUI7ZnD4oL00JGKT33Qh/Pkbvl4z2RdNK62AKc
 YeJ1pY7WhZckso1550bSxgeLJ0r7PDhOG4pPgctajdWKxELzDyh36ficRuBkmqEidE
 h6kLnYXUj0M91IT9atxCCR8Vs6ZZdViovIKstvJLRfcewf/0p+1/yaec79p8vqQA93
 wddJnDJH7KEBkTLLVYdZbU8xOh7J8ex/lrGw0IRVtMrS3YUpQ/1H0Ntpa6e4EU0onP
 lkC4SeM+xHLEXecYQkh4cqlhptFqOs1T8vGZXvfUaZrKFwbKCGt9UfwBGv6SVvV7yc
 giILeUx6mEyvQ==
Date: Mon, 27 Sep 2021 18:10:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty before
 entering sleep
Message-ID: <20210927171033.GF4199@sirena.org.uk>
References: <20210924221305.17886-1-ryans.lee@maximintegrated.com>
 <1b21bbf1-12c7-726d-bff8-76ec88ff8635@linux.intel.com>
 <SJ0PR11MB566107A6AB3D18ABDEDCF245E7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
 <20210927160622.GE4199@sirena.org.uk>
 <7b8c3875-3f12-f3cb-7da8-4e850e59ee2b@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vA66WO2vHvL/CRSR"
Content-Disposition: inline
In-Reply-To: <7b8c3875-3f12-f3cb-7da8-4e850e59ee2b@linux.intel.com>
X-Cookie: 98% lean.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "guennadi.liakhovetski@linux.intel.com"
 <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 Ryan Lee <RyanS.Lee@maximintegrated.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
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


--vA66WO2vHvL/CRSR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 27, 2021 at 11:48:56AM -0500, Pierre-Louis Bossart wrote:
> On 9/27/21 11:06 AM, Mark Brown wrote:

> > More specifically what it does is make the invalidation of the register
> > cache unconditional.  It doesn't really matter if the invalidation is
> > done on suspend or resume, so long as it happens before we attempt to
> > resync - this could also be done by deleting the first_hw_init check.

> Mark, that's exactly my point: if the amp rejoins the bus, we will
> *always* mark the cache as dirty, before the resync is done in the
> resume sequence.

Ah, yes - I see.

> I am really trying to figure out if we have a major flaw in the resume
> sequence and why things are different in the case of the Maxim amp.

> Instead of changing the suspend sequence, can we please try to modify
> the max98373_io_init() routine to unconditionally flag the cache as
> dirty, maybe this points to a problem with the management of the
> max98373->first_hw_init flag.

A quick survey of other drivers suggests that this pattern should be
factored out into some helpers as it looks like there's several ways of
implementing it that look very similar but not quite the same...

--vA66WO2vHvL/CRSR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFR+wgACgkQJNaLcl1U
h9A6bgf/cTWeKoYgzRvwlZJiKiKpOgHaFh+QmrmyBmmUJXA6VH6m0Fze8+zv238K
RxgyPpu8fmSAZ+7QuLhbVl6G9dUKV1WSQM7QirWFidSndmUBEUmHfrkREVMn0N7I
vWYkFVrWqlbxCPbh8s4H3bwFKZCbz4HQDnhKJH/Q5VhAMVSKEt22ybcZDUEvCzrB
z+fu8ayfDdfbUeJ+/mQJIUdOm9vC9/iHZz5K2EU7Jh1JFQyOsKM7h+pVh51DMe5e
p+GuZtmivYRLr7OA74wKxRMwstKwPJ0oZClBxdKvMZfZ4j3n+BET+28YxSMZMZXB
yUa/XvmUfCcybDNwVsFuVnqVjug5aQ==
=gqsX
-----END PGP SIGNATURE-----

--vA66WO2vHvL/CRSR--
