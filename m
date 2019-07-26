Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3413E77148
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 20:31:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C121520C7;
	Fri, 26 Jul 2019 20:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C121520C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564165889;
	bh=9X0qTO/awEJ4RWYiaGKRzCnVYv9CUROxaOM6J/1KPeA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kMmRXhUY8dQ9OTc4K64qYWeUM7PyKigElgDICFKQzdoyulxHes6G4EcqVaKBP6///
	 EqmM6WalYTv0Gl/RqYGTPSihVDHNwfQWOgQ2u6mmPJPnT73ag6ui5q0Od15T92hold
	 yapZu5UwW1lTyHWMCfLgi5mywqyySbPrrSIAxpak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BF9EF803D5;
	Fri, 26 Jul 2019 20:29:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B6A1F80393; Fri, 26 Jul 2019 20:29:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44048F800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 20:29:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44048F800BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 11:29:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="198481252"
Received: from andawes-mobl.amr.corp.intel.com (HELO [10.251.145.66])
 ([10.251.145.66])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2019 11:29:32 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20190726181517.27655-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <280fee13-d00f-22ee-980c-8b5f5edd886c@linux.intel.com>
Date: Fri, 26 Jul 2019 13:29:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726181517.27655-1-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH] MAINTAINERS: Update Intel ASoC drivers
	maintainers
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



On 7/26/19 1:15 PM, Cezary Rojewski wrote:
> Adding myself to Intel ASoC drivers maintainers list.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 783569e3c4b4..0db421933d0c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8044,6 +8044,7 @@ S:	Maintained
>   F:	drivers/video/fbdev/i810/
>   
>   INTEL ASoC DRIVERS
> +M:	Cezary Rojewski <cezary.rojewski@intel.com>
>   M:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>   M:	Liam Girdwood <liam.r.girdwood@linux.intel.com>
>   M:	Jie Yang <yang.jie@linux.intel.com>
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
