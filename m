Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A38E3AB4C2
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 15:29:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A086716FA;
	Thu, 17 Jun 2021 15:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A086716FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623936553;
	bh=wutnWbTDe0uhFciWBJMvlKQqEBpsL675GE24ZQ1PLWU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eQF90q22R6yC5aPPFuzg9+6IkxUcnf8n88UQL2TPVr9is75EOj/fMO5Uu6+Xo3kQL
	 vHlEwFEObVbzkMMuRMRudZyeAbs0EQI2uZToJ1PIGUf6ASCZOBQv3YFyBxNAxW67th
	 AYjUNKwxxGw6Kc1luy69yQTsey832sHUFKMsoWXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82757F8025E;
	Thu, 17 Jun 2021 15:27:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71CAEF8025A; Thu, 17 Jun 2021 15:27:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28322F8016D
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 15:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28322F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IofAuLty"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FBD161040;
 Thu, 17 Jun 2021 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623936456;
 bh=wutnWbTDe0uhFciWBJMvlKQqEBpsL675GE24ZQ1PLWU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IofAuLtyH9GQ9LzgCEKgEC4KcZusn7MTQA/TccqUCo1PEyRGtl6SSrrdI1fjKAnZN
 JwiH+Qve9FKsSPaPJd+YtQ5B9TvBxJlluT37JCaW/8aeSV5UfGUGVMNC5v/TtCEzVi
 nsL3uDWp6pgSZGfDmS4BErFRpMFn6suKUe7ez/2IVGGZhL517H8SZy3etTr2qow/Su
 R+PW49H27fDGUwutMsTSP2X5VpcFRPoFqjT0Uk0ZH3Cn8wTwhBT7zHk0sscxKp6adc
 QxN3ZqoRV+eIg34qTJLVJn5jbrA66UeBnrcPwpKPxswzJx6t/u6szRxZt90NuGJddL
 UkFckzSB2bsSw==
Date: Thu, 17 Jun 2021 14:27:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: rt711: remap buttons
Message-ID: <20210617132716.GE5067@sirena.org.uk>
References: <20210617090809.16901-1-shumingf@realtek.com>
 <20210617123914.GD5067@sirena.org.uk>
 <d6374c5158c844d69b4f546fd741f07f@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zjcmjzIkjQU2rmur"
Content-Disposition: inline
In-Reply-To: <d6374c5158c844d69b4f546fd741f07f@realtek.com>
X-Cookie: But it does move!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "jairaj.arava@intel.com" <jairaj.arava@intel.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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


--zjcmjzIkjQU2rmur
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 01:19:05PM +0000, Shuming [=E8=8C=83=E6=9B=B8=E9=8A=
=98] wrote:

> > > This patch uses the same mapping as the machine driver:
> > > BTN_0 : KEY_PLAYPAUSE
> > > BTN_1 : KEY_VOICECOMMAND
> > > BTN_2 : KEY_VOLUMEUP
> > > BTN_3 : KEY_VOLUMEDOWN

> > Which machine driver?  Can't there be multiple machine drivers, and if
> > they're already overriding things why do this?

> The rt711 codec is designed in the Intel platform only for now.

I'm sure your sales team would be happy to change that!

> The machine driver is 'sof_sdw.c' that resides under sound/soc/intel/boar=
ds.
> It seems Intel uses the same mapping in all other Intel machine drivers.
> Please check the commit as below.
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/=
?id=3D1f64a08bd5a9a218deb37c03c1e98e9567379698

Sure, but if the machine drivers for these platforms already do the
right thing why change the CODEC driver?

> Hi Sathya,
> Do you know why the m/c driver uses this mapping?

I'd guess it's just because that's the standard set of headphone buttons
that Intel uses for their platforms.

--zjcmjzIkjQU2rmur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDLTbMACgkQJNaLcl1U
h9DsyQf/cPVBZnWs5i6VHZ7Mvy2yg1HJ5/flMyl53ML2qb90y3MYm0i+Z7zY4Yqo
BoLxGNN1/+3FCX+TijnZxkjuT/WBt7Mta19fr8i1yGKb5zl5iyII7cOJOyu+ZnDV
9w/sR4uOtKqOTPeqvV2gVMnjp5nj6BFxVl20fYeq9Jt7hrdMHtkPYzt2wbAz8FTS
xTsiBF2HuD3cm/hz9QvcBTpycdY0xTii9jVn/eTRU1azWsgGaUgVpjbkD6hhppC9
8qLir3DHv4m8i7gSL89XQ8m1VAikBjhUNiCMpnnXVjg1HlSQOl9/smScHvAwVpSt
e/86nm18smCD7KHW22odJLB1jysTUg==
=WfLZ
-----END PGP SIGNATURE-----

--zjcmjzIkjQU2rmur--
