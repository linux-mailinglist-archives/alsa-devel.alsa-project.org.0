Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAAF258D24
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 13:04:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35288178D;
	Tue,  1 Sep 2020 13:03:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35288178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598958286;
	bh=QCYSdtAYLN+f++6XyOMvY/CKpRVLzqQUReDYKl7Tmk0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fQ2zUDTUgQuzxOW3pObC5lysne2PYEyvi88w94iPLfVsNPtiF4bMtTMu1axtXo8dg
	 wVNZqdFb6FD09J5GV/GcsG9mF58bNSnrFmBD9+SRZBKfNrMgpIt10NPZenjOrHtUgT
	 xk/XiE1QNJelHkJRcQDJfBnpz/QS594JXSJGtZOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46045F8021D;
	Tue,  1 Sep 2020 13:03:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57D32F80217; Tue,  1 Sep 2020 13:03:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E15CF801DA
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 13:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E15CF801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QFCek2P9"
Received: from localhost (unknown [122.172.190.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39CA6206EF;
 Tue,  1 Sep 2020 11:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598958174;
 bh=QCYSdtAYLN+f++6XyOMvY/CKpRVLzqQUReDYKl7Tmk0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QFCek2P99Re/uJ+lbJOk+hM/WTo83VuQDJl5MTmEiSpeXuOMZHVVAFJLw4Qt1XJiJ
 8+Wb77oxTGWzZ7wN5uNn3ob2xbEdF+8vDxWmwEqr5N1tWHkdaDYZkepuJf2b8OICc3
 Yu8TDwfe2ld3easguiL64mePN/51/9jhV1b5ueno=
Date: Tue, 1 Sep 2020 16:32:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: trix@redhat.com
Subject: Re: [PATCH] soundwire: fix error handling
Message-ID: <20200901110244.GZ2639@vkoul-mobl>
References: <20200829153515.3840-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200829153515.3840-1-trix@redhat.com>
Cc: alsa-devel@alsa-project.org, ndesaulniers@google.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 shreyas.nc@intel.com, natechancellor@gmail.com,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
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

Hello Tom,

On 29-08-20, 08:35, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analysis flags this problem
> 
> stream.c:844:9: warning: Use of memory after
>   it is freed
>         kfree(bus->defer_msg.msg->buf);
>               ^~~~~~~~~~~~~~~~~~~~~~~
> 
> This happens in an error handler cleaning up memory
> allocated for elements in a list.
> 
> 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
> 		bus = m_rt->bus;
> 
> 		kfree(bus->defer_msg.msg->buf);
> 		kfree(bus->defer_msg.msg);
> 	}
> 
> And is triggered when the call to sdw_bank_switch() fails.
> There are a two problems.
> 
> First, when sdw_bank_switch() fails, though it frees memory it
> does not clear bus's reference 'defer_msg.msg' to that memory.
> 
> The second problem is the freeing msg->buf. In some cases
> msg will be NULL so this will dereference a null pointer.
> Need to check before freeing.

The change looks good to me, but the title of patch should be revised.

The patch subject should describe the patch, in this case is setting
pointer to null on cleanup, so an appropriate subject may be"
"[PATCH]: soundwire: set defer_msg to null".

Please revise subject line and update including the ack/reviews
received

Thanks
> 
> Fixes: 99b8a5d608a6 ("soundwire: Add bank switch routine")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/soundwire/stream.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 37290a799023..6e36deb505b1 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -717,6 +717,7 @@ static int sdw_bank_switch(struct sdw_bus *bus, int m_rt_count)
>  	kfree(wbuf);
>  error_1:
>  	kfree(wr_msg);
> +	bus->defer_msg.msg = NULL;
>  	return ret;
>  }
>  
> @@ -840,9 +841,10 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
>  error:
>  	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
>  		bus = m_rt->bus;
> -
> -		kfree(bus->defer_msg.msg->buf);
> -		kfree(bus->defer_msg.msg);
> +		if (bus->defer_msg.msg) {
> +			kfree(bus->defer_msg.msg->buf);
> +			kfree(bus->defer_msg.msg);
> +		}
>  	}
>  
>  msg_unlock:
> -- 
> 2.18.1

-- 
~Vinod
