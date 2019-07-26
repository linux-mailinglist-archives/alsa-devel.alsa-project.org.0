Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC0076BEC
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:45:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E5C22089;
	Fri, 26 Jul 2019 16:44:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E5C22089
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564152322;
	bh=3Rt3reRI6DlEGjJT2fb0fl1B1e66ed7SuSKItNj2byM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rGarWNF/3jvVMPHjHbiSUFUo24TmCyGP1g7UqH8/CUGsIKUsXVO/H453/jUJ3eRJc
	 yuIE0Rjny5CKjz4jiH1uOb442HYib7jPXgcXi5vKjTkJUpwApUYDFpohQZaAEzwj0D
	 iXZPQznt77Mj54uKXQxwOa+VvJ24qJFGnZ7m84Bo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A59E5F803D1;
	Fri, 26 Jul 2019 16:43:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CABC4F80393; Fri, 26 Jul 2019 16:43:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 224C2F800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 16:43:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 224C2F800BE
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 07:43:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="369551174"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.35.244])
 by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2019 07:43:27 -0700
Date: Fri, 26 Jul 2019 16:43:25 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190726144325.GH16003@ubuntu>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-22-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-22-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 21/40] soundwire: export helpers to
 find row and column values
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jul 25, 2019 at 06:40:13PM -0500, Pierre-Louis Bossart wrote:
> Add a prefix for common tables and export 2 helpers to set the frame
> shapes based on row/col values.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/bus.h    |  7 +++++--
>  drivers/soundwire/stream.c | 14 ++++++++------
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
> index 06ac4adb0074..c57c9c23f6ca 100644
> --- a/drivers/soundwire/bus.h
> +++ b/drivers/soundwire/bus.h
> @@ -73,8 +73,11 @@ struct sdw_msg {
>  
>  #define SDW_DOUBLE_RATE_FACTOR		2
>  
> -extern int rows[SDW_FRAME_ROWS];
> -extern int cols[SDW_FRAME_COLS];
> +extern int sdw_rows[SDW_FRAME_ROWS];
> +extern int sdw_cols[SDW_FRAME_COLS];

So these arrays actually have to be exported? In the current (5.2) sources they
seem to only be used in stream.c, maybe make them static there?

> +
> +int sdw_find_row_index(int row);
> +int sdw_find_col_index(int col);
>  
>  /**
>   * sdw_port_runtime: Runtime port parameters for Master or Slave
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index a0476755a459..53f5e790fcd7 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -21,37 +21,39 @@
>   * The rows are arranged as per the array index value programmed
>   * in register. The index 15 has dummy value 0 in order to fill hole.
>   */
> -int rows[SDW_FRAME_ROWS] = {48, 50, 60, 64, 75, 80, 125, 147,
> +int sdw_rows[SDW_FRAME_ROWS] = {48, 50, 60, 64, 75, 80, 125, 147,
>  			96, 100, 120, 128, 150, 160, 250, 0,
>  			192, 200, 240, 256, 72, 144, 90, 180};
>  
> -int cols[SDW_FRAME_COLS] = {2, 4, 6, 8, 10, 12, 14, 16};
> +int sdw_cols[SDW_FRAME_COLS] = {2, 4, 6, 8, 10, 12, 14, 16};
>  
> -static int sdw_find_col_index(int col)
> +int sdw_find_col_index(int col)
>  {
>  	int i;
>  
>  	for (i = 0; i < SDW_FRAME_COLS; i++) {
> -		if (cols[i] == col)
> +		if (sdw_cols[i] == col)
>  			return i;
>  	}
>  
>  	pr_warn("Requested column not found, selecting lowest column no: 2\n");
>  	return 0;
>  }
> +EXPORT_SYMBOL(sdw_find_col_index);
>  
> -static int sdw_find_row_index(int row)
> +int sdw_find_row_index(int row)
>  {
>  	int i;
>  
>  	for (i = 0; i < SDW_FRAME_ROWS; i++) {
> -		if (rows[i] == row)
> +		if (sdw_rows[i] == row)
>  			return i;
>  	}
>  
>  	pr_warn("Requested row not found, selecting lowest row no: 48\n");
>  	return 0;
>  }
> +EXPORT_SYMBOL(sdw_find_row_index);
>  
>  static int _sdw_program_slave_port_params(struct sdw_bus *bus,
>  					  struct sdw_slave *slave,
> -- 
> 2.20.1
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
