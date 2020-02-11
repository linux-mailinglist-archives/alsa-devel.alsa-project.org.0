Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06353158C49
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 11:01:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A5821665;
	Tue, 11 Feb 2020 11:00:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A5821665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581415275;
	bh=clKMgwavPsd05Az75pCHc8+eAR/OAqAWe4Slxp6KlX4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DJIMB5BRxDX9xAHQNgc6Su0ONsAoBbIUV6HMIY8VBK4jMs/csBs3x5/GSj/F3/3mF
	 DuPt4KSYOGObi/ldM7G21vIM8DzzT85SRoWUfPuNawCd8+wq6hRcEc+F941cqkXY5C
	 7zGQSTnvSYUWMxV92Hyft7yJVxKOAwpJPt73zikI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4A3FF80146;
	Tue, 11 Feb 2020 10:59:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25CCDF80145; Tue, 11 Feb 2020 10:59:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03FAEF800F0
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 10:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03FAEF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ontb1bxQ"
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72A5620714
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 09:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581415167;
 bh=eZTJW3fyuVfF78EHcMrcN6Hj2iRFml/KLBuxmsVst/I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ontb1bxQ5hDW5q1FR8Br/ISHJ7XHTUW3ug/87faSNg2bqLqit8Rl8hfXZsGqLbSJq
 hJw4R7PUK3ijRg0f8YseHgmgZlH61VXB6J80qFs5xjpKY/rHGAE8NnaVwdbMf9DhdK
 BfhtnOclYZp6S2JCpvk8o1itiL2qrI3frrZZk4MU=
Received: by mail-lf1-f52.google.com with SMTP id t23so6536036lfk.6
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 01:59:27 -0800 (PST)
X-Gm-Message-State: APjAAAXrds8rKQDtdvvkIYXXpJxGtKaJkqf/nx+OvcbywuJSmagbQH4J
 BrnS0KwTNQMh9h1jCPhV1kzG9inlxbi1fPIoSx4=
X-Google-Smtp-Source: APXvYqwAHORsy+C2v7lVpCe02Mf1CVE+/0/5jXb/E/zbgMCk+yjlFnDzUNYbiYCIu0+5WnyY8bNqPOsV8tBJAugOUOM=
X-Received: by 2002:a19:228c:: with SMTP id i134mr3249949lfi.2.1581415165575; 
 Tue, 11 Feb 2020 01:59:25 -0800 (PST)
MIME-Version: 1.0
References: <20200210061544.7600-1-yuehaibing@huawei.com>
 <9351a746-8823-ee26-70da-fd3127a02c91@linux.intel.com>
 <be093793-3514-840a-ff2f-4dc21d8ee7f1@huawei.com>
 <CAEnQRZDWFgXocRJxtc2e7McRCAtod6-GwPJaVMdb4ymBZgSD1w@mail.gmail.com>
In-Reply-To: <CAEnQRZDWFgXocRJxtc2e7McRCAtod6-GwPJaVMdb4ymBZgSD1w@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 11 Feb 2020 10:59:14 +0100
X-Gmail-Original-Message-ID: <CAJKOXPcxL2vpWGwO1OL9Vv0g6hzbW-AyGJNn=7Yq2iy10_cbhg@mail.gmail.com>
Message-ID: <CAJKOXPcxL2vpWGwO1OL9Vv0g6hzbW-AyGJNn=7Yq2iy10_cbhg@mail.gmail.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Yuehaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH -next] ASoC: SOF: imx8: Fix randbuild error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 11 Feb 2020 at 10:46, Daniel Baluta <daniel.baluta@gmail.com> wrote:
>
> On Tue, Feb 11, 2020 at 3:59 AM Yuehaibing <yuehaibing@huawei.com> wrote:
> >
> > On 2020/2/11 5:00, Pierre-Louis Bossart wrote:
> > >
> > >
> > > On 2/10/20 12:15 AM, YueHaibing wrote:
> > >> when do randconfig like this:
> > >> CONFIG_SND_SOC_SOF_IMX8_SUPPORT=y
> > >> CONFIG_SND_SOC_SOF_IMX8=y
> > >> CONFIG_SND_SOC_SOF_OF=y
> > >> CONFIG_IMX_DSP=m
> > >> CONFIG_IMX_SCU=y
> > >>
> > >> there is a link error:
> > >>
> > >> sound/soc/sof/imx/imx8.o: In function 'imx8_send_msg':
> > >> imx8.c:(.text+0x380): undefined reference to 'imx_dsp_ring_doorbell'
> > >>
> > >> Select IMX_DSP in SND_SOC_SOF_IMX8_SUPPORT to fix this
> > >>
> > >> Reported-by: Hulk Robot <hulkci@huawei.com>
> > >> Fixes: f9ad75468453 ("ASoC: SOF: imx: fix reverse CONFIG_SND_SOC_SOF_OF dependency")
> > >> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > >
> > > Thanks for the report.
> > >
> > > Would you mind sharing the .config and instructions to reproduce this case? we have an unrelated issue with allyesconfig that was reviewed here:
> > >
> > > https://github.com/thesofproject/linux/pull/1778
> > >
> > > and I'd probably a good thing to fix everything in one shot.
> >
> > config is attached, which is on x86_64
>
> Thanks, I think this is legit. It was introduced with:
>
> commit f52cdcce9197fef9d4a68792dd3b840ad2b77117
> Author: Daniel Baluta <daniel.baluta@nxp.com>
> Date:   Sat Jan 4 15:39:53 2020 +0000
>
>     firmware: imx: Allow IMX DSP to be selected as module
>
>     IMX DSP is only needed by SOF or any other module that
>     wants to communicate with the DSP. When SOF is build
>     as a module IMX DSP is forced to be built inside the
>     kernel image. This is not optimal, so allow IMX DSP
>     to be built as a module.
>
>     Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>     Signed-off-by: Shawn Guo <shawnguo@kernel.org>

Hi,

Since it's a module, don't you just miss EXPORT_SYMBOL there?

> So, I think we should change the Fixes tag. Are there
> any clear rules on when to use select vs depends?
>
> On my side, I know what both are doing but it is not clear
> when to use them.

Visible symbols usually should not be selected. The same with symbols
with dependencies. The docs have this rule mentioned.

Best regards,
Krzysztof
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
