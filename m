Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 552192C95C0
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 04:26:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D34121762;
	Tue,  1 Dec 2020 04:25:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D34121762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606793208;
	bh=7b1L0bygszCcEBgOjHXP4Fy7+Qxcln2aHZ/tjpH78Lo=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kXt5bNACrW93gDEZN2DuUqA3CPWlv7bltltkB4Gaeg0OFpqqn6f5YLQ+1rY5tXzYG
	 jgcL7kanhFSdD4cCYD1Y9V9elK7Hs5I5Nm3X00YJc7TkL/FtGLwLL2Htr9D6EwQVgn
	 ELG4LPmw4ii1p9DFm+UKfTp1J7ltzzUklQSejW00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 189E0F80254;
	Tue,  1 Dec 2020 04:25:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AF1DF8016D; Tue,  1 Dec 2020 04:25:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=NICE_REPLY_A,PRX_BODY_135,
 RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EEFDF80168
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 04:25:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EEFDF80168
IronPort-SDR: pP2Yiw5T4Kzv3XOWqsZvNtAV1qlTH8myEWeGQoGozas4NHStaLz4p/H9qEL6uqazhXaJQ1eqVs
 LByYD9vctUuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="171970737"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="171970737"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 19:25:00 -0800
IronPort-SDR: 0UBxM/ugb1HGzDq8r2MPWBcIZIqtTS07YtRzmkNpzUD+z5GgNSsDeKglzsSafFJAzRncUlNmB0
 5ktDAEMLkHDg==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="549373996"
Received: from jerosenb-mobl.amr.corp.intel.com (HELO [10.209.122.68])
 ([10.209.122.68])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 19:25:00 -0800
Subject: Re: Asoc: Intel: SST (CHT) regression in asoc/for-5.11
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <93cc93a1-82bd-f5a3-4e19-4cfc65c868e7@redhat.com>
 <2d9d0d43-8239-01e2-3787-98dfd305e369@linux.intel.com>
Message-ID: <7b50862a-d7e3-6a72-833d-5c8283c8deab@linux.intel.com>
Date: Mon, 30 Nov 2020 21:24:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2d9d0d43-8239-01e2-3787-98dfd305e369@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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




> On 11/29/20 6:24 AM, Hans de Goede wrote:
>> Hi All,
>>
>> To test the code to dynamically switch between SST/SOF support on BYT/CHT
>> from the kernel commandline I merged:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/log/?h=for-5.11 
>>
>>
>> Into my personal tree (mostly Linus' master + some pending patches from
>> myself).
>>
>> After this I was getting the following errors in dmesg when using 
>> sound on
>> a Medion E2228T laptop with a CHT SoC + NAU8824 codec:
>>
>> [   53.805205] intel_sst_acpi 808622A8:00: Wait timed-out 
>> condition:0x0, msg_id:0x1 fw_state 0
>> [   53.805479] intel_sst_acpi 808622A8:00: fw returned err -16
>> [   53.806281] sst-mfld-platform sst-mfld-platform: ASoC: PRE_PMD: 
>> pcm0_in event failed: -16
>> [   54.829548] intel_sst_acpi 808622A8:00: Wait timed-out 
>> condition:0x0, msg_id:0x1 fw_state 0
>> [   54.829596] intel_sst_acpi 808622A8:00: fw returned err -16
>> [   54.829668] sst-mfld-platform sst-mfld-platform: ASoC: POST_PMD: 
>> media0_out event failed: -
>> [   55.853230] intel_sst_acpi 808622A8:00: Wait timed-out 
>> condition:0x0, msg_id:0x1 fw_state 0
>> [   55.853244] intel_sst_acpi 808622A8:00: fw returned err -16
>> [   55.853269] sst-mfld-platform sst-mfld-platform: ASoC: POST_PMD: 
>> codec_out0 mix 0 event fai
>> [   56.876435] intel_sst_acpi 808622A8:00: Wait timed-out 
>> condition:0x0, msg_id:0x1 fw_state 0
>> [   56.876481] intel_sst_acpi 808622A8:00: fw returned err -16
>> [   56.876563] sst-mfld-platform sst-mfld-platform: ASoC: POST_PMD: 
>> media0_out mix 0 event fai
>> [   61.847455] intel_sst_acpi 808622A8:00: FW sent error response 0x40015
>> [   61.847564] intel_sst_acpi 808622A8:00: fw returned err -1
>> [   61.847659] sst-mfld-platform sst-mfld-platform: ASoC: error at 
>> snd_soc_dai_startup on ssp2
>> [   61.847722]  SSP2-Codec: ASoC: BE open failed -1
>> [   61.847754]  Audio Port: ASoC: failed to start some BEs -1
>> [   61.847786] intel_sst_acpi 808622A8:00: FW sent error response 0x40006
>> [   64.301284] intel_sst_acpi 808622A8:00: FW sent error response 0x90001
>> [   64.301545] intel_sst_acpi 808622A8:00: not suspending FW!!, Err: -2
>>
>> Dropping the asoc/for-5.11 merge and just cherry-picking Pierre-Louis' 
>> changes
>> for the dynamic switching makes these go away. So this seems to be 
>> caused by
>> other changes in asoc/for-5.11.
>>
>> So any clues where to start looking for this, or should I just bisect 
>> this?
> 
> Thanks for reporting this Hans.
> 
> The only thing that comes to my mind is Morimoto-san's series which 
> modified snd_soc_dai_startup, but that was back in September and should 
> be in 5.10-rcX
> 
> Will give it a try on my side as well.

I was able to reproduce this error with Mark's for-next branch on a CHT 
device w/ rt5640, and git bisect points to this commit:

a27b421f1d04b201c474a15ee1591919c81fb413 is the first bad commit
commit a27b421f1d04b201c474a15ee1591919c81fb413
Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date:   Tue Nov 17 13:50:01 2020 -0800

     ASoC: pcm: call snd_soc_dapm_stream_stop() in soc_pcm_hw_clean

     Currently, the SND_SOC_DAPM_STREAM_START event is sent during
     pcm_prepare() but the SND_SOC_DAPM_STREAM_STOP event is
     sent only in dpcm_fe_dai_shutdown() after soc_pcm_close().
     This results in an imbalance between when the DAPM widgets
     receive the PRE/POST_PMU/PMD events. So call
     snd_soc_dapm_stream_stop() in soc_pcm_hw_clean() before the
     snd_soc_pcm_component_hw_free() to keep the stream_stop DAPM
     event balanced with the stream_start event in soc_pm_prepare().

     Also, in order to prevent duplicate DAPM stream events,
     remove the call for DAPM STREAM_START event in dpcm_fe_dai_prepare()
     and the call for DAPM STREAM_STOP event in dpcm_fe_dai_shutdown().

     Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
     Reviewed-by: Pierre-Louis Bossart 
<pierre-louis.bossart@linux.intel.com>
     Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
     Link: 
https://lore.kernel.org/r/20201117215001.163107-1-ranjani.sridharan@linux.intel.com
     Signed-off-by: Mark Brown <broonie@kernel.org>

  sound/soc/soc-pcm.c | 10 +++-------
  1 file changed, 3 insertions(+), 7 deletions(-)


I am not sure why this break the Atom/SST driver, this was reviewed and 
seemed legit - even required IIRC to deal with topology pipelines 
initialized on-demand. Reverting this patch restores functionality. I 
would guess it's the DAPM_STREAM_START that's now missing (or in the 
'wrong' location) and causing issues?

Hans, can you confirm if indeed this is the same issue on your devices?

Thanks
-Pierre

