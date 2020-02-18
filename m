Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0B5162984
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 16:36:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E4E1169A;
	Tue, 18 Feb 2020 16:35:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E4E1169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582040180;
	bh=fDjEpk+GwtNaJqdjagdErytWvm3mZK+FxW07LTtYxQs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XRxWM39P7GeMyIGij6pCsw6vc9PraZSQGRmmsOrxOpZVf99/8TjJyh7kmZxU96Kyt
	 2dz5843bXFrSOOrUXrkcTjaiM3weDGbl72mrFBL5kpGiSQ6hzI/Qv5fR1fe063mZ1+
	 MIgEdFX4n94ps45T1plnAvMAxO0HdJEu1WR6msl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA558F8014A;
	Tue, 18 Feb 2020 16:34:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BCD6F80148; Tue, 18 Feb 2020 16:34:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_78,SPF_HELO_NONE,
 SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id 4FA6CF80137
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 16:34:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FA6CF80137
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id F4223812F;
 Tue, 18 Feb 2020 15:35:16 +0000 (UTC)
Date: Tue, 18 Feb 2020 07:34:29 -0800
From: Tony Lindgren <tony@atomide.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio
 graph card
Message-ID: <20200218153429.GJ35972@atomide.com>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
 <20200214170322.GZ64767@atomide.com>
 <d9a43fcb-ed0f-5cd5-7e22-58924d571d17@ti.com>
 <20200217231001.GC35972@atomide.com>
 <20200217233623.GE35972@atomide.com>
 <07989190-e110-13c4-50ea-875431725b47@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07989190-e110-13c4-50ea-875431725b47@ti.com>
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org,
 Merlijn Wajer <merlijn@wizzup.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>,
 "Arthur D ." <spinal.by@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>
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

* Peter Ujfalusi <peter.ujfalusi@ti.com> [200218 15:28]:
> 
> 
> On 18/02/2020 1.36, Tony Lindgren wrote:
> > * Tony Lindgren <tony@atomide.com> [200217 23:10]:
> >> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200217 12:10]:
> >>> On 14/02/2020 19.03, Tony Lindgren wrote:
> >>>> But right now in droid4 voice call case mcbsp is just the i2s transport,
> >>>> and everything happens betwee the modem and the cpcap pmic.
> >>>
> >>> Iow you don't need McBSP DAI at all. If you would have added the dummy
> >>> codec to McBSP !3 and use that, it would work in a same way, or to DMIC
> >>> or McPDM...
> >>>
> >>> The McBSP ops are NULL for the dummy dai, so McBSP is turned off.
> >>
> >> Hmm yeah I don't know if the cpcap codec on the same mcbsp needs
> >> mcbsp for voice call.
> >>
> >> According to Sebastian sounds like mcbsp can be idle at that point.
> >>
> >> But what about capture of voice call at the mcbsp from the
> >> TDM slot? In that case mcbsp would be active.
> > 
> > Looks like only initializing only one mcbsp3 instance here
> > instead of two will produce an oops as below.
> > 
> > I'm not sure how this is supposed to work for
> > snd-soc-audio-graph-card with multipe endpoints connected
> > to just one mcbsp dai instance?
> > 
> > Regards,
> > 
> > Tony
> > 
> > 8< -------------------
> What is the kernel version?
> The context is missing...
> Who printed the line:
> dev_err(dev, "ASoC: Failed to register DAIs: %d\n", ret);

Oh sorry, this was just a quick test with droid4-pending-v5.5 branch
with only one mcbsp dai initialized.

> This is only possible if snd_soc_component_initialize() fail, which can
> only fail if snd_soc_component_unique_name() fails.
> 
> > Internal error: Oops: 805 [#1] PREEMPT SMP ARM
> > snd_soc_del_component_unlocked+0xf4/0x110
> 
> Not too helpful ;)

Yeah I have not looked at it closer so far..

Regards,

Tony

> > ...
> > [   39.616027] Backtrace:
> > [   39.616149] [<bf3f6bc4>] (snd_soc_del_component_unlocked [snd_soc_core]) from [<bf3f8ff4>] (snd_soc_add_component+0x238/0x374 [snd_s)
> > [   39.616149]  r7:00000002 r6:00000002 r5:ec9a0e78 r4:00000122
> > [   39.678283] qmi_wwan 1-1:1.6: cdc-wdm1: USB WDM device
> > [   39.739074] [<bf3f8dbc>] (snd_soc_add_component [snd_soc_core]) from [<bf3f9180>] (snd_soc_register_component+0x50/0x60 [snd_soc_cor)
> > [   39.739074]  r10:bf4582d0 r9:ec9d0840 r8:00000002 r7:00000002 r6:ec9d0640 r5:bf4584ac
> > [   39.800842] asoc-audio-graph-card soundcard: using device tree for GPIO lookup
> > [   39.808685]  r4:eed52410
> > [   39.862304] [<bf3f9130>] (snd_soc_register_component [snd_soc_core]) from [<bf4088b4>] (devm_snd_soc_register_component+0x54/0x90 [s)
> > [   39.862304]  r7:ec9d0640 r6:bf4584ac r5:ec9d3040 r4:eed52410
> > [   39.925048] qmi_wwan 1-1:1.6 wwan1: register 'qmi_wwan' at usb-4a064800.ohci-1, WWAN/QMI device, 2e:59:df:3f:4f:ef
> > [   39.984558] [<bf408860>] (devm_snd_soc_register_component [snd_soc_core]) from [<bf456fb8>] (asoc_mcbsp_probe+0x3e8/0x574 [snd_soc_o)
> > [   39.984558]  r9:ec9d0840 r8:ec9f4000 r7:eed52410 r6:00000000 r5:eed52400 r4:ec9d0840
> > [   39.984588] [<bf456bd0>] (asoc_mcbsp_probe [snd_soc_omap_mcbsp]) from [<c068475c>] (platform_drv_probe+0x58/0xa8)
> > [   39.984619]  r10:00000000 r9:0000002e r8:bf459014 r7:00000000 r6:bf459014 r5:00000000
> > [   40.044342] of_get_named_gpiod_flags: can't parse 'pa-gpios' property of node '/soundcard[0]'
> > [   40.051788]  r4:eed52410
> > [   40.100769] [<c0684704>] (platform_drv_probe) from [<c06820ac>] (really_probe+0x1ec/0x358)
> > 
> 
> - Péter
> 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
