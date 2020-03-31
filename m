Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E93B19958A
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 13:46:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 098581658;
	Tue, 31 Mar 2020 13:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 098581658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585655199;
	bh=BWVdIKxNWAYvEAK/BNCqZmthgu/QPHPv20FLhyYumc0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j/akhNsN8E9iDFgD1Ap3r9BHZNVSzIVJ/J318yhva19BoBvj6J83fzxgPLqqMuuEb
	 aoNiKY/fCs12gwvQSMfi/wsdmvIgEgJ0eze5o6OdoZT12IiFSOgfRWooeEIImgezQJ
	 h7muz5H3y01imnbBPLKURcQ3E5eJKvuboKOcU6bo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B1AF8014F;
	Tue, 31 Mar 2020 13:44:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D336F80146; Tue, 31 Mar 2020 13:44:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33106F8010C
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 13:44:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33106F8010C
IronPort-SDR: yYcMqNW6XX4Y9ISr1lGQ5n0MF0SV9CyBqiRH0QCZGZgXa331Zh/wAEIYDR/Sc/Rkh+xBXDB5SQ
 bunt1kH4XCAQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2020 04:44:49 -0700
IronPort-SDR: bJpfy/KMn0DWCI1YRBwNRIsKjnf1hj9+ubL+8M37duUSoKL8gQjUmMTxoqWR7oqBadrTdz+Cni
 X2bh7PvtSqOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; d="scan'208";a="240100576"
Received: from kmariste-mobl.amr.corp.intel.com (HELO [10.212.248.138])
 ([10.212.248.138])
 by fmsmga007.fm.intel.com with ESMTP; 31 Mar 2020 04:44:47 -0700
Subject: Re: [PATCH 3/4] ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag
 from SSP0 dai link
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
References: <20200319204947.18963-1-cezary.rojewski@intel.com>
 <20200319204947.18963-4-cezary.rojewski@intel.com>
 <dea20cf7-f324-a933-8f8e-e70a4dffa249@linux.intel.com>
 <259cbb60-9e59-1132-8371-83f837577f86@redhat.com>
 <9f1884b4-e356-9a8f-6912-0d55c4bcbf06@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a48d48cb-ab02-1213-88b9-431109e4b468@linux.intel.com>
Date: Tue, 31 Mar 2020 05:54:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <9f1884b4-e356-9a8f-6912-0d55c4bcbf06@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Curtis Malainey <cujomalainey@google.com>, tiwai@suse.com,
 Dominik Brodowski <linux@dominikbrodowski.net>, lgirdwood@gmail.com,
 vkoul@kernel.org, broonie@kernel.org, Ben Zhang <benzh@google.com>
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


> Don't believe WoV for WPT has been added for SST linux so 
> .ignore_suspend=1 achieves nothing. The offload part is probably just 
> limited to bigger buffer size compared to system pin than anything else. 
> So, nothing prevents from removing .ignore_suspend for SST solutions 
> until WoV is verified. Don't know about SOF side.
> Pierre, what's your take on this?

I think on Baytrail and Broadwell we will most likely never enable 
hotwording on the Intel DSP, and S0i1-Playback isn't planned either.

However hotwording is enabled on the RT5677 and there may be clocking 
dependencies so that the RT5677 remains operational - at least the mclk 
needs to be on, so the bdw-rt5677 case probably needs more work.

While I am at it, I think the notion of .ignore_suspend has an 
assumption baked in. It will work if the only suspend mode is S0i1. If 
the platform can choose between S0i1 and S3, then we would still want to 
suspend all paths in S3, which currently isn't really possible.
