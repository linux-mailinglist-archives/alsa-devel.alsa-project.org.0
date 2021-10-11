Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F294297F1
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 22:08:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36A0316CC;
	Mon, 11 Oct 2021 22:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36A0316CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633982907;
	bh=0jYNLfkakyL2f/xSc1EUsHdxIrw9lr5lR5BO0nBc8uA=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dSZcysS4JOK2EBYZH2+7pyUbQlQdDn34u6a4l4L3hXSRZCfH3LKj72KI8w5w+cVVN
	 xjdwP40mP/n++NlmkFZL2O49E7xFL1UEmeEhUghBCRDTmO05AZ7THXuMsdyWv3xbC/
	 hbza22HSJyal+wtLSqjE30AOXIE71bL+BEaij6/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 872DDF8028D;
	Mon, 11 Oct 2021 22:07:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 038D8F80269; Mon, 11 Oct 2021 22:07:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=NICE_REPLY_A,PRX_BODY_78,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67539F800C0
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 22:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67539F800C0
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="226917484"
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="226917484"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 13:06:55 -0700
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="562345735"
Received: from cpeng4-mobl.amr.corp.intel.com (HELO [10.213.182.8])
 ([10.213.182.8])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 13:06:54 -0700
Subject: Re: [RFC PATCH v2 0/5] ASoC: soc-pcm: fix trigger race conditions
 with shared BE
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
References: <20211004225441.233375-1-pierre-louis.bossart@linux.intel.com>
 <cce82420-d744-ee43-d514-b77ac4905ffa@nvidia.com>
 <1efa1c31-7342-05f8-5f73-95e2462d4179@linux.intel.com>
 <3683cf39-632b-50df-c65d-63779c464850@nvidia.com>
 <11257d77-9975-3b00-94da-5dc1b5c95fc6@linux.intel.com>
 <s5hk0ip9js7.wl-tiwai@suse.de>
 <ff43fede-aa66-3cb7-6365-e1f279cd135f@linux.intel.com>
 <s5hzgrk98y9.wl-tiwai@suse.de>
 <80882fe6-ea30-43f6-8d83-8995dd28c748@linux.intel.com>
 <s5hwnmo96vh.wl-tiwai@suse.de>
 <60c6a90b-290d-368c-ce61-4d86e70eaa78@linux.intel.com>
 <s5hily88rri.wl-tiwai@suse.de>
 <75894aba-ca1a-51d6-df7d-ad53fcd89f79@linux.intel.com>
 <s5hee8w82ng.wl-tiwai@suse.de>
 <e9340874-320a-8fc6-f3a4-9cf77f85db25@linux.intel.com>
 <s5hczof7eoq.wl-tiwai@suse.de>
 <dcdb8f74-51db-86a1-959f-909dfac22b26@linux.intel.com>
 <29397354-dc5b-7837-c71b-df4bde707df2@linux.intel.com>
Message-ID: <8c1353f0-e897-e7b0-c7b9-5712b05ac91f@linux.intel.com>
Date: Mon, 11 Oct 2021 15:06:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <29397354-dc5b-7837-c71b-df4bde707df2@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sameer Pujar <spujar@nvidia.com>, vkoul@kernel.org, broonie@kernel.org,
 Gyeongtaek Lee <gt82.lee@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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


>>> Basically we need to protect two things:
>>> - The BE links
>>> - The concurrent accesses to BEs
>>> The former belongs to each FE that holds the links, and the FE stream
>>> lock would cover.  The latter is rather a per-BE business.
>>>
>>> An oft-seen risk of multiple locks is deadlocking, but in this case,
>>> as long as we keep the lock order FE->BE, nothing wrong can happen.
>>
>> famous last words  "nothing wrong can happen." :-)
>>
>> I already added a helper to do this FE lock, I can easily replace the
>> implementation to remove the spin_lock and use the FE PCM lock.
>> we might even add the lock in the definition of for_each_dpcm_be() to
>> avoid misses.
>>
>> Let me try this out today, thanks for the suggestions.
> 
> well, it's not successful at all...
> 
> When I replace the existing dpcm_lock with the FE PCM lock as you
> suggested, without any additional changes, speaker-test produces valid
> audio on the endpoints, but if I try a Ctrl-C or limit the number of
> loops with the '-l' option, I hear an endless loop on the same buffer
> and I have to power cycle my test device to stop the sound.
> 
> See 2 patches attached, the first patch with the introduction of the
> helper works fine, the second with the use of the FE PCM lock doesn't.
> In hindsight I am glad I worked on minimal patches, one after the other,
> to identify problems.
> 
> And when I add the BE lock, then nothing happens. Device stuck and no
> audio...
> 
> There must be something we're missing related to the locking...

And indeed there's a deadlock!

snd_pcm_period_elapsed() takes the FE pcm stream lock, and will call
snd_pcm_trigger. So if we also take the pcm stream lock in the BE
trigger, there's a conceptual deadlock: we painted ourselves in a corner
by using the same lock twice.

Takashi, are you really sure we should protect these for_each_dpcm_be()
loops with the same pcm lock? it seems like asking for trouble to
revisit the ALSA core just to walking through a list of BEs? Would you
object to changing dpcm_lock as I suggested, but not interfering with
stream handling?

See the traces below based on the hack in
https://github.com/plbossart/sound/tree/test/dpcm-lock-loop-on-stop

[   67.892082] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_sof_pcm_period_elapsed_work: plb taking lock
[   67.892088] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_sof_pcm_period_elapsed_work: plb taking lock - done
[   67.892092] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_pcm_period_elapsed_under_stream_lock: start
[   67.892096] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_pcm_period_elapsed_under_stream_lock: check running
[   67.892099] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_pcm_period_elapsed_under_stream_lock: check update_hw_ptr0
[   67.892103] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_pcm_update_hw_ptr0: start
[   67.892110] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_pcm_update_hw_ptr0: delta
[   67.892113] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_pcm_update_hw_ptr0: check1
[   67.892116] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_pcm_update_hw_ptr0: no_delta_check
[   67.892119] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_pcm_update_hw_ptr0: playback silence
[   67.892123] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_pcm_update_hw_ptr0: checks 3
[   67.892126] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_pcm_update_hw_ptr0: done
[   67.892129] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_pcm_update_state: start
[   67.892132] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_pcm_update_state: before draining
[   67.892136] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_pcm_update_state: before draining2
[   67.892139] skl_hda_dsp_generic skl_hda_dsp_generic:
snd_pcm_update_state: before snd_pcm_drain_done
[   67.892143] skl_hda_dsp_generic skl_hda_dsp_generic: snd_pcm_do_stop:
start
[   67.892147] skl_hda_dsp_generic skl_hda_dsp_generic: snd_pcm_do_stop:
before TRIGGER_STOP

<<< we never reach the end of this TRIGGER_STOP

[   67.892153] sof-audio-pci-intel-cnl 0000:00:1f.3: pcm: trigger stream
0 dir 0 cmd 0
[   67.892166] sof-audio-pci-intel-cnl 0000:00:1f.3: ipc tx: 0x60050000:
GLB_STREAM_MSG: TRIG_STOP
[   67.892396] sof-audio-pci-intel-cnl 0000:00:1f.3: ipc tx succeeded:
0x60050000: GLB_STREAM_MSG: TRIG_STOP
[   67.892408] sof-audio-pci-intel-cnl 0000:00:1f.3: FW Poll Status:
reg[0x160]=0x140000 successful
[   67.892418] sof-audio-pci-intel-cnl 0000:00:1f.3: ipc tx: 0x60030000:
GLB_STREAM_MSG: PCM_FREE
[   67.892564] sof-audio-pci-intel-cnl 0000:00:1f.3: ipc tx succeeded:
0x60030000: GLB_STREAM_MSG: PCM_FREE
[   67.892571]  HDA Analog: dpcm_be_dai_trigger: BE TRIGGER_STOP start
[   67.892575]  HDA Analog: dpcm_be_dai_trigger: BE TRIGGER_STOP check
can_be_free_stop
[   67.892579]  HDA Analog: snd_soc_dpcm_check_state: plb: taking fe
lock_irqsave from snd_soc_dpcm_check_state

<<< checkmate at this point, we're trying to take the same lock twice.

