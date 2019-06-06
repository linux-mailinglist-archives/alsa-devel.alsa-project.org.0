Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67562376B1
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 16:30:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C934486E;
	Thu,  6 Jun 2019 16:29:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C934486E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559831418;
	bh=qVfIWN5CYinrMcw8R6RJb4SyK0pGLuArR432F9qEGf4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d2bzsMj0U2tdb197rUyrINI4/L1CP6kjNCNPeCOC96J2Xd/zyrGoX/wNFDYla9Lb5
	 gb/nU4I83DJPsr9yuF6LgqfyFt/p2X6WEEa57OS2yoYMN6fRZ/SLZdIZeG7t1Yqcju
	 y+JhYj+B4dqUJrUd9B6LghyKP2g/4YZrKvaQIrWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B11F896FE;
	Thu,  6 Jun 2019 16:28:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67E18F896F7; Thu,  6 Jun 2019 16:28:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB39BF8072A
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 16:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB39BF8072A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 07:28:24 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 06 Jun 2019 07:28:24 -0700
Received: from kwong4-mobl.amr.corp.intel.com (unknown [10.252.203.122])
 by linux.intel.com (Postfix) with ESMTP id 7B109580490;
 Thu,  6 Jun 2019 07:28:23 -0700 (PDT)
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20190606112222.16502-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9427a73a-e09a-4a9c-7690-271d2e2e1024@linux.intel.com>
Date: Thu, 6 Jun 2019 09:28:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606112222.16502-1-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2] soundwire: stream: fix bad unlock
	balance
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

On 6/6/19 6:22 AM, Srinivas Kandagatla wrote:
> multi bank switching code takes lock on condition but releases without
> any check resulting in below warning.
> This patch fixes this.


Question to make sure we are talking about the same thing: multi-link 
bank switching is a capability beyond the scope of the SoundWire spec 
which requires hardware support to synchronize links and as Sanyog 
hinted at in a previous email follow a different flow for bank switches.

You would not use the multi-link mode if you have different links that 
can operate independently and have no synchronization requirement. You 
would conversely use the multi-link mode if you have two devices on the 
same type on different links and want audio to be rendered at the same time.

Can you clarify if indeed you were using the full-blown multi-link mode 
with hardware synchronization or a regular single-link operation? I am 
not asking for details of your test hardware, just trying to reconstruct 
the program flow leading to this problem.

It could also be that your commit message was meant to say:
"the msg lock is taken for multi-link cases only but released 
unconditionally, leading to an unlock balance warning for single-link 
usages"?

Thanks!

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
> index ce9cb7fa4724..73c52cd4fec8 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -814,7 +814,8 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
>   			goto error;
>   		}
>   
> -		mutex_unlock(&bus->msg_lock);
> +		if (bus->multi_link)
> +			mutex_unlock(&bus->msg_lock);
>   	}
>   
>   	return ret;
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
