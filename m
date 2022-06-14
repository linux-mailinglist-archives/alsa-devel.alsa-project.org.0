Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE7654B522
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 17:56:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F77A18B2;
	Tue, 14 Jun 2022 17:55:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F77A18B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655222160;
	bh=PEw/I0GFA2u1JaLEch7NAXgwJOcld7cZ59IarRnGipA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ghFxVNRA+LX2GnGVj8h4hjjEIRwqcg9vQk0T7CdXd2wpw0yRyOb8NEL37kMOU5BJd
	 +Fw2UDln8c2C3u69v16eZAfK+16giaUA+njJo4SLOLLqVM+q30kQ40wrPgeihQuOgq
	 Z32hvVwDfeqdtSxl3V07IWo30s7iuGlHz0QFr9y0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CB28F80165;
	Tue, 14 Jun 2022 17:55:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 439EAF80139; Tue, 14 Jun 2022 17:54:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98B53F800E1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 17:54:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98B53F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="emfKwq0Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655222092; x=1686758092;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PEw/I0GFA2u1JaLEch7NAXgwJOcld7cZ59IarRnGipA=;
 b=emfKwq0QulWiUKGaGyu62+IHT+Q8HVJyeQiOFRw4s0nfpEOLzYbAucdG
 xjIe40xtlzRKXONQGeL5mRXIP43LuQ85X2XXUEuc6VrVlQmR0x3Tw6uaL
 LZYPOrx3ZgZVRPSD0SFBq6h68xYhtd1NZUkO5Hne1Oug3XKHEacgOYNki
 2JrL5TWNHs1uu/ceihZjoFMdKWnh8m2oelGMtdv7wuqoJtjQL6osyTV4h
 4NjQwSGYfH1l+ZSyGQUynd19M8LfJyXBJ7eHex4LkpVBdnwV56zo0psOd
 fBuMhgt3gb7ozDCo3huoAmi5FSOQkHSOkH8+J0q0jiOMAfoQFeM4R1UVx g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="276203099"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="276203099"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 08:54:46 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="652115675"
Received: from mburny-mobl1.amr.corp.intel.com (HELO [10.213.163.91])
 ([10.213.163.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 08:54:45 -0700
Message-ID: <5928a225-f355-47d7-c502-d95319ce447f@linux.intel.com>
Date: Tue, 14 Jun 2022 10:54:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] ASoC: SOF: Intel: add trigger callback into
 sdw_callback
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20220614070817.2508-1-yung-chuan.liao@linux.intel.com>
 <20220614070817.2508-3-yung-chuan.liao@linux.intel.com>
 <Yqg01aSixhBq9d4+@kroah.com>
 <3fd14acb-1de9-3fd8-81ab-27fee4a42b84@linux.intel.com>
 <Yqil3UDSmoXN3E9M@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Yqil3UDSmoXN3E9M@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org, tiwai@suse.de,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com
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




>>>> @@ -809,6 +814,10 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
>>>>  		if (!hda_use_tplg_nhlt)
>>>>  			ipc4_data->nhlt = intel_nhlt_init(sdev->dev);
>>>>  
>>>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
>>>> +		sdw_callback.trigger = ipc4_be_dai_common_trigger;
>>>> +#endif
>>>
>>> #if should not be in .c files if at all possible.  Surely there's a
>>> better way here...
>>
>> we could use
>>
>> if (IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE))
>>     sdw_callback.trigger = ipc4_be_dai_common_trigger;
>>
>> would that work?
> 
> It's more readable, right?  Also easier to maintain over time.

yes, it's more readable, and that's no problem to update.

There's another #if IS_ENABLED( that we can replace by a if (IS_ENABLED
in the same routine, that would make this routine less of an eyesore. I
am not sure why we added all these #if, we can cleanup.

 	case SOF_INTEL_IPC4:
	{
		struct sof_ipc4_fw_data *ipc4_data = sdev->private;

		for (i = 0; i < ops->num_drv; i++) {
			if (strstr(ops->drv[i].name, "DMIC")) {
				ops->drv[i].ops = &ipc4_dmic_dai_ops;
				continue;
			}
			if (strstr(ops->drv[i].name, "SSP")) {
				ops->drv[i].ops = &ipc4_ssp_dai_ops;
				continue;
			}
#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
			if (strstr(ops->drv[i].name, "iDisp") ||
			    strstr(ops->drv[i].name, "Analog") ||
			    strstr(ops->drv[i].name, "Digital"))
				ops->drv[i].ops = &ipc4_hda_dai_ops;
#endif
		}

		if (!hda_use_tplg_nhlt)
			ipc4_data->nhlt = intel_nhlt_init(sdev->dev);

#if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
		sdw_callback.trigger = ipc4_be_dai_common_trigger;
#endif

		break;
	}
	default:
		break;
	}
}
>> We try to keep this driver configurable, not all platforms require
>> SoundWire or HDaudio, and that 'sdw_callback' ops structure is
>> conditionally declared.
> 
> Perhaps don't conditionally declare that?  How much does it really save
> to do that?

It would force us to expose additional things that are only relevant for
SoundWire, see the large block of code in hda.c

https://elixir.bootlin.com/linux/latest/source/sound/soc/sof/intel/hda.c#L108

We've been burned in the past by having too many things in a single
configuration, so we try to allow for minimal builds that don't depend
on other modules in sound/soc/codecs/, sound/pci/hda and
drivers/soundwire - it also forces us to get the Kconfig dependencies right.

if (IS_ENABLED()) is less invasive in that case.

Thanks for your feedback
-Pierre
