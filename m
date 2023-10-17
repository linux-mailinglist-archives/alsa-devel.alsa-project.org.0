Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 049027CD0BD
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 01:27:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 799A784B;
	Wed, 18 Oct 2023 01:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 799A784B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697585261;
	bh=xwQ0iV/rBOQYg8kGL3cqHi/fxn3tom61XgY6fDIexWM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nc5887+JVKJLpUSfo1jSi4YnCHpD3WcxipiuQFwpLAjFLWljyT/hZKg2hcm8sL9w7
	 LrMacW5yPpPSrAqi5eISFQmbypKzkDvyStQNqfLCEyc1E1DfAO4PKxrbSUybzIB6U0
	 yfRAEMiLWR5pT1dMmOEm3MCIrlXtFthSDU97MTD8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A526F80608; Wed, 18 Oct 2023 01:23:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8264F80602;
	Wed, 18 Oct 2023 01:23:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8C65F805BD; Wed, 18 Oct 2023 01:23:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21E40F80564
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 01:23:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21E40F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dO2REhrk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697585014; x=1729121014;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xwQ0iV/rBOQYg8kGL3cqHi/fxn3tom61XgY6fDIexWM=;
  b=dO2REhrkRRPtHLkYLwgjXrC0kCuSbrHBccplzihbN+cqPVPSiMHbTOqX
   c1d8Y8k3mPx44x9yNXy76D+BqgE1FCpnv6M/nSqZW36FvJ0isT4DTgbuH
   WbwiTVkjj+Ie5pfCtcPAtEswUZ9a+NWoVGdqBYEMdg9P2o8G8guUICLiI
   6u6Nrjd5cbBWdv5o2Zqx7vMrU7v9femr8pxcVQXCoOWAH3u9LQWfXnbO9
   lNtljY36tGELpsOgDts+8s/VelT+smknkSbHsTqUPdUtxsYjtAYm95Oy1
   2O7RyGIQTG1VHrRIjXwACVoY0YA8H8akBxtAz3DIRyhHjNixIbbu2jsP+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384778251"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="384778251"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826637527"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="826637527"
Received: from asprado-mobl2.amr.corp.intel.com (HELO [10.212.55.179])
 ([10.212.55.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:31 -0700
Message-ID: <b503058d-e23f-4a63-99b8-f0a62b2a2557@linux.intel.com>
Date: Tue, 17 Oct 2023 18:11:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 34/34] ASoC: usb: Rediscover USB SND devices on USB
 port add
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
 <20231017200109.11407-35-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231017200109.11407-35-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZWS5WUA6JJCRPVHGNQXQOZTKYQRWF6YW
X-Message-ID-Hash: ZWS5WUA6JJCRPVHGNQXQOZTKYQRWF6YW
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZWS5WUA6JJCRPVHGNQXQOZTKYQRWF6YW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/17/23 15:01, Wesley Cheng wrote:
> In case the USB backend device has not been initialized/probed, USB SND
> device connections can still occur.  When the USB backend is eventually
> made available, previous USB SND device connections are not communicated to
> the USB backend.  Call snd_usb_rediscover_devices() to generate the connect
> callbacks for all USB SND devices connected.  This will allow for the USB
> backend to be updated with the current set of devices available.
> 
> The chip array entries are all populated and removed while under the
> register_mutex, so going over potential race conditions:
> 
> Thread#1:
>   q6usb_component_probe()
>     --> snd_soc_usb_add_port()
>       --> snd_usb_rediscover_devices()
>         --> mutex_lock(register_mutex)
> 
> Thread#2
>   --> usb_audio_disconnect()
>     --> mutex_lock(register_mutex)
> 
> So either thread#1 or thread#2 will complete first.  If
> 
> Thread#1 completes before thread#2:
>   SOC USB will notify DPCM backend of the device connection.  Shortly
>   after, once thread#2 runs, we will get a disconnect event for the
>   connected device.
> 
> Thread#2 completes before thread#1:
>   Then during snd_usb_rediscover_devices() it won't notify of any
>   connection for that particular chip index.
Looks like you are assuming the regular USB audio stuff is probed first?

What if it's not the case? Have you tested with a manual 'blacklist' and
"modprobe" sequence long after all the DSP stuff is initialized?

It really reminds me of audio+display issues, and the same opens apply IMHO.
