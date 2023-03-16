Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB316BD8C5
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 20:18:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D97610A8;
	Thu, 16 Mar 2023 20:17:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D97610A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678994307;
	bh=bBOwFeYUzr32M6bMBria6jryjJC/PixHRLws/Jv8nec=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qoA7HtBqjkgBlPE3PDZvR447bTndsI9dpu5tyl5DxDg03tcH3e+SvN1dPsv57xJy7
	 yXYQU7UhMoz+8cWCmZHgsa9wVVnJExz75un2rY3iTZv2lUbeBKxJRggTD82pNaLyiq
	 vicGlv0sU8di83jQrG4ORxsB48GEI47AdTBslbPE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9803EF804B1;
	Thu, 16 Mar 2023 20:17:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C814F804FE; Thu, 16 Mar 2023 20:17:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 061AEF80482
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 20:17:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 061AEF80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WXkqOgHP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678994229; x=1710530229;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bBOwFeYUzr32M6bMBria6jryjJC/PixHRLws/Jv8nec=;
  b=WXkqOgHPGPreIj9vQHa/113cUy50++0OCn0sl7KhzJxjipHl3s+mD1X2
   LJq9ybws5KU4TxP+4fi0xX/Wwc9Me5YO4C+/WyT5XOrk2gyoOK3X6JS+/
   RDSg5qJgrYNl8gXa4B+/tbjfwJ6/pjxR19qm+3cfqDX84BMWf6Ixq9x/E
   zogJn7RbwgLBGZ9YVSqCpNrAvEF341AGZLmufsrsKTx9tyyPzlr0GLbu1
   1aHLAWvVg8q+k9Cd5qxakK26cprsOsUiH63LFSGyvhyVVcQMPMKlhiJ80
   kt/iodGRPErxGMIwAOPgHtPXX9KCPkOcKInjuRyxtFYXZ8KQ3bVjSNjzI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="424362294"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="424362294"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 12:16:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="673278485"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="673278485"
Received: from rljames-mobl1.amr.corp.intel.com (HELO [10.255.38.195])
 ([10.255.38.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 12:16:53 -0700
Message-ID: <447cac77-4cc7-b2a3-23e7-978e1641a401@linux.intel.com>
Date: Thu, 16 Mar 2023 13:46:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] soundwire: bus: Update sdw_nread/nwrite_no_pm to
 handle page boundaries
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
References: <20230316155734.3191577-1-ckeepax@opensource.cirrus.com>
 <20230316155734.3191577-2-ckeepax@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230316155734.3191577-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JYU444W43BERDOY4FXHZ2LBGIWBSQSEX
X-Message-ID-Hash: JYU444W43BERDOY4FXHZ2LBGIWBSQSEX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JYU444W43BERDOY4FXHZ2LBGIWBSQSEX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/16/23 10:57, Charles Keepax wrote:
> Currently issuing a sdw_nread/nwrite_no_pm across a page boundary
> will silently fail to write correctly as nothing updates the page
> registers, meaning the same page of the chip will get rewritten
> with each successive page of data.
> 
> As the sdw_msg structure contains page information it seems
> reasonable that a single sdw_msg should always be within one
> page. It is also mostly simpler to handle the paging at the
> bus level rather than each master having to handle it in their
> xfer_msg callback.
> 
> As such add handling to the bus code to split up a transfer into
> multiple sdw_msg's when they go across page boundaries.

This sounds good but we need to clarify that the multiple sdw_msg's will
not necessarily be sent one after the other, the msg_lock is held in the
sdw_transfer() function, so there should be no expectation that e.g. one
big chunk of firmware code can be sent without interruption.

I also wonder if we should have a lower bar than the page to avoid
hogging the bus with large read/write transactions. If there are
multiple devices on the same link and one of them signals an alert
status while a large transfer is on-going, the alert handling will
mechanically be delayed by up to a page - that's 32k reads/writes, isn't it?

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/soundwire/bus.c | 47 +++++++++++++++++++++++------------------
>  1 file changed, 26 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 3c67266f94834..bdd251e871694 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -386,37 +386,42 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
>   * Read/Write IO functions.
>   */
>  
> -int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
> +static int sdw_ntransfer_no_pm(struct sdw_slave *slave, u32 addr, u8 flags,
> +			       size_t count, u8 *val)
>  {
>  	struct sdw_msg msg;
> +	size_t size;
>  	int ret;
>  
> -	ret = sdw_fill_msg(&msg, slave, addr, count,
> -			   slave->dev_num, SDW_MSG_FLAG_READ, val);
> -	if (ret < 0)
> -		return ret;
> +	while (count) {
> +		// Only handle bytes up to next page boundary
> +		size = min(count, (SDW_REGADDR + 1) - (addr & SDW_REGADDR));
>  
> -	ret = sdw_transfer(slave->bus, &msg);
> -	if (slave->is_mockup_device)
> -		ret = 0;
> -	return ret;
> +		ret = sdw_fill_msg(&msg, slave, addr, size, slave->dev_num, flags, val);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = sdw_transfer(slave->bus, &msg);
> +		if (ret < 0 && !slave->is_mockup_device)
> +			return ret;
> +
> +		addr += size;
> +		val += size;
> +		count -= size;
> +	}
> +
> +	return 0;
> +}
> +
> +int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
> +{
> +	return sdw_ntransfer_no_pm(slave, addr, SDW_MSG_FLAG_READ, count, val);
>  }
>  EXPORT_SYMBOL(sdw_nread_no_pm);
>  
>  int sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
>  {
> -	struct sdw_msg msg;
> -	int ret;
> -
> -	ret = sdw_fill_msg(&msg, slave, addr, count,
> -			   slave->dev_num, SDW_MSG_FLAG_WRITE, (u8 *)val);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = sdw_transfer(slave->bus, &msg);
> -	if (slave->is_mockup_device)
> -		ret = 0;
> -	return ret;
> +	return sdw_ntransfer_no_pm(slave, addr, SDW_MSG_FLAG_WRITE, count, (u8 *)val);
>  }
>  EXPORT_SYMBOL(sdw_nwrite_no_pm);
>  
