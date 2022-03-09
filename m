Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C964D3D1B
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 23:39:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FDFC17C1;
	Wed,  9 Mar 2022 23:38:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FDFC17C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646865552;
	bh=tW+Fd9L0ilfXP4PT6Vv53KSshWWjubNP0XuGtvookMg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bSRO6x9e4/1p3P7OZ6v64BpZF2NzbnQ0nBRSBTT+ur1DrOovXuTK5xP3cEmLU8/GI
	 qtChMYaQYaI4nNIdCxIRK99IVHX8J8SZRzXORpawJflUlaSSYwj7eTX8lMYVbLmgqS
	 N3d+elLEsUK2ugWK2LTEwDiAeCXhNHVPWd0bfWB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB51BF804BB;
	Wed,  9 Mar 2022 23:37:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42539F804BB; Wed,  9 Mar 2022 23:37:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B257F8012F
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 23:37:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B257F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XrcVeGjG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646865450; x=1678401450;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tW+Fd9L0ilfXP4PT6Vv53KSshWWjubNP0XuGtvookMg=;
 b=XrcVeGjGWX7CDgzpDlkgLr9nCfardjoRVLxr5PuPvRKwOAGbTipeA4wW
 VTM1IHxPMIinEKnHt+SZ681jXQsLN/5V8QN9fGX2dVJ8oM+XdVmUSJc9r
 rHp11TQLJSZvQ4r8lYeygoRb071RSYNo8loWoJkf2PGqa6o8xjmjyuobY
 Ju5AbeDi/Fxl9dtykOSuAzjIp7dQZSzVxTEh/MiLjIG0heSKK6LFD/2XR
 1DtFD1TYzbXpr10NlKpdB+nCxjoa8rvLvCBQjFjQXd7HhdztlbiEyYXX4
 4+ZpD3GJx8purnGogjohyzZhLTMKrbBr7IiDIQEXiVE5vI+5LYJboXuku w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="252677379"
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="252677379"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 14:37:21 -0800
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="688449469"
Received: from nhaouati-mobl2.amr.corp.intel.com (HELO [10.212.216.252])
 ([10.212.216.252])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 14:37:20 -0800
Message-ID: <d6f22a35-2587-268d-a4cb-13dd6ded5a11@linux.intel.com>
Date: Wed, 9 Mar 2022 15:58:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v4 03/17] ASoC: Intel: Introduce AVS driver
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
 <20220309204029.89040-4-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220309204029.89040-4-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
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



> diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
> new file mode 100644
> index 000000000000..5f7976a95fe2
> --- /dev/null
> +++ b/sound/soc/intel/avs/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +snd-soc-avs-objs := dsp.o
> +
> +obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o

nit-pick: snd-soc-intel-avs?

avs is not a clear mapping to Intel platforms


> +/*
> + * struct avs_dev - Intel HD-Audio driver data
> + *
> + * @dev: PCI device
> + * @dsp_ba: DSP bar address

not sure it's only limited to DSP, is it?

> + * @spec: platform-specific descriptor
> + */
> +struct avs_dev {
> +	struct hda_bus base;
> +	struct device *dev;
> +
> +	void __iomem *dsp_ba;
> +	const struct avs_spec *spec;
> +};

> +int avs_dsp_core_reset(struct avs_dev *adev, u32 core_mask, bool reset)
> +{
> +	u32 value, mask, reg;
> +	int ret;
> +
> +	mask = AVS_ADSPCS_CRST_MASK(core_mask);
> +	value = reset ? mask : 0;
> +
> +	snd_hdac_adsp_updatel(adev, AVS_ADSP_REG_ADSPCS, mask, value);
> +
> +	ret = snd_hdac_adsp_readl_poll(adev, AVS_ADSP_REG_ADSPCS,
> +				       reg, (reg & mask) == value,
> +				       AVS_ADSPCS_INTERVAL_US,
> +				       AVS_ADSPCS_TIMEOUT_US);
> +	if (ret)
> +		dev_err(adev->dev, "core_mask %d %s reset failed: %d\n",
> +			core_mask, reset ? "enter" : "exit", ret);

nit-pick: reset %s "entry" "exit"

> +
> +	return ret;
> +}
> +

