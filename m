Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 706B355557C
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 22:48:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D5AC1AF5;
	Wed, 22 Jun 2022 22:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D5AC1AF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655930939;
	bh=ru38080Z2qh2olHUt7GArDLNsewALHbRsmjUxt4QIHI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uRGt33K9Iohq7H/aQnfIAI5bV9Nm01LrLMb0evXj1Ad9cp9kUDKayIkEUuHpx1UGV
	 u/Tpvu60Bkl9HN4TY0Tm8mLHEQE/E/8OZSy0PkQctN2fq0kindXNjh64eOhSJ0+1Gu
	 t+IDetBpZiA8s3cbtr3G3zxNWUNGlaIN4PgnFYrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E7B3F804AB;
	Wed, 22 Jun 2022 22:47:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB82CF802D2; Wed, 22 Jun 2022 22:47:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
 SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A944FF80118;
 Wed, 22 Jun 2022 22:47:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A944FF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FD1G/TGY"
Received: by mail-io1-xd32.google.com with SMTP id y18so1938359iof.2;
 Wed, 22 Jun 2022 13:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dDlaRZ4WaSY3e4YrtIu/o6C7/s0Gwe9PTGfFcT4MDvM=;
 b=FD1G/TGYfO5wB2Xtch6JU1SBWJ7Y8Xug+wKCAOK/fNmVz3eW8z9IYLtXp8YhggpnKb
 +icTMP5jX477wGTaQoWhKRA4OwZYlPXHrvnGbJkSN3UkWaSiA1CvCn403Pz1FmRcckkC
 Jb+fOJAr0SV9KmZqCyKg7xwgkRmn/g6vSsaRpf63Z58CcCI2gO0fNn+CgsQVBJQiOauy
 iG201rw0SJ2zD97qhLn6WPxRTOvPlxioISisENaDsciZJjUpVCl1iEgu8jJoyRhLQAVV
 XlgGMBXWSoRAZ4jvLKaqv84K3f1j/vfR43SQWcM6/LTa/PLcY96LufamiTIxQA9Djk6G
 FzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dDlaRZ4WaSY3e4YrtIu/o6C7/s0Gwe9PTGfFcT4MDvM=;
 b=1WMDy39zUngszhNXFbctxxEIH9JXIuymA9Cy1C1gLRIJbNudjm2DLoycxxHWnl9ghD
 nBvdgEjABZKL7qj8bcKKbjSquBRFU4+pdOFJ8jt/YyY9XynrxRWLC30g02TEt4EmoVai
 h1TYLnC2Gw3Y8EM9743AGVTkJXiMgNlwsaMZGjZ5olBHQbZNhGV7pCSmaAFNWZi0DTY4
 7Y7eLVPaKpzx2RzJ50malKmXKtsFIA5Zyh71T0H99fdrKIrdjjaHiBaDEr5BKtOzhmsE
 5VPCuQnj7Wzdo1u74sITYX6Bv/eu04IK6G96SsLMfvxxXoFt+U7oCPRhxWwofv4EJyso
 yfPQ==
X-Gm-Message-State: AJIora/GTMRXurrAleCv/pQM+MaQaaj0InH37w9FGqBahuUtozAV+emp
 ZzAkNSenJo2hLeKVBLsyaZtZEqdh5zyTea/+Crw=
X-Google-Smtp-Source: AGRyM1t9bCJYc3xarJ4F36rsxRDDzLq00WyLw15CphH5oBzUS3cKdrbFQeETqUtiKN6PyVUetT/W3TuuEegTg9vvK3o=
X-Received: by 2002:a05:6638:12d6:b0:339:d556:efb4 with SMTP id
 v22-20020a05663812d600b00339d556efb4mr3384076jas.215.1655930868052; Wed, 22
 Jun 2022 13:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAES_P+_aC4cHMB3Tn0pz13_gKCpXs=efeae2JBvEPOK5zidYnA@mail.gmail.com>
 <f80c7bf2-1d9e-40d7-d3bd-c8bbe548934b@linux.intel.com>
In-Reply-To: <f80c7bf2-1d9e-40d7-d3bd-c8bbe548934b@linux.intel.com>
From: noman pouigt <variksla@gmail.com>
Date: Wed, 22 Jun 2022 13:47:37 -0700
Message-ID: <CAES_P+9eK4cN3ZYvQoq9Ch0U2o4Ds4hnTawZzy50OqPv-MGOhg@mail.gmail.com>
Subject: Re: [Sound-open-firmware] ASoC: SOF: Race condition in ipc.c
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, Mark Brown <broonie@kernel.org>,
 yangyingliang@huawei.com, rander.wang@intel.com,
 peter.ujfalusi@linux.intel.com, sound-open-firmware@alsa-project.org
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

On Tue, Jun 21, 2022 at 6:38 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 6/20/22 21:46, noman pouigt wrote:
> > Folks,
> >
> > I have borrowed part of SOF architecture for my own DSP
> > framework development as the memory on the DSP is
> > extremely small and wouldn't be able to support SOF.
>
> You're providing very little context here. Of course it's open-source
> and you can do whatever you want with the code, but it's not clear if
> the 'borrowed' code can deal with your specific case.

I have borrowed the entire SOF ipc communication architecture however
I have tweaked it a bit to suit my needs.

>
> > Currently I am running into a race condition as below:
> >
> > CPU                                            DSP
> > PCM_TRIGGER_START
> > sof_ipc_send_msg ---->
> >
> >                                       <------Immediate ACK
> > ipc3_wait_tx_done
> > (wait_event_timeout)
> >                                       <------ POSITION update
> >
> > snd_pcm_period_elapsed
> >
> >
> > As you can see TRIGGER_START didn't even finish
> > and waiting for it to complete in ipc3_wait_tx_done
> > function. However, before it could complete the position
> > interrupt was issued which results in calling period_elapsed
> > function.
> >
> > In order to fix this I assume below is called in SOF framework:
> > schedule_work(&spcm->stream[substream->stream].period_elapsed_work);
> >
> > How is this design working? If the interrupt is coming too fast
> > from the DSP than the associated function with this schedule_work
> > will not get called as the scheduler will not get time to schedule the
> > workqueue and elapsed function will not be called thereby not increasing
> > the hw_ptr. How is the flow control for data transfer achieved?
>
> The schedule_work was added by this commit, and the explanations are
> rather straightforward:
>
> commit e2803e610aecb36ea4fec5a04861547664580d0c
>
> Author: Keyon Jie <yang.jie@linux.intel.com>
>
> Date:   Tue Apr 30 18:09:25 2019 -0500
>
>
>
>
> ASoC: SOF: PCM: add period_elapsed work to fix race condition in
> interrupt context
>
> "
> The IPC implementation in SOF requires sending IPCs serially: we should
> not send a new IPC command to the firmware before we get an ACK (or time
> out) from firmware, and the IRQ processing is complete.
>
> snd_pcm_period_elapsed() can be called in interrupt context before
> IRQ_HANDLED is returned. When the PCM is done draining, a STOP
> IPC will then be sent, which breaks the expectation that IPCs are
> handled serially and leads to IPC timeouts.
>
> This patch adds a workqueue to defer the call to snd_pcm_elapsed() after
> the IRQ is handled.
> "
>
> I am not sure what the problem you have really is.

I am using QEMU to develop the playback driver and the design( borrowed
from SOF with some tweaks) as below:

1. In PCM_PARAMS, number of period and period size information is shared
with DSP.
2. TRIGGER (in SOF every IPC requires an ack but for this command DSP
doesn't send ack) is sent by the CPU to DSP to start playback. I am not calling
wait_event_timeout for this command from the CPU side.
3. Whenever DSP is done with a period it sends an interrupt.
4. CPU calls the elapsed function whenever an interrupt is received
and this repeats.

With the above design things are running smoothly but sometimes I am
running into
an UNDERRUN issue. Complete logs copied at the end of the mail.
Questions:
a. Do I just need to play with different period sizes to get this right?
b. What I have noticed is below when the issue happens.

[  505.493600][  T123] sdev_dev sdev_dev: ipc tx: 0x60040000:
GLB_STREAM_MSG: TRIG_START
[  505.493961][  T100] sdev_dev sdev_dev: ipc rx: 0x600a0000:
GLB_STREAM_MSG: POSITION
[  505.494228][  T100] event_handler irq_pos 12000
[  505.494541][  T123] sdev_dev sdev_dev: ipc tx succeeded:
0x60040000: GLB_STREAM_MSG: TRIG_START

"event_handler irq_pos" if this line (it calls elapsed function) comes
before trig_start succeeds
as shown above then the UNDERRUN issue happens otherwise not.

c. Is there any relation to the above sequence of logs to the underrun issue?

>
> It's not really surprising that the first period is consumed
> immediately, the flow will become more steady-state afterwards.
>
> The DMAs should be primed to deal with more than one period, and the
> schedule_work() will only signal that the application can refill the
> ring buffer. There's all kinds of delays that will happen depending on
> load and scheduling, and if the POSITION_UPDATE was received immediately
> then there's should be still plenty of time to provide a new buffer.
>
> >
> > I am facing the above problem in my design.
> >
> > I am wondering if I can simply add one more IPC command(don't call
> > wait_event_interruptible for this) after TRIGGER_START to start the
> > streaming.This way schedule_work for updating period_elapsed function
> > can be avoided and it can be called in an interrupt context.
>
> See commit above, this won't work because you'll be sending an IPC while
> dealing with an IPC.
Understood but as explained above for the trigger command there is no reply.


  stream       : PLAYBACK
  access       : RW_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 1
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 24000
  period_size  : 6000
  period_time  : 125000
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 6000
  period_event : 0
  start_threshold  : 24000
  stop_threshold   : 24000
  silence_threshold: 0
  silence_size : 0
  boundary     : 6755399441055744000
  appl_ptr     : 0
  hw_ptr       : 0
[  505.489005][  T123] snd_pcm_playback_avail hw_ptr 0 buffer_size
24000 appl_ptr 0
[  505.489361][  T123] snd_pcm_playback_avail hw_ptr 0 buffer_size
24000 appl_ptr 6000
[  505.489635][  T123] snd_pcm_playback_avail hw_ptr 0 buffer_size
24000 appl_ptr 6000
[  505.490172][  T123] snd_pcm_playback_avail hw_ptr 0 buffer_size
24000 appl_ptr 6000
[  505.490592][  T123] snd_pcm_playback_avail hw_ptr 0 buffer_size
24000 appl_ptr 12000
[  505.490868][  T123] snd_pcm_playback_avail hw_ptr 0 buffer_size
24000 appl_ptr 12000
[  505.491464][  T123] snd_pcm_playback_avail hw_ptr 0 buffer_size
24000 appl_ptr 12000
[  505.491777][  T123] snd_pcm_playback_avail hw_ptr 0 buffer_size
24000 appl_ptr 18000
[  505.492053][  T123] snd_pcm_playback_avail hw_ptr 0 buffer_size
24000 appl_ptr 18000
[  505.492652][  T123] snd_pcm_playback_avail hw_ptr 0 buffer_size
24000 appl_ptr 18000
[  505.492965][  T123] snd_pcm_playback_avail hw_ptr 0 buffer_size
24000 appl_ptr 24000
[  505.493242][  T123] snd_pcm_playback_avail hw_ptr 0 buffer_size
24000 appl_ptr 24000
[  505.493600][  T123] sdev_dev sdev_dev: ipc tx: 0x60040000:
GLB_STREAM_MSG: TRIG_START
[  505.493961][  T100] sdev_dev sdev_dev: ipc rx: 0x600a0000:
GLB_STREAM_MSG: POSITION
[  505.494228][  T100] event_handler irq_pos 12000
[  505.494541][  T123] sdev_dev sdev_dev: ipc tx succeeded:
0x60040000: GLB_STREAM_MSG: TRIG_START
[  505.494844][  T123] snd_pcm_playback_avail hw_ptr 0 buffer_size
24000 appl_ptr 24000
[  505.495173][  T100] sof_pcm_pointer 346 moving by 6000
[  505.495479][  T100] IRQ: pos=6000, old=0, base=0, period=6000, buf=24000
[  505.495519][  T100] snd_pcm_playback_avail hw_ptr 6000 buffer_size
24000 appl_ptr 24000
[  505.496020][  T100] sdev_dev sdev_dev: ipc rx done: 0x600a0000:
GLB_STREAM_MSG: POSITION
[  505.496481][  T100] sdev_dev sdev_dev: ipc rx: 0x600a0000:
GLB_STREAM_MSG: POSITION
[  505.496748][  T100] event_handler irq_pos 24000
[  505.496934][  T100] sof_pcm_pointer 346 moving by 12000
[  505.497147][  T100] IRQ: pos=12000, old=6000, base=0, period=6000, buf=24000
[  505.497188][  T100] snd_pcm_playback_avail hw_ptr 12000 buffer_size
24000 appl_ptr 24000
[  505.497754][  T100] sdev_dev sdev_dev: ipc rx done: 0x600a0000:
GLB_STREAM_MSG: POSITION
[  505.498170][  T100] sdev_dev sdev_dev: ipc rx: 0x600a0000:
GLB_STREAM_MSG: POSITION
[  505.498522][  T100] event_handler irq_pos 36000
[  505.498707][  T100] sof_pcm_pointer 346 moving by 18000
[  505.498921][  T100] IRQ: pos=18000, old=12000, base=0, period=6000, buf=24000
[  505.498961][  T100] snd_pcm_playback_avail hw_ptr 18000 buffer_size
24000 appl_ptr 24000
[  505.499522][  T100] sdev_dev sdev_dev: ipc rx done: 0x600a0000:
GLB_STREAM_MSG: POSITION
[  505.499937][  T100] sdev_dev sdev_dev: ipc rx: 0x600a0000:
GLB_STREAM_MSG: POSITION
[  505.500204][  T100] event_handler irq_pos 0
[  505.500432][  T100] sof_pcm_pointer 346 moving by 0
[  505.500637][  T100] IRQ: pos=0, old=18000, base=0, period=6000, buf=24000
[  505.500678][  T100] snd_pcm_playback_avail hw_ptr 24000 buffer_size
24000 appl_ptr 24000
[  505.501547][  T100] sdev_dev sdev_dev: ipc tx: 0x60050000:
GLB_STREAM_MSG: TRIG_STOP
[  505.501840][  T100] sdev_dev sdev_dev: ipc tx succeeded:
0x60050000: GLB_STREAM_MSG: TRIG_STOP
[  505.502161][  T100] sdev_dev sdev_dev: ipc rx done: 0x600a0000:
GLB_STREAM_MSG: POSITION
[  505.502822][  T123] snd_pcm_playback_avail hw_ptr 24000 buffer_size
24000 appl_ptr 24000
underrun!!! (at least 0.972 ms long)
Status:
  state       : XRUN
  trigger_time: 505.482872
  tstamp      : 0.000000
  delay       : 0
  avail       : 24000
  avail_max   : 24000
