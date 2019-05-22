Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1EF2688B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 18:43:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4EF11664;
	Wed, 22 May 2019 18:42:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4EF11664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558543412;
	bh=77WejjrWY8EDZ56DFMhnofFSmsuKVCglNrGF/TtyRI4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TdC3POUYDHGT+FzGzGINVHHnntZYjoxteUA3xBtS4VcpaqFzQY/NllhXrICWdFdbE
	 l72mFRU5V23xlp5o1Z8OfTdiRQs2oiRPXHk22PlzviBLeo10SDbVEJah0DmEYyyJPY
	 6qvbXcYJiSic7reY8d2CeruVT5oBJVTn2mh4XQgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9C99F89630;
	Wed, 22 May 2019 18:41:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C97A0F8962C; Wed, 22 May 2019 18:41:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42E67F8079B
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 18:41:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42E67F8079B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 09:41:39 -0700
X-ExtLoop1: 1
Received: from sydneywa-mobl1.amr.corp.intel.com (HELO [10.252.132.240])
 ([10.252.132.240])
 by orsmga004.jf.intel.com with ESMTP; 22 May 2019 09:41:38 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20190522162528.5892-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4744834c-36b1-dd8d-45fa-76c75eb3d5cb@linux.intel.com>
Date: Wed, 22 May 2019 11:41:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522162528.5892-1-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] soundwire: stream: fix bad unlock balance
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



On 5/22/19 11:25 AM, Srinivas Kandagatla wrote:
> This patch fixes below warning due to unlocking without locking.
> 
>   =====================================
>   WARNING: bad unlock balance detected!
>   5.1.0-16506-gc1c383a6f0a2-dirty #1523 Tainted: G        W
>   -------------------------------------
>   aplay/2954 is trying to release lock (&bus->msg_lock) at:
>   do_bank_switch+0x21c/0x480
>   but there are no more locks to release!
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   drivers/soundwire/stream.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 544925ff0b40..d16268f30e4f 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -814,7 +814,8 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
>   			goto error;
>   		}
>   
> -		mutex_unlock(&bus->msg_lock);
> +		if (mutex_is_locked(&bus->msg_lock))
> +			utex_unlock(&bus->msg_lock);

Does this even compile? should be mutex_unlock, no?

We also may want to identify the issue in more details without pushing 
it under the rug. The locking mechanism is far from simple and it's 
likely there are a number of problems with it.

>   	}
>   
>   	return ret;
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
