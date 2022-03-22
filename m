Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C774E43ED
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 17:09:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C35161732;
	Tue, 22 Mar 2022 17:08:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C35161732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647965344;
	bh=rwrj2Z9VBJg8LHkSydz9+EIooQOKJr+WkplOoNva93I=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k1TBqf8W+eKNewTzkrgcx5g0gruMSXXhjZc+Fgc/i5F070+mv9q/57JC4p/EbqGyh
	 PA6AHd+68lz6xd7gHbemjYKrBODqObg2ECk1fgIJDKErJoD58P4D5ygVqTqyXwtioM
	 J4vDfm8MMCfdTyUuDO5qbGGgtctFUbnQmBEHO1c4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40318F800F5;
	Tue, 22 Mar 2022 17:07:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11800F800F5; Tue, 22 Mar 2022 17:07:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8549CF800F5
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 17:07:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8549CF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="R9QwHQDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647965271; x=1679501271;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=rwrj2Z9VBJg8LHkSydz9+EIooQOKJr+WkplOoNva93I=;
 b=R9QwHQDvTF12Kuka2yVbn9M15VVqGtnUkGcF5jM2HULRJ+JxIKcm4owG
 aZrpRUXbGhav5VaMgvM4FaDUd5TGLSbnQTmsp1e6NOVwWBWsMNQMwNaE3
 KN1L4SZa5PmCqbrOqAjPxW0NNU81ipssOZUCk+wZ8OcvShcwqKbs0CuKW
 TdnvYyRFuWX22BlGWXOrR9ihsVt3aFL15C/xqQWrKTAwB4zRdDmiE57b0
 4zD0Yu0UTMpYp4y0kEcgNNy1Ww++mJxeMrGqTz3PfTlJFB9o/vuSvAImr
 dbw3Tk//73JZPGEuqSznBnxJEQrFBm6gnHAiZRUfWqN09m4enVyb8NDtJ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="318569850"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="318569850"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 09:06:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="583316352"
Received: from rbrar-mobl.amr.corp.intel.com (HELO [10.251.31.171])
 ([10.251.31.171])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 09:06:55 -0700
Message-ID: <7e13767e-9a88-2cb6-d16b-4fdeeb746c2d@linux.intel.com>
Date: Tue, 22 Mar 2022 11:06:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: intel: atom: Remove superfluous
 flush_scheduled_work()
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20220322154826.19400-1-tiwai@suse.de>
 <f0e9071a-351d-40d0-35d7-8c5a7f2b78f7@linux.intel.com>
In-Reply-To: <f0e9071a-351d-40d0-35d7-8c5a7f2b78f7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>
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



On 3/22/22 10:57, Pierre-Louis Bossart wrote:
> 
> 
> On 3/22/22 10:48, Takashi Iwai wrote:
>> It seems that flush_scheduled_work() is called without any real
>> purpose at sst_context_cleanup() (the driver doesn't put works on the
>> global queue at all).  As the flush_schedule_work() function is going
>> to be abolished in near future, let's drop it now.
>>
>> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>> ---
>>   sound/soc/intel/atom/sst/sst.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/sound/soc/intel/atom/sst/sst.c 
>> b/sound/soc/intel/atom/sst/sst.c
>> index e21e11dac000..3a42d68c0247 100644
>> --- a/sound/soc/intel/atom/sst/sst.c
>> +++ b/sound/soc/intel/atom/sst/sst.c
>> @@ -360,7 +360,6 @@ void sst_context_cleanup(struct intel_sst_drv *ctx)
>>       sst_unregister(ctx->dev);
>>       sst_set_fw_state_locked(ctx, SST_SHUTDOWN);
>>       sysfs_remove_group(&ctx->dev->kobj, &sst_fw_version_attr_group);
>> -    flush_scheduled_work(); >       destroy_workqueue(ctx->post_msg_wq);
> 
> It could also be a confusion, there are calls to
> 
> flush_workqueue(ctx->post_msg_wq);
> 
> for suspend-resume, so wondering if the right sequence could be
> 
> flush_workqueue(ctx->post_msg_wq);
> destroy_workqueue(ctx->post_msg_wq);
> 
> ?

Never mind, answering to my own question, destroy_workqueue() calls 
drain_workqueue() which calls flush_workqueue() internally

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
>>       cpu_latency_qos_remove_request(ctx->qos);
>>       kfree(ctx->fw_sg_list.src);
