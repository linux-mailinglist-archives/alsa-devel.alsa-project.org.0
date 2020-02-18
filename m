Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B24162965
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 16:28:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D0B31694;
	Tue, 18 Feb 2020 16:27:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D0B31694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582039687;
	bh=wzc0zIlEwu45dbrD56x1w0aInAlzfTNpekdTFYzoNjE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ecfU8ZKKOLHIQZ9qeKJjyKf5YCWP5v66L5mh0XgM2bsle1DmqN64PvIrqyrYFl3G0
	 LBoyv+gTynC4FyM8uzO6fBF7hHvDTVapQg5X+9AFkJ9zvfk5G/DjYn7RqkZLVT2E9E
	 kwtKJX0lSCKKvkY90OG/rqWtq3iYuMg/qE4YpMbo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D08DF8014A;
	Tue, 18 Feb 2020 16:26:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C89FF80148; Tue, 18 Feb 2020 16:26:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D050F800C4
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 16:26:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D050F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UngOwrZG"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01IFQII7094481;
 Tue, 18 Feb 2020 09:26:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582039578;
 bh=VR7aPtasJXpkWrX3UGWXepVmea7kqpiAckhtvEWZT00=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=UngOwrZGQtSXmlx0x/yjHHO6XHrLOFPTlJpJWfZl/1w3e7LDaHRck0TmLlSDCldnQ
 wSc+locQe2d2KX1F2FOw4nQ8WpapSyMWe6Gx5tShy0h5uiU/VFIRxBKZDmJQDTlhR3
 9/ykuTeM+6n0gwmhY+A9X/1w0VnOQCCsF1r+4sK8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01IFQIqp070801
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Feb 2020 09:26:18 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 18
 Feb 2020 09:26:17 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 18 Feb 2020 09:26:17 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01IFQEI7084736;
 Tue, 18 Feb 2020 09:26:14 -0600
Subject: Re: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio
 graph card
To: Tony Lindgren <tony@atomide.com>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
 <20200214170322.GZ64767@atomide.com>
 <d9a43fcb-ed0f-5cd5-7e22-58924d571d17@ti.com>
 <20200217231001.GC35972@atomide.com> <20200217233623.GE35972@atomide.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <07989190-e110-13c4-50ea-875431725b47@ti.com>
Date: Tue, 18 Feb 2020 17:26:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200217233623.GE35972@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org,
 Merlijn Wajer <merlijn@wizzup.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>, "Arthur D
 ." <spinal.by@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>
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



On 18/02/2020 1.36, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [200217 23:10]:
>> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200217 12:10]:
>>> On 14/02/2020 19.03, Tony Lindgren wrote:
>>>> But right now in droid4 voice call case mcbsp is just the i2s transport,
>>>> and everything happens betwee the modem and the cpcap pmic.
>>>
>>> Iow you don't need McBSP DAI at all. If you would have added the dummy
>>> codec to McBSP !3 and use that, it would work in a same way, or to DMIC
>>> or McPDM...
>>>
>>> The McBSP ops are NULL for the dummy dai, so McBSP is turned off.
>>
>> Hmm yeah I don't know if the cpcap codec on the same mcbsp needs
>> mcbsp for voice call.
>>
>> According to Sebastian sounds like mcbsp can be idle at that point.
>>
>> But what about capture of voice call at the mcbsp from the
>> TDM slot? In that case mcbsp would be active.
> 
> Looks like only initializing only one mcbsp3 instance here
> instead of two will produce an oops as below.
> 
> I'm not sure how this is supposed to work for
> snd-soc-audio-graph-card with multipe endpoints connected
> to just one mcbsp dai instance?
> 
> Regards,
> 
> Tony
> 
> 8< -------------------
What is the kernel version?
The context is missing...
Who printed the line:
dev_err(dev, "ASoC: Failed to register DAIs: %d\n", ret);

This is only possible if snd_soc_component_initialize() fail, which can
only fail if snd_soc_component_unique_name() fails.

> Internal error: Oops: 805 [#1] PREEMPT SMP ARM
> snd_soc_del_component_unlocked+0xf4/0x110

Not too helpful ;)

> ...
> [   39.616027] Backtrace:
> [   39.616149] [<bf3f6bc4>] (snd_soc_del_component_unlocked [snd_soc_core]) from [<bf3f8ff4>] (snd_soc_add_component+0x238/0x374 [snd_s)
> [   39.616149]  r7:00000002 r6:00000002 r5:ec9a0e78 r4:00000122
> [   39.678283] qmi_wwan 1-1:1.6: cdc-wdm1: USB WDM device
> [   39.739074] [<bf3f8dbc>] (snd_soc_add_component [snd_soc_core]) from [<bf3f9180>] (snd_soc_register_component+0x50/0x60 [snd_soc_cor)
> [   39.739074]  r10:bf4582d0 r9:ec9d0840 r8:00000002 r7:00000002 r6:ec9d0640 r5:bf4584ac
> [   39.800842] asoc-audio-graph-card soundcard: using device tree for GPIO lookup
> [   39.808685]  r4:eed52410
> [   39.862304] [<bf3f9130>] (snd_soc_register_component [snd_soc_core]) from [<bf4088b4>] (devm_snd_soc_register_component+0x54/0x90 [s)
> [   39.862304]  r7:ec9d0640 r6:bf4584ac r5:ec9d3040 r4:eed52410
> [   39.925048] qmi_wwan 1-1:1.6 wwan1: register 'qmi_wwan' at usb-4a064800.ohci-1, WWAN/QMI device, 2e:59:df:3f:4f:ef
> [   39.984558] [<bf408860>] (devm_snd_soc_register_component [snd_soc_core]) from [<bf456fb8>] (asoc_mcbsp_probe+0x3e8/0x574 [snd_soc_o)
> [   39.984558]  r9:ec9d0840 r8:ec9f4000 r7:eed52410 r6:00000000 r5:eed52400 r4:ec9d0840
> [   39.984588] [<bf456bd0>] (asoc_mcbsp_probe [snd_soc_omap_mcbsp]) from [<c068475c>] (platform_drv_probe+0x58/0xa8)
> [   39.984619]  r10:00000000 r9:0000002e r8:bf459014 r7:00000000 r6:bf459014 r5:00000000
> [   40.044342] of_get_named_gpiod_flags: can't parse 'pa-gpios' property of node '/soundcard[0]'
> [   40.051788]  r4:eed52410
> [   40.100769] [<c0684704>] (platform_drv_probe) from [<c06820ac>] (really_probe+0x1ec/0x358)
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
