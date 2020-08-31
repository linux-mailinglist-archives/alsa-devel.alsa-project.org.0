Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA69257710
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 12:01:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B471717F3;
	Mon, 31 Aug 2020 12:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B471717F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598868096;
	bh=W/pn87rzQXzO5lf3TxGqo/aL0JVKUiKyv3ieQbxqhio=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mlHy8bzwEZmRn/yoKGTbd48LbXHKu7yTgFrCaDBM4lqz2IAXoVGrJ2euBaIXiZLN5
	 aObaiX7P8/EEcF83xEv9nfTB9ngFH2oQG2qmOuxCLDF/CnTykwrZxCPhQH4M61yjPm
	 OiKn+JBjN3bJrHJo8Z2H9H18QCJHMBjZtoeL8e1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C49BF80058;
	Mon, 31 Aug 2020 12:00:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C10CFF80058; Mon, 31 Aug 2020 12:00:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2146F8026F
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 12:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2146F8026F
IronPort-SDR: W+hlTT301Dhf7/3cI5KHH2oS5h7y/Bp98GdeZ79jkzzN0Sm5JGYZ/GMpoFG2aRxOR2sZEu5xnB
 d6C7eqBMYkeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="241751944"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="241751944"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 02:59:58 -0700
IronPort-SDR: MuzfBI/RE7c3H6k/4AbIhmO+r3w1iZYD1yifsSWovNzwV2OWk3YjaHtR9X6rHyyrg3a5C+UaS6
 HvNY+s1xWkQQ==
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="476665139"
Received: from joneswan-mobl.gar.corp.intel.com (HELO [10.252.184.52])
 ([10.252.184.52])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 02:59:57 -0700
Subject: Re: [PATCH 0/9] soundwire: use FIELD_{GET|PREP} in subsystem
To: Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org
References: <20200828072101.3781956-1-vkoul@kernel.org>
From: Bard liao <yung-chuan.liao@linux.intel.com>
Message-ID: <3ccfb69b-21ff-8c0b-2264-10f459a0cd15@linux.intel.com>
Date: Mon, 31 Aug 2020 17:59:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200828072101.3781956-1-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


On 8/28/2020 3:20 PM, Vinod Koul wrote:
> Use the FIELD_{GET|PREP} in soundwire subsytem and remove the local
> SDW_REG_SHIFT().  This makes code IMO look much neater
>
> Tested this on db845c board
>
> Bard, can you please verify this on intel boards.


Somehow it doesn't work on intel boards. I am still looking into it.


>
> Vinod Koul (9):
>    soundwire: define and use addr bit masks
>    soundwire: bus: use FIELD_GET()
>    soundwire: slave: use SDW_DISCO_LINK_ID()
>    soundwire: stream: use FIELD_{GET|PREP}
>    soundwire: qcom : use FIELD_{GET|PREP}
>    soundwire: cadence: use FIELD_{GET|PREP}
>    soundwire: intel: use FIELD_{GET|PREP}
>    soundwire: intel_init: use FIELD_{GET|PREP}
>    soundwire: remove SDW_REG_SHIFT()
>
>   drivers/soundwire/bus.c                 |  6 +--
>   drivers/soundwire/cadence_master.c      | 53 ++++++++++---------------
>   drivers/soundwire/intel.c               | 40 +++++++------------
>   drivers/soundwire/intel_init.c          |  2 +-
>   drivers/soundwire/qcom.c                | 22 ++++------
>   drivers/soundwire/slave.c               |  2 +-
>   drivers/soundwire/stream.c              | 13 +++---
>   include/linux/soundwire/sdw.h           | 21 ++++++----
>   include/linux/soundwire/sdw_registers.h |  7 ----
>   9 files changed, 67 insertions(+), 99 deletions(-)
>
