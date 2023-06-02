Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9291372077E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 18:25:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19581820;
	Fri,  2 Jun 2023 18:24:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19581820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685723114;
	bh=sF8tH3G/ocxW4x77NN0zlyUDCOV5pH0gtR7CSxkyAIw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZEjvstBmR/c5GQ6KrNc0kX8xoi93OepCqSUK6SDwweLMyxZzsZFuHwkmwaLrCNU4I
	 elrCpYbdvuBiHdhWpSe3F844aFfCtL6JJaCJZZSAj7tZpIpNNwGpkxqiDskHhuo0P2
	 iKt+QwYWDEKxXNMJARzfbe2CA4PaPpiabVelsb4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41A2EF8055C; Fri,  2 Jun 2023 18:23:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E89CCF80549;
	Fri,  2 Jun 2023 18:23:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 402BCF80199; Fri,  2 Jun 2023 18:23:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79F3CF80132
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 18:23:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79F3CF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TgVjFK41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685723008; x=1717259008;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sF8tH3G/ocxW4x77NN0zlyUDCOV5pH0gtR7CSxkyAIw=;
  b=TgVjFK411Wt4HKK4uZmBqoeH+5RMd5jaUUosFnBMiElqPShtOJTrG7Pc
   KsV8GyBUVl/1HspcIq5k9gdeEgViwfEdqluR9uA60wN89NDzdL1g8AaZC
   sP1qnM3HrUV496WSyn3L1zsawyZoU3aMLtkejQIfGAzXqXiSB8op7MKSG
   zsxUbfB1f5ip2FitQmYA0C/M7sCn6zUJBZ21pRP+J1563ZErIpc8AndCD
   NV0qQb6V/uQIiEY+mDXx9X30CdeGU4u9tZzhmSC0b7U7GTlRydhVVF23A
   5g4slp28RULvw7eNGHCFkultzKcGV4u/4zHD3aQZtmu+SfmlDfqjYV9o8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="442285439"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400";
   d="scan'208";a="442285439"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 09:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="685367779"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400";
   d="scan'208";a="685367779"
Received: from joshkuo-mobl.amr.corp.intel.com (HELO [10.209.39.242])
 ([10.209.39.242])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 09:23:13 -0700
Message-ID: <e041a75f-82d5-32cc-c885-7245220bb392@linux.intel.com>
Date: Fri, 2 Jun 2023 09:57:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/5] soundwire: stream: Remove unneeded checks for NULL
 bus
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20230602101140.2040141-1-ckeepax@opensource.cirrus.com>
 <20230602101140.2040141-3-ckeepax@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230602101140.2040141-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TK6HIKF7UHGXIXIZS22SRDDSUNGP3QZL
X-Message-ID-Hash: TK6HIKF7UHGXIXIZS22SRDDSUNGP3QZL
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TK6HIKF7UHGXIXIZS22SRDDSUNGP3QZL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/2/23 05:11, Charles Keepax wrote:
> Version of the code prior to commit d014688eb373 ("soundwire: stream:
> remove bus->dev from logs on multiple buses"), used bus->dev in the
> error message after do_bank_switch, this necessitated some checking to
> ensure the bus pointer was valid. As the code no longer uses bus->dev
> said checking is now redundant, so remove it.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Good cleanup, thanks

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
> 
> Changes since v1:
>  - Left the duplicate error prints in.
> 
> Thanks,
> Charles
> 
>  drivers/soundwire/stream.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 379228f221869..6595f47b403b5 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1338,7 +1338,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
>  			       bool update_params)
>  {
>  	struct sdw_master_runtime *m_rt;
> -	struct sdw_bus *bus = NULL;
> +	struct sdw_bus *bus;
>  	struct sdw_master_prop *prop;
>  	struct sdw_bus_params params;
>  	int ret;
> @@ -1382,11 +1382,6 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
>  		}
>  	}
>  
> -	if (!bus) {
> -		pr_err("Configuration error in %s\n", __func__);
> -		return -EINVAL;
> -	}
> -
>  	ret = do_bank_switch(stream);
>  	if (ret < 0) {
>  		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
> @@ -1467,7 +1462,7 @@ EXPORT_SYMBOL(sdw_prepare_stream);
>  static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
>  {
>  	struct sdw_master_runtime *m_rt;
> -	struct sdw_bus *bus = NULL;
> +	struct sdw_bus *bus;
>  	int ret;
>  
>  	/* Enable Master(s) and Slave(s) port(s) associated with stream */
> @@ -1490,11 +1485,6 @@ static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
>  		}
>  	}
>  
> -	if (!bus) {
> -		pr_err("Configuration error in %s\n", __func__);
> -		return -EINVAL;
> -	}
> -
>  	ret = do_bank_switch(stream);
>  	if (ret < 0) {
>  		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
