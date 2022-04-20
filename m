Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB42050897C
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 15:42:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AC0018E8;
	Wed, 20 Apr 2022 15:41:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AC0018E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650462151;
	bh=Dcd35gd/yME79u472SK0FGJY8V4bi6shwSPiC4TSVYM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cRrTvj4fwOYdCJjhWF6MdDl3udJAK3SNrTCZGdnWZpbxp3plncgl4eF6XIcBrHTlU
	 ovDbQkHtpSBI2HWQNCM5inAoepo0DTkmTxM44TIhw1Etk51lgcn0U+JZO6Z2bIwxuQ
	 cIvQFwTAy/66EKdxffknNNABQHD30e10NxLj8ip8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF187F80128;
	Wed, 20 Apr 2022 15:41:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA996F80125; Wed, 20 Apr 2022 15:41:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 761A6F800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 15:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 761A6F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lwtH860n"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5238BB81ED6;
 Wed, 20 Apr 2022 13:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FCDC385A0;
 Wed, 20 Apr 2022 13:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650462086;
 bh=Dcd35gd/yME79u472SK0FGJY8V4bi6shwSPiC4TSVYM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lwtH860n3dkz9FoDyODSJfzkzBga/TavlHq0Yc0lsFLU4ZFhaFKDYLXAjtHQgqOSx
 QEuilni54niqFzOLIKU5LNS6bYINOEbarvCFkc83qDvM5fF336IlhAgKX1CyqqDRFc
 3GVMkl36yLXCJkzCgxMDqOc8kV2gCFcgcYe7JlfxAA/JVFkZeOLa7iIrXP4OwB2DWp
 qHyK8iD5owEszls2fy0KkZOLO0+hgekPZQdqma3pG5bDQaS8Tsv49inLOlHeDSyekC
 gVJi42BalPuXA3t3AIpMPn4qdYZsy8Dq7Bo/QZYVXnJN+JtVZyJfp5gJx/9kEpFAW6
 euiYppCrp31BQ==
Date: Wed, 20 Apr 2022 14:41:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl: Fix error handling in pcm030_fabric_probe
Message-ID: <YmANgcO9BMxp8PLC@sirena.org.uk>
References: <Yh90u+E3RTuGEDWU@sirena.org.uk>
 <20220420021855.8224-1-linmq006@gmail.com>
 <YmAD6MIuKdjgm7Yu@sirena.org.uk>
 <4e3309d9-879f-3385-3e8e-0fa1a31ddd9a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rm+GGDPp5GTQyZKB"
Content-Disposition: inline
In-Reply-To: <4e3309d9-879f-3385-3e8e-0fa1a31ddd9a@gmail.com>
X-Cookie: Will it improve my CASH FLOW?
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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


--rm+GGDPp5GTQyZKB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 20, 2022 at 09:35:55PM +0800, Miaoqian Lin wrote:
> On 2022/4/20 21:00, Mark Brown wrote:

> >> - rebase on top of commit 559089e0a93d ("vmalloc: replace VM_NO_HUGE_VMAP with VM_ALLOW_HUGE_VMAP")

> > Why rebase on top of that seemingly random commit?  Is there some sort
> > of dependency here?

> Hi, it the head of master in when I made this patch. It's because you pointed out

> that patch v1 doesn't apply against current code. But I am not sure what's the problem.

> So I ensure the codebase is up-to-date. If this patch have no conflict, you can ignore it.

Current code here is my git tree (-next is often a fair approximation) -
if people have been making changes since the merge window then often
code written against mainline won't apply and things need to be based on
people's current work.  You're looking for

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

--rm+GGDPp5GTQyZKB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJgDYAACgkQJNaLcl1U
h9Aevwf/ULNqXVQDbV8fuV6Qilw1nnp30Uhxr1swwNI5GZq806ylondesmsA/Bao
KcooPJ6fC01+V2mjTBdS2ixwZnNHBddgTRixaYW52BnFiul+dFi21NiD7K8Japhh
lkk+HGCAOhyBUOrOcSuHIKmof5UuBuzQh5ObwPWW5e7O+2jcy8p/CD5SdSWvrKrL
J9t4dWoBeBFXUnXzIieAbJ2A24P+RSteGoGsOhfbgkBGTxNihe63TSUY5rZYw7LX
0QswaM07k9hUACCJTHamwQTgjRIfMiYLQmgM70iCm4h+DsTcYcthrW5/cgcicvgC
hzJ0B1d6KbYrpQlk23vciyh9mHBQ0g==
=eH5c
-----END PGP SIGNATURE-----

--rm+GGDPp5GTQyZKB--
