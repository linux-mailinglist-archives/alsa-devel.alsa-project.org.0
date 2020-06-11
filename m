Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3F31F6D22
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 20:03:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D15BC1685;
	Thu, 11 Jun 2020 20:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D15BC1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591898610;
	bh=J25mK123p6KkJI8EE/SDMdBs1ivKDeXUzx1Ud5I/AsU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W0FxOtGKJz826mFlBEcczX8Md+ZsZsZV5rXoDY0528wyZlaDhxs4sHRu+zS1jRwKD
	 ZKzHmaZCIdHQ09wsJd817NHotFpK4Qddp3VO8wn414QkzGHZSH0dfjULgVP5l3L30p
	 fEupmBN8vJgrWli50YUZIPij9swpTuZST4hyMbHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1528EF80290;
	Thu, 11 Jun 2020 20:01:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 427F3F8028D; Thu, 11 Jun 2020 20:01:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AE12F80058
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 20:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AE12F80058
IronPort-SDR: IEHaTNCHGQYdNDmv9fUw+4voaCnwf/+WGkP29sDtFVimuJkdrIibVFhC/lPBfCiFR198t/4n1J
 Af3/pTA8f2xg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 11:01:37 -0700
IronPort-SDR: 4mc9XBZXZo+wemmj8uKa7d2UqSxpO20iovm5AMvv5fHTrVUVT+b3HebTXdc8VN4ApYNHX3/vtQ
 QojfT3na5Vww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,500,1583222400"; d="scan'208";a="473782824"
Received: from dmarquez-mobl.amr.corp.intel.com (HELO [10.254.70.176])
 ([10.254.70.176])
 by fmsmga006.fm.intel.com with ESMTP; 11 Jun 2020 11:01:35 -0700
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: unsolicited RIRB response
To: "Lu, Brent" <brent.lu@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1591883073-17190-1-git-send-email-brent.lu@intel.com>
 <b7e0b822a9deea506acaa40e0e31cc9f488bb446.camel@linux.intel.com>
 <DM6PR11MB4316108BCF449D52E49C7E4297800@DM6PR11MB4316.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ce8bb5fc-ae95-c34d-abbd-8c54a6cac629@linux.intel.com>
Date: Thu, 11 Jun 2020 13:01:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB4316108BCF449D52E49C7E4297800@DM6PR11MB4316.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "sound-open-firmware@alsa-project.orgDRIVERS"
 <sound-open-firmware@alsa-project.orgDRIVERS>, "commit_signer:6/16=38%,
 authored:6/16=38%, added_lines:123/248=50%, removed_lines:36/84=43%,
 Kai Vehmanen DRIVERS \)" <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Keyon Jie <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "authored:2/16=12%, added_lines:21/248=8%, removed_lines:5/84=6%, \),
 Liam Girdwood DRIVERS \)" <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "Daniel Baluta DRIVERS \)" <daniel.baluta@nxp.com>,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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



On 6/11/20 12:09 PM, Lu, Brent wrote:
>> Hi Brent,
>>
>> Thanks for the patch. Is this fix for a specific issue you're seeing?
>> If so, could you please give us some details about it?
>>
>> Thanks,
>> Ranjani
> 
> Hi Ranjani,
> 
> It's reported to happen on GLK Chromebook 'Fleex' that sometimes it
> cannot output the audio stream to external display. The kernel is
> Chrome v4.14 branch. Following is the reproduce step provided by
> ODM but I could reproduce it simply running aplay or cras_test_client
> so I think it's not about the cable plug/unplug handling.
> 
> What steps will reproduce the problem?
> 1.      Play YouTube video on Chromebook and connect it to external monitor with Type C to DP dongle
> 2.      Press monitor power button to turn off the monitor
> 3.      Press monitor power button again to turn on the monitor
> 4.      Continue to play YouTube video and check audio playback
> 5.      No sound comes out from built-in speaker of external monitor when turn on external monitor
> 
> I added debug messages to print the RIRBWP register and realize that
> response could come between the read of RIRBWP in the
> snd_hdac_bus_update_rirb() function and the interrupt clear in the
> hda_dsp_stream_interrupt() function. The response is not handled but
> the interrupt is already cleared. It will cause timeout unless more
> responses coming to RIRB.
> 
> [   69.173507] sof-audio-pci 0000:00:0e.0: snd_hdac_bus_get_response: addr 0x2
> [   69.173567] sof-audio-pci 0000:00:0e.0: snd_hdac_bus_update_rirb: cmds 1 res 0 rp 21 wp 21
> => handle the response in slot 21
> [   69.173570] sof-audio-pci 0000:00:0e.0: snd_hdac_bus_update_rirb: updated wp 22
> => new response in slot 22 but not handled
> [   70.174089] sof-audio-pci 0000:00:0e.0: snd_hdac_bus_get_response: timeout, wp 22
> [   70.174106] HDMI HDA Codec ehdaudio0D2: codec_read: fail to read codec
> 
> I found there is a commit addressing this issue and cherry-pick it to the
> Chrome v4.14 but the issue is still there. I think more loop does not help
> because eventually there will be response coming in the
> snd_hdac_bus_update_rirb() function and become unhandled response
> in the last loop.

IIRC the loop was added because on some versions of the hardware we seem 
to miss stream interrupts - and I believe this was inspired by the same 
solution with the legacy HDaudio driver.

Maybe we need to do something better for unsolicited responses but I'd 
be surprised if we can remove this loop - this sounds like asking for 
trouble.

> 
> commit 6297a0dc4c14a62bea5a9137ceef280cb7a80665
> Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Date:   Wed Jun 12 12:23:40 2019 -0500
> 
>      ASoC: SOF: Intel: hda: modify stream interrupt handler
> 
>      Modify the stream interrupt handler to always wake up the
>      IRQ thread if the status register is valid. The IRQ thread
>      performs the check for stream interrupts and RIRB interrupts
>      in a loop to handle the case of missed interrupts when an
>      unsolicited response from the codec is received just before the
>      stream interrupt handler is completed.
> 
> 
> Regards,
> Brent
> 
