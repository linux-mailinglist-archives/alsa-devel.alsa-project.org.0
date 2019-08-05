Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC52F815A5
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 11:39:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 472E31683;
	Mon,  5 Aug 2019 11:38:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 472E31683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564997968;
	bh=4eYrRv7MGzq0NWeiouwivQs7DE55uY/NEtzv61QpLKA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uzIAu5YYEIJlIxK3/slX+9kRGypoaqtNIN/knxBOhdWmGezwnafWpFPxLTlNpanX0
	 9nWwhQYRT381UJXa3ECcOZ15KHKi2F7tJSvKwz6z/OdjMs/mbeI/72XeTCw5YEJZSi
	 xIC8SLNbZNuUUCS2s7YViWrPC65jZ9p+M4hp7QCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AB3BF80534;
	Mon,  5 Aug 2019 11:37:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9A1CF80533; Mon,  5 Aug 2019 11:37:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BF06F800F3
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 11:37:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BF06F800F3
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 02:37:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="167921292"
Received: from buildpc-hp-z230.iind.intel.com (HELO buildpc-HP-Z230)
 ([10.223.89.34])
 by orsmga008.jf.intel.com with ESMTP; 05 Aug 2019 02:37:31 -0700
Date: Mon, 5 Aug 2019 15:09:23 +0530
From: Sanyog Kale <sanyog.r.kale@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190805093923.GC22437@buildpc-HP-Z230>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-22-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-22-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com
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
> +
> +int sdw_find_row_index(int row);
> +int sdw_find_col_index(int col);

We use index values only in bank switch operations to program registers. Do we
really need to export sdw_find_row_index & sdw_find_col_index?? If i understand
correctly the allocation algorithm only needs to know about cols and rows values
and not index.

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

-- 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
