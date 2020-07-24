Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF2B22C5B6
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 15:04:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B449A168A;
	Fri, 24 Jul 2020 15:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B449A168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595595842;
	bh=CT3kJd1MVqXnPYiZORFlfInUGpovklHtPZAv5w59S7Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gcjZXePxIX3V8PkkTMOPZnx3lJUspxyNDylam/zyc2OJYPU3Baj8QBUj2eGE30fHn
	 r1OkZP8d/DSJ51u1TVrbNE9/K4cE3I3hHAIHK/gO/vB+6ZTuIRuXNIHbDOREcfp4Z4
	 qER0yiDkQAl7eu4oOTXDt36v8ExOl8Entzv5PAdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDF4DF80150;
	Fri, 24 Jul 2020 15:02:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16BC6F8014C; Fri, 24 Jul 2020 15:02:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D53FFF800CE
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 15:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D53FFF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yih6vnsy"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96AC42065E;
 Fri, 24 Jul 2020 13:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595595726;
 bh=CT3kJd1MVqXnPYiZORFlfInUGpovklHtPZAv5w59S7Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yih6vnsy6ym1vz2+Wl2FhQQjn/l3dvbGv8MQLrpb7db0Yf9xbWnVCsz2oi59avBEM
 CJdx+Eh73rF6cl91YwI35bJ9JM+HkmlHwYvzhhU0zqsCbuQS/FP+s3oiHgYyHVAP+B
 Twx/NH1bFvqL+QfQCK6ismwv/FhecE75L9Cc4bdM=
Date: Fri, 24 Jul 2020 14:01:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] ASoC: dapm: don't call pm_runtime_* on card device
Message-ID: <20200724130151.GG5664@sirena.org.uk>
References: <20200724070731.451377-1-tzungbi@google.com>
 <20200724111634.GB5664@sirena.org.uk>
 <CA+Px+wU-R2qOFK8RhLzTXTqDheZhzOyKuiR-1S9qXj02QdruAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jt0yj30bxbg11sci"
Content-Disposition: inline
In-Reply-To: <CA+Px+wU-R2qOFK8RhLzTXTqDheZhzOyKuiR-1S9qXj02QdruAA@mail.gmail.com>
X-Cookie: You will wish you hadn't.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--jt0yj30bxbg11sci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 24, 2020 at 08:26:13PM +0800, Tzung-Bi Shih wrote:
> On Fri, Jul 24, 2020 at 7:16 PM Mark Brown <broonie@kernel.org> wrote:

> > Why is this a good fix, as opposed to only skipping the set_bias_level()
> > bit?

> Did you mean: skip to call snd_soc_dapm_set_bias_level() in
> dapm_pre_sequence_async() and dapm_post_sequence_async()?

No, I mean why not just add the missing puts which are currently being
skipped due to being caught up with the bias level changes.

--jt0yj30bxbg11sci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8a274ACgkQJNaLcl1U
h9AoHAf9H7byq5hdBVcD7CU372Q/Hg7BAxu4cHvndfJdS1aLLSAQSK/nbFT6Yt7N
WrUFdxkBv/YdztQObTB7DStCdefjWe5y5KeAUbAL8ctB9Jv3DmJJMgJyNnp9wykG
jAIKfSjsOOYFDizfiZpM++xTJBITpWAVIr96bZg6sdWROS5HEJHEZtu+qq+FKSmb
GojNuZjj34ZusjQHHonaD5cGVq6lJGWRViuWx7S5i7t2PF6S4ucQK9TWBrGlN9HU
L5+673M5UVobMDEE36hO0z+FCfnWx8KWFW6y/seYVqtZCOuv6TDoB2YzglC0LPAH
gH/GlFukx3hqzxZ76NjkXBkGvZe/BA==
=F/Bo
-----END PGP SIGNATURE-----

--jt0yj30bxbg11sci--
