Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D81526F5C4A
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 18:59:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B65A512F8;
	Wed,  3 May 2023 18:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B65A512F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683133148;
	bh=kO7/faBRypIieapfr1cyUkdtWOsYKOnH/qpu0PsViTY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gyvTt+OPaHY5va7IvXo5/lkudoMduDY+eYJlt9KGitgVtvCjtMeW467qMXymih3nA
	 rEORI2INOa5ETj60E2tlI2OmGWotfhurLrKioJYBu79J2VQ6nOCEYvU1GjYymfxcQf
	 pjkfipOLAmK1OMX7Zy20NmwBJPSJ1AOPlMWJrr+E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21C9EF8032B;
	Wed,  3 May 2023 18:58:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0726CF8049E; Wed,  3 May 2023 18:58:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E27ECF80137
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 18:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E27ECF80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FmrNeRk2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683133089; x=1714669089;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kO7/faBRypIieapfr1cyUkdtWOsYKOnH/qpu0PsViTY=;
  b=FmrNeRk2STgP8HFK5hqC34pCGQe/+Tg7GgAzGtFU1cBlBQZ1ackNc+Cv
   sdBRnDDpW9z3kNeefYCYK3IvM++AA/3UmldjLb+MXXAQAQXY+0wu2UDV5
   Opv5SFlYKJuhKaltulyh/RO1q9QX86fI9QXNk4xwFIXjssArdm6TKlVmJ
   tKfAZy4IQ7gdXCoIuN/8TE/aY4mNkdTfnj9BKNozCc+S+d8b31/NwHukI
   8gWC5V9G/C7zzKJJeMBm/EXA7pMElxjZGArGsk3piaiwnIyTwmYQq3ter
   FxPvG/WxChruBATPXTKlhrkB7wY7Xvas4vQeHN8fLqzAO0Ihj3QFOv6wJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="435015872"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200";
   d="scan'208";a="435015872"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 09:58:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="766202179"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200";
   d="scan'208";a="766202179"
Received: from jshields-mobl.amr.corp.intel.com (HELO [10.209.77.83])
 ([10.209.77.83])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 09:58:04 -0700
Message-ID: <d98a8aa1-9e15-7cb4-3bbb-4d4cd437d636@linux.intel.com>
Date: Wed, 3 May 2023 10:30:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH v2] ASoC: codecs: wcd938x: fix accessing regmap on
 unattached devices
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230503144102.242240-1-krzysztof.kozlowski@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230503144102.242240-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: O7UFH2L4LSZ4CC623UUSDJIKAZVCEZO7
X-Message-ID-Hash: O7UFH2L4LSZ4CC623UUSDJIKAZVCEZO7
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: stable@vger.kernel.org, Patrick Lai <quic_plai@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O7UFH2L4LSZ4CC623UUSDJIKAZVCEZO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/3/23 09:41, Krzysztof Kozlowski wrote:
> The WCD938x comes with three devices on two Linux drivers:
> 1. RX Soundwire device (wcd938x-sdw.c driver),
> 2. TX Soundwire device, which is used to access devices via regmap (also
>    wcd938x-sdw.c driver),
> 3. platform device (wcd938x.c driver) - glue and component master,
>    actually having most of the code using TX Soundwire device regmap.
> 
> When RX and TX Soundwire devices probe, the component master (platform
> device) bind tries to write micbias configuration via TX Soundwire
> regmap.  This might happen before TX Soundwire enumerates, so the regmap
> access fails.  On Qualcomm SM8550 board with WCD9385:
> 
>   qcom-soundwire 6d30000.soundwire-controller: Qualcomm Soundwire controller v2.0.0 Registered
>   wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:4 (ops wcd938x_sdw_component_ops)
>   wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:3 (ops wcd938x_sdw_component_ops)
>   qcom-soundwire 6ad0000.soundwire-controller: swrm_wait_for_wr_fifo_avail err write overflow
> 
> Fix the issue by:
> 1. Moving the regmap creation from platform device to TX Soundwire
>    device.  The regmap settings are moved as-is with one difference:
>    making the wcd938x_regmap_config const.
> 2. Using regmap in cache only mode till the actual TX Soundwire device
>    enumerates and then sync the regmap cache.
> 
> Cc: <stable@vger.kernel.org> # v3.14+
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Patrick Lai <quic_plai@quicinc.com>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Changes since v1:
> 1. Previous solution touched Soundwire. Rework it according to feedback.
>    https://lore.kernel.org/all/20230420101617.142225-7-krzysztof.kozlowski@linaro.org/
> 
> Thank you Mark and Pierre-Louis for great hints and valuable feedback!

LGTM, this was a very interesting thread to comment on.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
