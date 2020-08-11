Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C462B241F21
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 19:24:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F9A11667;
	Tue, 11 Aug 2020 19:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F9A11667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597166665;
	bh=Dgm0qAiK5T+TCD/8IcEsF6RxUT4c8CCK4VuHeba5Dks=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q0/pkJEPqqj1Kyd/FB9Ro7bWXAgFo6yIS+9maKXrrHgPS8aM3PyOD3bXeoLBF/5Lg
	 xOf8CFYNIJ7agIw6jUFq1tE7iu65wRTd7ex3gX4aDCQ34pUmgLKYU+3N4dEbG64b+f
	 BGY7SGCcutDwIZJlhoJwtcJYBCVNoX1Sw8162P6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99D16F800BC;
	Tue, 11 Aug 2020 19:22:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 059ECF8015B; Tue, 11 Aug 2020 19:22:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AD80F800BC
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 19:22:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AD80F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FcFP3m3P"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50CBB20756;
 Tue, 11 Aug 2020 17:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597166557;
 bh=Dgm0qAiK5T+TCD/8IcEsF6RxUT4c8CCK4VuHeba5Dks=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FcFP3m3PZ60xS2+wW9A2qr5O2C70acl7/+loI/I+8FqlaeeIuIW2o6Rb4V4j0H7kp
 Gbebx67uMfJqT8Oc5ehcLYTREvnsoqid17qz93UPCepB7PjkjtHxt0nKLHu6II7/p/
 4exSngp47uuXqodDrlISF3cmQfNlJeejN6Lujk+g=
Date: Tue, 11 Aug 2020 18:22:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
Message-ID: <20200811172209.GM6967@sirena.org.uk>
References: <3f3baf5e-f73d-9cd6-cbfb-36746071e126@linux.intel.com>
 <CAGvk5PohOP0Yv22tb53EX=ZLB9_vOMb=iujTh64OvHmjC1d4mg@mail.gmail.com>
 <DM6PR11MB3642AC7F8EC47EB48B384D4797450@DM6PR11MB3642.namprd11.prod.outlook.com>
 <CAGvk5PogmqfEnFRA8hzby+AGgbOSvbELamh_1=eA9KTpyBMPYQ@mail.gmail.com>
 <s5htux939x1.wl-tiwai@suse.de>
 <CAGvk5PpcmkZ2HarqeCDaXm4id=84wYs-u4vWxJunHaf09gj66g@mail.gmail.com>
 <s5ho8nh37br.wl-tiwai@suse.de>
 <CAGvk5PphzkdiNfW8hiDuqX+2eQO2FvrpzA0qR3=3VvqM3GBhAA@mail.gmail.com>
 <20200811145353.GG6967@sirena.org.uk>
 <d78f9adc-d583-f0f2-ce38-3c9175c939b8@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="L/bWm/e7/ricERqM"
Content-Disposition: inline
In-Reply-To: <d78f9adc-d583-f0f2-ce38-3c9175c939b8@linux.intel.com>
X-Cookie: Gravity is a myth, the Earth sucks.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 "yuhsuan@google.com" <yuhsuan@google.com>, "Lu, Brent" <brent.lu@intel.com>,
 Damian van Soelen <dj.vsoelen@gmail.com>
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


--L/bWm/e7/ricERqM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 11, 2020 at 11:54:38AM -0500, Pierre-Louis Bossart wrote:

> > constraint logic needs to know about this DSP limitation - it seems like
> > none of this is going to change without something new going into the
> > mix?  We at least need a new question to ask about the DSP firmware I
> > think.

> I just tested aplay -Dhw: on a Cyan Chromebook with the Ubuntu kernel 5.4,
> and I see no issues with the 240 sample period. Same with 432, 960, 9600,
> etc.

> I also tried just for fun what happens with 256 samples, and I don't see any
> underflows thrown either, so I am wondering what exactly the problem is?
> Something's not adding up. I would definitively favor multiple of 1ms
> periods, since it's the only case that was productized, but there's got to
> me something a side effect of how CRAS programs the hw_params.

Is it something that goes wrong with longer playbacks possibly (eg,
someone watching a feature film or something)?

--L/bWm/e7/ricERqM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8y08AACgkQJNaLcl1U
h9Ccwwf/bDJWFL/+Dvlv4VW6nQDJuCL87mKFpuskMBCg8FgktasTXWDZ8hqcVoHf
aRfI5Q/+gJ982IOHeC53vhb0NVnq4KzSlvYV/4rvphaYivj8EDI4CZqVaxhZCAyv
C2DhskJdWKWmmdODAui8e66hUcohBR8HXEmlxo6ao6Sbw7LL91pJnCk7f8pfYQDI
rQXV9dGPKvJK083JcpNPJYN3XpP23SJ7HtNk0uPQ3U3fuCxNX6XevHs0Yr969wFa
4ViVlvogW7FxgOyaaTo32bHLPQNVoot1xCIWeTmO+L7sSAKTDJQbd75fp5f45wQX
GYxDwTvSEo2+GwC4rcYi8g+M2tWcBg==
=vhck
-----END PGP SIGNATURE-----

--L/bWm/e7/ricERqM--
