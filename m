Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E7B3B82B1
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jun 2021 15:09:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C839166F;
	Wed, 30 Jun 2021 15:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C839166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625058593;
	bh=Z2nw6jiTjjxeW96cOnxV0YFSFvsucNzdm5DxnNhbMy8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UvKbg0KVU4A9glcV9c2Y0Bp0YkllBM/qKy/AQ8EBuQBrNXxy+tKFFIgcUV8JScHRw
	 6vSnyJ4H1y/TzgUk79ru1S3K6F6FesNrtajBIeXePxavuj8l6zoOTq2ggz+514fVK3
	 H2zOQ2oVgGuzL6VWEKsmQg8Zp1POdwYHCgNCuSdc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50549F80156;
	Wed, 30 Jun 2021 15:08:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85488F80229; Wed, 30 Jun 2021 15:08:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7792AF8020C
 for <alsa-devel@alsa-project.org>; Wed, 30 Jun 2021 15:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7792AF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EkTHcCbN"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88DC661468;
 Wed, 30 Jun 2021 13:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625058488;
 bh=Z2nw6jiTjjxeW96cOnxV0YFSFvsucNzdm5DxnNhbMy8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EkTHcCbNuVgrdZ/smqLMEtWSosuFV0pYqpNcwaBqU9UUQg2uV4mHGgXg0RF59WdiS
 HwCjTLaC34ynDoRlMmC16AnBeD1l1EB2pcolhwgvnW9mQfn2iBBimNHBJHcPQWrDWE
 mmMMJdVEeAQNTOcIhzRWA7h760uYuznYLWystwNJaBR+eAcAGMdN3WpaPvYEI6yYXc
 cZN8xRecJGSU9m5XPLsOzzepTHReAS7EDbKiVrluB5An49kUU+vrhdoos+tuZpWWfb
 IstzOvygrpKGokK44d3BN9kSqSnv3Os+5rzGkhD3EGayIYKpHAh0gCGsKKK47OnZe7
 a/bNL3TQ7R1/Q==
Date: Wed, 30 Jun 2021 14:07:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: rt711: remap buttons
Message-ID: <20210630130739.GG5106@sirena.org.uk>
References: <20210617090809.16901-1-shumingf@realtek.com>
 <20210617123914.GD5067@sirena.org.uk>
 <d6374c5158c844d69b4f546fd741f07f@realtek.com>
 <20210617132716.GE5067@sirena.org.uk>
 <638be5ea-a310-3711-df08-798f7bee5804@linux.intel.com>
 <CAOReqxhDT8Z6jC89=m_Hka4diaxJqwhyKZmrVAw626wAAL72Fw@mail.gmail.com>
 <CAOReqxhY2zZJ4zsHvhHhDFuFawUnVtrcuuHiJ1g_n_0+7cMPcw@mail.gmail.com>
 <5c038789fe1f4903af3283bf47cfc9b5@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m1UC1K4AOz1Ywdkx"
Content-Disposition: inline
In-Reply-To: <5c038789fe1f4903af3283bf47cfc9b5@realtek.com>
X-Cookie: Use at own risk.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Curtis Malainey <cujomalainey@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "jairaj.arava@intel.com" <jairaj.arava@intel.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 Curtis Malainey <cujomalainey@chromium.org>, "Lu, Brent" <brent.lu@intel.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>
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


--m1UC1K4AOz1Ywdkx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 30, 2021 at 06:01:52AM +0000, Shuming [=E8=8C=83=E6=9B=B8=E9=8A=
=98] wrote:

> Do I need to resend the patch? Or any comments?

None of this has answered my original question - to repeat why would we
change the defaults in the CODEC driver given that the machines can
already set what they want anyway and apparently are already doing so?

--m1UC1K4AOz1Ywdkx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDcbJsACgkQJNaLcl1U
h9AawQf/etGPD1OWCfLuazlz9AMjOex48ExzOybVtQvzW3+GcrkFhwjlVxwcHAAI
Q/0CPpHBwLp9NOcca3X1CkX3GlZ4MfCuqSc/rS7qriop4uHDSAi+UH0z+/HqfZZv
3w02KDneFHAV6YrMqwPoO6h4PhlGo6aaZOtKxxdw//6hS1XbL14nJeMQ9q8yfnVq
wrg+YRHKLaOT4pbmWFgJyxwF9tXqfzno/lDuC3Tll8DKh5Ex5bTBQmraKmAydzTI
2ETu7h51elhS4tyA0QPgQ27gxhrVYt96Yj5iQeZABQOZnVyKgOoxmcH7Q5h8h/BK
UYT5hZR54gAblzriXEQ2qEw2HukEVQ==
=JBuf
-----END PGP SIGNATURE-----

--m1UC1K4AOz1Ywdkx--
