Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DF89954B
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 15:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 726391696;
	Thu, 22 Aug 2019 15:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 726391696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566481254;
	bh=tHP93L3kwSTwHKdXEx9wnYlHF09kTmnb4acitD5Ktj0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GQC4pKllJkK503QQwB695JC8KlNUyeZWZe48+z86O3eiiFgTAX11pZEFi7sSc6Hsd
	 v/rhO4zrZFrM2vI78oM346mOvcOGsqTQwt9bvei/fHbNo+m/7dsK/asS8tiFa9DKPl
	 j4fdU2yB+Y03vmnxEojTCeblfIz0bbhOxTUPge8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2769F803D5;
	Thu, 22 Aug 2019 15:39:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41496F8036E; Thu, 22 Aug 2019 15:39:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6638AF80147
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 15:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6638AF80147
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 06:38:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="178857029"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2019 06:38:58 -0700
Received: from tcwomach-mobl1.amr.corp.intel.com (unknown [10.255.34.51])
 by linux.intel.com (Postfix) with ESMTP id 953DE5803A5;
 Thu, 22 Aug 2019 06:38:57 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org
References: <20190822062555.30216-1-vkoul@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <05406f83-a799-2110-cf51-c289ae838065@linux.intel.com>
Date: Thu, 22 Aug 2019 08:38:57 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822062555.30216-1-vkoul@kernel.org>
Content-Language: en-US
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Shreyas NC <shreyas.nc@intel.com>
Subject: Re: [alsa-devel] [PATCH] soundwire: intel: remove unused variables
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

On 8/22/19 1:25 AM, Vinod Koul wrote:
> Variables 'nval' and 'i' are no longer used sdw_master_read_intel_prop()
> so remove them.
> 
> drivers/soundwire/intel.c: In function 'sdw_master_read_intel_prop':
> drivers/soundwire/intel.c:829:12: warning: unused variable 'i' [-Wunused-variable]
>    int nval, i;
>              ^
> drivers/soundwire/intel.c:829:6: warning: unused variable 'nval' [-Wunused-variable]
>    int nval, i;
>        ^~~~
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: 085f4ace103d ("soundwire: intel: read mclk_freq property from firmware")
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

This was fixed in the followup patch to disable hw links:

-	int nval, i;
+	u32 quirk_mask;

which wasn't applied because debugsfs didn't apply, and debugfs didn't 
apply because of discrepancies between soundwire/fixes and soundwire/next...
I realize these variables were removed in the wrong patch but I would 
appreciate it if we could just avoid creating more conflicts for minor 
changes. Thank you.

> ---
>   drivers/soundwire/intel.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 459cc1e6355d..cad378f741c0 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -826,7 +826,6 @@ static int sdw_master_read_intel_prop(struct sdw_bus *bus)
>   	struct sdw_master_prop *prop = &bus->prop;
>   	struct fwnode_handle *link;
>   	char name[32];
> -	int nval, i;
>   
>   	/* Find master handle */
>   	snprintf(name, sizeof(name),
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
