Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A67C4C5039
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 21:57:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D5F31FB3;
	Fri, 25 Feb 2022 21:56:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D5F31FB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645822633;
	bh=/r79V8LRJIZ8JV7jUCgT2wosQNagEt4qS/0oP3F35ts=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q3KyIuLHpn9XQsry+d73R7f9kMiBPsI8iZHOk5eNmYtN6c9JnTTgbzM+X+nbuxDu0
	 MaVirTcCqpWBqBGlTrgaTb3IIviXD58FnLiITOlk/d8es185XPKw9A+xJCBocO7SbT
	 jMpX2jGmWy1QVvkhGvNY6Cr8HpKeZNc17s8vlPKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB6C7F80559;
	Fri, 25 Feb 2022 21:53:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8710F80536; Fri, 25 Feb 2022 21:52:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCC89F80526
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 21:52:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCC89F80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dmVYCqf2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645822366; x=1677358366;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/r79V8LRJIZ8JV7jUCgT2wosQNagEt4qS/0oP3F35ts=;
 b=dmVYCqf2gf2yvKPsqbp5l8r8YukqQdy3vPeu2u5m5ZwLktg99smZLveP
 FTR1tb0rUM5Lpq5UHSeu9+/Pw+glsxGYszPqOpOddl7axpGzkYHRJeF8u
 2h0IuaCxVpu35VQ+ilK2v0veUjhlh1quOSvT3vQS5tRedMmjDmCxNxk7Q
 j05VmtAjIMpUWdP03h+cJO/Ksy/TTG8/RaKoZyYjXeSZDTtK9PfD8hMta
 CZTn+AsfcX3gorynczZsVUOGRqDELBb3P1PmZJZu53rOPNxqk4ATZ4j5R
 K5NwRNK+VQKe4CVuQ2+jzmXFua26WcP+gfYowRCDExxUUApWd2/Dspkqg A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="313296145"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="313296145"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:43 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="777520599"
Received: from nnwogbe-mobl1.amr.corp.intel.com (HELO [10.212.101.231])
 ([10.212.101.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:42 -0800
Message-ID: <d41c3acf-09e4-3822-7b13-211d4f71d22e@linux.intel.com>
Date: Fri, 25 Feb 2022 14:37:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 04/17] ASoC: Intel: avs: Inter process communication
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-5-cezary.rojewski@intel.com>
 <c2f249df-0b3e-1032-6514-81fabb544b6f@linux.intel.com>
 <1a8c9196-0ae2-c25b-32de-15821c948185@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1a8c9196-0ae2-c25b-32de-15821c948185@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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


>>> +static inline void avs_ipc_err(struct avs_dev *adev, struct
>>> avs_ipc_msg *tx,
>>> +                   const char *name, int error)
>>> +{
>>> +    /*
>>> +     * If IPC channel is blocked e.g.: due to ongoing recovery,
>>> +     * -EPERM error code is expected and thus it's not an actual error.
>>> +     */
>>> +    if (error == -EPERM)
>>> +        dev_dbg(adev->dev, "%s 0x%08x 0x%08x failed: %d\n", name,
>>> +            tx->glb.primary, tx->glb.ext.val, error);
>>> +    else
>>> +        dev_err(adev->dev, "%s 0x%08x 0x%08x failed: %d\n", name,
>>> +            tx->glb.primary, tx->glb.ext.val, error);
>>> +}
>>
>> we've used such functions before and the feedback, e.g. from GregKH and
>> Mark Brown, has consistenly been that this is pushing the use of dev_dbg
>> too far.
> 
> 
> In basically all cases the outcome is going to be dev_err(). dev_dbg()
> is here to help keep DSP-recovery scenario viewer-friendly when checking
> dmesg. Ideally, there should be no DSP-recoveries to begin with : )

I will refer you to this thread:

https://lore.kernel.org/alsa-devel/YGX5AUQi41z52xk8@kroah.com/

> 
>>> +#define AVS_IPC_TIMEOUT_MS    300
>>
>> skl-sst-ipc.c:#define IPC_TIMEOUT_MSECS         3000
>>
>> that's one order of magniture lower. please add a comment or align.
>>
>>> +static void avs_dsp_receive_rx(struct avs_dev *adev, u64 header)
>>> +{
>>> +    struct avs_ipc *ipc = adev->ipc;
>>> +    union avs_reply_msg msg = AVS_MSG(header);
>>> +
>>> +    ipc->rx.header = header;
>>> +    if (!msg.status)
>>> +        memcpy_fromio(ipc->rx.data, avs_uplink_addr(adev),
>>> +                  ipc->rx.size);
>>
>> it wouldn't hurt to describe that the status determines whether
>> additional information can be read from a mailbox.
> 
> 
> Isn't that consisted with the behaviour of typical API function? Do not
> copy memory and return it to the caller if something went wrong along
> the way?

oh, I thought this was a case where the header contains all the
information, and only in specific cases you need to read stuff from the
mailbox.

You definitively need to add a comment on whether this is an error
handling or a feature.


>>> +void avs_dsp_process_response(struct avs_dev *adev, u64 header)
>>> +{
>>> +    struct avs_ipc *ipc = adev->ipc;
>>> +
>>> +    if (avs_msg_is_reply(header)) {
>>
>> the naming is confusing, it's difficult for me to understand that a
>> 'response' could not be a 'reply'. The two terms are synonyms, aren't
>> they?
> 
> 
> Those two are not the same from the firmware's point of view and thus
> they are not the same here. Response is either a reply or a
> notification. Replies are solicited, a request has been sent beforehand.
> Notifications are unsolicited, you are not sure when exactly and if at
> all they arrive.

add a comment then.

> Just so I'm not called a heretic later: yes, from English dictionary
> point of view these two words are synonyms. In general, wording found in
> this drivers matches firmware equivalents wherever possible to allow
> developers to switch between these two worlds with minimal adaptation
> period possible.

> 
>>> +    /* DSP acked host's request */
>>> +    if (hipc_ack & spec->hipc_ack_done_mask) {
>>> +        /* mask done interrupt */
>>> +        snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
>>> +                      AVS_ADSP_HIPCCTL_DONE, 0);
>>> +
>>> +        complete(&ipc->done_completion);
>>> +
>>> +        /* tell DSP it has our attention */
>>> +        snd_hdac_adsp_updatel(adev, spec->hipc_ack_offset,
>>> +                      spec->hipc_ack_done_mask,
>>> +                      spec->hipc_ack_done_mask);
>>> +        /* unmask done interrupt */
>>> +        snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
>>> +                      AVS_ADSP_HIPCCTL_DONE,
>>> +                      AVS_ADSP_HIPCCTL_DONE);
>>
>> does the order between the complete() and the next two register updates
>> matter?
>>
>> I would have updated the registers immediately and signal the completion
>> later.
>>
>> I am also not sure why it's necessary to mask the done interrupt then
>> unmask it. There is nothing that seems to require this masking?
>>
>> Or are you expecting the code blocked on wait_for_completion to be
>> handled with interrupts masked, which could be quite racy?
> 
> 
> Given how the things turned out in cAVS, some steps are not always
> required. Here, we have very strict implementation and so interrupt are
> masked.
> 
> I'm unsure if relocating complete() to the bottom would bring any
> consequences. And no, the code waiting_for_completion is not expecting
> interrupts to be masked as there is no reply for ROM messages.

it would be just fine to add that the masking is added as an extra
precaution, the order does not matter and the code executed after the
complete() does not assume any masking.

> 
>>> +        ret = IRQ_HANDLED;
>>> +    }
>>> +
>>> +    /* DSP sent new response to process */
>>> +    if (hipc_rsp & spec->hipc_rsp_busy_mask) {
>>> +        /* mask busy interrupt */
>>> +        snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
>>> +                      AVS_ADSP_HIPCCTL_BUSY, 0);
>>> +
>>> +        ret = IRQ_WAKE_THREAD;
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>
>>> +static int avs_ipc_wait_busy_completion(struct avs_ipc *ipc, int
>>> timeout)
>>> +{
>>> +    int ret;
>>> +
>>> +again:
>>> +    ret = wait_for_completion_timeout(&ipc->busy_completion,
>>> +                      msecs_to_jiffies(timeout));
>>> +    /*
>>> +     * DSP could be unresponsive at this point e.g. manifested by
>>> +     * EXCEPTION_CAUGHT notification. If so, no point in continuing.
>>
>> EXCEPTION_CAUGHT doesn't seem to be described in this patchset, so not
>> sure what this comment might mean.
> 
> 
> Comment describes the circumstances for the communication failures and
> arrival of EXCEPTION_CAUGHT notification is one of them.

that detail is unnecessary for reviewers.

> 
>>> +     */
>>> +    if (!ipc->ready)
>>> +        return -EPERM;
>>> +
>>> +    if (!ret) {
>>> +        if (!avs_ipc_is_busy(ipc))
>>> +            return -ETIMEDOUT;
>>> +        /*
>>> +         * Firmware did its job, either notification or reply
>>> +         * has been received - now wait until it's processed.
>>> +         */
>>> +        wait_for_completion_killable(&ipc->busy_completion);
>>
>> can you elaborate on why wait_for_completion() is not enough? I haven't
>> seen the 'killable' attribute been used by anyone in sound/
> 
> 
> This is connected to how firmware handles messaging i.e. via queue. you
> may get BUSY interrupt caused by a notification while waiting for the
> reply for your request. Being 'disturbed' by a notification does not
> mean firmware is dead, it's just busy and so we wait until previous
> response is processed entirely.

this does not clarify why 'killable' is necessary?

> 
>>> +    }
>>> +
>>> +    /* Ongoing notification's bottom-half may cause early wakeup */
>>> +    spin_lock(&ipc->rx_lock);
>>> +    if (!ipc->rx_completed) {
>>> +        /* Reply delayed due to notification. */
>>> +        reinit_completion(&ipc->busy_completion);
>>> +        spin_unlock(&ipc->rx_lock);
>>> +        goto again;
>>
>> shouldn't there be some counter to avoid potential infinite loops here?
> 
> 
> This is not a bad idea although the counter is going to be high e.g.:
> 128. With DEBUG-level logs enabled you can get ton of messages before
> your reply gets finally sent.

dev_dbg() in interrupts is usually not very helpful. we're trying to
move to traces instead.

> 
>>> +    }
>>> +
>>> +    spin_unlock(&ipc->rx_lock);
>>> +    return 0;
>>> +}
>>
>>> +static int avs_dsp_do_send_msg(struct avs_dev *adev, struct
>>> avs_ipc_msg *request,
>>> +                   struct avs_ipc_msg *reply, int timeout)
>>> +{
>>> +    struct avs_ipc *ipc = adev->ipc;
>>> +    int ret;
>>> +
>>> +    if (!ipc->ready)
>>> +        return -EPERM;
>>> +
>>> +    mutex_lock(&ipc->msg_mutex);
>>> +
>>> +    spin_lock(&ipc->rx_lock);
>>> +    avs_ipc_msg_init(ipc, reply);
>>> +    avs_dsp_send_tx(adev, request);
>>> +    spin_unlock(&ipc->rx_lock);
>>> +
>>> +    ret = avs_ipc_wait_busy_completion(ipc, timeout);
>>> +    if (ret) {
>>> +        if (ret == -ETIMEDOUT) {
>>> +            dev_crit(adev->dev, "communication severed: %d,
>>> rebooting dsp..\n",
>>> +                 ret);
>>
>> dev_crit() seems over the top if there is a recovery mechanism
> 
> 
> There is just one dev_crit() within entire driver and it's there for a
> reason - communication failure is critical and in practice, should never
> occur in any scenario on the production hardware.

git grep dev_crit shows mostly this being used for temperature and
shorts in codec drivers. that seems more 'critical' than a communication
failure that likely does not result in spontaneous combustion.

