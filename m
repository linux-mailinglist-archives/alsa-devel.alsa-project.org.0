Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE379B382
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 17:37:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8B17168C;
	Fri, 23 Aug 2019 17:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8B17168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566574629;
	bh=sEtGafT+F7jbFXOiqTkK3hCtj+cKvTEjQ6DblD2+f1E=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rd5xX5rSU5iXF13cEyS26KKQk7OwSqEIk0z2jz+xny3bkjtIIALFH8i/GysS4QKzk
	 C+6au92wFSj5FPSBTYtyMbB4v+OQeDgFM3wKOof5NjSpf9zQpSDvZLlWjKeDBX8hyz
	 DgfXTG0zmZxgqWV/BAHncEKkh2rcVSHXn6d3YrEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D815FF80306;
	Fri, 23 Aug 2019 17:35:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2749F80306; Fri, 23 Aug 2019 17:35:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83335F8014A
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 17:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83335F8014A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 08:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,421,1559545200"; d="scan'208";a="330760037"
Received: from sdkulkar-mobl.amr.corp.intel.com (HELO [10.254.94.219])
 ([10.254.94.219])
 by orsmga004.jf.intel.com with ESMTP; 23 Aug 2019 08:34:58 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190821185821.12690-1-pierre-louis.bossart@linux.intel.com>
 <20190823063404.GB2672@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cbf39078-1ef2-f05b-e2d7-b4695299e56b@linux.intel.com>
Date: Fri, 23 Aug 2019 10:34:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823063404.GB2672@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 0/4] soundwire: debugfs support for 5.4
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



On 8/23/19 1:34 AM, Vinod Koul wrote:
> On 21-08-19, 13:58, Pierre-Louis Bossart wrote:
>> This patchset enables debugfs support and corrects all the feedback
>> provided on an earlier RFC ('soundwire: updates for 5.4')
>>
>> There is one remaining hard-coded value in intel.c that will need to
>> be fixed in a follow-up patchset not specific to debugfs: we need to
>> remove hard-coded Intel-specific configurations from cadence_master.c
>> (PDI offsets, etc).
> 
> Applied all (i did hand edit of patch 4 to resolve dependency), thanks

Thanks for the edit, appreciate not having to resend a series.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
