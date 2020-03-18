Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9534E18A255
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 19:30:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D4EF1720;
	Wed, 18 Mar 2020 19:29:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D4EF1720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584556200;
	bh=YZjwrfCAoox3CiK61xWloD+s6OfID6mWmAEkzY1D9os=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JzMhn7q0gd4OwyDpYf+EBdrXMw/58zGaDXmmp69AzgEi/wnLsa20rwFitdY0e1eLb
	 pST08jQaLC4vpGHPWXUs/mZ+JQP2GH/lHI6G/tp0s9k7Cn7p3rX8jdvhC34yQW9CHm
	 ABnvU7yZU2upia8o6v/LHA25PSejaDBpKHVeiIGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DC44F8015B;
	Wed, 18 Mar 2020 19:28:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECED3F80139; Wed, 18 Mar 2020 19:28:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB459F800C0
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 19:28:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB459F800C0
IronPort-SDR: UIHFXeVqSiTHN0LoIVt+Bhz965JutEEAz46IBMlFzc7jmLMixBjA+6TF3kISP03S8Q86afHb45
 /8LjezFroQug==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 11:28:02 -0700
IronPort-SDR: BMWnTxp5mP7hpDPV12jYZlOkIw0FwIKIg9ugR2uLOimWaoODTZ5nQpw0Ad0dNZVDOqeElTK3qu
 VY9pcQ9/POpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; d="scan'208";a="238266266"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.249.155.222])
 ([10.249.155.222])
 by fmsmga008.fm.intel.com with ESMTP; 18 Mar 2020 11:27:59 -0700
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
To: Dominik Brodowski <linux@dominikbrodowski.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200318063022.GA116342@light.dominikbrodowski.net>
 <41d0b2b5-6014-6fab-b6a2-7a7dbc4fe020@linux.intel.com>
 <20200318123930.GA2433@light.dominikbrodowski.net>
 <d7a357c5-54af-3e69-771c-d7ea83c6fbb7@linux.intel.com>
 <20200318162029.GA3999@light.dominikbrodowski.net>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <e49eec28-2037-f5db-e75b-9eadf6180d81@intel.com>
Date: Wed, 18 Mar 2020 19:27:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200318162029.GA3999@light.dominikbrodowski.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, curtis@malainey.com,
 Keyon Jie <yang.jie@linux.intel.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, liam.r.girdwood@linux.intel.com, broonie@kernel.org
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

On 2020-03-18 17:20, Dominik Brodowski wrote:
> On Wed, Mar 18, 2020 at 10:13:54AM -0500, Pierre-Louis Bossart wrote:
>>>>> While 5.5.x works fine, mainline as of ac309e7744be (v5.6-rc6+) causes me
>>>>> some sound-related trouble: after boot, the sound works fine -- but once I
>>>>> suspend and resume my broadwell-based XPS13, I need to switch to headphone
>>>>> and back to speaker to hear something. But what I hear isn't music but
>>>>> garbled output.

> 
> I had (see 18d78b64fddc), but not any more in years (and I'd like to keep
> using I2S, which has worked flawlessly in these years).
> 

Due to pandemic I'm working remotely and right now won't be able to test 
audio quality so focusing on the stream==NULL issue. And thus we got to 
help each other out : )

Could you verify issue reproduces on 5.6.0-rc1 on your machine? On my 
RVPs looks like it does. There is one more thing that worries me. After 
enabling dbg logs I see some IPCs queried but not delivered (dsp busy):

[  170.330009] snd_soc_core:dpcm_fe_dai_prepare:  System PCM: ASoC: 
prepare FE System PCM
[  170.330019] snd_soc_core:dpcm_be_dai_prepare:  Codec: ASoC: prepare 
BE Codec
[  170.347068] snd_soc_core:dpcm_dapm_stream_event:  Codec: ASoC: BE 
Codec event 1 dir 0
[  170.348814] snd_soc_core:dpcm_do_trigger:  Codec: ASoC: trigger BE 
Codec cmd 1
[  170.348826] snd_soc_core:dpcm_dai_trigger_fe_be:  System PCM: ASoC: 
post trigger FE System PCM cmd 1
[  170.348839] snd_soc_sst_ipc:ipc_tx_msgs: haswell-pcm-audio 
haswell-pcm-audio: ipc_tx_msgs dsp busy
[  182.583710]  System PCM: ASoC: trigger FE cmd: 7 failed: -22
[  182.583811] snd_soc_core:dpcm_dai_trigger_fe_be:  System PCM: ASoC: 
pre trigger FE System PCM cmd 0
[  182.583839] snd_soc_core:dpcm_do_trigger:  Codec: ASoC: trigger BE 
Codec cmd 0
[  182.583862] snd_soc_core:dpcm_fe_dai_hw_free:  System PCM: ASoC: 
hw_free FE System PCM
[  182.583872] snd_soc_core:dpcm_be_dai_hw_free:  Codec: ASoC: hw_free 
BE Codec
[  182.584127] snd_soc_core:dpcm_fe_dai_hw_free:  System PCM: ASoC: 
hw_free FE System PCM
[  182.584144] snd_soc_core:dpcm_be_dai_hw_free:  Codec: ASoC: hw_free 
BE Codec
[  182.584161] snd_soc_core:dpcm_be_dai_shutdown:  Codec: ASoC: close BE 
Codec
[  182.584211] snd_soc_sst_ipc:ipc_tx_msgs: haswell-pcm-audio 
haswell-pcm-audio: ipc_tx_msgs dsp busy
[  182.587411] snd_soc_core:dpcm_fe_dai_shutdown:  System PCM: ASoC: 
close FE System PCM
[  182.587427] haswell-pcm-audio haswell-pcm-audio: warning: stream is 
NULL, no stream to reset, ignore it.
[  182.587435] haswell-pcm-audio haswell-pcm-audio: warning: stream is 
NULL, no stream to free, ignore it.
[  182.587451] snd_soc_core:dpcm_be_disconnect:  System PCM: ASoC: BE 
playback disconnect check for Codec
[  182.587460] snd_soc_core:dpcm_be_disconnect:  System PCM: freed DSP 
playback path System PCM -> Codec
[  187.626116] snd_soc_core:snd_soc_close_delayed_work:  System PCM: 
ASoC: pop wq checking: Playback status: inactive waiting: yes

Will be scanning IPCs now. Seems like regression has been introduced 
immediately in 5.6.0-rc1 as linux-stable 5.5.7 works just fine for me.

Regards,
Czarek
