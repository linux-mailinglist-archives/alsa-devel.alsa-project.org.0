Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB86742A7BA
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 16:56:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AEC71693;
	Tue, 12 Oct 2021 16:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AEC71693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634050614;
	bh=xoi/R3Hvar/BdYNxIp/slBUDni265xptAEqo9yRGcE0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XToGwk2C89XxLxgzA59Ev3zvYoG7buxfXTWa1Mjgfk/qY7NGj3rxAJIamLzQnEBBH
	 dILE0UwuAr/lYw2mxjr6v9Lc0U/esh+5Q2DkZK+F92Vc+5Uk9v7bri8sCWrJQXAVbC
	 40+hLCRNYx7aLZdv+TP/39VJdGVuR4R4ZkhjjDZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EACEF804AD;
	Tue, 12 Oct 2021 16:55:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A63CF8032D; Tue, 12 Oct 2021 16:55:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F083AF800C0
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 16:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F083AF800C0
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="290662533"
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="290662533"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 07:54:53 -0700
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="486417496"
Received: from csharp1-mobl.amr.corp.intel.com (HELO [10.213.183.127])
 ([10.213.183.127])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 07:54:52 -0700
Subject: Re: [PATCH] soundwire: bus: stop dereferencing invalid slave pointer
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20211012101521.32087-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cb1d0d1d-100f-48b7-f809-7c84148ae0ba@linux.intel.com>
Date: Tue, 12 Oct 2021 08:32:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012101521.32087-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, rander.wang@intel.com, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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



On 10/12/21 5:15 AM, Srinivas Kandagatla wrote:
> Slave pointer is invalid after end of list iteration, using this
> would result in below Memory abort.
> 
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000004
> ...
> Call trace:
>  __dev_printk+0x34/0x7c
>  _dev_warn+0x6c/0x90
>  sdw_bus_exit_clk_stop+0x194/0x1d0
>  swrm_runtime_resume+0x13c/0x238
>  pm_generic_runtime_resume+0x2c/0x48
>  __rpm_callback+0x44/0x150
>  rpm_callback+0x6c/0x78
>  rpm_resume+0x314/0x558
>  rpm_resume+0x378/0x558
>  rpm_resume+0x378/0x558
>  __pm_runtime_resume+0x3c/0x88
> 
> Use bus->dev instead to print this error message.
> 
> Fixes: b50bb8ba369cd ("soundwire: bus: handle -ENODATA errors in clock stop/start sequences")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Nice catch, even if the 'slave' pointer was valid it makes no sense to
use this device for a bus-level operation. Using the bus->dev is the
right thing to do.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  drivers/soundwire/bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 1b115734a8f6..67369e941d0d 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1110,7 +1110,7 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
>  	if (!simple_clk_stop) {
>  		ret = sdw_bus_wait_for_clk_prep_deprep(bus, SDW_BROADCAST_DEV_NUM);
>  		if (ret < 0)
> -			dev_warn(&slave->dev, "clock stop deprepare wait failed:%d\n", ret);
> +			dev_warn(bus->dev, "clock stop deprepare wait failed:%d\n", ret);
>  	}
>  
>  	list_for_each_entry(slave, &bus->slaves, node) {
> 
