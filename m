Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E621D978DC
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 14:10:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A6E7165D;
	Wed, 21 Aug 2019 14:09:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A6E7165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566389400;
	bh=PHVkuQQCakAZF3bfd5r9OzfS6UDV6Ll56k2m33gL9uY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RywFQZkxT3S9hIu0FmeYFe4pfbnWuqT1JtnVXQb17UhDXC2U34/iVMyxabFxD5Zdm
	 N230l+7ybb2mWY7dx2DxThoWXOngarxysrGPsEB832tLI0gEMcTXlJGXdr/QV/mJXi
	 JNTE/IaAruEJ2tJr/YPJC1H+9efoqggaAWqLDcA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BA6CF802FB;
	Wed, 21 Aug 2019 14:08:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68FDFF80306; Wed, 21 Aug 2019 14:08:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_30, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com
 [209.85.128.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A3E4F802E0
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 14:08:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A3E4F802E0
Received: by mail-wm1-f99.google.com with SMTP id o4so1858281wmh.2
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 05:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kCia8y54afQPSOKfbJ6YP0Hz0JmyKVXFLXw8vTgYgYA=;
 b=D6i5YjG8tlbcmu+b3v0NoY1c5Hzr8M6W/wwDpdet9fKiNOQiQYbguXVlSGGvyiWngw
 rszH2YlZHi2+UotP4JEFpmM7kHWqXJBgY1y1uTQG0rookQWUlp58P3WG7CbkNk1MBwSl
 pqnnHixw3U1rjLg0O+hiSXYBdiymL8Daa8C1YZvTJUZFo810WIiXkuTjax7O77C4a0cx
 X5+IQ/oBMH+QymcR79R9V2ex2lcWelifAlvkYyBjgrHZoE1UW4yGvjO+UFY+8smcFrY5
 HFrFWEO13ujVh0ql0VS3p8jlVPVdCF79cHo2tSMzTmXMO/J9VgWxZmEAyPXrpA370me2
 kgtw==
X-Gm-Message-State: APjAAAX+A0GbHDfXDE47wA7+ieh6mOX/HQ9B1tVNogcPezgyrqtrfaCU
 d5k6HXtkEB79Y/Hk26/S0aLKR0E5xWrk4OKgbEYmaB4kjF1KPxbqdJ7w/C2n11rTBg==
X-Google-Smtp-Source: APXvYqzuQ8bH+1TsxqU69uRaOBY2/y1+B6n2c5MTJ9/QfG2PsqZGzaDYCsMRsmkgt4FC5QflkDnHSyQCXkfS
X-Received: by 2002:a1c:2ec6:: with SMTP id u189mr5677124wmu.67.1566389289363; 
 Wed, 21 Aug 2019 05:08:09 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id b193sm25529wme.10.2019.08.21.05.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:08:09 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0PPN-00075k-2B; Wed, 21 Aug 2019 12:08:09 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 04C9E2742FCD; Wed, 21 Aug 2019 13:08:07 +0100 (BST)
Date: Wed, 21 Aug 2019 13:08:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Message-ID: <20190821120807.GG5128@sirena.co.uk>
References: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
 <26392af30b3e7b31ee48d5b867d45be8675db046.1566242458.git-series.maxime.ripard@bootlin.com>
 <c311e88a-fdd2-8a01-275e-675d98dc90ba@orpaltech.com>
 <20190821120551.r4b3h4nnet357wem@flea>
MIME-Version: 1.0
In-Reply-To: <20190821120551.r4b3h4nnet357wem@flea>
X-Cookie: Sic transit gloria Monday!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, codekipper@gmail.com, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org, Sergey Suloev <ssuloev@orpaltech.com>
Subject: Re: [alsa-devel] [PATCH 20/21] ASoC: sun4i-i2s: Add support for TDM
	slots
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
Content-Type: multipart/mixed; boundary="===============0465584979352920962=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0465584979352920962==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NY6JkbSqL3W9mApi"
Content-Disposition: inline


--NY6JkbSqL3W9mApi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2019 at 02:05:51PM +0200, Maxime Ripard wrote:
> On Tue, Aug 20, 2019 at 08:46:30AM +0300, Sergey Suloev wrote:

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

> > >   	.set_sysclk	= sun4i_i2s_set_sysclk,
> > > +	.set_tdm_slot	= sun4i_i2s_set_tdm_slot,
> > >   	.trigger	= sun4i_i2s_trigger,
> > >   };

> > it seems like you forgot to implement sun4i_i2s_dai_ops.set_bclk_ratio
> > because, as I far as I understand, it should alter tdm slots functionality
> > indirectly.

> As far as I can see, while this indeed changes a few things on the TDM
> setup, it's optional, orthogonal and it has a single user in the tree
> (some intel platform card).

> So I'd say that if someone ever needs it, we can have it, but it's not
> a blocker.

Yes, that's a compltely orthogonal callback.

--NY6JkbSqL3W9mApi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1dNCcACgkQJNaLcl1U
h9Bl8Af/Xm2Xa9YOa6VFkbJ3jgkINICtBABTxYvKltNwmT5BP8nOJkVXFq1TtdMz
N5EyBg9dN2luySAos4G/tu/IoD8MDAenPS9xiljA5EGVzZFq+Alw8RwJLAOhEhip
0jt3BiI6CIRL286m17Eb2WIvebAqPZVT7gbqVNXzaQsQInq6AQ8xQRGsb6OAYunw
p7LOLWJ4LAYxGrwgO6dlnyeRyDSbg5lg0jdWYldy8C+2G7q3AZZ1E6KIo4n5+TJd
JjTrKX9kx5ABzsBJyu/hQ6Zn0MCdC11AJZRBSfYzO+fE/1l49SqVHoD6MxEtWM5g
Ica+0kC+/XGk7S294y0Hi2hz4cwrOw==
=B3Db
-----END PGP SIGNATURE-----

--NY6JkbSqL3W9mApi--

--===============0465584979352920962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0465584979352920962==--
