Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B67F510C0D
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 00:26:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCA3A1852;
	Wed, 27 Apr 2022 00:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCA3A1852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651011992;
	bh=TKY9X7lbadFhOIRyrV6C418dGVeuSUE9wG7Li4lnF/c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sm3q73GNqjzA1jqqS26nlU/cN7/kG04eRewh+4gyGlDib7Rufuyik1SmiY9WcWQgJ
	 dN52J2ArlJ9wmUr0/Xv3uKnnSiCB4Uus4HBIgD67VmcuMsvHpkOo3NqKMg57kgk3eR
	 lodPhQgO8RZVt8WqHsBxbLuXiT8wEli+Ygl3G+3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09B37F8053A;
	Wed, 27 Apr 2022 00:23:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E0BFF80533; Wed, 27 Apr 2022 00:23:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7048F8027D
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 00:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7048F8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lpSKz5ol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651011804; x=1682547804;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TKY9X7lbadFhOIRyrV6C418dGVeuSUE9wG7Li4lnF/c=;
 b=lpSKz5olXk+Ms+vbE9Ys9bpShW/W2y5Wu+uMWPUkzXzzNHJAHiQqDAet
 b/7gyyliCjQtqAmV6xhSVFzANWglnVISqHR3Y7hTy65CjRCfS37r9b6CB
 rpee9WnwYK2BCdvilo1GJXSfIBBzAoUpoD3IoXlVAiPYJvaz4ChbBmQ4z
 2ppV1Amr1kFBbALCXVLXGCVbvibrufxdXlkJt+/xLc1q7LeL3dw3QpXp/
 bG03Yf4Y/FaUbG9UNBLJDEvX5Pkn4MJVWuWMTXFoHTMJywLeSJyfzl6i6
 qaIxLmqxZCx18V/3dAKHpaPpexerkaM667HBRjqrIBxVfb6ClN3U+ppvQ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="245660735"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="245660735"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 15:23:21 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="532888636"
Received: from gkanakas-mobl.amr.corp.intel.com (HELO [10.212.152.229])
 ([10.212.152.229])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 15:23:20 -0700
Message-ID: <da55736f-61a8-dbbc-7253-7e3da70931d1@linux.intel.com>
Date: Tue, 26 Apr 2022 17:18:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 12/14] ASoC: Intel: avs: Power management
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-13-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220426172346.3508411-13-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
> To preserve power during sleep operations, handle suspend (S3),
> hibernation (S4) and runtime (RTD3) transitions. As flow for all of
> is shared, define common handlers to reduce code size.
> 
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/avs/core.c | 125 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 125 insertions(+)
> 
> diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
> index 93180c22032d..c2f8fb87cfc2 100644
> --- a/sound/soc/intel/avs/core.c
> +++ b/sound/soc/intel/avs/core.c
> @@ -536,6 +536,128 @@ static void avs_pci_remove(struct pci_dev *pci)
>  	pm_runtime_get_noresume(&pci->dev);
>  }
>  
> +static int __maybe_unused avs_suspend_common(struct avs_dev *adev, bool low_power)

low_power is not used so....

> +{
> +	struct hdac_bus *bus = &adev->base.core;
> +	int ret;
> +
> +	flush_work(&adev->probe_work);
> +
> +	snd_hdac_ext_bus_link_power_down_all(bus);
> +
> +	ret = avs_ipc_set_dx(adev, AVS_MAIN_CORE_MASK, false);
> +	/*
> +	 * pm_runtime is blocked on DSP failure but system-wide suspend is not.
> +	 * Do not block entire system from suspending if that's the case.
> +	 */
> +	if (ret && ret != -EPERM) {
> +		dev_err(adev->dev, "set dx failed: %d\n", ret);
> +		return AVS_IPC_RET(ret);
> +	}
> +
> +	avs_dsp_op(adev, int_control, false);
> +	snd_hdac_ext_bus_ppcap_int_enable(bus, false);
> +
> +	ret = avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
> +	if (ret < 0) {
> +		dev_err(adev->dev, "core_mask %ld disable failed: %d\n", AVS_MAIN_CORE_MASK, ret);
> +		return ret;
> +	}
> +
> +	snd_hdac_ext_bus_ppcap_enable(bus, false);
> +	/* disable LP SRAM retention */
> +	avs_hda_power_gating_enable(adev, false);
> +	snd_hdac_bus_stop_chip(bus);
> +	/* disable CG when putting controller to reset */
> +	avs_hdac_clock_gating_enable(bus, false);
> +	snd_hdac_bus_enter_link_reset(bus);
> +	avs_hdac_clock_gating_enable(bus, true);
> +
> +	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, false);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused avs_resume_common(struct avs_dev *adev, bool low_power, bool purge)
> +{
> +	struct hdac_bus *bus = &adev->base.core;
> +	struct hdac_ext_link *hlink;
> +	int ret;
> +
> +	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, true);
> +	avs_hdac_bus_init_chip(bus, true);
> +
> +	snd_hdac_ext_bus_ppcap_enable(bus, true);
> +	snd_hdac_ext_bus_ppcap_int_enable(bus, true);
> +
> +	ret = avs_dsp_boot_firmware(adev, purge);
> +	if (ret < 0) {
> +		dev_err(adev->dev, "firmware boot failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* turn off the links that were off before suspend */
> +	list_for_each_entry(hlink, &bus->hlink_list, list) {
> +		if (!hlink->ref_count)
> +			snd_hdac_ext_bus_link_power_down(hlink);
> +	}
> +
> +	/* check dma status and clean up CORB/RIRB buffers */
> +	if (!bus->cmd_dma_state)
> +		snd_hdac_bus_stop_cmd_io(bus);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused avs_suspend(struct device *dev)
> +{
> +	return avs_suspend_common(to_avs_dev(dev), true);
> +}
> +
> +static int __maybe_unused avs_resume(struct device *dev)
> +{
> +	return avs_resume_common(to_avs_dev(dev), true, true);
> +}
> +
> +static int __maybe_unused avs_runtime_suspend(struct device *dev)
> +{
> +	return avs_suspend_common(to_avs_dev(dev), true);
> +}
> +
> +static int __maybe_unused avs_runtime_resume(struct device *dev)
> +{
> +	return avs_resume_common(to_avs_dev(dev), true, false);
> +}
> +
> +static int __maybe_unused avs_freeze(struct device *dev)
> +{
> +	return avs_suspend_common(to_avs_dev(dev), false);
> +}
> +static int __maybe_unused avs_thaw(struct device *dev)
> +{
> +	return avs_resume_common(to_avs_dev(dev), false, true);
> +}
> +
> +static int __maybe_unused avs_poweroff(struct device *dev)
> +{
> +	return avs_suspend_common(to_avs_dev(dev), false);
> +}
> +
> +static int __maybe_unused avs_restore(struct device *dev)
> +{
> +	return avs_resume_common(to_avs_dev(dev), false, true);
> +}
> +
> +static const struct dev_pm_ops avs_dev_pm = {
> +	.suspend = avs_suspend,
> +	.resume = avs_resume,

... all the 4 functions below seem unnecessary?

> +	.freeze = avs_freeze,
> +	.thaw = avs_thaw,
> +	.poweroff = avs_poweroff,
> +	.restore = avs_restore,

we've historically never used those, what drives this new usage?

on the SOF side, we've used prepare and complete, along with idle...


> +	SET_RUNTIME_PM_OPS(avs_runtime_suspend, avs_runtime_resume, NULL)
> +};
> +
>  static const struct pci_device_id avs_ids[] = {
>  	{ 0 }
>  };
> @@ -546,6 +668,9 @@ static struct pci_driver avs_pci_driver = {
>  	.id_table = avs_ids,
>  	.probe = avs_pci_probe,
>  	.remove = avs_pci_remove,
> +	.driver = {
> +		.pm = &avs_dev_pm,
> +	},
>  };
>  module_pci_driver(avs_pci_driver);
>  
