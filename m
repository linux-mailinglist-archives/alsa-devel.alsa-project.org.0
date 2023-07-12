Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AFC74FF16
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 08:13:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D31B56C1;
	Wed, 12 Jul 2023 08:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D31B56C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689142432;
	bh=cyE8FtpA7Cf8fI7s84srw3XrfxvX7kXYQ6nxfvjdchA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ar2CcnvjVGircqJZXVAkRjlrLcnr84AeCtk+vCa6TPZ5h3OQ1vWlvS+Jh9dn4Nwip
	 /S5q1s+Od5CwFkkMFYab9CJUpXh9N/4NaODUw57LYZGB4AGhL+rJhozsoEVX3eB9VT
	 HReYHpUTU6F2okpYEhcYnQeRjmkUNjuzKvBpN2J0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D23DAF8024E; Wed, 12 Jul 2023 08:12:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69A2BF80236;
	Wed, 12 Jul 2023 08:12:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 448BEF80249; Wed, 12 Jul 2023 08:12:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CB40F80093
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 08:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CB40F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=V3+pRWiV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689142364; x=1720678364;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cyE8FtpA7Cf8fI7s84srw3XrfxvX7kXYQ6nxfvjdchA=;
  b=V3+pRWiVogJPy2Oda7EKfLpwdbzj7ZrfbkbL2LpIoCJijKQ4Dx1oQ1H4
   FK6dZ+0SlUGA7v9XnxjjmHk8DlQqCJ3PKUkdOA7v+4vJaqrhgPV3OGD7m
   1Kic6nOh//Y8xLsim1EntnVaAKIg/pfh98c2Y+noWDzGoVGv0uEmbfR9c
   bqJZwP7MfNlP9EylTarSGd0zGOpOkVjy7PkttCLT5c0l+4S8gjqkTHeGv
   LPnylr7aUqVNRpIYfq6MwCyloru0SAlwR1cFyZmEIniM9vdifj18Eu8Nt
   H14UdMf2tyJtQ9If+nvhhuaGAKWHxc3u/TPwif7E6ToGUg+lT6ijANmDW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344412593"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200";
   d="scan'208";a="344412593"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 23:12:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="715439705"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200";
   d="scan'208";a="715439705"
Received: from hoermank-mobl.ger.corp.intel.com (HELO [10.252.42.188])
 ([10.252.42.188])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 23:12:32 -0700
Message-ID: <2e9a5d5b-f637-1f9a-b500-03f9c151dc26@linux.intel.com>
Date: Wed, 12 Jul 2023 08:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH v3] ASoC: Intel: sof_rt5682: add jsl_rt5650 board config
Content-Language: en-US
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Yong Zhi <yong.zhi@intel.com>,
 Uday M Bhat <uday.m.bhat@intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Arnd Bergmann <arnd@arndb.de>, Gongjun Song <gongjun.song@intel.com>,
 Terry Cheong <htcheong@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 "Dharageswari . R" <dharageswari.r@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, linux-kernel@vger.kernel.org
References: <20230712100855.272467-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230712100855.272467-1-brent.lu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: E3DYT7WLGQ7UKWKOV5PGKI46HHCR26OH
X-Message-ID-Hash: E3DYT7WLGQ7UKWKOV5PGKI46HHCR26OH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3DYT7WLGQ7UKWKOV5PGKI46HHCR26OH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +	{
> +		.id = "10EC5650",
> +		.drv_name = "jsl_rt5650",
> +		.machine_quirk = snd_soc_acpi_codec_list,
> +		.quirk_data = &rt5650_spk,
> +		.sof_tplg_filename = "sof-jsl-rt5650-dual.tplg",

what does 'dual' mean in this context? it's not something we've used
before so a comment would be needed IMHO.

two DAIs, two codecs?
