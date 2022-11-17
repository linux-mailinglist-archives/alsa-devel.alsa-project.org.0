Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 591CC62DEEE
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 16:01:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E784516E6;
	Thu, 17 Nov 2022 16:00:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E784516E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668697276;
	bh=SCUs7E0Hmpx45Jes1TPeWxVvcw4uUY3HMsnLGxpo4aw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HLnGItAAt25synUMQXHXsfZTHgUWVUYVwp+UJCdGsEOtSxFW6aBXOCA0nlENmd30c
	 hmujkRknWHBtrSJPcddgg5zNfXOobmbg9c14nZN2Rs9itx5kqWkjjYnwnkhBLuVlBg
	 5LOUMei+j9IERNrKvCxJ/XiY2JVUomdAX/68f64M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FA35F804C1;
	Thu, 17 Nov 2022 16:00:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B477AF804BD; Thu, 17 Nov 2022 16:00:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 097C9F80087
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 16:00:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 097C9F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="juJAMxF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668697215; x=1700233215;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SCUs7E0Hmpx45Jes1TPeWxVvcw4uUY3HMsnLGxpo4aw=;
 b=juJAMxF4us64Tp7pVTgxadh3FPPosaoHGbuL/wM8i+SgN+1KuFeYy32S
 uJ1GXvuzmhC46R2OEQ1j8MbO8BdeDYkev7dCHu3kVNuRDTNRyj3HLBTiU
 MucwDD0RdLPFo0jXP6xdWrE7GDzqznuU4EB0R/ENcG8nNAJm458ASYjKe
 olYYwQ4068+7EQ4v+4RsguBxApN0bwDP/RCPLM4tHNjqs8Nv6SoRqBRvS
 H0no8A/2hlcLbFjd61uxTwqYEmH6m9SBJHiAEkru5U2YF1zqKFSV9eC0H
 bdQ7DpTXCPwQs6w6ztdZXJmv4bk/k0KbUvE7ONb3ygdNEyF4hM3E4C2MD w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="314685214"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="314685214"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 07:00:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="617636506"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="617636506"
Received: from kristi4x-mobl1.amr.corp.intel.com (HELO [10.213.177.122])
 ([10.213.177.122])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 07:00:05 -0800
Message-ID: <0cff6870-8de1-1c93-208b-9b57c328486e@linux.intel.com>
Date: Thu, 17 Nov 2022 08:35:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/4] soundwire: bus: export sdw_nwrite_no_pm and
 sdw_nread_no_pm functions
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
References: <20221117141727.3031503-1-ckeepax@opensource.cirrus.com>
 <20221117141727.3031503-2-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221117141727.3031503-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com, alsa-devel@alsa-project.org,
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



On 11/17/22 08:17, Charles Keepax wrote:
> From: Simon Trimmer <simont@opensource.cirrus.com>
> 
> The commit 167790abb90f ("soundwire: export sdw_write/read_no_pm
> functions") exposed the single byte no_pm versions of the IO functions
> that can be used without touching PM, export the multi byte no_pm
> versions for the same reason.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
> 
> No change since v1.
> 
>  drivers/soundwire/bus.c       | 8 ++++----
>  include/linux/soundwire/sdw.h | 2 ++
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 76515c33e639e..ef4878258afad 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -414,8 +414,7 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
>   * all clients need to use the pm versions
>   */
>  
> -static int
> -sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
> +int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
>  {
>  	struct sdw_msg msg;
>  	int ret;
> @@ -430,9 +429,9 @@ sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
>  		ret = 0;
>  	return ret;
>  }
> +EXPORT_SYMBOL(sdw_nread_no_pm);
>  
> -static int
> -sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
> +int sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
>  {
>  	struct sdw_msg msg;
>  	int ret;
> @@ -447,6 +446,7 @@ sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
>  		ret = 0;
>  	return ret;
>  }
> +EXPORT_SYMBOL(sdw_nwrite_no_pm);
>  
>  int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value)
>  {
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 9e4537f409c29..902ed46f76c80 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -1047,7 +1047,9 @@ int sdw_write(struct sdw_slave *slave, u32 addr, u8 value);
>  int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value);
>  int sdw_read_no_pm(struct sdw_slave *slave, u32 addr);
>  int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
> +int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
>  int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val);
> +int sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val);
>  int sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val);
>  int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val);
>  
