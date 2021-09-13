Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 622854099F0
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 18:49:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E3AE17B9;
	Mon, 13 Sep 2021 18:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E3AE17B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631551786;
	bh=HYfFSrCtqUgXfs6w2XV5j6yELbLuxqz/Rgv4dSTMNqg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kYdxgWjSgblGeecpTym3oapibFcmOiI+cO9DvhHRb9xrfS5qCLGoarz0PdcIgFJzc
	 X10uuL/AyA2m3rE0JhHR/03z5TwZqfrMg/E8eCfcfFGM3+BX5TKnzKWAmsPib4WpCU
	 GiQH38popo43G/tM0QPAHcHd7sx+0YsqfNjbea3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78B90F804E6;
	Mon, 13 Sep 2021 18:47:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24B9CF804D9; Mon, 13 Sep 2021 18:47:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8F2BF804E5
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 18:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8F2BF804E5
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="201905419"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="201905419"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 09:47:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="543342240"
Received: from rljames-mobl1.amr.corp.intel.com (HELO [10.255.78.21])
 ([10.255.78.21])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 09:47:19 -0700
Subject: Re: [PATCH] soundwire: export sdw_nwrite_no_pm and sdw_nread_no_pm
 functions
To: Simon Trimmer <simont@opensource.cirrus.com>, alsa-devel@alsa-project.org
References: <20210913143122.101428-1-simont@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a2ca13e5-2d31-3313-d2e1-cf3d1ab3f4e2@linux.intel.com>
Date: Mon, 13 Sep 2021 11:27:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913143122.101428-1-simont@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
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



On 9/13/21 9:31 AM, Simon Trimmer wrote:
> The patch "soundwire: export sdw_write/read_no_pm functions" exposed the
> single byte no_pm versions of the IO functions that can be used without
> touching PM, export the multi byte no_pm versions for the same reason.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>

Makes sense to me, e.g. if a codec driver needs to read/write
vendor-specific registers that are not managed with regmap - interrupts
or masks.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  drivers/soundwire/bus.c       | 8 ++++----
>  include/linux/soundwire/sdw.h | 2 ++
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 1b115734a8f6..859de302dee2 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -379,8 +379,7 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
>   * all clients need to use the pm versions
>   */
>  
> -static int
> -sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
> +int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
>  {
>  	struct sdw_msg msg;
>  	int ret;
> @@ -395,9 +394,9 @@ sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
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
> @@ -412,6 +411,7 @@ sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
>  		ret = 0;
>  	return ret;
>  }
> +EXPORT_SYMBOL(sdw_nwrite_no_pm);
>  
>  int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value)
>  {
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 76ce3f3ac0f2..2a5395f0dcf1 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -1042,7 +1042,9 @@ int sdw_write(struct sdw_slave *slave, u32 addr, u8 value);
>  int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value);
>  int sdw_read_no_pm(struct sdw_slave *slave, u32 addr);
>  int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
> +int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
>  int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val);
> +int sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val);
>  int sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val);
>  int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val);
>  
> 
