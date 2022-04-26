Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43471510C08
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 00:26:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAA511813;
	Wed, 27 Apr 2022 00:25:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAA511813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651011974;
	bh=eTvev1d58wOvWQoOgItkMM5OwULU9yJjY5KS6chB3CI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rKETKoPnhDDexp2uxWWDbgvn0D+oeeyTh56JEBu7abtH+Ngg3TqJvZOi5ueIXGwZ9
	 ySu2PeUX793U2F9VdV5MgeWUpIxRJqdFX5vA7boZcszL4kSRURSZ+qX3L+H9cbdzmQ
	 QE+XkDl0Ud5STxsykKQyK8kNQQimkbSQ3i12yoLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24A25F80539;
	Wed, 27 Apr 2022 00:23:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D026FF80506; Wed, 27 Apr 2022 00:23:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AAB2F8025C
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 00:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AAB2F8025C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jzd1T+HD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651011803; x=1682547803;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eTvev1d58wOvWQoOgItkMM5OwULU9yJjY5KS6chB3CI=;
 b=jzd1T+HDrru50ZheXC/0kvd5GV6e0p53f8NBRwG1rbYwbfyM8KtUBkwH
 EGyWAPphE9FDA7Xu8Qb1TTn2vLorBMviXwusdrXAIVWJdMK2zloTbT5ZV
 DTia0M2jY2HF23+eXzl1gpmUYdJ1m47oqMqpphUL1sUJQJ55K2fVlxYcD
 bv6aDcfOxeNFNLUey2yK1jdLWvux1PGrWSsBb/YQKi1epgRk/HMm4QMNi
 w59bSj2THLBHUNtnDfmnYwT/4vINMgiaML5cOcJccTPjyFixP1kos5eKr
 uIbzFHvH0FMvcaUkRc0jeH8jZJXwxvpMdK2TAmZhoKOvuSa8py5u+GD0j Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="245660725"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="245660725"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 15:23:18 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="532888623"
Received: from gkanakas-mobl.amr.corp.intel.com (HELO [10.212.152.229])
 ([10.212.152.229])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 15:23:17 -0700
Message-ID: <c62f108e-6887-a4e2-a155-e0d18b142ee3@linux.intel.com>
Date: Tue, 26 Apr 2022 16:58:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 08/14] ASoC: Intel: avs: D0ix power state support
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-9-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220426172346.3508411-9-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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



On 4/26/22 12:23, Cezary Rojewski wrote:
> Audio DSP device supports D0 substates in form of D0ix, allowing for
> preserving more power even when device is still considered active (D0).
> When entered, certain domains which are not being currently used become
> power gated. Entering and leaving D0ix is a complex process and differs
> between firmware generations.
> 
> Conditions that disallow D0i3 and require immediate D0i0 transition
> include but may not be limited to: IPC traffic, firmware tracing and
> SRAM I/O. To make D0ix toggling sane, delay D0i3 transition and refresh
> the timer each time an IPC is requrested.

typo: requested.

I find it odd to list all kinds of criteria but only handle one in the end. Do the other matter, is this a TODO, unclear what you are trying to say.

>  int avs_get_module_entry(struct avs_dev *adev, const guid_t *uuid, struct avs_module_entry *entry);
> diff --git a/sound/soc/intel/avs/dsp.c b/sound/soc/intel/avs/dsp.c
> index 3ff17bd22a5a..2f18b137ff42 100644
> --- a/sound/soc/intel/avs/dsp.c
> +++ b/sound/soc/intel/avs/dsp.c
> @@ -152,6 +152,15 @@ static int avs_dsp_get_core(struct avs_dev *adev, u32 core_id)
>  
>  	adev->core_refs[core_id]++;
>  	if (adev->core_refs[core_id] == 1) {
> +		/*
> +		 * No cores other than main-core can be running for DSP
> +		 * to achieve d0ix. Conscious SET_D0IX IPC failure is permitted,

conscious failure? what's that?

> +		 * simply d0ix power state will no longer be attempted.
> +		 */
> +		ret = avs_dsp_disable_d0ix(adev);
> +		if (ret && ret != -AVS_EIPC)
> +			goto err_disable_d0ix;
> +
>  		ret = avs_dsp_enable(adev, mask);
>  		if (ret)
>  			goto err_enable_dsp;
tatic int
> +avs_dsp_set_d0ix(struct avs_dev *adev, bool enable)
> +{
> +	struct avs_ipc *ipc = adev->ipc;
> +	int ret;
> +
> +	/* Is transition required? */
> +	if (ipc->in_d0ix == enable)
> +		return 0;
> +
> +	ret = avs_dsp_op(adev, set_d0ix, enable);
> +	if (ret) {
> +		/* Prevent further d0ix attempts on conscious IPC failure. */

??

> +		if (ret == -AVS_EIPC)
> +			atomic_inc(&ipc->d0ix_disable_depth);
> +
> +		ipc->in_d0ix = false;
> +		return ret;
> +	}
> +
> +	ipc->in_d0ix = enable;
> +	return 0;
> +}
> +
> +static void avs_dsp_schedule_d0ix(struct avs_dev *adev, struct avs_ipc_msg *tx)
> +{
> +	if (atomic_read(&adev->ipc->d0ix_disable_depth))
> +		return;
> +
> +	mod_delayed_work(system_power_efficient_wq, &adev->ipc->d0ix_work,
> +			 msecs_to_jiffies(AVS_D0IX_DELAY_MS));
> +}
> +
> +static void avs_dsp_d0ix_work(struct work_struct *work)
> +{
> +	struct avs_ipc *ipc = container_of(work, struct avs_ipc, d0ix_work.work);
> +
> +	avs_dsp_set_d0ix(to_avs_dev(ipc->dev), true);
> +}
> +
> +static int avs_dsp_wake_d0i0(struct avs_dev *adev, struct avs_ipc_msg *tx)
> +{
> +	struct avs_ipc *ipc = adev->ipc;
> +
> +	if (!atomic_read(&ipc->d0ix_disable_depth)) {
> +		cancel_delayed_work_sync(&ipc->d0ix_work);
> +		return avs_dsp_set_d0ix(adev, false);
> +	}
> +
> +	return 0;
> +}
> +
> +int avs_dsp_disable_d0ix(struct avs_dev *adev)
> +{
> +	struct avs_ipc *ipc = adev->ipc;
> +
> +	/* Prevent PG only on the first disable. */
> +	if (atomic_add_return(1, &ipc->d0ix_disable_depth) == 1) {
> +		cancel_delayed_work_sync(&ipc->d0ix_work);
> +		return avs_dsp_set_d0ix(adev, false);
> +	}
> +
> +	return 0;
> +}
> +
> +int avs_dsp_enable_d0ix(struct avs_dev *adev)
> +{
> +	struct avs_ipc *ipc = adev->ipc;
> +
> +	if (atomic_dec_and_test(&ipc->d0ix_disable_depth))
> +		queue_delayed_work(system_power_efficient_wq, &ipc->d0ix_work,
> +				   msecs_to_jiffies(AVS_D0IX_DELAY_MS));
> +	return 0;
> +}
>  
>  static void avs_dsp_recovery(struct avs_dev *adev)
>  {
> @@ -391,10 +467,35 @@ static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request
>  	return ret;
>  }
>  
> +static int avs_dsp_send_msg_sequence(struct avs_dev *adev, struct avs_ipc_msg *request,
> +				     struct avs_ipc_msg *reply, int timeout, bool wake_d0i0,
> +				     bool schedule_d0ix)
> +{
> +	int ret;
> +
> +	if (wake_d0i0) {
> +		ret = avs_dsp_wake_d0i0(adev, request);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = avs_dsp_do_send_msg(adev, request, reply, timeout);
> +	if (ret)
> +		return ret;
> +
> +	if (schedule_d0ix)
> +		avs_dsp_schedule_d0ix(adev, request);
> +
> +	return 0;
> +}
> +
>  int avs_dsp_send_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request,
>  			     struct avs_ipc_msg *reply, int timeout)
>  {
> -	return avs_dsp_do_send_msg(adev, request, reply, timeout);
> +	bool wake_d0i0 = avs_dsp_op(adev, d0ix_toggle, request, true);
> +	bool schedule_d0ix = avs_dsp_op(adev, d0ix_toggle, request, false);
> +
> +	return avs_dsp_send_msg_sequence(adev, request, reply, timeout, wake_d0i0, schedule_d0ix);
>  }
>  
>  int avs_dsp_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
> @@ -403,6 +504,19 @@ int avs_dsp_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
>  	return avs_dsp_send_msg_timeout(adev, request, reply, adev->ipc->default_timeout_ms);
>  }
>  
> +int avs_dsp_send_pm_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request,
> +				struct avs_ipc_msg *reply, int timeout, bool wake_d0i0)
> +{
> +	return avs_dsp_send_msg_sequence(adev, request, reply, timeout, wake_d0i0, false);
> +}
> +
> +int avs_dsp_send_pm_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
> +			struct avs_ipc_msg *reply, bool wake_d0i0)
> +{
> +	return avs_dsp_send_pm_msg_timeout(adev, request, reply, adev->ipc->default_timeout_ms,
> +					   wake_d0i0);
> +}
> +
>  static int avs_dsp_do_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg *request, int timeout)
>  {
>  	struct avs_ipc *ipc = adev->ipc;
> @@ -463,6 +577,7 @@ int avs_ipc_init(struct avs_ipc *ipc, struct device *dev)
>  	ipc->ready = false;
>  	ipc->default_timeout_ms = AVS_IPC_TIMEOUT_MS;
>  	INIT_WORK(&ipc->recovery_work, avs_dsp_recovery_work);
> +	INIT_DELAYED_WORK(&ipc->d0ix_work, avs_dsp_d0ix_work);
>  	init_completion(&ipc->done_completion);
>  	init_completion(&ipc->busy_completion);
>  	spin_lock_init(&ipc->rx_lock);
> @@ -475,4 +590,6 @@ void avs_ipc_block(struct avs_ipc *ipc)
>  {
>  	ipc->ready = false;
>  	cancel_work_sync(&ipc->recovery_work);
> +	cancel_delayed_work_sync(&ipc->d0ix_work);
> +	ipc->in_d0ix = false;
>  }
> diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
> index 3da33150aabf..6404fce8cde4 100644
> --- a/sound/soc/intel/avs/messages.c
> +++ b/sound/soc/intel/avs/messages.c
> @@ -432,7 +432,7 @@ int avs_ipc_set_dx(struct avs_dev *adev, u32 core_mask, bool powerup)
>  	request.data = &dx;
>  	request.size = sizeof(dx);
>  
> -	ret = avs_dsp_send_msg(adev, &request, NULL);
> +	ret = avs_dsp_send_pm_msg(adev, &request, NULL, true);
>  	if (ret)
>  		avs_ipc_err(adev, &request, "set dx", ret);
>  
> @@ -456,7 +456,7 @@ int avs_ipc_set_d0ix(struct avs_dev *adev, bool enable_pg, bool streaming)
>  
>  	request.header = msg.val;
>  
> -	ret = avs_dsp_send_msg(adev, &request, NULL);
> +	ret = avs_dsp_send_pm_msg(adev, &request, NULL, false);
>  	if (ret)
>  		avs_ipc_err(adev, &request, "set d0ix", ret);
>  
