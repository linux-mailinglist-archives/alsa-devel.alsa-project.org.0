Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D8925C1E4
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 15:52:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86B24193A;
	Thu,  3 Sep 2020 15:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86B24193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599141130;
	bh=liNY7FLSdHRdX4Cnhw9WiPzs2IYQ4bTl9yopIqeiJ+g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LoYRyFenaJtrIHswxfemqHTpJktwl0EqM7RlFkgGetrElI+M1iTdveq7+qb7D3whE
	 L9RXx7lPIpJueKXHoBfoVry09HiQTQF6w71WbiAiQdfc3tBiWcInfBKbUz09MyjXVS
	 XxpgEr5Y3nHF2rupl9+/SltEOTEkn86I/9dZqCp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29C4FF801DA;
	Thu,  3 Sep 2020 15:51:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF579F80217; Thu,  3 Sep 2020 15:51:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2A5BF801DA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 15:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2A5BF801DA
IronPort-SDR: wlkvHGktr8nIx2RBRsPi22H2y/I/BG78Yx82FPabCagYGTvH6wnrrJTpxSAZS5NRBi7nJNnjCn
 kEC45OFKwd3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="154974688"
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; d="scan'208";a="154974688"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 06:51:04 -0700
IronPort-SDR: MSO9JBH5b0ka+Q1jWl14asalj024iN8jaC7XfOus0u1NdKpap1zDjqFI9GhzXYb1+vY7WY8YFa
 F40ZHPJL8YxA==
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; d="scan'208";a="339288441"
Received: from corteszu-mobl.amr.corp.intel.com (HELO [10.213.169.41])
 ([10.213.169.41])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 06:51:04 -0700
Subject: Re: [PATCH v2 0/3] regmap: add SoundWire 1.2 MBQ support
To: Vinod Koul <vkoul@kernel.org>
References: <20200901162225.33343-1-pierre-louis.bossart@linux.intel.com>
 <20200903103617.GP2639@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <32ba445b-2bb3-592a-8f5e-dca458f7193a@linux.intel.com>
Date: Thu, 3 Sep 2020 08:51:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903103617.GP2639@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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



On 9/3/20 5:36 AM, Vinod Koul wrote:
> On 01-09-20, 11:22, Pierre-Louis Bossart wrote:
>> In preparation of the upstream contribution of SDCA (SoundWire Device
>> Class for Audio) ASoC codec drivers [1] [2], add regmap support
>> SoundWire 1.2 MBQ support. The MBQ (Multi-Byte Quantity) registers
>> need to be handled in a different way from regular 8-bit SoundWire
>> registers, their main application is going to be for volume/gain
>> controls.
>>
>> The second patch was initially suggested for inclusion in the
>> SoundWire tree, and was modified to add more background information on
>> SDCA in the commit message as requested by Vinod Koul.
> 
> Is this targetted towards the sdw tree or regmap tree, I think it may
> have dependencies so sdw can be used.
> 
> It would be nice to mention these things here in cover

It was intended for the regmap tree (the cover letter does not include 
the soundwire: prefix).

Patch2 would need the ack of SoundWire maintainers (Bard already provide 
his tag).

The dependencies are regmap->ASoC for codec integration. There will be 
no dependencies for the SoundWire core proper, SDCA is really about the 
device side of things beyond what the bus provides.

Thanks!

> 
>>
>> Changes since v1:
>> Rebased on regmap tree (conflict with SPI stuff).
>> Removed mod_devicetable.h header
>> Removed -EOPNOTSUPP error codes, use -ENOTSUPP
>> Added long description of SDCA
>> Used FIELD_PREP/GET as suggested by Vinod Koul
>> Added Bard Liao's Acked-by tag.
>>
>> Pierre-Louis Bossart (3):
>>    regmap: sdw: add required header files
>>    soundwire: SDCA: add helper macro to access controls
>>    regmap: sdw: add support for SoundWire 1.2 MBQ
>>
>>   drivers/base/regmap/Kconfig             |   6 +-
>>   drivers/base/regmap/Makefile            |   1 +
>>   drivers/base/regmap/regmap-sdw-mbq.c    | 101 ++++++++++++++++++++++++
>>   drivers/base/regmap/regmap-sdw.c        |   2 +
>>   include/linux/regmap.h                  |  21 +++++
>>   include/linux/soundwire/sdw_registers.h |  33 ++++++++
>>   6 files changed, 163 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/base/regmap/regmap-sdw-mbq.c
>>
>>
>> base-commit: d17343b87da422a59d99a3ed130573dbeb96c582
>> -- 
>> 2.25.1
> 
