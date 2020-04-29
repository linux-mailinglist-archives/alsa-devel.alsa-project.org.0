Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF94C1BD740
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 10:26:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63491168E;
	Wed, 29 Apr 2020 10:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63491168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588148813;
	bh=OTU0kOM/tUnBBBQ8muGmJxS9Z5B+0RvHXGJT9Bp+z2I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m2uprIEcYLtsrWzz5GaxsY+Ryk0AEqEjeZMpdax3wVwC4SaN4jRKtRrpsD1z+STam
	 9JEs9QbDeHrKbXsvA2sbs3Kuo1fPFEoNbRKFKO6YlLJAGy1UrjQGc1vr0eO18tB3r1
	 FoN2eq4637whbUd+ZjqTpNJDTJhG6ERzcJuUhpqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AB21F800D2;
	Wed, 29 Apr 2020 10:25:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE0A9F8022B; Wed, 29 Apr 2020 10:25:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D428F800D2;
 Wed, 29 Apr 2020 10:25:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D428F800D2
Received: from mail-lf1-f45.google.com ([209.85.167.45]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M5wTt-1jW9vZ2RJb-007SmK; Wed, 29 Apr 2020 10:25:02 +0200
Received: by mail-lf1-f45.google.com with SMTP id d25so890401lfi.11;
 Wed, 29 Apr 2020 01:25:02 -0700 (PDT)
X-Gm-Message-State: AGi0Pub8F3ok0XqfISraTP9SuHcJxk2r7OJn37gFkw5jLv15WWvHqTOc
 rnSecIpK7dxcZ0l3E37EjDblIKdyXmHL4qvJi1w=
X-Google-Smtp-Source: APiQypKYwuif1CT2TpVka5FFL7aLnwCZS2moXiiZbTlODTEUY1BIra8wbAmWai01XE2gYsYojcCm4wCdH9lAq0wmfsY=
X-Received: by 2002:a19:505b:: with SMTP id z27mr4237553lfj.123.1588148702030; 
 Wed, 29 Apr 2020 01:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200428212752.2901778-1-arnd@arndb.de>
 <6b39fbba-c65d-2c02-14bf-11c2d00547af@linux.intel.com>
 <CAK8P3a24whg2RhJE3Vf5u3EWy+wvFqhXdp7EQZuQx0shPsMARw@mail.gmail.com>
 <f91c9a68-7641-beb8-a23e-bd1b9b8d0acb@linux.intel.com>
 <b784c008-7094-05cb-6200-6b246ff39bb8@linux.intel.com>
In-Reply-To: <b784c008-7094-05cb-6200-6b246ff39bb8@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Apr 2020 10:24:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3vri_-tdEy3x6tRGUjb_k-+Mc+Jt9bQpgFvqm2RN+cJA@mail.gmail.com>
Message-ID: <CAK8P3a3vri_-tdEy3x6tRGUjb_k-+Mc+Jt9bQpgFvqm2RN+cJA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: sort out Kconfig, again
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:8GjoymyJvrTILrh1hmjiAkHJHlLo16/3L5AjmIYXKnlbg4KtwHB
 qkCLeqV7Xn/yA3dLz0l8l5uRNVElSwO99kQDcvHMXfCRyjWgsUdAA5Vq1QeyY48gztteDLM
 /LIBX7LeH/je3mw6VQa24Kntmjbp5QT0NBQp7sx+SUbKtj9X/W0mc5l6rjGiMblkqhiP4KD
 xY+wSlu5OrpVnOLd1S4Vg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m6LbrjjgReg=:B7CUXe3m5D+2HRNOK0gWZQ
 fuEz3PpSPDhm2eAEygUhc2Hz3eXbTBZGNjU3cJ3JNJpJgX99hw+6lM/h8zPY3XYGe2vMgYLxv
 +u2y1UCLRaZMD+iY1L6nuvFFiHOJM5eZyjrcorLiZ0VScy0HyT0a6l8HdiAVOXk0mwQGcopRQ
 jIpKz8N7FD7l10cFaMU1eDCjZjiOg22IKQRkRZrSCpyA9xgAa4JdBj3LoGO85kCSxaAq+kh0Y
 HjKA2KhZMMoxSA/QptrufFCdo6kvwueUIOLfeURQoh2pqyfT76ZbhWH9UK/ccHvtHQ7Nv+amA
 Wc9BB59OvpJbz7UUval/jD31HkUqQh0GZdQAuIU8/hIyQB0b4+/k8vzqkoi5OlmgLQnWAmh+i
 kQRE2Sz4bgkKMGBbXwEibgoOjcTDpeq7bRDjb9axYpfRAD3K0I3PRGhYx56qT7wfsVmlfoe3P
 hzNd4Qee7uY5N/uvfk0aDQo02JRZRz0a4GJ1sOGfPeZHH0q2rnJhKhKAW0ZrSSRon3yn8sEMk
 B7/FR2mHeaXG4X5bJybpQ6H8tYanrRZNU3y1XRvZCIYjiiZGwURVtCFs6wemcmzb6Zl1qk8AM
 nQjczX3Ot/B++VXtXA4/k+uRQbp4oZzdNbq+WVcdljv0WxZmWDRnrY8/W+2oGfLUdfRYV9EHA
 noW3jWaWO7WMSX+EX4GjqXeMVAJWWay8D6A1bwM+xYu1l3W1rg33GDFnw7gdtKSZ9IzM5D4yR
 6bfXOs87ndG0nCWbDF9YWN5cXUOA7mO4KdY3TiYJn73o0lGt6AT0D440sNeXEU5exq94nTAs/
 uyMhjxN1v6V5U/vhXCMauEyrH0l4SDIi5J6vB3WcKFMBG0HeeI=
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
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

On Wed, Apr 29, 2020 at 1:00 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> >>> Thanks Arnd, do you mind sharing your config?
> >>
> >> https://pastebin.com/HRX5xi3R
> >
> > will give it a try, thanks!
> >
> >>> We noticed last week that
> >>> there's a depend/select confusion might be simpler to fix, see
> >>> https://github.com/thesofproject/linux/pull/2047/commits
> >>>
> >>> If I look at the first line I see a IMX_DSP=n which looks exactly like
> >>> what we wanted to fix.
> >>
> >> Yes, I think that fix addresses the build warning as well, but looking
> >> more closely I don't think it's what you want: If you do this on
> >> a config that has the IMX_DSP disabled, it would appear to the
> >> user that you have enabled the drivers, but the actual code is still
> >> disabled.
> >
> > Are you sure? we added a select IMX_DSP, so not sure how it can be
> > disabled?
>
> I just tested Arnd's config with the patch we came up with for SOF
> (attached) and it makes the unmet dependency go away and builds fine.
> the problem is really using select IMX_DSP if it can be disabled by
> something else. My proposal looks simpler but I will agree it's not
> necessarily super elegant to move the dependency on IMX_BOX into SOF, so
> no sustained objection from me on Arnd's proposal.

Ok, thanks for testing!

I looked at the bigger picture again and found that the more fundamental
problem is the dependency reversal in sound/soc/sof/sof-of-dev.c, where
you have common code that knows about and links against a hardware
specific driver. This is something we try hard do avoid in general in the
kernel, as it causes all kinds of problems:

- Expressing the Kconfig dependencies is rather unnatural and error-prone,
  as you found

- Adding multiple new drivers at the same time leads to merge conflicts

- A kernel that supports multiple SoC families, like all general-purpose
  distros do, and Android is going to do in the future means that you have
  to load every hardware specific module in order to just use one of them.

- In Android's case, it also breaks the model of having one vendor provide
  support for a new SoC by enabling additional modules they ship in
  their vendor specific partition

I think this is all solved by moving the "module_platform_driver()"
and of_device_id array for each driver into the module that defines
the corresponding sof_dev_desc structure, and have those drivers
call the exported sof_of_probe() and sof_of_remove() functions.

      Arnd
