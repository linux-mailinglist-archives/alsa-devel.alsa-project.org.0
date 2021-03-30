Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F25E34E35B
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 10:42:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A18751682;
	Tue, 30 Mar 2021 10:41:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A18751682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617093739;
	bh=5vjWHQpNnWwzD+C6Uz33hAqzurkp949O30Cxa1ACg+s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JT0NAL2AclHOURlZvYiR1wgfFHSSynm06gxvTooux6pGF/b2S6hYUGxJC5VhaIJPC
	 Qe0W2MyOcW3P9eNm6E7Z2S+S75yNs6sp/g1faV2T4o7qWQ/c1AWUZkMVlFB5nNp3mo
	 IuleQI87aPoH3ioiR3b1M+x7DhyEiDIlWzOSIVo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD3F7F8026B;
	Tue, 30 Mar 2021 10:40:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB77FF80240; Tue, 30 Mar 2021 10:40:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94231F80141
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 10:40:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94231F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o4xqREtM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44B886198F;
 Tue, 30 Mar 2021 08:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617093640;
 bh=5vjWHQpNnWwzD+C6Uz33hAqzurkp949O30Cxa1ACg+s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o4xqREtMQ8bpOCp6JwQ/3PzO7VMBuDSe7ZnSjC6GYVtJ6HrzoEKwDVAgVYngc550c
 yCkq/FDploTzNru+QMIPcLrXIN5xQexxLy/aQW+bas9TDRAkth582KEpNHu4TQ7jxd
 m/Ja/WBc8YHofa5W1SCk8BYlUgp6ltyaR5f2+d19vgifk7Hztcxi89s+WDEI9/2ajJ
 nUrRHJqp2WwRIKKgI+VjaMk+8124TloR2JctPrPHh4ZW/KcZUCN34147qu0Ya6uYWJ
 fLevnAqIpW0TNYczFYW2MOaJE+desJ0bnflqoCtsJNnpN7UDmgKHXKgk6oODRSNYZL
 td6WS0Mj+hJzA==
Date: Tue, 30 Mar 2021 14:10:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v5 5/9] soundwire: qcom: update register read/write routine
Message-ID: <YGLkA3p634eg9FDl@vkoul-mobl.Dlink>
References: <20210326063944.31683-1-srinivas.kandagatla@linaro.org>
 <20210326063944.31683-6-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326063944.31683-6-srinivas.kandagatla@linaro.org>
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

On 26-03-21, 06:39, Srinivas Kandagatla wrote:

> +	swrm->reg_write(swrm, SWRM_CMD_FIFO_WR_CMD, val);
> +
> +	/* version 1.3 or less */
> +	if (swrm->version <= 0x01030000)
> +		usleep_range(150, 155);
> +
> +	if (cmd_id == SWR_BROADCAST_CMD_ID) {
> +		/*
> +		 * sleep for 10ms for MSM soundwire variant to allow broadcast
> +		 * command to complete.
> +		 */
> +		ret = wait_for_completion_timeout(&swrm->broadcast,
> +						  msecs_to_jiffies(TIMEOUT_MS));
> +		if (!ret)
> +			ret = SDW_CMD_IGNORED;
> +		else
> +			ret = SDW_CMD_OK;
>  
> -	if (!ret) {
> -		ret = SDW_CMD_IGNORED;
> -		goto err;
>  	} else {
>  		ret = SDW_CMD_OK;
>  	}

Maybe add a comment here that we dont get status so write is assumed to
be OK

-- 
~Vinod
