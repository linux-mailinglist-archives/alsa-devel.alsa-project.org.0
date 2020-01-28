Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFA314B317
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 11:55:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C822C167D;
	Tue, 28 Jan 2020 11:54:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C822C167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580208923;
	bh=gooTOTLlKt6v7Cqb3BEXORp0pfKO6AfPhowqyuhktXA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SuVJzrJMHg6eWEoHj3OJhoIwj7oAvkxmS+18OnCQMegrSVadQU0Bo3P0uhS4fgvVz
	 UK6IpFkmfGyO+/bU4DI4wKU4a1BQR6nS9QIlEtrZX281Aw7Rp4Scsm3moTVTBwukz/
	 kRwoFNpoArsqQnpkcKPV3tMmOSf+Fn0+/7ICFJyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9836CF8028F;
	Tue, 28 Jan 2020 11:51:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD4E6F8028D; Tue, 28 Jan 2020 11:50:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A9E3F8028C
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 11:50:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A9E3F8028C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 02:50:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,373,1574150400"; d="scan'208";a="231880218"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by orsmga006.jf.intel.com with ESMTP; 28 Jan 2020 02:50:49 -0800
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200127121243.15813-1-cezary.rojewski@intel.com>
 <20200127121243.15813-8-cezary.rojewski@intel.com>
 <ba250355-73bc-bdf0-15b1-362b0147a4bd@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <3bd88089-51b0-378a-a62c-5074d1c0af68@intel.com>
Date: Tue, 28 Jan 2020 11:50:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <ba250355-73bc-bdf0-15b1-362b0147a4bd@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH v2 07/11] ASoC: SOF: Implement Probe IPC API
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

On 2020-01-27 22:09, Pierre-Louis Bossart wrote:
> 
> 
> On 1/27/20 6:12 AM, Cezary Rojewski wrote:
>> Add all required types and methods to support each and every request
>> that driver could sent to firmware. Probe is one of SOF firmware
>> features which allows for data extraction and injection directly from
>> or to DMA stream.
>>
>> Exposes eight IPCs:
>> - addition and removal of injection DMAs
>> - addition and removal of probe points
>> - info retrieval of injection DMAs and probe points
>> - probe initialization and cleanup
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> You also want to fix the kernel-doc issues reported with make W=1
> 
> sound/soc/sof/probe.c:29: warning: Function parameter or member
> 'stream_tag' not described in 'sof_ipc_probe_init'
> 
> sound/soc/sof/probe.c:266: warning: Function parameter or member
> 'buffer_id' not described in 'sof_ipc_probe_points_remove'
> 
> sound/soc/sof/probe.c:266: warning: Function parameter or member
> 'num_buffer_id' not described in 'sof_ipc_probe_points_remove'
> 
> sound/soc/sof/probe.c:266: warning: Excess function parameter
> 'desc' description in 'sof_ipc_probe_points_remove'
> 
> sound/soc/sof/probe.c:266: warning: Excess function parameter
> 'num_desc' description in 'sof_ipc_probe_points_remove'
> 

That _probe_points_remove doc generated ~5 warnings in total :D
Thanks for reporting, addressed in v3.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
