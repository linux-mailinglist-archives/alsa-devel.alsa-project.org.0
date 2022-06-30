Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 209CC565350
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:26:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 628E21736;
	Mon,  4 Jul 2022 13:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 628E21736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656933988;
	bh=AeHi61WsIJAmFsEU0j7KjinoFRAELD1Z5s+ZxYgSLyY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RsaD3rvLXqC8rCK/hTQHI56dEvg0tZGpVNKQZXXwmmoUCNBWsY3skOCtY9nc1WYdV
	 X/FyFbVzCfThHqZf6aEbkATpnCVho3Wb6sIyJhHyuluhnbyJdtCY4im5n6tiq4QlFb
	 2iFdN+sogPBpKxeLj5dlVdJShw8Q07B8AJ7IuOmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 504BFF80567;
	Mon,  4 Jul 2022 13:23:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D10DF804EB; Thu, 30 Jun 2022 09:02:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFD91F800F5
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 09:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD91F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="H1XwlJe2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656572522; x=1688108522;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AeHi61WsIJAmFsEU0j7KjinoFRAELD1Z5s+ZxYgSLyY=;
 b=H1XwlJe233YOkZLUp7dqEiB8vjXbfVp5WQvkM5pyWiBH3fObtthCsrFz
 wcRg7AhSsZ7tmXbgj+W45mkl9gNuCLp22EEJ0h5UKShexcGQqrEMQtsuF
 OnvFU9H4PlcT23Myn9UeR/XrZ7zUYfw7E23vxUt8TMEtK8xm1M+vnION0
 h1um47J8leGthwM7jgC6JAjLKdDnaS/LABnUTYV9YsI6A8r2IeKta/k0d
 ARWvX7v0FlfnF38WLXKsSSTg8i0W3HOeRa2pX+gpuSw9PQp/ucW+uvECA
 IBrzZPVUk8bTGAHuVa8AFseYceez2wvppnxp7K4/84FQZIyfJD2yvF5LW w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="282999688"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="282999688"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 00:01:56 -0700
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="647761832"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.217.92])
 ([10.251.217.92])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 00:01:49 -0700
Message-ID: <83341d51-6c63-4b37-2f02-b3f305930308@linux.intel.com>
Date: Thu, 30 Jun 2022 09:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] Fix: SYNCOBJ TIMELINE Test failed.
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 jie1zhan <jesse.zhang@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220629060236.3283445-1-jesse.zhang@amd.com>
 <8499b1f1-cd39-5cb4-9fac-735e68393556@amd.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <8499b1f1-cd39-5cb4-9fac-735e68393556@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:03 +0200
Cc: Sunil-kumar.Dommati@amd.com, Daniel Vetter <daniel@ffwll.ch>,
 ajitkumar.pandey@amd.com, David Airlie <airlied@linux.ie>,
 Basavaraj.Hiregoudar@amd.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vijendar.Mukunda@amd.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
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


On 6/29/2022 11:12 AM, Christian König wrote:
> Am 29.06.22 um 08:02 schrieb jie1zhan:
>>   The issue cause by the commit :
>>
>> 721255b527(drm/syncobj: flatten dma_fence_chains on transfer).
>>
>> Because it use the point of dma_fence incorrectly
>>
>> Correct the point of dma_fence by fence array
>
> Well that patch is just utterly nonsense as far as I can see.
>
>>
>> Signed-off-by: jie1zhan <jesse.zhang@amd.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Reviewed-by: Nirmoy Das <nirmoy.das@linux.intel.com>
>
> I have strong doubts that Nirmoy has reviewed this and I certainly 
> haven't reviewed it.


I haven't  reviewed this either.


Nirmoy

>
> Christian.
>
>> ---
>>   drivers/gpu/drm/drm_syncobj.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_syncobj.c 
>> b/drivers/gpu/drm/drm_syncobj.c
>> index 7e48dcd1bee4..d5db818f1c76 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -887,7 +887,7 @@ static int drm_syncobj_flatten_chain(struct 
>> dma_fence **f)
>>           goto free_fences;
>>         dma_fence_put(*f);
>> -    *f = &array->base;
>> +    *f = array->fences[0];
>>       return 0;
>>     free_fences:
>
