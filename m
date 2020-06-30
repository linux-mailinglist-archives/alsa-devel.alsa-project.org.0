Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C1F20FA91
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 19:29:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDDBC15E2;
	Tue, 30 Jun 2020 19:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDDBC15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593538176;
	bh=oIxXgy/Es1a+Hq3NtQCtYiF/SgZTnbTm/U9c2lMxKtw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MvHgeriQbmhMggDytZyGYHM+0JzO8NgQlWybueMdNFOBCGYgheWTjrjIj7F0jtKXH
	 Km92lQ5QH7dIwcNYrblBp4bRFWY128bcJJMKjdnaP10lqiAIKR3YP+1ba0OTXMaXi7
	 aTnZUkJ3S0gkl4kgAJsVB/gGTTbOE982YW8MtqPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EA18F80253;
	Tue, 30 Jun 2020 19:27:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DE14F80247; Tue, 30 Jun 2020 19:27:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39811F80135
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 19:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39811F80135
IronPort-SDR: Ym/xZFEiUWIPrvnNIHD3JHeBIHk0ZzdIk1ZVLf8mpbg0IRvHe3PJ2+DqLyuj1la/vdu0fN2SAe
 +JezQkHIkylA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="231190513"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="231190513"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 10:26:56 -0700
IronPort-SDR: 5wf0i0PMojENL5HhlZkscnuDRzLVNrKMmryjUbywGuvdnAkjBKzT5bT/rXOCEZns6IxKfgvHhh
 z96zAKfI9WjA==
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="281307454"
Received: from dnoeunx-mobl.amr.corp.intel.com (HELO [10.254.77.113])
 ([10.254.77.113])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 10:26:54 -0700
Subject: Re: [PATCH 7/9] soundwire: intel/cadence: merge Soundwire interrupt
 handlers/threads
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20200623173546.21870-1-yung-chuan.liao@linux.intel.com>
 <20200623173546.21870-8-yung-chuan.liao@linux.intel.com>
 <20200630162448.GS2599@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <55fbc41e-cb41-8bdf-bdbd-1d1b76938683@linux.intel.com>
Date: Tue, 30 Jun 2020 11:46:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200630162448.GS2599@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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



>> +irqreturn_t sdw_intel_thread(int irq, void *dev_id)
>> +{
>> +	struct sdw_intel_ctx *ctx = dev_id;
>> +	struct sdw_intel_link_res *link;
>> +
>> +	list_for_each_entry(link, &ctx->link_list, list)
>> +		sdw_cdns_irq(irq, link->cdns);
>> +
>> +	sdw_intel_enable_irq(ctx->mmio_base, true);
>> +	return IRQ_HANDLED;
>> +}
>> +EXPORT_SYMBOL(sdw_intel_thread);
> 
> Who will call this API? Also don't see header for this..

the header was merged 6 months ago:

6cd1d670bee6 soundwire: intel: update headers for interrupts

This function is called by the SOF driver:

static irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
{
	return sdw_intel_thread(irq, context);
}

the SOF driver implements a fallback when CONFIG_SOUNDWIRE is not defined.

static inline irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
{
	return IRQ_HANDLED;
}

> Is this called from irq context or irq thread or something else?

from IRQ thread, hence the name, see pointers above.

The key part is that we could only make the hardware work as intended by 
using a single thread for all interrupt sources, and that patch is just 
the generalization of what was implemented for HDaudio in mid-2019 after 
months of lost interrupts and IPC errors. See below the code from 
sound/soc/sof/intel/hda.c for interrupt handling.

static irqreturn_t hda_dsp_interrupt_handler(int irq, void *context)
{
	struct snd_sof_dev *sdev = context;

	/*
	 * Get global interrupt status. It includes all hardware interrupt
	 * sources in the Intel HD Audio controller.
	 */
	if (snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTSTS) &
	    SOF_HDA_INTSTS_GIS) {

		/* disable GIE interrupt */
		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
					SOF_HDA_INTCTL,
					SOF_HDA_INT_GLOBAL_EN,
					0);

		return IRQ_WAKE_THREAD;
	}

	return IRQ_NONE;
}

static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
{
	struct snd_sof_dev *sdev = context;
	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;

	/* deal with streams and controller first */
	if (hda_dsp_check_stream_irq(sdev))
		hda_dsp_stream_threaded_handler(irq, sdev);

	if (hda_dsp_check_ipc_irq(sdev))
		sof_ops(sdev)->irq_thread(irq, sdev);

	if (hda_dsp_check_sdw_irq(sdev))
		hda_dsp_sdw_thread(irq, hdev->sdw);

	if (hda_sdw_check_wakeen_irq(sdev))
		hda_sdw_process_wakeen(sdev);

	/* enable GIE interrupt */
	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
				SOF_HDA_INTCTL,
				SOF_HDA_INT_GLOBAL_EN,
				SOF_HDA_INT_GLOBAL_EN);

	return IRQ_HANDLED;
}



> Also no EXPORT_SYMBOL_NS() for this one?

Good catch, it's a miss, all the exported functions should use a NS:

EXPORT_SYMBOL_NS(sdw_intel_enable_irq, SOUNDWIRE_INTEL_INIT);
EXPORT_SYMBOL(sdw_intel_thread);
EXPORT_SYMBOL_NS(sdw_intel_acpi_scan, SOUNDWIRE_INTEL_INIT);
EXPORT_SYMBOL_NS(sdw_intel_probe, SOUNDWIRE_INTEL_INIT);
EXPORT_SYMBOL_NS(sdw_intel_startup, SOUNDWIRE_INTEL_INIT);
EXPORT_SYMBOL_NS(sdw_intel_exit, SOUNDWIRE_INTEL_INIT);
EXPORT_SYMBOL_NS(sdw_intel_process_wakeen_event, SOUNDWIRE_INTEL_INIT);



