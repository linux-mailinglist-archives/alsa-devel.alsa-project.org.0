Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B384715CCFE
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 22:11:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5741B16A5;
	Thu, 13 Feb 2020 22:10:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5741B16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581628298;
	bh=lq8UofkzZs3gLRl/CXN1G0T1qdJv/QXhjt4qav+sqQU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QfkHo60ZHWfHs1NUtYgA1tAOXUqJ8Ux7RXBA1yW/1gLyuMrbFTuk+irjZMVTXGsrC
	 jPJd83gNMwoAxAVk7JVWpZid/zPT6j23oRGZ9XLIcMBRBQ2XMfw8nyHzaSXL6uzgbV
	 D8lbe4J2hYc94B7LGaDQjBoPDMEIVkTLeY8GoGns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62788F800F0;
	Thu, 13 Feb 2020 22:09:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41DD7F80145; Thu, 13 Feb 2020 22:09:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58F6CF80138
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 22:09:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58F6CF80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Mf3W1BUf"
Received: by mail-wr1-x443.google.com with SMTP id z3so8486335wru.3
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 13:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZtGcUpA5w76Gcek+VkqKEDd0yDqjEFq7/gNXQdanLGM=;
 b=Mf3W1BUftM+nHyrzCX/s/zOBXQMM8Okj/NIiHqnyaNOVn9jeL+X5uDsvbhzPHs4ZYm
 Eywp6G8pCTJEPMEOzfDlStUka5S959F5fX2EOBMECYxssoK5tkYaGz5fR740k+uwX471
 xr7QHag/Smbp2tbSvoVKpw9CmTlS4i0HGeiXZhZ3mXb/Aila2GCHeova4TFb8L7ki8cc
 8Cb/+2IB82/9tcSUyspxstMFFE03/nSdqiwVBfLvGYn0fVx0uxDIH24GzIGcgxrN9TWW
 /foFhhuCCVAYNigjgDUFZ4sb0kgTydppAjzxko/meQW72KN2UZo9k129RSjVX01uo5ph
 CPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZtGcUpA5w76Gcek+VkqKEDd0yDqjEFq7/gNXQdanLGM=;
 b=ulIf8q1458m58ScUvky0t+OS5prbGfVyTiDuJm+yfjVqfTLyVyCAIO0lCsTZxn2m9M
 oS1irmAxz/ZJoUnvpsQIjFlCUe1/2NrIBWlMvq4MpAAmR9GXyNarJpgZ7ToQJdycyrNk
 feF6IiCYAeMkNrjzeUYcUEV+ZgRVbsxA4xT1e50A/HVOac0qLJyAKZwxq7X6SKAuC2or
 Z8qBSSEu6JhNwFgJ6iOJ831dG+p5zucUhaJDadGgiEDlJWyNj1Ikst7b60pmJCm1H7/1
 ZU4vj4wPlajGnV3gKVg/tep0kh9KWuvxOI1G8GGkUTqwtCo+F2I7BT7Bf7ipegYyP+HB
 ks3g==
X-Gm-Message-State: APjAAAWwCabMG7Weh56uePd3WQr27XZ2fuo5h0IO3TG0ZQLhI6BFaMQn
 CbKQNOfBAb/piWxZD1wdvHrm5gXfCJjaICLVmJQ=
X-Google-Smtp-Source: APXvYqzGqv+wev1io566qMCQSBk8Usb8vOHvyhzTsTli9ft0dX6qZZT5ThpS8E5SOs7v3YSOIfjh2hVo6p2lk1M1uxE=
X-Received: by 2002:a05:6000:367:: with SMTP id
 f7mr23219823wrf.174.1581628191354; 
 Thu, 13 Feb 2020 13:09:51 -0800 (PST)
MIME-Version: 1.0
References: <20200210061544.7600-1-yuehaibing@huawei.com>
 <9351a746-8823-ee26-70da-fd3127a02c91@linux.intel.com>
 <be093793-3514-840a-ff2f-4dc21d8ee7f1@huawei.com>
 <CAEnQRZDWFgXocRJxtc2e7McRCAtod6-GwPJaVMdb4ymBZgSD1w@mail.gmail.com>
 <CAJKOXPcxL2vpWGwO1OL9Vv0g6hzbW-AyGJNn=7Yq2iy10_cbhg@mail.gmail.com>
In-Reply-To: <CAJKOXPcxL2vpWGwO1OL9Vv0g6hzbW-AyGJNn=7Yq2iy10_cbhg@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 13 Feb 2020 23:09:39 +0200
Message-ID: <CAEnQRZA4W-i4zcF8jUL2zp5-dO-iX=KSp5Do2pCK9_oZiVtYEQ@mail.gmail.com>
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

Hi Krzysztof,

Which symbol misses an EXPORT_SYMBOL?
We already have EXPORT_SYMBOL(imx_dsp_ring_doorbell);
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
