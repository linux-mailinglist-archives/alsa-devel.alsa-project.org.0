Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ECA86931
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 20:55:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35EAF165D;
	Thu,  8 Aug 2019 20:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35EAF165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565290558;
	bh=NNAOPyzUszUvMStyH8/9DodYNOcm1OYAsDr2E4BOuG0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SOGt6HpiFN1mtzUorv6sE9jlhLG9gwVlxOL+mKStkuTMuSt627NVohBTqSZZYZZn1
	 uROB29GFUPnRJCM71klB6pZ5oe+GIaPe3+HAiDJjsZcX4g6hiiezYNPm8YhyMMfLCZ
	 D4NOw4LqQZpB+BWVAKPLRY2Y6LCXxaxgxrnUDmDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D5F8F804FF;
	Thu,  8 Aug 2019 20:54:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2349BF80534; Thu,  8 Aug 2019 20:54:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37D91F803F3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 20:54:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37D91F803F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 11:54:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,362,1559545200"; d="scan'208";a="199150889"
Received: from jmikitka-mobl2.amr.corp.intel.com (HELO [10.252.204.174])
 ([10.252.204.174])
 by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2019 11:54:03 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190808181549.12521-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7cc3d923-7429-c21b-690e-ee7ebfcb502f@linux.intel.com>
Date: Thu, 8 Aug 2019 13:54:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808181549.12521-1-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH v5 0/2] ASoC: Intel: Skylake:
 large_config_get overhaul
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



On 8/8/19 1:15 PM, Cezary Rojewski wrote:
> LARGE_CONFIG_GET is among the most crucial IPCs. Host is expected to
> send single request first to obtain total payload size from received
> header's data_off_size. From then on, it loops for each frame exceeding
> inbox size until entire payload is read. If entire payload is contained
> within the very first frame, no looping is performed.
> 
> LARGE_CONFIG_GET is a flexible IPC, it not only receives payload but may
> carry one with them to provide list of params DSP module should return
> info for. This behavior is usually reserved for vendors and IPC handler
> should not touch that content. To achieve that, simply pass provided
> payload and bytes to sst_ipc_tx_message_wait as a part of request.
> 
> In current state, LARGE_CONFIG_GET message handler does nothing of that,
> in consequence making it dysfunctional. Overhaul said handler allowing
> rightful king of IPCs to return back on his throne - kingdom he shares
> with his twin brother: LARGE_CONFIG_SET.
> 
> The looping has not been added in this update as payloads of such size
> do not exist in practice. Will need to create custom module specifically
> for that very case and test against it before that feature can be added.

Thanks Cezary.

For the series:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Changes since v4:
> - Addressed Pierre's review: updated function's declaration and dropped
>    unrelated log changes
> 
> Changes since v3:
> - Split "large_config_get overhaul" patch into two segments as suggested
>    by Pierre: first remove looping, then adjust function's behavior
> 
> Changes since v2:
> - None, just for-next rebase
> 
> Changes since v1:
> - None, just for-next rebase
> 
> Cezary Rojewski (2):
>    ASoC: Intel: Skylake: Limit large_config_get to single frame
>    ASoC: Intel: Skylake: large_config_get overhaul
> 
>   sound/soc/intel/skylake/skl-messages.c |  3 +-
>   sound/soc/intel/skylake/skl-sst-ipc.c  | 54 +++++++++++---------------
>   sound/soc/intel/skylake/skl-sst-ipc.h  |  3 +-
>   3 files changed, 27 insertions(+), 33 deletions(-)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
