Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6797631E
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 12:06:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C2C6200E;
	Fri, 26 Jul 2019 12:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C2C6200E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564135591;
	bh=79vjLiX7ae7uth1pX0W3eyYVc43A1i7GVy/Bc5PTtgs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oJTg3QXPUcQetyDtIGoL4LDCOsB38/oJkJYn3jutIuy6YMtEgKLPY/l0tlqbTJBj9
	 KJlaW6wRFbyElY6cAxbnNtGCtQET+t0mFN7MmlzZvZw3YYqCSwPwbMEZ8bVMTIaqpw
	 WPQ2uRvavxhFnmBEjUxvplnAz5RxNuZupwxCeD/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72230F803D5;
	Fri, 26 Jul 2019 12:04:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62B9BF80393; Fri, 26 Jul 2019 12:04:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91990F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 12:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91990F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 03:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,310,1559545200"; d="scan'208";a="175552288"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.89.116])
 ([10.251.89.116])
 by orsmga006.jf.intel.com with ESMTP; 26 Jul 2019 03:04:34 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-21-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <f718d6ae-6654-210b-4152-6692091130c9@intel.com>
Date: Fri, 26 Jul 2019 12:04:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725234032.21152-21-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 20/40] soundwire: prototypes for
	suspend/resume
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

On 2019-07-26 01:40, Pierre-Louis Bossart wrote:
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   drivers/soundwire/cadence_master.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
> index c0bf6ff00a44..d375bbfead18 100644
> --- a/drivers/soundwire/cadence_master.h
> +++ b/drivers/soundwire/cadence_master.h
> @@ -165,6 +165,9 @@ int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns);
>   
>   void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root);
>   
> +int sdw_cdns_suspend(struct sdw_cdns *cdns);
> +bool sdw_cdns_check_resume_status(struct sdw_cdns *cdns);
> +
>   int sdw_cdns_get_stream(struct sdw_cdns *cdns,
>   			struct sdw_cdns_streams *stream,
>   			u32 ch, u32 dir);
> 

No commit message, guess it's SQUASHME commit and shouldn't be part of 
overall series.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
