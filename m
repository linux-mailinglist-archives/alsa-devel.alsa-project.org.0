Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BADC93646BF
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 17:09:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 315D1167A;
	Mon, 19 Apr 2021 17:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 315D1167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618844949;
	bh=YUbe1J3aXgVRuK8O1Z/Qzwwks4IuxqFizF46Zio5gZY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o2Wt7lpyU4lssKTTtBLuAr2S+h/mmfzPSNqiYcHP3QjHyKUh1I64IW0oUm69gV76F
	 WfKif9YgrxLP6QnYdNXebc/F4ttRl4/nZZo1wyygWmiAefRSeJ3iIzMjAhu5jAvl08
	 VuYMLWIRc4f2nAMjpSFadlUBOO+V8CiIuzRUEWuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B8A1F8019B;
	Mon, 19 Apr 2021 17:07:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5524F80227; Mon, 19 Apr 2021 17:07:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B1C9F800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 17:07:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B1C9F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NFBHTdtV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7952861007;
 Mon, 19 Apr 2021 15:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618844851;
 bh=YUbe1J3aXgVRuK8O1Z/Qzwwks4IuxqFizF46Zio5gZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NFBHTdtVNwS80fy5MGVLrHzah4IqMBfmX37OOFTAOfX4kTLIuUpzomcDWOiyOmrIE
 q9EfpuezbMFWgOWCmyWS3ITR70b9rp3H1vtWS6KDyenqO6FuDia7napOuh1QJ2n33i
 Ok1zCTl+H6Y9wgsBt1rbXgn/xNaD7OBpr7Pc/BFnZAjJXqfWFHmS+0G5ePvEdbMFZn
 zyWMn23xUdJwjGu9lJrdR8xAld3IUJWYIIxIsCfGyn7T9WmdCoLAEXH0G+MEQSydxK
 JFEyKnktef1O1bsBVjFNnfHVngrKOhoojWGKAKvMyJcAnFNKMqucmehBAidLHGRqSf
 rDWpru33Dtlqg==
Date: Mon, 19 Apr 2021 16:07:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
Message-ID: <20210419150705.GB5645@sirena.org.uk>
References: <5e1fb981-48c1-7d5a-79a6-ba54bac26165@microchip.com>
 <4f401536-5a66-0d65-30cb-7ecf6b235539@microchip.com>
 <20210415161743.GH5514@sirena.org.uk>
 <1aff49d4-5691-67cb-3fe7-979d476f1edb@microchip.com>
 <20210415172554.GI5514@sirena.org.uk>
 <ad5d556b-601f-c6f6-347e-86a235237c02@microchip.com>
 <20210416163131.GI5560@sirena.org.uk>
 <79161044-26b2-729a-b831-b79cc238e239@linux.intel.com>
 <20210416185538.GK5560@sirena.org.uk>
 <dfcf8b69-6ede-7344-79c0-cb572e03359c@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline
In-Reply-To: <dfcf8b69-6ede-7344-79c0-cb572e03359c@linux.intel.com>
X-Cookie: I will never lie to you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, gustavoars@kernel.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, Codrin.Ciubotariu@microchip.com,
 mirq-linux@rere.qmqm.pl
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


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 16, 2021 at 02:39:25PM -0500, Pierre-Louis Bossart wrote:
> On 4/16/21 1:55 PM, Mark Brown wrote:

> > to the maximum supported bit width for internal operation so bit width
> > only matters on external interfaces) but I think for a first pass we can
> > get away with forcing everything other than what DPCM has as front ends
> > into static configurations.

> You lost me on the last sentence. did you mean "forcing everything into
> static configurations except for what DPCM has as front-ends"?

Yes...

> It may already be too late for static configurations, Intel, NXP and others
> have started to enable cases where the dailink configuration varies.

Well, they won't be able to use any new stuff until someone implements
support for dynamic configurations in the new stuff.

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB9nJkACgkQJNaLcl1U
h9AjtQf/YjGD5sr+aOXRfydBHJwcAvkfXdxmoMabMzf9FRfzTWoyRi4oYu5l67Ha
dTKFT/VRaUHA9GZsb543N8j/aXhD+TIHZCZW3uxaLx62GXeGF4YKVrIg/8g0Oiyi
+jOcUJzH/1x2ZXWL+9KG44xT4GSdoAR1kAsh5izyofvrBkeqmT/WqRJb6JCrN3sb
2okmBkrNCTYWkvq65nnjyjbdHDkhEeuiA8zayG1IMceTc7NeVgDr4OuY8vmvtMkA
5BXOU2iWfi41nkBTd7ux+Gv60Fz7JsCFd+KVUOO6dr5FoqAokPrrG03mD0K8sCfq
OsxqdxDTUzXqYKYY+m95P6u5vRIDGg==
=3kYe
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
