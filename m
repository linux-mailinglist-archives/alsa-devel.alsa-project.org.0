Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F34E54FEF
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 15:12:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6DDE1615;
	Tue, 25 Jun 2019 15:11:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6DDE1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561468351;
	bh=Ut2EIhVrTNz64S2USwChpCN3jZ/nXp5gBZ3QcMVriAM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LC6ZKLI1AL+B32qByfaRHLTxNZbbD/TXELkWWQl3nIL5rMvG2yL4Nx4JleplVfooj
	 lV3Ji93iwq+FWO5BtGJQN2izzP1pdCI6efzByNkd6qFNql1G5+PfVtb5agMgCwYYuD
	 wD1wcdf1REvwbv+SgJqw7j26jSPFM9W88ouI0DQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AAB4F896FD;
	Tue, 25 Jun 2019 15:10:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A812F896F9; Tue, 25 Jun 2019 15:10:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72238F8071F
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 15:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72238F8071F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jun 2019 06:10:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,415,1557212400"; d="scan'208";a="184481996"
Received: from pbossart-mobl3.igk.intel.com (HELO [10.237.142.180])
 ([10.237.142.180])
 by fmsmga004.fm.intel.com with ESMTP; 25 Jun 2019 06:10:37 -0700
To: Mark Brown <broonie@kernel.org>, cezary.rojewski@intel.com
References: <20190613190436.20156-1-cezary.rojewski@intel.com>
 <20190625105335.GO5316@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d04c8288-9f53-c921-2cab-120f78548e85@linux.intel.com>
Date: Tue, 25 Jun 2019 08:10:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190625105335.GO5316@sirena.org.uk>
Content-Language: en-US
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 0/7] ASoC: Intel: Skylake: Critical IPC
 fixes and flow adjustments
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



On 6/25/19 5:53 AM, Mark Brown wrote:
> On Thu, Jun 13, 2019 at 09:04:29PM +0200, cezary.rojewski@intel.com wrote:
>> From: Cezary Rojewski <cezary.rojewski@intel.com>
>>
>> This set of changes contains critical IPC fixes:
>> - ASoC: Intel: Skylake: Read HIPCT extension before clearing DONE bit
>> - ASoC: Intel: Fix race condition in IPC rx list
> 
> Pierre, any thoughts on this series?

This series I looked at in detail and it was the basis for the recent 
SOF cleanup on IPC. There are still some improvements being debated on 
when exactly the IPC interrupts need to be unmasked - Guennadi suggested 
the interrupt need to be re-enabled at the beginning of the interrupt 
thread to avoid missing events - but this can come as bullet-proof 
hardening patches later for both SOF and Skylake. For now this is a good 
first pass, feel free to take the following tag for the series

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
