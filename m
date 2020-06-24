Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B80C9207CA5
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 22:08:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4498318AF;
	Wed, 24 Jun 2020 22:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4498318AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593029320;
	bh=JnmyrwVEwckFDYCm45KFOFYHq3HxCkr/ZZQzmTZsTV4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XYEHtMjW8N5saHKBrmwLAD8VRUqqVC+fOAzCPa54VLqkyG+HXsH8LLdjAnQftp9in
	 q9Ue/jqYrWc9WtKvKYaDE6xnRYGa2Dmbr5LG0Ydf/xIF8Bm1Uc2QxQQMXT+DKvOPbi
	 RVptsTEm0sF7ThFYlm7lzuOw4AvzjEqiszgkG8PU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B3DAF800B2;
	Wed, 24 Jun 2020 22:06:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2C1DF8015B; Wed, 24 Jun 2020 22:06:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29979F800B2
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 22:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29979F800B2
IronPort-SDR: xdoYU3uY3Iaj2tmPB4sqLtqfud7LHriR1m9UUJyzz0RLGlcTq6DmtsRSgOuk0CfcIby65Kzjpa
 n3SyHcUxZp5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="143721203"
X-IronPort-AV: E=Sophos;i="5.75,276,1589266800"; d="scan'208";a="143721203"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2020 13:06:48 -0700
IronPort-SDR: d4I3IYNmazP+LoQ0H3BMMrtxZbiYLT8Y3hUnvRDr15bHf5DTtTqK4zVZUBoIHGjC3xJMiRJo2Z
 xDzJH+gstN+A==
X-IronPort-AV: E=Sophos;i="5.75,276,1589266800"; d="scan'208";a="452762607"
Received: from vrsuryad-mobl1.amr.corp.intel.com (HELO [10.255.230.205])
 ([10.255.230.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2020 13:06:47 -0700
Subject: Re: [PATCH 2/5] ASoC: Intel: bdw-rt5677: fix module load/unload issues
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20200622154241.29053-1-pierre-louis.bossart@linux.intel.com>
 <20200622154241.29053-3-pierre-louis.bossart@linux.intel.com>
 <031f1766-14cc-76ed-4a0f-b0436c50922a@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5faf3ae1-697c-a5fa-4162-2938bb890f0f@linux.intel.com>
Date: Wed, 24 Jun 2020 15:06:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <031f1766-14cc-76ed-4a0f-b0436c50922a@intel.com>
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



On 6/24/20 2:14 PM, Cezary Rojewski wrote:
> On 2020-06-22 5:42 PM, Pierre-Louis Bossart wrote:
>> The mainline code currently prevents modules from being removed.
>>
>> The BE dailink .init() function calls devm_gpiod_get() using the codec
>> component device as argument. When the machine driver is removed, the
>> references to the gpiod are not released, and it's not possible to
>> remove the codec driver module - which is the only entity which could
>> free the gpiod.
>>
>> This conceptual deadlock can be avoided by invoking gpiod_get() in the
>> .init() callback, and calling gpiod_put() in the exit() callback.
>>
>> Tested on SAMUS Chromebook with SOF driver.
>>
> 
> As /intel/haswell is the go-to driver for BDW platforms, please test and 
> confirm with legacy driver first. SOF is optional and thus non-blocking.

I'll retest when you've fixed the go-to legacy driver, I am not even 
going to try module load/unload tests when the platform code has known 
issues requiring reverts.
