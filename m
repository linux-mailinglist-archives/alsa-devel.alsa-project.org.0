Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C27E73F637C
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 18:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F7221683;
	Tue, 24 Aug 2021 18:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F7221683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629824130;
	bh=hsGGjOGOXl4V+v37KyDExG3mFlCSSBrsldjIuUlUtC8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c2Hze9B8XCEUlX3UFtL0sjKioqbLIAsKLXIuH+oI8jlL7qJADf/HucpAfdXUBzvQG
	 wL4pN9MNAmVhkAC/3fdgNJAe2OqrwA0e7iLBogc7RWwQ1MB2OT9RHBW4kmtswJjJhJ
	 5mavmR8zTmHfDu4VgVqpGf+Zds9xkl1HS/AWYKmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 340E5F800AE;
	Tue, 24 Aug 2021 18:53:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A019F801D5; Tue, 24 Aug 2021 18:53:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51DA9F801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 18:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51DA9F801D5
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="217076298"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="217076298"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 09:53:32 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="685433427"
Received: from jlrivera-mobl1.amr.corp.intel.com (HELO [10.212.8.132])
 ([10.212.8.132])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 09:53:31 -0700
Subject: Re: [PATCH] [v2] ASoC: Intel: sof_rt5682: Add support for max98390
 speaker amp
To: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>,
 alsa-devel@alsa-project.org
References: <20210824132109.1392-1-mark_hsieh@wistron.corp-partner.google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c0e98e24-1c62-aa37-e283-c8b5f56f4f2e@linux.intel.com>
Date: Tue, 24 Aug 2021 11:22:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824132109.1392-1-mark_hsieh@wistron.corp-partner.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: lance.hou@intel.com, cezary.rojewski@intel.com, mark_hsieh@wistron.com,
 kai.vehmanen@linux.intel.com, yang.jie@linux.intel.com,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, broonie@kernel.org, brent.lu@intel.com,
 bard.liao@intel.com
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

Looks mostly good, minor comments below

On 8/24/21 8:21 AM, Mark Hsieh wrote:
> Configure adl_max98390_rt5682 to support the rt5682 headset codec and max98390 speaker
> 
> BUG=b:191811888
> TEST=emerge-brya chromeos-kernel-5_10

I don't think we need this for upstream?

> +struct snd_soc_ops max_98390_ops = {
> +	.hw_params = max_98390_hw_params,
> +};

this could be const. We didn't do it for previous codecs but that was a
miss. I'll send a patch for the max98373

> +extern struct snd_soc_ops max_98390_ops;

const

