Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15182E85DA
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 11:39:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73C792217;
	Tue, 29 Oct 2019 11:38:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73C792217
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572345541;
	bh=wC/BI5lSRb/xYcu9CZL/otSAKkAXIboI82vP5xUIDAg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RUoSR3HtfZipNfne4v0CnMtGl34GBukbcknKYrW4H+Jxja5biLdw2Ffwq3cVmnEoA
	 qALsiw+tFAftrrsXABboCEjuhK7+cnzs7sDHd4UDYJXaiIluKQbrUkBaSUw6Z3rqw3
	 xTxrLsL4XtCc0KKKNwnKIgNXDd0NJbNm8+2IWhaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AF35F8045D;
	Tue, 29 Oct 2019 11:37:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC2B7F80392; Tue, 29 Oct 2019 11:37:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2591F80269
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 11:37:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2591F80269
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 03:37:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="205432594"
Received: from apboie-mobl2.amr.corp.intel.com (HELO [10.252.8.198])
 ([10.252.8.198])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2019 03:37:05 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
 <20191025224122.7718-17-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <b9dde267-1bf0-e371-0cfc-997400377f61@intel.com>
Date: Tue, 29 Oct 2019 11:37:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025224122.7718-17-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Keyon Jie <yang.jie@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 16/26] ASoC: SOF: configure D0ix IPC flags
 in set_power_state
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

On 2019-10-26 00:41, Pierre-Louis Bossart wrote:
> +static int hda_dsp_send_pm_gate_ipc(struct snd_sof_dev *sdev, u32 flags)
> +{
> +	struct sof_ipc_pm_gate pm_gate;
> +	struct sof_ipc_reply reply;
> +
> +	memset(&pm_gate, 0, sizeof(pm_gate));
> +
> +	/* configure pm_gate ipc message */
> +	pm_gate.hdr.size = sizeof(pm_gate);
> +	pm_gate.hdr.cmd = SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_GATE;
> +	pm_gate.flags = flags;
> +
> +	/* send pm_gate ipc to dsp */

Is this comment necessary?

> +	return sof_ipc_tx_message(sdev->ipc, pm_gate.hdr.cmd, &pm_gate,
> +				  sizeof(pm_gate), &reply, sizeof(reply));
> +}
> +
>   int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
>   			    enum sof_d0_substate d0_substate)
>   {
>   	struct hdac_bus *bus = sof_to_bus(sdev);
> +	u32 flags;
>   	int ret;
>   	u8 value;
>   
> @@ -347,7 +366,18 @@ int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
>   	dev_vdbg(bus->dev, "D0I3C updated, register = 0x%x\n",
>   		 snd_hdac_chip_readb(bus, VS_D0I3C));
>   
> -	return 0;
> +	if (d0_substate == SOF_DSP_D0I0)
> +		flags = HDA_PM_PPG;/* prevent power gating in D0 */
> +	else
> +		flags = HDA_PM_NO_DMA_TRACE;/* disable DMA trace in D0I3*/

Missing spaces between code and comments.
Could you explain what DMA trace has to do with your flow?

> +
> +	/* sending pm_gate IPC */
> +	ret = hda_dsp_send_pm_gate_ipc(sdev, flags);
> +	if (ret < 0)
> +		dev_err(sdev->dev,
> +			"error: PM_GATE ipc error %d\n", ret);
> +

Being so detailed within each ipc handler does not increase code 
readability. Having single "pipe" which all ipcs go through with common 
dev_err dumping fw error/ status and ipc's header is the better option 
IMHO. These are so many IPC handlers. Assume you change "error msg 
format". With current approach each and every handler with have to be 
updated.


> +	return ret;
>   }
>   
>   static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
