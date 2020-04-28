Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0731BCF5C
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 00:03:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7826168C;
	Wed, 29 Apr 2020 00:02:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7826168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588111429;
	bh=yBdzRD8y2FjCwtx9oFavLCDG09QUikIt6251cQJ8gqc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WvWCgtnKmTiOD0R3ehJNwTkh9YM8+b3gCzVpz1jbFZsiOGpjoxq+/dlNrEmNmHv9z
	 DRGP7PXndBRKaPCtbkwx6fCOu3dI7mEHJ39h2ZIhRxgnvPH2TEvizRg2FRWQUKRoYO
	 XCEtLAxAaH8OhvpA0nRw2gR+vkKDmeiazuF7QrvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97BC3F80136;
	Wed, 29 Apr 2020 00:02:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37DDAF801DB; Wed, 29 Apr 2020 00:02:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=RCVD_IN_MSPIKE_BL,
 RCVD_IN_MSPIKE_L3,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 067EBF8010A;
 Wed, 29 Apr 2020 00:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 067EBF8010A
Received: from mail-lf1-f48.google.com ([209.85.167.48]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MD9Gh-1jKzav3YZt-009B7u; Wed, 29 Apr 2020 00:01:56 +0200
Received: by mail-lf1-f48.google.com with SMTP id f8so18119845lfe.12;
 Tue, 28 Apr 2020 15:01:56 -0700 (PDT)
X-Gm-Message-State: AGi0Puag32BBkiCzt9lFpPIYp05OpZ8B8HYMoHJGlScSrkrHQ2aPUe/c
 Rp0ORfcIyL6RwRm8uB2iXzYVzm6f8uTcQJW7hvQ=
X-Google-Smtp-Source: APiQypKRCC3KPD04zAsw5+cxuEvdnddfpLWkPhoC2m7sjHNQVxlSGSJA7IqZ0gPza4uX18XwephNlgb4sPXRsKwTwuc=
X-Received: by 2002:a05:6512:10cd:: with SMTP id
 k13mr20513654lfg.173.1588111316217; 
 Tue, 28 Apr 2020 15:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200428212752.2901778-1-arnd@arndb.de>
 <6b39fbba-c65d-2c02-14bf-11c2d00547af@linux.intel.com>
In-Reply-To: <6b39fbba-c65d-2c02-14bf-11c2d00547af@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Apr 2020 00:01:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a24whg2RhJE3Vf5u3EWy+wvFqhXdp7EQZuQx0shPsMARw@mail.gmail.com>
Message-ID: <CAK8P3a24whg2RhJE3Vf5u3EWy+wvFqhXdp7EQZuQx0shPsMARw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: sort out Kconfig, again
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:WkZiKFhAn1HlSi4wS0h4drQRCOwELZ1kfmz5Vmt8nFq+zNJibC6
 iPHLAuClUIbkFENhYdARdhFy/LAJ7AYCXetLjTyZibZCYG0N2y5S/7f85XaFZreG01PHWO/
 ddqNJsrAsIEVIRQI2Bx+xFJGdvTOopafDNId9QzrYmP0M16w4omCgqt1ACrfoRYMHhm4/T5
 L89mFlPDW1zmE6xzW0vXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WHaKt7DR+t8=:r8oR3Zwys7H5urwosxL922
 PyMUiPVYFioudFrewkXY1OZn8ZwqReVLwx3M6l1OOvGklRJawA0sPmshsjvsWCGbJuAmj3kRl
 u0xckawfaZrk1APe1NSlv3b7dXCxMr77qrsYSXjX8aUVjpMxOqfKNvsv34Z7oELEQNufZi6FB
 Rp5XbcoEoZXRKrfe/5FH1r7LsXgalKjXbWzMIi5i/hhdGkdr7xdrC+Y/lQBb+EsBoXnwisGE5
 qLEoEQTxOaD9xKRZQt6PLfWvjSM8JamMH8ZKykvDHrTY1oBiF0ovaUIeS13AKy9b9mFrdXeHz
 9En6aMnG4RAh+7wMyX2uvUxU8bq9xWBHQUiDKYO1mgxQT1YciDLJELjkbMZhSrzr+zPwBjNWA
 bT62qK4ce8A6d/KdWH0gYZlaqjl9nbdRB6bDltR8eHXnF0yo/d18Sg0fVq9nLDN15C64EhlJd
 uIBKa+rcdwriKkswS+sxMx1dKH/0y6Amz+0tJcMvA88AMWVdM/s89d0n34iDN84/Mc15ZSYvt
 +Heq+aaEZMNQfx8lwqK/9/N7cZaltXJTopd8cabxLKaAeMmVMQu8FxmSh7vMeL5dTl0t2PGK+
 GH2muFOhyqdF5t5H0KyQgfugKbEe1P+MklINC4ur7nJr2HI4kM4xMiBB7vbrDxb5aK5JPloGF
 Qd5FgPqS5vH4p5s7h9H+vCJnk3w99YluNglZ2xay88Tjhy5FbYFViBEiA1zjdF4VSi4I8AxDH
 nLdVSpjl2RsZAo3y5M91+2t5jbWlGRB4C9lfg6byv/r+fBSBtr/LyHM/ZhF9MkL2gyCahWYhi
 4DQDhkga3vdZL0T9lSKHOd1FC5KyYit3uDsgVHI0lDNSMtWNtA=
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 sound-open-firmware@alsa-project.org
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

On Tue, Apr 28, 2020 at 11:43 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> On 4/28/20 4:27 PM, Arnd Bergmann wrote:
> > The imx8 config keeps causing issues:
> >
> > WARNING: unmet direct dependencies detected for SND_SOC_SOF_IMX8M
> >    Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=m] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_IMX_TOPLEVEL [=y] && IMX_DSP [=n]
> >    Selected by [m]:
> >    - SND_SOC_SOF_IMX_OF [=m] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=m] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_IMX_TOPLEVEL [=y] && SND_SOC_SOF_IMX8M_SUPPORT [=y]
> >
> > This is complicated by two drivers having dependencies on both
> > platform specific drivers and the SND_SOC_SOF_OF framework code,
> > and using an somewhat obscure method to build them the same way
> > as the SOC_SOF_OF symbol (built-in or modular).
> >
> > My solution now ensures that the two drivers can only be enabled
> > when the dependencies are met:
> >
> > - When the platform specific drivers are built-in, everything is
> >    fine, as SOC_SOF_OF is either =y or =m
> >
> > - When both are loadable modules, it also works, both for Kconfig
> >    and at runtime
> >
> > - When the hardware drivers are loadable modules or disabled, and
> >    SOC_SOF_OF=y, prevent the IMX_SOF_OF drivers from being turned on,
> >    as this would be broken.
> >
> > It seems that this is just an elaborate way to describe two tristate
> > symbols that have straight dependencies, but maybe I'm missing some
> > subtle point. It seems to always build for me now.
>
> Thanks Arnd, do you mind sharing your config?

https://pastebin.com/HRX5xi3R

> We noticed last week that
> there's a depend/select confusion might be simpler to fix, see
> https://github.com/thesofproject/linux/pull/2047/commits
>
> If I look at the first line I see a IMX_DSP=n which looks exactly like
> what we wanted to fix.

Yes, I think that fix addresses the build warning as well, but looking
more closely I don't think it's what you want: If you do this on
a config that has the IMX_DSP disabled, it would appear to the
user that you have enabled the drivers, but the actual code is still
disabled.

      Arnd
