Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B6A15A573
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 10:57:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3570167E;
	Wed, 12 Feb 2020 10:56:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3570167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581501434;
	bh=dAnXWQ0/Ki/H5BOSIIxIsxx/gaxum68So6rZwN+Y6bA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DQ7LjblG2QFdnz27OPE3sTwT0Ez66ZuhSETJ3b6muRZ7Ip6o3HWWT/2QwNlG9PKk6
	 9hC9vRk0OveJIe/akbKQDFA832qG6nsoB45h42qO01b4nIyRMt6PHeTCyKnlhwEO0u
	 a/8oyCT65lh1HKh6p4fJeVP846l/Jk9dr/NzJgn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 013D6F80125;
	Wed, 12 Feb 2020 10:55:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D561DF80157; Wed, 12 Feb 2020 10:55:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33E99F80125
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 10:55:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33E99F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZQTj4phV"
Received: by mail-wr1-x442.google.com with SMTP id u6so1436601wrt.0
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 01:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5qqmmgh1mRA8+uKd3OvijHJxqdZDdPNm7C7N0rHwtQ0=;
 b=ZQTj4phV6Ct6hAZ9+3hpFPdlE3z+Cx/i/rtMRiLdQSrUdYcPxaojrRblBDxxa9sUFr
 z4/+4zKw6rfRxYW1MyKnDCMlDrNwIEqHnZ2oRp6ckiZA6XWcT8zUmtRvkopMkOfRmunq
 a0X31u+6mOY7gexXKHddCIOlf2V9zMC2huzBvbOBm5jznmroIIpWafVfqoJLwEYdE5M8
 pT2y5sVIRhjfuakBod8G4f5eJXiYCUZ+8j3897A0IK+3idy4rTesYmDiBfm2L03KOUxi
 nS2WG4GzIK8YAls2dsBBOYXz/riEAmjDZi9MO3zW9DqQMRvwBZGz0VJ08eC6f3J96v2l
 nhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5qqmmgh1mRA8+uKd3OvijHJxqdZDdPNm7C7N0rHwtQ0=;
 b=lxTRSYXWV8mBGw4xmWLzmLrQy0q7iTkv83Gp58atXxc1GmeOPmMmSLfQQPvG5oV6UB
 NMS+sLHeJ2enaCXHIYYRCfnlHGAVHgafuoF001JJ50kIYTZe0YX3HZnu4+mKDbR02Wbr
 eJOhjVO3QqNTGRBo9lYzfdpGhjWwbTPn29OAnAkMKMSaweHUffByLNMqSakJTRDMZq9I
 ZR3N+XFkSCzqHM+tlBQf6EHQ4r80MUg5W3iNEK+YpQFz70i8+ugMj0UYTf5opO/6Tsqn
 TccPBBXn3iBdL3B6hZ+eyX2vPnPe2j/TxAewaO/m3I0T7lVjDBNGAMDOnlsn2CktWtJh
 NptQ==
X-Gm-Message-State: APjAAAVGttCUBLJVX0utcz5haReeIxd5wfOl9S3ucpK4kdiVVJqm79qP
 4+7tisBoj0PBTrGGQx/xPAPJZlkL1ukV07ni/Cs=
X-Google-Smtp-Source: APXvYqxL9Eo4qb2sOJrd1wkpY5K5/0EEQ1noRNaNgdXfALwcSpj9a+jGRMYLeglfrh/aGIAZ7gTQTMGTxHsaLfrIN3k=
X-Received: by 2002:adf:f7c6:: with SMTP id a6mr15060118wrq.164.1581501328222; 
 Wed, 12 Feb 2020 01:55:28 -0800 (PST)
MIME-Version: 1.0
References: <20200210061544.7600-1-yuehaibing@huawei.com>
 <9351a746-8823-ee26-70da-fd3127a02c91@linux.intel.com>
 <be093793-3514-840a-ff2f-4dc21d8ee7f1@huawei.com>
 <CAEnQRZDWFgXocRJxtc2e7McRCAtod6-GwPJaVMdb4ymBZgSD1w@mail.gmail.com>
 <CAJKOXPcxL2vpWGwO1OL9Vv0g6hzbW-AyGJNn=7Yq2iy10_cbhg@mail.gmail.com>
In-Reply-To: <CAJKOXPcxL2vpWGwO1OL9Vv0g6hzbW-AyGJNn=7Yq2iy10_cbhg@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 12 Feb 2020 11:55:16 +0200
Message-ID: <CAEnQRZB2n+NOEete9fe7=EU9D2gfURf52NnUZTRDM0n9ey_FSw@mail.gmail.com>
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

This is a good point. Will have a deeper look at this asap and sent a
fix .

>
> > So, I think we should change the Fixes tag. Are there
> > any clear rules on when to use select vs depends?
> >
> > On my side, I know what both are doing but it is not clear
> > when to use them.
>
> Visible symbols usually should not be selected. The same with symbols
> with dependencies. The docs have this rule mentioned.

I see. Thanks!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
