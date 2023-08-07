Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D7077286E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 16:59:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48952850;
	Mon,  7 Aug 2023 16:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48952850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691420341;
	bh=Bv5qmy2opAFHK/vm1WhEMyCMP/qaOlo+EM1ix8neNAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KhsZ/jguFHrr94aG2lTOsKqtOgb0L66OggKpA6yMjFq2s9RJnCRLFJ0VF+MxlYt2p
	 i88W6LEq/3yQvcJtOpHdAVkw50mnJYCFapm4VN/VwZ4GspxLBCtRCuDt0X2/a6sQQf
	 cMFiuXF/rHQRcKXwE/JG3nN3LxN6KEhz/RhCCzpg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA7C4F8059F; Mon,  7 Aug 2023 16:56:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8134FF80588;
	Mon,  7 Aug 2023 16:56:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16F4DF80568; Mon,  7 Aug 2023 16:56:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1563F80534;
	Mon,  7 Aug 2023 16:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1563F80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LQdnaFE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691420211; x=1722956211;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Bv5qmy2opAFHK/vm1WhEMyCMP/qaOlo+EM1ix8neNAY=;
  b=LQdnaFE1GoGkbeaBnErFw4nWvUigms/kHwYiKNY5sJYCtC0H6+NF5RWl
   R3/NtpduEhMzRZFFlatr/OdrGY3gBFAl5de+3jVoN/O76Mec5EWs11mSD
   RgSo3MU8LBScFkDGaRLXZIg6K/+P/q81h5gZatlNcbazT8C42g1f6Uz+h
   NUgi+fc8Ddw6WI8YXP1M7pRehZsv5nZKwyaqDe1L1NU3kY55+xkoRx132
   rVoRwsKGbl0I5lv/1gUmIyzmrQRchMD4+OUfl9FG2H5nkKIluqHVWpz+y
   9EKAo0ibbx4bbVNrruVxcsFNdPfg7rgX5ck2J1M2xh8HiIRWCEM3nC2W4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="434410634"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200";
   d="scan'208";a="434410634"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 07:56:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1061623888"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200";
   d="scan'208";a="1061623888"
Received: from hweelee-mobl.amr.corp.intel.com (HELO [10.209.181.215])
 ([10.209.181.215])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 07:56:42 -0700
Message-ID: <4acc7318-69b3-3eb5-1fe8-f7deea8adfad@linux.intel.com>
Date: Mon, 7 Aug 2023 09:26:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v3 8/9] ASoC: SOF: Intel: Move binding to display driver
 outside of deferred probe
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: Maarten Lankhorst <dev@lankhorst.se>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
References: <20230807090045.198993-1-maarten.lankhorst@linux.intel.com>
 <20230807090045.198993-9-maarten.lankhorst@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230807090045.198993-9-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: A47E344M3JBVG5L7WHFSZ2DQT3AYVSYL
X-Message-ID-Hash: A47E344M3JBVG5L7WHFSZ2DQT3AYVSYL
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/7/23 04:00, Maarten Lankhorst wrote:
> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> the snd_hdac_i915_init into a workqueue.
> 
> Use the -EPROBE_DEFER mechanism instead, which must be returned in the
> probe function.

I don't think this patch is aligned with the previous discussions. What
we agreed on is that snd_hdac_i915_init() would be called from and not
from the workqueue.

But this patch also moves all codec initialization out of the workqueue.

I think we need two callbacks for device-specific initilization, one
that is called from the probe function and one from the workqueue,
otherwise we'll have a structure that differs from the snd-hda-intel -
which would be rather silly in terms of support/debug.

I realize there's quite a bit of surgery involved, and most likely the
SOF folks should provide this patch for you to build on.

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  sound/soc/sof/core.c            | 19 +++++++------------
>  sound/soc/sof/intel/hda-codec.c |  2 +-
>  2 files changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
> index 30db685cc5f4..cd4d06d1800b 100644
> --- a/sound/soc/sof/core.c
> +++ b/sound/soc/sof/core.c
> @@ -188,13 +188,6 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
>  	struct snd_sof_pdata *plat_data = sdev->pdata;
>  	int ret;
>  
> -	/* probe the DSP hardware */
> -	ret = snd_sof_probe(sdev);
> -	if (ret < 0) {
> -		dev_err(sdev->dev, "error: failed to probe DSP %d\n", ret);
> -		goto probe_err;
> -	}
> -
>  	sof_set_fw_state(sdev, SOF_FW_BOOT_PREPARE);
>  
>  	/* check machine info */
> @@ -325,10 +318,6 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
>  dbg_err:
>  	snd_sof_free_debug(sdev);
>  dsp_err:
> -	snd_sof_remove(sdev);
> -probe_err:
> -	sof_ops_free(sdev);
> -
>  	/* all resources freed, update state to match */
>  	sof_set_fw_state(sdev, SOF_FW_BOOT_NOT_STARTED);
>  	sdev->first_boot = true;
> @@ -436,6 +425,12 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
>  
>  	sof_set_fw_state(sdev, SOF_FW_BOOT_NOT_STARTED);
>  
> +	ret = snd_sof_probe(sdev);
> +	if (ret) {
> +		dev_err_probe(sdev->dev, ret, "failed to probe DSP\n");
> +		return ret;
> +	}
> +
>  	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)) {
>  		INIT_WORK(&sdev->probe_work, sof_probe_work);
>  		schedule_work(&sdev->probe_work);
> @@ -485,9 +480,9 @@ int snd_sof_device_remove(struct device *dev)
>  
>  		snd_sof_ipc_free(sdev);
>  		snd_sof_free_debug(sdev);
> -		snd_sof_remove(sdev);
>  	}
>  
> +	snd_sof_remove(sdev);
>  	sof_ops_free(sdev);
>  
>  	/* release firmware */
> diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
> index f1fd5b44aaac..344b61576c0e 100644
> --- a/sound/soc/sof/intel/hda-codec.c
> +++ b/sound/soc/sof/intel/hda-codec.c
> @@ -415,7 +415,7 @@ int hda_codec_i915_init(struct snd_sof_dev *sdev)
>  		return 0;
>  
>  	/* i915 exposes a HDA codec for HDMI audio */
> -	ret = snd_hdac_i915_init(bus, true);
> +	ret = snd_hdac_i915_init(bus, false);
>  	if (ret < 0)
>  		return ret;
>  
