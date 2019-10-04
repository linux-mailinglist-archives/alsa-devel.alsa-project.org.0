Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A74CBB2F
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 15:04:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C2821688;
	Fri,  4 Oct 2019 15:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C2821688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570194294;
	bh=IXrbeEUorG869fk+LjRpHIVGezPAY1zs0u6eYXwbjs4=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E6L2pS+VVFH/Mdst4njGGkeh78vBzPsbiCNU7rlSAgqtSQwcpAT9OSqOMiFHS8mf7
	 15t8XP6K/l9SimPDDPTPSI2XQcwkJZctDKoLKy81bNO7iiW+C+m1KzwSkfbLycTFXU
	 2o6x0xDrl7zGXq3hm+IlEQP/EdH/0a+pNvfGN/5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81D7CF803F3;
	Fri,  4 Oct 2019 15:03:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE45FF80391; Fri,  4 Oct 2019 15:03:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.lenbrook.com (mail.lenbrook.com [69.156.198.123])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59FD8F80137
 for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2019 15:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59FD8F80137
Received: from MAIL1.pickering.lenbrook.com ([192.168.0.250]) by
 MAIL1.pickering.lenbrook.com ([192.168.0.250]) with mapi id 14.03.0415.000;
 Fri, 4 Oct 2019 09:03:00 -0400
From: Kevin Groeneveld <KGroeneveld@lenbrook.com>
To: Lucas Stach <l.stach@pengutronix.de>, "dmaengine@vger.kernel.org"
 <dmaengine@vger.kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Thread-Topic: kernel freeze regression relating to imx-sdma
Thread-Index: AdV6LyY1Rzd7AEOaQv+Ew+dBI1dYnwAI5e+AABa2rgA=
Date: Fri, 4 Oct 2019 13:02:59 +0000
Message-ID: <BF6B9AADDDF11740967545E971C7C0DE6BAAEC23@MAIL1.pickering.lenbrook.com>
References: <BF6B9AADDDF11740967545E971C7C0DE6BAAEB86@MAIL1.pickering.lenbrook.com>
 <1daf496b14c9682a52e06592471ca37a5abb72e7.camel@pengutronix.de>
In-Reply-To: <1daf496b14c9682a52e06592471ca37a5abb72e7.camel@pengutronix.de>
Accept-Language: en-US, en-CA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.66]
MIME-Version: 1.0
Cc: "lars@metafoo.de" <lars@metafoo.de>
Subject: Re: [alsa-devel] kernel freeze regression relating to imx-sdma
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

Hi Lucas,

Thanks for the feedback.

>-----Original Message-----
>From: Lucas Stach [mailto:l.stach@pengutronix.de]
>Sent: October 3, 2019 5:26 PM
>To: Kevin Groeneveld; dmaengine@vger.kernel.org
>Subject: Re: kernel freeze regression relating to imx-sdma
>
>Hi Kevin,
>
>Am Donnerstag, den 03.10.2019, 21:11 +0000 schrieb Kevin Groeneveld:
>> We have recently come across an issue which can cause the linux kernel to
>> freeze on an iMX6 based system.  After bisecting the issue I have found the
>> issue is related to the following imx-sdma commits:
>>
>> 64068853bc77786d1a28abb4087d6a3e93aedbe2 dmaengine: imx-sdma: use GFP_NOWAIT for dma descriptor allocations
>> b8603d2a5795c42f78998e70dc792336e0dc20c9 dmaengine: imx-sdma: implement channel termination via worker
>> ebb853b1bd5f659b92c71dc6a9de44cfc37c78c0 Revert "dmaengine: imx-sdma: alloclate bd memory from dma pool"
>> c06abca69218ac42fa58d1ba7a7b0d9bab5f1b18 Revert "dmaengine: imx-sdma: Use GFP_NOWAIT for dma allocations"
>>
>> If I revert these four commits the freeze does not happen.  The issue is still
>> present up to at least v5.3.
>>
>> The problem seems to be related to overruns when doing an SPDIF capture,
>> particularly when there is not actually a valid SPDIF input to the iMX6.  When
>> the issue occurs the following is (usually) printed on the console (using a v5.0
>> based kernel):
>>
>> [ 1251.944877] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
>> [ 1251.950823] rcu:     (detected by 0, t=2102 jiffies, g=220425, q=0)
>> [ 1251.956866] rcu: All QSes seen, last rcu_sched kthread activity 2102 (95117-93015), jiffies_till_next_fqs=1, root ->qsmask 0x0
>> [ 1251.968266] arecord         S    0  1916   1908 0x00000002
>> [ 1251.973816] [<8010dcec>] (unwind_backtrace) from [<8010a4c4>] (show_stack+0x10/0x14)
>> [ 1251.981596] [<8010a4c4>] (show_stack) from [<8016b314>] (rcu_check_callbacks+0x57c/0x5d8)
>> [ 1251.989806] [<8016b314>] (rcu_check_callbacks) from [<8016fe84>] (update_process_times+0x30/0x5c)
>> [ 1251.998709] [<8016fe84>] (update_process_times) from [<8017e960>] (tick_sched_timer+0x44/0x94)
>> [ 1252.007353] [<8017e960>] (tick_sched_timer) from [<80170a84>] (__hrtimer_run_queues+0xd8/0x160)
>> [ 1252.016081] [<80170a84>] (__hrtimer_run_queues) from [<8017103c>] (hrtimer_interrupt+0xdc/0x284)
>> [ 1252.024891] [<8017103c>] (hrtimer_interrupt) from [<8010d6c0>] (twd_handler+0x2c/0x38)
>> [ 1252.032839] [<8010d6c0>] (twd_handler) from [<80160b34>] (handle_percpu_devid_irq+0x70/0x11c)
>> [ 1252.041401] [<80160b34>] (handle_percpu_devid_irq) from [<8015c234>] (generic_handle_irq+0x18/0x28)
>> [ 1252.050480] [<8015c234>] (generic_handle_irq) from [<8015c814>] (__handle_domain_irq+0xa0/0xb4)
>> [ 1252.059211] [<8015c814>] (__handle_domain_irq) from [<8039098c>] (gic_handle_irq+0x58/0x90)
>> [ 1252.067590] [<8039098c>] (gic_handle_irq) from [<80101a0c>] (__irq_svc+0x6c/0x90)
>> [ 1252.075085] Exception stack(0x848afe30 to 0x848afe78)
>> [ 1252.080155] fe20:                                     8decf200 00000000 00000000 80b84ac8
>> [ 1252.088354] fe40: 00000000 8decf200 892f7800 00001589 892f7800 00000000 00000000 848ae000
>> [ 1252.096549] fe60: 8d8cf000 848afe80 805721e8 8056aae4 60000013 ffffffff
>> [ 1252.103200] [<80101a0c>] (__irq_svc) from [<8056aae4>] (__snd_pcm_stream_unlock_mode+0xc0/0xd8)
>> [ 1252.111925] [<8056aae4>] (__snd_pcm_stream_unlock_mode) from [<00000000>] (  (null))
>> [ 1252.119695] rcu: rcu_sched kthread starved for 2102 jiffies! g220425 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
>> [ 1252.129877] rcu: RCU grace-period kthread stack dump:
>> [ 1252.134938] rcu_sched       R  running task        0    10      2 0x00000000
>> [ 1252.142034] [<806eee5c>] (__schedule) from [<806eef80>] (schedule+0x90/0xa0)
>> [ 1252.149116] [<806eef80>] (schedule) from [<806f2244>] (schedule_timeout+0x1f0/0x238)
>> [ 1252.156891] [<806f2244>] (schedule_timeout) from [<8016940c>] (rcu_gp_kthread+0x550/0x8f0)
>> [ 1252.165183] [<8016940c>] (rcu_gp_kthread) from [<8013a358>] (kthread+0x110/0x128)
>> [ 1252.172693] [<8013a358>] (kthread) from [<801010e8>] (ret_from_fork+0x14/0x2c)
>> [ 1252.179925] Exception stack(0x8f877fb0 to 0x8f877ff8)
>> [ 1252.184991] 7fa0:                                     00000000 00000000 00000000 00000000
>> [ 1252.193187] 7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>> [ 1252.201380] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
>>
>> I suspect the issue may not actually be a bug with imx-sdma but a
>> race condition elsewhere that is exposed by the four mentioned
>> commits.
>>
>> I did notice that when an SPDIF overrun occurs
>> dmaengine_terminate_async is called but dmaengine_synchronize is
>> not.  Should these calls always be paired? Or is it okay to call
>> dmaengine_terminate_async without dmaengine_synchronize in some
>> cases?
>
>Yes, it seems this uncovered a bug in the SPDIF driver. Before those
>commits the dmaengine_terminate_async in the SDMA driver wasn't really
>async, now it is. The API requires that you call dmaengine_synchronize
>eventually after the terminate_async before starting any new operations
>on the dmaengine. It doesn't necessarily need to be in the same
>codepath, but the the async terminate always needs to be paired up with
>a synchronize.

I don't think the bug is limited to SPDIF.  The calls to dmaengine_terminate_async are in sound/core/pcm_dmaengine.c.  When the ALSA device is closed it does call dmaengine_synchronize.  But when there is an overrun it does not.  It was commit bc0e7345168c0f7483d2d1da86285d89136417cd (by Lars-Peter Clausen) where the call to dmaengine_synchronize was added for closing an ALSA device.  It seems the overrun case was overlooked?  I think maybe I should copy the ALSA list on this as well.

I have also found another manifestation of the imx-sdma change which may be useful for others trying to debug this.  If I run the following command:

arecord -Dhw:4,0 -fS24_LE -c2 -r44100 --buffer-size 100 > /dev/null

With kernel v4.20-rc5 I get an endless stream of overrun messages.  With kernel v4.20-rc6 (which includes the four imx-sdma commits mentioned above) I get a few overrun messages but then arecord exits with "arecord: pcm_read:2096: read error: Input/output error"

Best regards,
Kevin

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
