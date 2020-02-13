Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D3915CD03
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 22:14:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BFE316B8;
	Thu, 13 Feb 2020 22:13:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BFE316B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581628462;
	bh=1J9s6yK8GAnjapE41SGO03BnXM9C+pdhiV1KKpftUmk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=duqSZpCP+CA/yGnQ7D8X3Qly9zON27aPipjRQyU2yzVR4/Rljlj/T1QhA0kA1DRFV
	 XwOqwHZesCc75dWuLrFoWvkasx8RZ4NcIfRyoI11CPjtV4aDNYrWju3LFZM6QthsX5
	 8Dwe8MZa5MGb+8Dhbf0W77At1QpnskY6tpxFCB4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8B52F80146;
	Thu, 13 Feb 2020 22:12:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1A64F80138; Thu, 13 Feb 2020 22:12:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19470F80138
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 22:12:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19470F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="THiYYtRd"
Received: by mail-wr1-x441.google.com with SMTP id t3so8459605wru.7
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 13:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iLnuSGH6jNEPRpXsbLdWMvvm70on1OtXGRCIuCTYax4=;
 b=THiYYtRd1Hw9OOJtDh3m0bsQpuPbcL6D15Or8KKVQBdszixBwTMpdrWI1sdey73UL6
 OMnfWvyrWMTpxJtIWoOC3klZgu1IWrwgGpKzMr1l6YiTs0DTZmmHJJcXX96UNF87RkqM
 HIFVzoYj/EtPV4PceO73UE9E2E+l505vMkvdCLvqEdLKR6NepxAChTX8Ksv5A3MY10wx
 MRDdAInFdByqnE458Nnhm4UsbhvGkS+b6VwbMIinCdiLagqLPLJoH+eJrkk9PW7dAYay
 e6CshZ/C9jEucmAiBLXhWu3nU7PBF+CispXbP2m0DDejFGVPd1+CTDQtGHZ+f7WzC7Ag
 k7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iLnuSGH6jNEPRpXsbLdWMvvm70on1OtXGRCIuCTYax4=;
 b=FOJp4Mz1qdINY5ZZEnb4osM55tYq/QNWFTGxDAv24zy2mcGkx9a3WbMzCuA9Xa1MdS
 2cachKIy+QE1O3ouhxa6ckC7hzEf1xMVYNlv/gjfwagiRFt9Mh0wJHHgxjMw99QGbmRn
 S4h/0gt9cxBmzbk484ajb6kScTQ2Ai7YxzlZmZ3l+2LQi4WQVktDu0FxQIMedK1+Fqjn
 fCu1P+fsmUDnJT24jY3wZMcITZSvTR0GBymjjUfK7sP8U650oqnzJxhycnkcOXqpI6Ht
 ePNLfr6OWn+UmFHDfyCVVkJyBQPQS+7JI9XRNOM7v8LM0iewu0bM/5e813MHWgnG9Mil
 ugmw==
X-Gm-Message-State: APjAAAU1EcPBcb088b1IbDrtF7dmgtm2e43c0x7edIqbtBS9QpcM0Pi2
 O+8v34Al26UtMxzRMne91r1NU/01CpJnanU3RPo=
X-Google-Smtp-Source: APXvYqz2/8nyozAwb5c39LHVAvkkzIlzsIxS4KXcp3M3SHYFP+afkm8+EUw7r7XUouiqxTfEbIygo0weNf0szTqLQ0o=
X-Received: by 2002:adf:ed09:: with SMTP id a9mr24147253wro.350.1581628354989; 
 Thu, 13 Feb 2020 13:12:34 -0800 (PST)
MIME-Version: 1.0
References: <20200210061544.7600-1-yuehaibing@huawei.com>
 <9351a746-8823-ee26-70da-fd3127a02c91@linux.intel.com>
 <be093793-3514-840a-ff2f-4dc21d8ee7f1@huawei.com>
 <CAEnQRZDWFgXocRJxtc2e7McRCAtod6-GwPJaVMdb4ymBZgSD1w@mail.gmail.com>
 <CAJKOXPcxL2vpWGwO1OL9Vv0g6hzbW-AyGJNn=7Yq2iy10_cbhg@mail.gmail.com>
In-Reply-To: <CAJKOXPcxL2vpWGwO1OL9Vv0g6hzbW-AyGJNn=7Yq2iy10_cbhg@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 13 Feb 2020 23:12:23 +0200
Message-ID: <CAEnQRZBgpcLz29PG6pY_6xaULO6siGumqrsO0gRReMRwUOqW2w@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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

On Tue, Feb 11, 2020 at 11:59 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, 11 Feb 2020 at 10:46, Daniel Baluta <daniel.baluta@gmail.com> wrote:
> >
> > On Tue, Feb 11, 2020 at 3:59 AM Yuehaibing <yuehaibing@huawei.com> wrote:
> > >
> > > On 2020/2/11 5:00, Pierre-Louis Bossart wrote:
> > > >
> > > >
> > > > On 2/10/20 12:15 AM, YueHaibing wrote:
> > > >> when do randconfig like this:
> > > >> CONFIG_SND_SOC_SOF_IMX8_SUPPORT=y
> > > >> CONFIG_SND_SOC_SOF_IMX8=y
> > > >> CONFIG_SND_SOC_SOF_OF=y
> > > >> CONFIG_IMX_DSP=m
> > > >> CONFIG_IMX_SCU=y
> > > >>
> > > >> there is a link error:
> > > >>
> > > >> sound/soc/sof/imx/imx8.o: In function 'imx8_send_msg':
> > > >> imx8.c:(.text+0x380): undefined reference to 'imx_dsp_ring_doorbell'
> > > >>
> > > >> Select IMX_DSP in SND_SOC_SOF_IMX8_SUPPORT to fix this
> > > >>
> > > >> Reported-by: Hulk Robot <hulkci@huawei.com>
> > > >> Fixes: f9ad75468453 ("ASoC: SOF: imx: fix reverse CONFIG_SND_SOC_SOF_OF dependency")
> > > >> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > > >
> > > > Thanks for the report.
> > > >
> > > > Would you mind sharing the .config and instructions to reproduce this case? we have an unrelated issue with allyesconfig that was reviewed here:
> > > >
> > > > https://github.com/thesofproject/linux/pull/1778
> > > >
> > > > and I'd probably a good thing to fix everything in one shot.
> > >
> > > config is attached, which is on x86_64
> >
> > Thanks, I think this is legit. It was introduced with:
> >
> > commit f52cdcce9197fef9d4a68792dd3b840ad2b77117
> > Author: Daniel Baluta <daniel.baluta@nxp.com>
> > Date:   Sat Jan 4 15:39:53 2020 +0000
> >
> >     firmware: imx: Allow IMX DSP to be selected as module
> >
> >     IMX DSP is only needed by SOF or any other module that
> >     wants to communicate with the DSP. When SOF is build
> >     as a module IMX DSP is forced to be built inside the
> >     kernel image. This is not optimal, so allow IMX DSP
> >     to be built as a module.
> >
> >     Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> >     Signed-off-by: Shawn Guo <shawnguo@kernel.org>
>
> Hi,
>
> Since it's a module, don't you just miss EXPORT_SYMBOL there?
>
> > So, I think we should change the Fixes tag. Are there
> > any clear rules on when to use select vs depends?
> >
> > On my side, I know what both are doing but it is not clear
> > when to use them.
>
> Visible symbols usually should not be selected. The same with symbols
> with dependencies. The docs have this rule mentioned.

You mean if module X depends on module Y, we shouldn't use select?
But this exactly what this patch does :).

The problem here is that when X depends on Y, and X=y and Y=m
when we try to compile X if get an error because we cannot find a symbol from Y.

I think if X depends on Y, and X is forced to "y" then also Y should
be forced on "y".
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
