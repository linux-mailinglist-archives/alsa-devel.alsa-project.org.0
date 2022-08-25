Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBA05A13D6
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 16:38:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32F581614;
	Thu, 25 Aug 2022 16:37:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32F581614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661438276;
	bh=/y3fp64Y84mqoHz9wLswfR7VEygz7HcdXW/7bEoALks=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aLGPktGCOSqTnZTdr2BOdBsunMZt+pNrtqdEQzeAtQhqqsn4FxvOiYWsFWxCiYCdm
	 wAVv0KyYCjuvfojY0lpl0VAq9rDuqkIEP3t59a4G1+0LqYx9uH546n+YlFr2BoWYCL
	 TPBUbOwoiNuig1HrM8p3pJJf91fyR121zujP2II0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73826F8025A;
	Thu, 25 Aug 2022 16:36:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24CE0F80271; Thu, 25 Aug 2022 16:36:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E275F800C8
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 16:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E275F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UOXNGmkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661438208; x=1692974208;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/y3fp64Y84mqoHz9wLswfR7VEygz7HcdXW/7bEoALks=;
 b=UOXNGmkJ//dLWnvkUwYTNR/nX6QxSWr+hHWL1api4eqlwxASNCQIGqhW
 FMcOzzlk9pgoLQicAhQ5GIk/ifB72Z8JPJShuTd7aLFaawvoiJbNf2Kg5
 r5cpOxhM5JKRQerqItuOIRWVWSAuQgVw52E9hntFD3oYQ7e8R0oUP6NoI
 7c5pQWjEbMawQhFP1DZdVCKbMpHtxk+0aANOhhN7i+OIYt6SAHjT0bjNJ
 HmzyGypK0xQaP9V9eVStAPOC5jwEv2ufrdOw2WUF22THV3ZFWtpjJ4QZp
 ouMsDbEcwocOzpoVwJpUucsSS1qgl15PnJi9gUPCUePg81KJnCk3xsGH8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="320332706"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="320332706"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 07:36:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="938346393"
Received: from alanjaco-mobl3.gar.corp.intel.com (HELO [10.252.44.53])
 ([10.252.44.53])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 07:36:43 -0700
Message-ID: <718d6503-f284-2cd4-c0a0-b8e90547bee6@linux.intel.com>
Date: Thu, 25 Aug 2022 14:39:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] soundwire: bus: Don't lose unattach notifications
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <20220825122241.273090-1-rf@opensource.cirrus.com>
 <20220825122241.273090-3-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220825122241.273090-3-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, jack.yu@realtek.com
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



On 8/25/22 14:22, Richard Fitzgerald wrote:
> Ensure that if sdw_handle_slave_status() sees a peripheral
> has dropped off the bus it reports it to the client driver.
> 
> If there are any devices reporting on address 0 it bails out
> after programming the device IDs. So it never reaches the second
> loop that calls sdw_update_slave_status().
> 
> If the missing device is one that is now showing as unenumerated
> it has been given a device ID so will report as attached next
> time sdw_handle_slave_status() runs.
> 
> With the previous code the client driver would only see another
> ATTACHED notification because the UNATTACHED state was lost when
> sdw_handle_slave_status() bailed out after programming the
> device ID.
> 
> This shows up most when the peripheral has to be reset after
> downloading updated firmware and there are multiple of these
> peripherals on the bus. They will all return to unenumerated state
> after the reset, and then there is a mix of unattached, attached
> and unenumerated PING states from the peripherals, as each is reset
> and they reboot.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  drivers/soundwire/bus.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 704f75c0bae2..bb8ce26c68b3 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1756,6 +1756,11 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
>  			dev_warn(&slave->dev, "Slave %d state check1: UNATTACHED, status was %d\n",
>  				 i, slave->status);
>  			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
> +
> +			/* Ensure driver knows that peripheral unattached */
> +			ret = sdw_update_slave_status(slave, status[i]);
> +			if (ret < 0)
> +				dev_warn(&slave->dev, "Update Slave status failed:%d\n", ret);

This is indeed a good fix, this will make sure the driver will
re-initialize the device when it reports as ATTACHED again.

The codec driver needs to keep track on the UNATTACHED change though.

This is the case in all codec drivers except rt715 and rt715-sdca.
Something to change in a follow-up patch (cc: Jack Yu).

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

>  		}
>  	}
>  
