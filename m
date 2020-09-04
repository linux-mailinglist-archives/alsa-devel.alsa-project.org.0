Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E9B25D2A8
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 09:48:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FF8A1ACE;
	Fri,  4 Sep 2020 09:47:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FF8A1ACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599205707;
	bh=8Mlmx+oj2DwHx7wLAHgEF1DS0dQ9oRV/KzZ8do7cleM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=THW1a18D454TsdqBjAio4wssZoa24rKLRwCVI6M+CzF11K7CcJG2HFo2C5vEugN7r
	 tBwI5jby55ugWMexEXzvdXUZDbHGLYfw3xm/5Zz3vMr5bZnlOMuzFE0ypQD9QADuL0
	 PgMLkSfsUP0vJnaTNdRE9EQd30BbZPdqLZWWGyvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98D3DF80113;
	Fri,  4 Sep 2020 09:46:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 721EDF8024A; Fri,  4 Sep 2020 09:46:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=HTML_MESSAGE,NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B1D4F80113
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 09:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B1D4F80113
IronPort-SDR: +B30NE5nJTwx0Jm1kMEZG3Z1LvTk5ix8P9sXp2ll6+zfYtyaycwUEME1U/FbRejMmzxM1hwt6A
 7v32DiT7WNBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="145440296"
X-IronPort-AV: E=Sophos;i="5.76,388,1592895600"; 
 d="scan'208,217";a="145440296"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 00:46:26 -0700
IronPort-SDR: mqOmgzDbfEYIdwmxiKrqCmBC5YptRs1VdjWfI26eeZkXvS1J8jCo+t9pNLMnTqTvg7S2WDZCep
 zCRw29CkO3Ow==
X-IronPort-AV: E=Sophos;i="5.76,388,1592895600"; 
 d="scan'208,217";a="339583195"
Received: from yungchua-mobl.ccr.corp.intel.com (HELO [10.252.191.96])
 ([10.252.191.96])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 00:46:24 -0700
Subject: Re: [PATCH v2 0/9] soundwire: use FIELD_{GET|PREP} in subsystem
To: Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org
References: <20200903114504.1202143-1-vkoul@kernel.org>
From: Bard liao <yung-chuan.liao@linux.intel.com>
Message-ID: <169e2a94-37db-a9c0-748f-99af46aef3e5@linux.intel.com>
Date: Fri, 4 Sep 2020 15:46:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200903114504.1202143-1-vkoul@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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


On 9/3/2020 7:44 PM, Vinod Koul wrote:
> Use the FIELD_{GET|PREP} in soundwire subsytem and remove the local
> SDW_REG_SHIFT().  This makes code IMO look much neater
>
> Tested this on db845c board
>
> Changes in v2:
>   - fold in fixes provided by Bard and Pierre
>   - Use GENMAS_ULL for addr
>   - rebase to next and fold in new intel change
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
>   drivers/soundwire/cadence_master.c      | 61 +++++++++++--------------
>   drivers/soundwire/intel.c               | 52 ++++++++-------------
>   drivers/soundwire/intel_init.c          |  2 +-
>   drivers/soundwire/qcom.c                | 22 +++------
>   drivers/soundwire/slave.c               |  2 +-
>   drivers/soundwire/stream.c              | 13 ++----
>   include/linux/soundwire/sdw.h           | 21 ++++++---
>   include/linux/soundwire/sdw_registers.h |  7 ---
>   9 files changed, 75 insertions(+), 111 deletions(-)

Tested it on Intel platforms.

Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>


