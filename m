Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6EA1B5749
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 10:35:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30F2D16A9;
	Thu, 23 Apr 2020 10:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30F2D16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587630946;
	bh=7m0xokYFy2n6xPlqUWNZ69SfmZMi3caTkU4kYwGSrog=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dcNEK5v4R+HgpDrR0TBfTWCwB29bv2vGea0XqC+wbW2FjJIu3I0AJxZQE2UKN1JmJ
	 qyKNPhbDKO7X+pR+keY/mb5DM+zLWore6v18Vo7jJKnR7oTlWWCAk8KW6tesiByhgf
	 JkS5o2rQjN+j6RBd2yfNW/QIIbsa0nqdDE5CLP1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 373C2F800F2;
	Thu, 23 Apr 2020 10:34:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03BFDF801EC; Thu, 23 Apr 2020 10:34:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5AA4F800F2
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 10:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5AA4F800F2
IronPort-SDR: JooH4ITAm1asAiyzIy0Mes2xeoUoG9bAs037kQQ6lRhPovlePUQdNi43lw1Y7IKijThEB07H2R
 oZgPjHZBvbSA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 01:33:52 -0700
IronPort-SDR: zdcdmdOKM+bcv8IcTgKstEsaeuv0+W26sT3uurrkTZ9SvF7wRhKHQh4oRLRJh/1aURwuhBusW5
 nqhE2HO5EJRQ==
X-IronPort-AV: E=Sophos;i="5.73,306,1583222400"; d="scan'208";a="402848601"
Received: from aslawinx-mobl1.ger.corp.intel.com (HELO [10.249.145.81])
 ([10.249.145.81])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 01:33:48 -0700
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sst: ipc command timeout
To: "Lu, Brent" <brent.lu@intel.com>,
 "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1586506705-3194-1-git-send-email-brent.lu@intel.com>
 <4f495cf1-4740-cf3b-196f-cc850c503b43@linux.intel.com>
 <BN6PR1101MB21328B6F4147640D07F9E40A97DA0@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <c8309abf-cbfb-a3db-5aa7-2e2f748a6d34@intel.com>
 <BN6PR1101MB21328C54E66082227B9F497A97D50@BN6PR1101MB2132.namprd11.prod.outlook.com>
Message-ID: <5e84c48c-a5d1-b2ff-c197-5efa478c5916@linux.intel.com>
Date: Thu, 23 Apr 2020 10:33:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <BN6PR1101MB21328C54E66082227B9F497A97D50@BN6PR1101MB2132.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fontana <rfontana@redhat.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
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



On 4/21/2020 6:16 PM, Lu, Brent wrote:
>>
>> Regs width difference between BDW and BYT comes from specification. BDW
>> has IPC registers which are 32 wide. This fact ain't exactly the reason to modify
>> sst_shim32_read64.
>>
>> I'm sharing Amadeo's point of view. Your change should slow down execution a
>> bit - but that might be just what handlers needed to make everything work again.
>> Debug prints also slow down the execution what could have prevented you from
>> spotting the real problem.
>> Let's ignore the memcpy stuff for a moment - could you focus on elaborating
>> the scenario where such issue occurs? Your initial commit message also skips
>> important bits such as platform used when reproducing and so on, please add
>> them.
>>
>> Thanks,
>> Czarek
> 
> This issue is reported to happen on BYT Chrome book (rambi) on Chrome-v4.4
> branch after changing toolchain from clang10 to clang11.
> 
> The reproduce step is simple. Just run arecord multiple times (<10) then you will
> see error message for hw_params ioctl failure.
> 
> $ arecord -D hw:1,0 -f S16_LE -c 2 /dev/null
> $ ctrl+c
> 
> The error message suggests the stream commit (IPC_IA_ALLOC_STREAM, 0x20) IPC
> command failed due to timeout but the msg id field of ipcd read after the timeout is
> also 0x20. It seems to me that the command is success but the host driver does not
> know it for some reason.
> 
> 2020-03-15T23:02:06.614151+00:00 ERR kernel: [  852.023766] baytrail-pcm-audio baytrail-pcm-audio: ipc: --message timeout-- ipcx 0x2220 isr 0xf0020 ipcd 0x2220 imrx 0x0
> 2020-03-15T23:02:06.614209+00:00 ERR kernel: [  852.023796] baytrail-pcm-audio baytrail-pcm-audio: ipc: error stream commit failed
> 2020-03-15T23:02:06.614218+00:00 ERR kernel: [  852.023813]  Baytrail Audio: PCM: failed stream commit -110
> 2020-03-15T23:02:06.614225+00:00 ERR kernel: [  852.023832] baytrail-pcm-audio baytrail-pcm-audio: ASoC: baytrail-pcm-audio hw params failed: -110
> 
> I add some messages to make the log easier to read. You can check the gerrit link if you
> are interested:
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2131507
> 
> In the test patch I read the SST_IPCD register in sst_byt_irq_thread() twice and found
> the value could be different. The IPC_IA_FREE_STREAM(0x21) seems to be the last IPC
> command sent in the pcm_release of previous arecord command.
> 
> [  125.009724] sound pcmC1D0c: snd_pcm_release:
> [  125.009732] baytrail-pcm-audio baytrail-pcm-audio: ipc_tx_message: header 0x8000000000000221 wait 1
> [  125.009760] baytrail-pcm-audio baytrail-pcm-audio: byt_tx_msg: header 0x8000000000000226
> [  125.009803] baytrail-pcm-audio baytrail-pcm-audio: sst_byt_irq_thread: header 0x297
> [  125.009823] baytrail-pcm-audio baytrail-pcm-audio: byt_tx_msg: header 0x8000000000000221
> [  125.009872] baytrail-pcm-audio baytrail-pcm-audio: sst_byt_irq_thread: header 0x297
> [  125.010442] baytrail-pcm-audio baytrail-pcm-audio: sst_byt_irq_thread: header 0x80000000000c2226
> [  125.010456] baytrail-pcm-audio baytrail-pcm-audio: sst_ipc_reply_find_msg: not match, msg header 0x8000000000000221
> [  125.010511] baytrail-pcm-audio baytrail-pcm-audio: sst_byt_irq_thread: header 0x8000000000000221
> [  125.011355] baytrail-pcm-audio baytrail-pcm-audio: tx_wait_done: ipc success, header 0x8000000000000221
> [  125.380506] sound pcmC1D0c: snd_pcm_capture_open:
> [  125.380544] sound pcmC1D0c: snd_pcm_capture_ioctl1: INFO
> [  125.380554] sound pcmC1D0c: snd_pcm_capture_ioctl1: PVERSION
> [  125.380561] sound pcmC1D0c: snd_pcm_capture_ioctl1: TTSTAMP
> [  125.380581] sound pcmC1D0c: snd_pcm_mmap:
> [  125.380622] sound pcmC1D0c: snd_pcm_mmap:
> [  125.380648] sound pcmC1D0c: snd_pcm_capture_ioctl1: INFO
> [  125.380717] sound pcmC1D0c: snd_pcm_capture_ioctl1: HW_REFINE
> [  125.380737] sound pcmC1D0c: snd_pcm_capture_ioctl1: HW_REFINE
> [  125.380766] sound pcmC1D0c: snd_pcm_capture_ioctl1: HW_REFINE
> [  125.380779] sound pcmC1D0c: snd_pcm_capture_ioctl1: HW_REFINE
> [  125.380789] sound pcmC1D0c: snd_pcm_capture_ioctl1: HW_REFINE
> [  125.380799] sound pcmC1D0c: snd_pcm_capture_ioctl1: HW_REFINE
> [  125.380808] sound pcmC1D0c: snd_pcm_capture_ioctl1: HW_REFINE
> [  125.380815] sound pcmC1D0c: snd_pcm_capture_ioctl1: HW_PARAMS
> [  125.380839] baytrail-pcm-audio baytrail-pcm-audio: ipc_tx_message: header 0x8000000000642220 wait 1
> [  125.380854] baytrail-pcm-audio baytrail-pcm-audio: byt_tx_msg: header 0x8000000000642220
> => write IPC_IA_ALLOC_STREAM message (0x20) to SST_IPCX
> [  125.380931] baytrail-pcm-audio baytrail-pcm-audio: sst_byt_irq_thread: header 0x8000000000000221
> => read message reply from SST_IPCD and an IPC_IA_FREE_STREAM(0x21) is returned
> [  125.380942] baytrail-pcm-audio baytrail-pcm-audio: sst_byt_irq_thread: ipcd 0x8000000000602220
> => read SST_IPCD again, this time the message id is what we are expected (0x20)
> [  125.380948] baytrail-pcm-audio baytrail-pcm-audio: sst_ipc_reply_find_msg: not match, msg header 0x8000000000642220
> [  125.681171] baytrail-pcm-audio baytrail-pcm-audio: tx_wait_done: ipc timeout, header 0x8000000000642220
> [  125.681204] baytrail-pcm-audio baytrail-pcm-audio: ipc: --message timeout-- ipcx 0x2220 isr 0x50020 ipcd 0x2220 imrx 0x0
> [  125.681212] baytrail-pcm-audio baytrail-pcm-audio: ipc: error stream commit failed
> [  125.681217]  Baytrail Audio: PCM: failed stream commit -110
> [  125.681223] baytrail-pcm-audio baytrail-pcm-audio: ASoC: baytrail-pcm-audio hw params failed: -110
> 
> Regards,
> Brent
> 

I've looked at the code and byt_is_dsp_busy seems suspicious to me.
Can you check if following change fixes problem for you:

diff --git a/sound/soc/intel/baytrail/sst-baytrail-ipc.c 
b/sound/soc/intel/baytrail/sst-baytrail-ipc.c
index 74274bd38f7a..34746fd871b0 100644
--- a/sound/soc/intel/baytrail/sst-baytrail-ipc.c
+++ b/sound/soc/intel/baytrail/sst-baytrail-ipc.c
@@ -666,8 +666,8 @@ static bool byt_is_dsp_busy(struct sst_dsp *dsp)
  {
         u64 ipcx;

-       ipcx = sst_dsp_shim_read_unlocked(dsp, SST_IPCX);
-       return (ipcx & (SST_IPCX_BUSY | SST_IPCX_DONE));
+       ipcx = sst_dsp_shim_read64_unlocked(dsp, SST_IPCX);
+       return (ipcx & (SST_BYT_IPCX_BUSY | SST_BYT_IPCX_DONE));
  }

  int sst_byt_dsp_init(struct device *dev, struct sst_pdata *pdata)

We seem to treat SST_IPCX as 32 bit register instead of 64 one, which 
may explain wrong behaviour. (Specification says it is 64 bit register).

Thanks,
Amadeusz
