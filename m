Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F712566F0
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Aug 2020 12:57:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78DFA18E7;
	Sat, 29 Aug 2020 12:56:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78DFA18E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598698642;
	bh=lz4Fyyi6yxCgvaaRszO4BQhDBGpae9f2V3dQJ1ZH7yA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hdltyOvd+3sonnCpObWoB+ZLQ0VFUo/Az/xDCGfpb1lfgB1nXy/oI+5VJb5DCvSRc
	 9KA6V9jVDRarD9NgUnNoO7Tek7/lpp/ohi2xgYBrdr8qZgkfmSYkE27/6HWDAzLXdk
	 kASgDWYsWzfZNXcLP0MraMaAMmUx/UGd0xNeiHSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F2CAF8027B;
	Sat, 29 Aug 2020 12:55:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06801F8026A; Sat, 29 Aug 2020 12:55:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F45EF8014E
 for <alsa-devel@alsa-project.org>; Sat, 29 Aug 2020 12:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F45EF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ISVmzPzR"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3252620791;
 Sat, 29 Aug 2020 10:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598698528;
 bh=lz4Fyyi6yxCgvaaRszO4BQhDBGpae9f2V3dQJ1ZH7yA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ISVmzPzRa0/ICZW2poz399OnLK6Gwgt6C6I6CerCNc2VbsDOEHaEq43r/3LqPdY5t
 T0ik2jXj6CtN5/eFyT2t9OfBN64EY1BL023b7HZo7NtVwyrNpLwnLbKTAzC5tYfmsi
 BFl2FGP3TrdTuR+Mv8p3SL2cPkrdfqYS2/YqmnoQ=
Date: Sat, 29 Aug 2020 16:25:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 6/9] soundwire: cadence: use FIELD_{GET|PREP}
Message-ID: <20200829105524.GB2639@vkoul-mobl>
References: <20200828072101.3781956-1-vkoul@kernel.org>
 <20200828072101.3781956-7-vkoul@kernel.org>
 <da03d771-bb5a-8695-80e8-9eef5e9e1003@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da03d771-bb5a-8695-80e8-9eef5e9e1003@linux.intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>
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

On 28-08-20, 13:13, Pierre-Louis Bossart wrote:
> 
> > -	val = (r << CDNS_MCP_FRAME_SHAPE_ROW_OFFSET) | c;
> > +	val = FIELD_PREP(CDNS_MCP_FRAME_SHAPE_ROW_OFFSET, r) | c;
> 
> Confusion between shift and mask here.

thanks, yes I had doubts on this, folder the fix

> 
> Testing a fix now (attached), but may I suggest you use the SOF
> GitHub/Travis CI directly for any updates? You'll get an answer in 30mn for
> the CML RVP w/ SoundWire.

> >From 5d0ca63bee2c6e2456195499908ecdc8a7709238 Mon Sep 17 00:00:00 2001
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Date: Fri, 28 Aug 2020 13:04:01 -0500
> Subject: [PATCH] fixup! soundwire: cadence: use FIELD_{GET|PREP}
> 
> Fix confusion between shift and mask.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/cadence_master.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index b6796aa19aa8..5dd06483c835 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -58,7 +58,7 @@ MODULE_PARM_DESC(cdns_mcp_int_mask, "Cadence MCP IntMask");
>  #define CDNS_MCP_FRAME_SHAPE			0x10
>  #define CDNS_MCP_FRAME_SHAPE_INIT		0x14
>  #define CDNS_MCP_FRAME_SHAPE_COL_MASK		GENMASK(2, 0)
> -#define CDNS_MCP_FRAME_SHAPE_ROW_OFFSET		3
> +#define CDNS_MCP_FRAME_SHAPE_ROW_MASK		GENMASK(7, 3)
>  
>  #define CDNS_MCP_CONFIG_UPDATE			0x18
>  #define CDNS_MCP_CONFIG_UPDATE_BIT		BIT(0)
> @@ -1165,9 +1165,10 @@ static u32 cdns_set_initial_frame_shape(int n_rows, int n_cols)
>  	int r;
>  
>  	r = sdw_find_row_index(n_rows);
> -	c = sdw_find_col_index(n_cols) & CDNS_MCP_FRAME_SHAPE_COL_MASK;
> +	c = sdw_find_col_index(n_cols);
>  
> -	val = FIELD_PREP(CDNS_MCP_FRAME_SHAPE_ROW_OFFSET, r) | c;
> +	val = FIELD_PREP(CDNS_MCP_FRAME_SHAPE_ROW_MASK, r) |
> +		FIELD_PREP(CDNS_MCP_FRAME_SHAPE_COL_MASK, c);
>  
>  	return val;
>  }
> -- 
> 2.25.1
> 


-- 
~Vinod
