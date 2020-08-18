Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D509E248488
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 14:11:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FF34175E;
	Tue, 18 Aug 2020 14:10:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FF34175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597752699;
	bh=8CDvSsoGHSgWS/T4tRzZ4j52ptS8lToZydgo6p/5VQg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HSdaa5utPcIrTV3f99cx6OSnnu5aoK1c12g6VLZds4caaFNhlOtZ/dG5vl5s3Pqov
	 2MfFjzPfCl0eFNR4j4Lp2j78Uyh0gpIevv5V9Mthf0Mf5R5ZlVOUUXkOvbI1kQq2rm
	 VgmApcXRZ++wrncip/DvS1+OyYCyGHxUEm+YXgAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CA45F800D3;
	Tue, 18 Aug 2020 14:09:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3277CF8023F; Tue, 18 Aug 2020 14:09:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D59FCF800D3
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 14:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D59FCF800D3
IronPort-SDR: 1xIrTwa7NSRRfh/ugfDbyPVtJ4SfFOjB8xXELk0ddjKOqdNb9xNO0duS3y/w7otIjqzRJ8WwZf
 QQEsyZ6qsrpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="216412780"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="216412780"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 05:09:44 -0700
IronPort-SDR: nE7KDIMg9QlBsdRoU29DOvkkZeyvCbLlCKWCcoa2bwJdcra3a1uGTS6k/nIb8mxGuhU4DUbT8K
 LGh5G+j7mBxQ==
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="471783463"
Received: from kumaraaj-mobl1.amr.corp.intel.com (HELO [10.251.23.85])
 ([10.251.23.85])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 05:09:42 -0700
Subject: Re: [PATCH 2/2] soundwire: fix port_ready[] dynamic allocation in
 mipi_disco and ASoC codecs
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20200817174727.15139-1-yung-chuan.liao@linux.intel.com>
 <20200817174727.15139-3-yung-chuan.liao@linux.intel.com>
 <20200818063659.GW2639@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e9f12e13-49e0-5306-a975-b1b854baef02@linux.intel.com>
Date: Tue, 18 Aug 2020 07:09:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818063659.GW2639@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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



On 8/18/20 1:36 AM, Vinod Koul wrote:
> On 18-08-20, 01:47, Bard Liao wrote:
>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>
>> The existing code allocates memory for the total number of ports.
>> This only works if the ports are contiguous, but will break if e.g. a
>> Devices uses port0, 1, and 14. The port_ready[] array would contain 3
>> elements, which would lead to an out-of-bounds access. Conversely in
>> other cases, the wrong port index would be used leading to timeouts on
>> prepare.
>>
>> This can be fixed by allocating for the worst-case of 15
>> ports (DP0..DP14). In addition since the number is now fixed, we can
>> use an array instead of a dynamic allocation.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
>> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
>> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> ---
>>   drivers/soundwire/mipi_disco.c  | 18 +-----------------
>>   drivers/soundwire/slave.c       |  4 ++++
>>   include/linux/soundwire/sdw.h   |  2 +-
>>   sound/soc/codecs/max98373-sdw.c | 15 +--------------
>>   sound/soc/codecs/rt1308-sdw.c   | 14 +-------------
>>   sound/soc/codecs/rt5682-sdw.c   | 15 +--------------
>>   sound/soc/codecs/rt700-sdw.c    | 15 +--------------
>>   sound/soc/codecs/rt711-sdw.c    | 15 +--------------
>>   sound/soc/codecs/rt715-sdw.c    | 33 +--------------------------------
> 
> This looks fine, but the asoc changes are not dependent, so maybe we
> should split them up and then can go thru Mark. Or Mark acks, either way
> would work for me

There are 3 dependencies that we tracked between SoundWire and ASoC 
subsystems:

a) addition of SDCA control macro (needed before SDCA codec drivers can 
be shared)
b) this series - we could indeed submit the codec changes to Mark's tree 
separately, but then the SoundWire tree would be broken: the codec 
drivers would still try to allocate dynamically what is now a fixed-size 
array.
c) configuration of the interrupt masks in codec drivers instead of 
hard-coded in bus driver + spurious parity error workaround (not posted 
yet but ready).

The changes in ASoC codecs are really only on the initialization part 
(either removing a dynamic allocation or setting masks), there's no 
functional change otherwise.

I think the simplest to avoid multiple back-and-forth is to have these 
small interface/initialization changes merged through the SoundWire 
subsystem, then merged by Mark from a single immutable tag. Would this 
work for everyone?

In addition, there's a WIP change to regmap to add support for SoundWire 
1.2 MBQ-based register access, but this only affects regmap and ASoC 
trees, all handled by Mark.

I don't think we have any other cross-tree changes planned for now, the 
SDCA infrastructure plumbing is still rather open.
