Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BBD241CC8
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 16:56:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAFE284B;
	Tue, 11 Aug 2020 16:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAFE284B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597157774;
	bh=Zl1pJ2DFMmfKMyJErLFYhmOgyXO6PRB0VQI/KuGEDw0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ebLeb7G4ozwZvLgM6I1ZWz4kG76RdGYoqElke8eCBQh9rmH1RMQ8Nolbw2bDVh8kr
	 fc6+5sQoAS4MxBljp8gUQ+w4kqF8es9QbZmh9Y+sHe4bFe1uZ0QFzYfBTo1X71aCzp
	 hWv7oP9aSDQ8eR/v8fK9O2SEYwhB/jlKUAigps6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D265EF8014C;
	Tue, 11 Aug 2020 16:54:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5782F8015B; Tue, 11 Aug 2020 16:54:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B64FF800BC
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 16:54:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B64FF800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iH7qbb0G"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B3B492083B;
 Tue, 11 Aug 2020 14:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597157661;
 bh=Zl1pJ2DFMmfKMyJErLFYhmOgyXO6PRB0VQI/KuGEDw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iH7qbb0GzuMV9fPw7/HNe4Txfq+eGeS0iW+h2zR9twWkwrCwj6bRX/czJr6xvZmxO
 BJhNNJLU0wdnPYenJjKjIfSaNWPOJfypoLhQb4DrxzJtSR5eW4EKVvcU3DmrjWI4kE
 ZJXvf1YeXxKuNSeNN5/3K+lEqj30omp1+1UMbIKw=
Date: Tue, 11 Aug 2020 15:53:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Subject: Re: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
Message-ID: <20200811145353.GG6967@sirena.org.uk>
References: <6466847a-8aae-24f7-d727-36ba75e95f98@linux.intel.com>
 <DM6PR11MB364259049769F6EF3B84AABD97480@DM6PR11MB3642.namprd11.prod.outlook.com>
 <3f3baf5e-f73d-9cd6-cbfb-36746071e126@linux.intel.com>
 <CAGvk5PohOP0Yv22tb53EX=ZLB9_vOMb=iujTh64OvHmjC1d4mg@mail.gmail.com>
 <DM6PR11MB3642AC7F8EC47EB48B384D4797450@DM6PR11MB3642.namprd11.prod.outlook.com>
 <CAGvk5PogmqfEnFRA8hzby+AGgbOSvbELamh_1=eA9KTpyBMPYQ@mail.gmail.com>
 <s5htux939x1.wl-tiwai@suse.de>
 <CAGvk5PpcmkZ2HarqeCDaXm4id=84wYs-u4vWxJunHaf09gj66g@mail.gmail.com>
 <s5ho8nh37br.wl-tiwai@suse.de>
 <CAGvk5PphzkdiNfW8hiDuqX+2eQO2FvrpzA0qR3=3VvqM3GBhAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5L6AZ1aJH5mDrqCQ"
Content-Disposition: inline
In-Reply-To: <CAGvk5PphzkdiNfW8hiDuqX+2eQO2FvrpzA0qR3=3VvqM3GBhAA@mail.gmail.com>
X-Cookie: Gravity is a myth, the Earth sucks.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>, "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, "yuhsuan@google.com" <yuhsuan@google.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Lu,
 Brent" <brent.lu@intel.com>, Damian van Soelen <dj.vsoelen@gmail.com>
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


--5L6AZ1aJH5mDrqCQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2020 at 05:35:45PM +0800, Yu-Hsuan Hsu wrote:
> Takashi Iwai <tiwai@suse.de> =E6=96=BC 2020=E5=B9=B48=E6=9C=8811=E6=97=A5=
 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:39=E5=AF=AB=E9=81=93=EF=BC=9A

> > ... Why only 240?  That's the next logical question.
> > If you have a clarification for it, it may be the rigid reason to
> > introduce such a hw constraint.

> According to Brent, the DSP is using 240 period regardless the
> hw_param. If the period size is 256, DSP will read 256 samples each
> time but only consume 240 samples until the ring buffer of DSP is
> full. This behavior makes the samples in the ring buffer of kernel
> consumed quickly.

> Not sure whether the explanation is correct. Hi Brent, can you confirm it?

This seems to be going round and round in circles.  Userspace lets the
kernel pick the period size, if the period size isn't 240 (or a multiple
of it?) the DSP doesn't properly pay attention to that apparently due to
internal hard coding in the DSP firmware which we can't change so the
constraint logic needs to know about this DSP limitation - it seems like
none of this is going to change without something new going into the
mix?  We at least need a new question to ask about the DSP firmware I
think.

--5L6AZ1aJH5mDrqCQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8ysQAACgkQJNaLcl1U
h9AeeAf/UWVHZwuLSbdU4F24gTh9Evg65nXjOQ/J9iQI9FUTAWaZmBBgfnbWlbRx
1sqvxQ03kOtC40oS9jFz0hYMwDMQm4seHQfg9Zy0gr6DUHcZBnh+eTmn//6u6Xto
W68Wr61drakKTT+9jqC5j694fxtAl1uAvrySfjiIoAJFUg+JRsytjzaeUWRGY1+z
9EjA+q5dX7LuwPKxUmkPkSipJwxXF4zateJ3VnKK2dmNvtnFbYAYD+b7FK2x+9sK
Q30ZaYcs5rlAif136+aUFKABTBjVBjxzE1yGlD66ZipYapXuFo1IyGiQWwq2phPT
ZRU1vj4Zn9eW/Ma7XKCxMWgxJHEoOg==
=CfWE
-----END PGP SIGNATURE-----

--5L6AZ1aJH5mDrqCQ--
