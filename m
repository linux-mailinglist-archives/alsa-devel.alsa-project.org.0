Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6103A7634D9
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 13:26:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 970347F4;
	Wed, 26 Jul 2023 13:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 970347F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690370804;
	bh=mnQJuBYjxws9dKF7YJmo1pX1cJQyyI8SIC/3VVKu3MI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tanYV3vcMELXIZRHlorAd3dB1b66YbZTh6TOR5drPR8w5hH1BPpaXYrG4GHmWbgWm
	 4e5vQ4VPCEeQVhElglKjnik21/Eh0UxQRYgpC/yXksDFT7vH9hntnMHWSggVXmiTeY
	 SZn+XcjjQAn0uOuWffy3nNhaZwypPxYLkMIE5qUA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8F5CF800C7; Wed, 26 Jul 2023 13:25:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 793CEF80153;
	Wed, 26 Jul 2023 13:25:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0730AF8019B; Wed, 26 Jul 2023 13:25:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08C4BF800C7
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 13:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08C4BF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lmuMs8Cj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690370744; x=1721906744;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=mnQJuBYjxws9dKF7YJmo1pX1cJQyyI8SIC/3VVKu3MI=;
  b=lmuMs8CjWM/feZvQmboUdNOGKzhOAQHh14buIUVXqoxfDBzMCciXonee
   VtWmYES6G8S76IuBNfW0XUDACijs6JmOziTlJl8W3VOBO6+ou4K5Zl5vM
   5hocw8SldotM4sieg0hJISd2MQKiuhxB2jOz/eF467d3T7UFvZspx0bpo
   xK4j/wt80h+wyK60WmKuT0mwUGdwJV7iX/5PQAVx21ULE/pF1TrlbVfSR
   UWNpjEwNU0ps+L/IUzknAhqwi0y/Z9h0qLPZxeW0Gx7LDOFhI6Vqg5070
   YnI2gUMtnbVk9gAHJs4rRpn6SW1PkYGAB1iPUw9x/MxjITJiUlPqdNreZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="454362782"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200";
   d="scan'208";a="454362782"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 04:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="840221570"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200";
   d="scan'208";a="840221570"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.92.2.114])
 ([10.92.2.114])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 04:25:34 -0700
Message-ID: <00321a54-2c13-2a93-a6ab-7a76f1a87a3d@linux.intel.com>
Date: Wed, 26 Jul 2023 19:25:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] ASoC: Intel: maxim-common: get codec number from ACPI
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Yong Zhi <yong.zhi@intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Uday M Bhat <uday.m.bhat@intel.com>, Terry Cheong <htcheong@chromium.org>,
 Mac Chiang <mac.chiang@intel.com>,
 "Dharageswari . R" <dharageswari.r@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20230720092628.758834-1-brent.lu@intel.com>
 <20230720092628.758834-2-brent.lu@intel.com>
 <ff55e63f-1c17-12ef-57e6-144a5bea4480@linux.intel.com>
In-Reply-To: <ff55e63f-1c17-12ef-57e6-144a5bea4480@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N5NBJJ6COLCFEMUMMMBRUDEE2GBGUS4X
X-Message-ID-Hash: N5NBJJ6COLCFEMUMMMBRUDEE2GBGUS4X
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N5NBJJ6COLCFEMUMMMBRUDEE2GBGUS4X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 7/26/2023 4:47 PM, Liao, Bard wrote:
> ;
>>   -    /* add regular speakers dapm route */
>> -    ret = snd_soc_dapm_add_routes(&card->dapm, max_98390_dapm_routes,
>> -                      ARRAY_SIZE(max_98390_dapm_routes));
>
> Don't we need to add max_98390_dapm_routes for the 4 speakers case?
>
Please ignore this comment. I didn't notice that it is a fallthrough not

break in the end of case 4.


