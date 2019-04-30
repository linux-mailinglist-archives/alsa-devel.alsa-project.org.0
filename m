Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5E2F2F1
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 11:32:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BE9B16BB;
	Tue, 30 Apr 2019 11:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BE9B16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556616749;
	bh=4j92ZKId6mZ22pDSGklJIenP3gz7BFI3f473qrnYejM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U0iu8KlNB4i/8pVh0MhV0FaLMq/whak6sag2ddDr1xNPbTF7Z9+T8wupyOENyLGgk
	 ghgR2x25j8qD75eo7vEm571t8UjOUdJoF1h7+m30pLAr0+bYDQoxJqdbwYYSAqEjKO
	 Bw8G8SYcjcqpq+6l9DFInJV41dr5aQwkQF0Z09oA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A0EBF896EC;
	Tue, 30 Apr 2019 11:30:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 709F4F896AA; Tue, 30 Apr 2019 11:30:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEAB6F80759
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 11:30:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEAB6F80759
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3U9TWpE016047
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Tue, 30 Apr 2019 02:29:42 -0700
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
 Tue, 30 Apr 2019 02:29:21 -0700
Message-ID: <5CC8156F.1030403@windriver.com>
Date: Tue, 30 Apr 2019 17:29:19 +0800
From: Liwei Song <liwei.song@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
 rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Takashi Iwai <tiwai@suse.de>
References: <1556604653-47363-1-git-send-email-liwei.song@windriver.com>	<s5himuwhru3.wl-tiwai@suse.de>	<5CC8082F.4090903@windriver.com>
 <s5h4l6fj2m6.wl-tiwai@suse.de>
In-Reply-To: <s5h4l6fj2m6.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Yu Zhao <yuzhao@google.com>,
 Keyon Jie <yang.jie@linux.intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: check RIRB to avoid use NULL
	pointer
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



On 04/30/2019 04:53 PM, Takashi Iwai wrote:
> On Tue, 30 Apr 2019 10:32:47 +0200,
> Liwei Song wrote:
>>
>>
>>
>> On 04/30/2019 03:31 PM, Takashi Iwai wrote:
>>> On Tue, 30 Apr 2019 08:10:53 +0200,
>>> Song liwei wrote:
>>>>
>>>> From: Liwei Song <liwei.song@windriver.com>
>>>>
>>>> Fix the following BUG:
>>>>
>>>> BUG: unable to handle kernel NULL pointer dereference at 000000000000000c
>>>> Workqueue: events azx_probe_work [snd_hda_intel]
>>>> RIP: 0010:snd_hdac_bus_update_rirb+0x80/0x160 [snd_hda_core]
>>>> Call Trace:
>>>>  <IRQ>
>>>>  azx_interrupt+0x78/0x140 [snd_hda_codec]
>>>>  __handle_irq_event_percpu+0x49/0x300
>>>>  handle_irq_event_percpu+0x23/0x60
>>>>  handle_irq_event+0x3c/0x60
>>>>  handle_edge_irq+0xdb/0x180
>>>>  handle_irq+0x23/0x30
>>>>  do_IRQ+0x6a/0x140
>>>>  common_interrupt+0xf/0xf
>>>>
>>>> The Call Trace happened when run kdump on a NFS rootfs system.
>>>> Exist the following calling sequence when boot the second kernel:
>>>>
>>>> azx_first_init()
>>>>    --> azx_acquire_irq()
>>>>                       <-- interrupt come in, azx_interrupt() was called
>>>>    --> hda_intel_init_chip()
>>>>       --> azx_init_chip()
>>>>          --> snd_hdac_bus_init_chip()
>>>>               --> snd_hdac_bus_init_cmd_io();
>>>>                     --> init rirb.buf and corb.buf
>>>>
>>>> Interrupt happened after azx_acquire_irq() while RIRB still didn't got
>>>> initialized, then NULL pointer will be used when process the interrupt.
>>>>
>>>> Check the value of RIRB to ensure it is not NULL, to aviod some special
>>>> case may hang the system.
>>>>
>>>> Fixes: 14752412721c ("ALSA: hda - Add the controller helper codes to hda-core module")
>>>> Signed-off-by: Liwei Song <liwei.song@windriver.com>
>>>
>>> Oh, that's indeed a race there.
>>>
>>> But I guess the check introduced by the patch is still error-prone.
>>> Basically the interrupt handling should be moved after the chip
>>> initialization.  I suppose that your platform uses the shared
>>> interrupt, not the MSI?
>>
>> This is the information from /proc/interrupt
>> 134:          0        102          0          0  IR-PCI-MSI 514048-edge      snd_hda_intel:card0
> 
> Hm, then it's interesting...
> 
> 
>>> In anyway, alternative (and likely more certain) fix would be to move
>>> the azx_acquir_irq() call like the patch below (note: totally
>>> untested).  Could you check whether it works?
>>
>> Yes, It works.
>>
>> Considering a previous patch like the one you provide will import some issue, 
>> so I choose check the invalid value to low the risk, but just as you mentioned,
>> It is not a good solution.
>>
>> commit 542cedec53c9e8b73f3f05bf8468823598c50489
>> Author: Yu Zhao <yuzhao@google.com>
>> Date:   Tue Sep 11 15:12:46 2018 -0600
>>
>>     Revert "ASoC: Intel: Skylake: Acquire irq after RIRB allocation"
>>     
>>     This reverts commit 12eeeb4f4733bbc4481d01df35933fc15beb8b19.
>>     
>>     The patch doesn't fix accessing memory with null pointer in
>>     skl_interrupt().
>>     
>>     There are two problems: 1) skl_init_chip() is called twice, before
>>     and after dma buffer is allocate. The first call sets bus->chip_init
>>     which prevents the second from initializing bus->corb.buf and
>>     rirb.buf from bus->rb.area. 2) snd_hdac_bus_init_chip() enables
>>     interrupt before snd_hdac_bus_init_cmd_io() initializing dma buffers.
>>     There is a small window which skl_interrupt() can be called if irq
>>     has been acquired. If so, it crashes when using null dma buffer
>>     pointers.
> 
> Actually this followed by another fix b61749a89f82,
>     sound: enable interrupt after dma buffer initialization
>     
> and this moved the IRQ enablement after snd_hdac_bus_init_cmd_io().
> 
> So I wonder how the irq gets triggered in your case.
> If it were a shared irq, it's understandable.  But for MSI, it should
> have been the isolated source.

I'm still working on how the irq was triggered,
it is a little complex to reproduce it, first it must run with NFS rootfs,
without NFS rootfs it can not reproduced.
Then with kdump enabled, after "echo c > /proc/sysrq-trigger" crash the kernel,
the kernel specified by kdump will boot, then interrupt will trigger
soon after azx interrupt was register.


> 
> In anyway, for the latest tree, the change I suggested would cover
> better although it's more radical as you pointed.

Got it, Thanks.

Liwei.


> 
> 
> thanks,
> 
> Takashi
> 
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
