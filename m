Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E07F66E747
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 16:27:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D98116B2;
	Fri, 19 Jul 2019 16:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D98116B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563546439;
	bh=m+7JCOxGztvx30LwgecIBY1JEEcyre9nhn1e31UoWts=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=luVvYKASXIw5b9osAJxem92x0a5hi3p2uj6bzTA8fFcn3t1A6xX20CVSS7tyow/jH
	 bMOCJa9CoayDWe9/UZiVzWBpPcX3/AufDjJf4BFdsPJf76tXsUadXBKji/emefosfv
	 xHoRVP36Ymgn2JLWD+rwkIZ7f9YLMLixeKtAnaTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8AD7F80363;
	Fri, 19 Jul 2019 16:25:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3B73F80272; Fri, 19 Jul 2019 16:25:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7175F8015B
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 16:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7175F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 07:25:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,282,1559545200"; d="scan'208";a="168569544"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 19 Jul 2019 07:25:25 -0700
Received: from radipont-mobl.amr.corp.intel.com (unknown [10.251.153.250])
 by linux.intel.com (Postfix) with ESMTP id 8931658047A;
 Fri, 19 Jul 2019 07:25:24 -0700 (PDT)
To: "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>,
 Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org
References: <20190718031113.25040-1-yang.jie@linux.intel.com>
 <94753e7c-931b-2b24-b92b-283e7abbb9ac@linux.intel.com>
 <a1a676aa-e1da-0f6a-4dbd-972b4973553d@linux.intel.com>
 <e023af8c-0538-6f84-3cfe-9482532b2cec@linux.intel.com>
 <7097547d-9784-2d26-f1f0-fd2f803481ec@linux.intel.com>
 <54b08af5-77bd-2de4-c3ce-158a9374c15a@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f2c36393-937f-16d8-133d-5b1f472d2977@linux.intel.com>
Date: Fri, 19 Jul 2019 09:25:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <54b08af5-77bd-2de4-c3ce-158a9374c15a@linux.intel.com>
Content-Language: en-US
Cc: marcin.rajwa@intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v3 1/2] ASoC: SOF: add flag for position
 update ipc
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>> We knew from Day1 that draining faster than real-time could 
>> potentially lead to the driver detecting overflows or timeouts. It's 
>> been documented left and right, with an assumption that the ring 
>> buffer is actually big enough to contain all the data stored in the DSP.
> 
> @Pierre, indeed the buffer that kernel allocates is big enough to store 
> all the data. However *arecord* introduces its own buffer which is just 
> a multiple of *period_sizes *- and it is the buffer which overflows.

When I tested this feature with the closed-source firmware on KBL, 
arecord worked fine. Care to provide more details so that we are on the 
same page?

> 
>>
>> Before I provide more feedback, can you clarify if the 
>> 'host_period_bytes' is the same value as the ALSA period size (in 
>> bytes)? And what would be the value when the no_irq mode is used?
> 
> Yes, this is the same value. It is obtained by *params_period_bytes**()* 
> in kernel.

ok good. I was afraid this would be a different concept.

So what you are saying is that the draining happens by bursts whose size 
is tied to the period defined by the host, yes?

> 
> *no_irq mode *- it does not affect the value of *host_period_bytes 
> *after my patch has been applied. Before my patch however, driver and FW 
> used this value to send stream position information from FW to kernel. 
> In short, when *(hda && hda->no_ipc_position)*
> 
> then *ipc_params->host_period_bytes = 0; *was set in kernel.**Firmware 
> then, read this *host_period_bytes = 0 *and treated it as "OK does not 
> send any IPC regarding stream position". So once *no_ipc_position *was 
> set we lost information about *host_period_bytes *in the FW.
> 
> So all my patches in FW and Kernel do is to *relax****host_period_bytes 
> *and introduce new parameter dedicated for this stream position IPC. At 
> that time we called it *no_period_irq *to resemble old name but now I 
> think it would be better if we rename it to something like
> 
> *no_stream_position *as it is more informative. What do you think?

The text is quite difficult to read with all the *... Please use plain text.

It just occurred to me that the traditional use of the timer-based 
scheduling (with no_irq mode) is not very smart with this sort of 
application. The host has absolutely no way of predicting for how long 
it needs to sleep before the firmware completes the initial flush. This 
time is linked to hardware, bandwidth to memory, etc, and might vary 
quite a bit between platforms. In this case, it's much better to rely on 
events set by hardware upon data availability.

in terms of naming, no_stream_position_ipc would be my choice, but it's 
a bit long.

>>>
>>> Hope it helped to understand the need of *host_period_bytes *in the 
>>> firmware.

Yes, thanks for taking the time to explain the issue.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
