Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A661CE383
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 21:02:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AECC1612;
	Mon, 11 May 2020 21:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AECC1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589223728;
	bh=1KYHl1eE3EPv6F7db66uSpzCwGMMmrV9PN4l1EuFups=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ay8nAhf37EyNgUCezVNCPoIXMP3ePCACrvucI3LfoMsXoNskslSxVNaDuHEhEwAVv
	 958QraalLVUjwOsYalQLkNmP50WcG02gQOxr2wFtxiB8NIziU6P20s8brRN1w4CkKX
	 wiOiDKlHpBChokWmjVAFlMNq7Um4e5rZPN5wSOEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DB56F800E3;
	Mon, 11 May 2020 21:00:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFB6CF80157; Mon, 11 May 2020 21:00:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2134F80107
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 21:00:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2134F80107
IronPort-SDR: NolICqrIXLLi5UNhoU3KzBweHnvolh/IQ9YUNJIeqejRNNk6a0PWzRVzNaevWkp+0UU8bTQtjt
 zBodHNF+y+3A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 12:00:13 -0700
IronPort-SDR: UriJ4Mj+W1dUj4SAvvtpUe2eoHnCT1YifIAyVeIXqTp9uaMsPTUvo4cyNtBzMjm2ajwrhM0nUr
 FrG7Q4XFCzEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,381,1583222400"; d="scan'208";a="261861655"
Received: from unknown (HELO [10.254.66.92]) ([10.254.66.92])
 by orsmga003.jf.intel.com with ESMTP; 11 May 2020 12:00:11 -0700
Subject: Re: [PATCH 3/3] soundwire: bus_type: add sdw_master_device support
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20200429185145.12891-1-yung-chuan.liao@linux.intel.com>
 <20200429185145.12891-4-yung-chuan.liao@linux.intel.com>
 <20200511063227.GS1375924@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e214d308-1b92-a7a5-3c76-da05dca99cc5@linux.intel.com>
Date: Mon, 11 May 2020 14:00:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511063227.GS1375924@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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




>> +	md = &bus->md;
>> +	md->dev.bus = &sdw_bus_type;
>> +	md->dev.type = &sdw_master_type;
>> +	md->dev.parent = parent;
>> +	md->dev.of_node = parent->of_node;
>> +	md->dev.fwnode = fwnode;
>> +	md->dev.dma_mask = parent->dma_mask;
>> +
>> +	dev_set_name(&md->dev, "sdw-master-%d", bus->link_id);
> 
> This give nice sdw-master-0. In DT this comes from reg property. I dont
> seem to recall if the ACPI/Disco spec treats link_id as unique across
> the system, can you check that please, if not we would need to update
> this.
Table 3 in the Disco for Soundwire 1.0 spec: "all LinkID values are 
relative to the immediate parent Device."

There isn't any known implementation with more than one controller.
