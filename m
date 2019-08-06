Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4708483545
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 17:29:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C42B91674;
	Tue,  6 Aug 2019 17:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C42B91674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565105394;
	bh=1qrOKRbOFnZPJylICcUI5e3sKtRF5TEJLHkdG84lR5k=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LGU/5AoXKPV+JbVpdx6QTd3Ehr9cK6P4ChyLudqi5i52Hyi3tGmzEN484UFUluuif
	 LEQSLA3ZEe1TBdmLvbvAc8Zzq4DKwSCtEbnj9oAjyvFvwsuGtgwE3HvchDc/5Xokj/
	 L+cffnJX5DInx9zpfRc4RrNu4v3Oab927ve4Wt50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4BEDF80535;
	Tue,  6 Aug 2019 17:27:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38851F80533; Tue,  6 Aug 2019 17:27:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73A20F800F4
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 17:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73A20F800F4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 08:27:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="174208993"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.15.113])
 ([10.252.15.113])
 by fmsmga008.fm.intel.com with ESMTP; 06 Aug 2019 08:27:30 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
 <20190806005522.22642-7-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <03b6091b-af41-ac54-43c7-196a3583a731@intel.com>
Date: Tue, 6 Aug 2019 17:27:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806005522.22642-7-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Blauciak@vger.kernel.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Slawomir <slawomir.blauciak@intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 06/17] soundwire: cadence_master: use
 firmware defaults for frame shape
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

On 2019-08-06 02:55, Pierre-Louis Bossart wrote:
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index 5d9729b4d634..89c55e4bb72c 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -48,6 +48,8 @@
>   #define CDNS_MCP_SSPSTAT			0xC
>   #define CDNS_MCP_FRAME_SHAPE			0x10
>   #define CDNS_MCP_FRAME_SHAPE_INIT		0x14
> +#define CDNS_MCP_FRAME_SHAPE_COL_MASK		GENMASK(2, 0)
> +#define CDNS_MCP_FRAME_SHAPE_ROW_OFFSET		3
>   
>   #define CDNS_MCP_CONFIG_UPDATE			0x18
>   #define CDNS_MCP_CONFIG_UPDATE_BIT		BIT(0)
> @@ -175,7 +177,6 @@
>   /* Driver defaults */
>   
>   #define CDNS_DEFAULT_CLK_DIVIDER		0
> -#define CDNS_DEFAULT_FRAME_SHAPE		0x30
>   #define CDNS_DEFAULT_SSP_INTERVAL		0x18
>   #define CDNS_TX_TIMEOUT				2000
>   
> @@ -901,6 +902,20 @@ int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
>   }
>   EXPORT_SYMBOL(sdw_cdns_pdi_init);
>   
> +static u32 cdns_set_initial_frame_shape(int n_rows, int n_cols)
> +{
> +	u32 val;
> +	int c;
> +	int r;
> +
> +	r = sdw_find_row_index(n_rows);
> +	c = sdw_find_col_index(n_cols) & CDNS_MCP_FRAME_SHAPE_COL_MASK;
> +
> +	val = (r << CDNS_MCP_FRAME_SHAPE_ROW_OFFSET) | c;
> +
> +	return val;
> +}
> +

Guess this have been said already, but this function could be simplified 
- unless you really want to keep explicit variable declaration. Both "c" 
and "r" declarations could be merged into single line while "val" is not 
needed at all.

One more thing - is AND bitwise op really needed for cols explicitly? We 
know all col values upfront - these are static and declared in global 
table nearby. Static declaration takes care of "initial range-check". Is 
another one necessary?

Moreover, this is a _get_ and certainly not a _set_ type of function. 
I'd even consider renaming it to: "cdns_get_frame_shape" as this is 
neither a _set_ nor an explicit initial frame shape setter.

It might be even helpful to split two usages:

#define sdw_frame_shape(col_idx, row_idx) \
	((row_idx << CDNS_MCP_FRAME_SHAPE_ROW_OFFSET) | col_idx)

u32 cdns_get_frame_shape(u16 rows, u16 cols)
{
	u16 c, r;

	r = sdw_find_row_index(rows);
	c = sdw_find_col_index(cols);

	return sdw_frame_shape(c, r);
}

The above may even be simplified into one-liner.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
