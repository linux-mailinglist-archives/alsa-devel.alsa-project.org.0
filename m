Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 183402535AA
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 19:02:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF7611782;
	Wed, 26 Aug 2020 19:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF7611782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598461340;
	bh=4zcjyHBz1NfnnD8LQMSx/xxeuZ1fsEp+Ugh3CpiV+zQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=agtKqCct5qfmNyzJiTIHxG5HTNZKCPXRvbAZD7QRWOYU81FBQePDIYhtBohN9qeHg
	 B/WHBSbQcYZCeWULPjAiPbTs+yqqyqNdXXExVOV5Xq3a38NyDIlCz3ukqJIk7T0sqd
	 +t+FB4kHkszyT5AlE5CX+EkPMOfQdvMu4wZ0QPYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14FA8F801F2;
	Wed, 26 Aug 2020 19:00:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56643F801EC; Wed, 26 Aug 2020 19:00:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C495DF80143
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 19:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C495DF80143
IronPort-SDR: ChXfQqsXYPikTbsGFb5VQAiQ1GVzHnEpx+mHxZi5piTaWNIG6xu4teD44/5DSFahIr0vzlF/6M
 7f6LKxoSveDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="220592528"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="220592528"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 10:00:16 -0700
IronPort-SDR: 9r0Qvx3VEZeWklGWG5/T7Y6mQEQBgTNCLq7GNVIQ37d5n0hf3nXr7BdLATpWnMectnhj5Pf0QP
 XNcdGoFWQxBg==
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="336884978"
Received: from kberke-mobl1.amr.corp.intel.com (HELO [10.209.43.169])
 ([10.209.43.169])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 10:00:14 -0700
Subject: Re: [PATCH v2 0/5] ASoC: Fix return check for devm_regmap_init_sdw()
To: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20200826163340.3249608-1-vkoul@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5a7f6edc-3eac-7603-35a2-71e85cfc0975@linux.intel.com>
Date: Wed, 26 Aug 2020 12:00:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200826163340.3249608-1-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Ryan Lee <ryans.lee@maximintegrated.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Shuming Fan <shumingf@realtek.com>,
 Naveen Manohar <naveen.m@intel.com>, Rander Wang <rander.wang@linux.intel.com>
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



On 8/26/20 11:33 AM, Vinod Koul wrote:
> This series attempts to fix return check for devm_regmap_init_sdw()
> 
> Changes in v2:
>   - Add missing patch for rt711
>   - Add patch for rt700
> 
> Vinod Koul (5):
>    ASoC: max98373: Fix return check for devm_regmap_init_sdw()
>    ASoC: rt1308-sdw: Fix return check for devm_regmap_init_sdw()
>    ASoC: rt711: Fix return check for devm_regmap_init_sdw()
>    ASoC: rt715: Fix return check for devm_regmap_init_sdw()
>    ASoC: rt700: Fix return check for devm_regmap_init_sdw()

Thanks for the fix.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
