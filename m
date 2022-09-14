Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1DC5B82D2
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 10:20:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53FF9181C;
	Wed, 14 Sep 2022 10:20:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53FF9181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663143654;
	bh=UrXNo+gWqBURZ2nQFRzRtZFaCTDBNxWoEIRfC6m6I7o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=szu6oW4RnDuJFVYYkwG0W9M7odAo2EqJkkgfu34QCvlL9UreVwWxspwRybSii/XTF
	 dq2GoaLGhuosyncef7tD+tHwEvJpdxaOm6yXdW0xpQzTpBoqZ5igPGyUkCroeh8YGW
	 EIZnJpElgpFS/8E2ac8k72idknQhPvlb//A9f4yU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA7D8F8016E;
	Wed, 14 Sep 2022 10:19:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DA47F8014E; Wed, 14 Sep 2022 10:19:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3C02F8008E
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 10:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3C02F8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="K2PUaWke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663143587; x=1694679587;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UrXNo+gWqBURZ2nQFRzRtZFaCTDBNxWoEIRfC6m6I7o=;
 b=K2PUaWke3/E2jjEu7EhAbELn6nDOfjiB2UbLIp0hkjktACCnWHTlaYeI
 POhk1s+luM3l/i4viDA/IczWKXABV3U9M4GPNhCZ0Xo39aJkwSUPCWzcd
 ZXxym627kAFQpS6qisCuVPpr/xl3J4D6pker05FVY+1JItai+LiFAuPLD
 EowCsx4Uy1Tb6dM/A6JYSoh4NgsV650wtt8CRKVbypOLv34xx2Sa6JyGt
 tMdRNwHk181rrClupDevdPehev6ld3xh3tiRcpQo+3PawyNB97pYSTbFx
 Wdg33eovHF6M8hr+6/ByRYZyAB0px3UrYs6wYNfws44MwTjKmoSTkbR/M Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="324619843"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="324619843"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 01:19:34 -0700
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="567921671"
Received: from blaesing-mobl.ger.corp.intel.com (HELO [10.249.45.209])
 ([10.249.45.209])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 01:19:31 -0700
Message-ID: <b13fa907-6893-c4e2-4da5-204e15271a11@linux.intel.com>
Date: Wed, 14 Sep 2022 09:51:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH linux-next] soundwire: intel: Remove unused parameter ret
Content-Language: en-US
To: cgel.zte@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20220914015256.22378-1-cui.jinpeng2@zte.com.cn>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220914015256.22378-1-cui.jinpeng2@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: sanyog.r.kale@intel.com, Jinpeng Cui <cui.jinpeng2@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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



On 9/14/22 03:52, cgel.zte@gmail.com wrote:
> From: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
> 
> The parameter ret = 0 has not been used.
> Return 0 directly instead of returning ret.

That code will be modified by a cleanup series that is going to land
upstream shortly, see https://github.com/thesofproject/linux/pull/3835

It's not an incorrect change but it will introduce unnecessary churn IMHO.

> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
> ---
>  drivers/soundwire/intel.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index b006ae6efcb0..26fdf3577454 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -395,7 +395,6 @@ static int intel_shim_init(struct sdw_intel *sdw, bool clock_stop)
>  {
>  	void __iomem *shim = sdw->link_res->shim;
>  	unsigned int link_id = sdw->instance;
> -	int ret = 0;
>  	u16 ioctl = 0, act = 0;
>  
>  	mutex_lock(sdw->link_res->shim_lock);
> @@ -427,7 +426,7 @@ static int intel_shim_init(struct sdw_intel *sdw, bool clock_stop)
>  
>  	mutex_unlock(sdw->link_res->shim_lock);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
