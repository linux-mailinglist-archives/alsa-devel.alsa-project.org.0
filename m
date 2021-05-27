Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2067393356
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 18:13:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F2861701;
	Thu, 27 May 2021 18:12:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F2861701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622131999;
	bh=tgf5Ve3EqF67ohKMVuZIgs4XS4/EiFvf1fTdrcZ6VUU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GHTG/EDD94d+OmYGs468qxDcPV1+jXo7DdElIoUsgWbrH4CT2lbo7oGsL7GrM1Ki9
	 ZYziYH+lvEWO5pVScQpvGd0izYuoGlnlkdaoXJ7Z4aldxdVClpc9TIeh0JG62MWJfa
	 ri7g3B4w67K35AUytP4T5chRjcWXnhGCaDLCbxy4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF4EBF80149;
	Thu, 27 May 2021 18:11:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34AAAF80147; Thu, 27 May 2021 18:11:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78774F800F9
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 18:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78774F800F9
IronPort-SDR: oPMn3P8tt13aUkrvKF1eSVVCzhAzV3jMaH5Jn85i4yHf6nFSHo1VRVE8XWAHgQi+JM5iWCgXUN
 dMk8rOOmSRVA==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="202809101"
X-IronPort-AV: E=Sophos;i="5.83,227,1616482800"; d="scan'208";a="202809101"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 09:09:23 -0700
IronPort-SDR: 6WA9bodRWD4fVm8DUt3Vogp9sz/nkGuh7kGRNhad0xeaBn3lpYfOLuFcl6KMlSiTmKKpgsT+zj
 MINK5Wp6mSHA==
X-IronPort-AV: E=Sophos;i="5.83,227,1616482800"; d="scan'208";a="480650948"
Received: from cblare-mobl1.amr.corp.intel.com (HELO [10.212.12.23])
 ([10.212.12.23])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 09:09:22 -0700
Subject: Re: [PATCH] soundwire: cadence: remove the repeated declaration
To: Shaokun Zhang <zhangshaokun@hisilicon.com>, alsa-devel@alsa-project.org
References: <1622114698-7943-1-git-send-email-zhangshaokun@hisilicon.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <09fe3ded-41fa-7826-1307-56ab258804a5@linux.intel.com>
Date: Thu, 27 May 2021 07:59:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1622114698-7943-1-git-send-email-zhangshaokun@hisilicon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
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



On 5/27/21 6:24 AM, Shaokun Zhang wrote:
> Function 'cdns_reset_page_addr' is declared twice, so remove the
> repeated declaration.

Indeed, it's been that way since 2018. Thanks for noticing this.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Sanyog Kale <sanyog.r.kale@intel.com>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> ---
>   drivers/soundwire/cadence_master.h | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
> index 4d1aab5b5ec2..0e7f8b35bb21 100644
> --- a/drivers/soundwire/cadence_master.h
> +++ b/drivers/soundwire/cadence_master.h
> @@ -180,9 +180,6 @@ enum sdw_command_response
>   cdns_xfer_msg_defer(struct sdw_bus *bus,
>   		    struct sdw_msg *msg, struct sdw_defer *defer);
>   
> -enum sdw_command_response
> -cdns_reset_page_addr(struct sdw_bus *bus, unsigned int dev_num);
> -
>   int cdns_bus_conf(struct sdw_bus *bus, struct sdw_bus_params *params);
>   
>   int cdns_set_sdw_stream(struct snd_soc_dai *dai,
> 
