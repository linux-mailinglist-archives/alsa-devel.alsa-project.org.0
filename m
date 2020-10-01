Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82079280093
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 15:57:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E656418F0;
	Thu,  1 Oct 2020 15:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E656418F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601560647;
	bh=sDIahvy/Sg0UI6ve8zxZ87e3i6X1+eb/DSSYHKRDqkQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sHeoZ+5FIXjQ/csnpfpe3MOdlQGMa3i0z8GX4gNDorPdyIx3kwSWDE/fEng4c0abn
	 FA3zSfG1en2TELQXdakx4fOKSiYsZe68TSObxOeNZprdxc1CP4xIQ+daubq/Q7bwrW
	 A8SdkQRjXu1u41TkkdxK3Y4B+DOy3E4i5fvb8tDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E5DCF8020C;
	Thu,  1 Oct 2020 15:55:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE046F801F5; Thu,  1 Oct 2020 15:55:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 649EFF800AB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 15:55:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 649EFF800AB
IronPort-SDR: C8Uj0XlDujAH4aNtaVdWxziBPwOboXAB4GdVnALT78as9RsdzkZD9t4VmTmN5YHBodXKuaoHYB
 5+st+s9YgqVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="163585069"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="163585069"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 06:55:31 -0700
IronPort-SDR: BdYafSgJskaggPUUHx0e8jR6Cm1v1NVvtwI9i6INjoVAgGlpkgI6vFOeoupmTjT/zNHvE5KQQr
 kDpRfznsXhTQ==
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="308638274"
Received: from clittlet-mobl.amr.corp.intel.com (HELO [10.212.183.210])
 ([10.212.183.210])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 06:55:30 -0700
Subject: Re: [PATCH 3/6] ASoC: SOF: Create client driver for IPC test
To: Greg KH <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-4-david.m.ertman@intel.com>
 <20201001130907.GD2378679@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <537015d3-6113-76ae-feda-fba0ad3d54e9@linux.intel.com>
Date: Thu, 1 Oct 2020 08:55:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001130907.GD2378679@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, ranjani.sridharan@intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org, parav@nvidia.com,
 jgg@nvidia.com
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

Thanks for the review Greg.

On 10/1/20 8:09 AM, Greg KH wrote:
> On Wed, Sep 30, 2020 at 03:50:48PM -0700, Dave Ertman wrote:
>> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>>
>> Create an SOF client driver for IPC flood test. This
>> driver is used to set up the debugfs entries and the
>> read/write ops for initiating the IPC flood test that
>> would be used to measure the min/max/avg response times
>> for sending IPCs to the DSP.
>>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>> Co-developed-by: Fred Oh <fred.oh@linux.intel.com>
>> Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
>> Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
> 
> Am I reading this series correct in that this is the only "user" of the
> new ancilicary bus/driver code?

This is the first user, and it was meant to demonstrate how the client 
is instantiated and communicates with hardware controlled by the parent. 
The next users will be 'audio probes', which provides the ability to 
extract/inject data into the DSP. We also want to split the existing 
audio cards into several pieces, e.g. the HDMI parts should really be 
presented as a separate card.

The other users will be networking/RDMA, which were actually the first 
to suggest this bus.

> If so, why is it even needed?  These are just debugfs files for testing,
> why does that need to be in a separate device?  What is being "shared"
> here that needs multiple struct devices to handle?
> 
> confused,

The parent PCI device provides access to the DSP firmware/hardware and 
is in complete control of the IPC with the DSP firmware. The parent 
plays the role of a 'server' providing shared hardware access to 
multiple clients.

Why is this needed?

With the current audio solutions, we have a monolithic solution that has 
proven difficult to maintain. We'd really like to expose unrelated DSP 
functionality with different devices.

The best example is really HDMI. HDMI/DP audio interfaces are controlled 
by the same hardware, but are logically independent. What we end-up 
doing is re-adding the same solution over and over for each machine driver:

sound/soc/intel/boards$ git grep hda_dsp_hdmi_build_controls
bxt_da7219_max98357a.c:         return hda_dsp_hdmi_build_controls(card, 
component);
bxt_rt298.c:            return hda_dsp_hdmi_build_controls(card, component);
cml_rt1011_rt5682.c:            return hda_dsp_hdmi_build_controls(card, 
component);
ehl_rt5660.c:   return hda_dsp_hdmi_build_controls(card, 
pcm->codec_dai->component);
glk_rt5682_max98357a.c:         return hda_dsp_hdmi_build_controls(card, 
component);
hda_dsp_common.c:int hda_dsp_hdmi_build_controls(struct snd_soc_card *card,
hda_dsp_common.h:int hda_dsp_hdmi_build_controls(struct snd_soc_card *card,
hda_dsp_common.h:static inline int hda_dsp_hdmi_build_controls(struct 
snd_soc_card *card,
skl_hda_dsp_common.h:   return hda_dsp_hdmi_build_controls(card, component);
sof_da7219_max98373.c:          return hda_dsp_hdmi_build_controls(card,
sof_pcm512x.c:  return hda_dsp_hdmi_build_controls(card, 
pcm->codec_dai->component);
sof_rt5682.c:           return hda_dsp_hdmi_build_controls(card, component);
sof_sdw_hdmi.c:         return hda_dsp_hdmi_build_controls(card, component);

and we also keep adding HDMI-related ASoC topology definitions for all 
the cards.

It would make a lot more sense if we could have ONE HDMI/DP card which 
is created, instead of managing HDMI/DP from the card that is supposed 
to deal with local accessories based on HDaudio/DMIC/SoundWire/I2S.

The audio probes are similar, we want to have a single probe client 
instead of adding audio probes to every single card we have to maintain.

On platforms where the DSP can deal with sensors, this would also allow 
the parent to expose IIO and HID clients.

Going back to this IPC test, maybe the commit message is unclear: we 
already have this functionality in the mainline, it's been very helpful 
for stress tests. What this patch shows is that moving the functionality 
to a client makes it possible to scale to 2 or more clients with a 
simple set of register/unregister. The device model makes it really easy 
to scale.

So yes, you are correct that for now there is a single user with very 
limited functionality. This is intentional to make the reviews simpler, 
but if/when this bus is part of the mainline we'll have additional 
users, and not just from Intel if you look at the reviewed-by tags.

We might even remove the platform devices used for the SoundWire master 
and use this instead :-)

Does this help?


