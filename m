Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 563AE279196
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 22:06:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3E4D1900;
	Fri, 25 Sep 2020 22:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3E4D1900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601064393;
	bh=AQB0BSahI8L+ibi41O7GQSP+8qyylkecT77e4VugyHU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nJDpyeMyrrGOlGt35raKxfO3vC873uPLEzdbZwj/unmncH+mM0lfalYOLEjAn6Q88
	 8FwhqYnQu7BYeXdUqh7qybBOIOjutnyQLVAJ71WU/0J6Fossd1g03bUcZAgc3owx+m
	 5MMuo/coCOoBc/+tGr3RW9Az0Rq/CUv9GBbm8q3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0A0AF801EC;
	Fri, 25 Sep 2020 22:04:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D3EAF801EB; Fri, 25 Sep 2020 22:04:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 836E1F800F6
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 22:04:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 836E1F800F6
IronPort-SDR: IO11BqXJ6QofPczpJ8LFDTq24Qaqhwr7mr7Gz9B8iY4HDMuPI1eRDH2b/pVCTmCHCT0ACZEBiV
 Tle39PknCgrQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="179730561"
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; d="scan'208";a="179730561"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 13:04:39 -0700
IronPort-SDR: 2b2H5dMyniOM5AIj71g4pWIkeKp2HAvhdGVEx7iu1gCcuubqOdUAeV6O11NBwerhRIDvPYuYZc
 lz0kKELc1Puw==
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; d="scan'208";a="513072616"
Received: from mfischmx-mobl1.amr.corp.intel.com (HELO [10.209.30.115])
 ([10.209.30.115])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 13:04:39 -0700
Subject: Re: More Generic Audio Graph Sound Card idea
To: Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
 <097e3fc4-4a84-e101-e6b6-045c3e9e5bfc@nvidia.com>
 <87imdczd4i.wl-kuninori.morimoto.gx@renesas.com>
 <87blhuljkb.wl-kuninori.morimoto.gx@renesas.com>
 <20200925192202.GA9831@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <aceb1334-9b3f-7a62-60e9-6028059d4bf7@linux.intel.com>
Date: Fri, 25 Sep 2020 15:04:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925192202.GA9831@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Sameer Pujar <spujar@nvidia.com>, Linux-ALSA <alsa-devel@alsa-project.org>,
 jonathanh@nvidia.com
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



On 9/25/20 2:22 PM, Mark Brown wrote:
> On Fri, Sep 25, 2020 at 10:43:59AM +0900, Kuninori Morimoto wrote:
> 
>> But multi-Codec side is difficult.
>> Because it is selected via "endpoint" via CPU.
>> No way to select it via "port" and/or "ports".
> 
> Indeed.
> 
>> We might want to select Multi-CPU/Codec by using multi deivces ?
>> in such case, using "ports" idea is not enough.
> 
>> Using extra device like DSP can be more generic ?
> 
>> 	<--- multi-CPU --->
>> 	            *******
>> 	CPU0-1 <--> *     * <--> Codec0
>> 	CPU0-2 <--> *     *
>> 	CPU0-3 <--> *     *
>> 	            *******
> 
> I think this is what we want for SoCs, represent the DSPs explicitly and
> then have the FEs and BEs all be ports on the DSP.  I think a similar
> thing would also work for legacy (I2S & so on) DAIs where we've got more
> endpoints on the DAI - if we define slots on the DAI then from the point
> of view of the DT bindings it's just a very, very inflexible DSP:
> 
>          CPU1 <--> DAI slot A <--> Codec1-1
>                \-> DAI slot B <--> Codec1-2
>          CPU2 <--> DAI slot C <--> Codec1-3
> 
> or whatever.  This doesn't allow for really complex setups that change
> the slot mapping at runtime (TBH those probably need custom cards
> anyway) but I think it should support most cases where TDM causes
> difficulties today.  I'm not sure if we need this for more modern buses
> like SoundWire, I'd hope we can dynamically assign slots at runtime more
> easily, but ICBW.

SoundWire doesn't have a notion of 'slot'. Instead you program the data 
ports for the type of audio data to be transmitted/received.

See some pointers at 
https://mipi.org/sites/default/files/MIPI-SoundWire-webinar-20150121-final.pdf
Pages 42-47 describe the main concepts.

The actual bit allocation can be done in different ways. On the Intel 
side, we use a dynamic allocation. It's my understanding that Qualcomm 
have a static allocation for their amplifier links.

In most cases, a sink port receives exactly what it needs, but for 
playback we have cases where all amplifiers receive the same data (we 
call this 'mirror mode', and each amplifier will be configured to render 
a specific channel from the data received. This is useful to deal with 
orientation/posture changes where the data transmitted on the wires 
doesn't need to be changed. This avoid dynamic re-configurations on the 
DSP + bus sides, only the amplifier settings need to be modified - 
typically via controls.

That said, the mapping of data ports between CPU and codec sides is 
rather static, mostly because devices typically dedicate specific data 
ports to specific functionality. SDCA will not change this, quite the 
opposite, the mapping between ports and audio functionality behind the 
port will be defined in platform firmware.

It's a bit of a stretch but conceptually there is some level of overlap 
between SoundWire data ports and TDM slots, e.g. if in a TDM link you 
used slots 4,5 for headset playback, you might use data port 2 on a 
SoundWire link. It's however a 'logical' mapping, the actual position of 
the bits in the frame is handled by the bit allocation.

Hope this helps!
-Pierre

