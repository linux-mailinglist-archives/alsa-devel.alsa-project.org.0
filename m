Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B888514D71D
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 08:49:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5503C1678;
	Thu, 30 Jan 2020 08:48:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5503C1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580370559;
	bh=j4xPih7O3TzSFBVAt4O3uemNVxLXMuVO39xz+++Ec54=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pVUMopO/mgheVNP9p5pZsUyKolXxHzgGJ+7h2mg44btB7buFpkiouQdO2Q5iJ/bZC
	 /y72zPah1BUnP3l2xNpbcfN+9p+jPbyzkSxF0DlscwDMXiwR9lT3SZroa6ECLMlzfM
	 iaMkye2KfEKkScLs6/A53sPeq/d0afNPquy2Ns4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8274AF80227;
	Thu, 30 Jan 2020 08:47:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A23FF801F8; Thu, 30 Jan 2020 08:47:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B70EEF801EB
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 08:47:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B70EEF801EB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 23:47:33 -0800
X-IronPort-AV: E=Sophos;i="5.70,381,1574150400"; d="scan'208";a="232820530"
Received: from aslawinx-mobl1.ger.corp.intel.com (HELO [10.249.152.213])
 ([10.249.152.213])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 29 Jan 2020 23:47:30 -0800
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
 <20200129220726.31792-6-pierre-louis.bossart@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <2c982980-32f2-60a4-a384-7b767fafab66@linux.intel.com>
Date: Thu, 30 Jan 2020 08:47:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129220726.31792-6-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 5/9] ASoC: SOF: Move DSP power state
 transitions to platform-specific ops
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



On 1/29/2020 11:07 PM, Pierre-Louis Bossart wrote:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> The DSP device substates such as D0I0/D0I3
> are platform-specific. Therefore, the d0_substate
> field of struct snd_sof_dev is replaced
> with the dsp_power_state field which represents the current
> state of the DSP. This field holds both the device state
> and the platform-specific substate values.
> 
> With the DSP device substates being platform-specific,
> the DSP power state transitions need to be performed in
> the platform-specific suspend/resume ops as well.
> 
> In order to achieve this, the ops signature has to be
> modified to pass the target device state as an
> argument. The target substate will be determined by
> the platform-specific ops before performing the transition.
> For example, in the case of the system suspending to S0IX,
> the top-level SOF device suspend callback needs to
> only determine if the DSP will be entering
> D3 or remain in D0. The target substate in case the device
> needs to remain in D0 (D0I0 or D0I3) will be determined
> by the platform-specific suspend op.
> 
> With the addition of the extended set of power states for the DSP,
> the set_power_state op for HDA platforms has to be extended
> to handle only the appropriate state transitions. So, the
> implementation for the Intel HDA platforms is also modified.
> 
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   sound/soc/sof/core.c          |   4 +-
>   sound/soc/sof/intel/hda-dsp.c | 223 +++++++++++++++++++++++++++++++---
>   sound/soc/sof/intel/hda.h     |  10 +-
>   sound/soc/sof/ops.h           |  16 +--
>   sound/soc/sof/pm.c            |  92 ++------------
>   sound/soc/sof/sof-priv.h      |  18 ++-
>   6 files changed, 242 insertions(+), 121 deletions(-)
> 
> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
> index 34cefbaf2d2a..1d07450aff77 100644
> --- a/sound/soc/sof/core.c
> +++ b/sound/soc/sof/core.c
> @@ -286,8 +286,8 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
>   	/* initialize sof device */
>   	sdev->dev = dev;
>   
> -	/* initialize default D0 sub-state */
> -	sdev->d0_substate = SOF_DSP_D0I0;
> +	/* initialize default DSP power state */
> +	sdev->dsp_power_state.state = SOF_DSP_PM_D0;
>   
>   	sdev->pdata = plat_data;
>   	sdev->first_boot = true;
> diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
> index fddf2c48904f..8c00e128a7b0 100644
> --- a/sound/soc/sof/intel/hda-dsp.c
> +++ b/sound/soc/sof/intel/hda-dsp.c
> @@ -338,13 +338,10 @@ static int hda_dsp_send_pm_gate_ipc(struct snd_sof_dev *sdev, u32 flags)
>   				  sizeof(pm_gate), &reply, sizeof(reply));
>   }
>   
> -int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
> -			    enum sof_d0_substate d0_substate)
> +static int hda_dsp_update_d0i3c_register(struct snd_sof_dev *sdev, u8 value)
>   {
>   	struct hdac_bus *bus = sof_to_bus(sdev);
> -	u32 flags;
>   	int ret;
> -	u8 value;
>   
>   	/* Write to D0I3C after Command-In-Progress bit is cleared */
>   	ret = hda_dsp_wait_d0i3c_done(sdev);
> @@ -354,7 +351,6 @@ int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
>   	}
>   
>   	/* Update D0I3C register */
> -	value = d0_substate == SOF_DSP_D0I3 ? SOF_HDA_VS_D0I3C_I3 : 0;
>   	snd_hdac_chip_updateb(bus, VS_D0I3C, SOF_HDA_VS_D0I3C_I3, value);
>   
>   	/* Wait for cmd in progress to be cleared before exiting the function */
> @@ -367,20 +363,160 @@ int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
>   	dev_vdbg(bus->dev, "D0I3C updated, register = 0x%x\n",
>   		 snd_hdac_chip_readb(bus, VS_D0I3C));
>   
> -	if (d0_substate == SOF_DSP_D0I0)
> -		flags = HDA_PM_PPG;/* prevent power gating in D0 */
> -	else
> -		flags = HDA_PM_NO_DMA_TRACE;/* disable DMA trace in D0I3*/
> +	return 0;
> +}
>   
> -	/* sending pm_gate IPC */
> -	ret = hda_dsp_send_pm_gate_ipc(sdev, flags);
> +static int hda_dsp_set_D0_state(struct snd_sof_dev *sdev,
> +				const struct sof_dsp_power_state *target_state)
> +{
> +	u32 flags = 0;
> +	int ret;
> +	u8 value = 0;
> +
> +	/*
> +	 * Sanity check for illegal state transitions
> +	 * The only allowed transitions are:
> +	 * 1. D3 -> D0I0
> +	 * 2. D0I0 -> D0I3
> +	 * 3. D0I3 -> D0I0
> +	 */
> +	switch (sdev->dsp_power_state.state) {
> +	case SOF_DSP_PM_D0:
> +		/* Follow the sequence below for D0 substate transitions */
> +		break;
> +	case SOF_DSP_PM_D3:
> +		/* Follow regular flow for D3 -> D0 transition */
> +		return 0;
> +	default:
> +		dev_err(sdev->dev, "error: transition from %d to %d not allowed\n",
> +			sdev->dsp_power_state.state, target_state->state);
> +		return -EINVAL;
> +	}
> +
> +	/* Set flags and register value for D0 target substate */
> +	if (target_state->substate == SOF_HDA_DSP_PM_D0I3) {
> +		value = SOF_HDA_VS_D0I3C_I3;
> +
> +		/* disable DMA trace in D0I3 */
> +		flags = HDA_PM_NO_DMA_TRACE;
> +	} else {
> +		/* prevent power gating in D0I0 */
> +		flags = HDA_PM_PPG;
> +	}
> +
> +	/* update D0I3C register */
> +	ret = hda_dsp_update_d0i3c_register(sdev, value);
>   	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * Notify the DSP of the state change.
> +	 * If this IPC fails, revert the D0I3C register update in order
> +	 * to prevent partial state change.
> +	 */
> +	ret = hda_dsp_send_pm_gate_ipc(sdev, flags);
> +	if (ret < 0) {
>   		dev_err(sdev->dev,
>   			"error: PM_GATE ipc error %d\n", ret);
> +		goto revert;
> +	}
> +
> +	return ret;
> +
> +revert:
> +	/* fallback to the previous register value */
> +	value = value ? 0 : SOF_HDA_VS_D0I3C_I3;
> +
> +	/*
> +	 * This can fail but return the IPC error to signal that
> +	 * the state change failed.
> +	 */
> +	hda_dsp_update_d0i3c_register(sdev, value);
>   
>   	return ret;
>   }
>   
> +/*
> + * All DSP power state transitions are initiated by the driver.
> + * If the requested state change fails, the error is simply returned.
> + * Further state transitions are attempted only when the set_power_save() op
> + * is called again either because of a new IPC sent to the DSP or
> + * during system suspend/resume.
> + */
> +int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
> +			    const struct sof_dsp_power_state *target_state)
> +{
> +	int ret = 0;
> +
> +	/* Nothing to do if the DSP is already in the requested state */
> +	if (target_state->state == sdev->dsp_power_state.state &&
> +	    target_state->substate == sdev->dsp_power_state.substate)
> +		return 0;
> +
> +	switch (target_state->state) {
> +	case SOF_DSP_PM_D0:
> +		ret = hda_dsp_set_D0_state(sdev, target_state);
> +		break;
> +	case SOF_DSP_PM_D3:
> +		/* The only allowed transition is: D0I0 -> D3 */
> +		if (sdev->dsp_power_state.state == SOF_DSP_PM_D0 &&
> +		    sdev->dsp_power_state.substate == SOF_HDA_DSP_PM_D0I0)
> +			break;
> +
> +		dev_err(sdev->dev,
> +			"error: transition from %d to %d not allowed\n",
> +			sdev->dsp_power_state.state, target_state->state);
> +		return -EINVAL;
> +	default:
> +		dev_err(sdev->dev, "error: target state unsupported %d\n",
> +			target_state->state);
> +		return -EINVAL;
> +	}
> +	if (ret < 0) {
> +		dev_err(sdev->dev,
> +			"failed to set requested target DSP state %d substate %d\n",
> +			target_state->state, target_state->substate);
> +		return ret;
> +	}
> +
> +	sdev->dsp_power_state = *target_state;
> +	dev_dbg(sdev->dev, "New DSP state %d substate %d\n",
> +		target_state->state, target_state->substate);
> +	return ret;
> +}
> +
> +/*
> + * Audio DSP states may transform as below:-
> + *
> + *                                         D0I3 compatible stream
> + *     Runtime    +---------------------+   opened only, timeout
> + *     suspend    |                     +--------------------+
> + *   +------------+       D0(active)    |                    |
> + *   |            |                     <---------------+    |
> + *   |   +-------->                     |               |    |
> + *   |   |Runtime +--^--+---------^--+--+ The last      |    |
> + *   |   |resume     |  |         |  |    opened D0I3   |    |
> + *   |   |           |  |         |  |    compatible    |    |
> + *   |   |     resume|  |         |  |    stream closed |    |
> + *   |   |      from |  | D3      |  |                  |    |
> + *   |   |       D3  |  |suspend  |  | d0i3             |    |
> + *   |   |           |  |         |  |suspend           |    |
> + *   |   |           |  |         |  |                  |    |
> + *   |   |           |  |         |  |                  |    |
> + * +-v---+-----------+--v-------+ |  |           +------+----v----+
> + * |                            | |  +----------->                |
> + * |       D3 (suspended)       | |              |      D0I3      +-----+
> + * |                            | +--------------+                |     |
> + * |                            |  resume from   |                |     |
> + * +-------------------^--------+  d0i3 suspend  +----------------+     |
> + *                     |                                                |
> + *                     |                       D3 suspend               |
> + *                     +------------------------------------------------+
> + *
> + * d0i3_suspend = s0_suspend && D0I3 stream opened,
> + * D3 suspend = !d0i3_suspend,
> + */
> +
>   static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
>   {
>   	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
> @@ -480,8 +616,22 @@ int hda_dsp_resume(struct snd_sof_dev *sdev)
>   {
>   	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
>   	struct pci_dev *pci = to_pci_dev(sdev->dev);
> +	const struct sof_dsp_power_state target_state = {
> +		.state = SOF_DSP_PM_D0,
> +		.substate = SOF_HDA_DSP_PM_D0I0,
> +	};
> +	int ret;
> +
> +	/* resume from D0I3 */
> +	if (sdev->dsp_power_state.state == SOF_DSP_PM_D0) {
> +		/* Set DSP power state */
> +		ret = hda_dsp_set_power_state(sdev, &target_state);
> +		if (ret < 0) {
> +			dev_err(sdev->dev, "error: setting dsp state %d substate %d\n",
> +				target_state.state, target_state.substate);
> +			return ret;
> +		}
>   
> -	if (sdev->system_suspend_target == SOF_SUSPEND_S0IX) {
>   		/* restore L1SEN bit */
>   		if (hda->l1_support_changed)
>   			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
> @@ -495,13 +645,27 @@ int hda_dsp_resume(struct snd_sof_dev *sdev)
>   	}
>   
>   	/* init hda controller. DSP cores will be powered up during fw boot */
> -	return hda_resume(sdev, false);
> +	ret = hda_resume(sdev, false);
> +	if (ret < 0)
> +		return ret;
> +
> +	hda_dsp_set_power_state(sdev, &target_state);

Return value  of hda_dsp_set_power_state() seems to be checked or 
directly returned in other functions, any reason to not do it here?

> +	return ret;
>   }
>   
>   int hda_dsp_runtime_resume(struct snd_sof_dev *sdev)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
