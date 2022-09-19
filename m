Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 071355BC4C8
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 10:53:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84676E11;
	Mon, 19 Sep 2022 10:52:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84676E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663577598;
	bh=soUQOddqp60l+A0SvBrHsI8rwpW1H/6Q8f4MbqONHts=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CaxUZb8UFOwcPWyL9tppfGUqdKj9jtXGmcx0yG5mdHi5AVzyb0AxrKBdCu/TIlJXX
	 aZpd8VDx+IOQJSlsbX/2Ok314aCBTlwCnENGeqj9efafz9D5P1PLLPz7O3gPXmG0FG
	 3hLSvZltpWeSHeD7ctkQbQeTPdwQsVuy1uiZcwa8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16F9DF804AE;
	Mon, 19 Sep 2022 10:52:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1737EF8032B; Mon, 19 Sep 2022 10:52:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E1F1F80134
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 10:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E1F1F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mKZdJWdd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663577533; x=1695113533;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=soUQOddqp60l+A0SvBrHsI8rwpW1H/6Q8f4MbqONHts=;
 b=mKZdJWdd1Jtq2QKc0dYkgRe3qB1w66P2ELgdmDoEIZlcrX8WTz5XSKLt
 ZVrJ4r7o+rWSoLcFkKBSW2hzsIH2/i2s/RFccpsIOSi/ftlzL1zg8ng1d
 FTm/WsOUFhOKY050wFvSQ58nlJBTb/inUApMJndKBclIZ+D6ljsyBd87S
 OS4asZ77QPq1h6Fc7VndrmGmgBZqL/00oXO2V6AmtSadjRyp/hIpsNecC
 CgY/RbUZ3S5w/Y/2j7T9uwMAdwizLtqqs1+fEIN7R21u58an7c9fuRhwe
 yWPht6uoLxOy9Xv0BlZrXhk+tRpFpmjkzuLDrPwEjwwzqHkat2KTC6V1U w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="361081989"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="361081989"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 01:52:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="680761406"
Received: from ilick-mobl1.ger.corp.intel.com (HELO [10.252.59.91])
 ([10.252.59.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 01:52:03 -0700
Message-ID: <5b9040e8-fe19-2438-0072-74b2f0d914e3@linux.intel.com>
Date: Mon, 19 Sep 2022 10:39:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] soundwire: cadence: Write to correct address for each
 FIFO chunk
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <20220917123517.229153-1-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220917123517.229153-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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



On 9/17/22 14:35, Richard Fitzgerald wrote:
> _cdns_xfer_msg() must add the fragment offset to msg->addr to get the
> base target address of each FIFO chunk. Otherwise every chunk will
> be written to the first 32 register addresses.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  drivers/soundwire/cadence_master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index 3ef472049980..ca241bbeadd9 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -569,7 +569,7 @@ _cdns_xfer_msg(struct sdw_cdns *cdns, struct sdw_msg *msg, int cmd,
>  	}
>  
>  	base = CDNS_MCP_CMD_BASE;
> -	addr = msg->addr;
> +	addr = msg->addr + offset;

LGTM, probably means that sending a large command broken in several
pieces never worked. D'oh.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Richard!

>  
>  	for (i = 0; i < count; i++) {
>  		data = FIELD_PREP(CDNS_MCP_CMD_DEV_ADDR, msg->dev_num);
