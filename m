Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4E1241AEF
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 14:26:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64A8F1666;
	Tue, 11 Aug 2020 14:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64A8F1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597148813;
	bh=UEN4jJ44IQpR0oEbe7kFtnmV+ebGwMThzWk5GJb3sMk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bzr/Nqem3r/eG3znSXYrvq5WplshNPyXXScEl4iL+D7xgKV1Qj2A0oOAgX/YP/yVB
	 flCejulQjTCn+LXT2TUg25OjHT9mWDBxafM9/Cc0oR2IDGwtlC0yigAsaSUJo6Gmev
	 ui/mtGFrcGDYD7s26ojkMEiMgcjNRIMtuDZTVqUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76E65F8015B;
	Tue, 11 Aug 2020 14:25:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3BF2F8015B; Tue, 11 Aug 2020 14:25:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 050C5F800BC
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 14:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 050C5F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jjk5nGh6"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52EF6206C3;
 Tue, 11 Aug 2020 12:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597148698;
 bh=UEN4jJ44IQpR0oEbe7kFtnmV+ebGwMThzWk5GJb3sMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jjk5nGh6bBqd1lcXIiXCYC13xq9blsxmjW4F52a+YozgcFNgF0a3RzuSbsrHNM9np
 9SGSKAJBuRKGJkbRoYEcA9SeHbIXnmOKv+Bga2s8Bg0AnBfIjcvX/uIpEqArbIH6qx
 3m2LkcP1BUWZmRMB2iApTpjiiwhHvvbuLN1wAy8I=
Date: Tue, 11 Aug 2020 13:24:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH v2 01/13] ASoC: Intel: Add catpt device
Message-ID: <20200811122430.GF6967@sirena.org.uk>
References: <20200811100034.6875-1-cezary.rojewski@intel.com>
 <20200811100034.6875-2-cezary.rojewski@intel.com>
 <76ca9300-f995-f5c3-48c4-6cc22f7a80c3@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5CUMAwwhRxlRszMD"
Content-Disposition: inline
In-Reply-To: <76ca9300-f995-f5c3-48c4-6cc22f7a80c3@linux.intel.com>
X-Cookie: Gravity is a myth, the Earth sucks.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, lgirdwood@gmail.com,
 ppapierkowski@habana.ai, marcin.barlik@intel.com, zwisler@google.com,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 filip.proborszcz@intel.com, michal.wasko@intel.com, tiwai@suse.com,
 krzysztof.hejmowski@intel.com, cujomalainey@chromium.org,
 vamshi.krishna.gopal@intel.com
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


--5CUMAwwhRxlRszMD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2020 at 02:17:08PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> On 8/11/2020 12:00 PM, Cezary Rojewski wrote:

> > +/* SPDX-License-Identifier: GPL-2.0-only

> If we are making sure that SPDX headers are correct, from what I remember
> SPDX identifier should be a separate comment line, even if followed by
> comment. Checkpatch doesn't seem to care and I can't find anything

Yes, it should.

--5CUMAwwhRxlRszMD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8yjf0ACgkQJNaLcl1U
h9CCfQf9HmAe7+y/ptlW2ZZPvi15RjI8Undn5LlJB5nZcAHkozu2jY3ZJOoIOOuo
rwrppqsshqA49z7EBeZ4W+pwoNMrApfOiww4wyhyRPKqRy4EfLGkYor+TBK5BQlq
TH7PTAosE79pdEuAa1ZWI5NAkM5K+u8UDysMGoMwYZnfle/dvYV3SllGcFgo6aaY
EyXf5T8lIHw0cBM3zjsvC5didGyaSFPzCvbPpjbpcdBkERdbuxHpmz3TSJ/XKJNl
HF3IiJrI7/KLYO/yb1XGVMv9PUiqftAcGTKNWpHU9HdC4IVXO/HMPpMDUjwn/Q+k
y7Zpk9zN4HzvGF2/Wlrlcs1elkJZUQ==
=Wgz5
-----END PGP SIGNATURE-----

--5CUMAwwhRxlRszMD--
