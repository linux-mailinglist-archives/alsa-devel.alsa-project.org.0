Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C461673FEC
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 18:28:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2BC63628;
	Thu, 19 Jan 2023 18:27:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2BC63628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674149299;
	bh=hvKnPzV818Q2MTrJsqR3kbZNsGKViKmjEv5oxYAd76U=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BfuYoYsdZHB1kLailknWPw56GslYndx/M44YIr+8+J8tzFWjZ5FGFDSKrjOVxSiZ6
	 MYv/DMOYnACEfWb1FbQk+/06V9Lv/wgI9IaePfPlp/hlS486UPlfpjEp2wuHnhEufW
	 wEmObcholMYjO6iblD96IMHkAKVcNYGgotWl1SF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2968DF80083;
	Thu, 19 Jan 2023 18:27:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29ED4F8047B; Thu, 19 Jan 2023 18:27:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0EE0F80083
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 18:27:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0EE0F80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SLpkTRgh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674149240; x=1705685240;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hvKnPzV818Q2MTrJsqR3kbZNsGKViKmjEv5oxYAd76U=;
 b=SLpkTRghd6DTKLUWJTYiSEkoqVvGHbTYrE9hm9QujqAqpABj315pvtkn
 BPJxOgbvHg/VwAn++bKiBMkRX52Y6qUWc4oLWdogvD0oSByVpxl1Q0uhO
 vIFVRHHZ1lPzzCbgwTmyz/r+hpE1ljcEdcnu8O0cGpctB8EYlRF8ykRHp
 jxJcSCy+Z77uaTNTWi5qIDidosBWBZl3NlUl6S+yfm4XGKRmCFYnbfRQC
 PdlgZ9/RTzPVIHl+3aH38Xpzo/axkKkcOzORBwP5BK0Zl67nOn4PK15t7
 bT5cpzBG1OxVoucASEBaIZw78CaGd+Aa+rYo12SRJ9JAwIhpZl+Eahqt6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="313243573"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="313243573"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 09:27:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="905621057"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="905621057"
Received: from sahamad-mobl1.amr.corp.intel.com (HELO [10.213.187.97])
 ([10.213.187.97])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 09:27:15 -0800
Message-ID: <db571218-1adb-cb46-5b76-55eaf379f6ca@linux.intel.com>
Date: Thu, 19 Jan 2023 11:27:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] soundwire: bus: Don't filter slave alerts
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
References: <20230119165104.3433290-1-ckeepax@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230119165104.3433290-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/19/23 10:51, Charles Keepax wrote:
> Currently the SoundWire core will loop handling slave alerts but it will
> only handle those present when the alert was first raised. This causes
> some issues with the Cadence SoundWire IP, which only generates an IRQ
> when alert changes state. This means that if a new alert arrives whilst
> old alerts are being handled it will not be handled in the currently
> loop and then no further alerts will be processed since alert never
> changes state to trigger a new IRQ.
> 
> Correct this issue by allowing the core to handle all pending alerts in
> the IRQ handling loop. The code will still only loop up to
> SDW_READ_INTR_CLEAR_RETRY times, so it shouldn't be possible for it get
> completely stuck and if you are generating IRQs faster than you can
> handle them you likely have bigger problems anyway.

The change makes sense, but it's a bit odd to change the way the
interrupts are handled because of a specific design. The bus should be
able to deal with various designs, not force a one-size-fits-all policy
that may not be quite right in all cases.

Could we have a new flag at the bus level that says that peripheral
interrupts are not filtered, and set if for the Intel case?

We could similarly make the SDW_READ_INTR_CLEAR_RETRY constant
bus/platform specific. The SoundWire spec mandates that we re-read the
status after clearing the interrupt, but it doesn't say how to deal with
recurring interrupts.

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/soundwire/bus.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 633d411b64f35..daee2cca94a4d 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1560,7 +1560,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>  	unsigned long port;
>  	bool slave_notify;
>  	u8 sdca_cascade = 0;
> -	u8 buf, buf2[2], _buf, _buf2[2];
> +	u8 buf, buf2[2];
>  	bool parity_check;
>  	bool parity_quirk;
>  
> @@ -1716,9 +1716,9 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>  				"SDW_SCP_INT1 recheck read failed:%d\n", ret);
>  			goto io_err;
>  		}
> -		_buf = ret;
> +		buf = ret;
>  
> -		ret = sdw_nread_no_pm(slave, SDW_SCP_INTSTAT2, 2, _buf2);
> +		ret = sdw_nread_no_pm(slave, SDW_SCP_INTSTAT2, 2, buf2);
>  		if (ret < 0) {
>  			dev_err(&slave->dev,
>  				"SDW_SCP_INT2/3 recheck read failed:%d\n", ret);
> @@ -1736,12 +1736,8 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>  		}
>  
>  		/*
> -		 * Make sure no interrupts are pending, but filter to limit loop
> -		 * to interrupts identified in the first status read
> +		 * Make sure no interrupts are pending
>  		 */
> -		buf &= _buf;
> -		buf2[0] &= _buf2[0];
> -		buf2[1] &= _buf2[1];
>  		stat = buf || buf2[0] || buf2[1] || sdca_cascade;
>  
>  		/*
