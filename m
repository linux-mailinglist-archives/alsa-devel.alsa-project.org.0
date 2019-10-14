Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E167D66D3
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 18:05:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD97D1673;
	Mon, 14 Oct 2019 18:05:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD97D1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571069157;
	bh=mM6j2iPEr4Rn3sj9xDT2A3K6AStcSxLFQ00dyyJciNo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RK/ubbuthCCPUUfgEFItJxvFR4hwDAqPt5nksge11P6tJQyjIbrAr8FvjeDvO33ZE
	 1PmlZhJAPjlmiu6dnuXtKMTcwEhEfQRdcr81M4TJrDqtZoixZ1CEd0KOPof+mR79Te
	 9pa2NFJqigjPLM7EUJ5+noAmO6zzhZQutPChnhdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59EACF80612;
	Mon, 14 Oct 2019 18:02:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AED8F80322; Mon, 14 Oct 2019 18:02:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7763BF80362
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 18:02:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7763BF80362
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Oct 2019 09:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,296,1566889200"; d="scan'208";a="199439459"
Received: from rtnitta-mobl1.amr.corp.intel.com (HELO [10.251.134.135])
 ([10.251.134.135])
 by orsmga006.jf.intel.com with ESMTP; 14 Oct 2019 09:02:33 -0700
To: alsa-devel@alsa-project.org
References: <20190916192348.467-1-pierre-louis.bossart@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9be43d87-de80-ca8f-d6f7-53879540675a@linux.intel.com>
Date: Mon, 14 Oct 2019 11:01:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190916192348.467-1-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 0/6] soundwire: intel/cadence: simplify PDI
 handling
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 9/16/19 2:23 PM, Pierre-Louis Bossart wrote:
> These patches were originally submitted as '[RFC PATCH 00/11]
> soundwire: intel: simplify DAI/PDI handling'. There were no comments
> received.
> 
> This series only provides the PDI changes, which makes it simpler to
> review. The DAI changes will be provided with the complete series for
> ASoC/SOF integration, which is a larger change.

Vinod, if you are back at your desk, those patches are almost a month 
old. thanks!

> 
> Bard Liao (3):
>    soundwire: intel: fix intel_register_dai PDI offsets and numbers
>    soundwire: intel: remove playback/capture stream_name
>    soundwire: cadence_master: improve PDI allocation
> 
> Pierre-Louis Bossart (3):
>    soundwire: remove DAI_ID_RANGE definitions
>    soundwire: cadence/intel: simplify PDI/port mapping
>    soundwire: intel: don't filter out PDI0/1
> 
>   drivers/soundwire/cadence_master.c | 158 +++++++----------------------
>   drivers/soundwire/cadence_master.h |  34 ++-----
>   drivers/soundwire/intel.c          | 155 ++++++----------------------
>   include/linux/soundwire/sdw.h      |   3 -
>   4 files changed, 73 insertions(+), 277 deletions(-)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
