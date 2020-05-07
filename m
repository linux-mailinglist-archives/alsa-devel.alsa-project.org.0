Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BAE1C8EAC
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 16:29:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 340D21812;
	Thu,  7 May 2020 16:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 340D21812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588861782;
	bh=Day6GtZHdG1jC0DzOroHlEzNLO0xOgl2ggrb89xNwu8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Roh4E6iOJ/nNQ4rVDdqNcF3XpREbstGQZ5EhrwDkUf572+pOuaNKQWNCNchrJYaGe
	 Z/qozLSE7iVIbPO7kdxWCvPgsyIeuz/5lrNz+Fey0OVkFNqQurO6VH1H6ib0Jba7OL
	 4W//DNqxkaJo6amPohOiArMvQD9cVOvT7SNJovxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3C6AF8026F;
	Thu,  7 May 2020 16:27:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42C7CF80162; Thu,  7 May 2020 16:27:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D6DCF8011C;
 Thu,  7 May 2020 16:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D6DCF8011C
IronPort-SDR: fOua2V/k8N7s04qIqpQWScbLVTwh4AskFH8Vlk9KzZbrQ472GsyGew5oopHBxMj/XOZg/jz50m
 LiljjdXpD34Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 07:27:44 -0700
IronPort-SDR: FlxiV9tkifVn7SQpdJR7/GHu1h0vfLl0fpMDGosXbdVPsI4k9OWpjGR5wCx5IQQCHBfeEcRq+R
 rvv4bnW83v2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; d="scan'208";a="250105865"
Received: from kawilli2-mobl.amr.corp.intel.com (HELO [10.251.4.116])
 ([10.251.4.116])
 by fmsmga007.fm.intel.com with ESMTP; 07 May 2020 07:27:34 -0700
Subject: Re: [PATCH v2 -next] ASoC: SOF: Intel: Fix unused variable warning
To: YueHaibing <yuehaibing@huawei.com>, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 joe@perches.com
References: <20200507031911.38644-1-yuehaibing@huawei.com>
 <20200507072735.16588-1-yuehaibing@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d3641489-e3c2-e525-567a-d0348c1eab4e@linux.intel.com>
Date: Thu, 7 May 2020 09:27:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507072735.16588-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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



On 5/7/20 2:27 AM, YueHaibing wrote:
> When CONFIG_SND_SOC_SOF_BAYTRAIL is not set, gcc warns:
> 
> sound/soc/sof/intel/byt.c:85:41: warning: ‘cht_debugfs’ defined but not used [-Wunused-const-variable=]
>   static const struct snd_sof_debugfs_map cht_debugfs[] = {
>                                           ^~~~~~~~~~~
> Move the variable inside #ifdef
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks for the patch.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


