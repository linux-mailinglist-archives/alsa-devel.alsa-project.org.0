Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AADD0E343
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 15:07:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 199A11665;
	Mon, 29 Apr 2019 15:06:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 199A11665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556543239;
	bh=KB/2PJNeyC3gNJBsPKjj296K2xVe3tOy/XXrsuqxGq0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jU/egyv4GAdKmCeJZ2vTiF/kfYhUM0+7znYiNkanT9a/APxdjcCrWgzyPwKbgTTLy
	 tQGYFdx81D/Kha8VNVSm+ALEpeX2MOOIDy+aPcsEmKvL3H5eFKix6zvBat5XYae2g/
	 qdsX618w8LloBf2Rn/5PoCoE5WTLChkhBuTdQDto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F2B7F80CAB;
	Mon, 29 Apr 2019 15:05:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE06BF80CAB; Mon, 29 Apr 2019 15:05:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A6E4F806E7;
 Mon, 29 Apr 2019 15:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A6E4F806E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 06:05:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,409,1549958400"; d="scan'208";a="138399642"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 29 Apr 2019 06:05:23 -0700
Received: from brettjgr-mobl1.ger.corp.intel.com (unknown [10.254.180.216])
 by linux.intel.com (Postfix) with ESMTP id 5B31F580349;
 Mon, 29 Apr 2019 06:05:23 -0700 (PDT)
To: Patrick Waterlander <patrick.waterlander@intel.com>, patch@alsa-project.org
References: <20190425215743.88673-1-patrick.waterlander@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e7db2293-dda5-7aa1-f3be-8a9cdf707847@linux.intel.com>
Date: Mon, 29 Apr 2019 08:05:22 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190425215743.88673-1-patrick.waterlander@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>
Subject: Re: [alsa-devel] [PATCH 1/1] ASoC: Intel: Skylake: change list
 empty check to warning
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 4/25/19 4:57 PM, Patrick Waterlander wrote:
> NULL is a valid state for the module list when querying unique ID.
> Downgrade the empty condition from error to warning.
> 
> Signed-off-by: Patrick Waterlander <patrick.waterlander@intel.com>
> 
> diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
> index 5951bbdf1f1a..95e6a23538cd 100644
> --- a/sound/soc/intel/skylake/skl-sst.c
> +++ b/sound/soc/intel/skylake/skl-sst.c
> @@ -324,7 +324,7 @@ static struct skl_module_table *skl_module_get_from_id(
>   	struct skl_module_table *module;
>   
>   	if (list_empty(&ctx->module_list)) {
> -		dev_err(ctx->dev, "Module list is empty\n");
> +		dev_warn(ctx->dev, "Module list is empty\n");

Not sure what you are trying to fix here? Either it's an error and we 
can keep the message as is or it's not and that trace should go away. 
Changing the level doesn't really add much value, does it?

You should run this by Filip's team (CC:ed) and copy maintainers.

>   		return NULL;
>   	}
>   
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
