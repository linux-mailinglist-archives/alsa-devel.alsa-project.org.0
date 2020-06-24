Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2193C207C13
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 21:16:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84C8018B5;
	Wed, 24 Jun 2020 21:15:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84C8018B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593026180;
	bh=6+MfreiqfK+xz/gCA4sYHvjIpbGa4HEWg2oxRvnHmT8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SVE1FJn5B7cVb/0B2zkbjdmf3XGB3Rb8sG+wy0j2VaK74NqgfdMIrceYufZnKxzaG
	 Oa9x7Zc/1FPLsxBzY+Jbi8VTNWfQqE07Y5ahSmJEAx1AUN90I47VgZzoxwKnKmTG0k
	 eN/Xi59hT0FIvy41lqnGMSykQ2/2e0MmWKh0tNxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF977F8012F;
	Wed, 24 Jun 2020 21:14:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85DBBF8012F; Wed, 24 Jun 2020 21:14:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9895FF8012F
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 21:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9895FF8012F
IronPort-SDR: eJ1+O7zFPm+XqbvZzFz5qEmm618FgybPjhnJfC4Vm2dHzE2IhtCm+2zdbrKnLZUWDkeeIihuMY
 Jwthw7UzeRNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="142084235"
X-IronPort-AV: E=Sophos;i="5.75,276,1589266800"; d="scan'208";a="142084235"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2020 12:14:29 -0700
IronPort-SDR: RBdXwswyeJEW42opUpbwbn/jyTIMsNvQp2RNLZ3lXbeLk+Nqniuqd83UnL9xqaKYSP6sGVGpSb
 x3xzJh5XasJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,276,1589266800"; d="scan'208";a="319540143"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.12.106])
 ([10.213.12.106])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2020 12:14:26 -0700
Subject: Re: [PATCH 2/5] ASoC: Intel: bdw-rt5677: fix module load/unload issues
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200622154241.29053-1-pierre-louis.bossart@linux.intel.com>
 <20200622154241.29053-3-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <031f1766-14cc-76ed-4a0f-b0436c50922a@intel.com>
Date: Wed, 24 Jun 2020 21:14:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200622154241.29053-3-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Curtis Malainey <curtis@malainey.com>, broonie@kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

On 2020-06-22 5:42 PM, Pierre-Louis Bossart wrote:
> The mainline code currently prevents modules from being removed.
> 
> The BE dailink .init() function calls devm_gpiod_get() using the codec
> component device as argument. When the machine driver is removed, the
> references to the gpiod are not released, and it's not possible to
> remove the codec driver module - which is the only entity which could
> free the gpiod.
> 
> This conceptual deadlock can be avoided by invoking gpiod_get() in the
> .init() callback, and calling gpiod_put() in the exit() callback.
> 
> Tested on SAMUS Chromebook with SOF driver.
> 

As /intel/haswell is the go-to driver for BDW platforms, please test and 
confirm with legacy driver first. SOF is optional and thus non-blocking.

Czarek
