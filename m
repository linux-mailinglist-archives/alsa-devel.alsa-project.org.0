Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6B825FBE8
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 16:16:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C345A178A;
	Mon,  7 Sep 2020 16:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C345A178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599488161;
	bh=txf6Aio9R53YCpE68YY0DvhEiaYvffb68hp9MwsZtds=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ecrrALdFoYdo+JUwz3MU1aeuKhn2kFpz5iX5GXtHIzincTj94vjEtweEtDnPp7ruu
	 abDTAR51h6gBJ+CWDk8z08dlsWumQRfJVyGXKwAkWJVZMNXiKdRj2P8jyNqsEgvo78
	 DAGBaOY9eE4fVx6udNm/SrhesU5OznYAxH8PXlPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41230F800B9;
	Mon,  7 Sep 2020 16:14:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9380BF80227; Mon,  7 Sep 2020 16:14:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7712F800B9
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 16:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7712F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f1Skm40O"
Received: from localhost (unknown [122.167.151.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C5762064B;
 Mon,  7 Sep 2020 14:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599488048;
 bh=txf6Aio9R53YCpE68YY0DvhEiaYvffb68hp9MwsZtds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f1Skm40OOG7qD2Nw8rttcooQx/f2OkkHe2QfXql+TqkgFDZbaZx83IkJKWWZ7Om2t
 W3pqYj+jnnEFkkHha3NCo5lKHtyKwCwCODphADNfLwXw/s/cZpyGna3AI7KDS0PifV
 K4feqAhde7poE89ZyoGKU9RsgNSxbhM6u3/H3puc=
Date: Mon, 7 Sep 2020 19:44:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: trix@redhat.com
Subject: Re: [PATCH] soundwire: stream: fix an invalid free
Message-ID: <20200907141402.GC2639@vkoul-mobl>
References: <20200905192613.420-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200905192613.420-1-trix@redhat.com>
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, ndesaulniers@google.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, natechancellor@gmail.com,
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

On 05-09-20, 12:26, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analyzer reports this problem
> 
> stream.c:872:2: warning: Argument to kfree() is a constant
>   address (18446744073709551092), which is not memory
>   allocated by malloc()
>         kfree(stream);
>         ^~~~~~~~~~~~~
> 
> In sdw_shutdown_stream() the stream to free is set by
> a call to snd_soc_dai_get_sdw_stream().  The problem block
> is the check if the call was successful.
> 
> 	if (!sdw_stream) {
> 		dev_err(rtd->dev, "no stream found...
> 		return;
> 	}
> 
> When snd_soc_dai_get_sdw_stream() fails, it does not
> always return null, sometimes it returns -ENOTSUPP.
> 
> So also check for error codes.
> Fixes: 4550569bd779 ("soundwire: stream: add helper to startup/shutdown streams")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/soundwire/stream.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 6e36deb505b1..950231d593c2 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1913,7 +1913,7 @@ void sdw_shutdown_stream(void *sdw_substream)
>  
>  	sdw_stream = snd_soc_dai_get_sdw_stream(dai, substream->stream);
>  
> -	if (!sdw_stream) {
> +	if (IS_ERR_OR_NULL(sdw_stream)) {

Thanks for the patch. Please see commit 3471d2a192ba ("soundwire:
stream: fix NULL/IS_ERR confusion") in soundwire-next. This has already
been updated to IS_ERR() and Bard has already sent patches for
snd_soc_dai_get_sdw_stream() to return proper values.

So I you can rerun this on next, you should see this fixed.

-- 
~Vinod
