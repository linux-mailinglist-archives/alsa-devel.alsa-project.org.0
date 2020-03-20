Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E51B918CF25
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 14:40:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA1917D5;
	Fri, 20 Mar 2020 14:39:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA1917D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584711630;
	bh=lJF3p8wBmDcPt7q/ttSYu3J0rSwSBfMouALJLtfIRec=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=THcuJ9JHm80LZwZIC9hF0Da+kIu0DCfZ9JLgnuTmOI1m80ei1ZH+EGHI/8IZ1/ebk
	 yJsecddr/WeJuyVUHGPBlX5HsQZhXG8EyGXcd12cc4x5X2Hxun1wRBXQn1S9bNk8n5
	 C82kFr+p4D3NPscBZWBx9zjQnaIJYBmYnxQcler0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D82BF80162;
	Fri, 20 Mar 2020 14:38:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80C66F8015B; Fri, 20 Mar 2020 14:38:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61826F800DD
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 14:38:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61826F800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bgk4sals"
Received: from localhost (unknown [122.167.82.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2EE5D20739;
 Fri, 20 Mar 2020 13:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584711519;
 bh=lJF3p8wBmDcPt7q/ttSYu3J0rSwSBfMouALJLtfIRec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bgk4salsY3Fwi2RzwNkN/s40VAPuS25fuKUhR89286TkBkN8BVsg/VKixsEHWV+Ub
 Hi0jhXQsIZEwXLTBKu1gbNZtDRywKU8Ax3Pg/BeC/5X/vblZdU2wpeN1hFv8l6g+C2
 UscdLToEAS/KZ5+J/IkBkv9VTkxVUaEz2LCQnT5I=
Date: Fri, 20 Mar 2020 19:08:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/7] soundwire: intel: reuse code for wait loops to
 set/clear bits
Message-ID: <20200320133834.GB4885@vkoul-mobl>
References: <20200311221026.18174-1-pierre-louis.bossart@linux.intel.com>
 <20200311221026.18174-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311221026.18174-3-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 11-03-20, 17:10, Pierre-Louis Bossart wrote:
> Refactor code and use same routines on set/clear
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 45 +++++++++++++++++----------------------
>  1 file changed, 19 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 28a8563c4e0f..1a3b828b03a1 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -134,40 +134,33 @@ static inline void intel_writew(void __iomem *base, int offset, u16 value)
>  	writew(value, base + offset);
>  }
>  
> +static int intel_wait_bit(void __iomem *base, int offset, u32 mask, u32 target)
> +{
> +	int timeout = 10;
> +	u32 reg_read;
> +
> +	do {
> +		reg_read = readl(base + offset);
> +		if ((reg_read & mask) == target)
> +			return 0;
> +
> +		timeout--;
> +		udelay(50);

This should use udelay_range, but this can be different patch as this is
code move, so okay

> +	} while (timeout != 0);
> +
> +	return -EAGAIN;
> +}
> +
>  static int intel_clear_bit(void __iomem *base, int offset, u32 value, u32 mask)
>  {
> -	int timeout = 10;
> -	u32 reg_read;
> -
>  	writel(value, base + offset);
> -	do {
> -		reg_read = readl(base + offset);
> -		if (!(reg_read & mask))
> -			return 0;
> -
> -		timeout--;
> -		udelay(50);
> -	} while (timeout != 0);
> -
> -	return -EAGAIN;
> +	return intel_wait_bit(base, offset, mask, 0);
>  }
>  
>  static int intel_set_bit(void __iomem *base, int offset, u32 value, u32 mask)
>  {
> -	int timeout = 10;
> -	u32 reg_read;
> -
>  	writel(value, base + offset);
> -	do {
> -		reg_read = readl(base + offset);
> -		if (reg_read & mask)
> -			return 0;
> -
> -		timeout--;
> -		udelay(50);
> -	} while (timeout != 0);
> -
> -	return -EAGAIN;
> +	return intel_wait_bit(base, offset, mask, mask);
>  }
>  
>  /*
> -- 
> 2.20.1

-- 
~Vinod
