Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DDD6E6A1D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 18:48:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80843E81;
	Tue, 18 Apr 2023 18:48:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80843E81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681836532;
	bh=mv5aeyc9AF/wZVIT6x7Ib/pmfKZsMj/o3PD+5kYSdd8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qUyGBkR+AU9yuFPVMUIGjmoX6fcoP9J6Rilou2lQsR+/qhIkd1RnkXEfT9X6/3UNc
	 ytf9uDuXAgx1Qed9OtSRuUtXtIGnPFStmO6L7P2dy0u8tPc8bMYXpRhEvREYd7vNP/
	 0E0398A6P1tg7Jz4ju5h3khOiY0yJiMFqOAF6dk0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4282F80149;
	Tue, 18 Apr 2023 18:48:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DE59F80155; Tue, 18 Apr 2023 18:47:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF989F800F8
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 18:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF989F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LeWkOIRp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681836470; x=1713372470;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mv5aeyc9AF/wZVIT6x7Ib/pmfKZsMj/o3PD+5kYSdd8=;
  b=LeWkOIRpQCfgAGYiz08/mEwxh+jGa1eOCB9TukbCE9V5o/ElgV51FdWo
   33eSxPXShdkknFxC+X45XZEpKZCuD7z12zTxKjf65SQSrVjfmLNiIxZRw
   hzMJKB9Y/0iRDauPrJN2takG3wizeXx1zsiT3/SBh2r0jtPTc72UFdGPX
   oh36RHAdQD+O2yzr2WsnPgyS7Ifv2PW8IPFLEv3KSjQxdqZI7qas8TURH
   LUBebfKL7oxStCj9T0wZJWQteqRgtDFCRIBQQ0rdVRYGgQLhhVISInNfS
   eUvir5W+gq0XnJh1Dp7obNbwWolV+/0QYoaTRWNgsyaxGJRfjpseCpq2L
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="431510747"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200";
   d="scan'208";a="431510747"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 09:47:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="780546182"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200";
   d="scan'208";a="780546182"
Received: from rdfoulge-mobl.amr.corp.intel.com (HELO [10.209.38.230])
 ([10.209.38.230])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 09:47:44 -0700
Message-ID: <3e1b86fb-0a3f-6dce-b3b4-6ee3971fb61d@linux.intel.com>
Date: Tue, 18 Apr 2023 10:45:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH v2] soundwire: bus: Don't filter slave alerts
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
References: <20230418140650.297279-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230418140650.297279-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RT6B2AGS2FFKS3XZJMZWB576GBFE6P4O
X-Message-ID-Hash: RT6B2AGS2FFKS3XZJMZWB576GBFE6P4O
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RT6B2AGS2FFKS3XZJMZWB576GBFE6P4O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/18/23 09:06, Charles Keepax wrote:
> It makes sense to have only a single point responsible for ensuring
> that all currently pending IRQs are handled. The current code in
> sdw_handle_slave_alerts confusingly splits this process in two.  This
> code will loop until the asserted IRQs are cleared but it will only
> handle IRQs that were already asserted when it was called. This
> means the caller must also loop (either manually, or through its IRQ
> mechanism) until the IRQs are all handled. It makes sense to either do
> all the looping in sdw_handle_slave_alerts or do no looping there and
> let the host controller repeatedly call it until things are handled.
> 
> There are realistically two sensible host controllers, those that
> will generate an IRQ when the alert status changes and those
> that will generate an IRQ continuously whilst the alert status
> is high. The current code will work fine for the second of those
> systems but not the first with out additional looping in the host
> controller.  Removing the code that filters out new IRQs whilst
> the handler is running enables both types of host controller to be
> supported and simplifies the code. The code will still only loop up to
> SDW_READ_INTR_CLEAR_RETRY times, so it shouldn't be possible for it to
> get completely stuck handling IRQs forever, and if you are generating
> IRQs faster than you can handle them you likely have bigger problems
> anyway.
> 
> This fixes an issue on the Cadence SoundWire IP, which only generates
> IRQs on an alert status change, where an alert which arrives whilst
> another alert is being handled will never be handled and will block
> all future alerts from being handled.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Makes sense to me, thanks for the patch.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
> 
> Changes since v1:
>  - Update commit message
> 
> Thanks,
> Charles
> 
>  drivers/soundwire/bus.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 1ea6a64f8c4a5..338f4f0b5d0cc 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1588,7 +1588,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>  	unsigned long port;
>  	bool slave_notify;
>  	u8 sdca_cascade = 0;
> -	u8 buf, buf2[2], _buf, _buf2[2];
> +	u8 buf, buf2[2];
>  	bool parity_check;
>  	bool parity_quirk;
>  
> @@ -1745,9 +1745,9 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
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
> @@ -1765,12 +1765,8 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
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
