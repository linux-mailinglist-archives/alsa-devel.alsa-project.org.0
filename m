Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E829F158C11
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 10:48:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 915F41662;
	Tue, 11 Feb 2020 10:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 915F41662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581414515;
	bh=pkRt+tGgYOvcXn3ksjoZUDPpYDEMSDHHlYz9jkdecf4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O+8bETkkT5KfwD9cbF/5V+lOL4wibAuanrGMwXzkJxweYxrKNbU6PfNPqpV+x5pTd
	 1C7pR7s0UgNk/ZJLaucjQBXlehryIH2FR86oqQbtuJkHLjF73dZI25l1q54FJPVWKD
	 4QyqI5IZJt8e67NjwgkHznM/rvU55UW2KuHrJBHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAD66F80146;
	Tue, 11 Feb 2020 10:46:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C54CF80145; Tue, 11 Feb 2020 10:46:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCE8DF800E7
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 10:46:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCE8DF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FjsA5BIk"
Received: by mail-wr1-x441.google.com with SMTP id t3so11421823wru.7
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 01:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w1TSPc+JlTHAhFmRkBjf4YDoyFF0cD7ftWasXNuoumE=;
 b=FjsA5BIkZ+hT2wm9mmhX5eKcsNzWDFh8FGGRHbRT6gQ9+e4gbSCL8XUhCvFdE9YSxm
 +O2IY3hVHB+BNd+87rqADV+sqQ5SGlwrKmZupaGnHcEPtO7b06ZqZ+mOUwqwfaJoIEHH
 yX/nBYG2N75UIkPiSwTr9GasTdh4gW36/zcwWqSmkwvgIrkm+mg5TmeGUN7D7oaEpvNg
 BhkvZ0GtgFAEkgw0vrXnFnAQyfvz8D1GkCYuCXzPWpTTSiVl4Qs4MOfXJJ4H2wPk1hvR
 utZEamgdQNk0xMtA+Pxk/ranvt1ndcWGzL4Ph95+IcIyFFSYHKpysmncNo5yrWfTF7X9
 jn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w1TSPc+JlTHAhFmRkBjf4YDoyFF0cD7ftWasXNuoumE=;
 b=sd1BjzdM+0cRabpAXKCdq3rMOknyzugYHSxa3YJiHxCnLU50u8QqUOsdTYmQndqb93
 z4anPc7Y4Z7mz+kSHWYAKyWmzv66DemouMWIpAe/MDPdoEoANFpIa/jjaml7z/f+D/7F
 /we2ENU4DB3x2lWY8D15tD3UMQtbGH4nHZjNfG5wl1KMF01CPZAdjgedNwSox8Fxzs3Z
 bcfz+HB1H3dcrq15Mr8RO1Hw7LldD8oRC95RpJr7CeohwvBb77TEo69BlZ/gX12zVJiK
 fRrXjO3PSs5KLuhsqWCdYeTwwcYmvOVpP7LTpWSeNHEYMYnOCWvxCiQYXwEz4SmQ/nmM
 qnjA==
X-Gm-Message-State: APjAAAUmx5golZOt9iLFagIb6Z09vx3X+tkU2HnYE6MKd9f+alP2KuCx
 HBB6+4zXMEfm+JzvUkR3ss4hoN7xX7e06LlvZhw=
X-Google-Smtp-Source: APXvYqwhSf8JavKelhdt3J0bOLew5DzoXQ+67dDmYAeO5cfMhbaTYXoo2bO/py7GSWzLHg3jBl4sXXUIKRdKaJbTXNo=
X-Received: by 2002:adf:ed09:: with SMTP id a9mr7806457wro.350.1581414409744; 
 Tue, 11 Feb 2020 01:46:49 -0800 (PST)
MIME-Version: 1.0
References: <20200210061544.7600-1-yuehaibing@huawei.com>
 <9351a746-8823-ee26-70da-fd3127a02c91@linux.intel.com>
 <be093793-3514-840a-ff2f-4dc21d8ee7f1@huawei.com>
In-Reply-To: <be093793-3514-840a-ff2f-4dc21d8ee7f1@huawei.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 11 Feb 2020 11:46:38 +0200
Message-ID: <CAEnQRZDWFgXocRJxtc2e7McRCAtod6-GwPJaVMdb4ymBZgSD1w@mail.gmail.com>
To: Yuehaibing <yuehaibing@huawei.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, krzk@kernel.org,
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

On Tue, Feb 11, 2020 at 3:59 AM Yuehaibing <yuehaibing@huawei.com> wrote:
>
> On 2020/2/11 5:00, Pierre-Louis Bossart wrote:
> >
> >
> > On 2/10/20 12:15 AM, YueHaibing wrote:
> >> when do randconfig like this:
> >> CONFIG_SND_SOC_SOF_IMX8_SUPPORT=y
> >> CONFIG_SND_SOC_SOF_IMX8=y
> >> CONFIG_SND_SOC_SOF_OF=y
> >> CONFIG_IMX_DSP=m
> >> CONFIG_IMX_SCU=y
> >>
> >> there is a link error:
> >>
> >> sound/soc/sof/imx/imx8.o: In function 'imx8_send_msg':
> >> imx8.c:(.text+0x380): undefined reference to 'imx_dsp_ring_doorbell'
> >>
> >> Select IMX_DSP in SND_SOC_SOF_IMX8_SUPPORT to fix this
> >>
> >> Reported-by: Hulk Robot <hulkci@huawei.com>
> >> Fixes: f9ad75468453 ("ASoC: SOF: imx: fix reverse CONFIG_SND_SOC_SOF_OF dependency")
> >> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> >
> > Thanks for the report.
> >
> > Would you mind sharing the .config and instructions to reproduce this case? we have an unrelated issue with allyesconfig that was reviewed here:
> >
> > https://github.com/thesofproject/linux/pull/1778
> >
> > and I'd probably a good thing to fix everything in one shot.
>
> config is attached, which is on x86_64

Thanks, I think this is legit. It was introduced with:

commit f52cdcce9197fef9d4a68792dd3b840ad2b77117
Author: Daniel Baluta <daniel.baluta@nxp.com>
Date:   Sat Jan 4 15:39:53 2020 +0000

    firmware: imx: Allow IMX DSP to be selected as module

    IMX DSP is only needed by SOF or any other module that
    wants to communicate with the DSP. When SOF is build
    as a module IMX DSP is forced to be built inside the
    kernel image. This is not optimal, so allow IMX DSP
    to be built as a module.

    Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
    Signed-off-by: Shawn Guo <shawnguo@kernel.org>

So, I think we should change the Fixes tag. Are there
any clear rules on when to use select vs depends?

On my side, I know what both are doing but it is not clear
when to use them.

> >
> > Thanks!
> >
> >> ---
> >>   sound/soc/sof/imx/Kconfig | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
> >> index bae4f7b..81274906 100644
> >> --- a/sound/soc/sof/imx/Kconfig
> >> +++ b/sound/soc/sof/imx/Kconfig
> >> @@ -14,7 +14,7 @@ if SND_SOC_SOF_IMX_TOPLEVEL
> >>   config SND_SOC_SOF_IMX8_SUPPORT
> >>       bool "SOF support for i.MX8"
> >>       depends on IMX_SCU
> >> -    depends on IMX_DSP
> >> +    select IMX_DSP
> >>       help
> >>         This adds support for Sound Open Firmware for NXP i.MX8 platforms
> >>         Say Y if you have such a device.
> >>
> >
> > .
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
