Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B56D8204D
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 17:33:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E3F41670;
	Mon,  5 Aug 2019 17:32:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E3F41670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565019210;
	bh=Eg6u1H1kkDpXLsE2EzMMajK9Yeb4EhSi/uvnxtR8KS8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OeDKNln6tjWS7oQOq5bBFxDZGtQ1cV5/s1u8Ugh4/hLPFVmvmNSEX0T8kNoTYzDRn
	 +/wkhwfpuD+w84NovgijZdO1kQmwtBTuOEJX5lF2sigTzpPC0HWeiBnNMTi3axHZMy
	 FITLevenmsV3Rd9CkNC4SDriBjRNgurAn9W/dCgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97299F80533;
	Mon,  5 Aug 2019 17:31:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 002ADF80533; Mon,  5 Aug 2019 17:31:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E727F8011B
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 17:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E727F8011B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 08:27:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="164681288"
Received: from nupurjai-mobl.amr.corp.intel.com (HELO [10.251.149.179])
 ([10.251.149.179])
 by orsmga007.jf.intel.com with ESMTP; 05 Aug 2019 08:27:16 -0700
To: Sanyog Kale <sanyog.r.kale@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-22-pierre-louis.bossart@linux.intel.com>
 <20190805093923.GC22437@buildpc-HP-Z230>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <75539c39-da33-efba-d320-42fab738c5f0@linux.intel.com>
Date: Mon, 5 Aug 2019 10:27:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805093923.GC22437@buildpc-HP-Z230>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 8/5/19 4:39 AM, Sanyog Kale wrote:
> On Thu, Jul 25, 2019 at 06:40:13PM -0500, Pierre-Louis Bossart wrote:
>> Add a prefix for common tables and export 2 helpers to set the frame
>> shapes based on row/col values.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   drivers/soundwire/bus.h    |  7 +++++--
>>   drivers/soundwire/stream.c | 14 ++++++++------
>>   2 files changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
>> index 06ac4adb0074..c57c9c23f6ca 100644
>> --- a/drivers/soundwire/bus.h
>> +++ b/drivers/soundwire/bus.h
>> @@ -73,8 +73,11 @@ struct sdw_msg {
>>   
>>   #define SDW_DOUBLE_RATE_FACTOR		2
>>   
>> -extern int rows[SDW_FRAME_ROWS];
>> -extern int cols[SDW_FRAME_COLS];
>> +extern int sdw_rows[SDW_FRAME_ROWS];
>> +extern int sdw_cols[SDW_FRAME_COLS];
>> +
>> +int sdw_find_row_index(int row);
>> +int sdw_find_col_index(int col);
> 
> We use index values only in bank switch operations to program registers. Do we
> really need to export sdw_find_row_index & sdw_find_col_index?? If i understand
> correctly the allocation algorithm only needs to know about cols and rows values
> and not index.

The allocation does work with cols and rows indeed, but will first run 
the code below where the information f is required:

static int sdw_select_row_col(struct sdw_bus *bus, int clk_freq)
{
	struct sdw_master_prop *prop = &bus->prop;
	int frame_int, frame_freq;
	int r, c;

	for (c = 0; c < SDW_FRAME_COLS; c++) {
		for (r = 0; r < SDW_FRAME_ROWS; r++) {
			if (sdw_rows[r] != prop->default_row ||
			    sdw_cols[c] != prop->default_col)
				continue;

			frame_int = sdw_rows[r] * sdw_cols[c];
			frame_freq = clk_freq / frame_int;

			if ((clk_freq - (frame_freq * SDW_FRAME_CTRL_BITS)) <
			    bus->params.bandwidth)
				continue;

			bus->params.row = sdw_rows[r];
			bus->params.col = sdw_cols[c];
			return 0;
		}
	}

	return -EINVAL;
}

as for the two helpers, they are used in both the allocation and the 
cadence code (to determine the initial frame shape from properties).

And other solutions for non-Intel platforms will also need this to 
convert from indices to frame shape.

So yes all of this is needed.


> 
>>   
>>   /**
>>    * sdw_port_runtime: Runtime port parameters for Master or Slave
>> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
>> index a0476755a459..53f5e790fcd7 100644
>> --- a/drivers/soundwire/stream.c
>> +++ b/drivers/soundwire/stream.c
>> @@ -21,37 +21,39 @@
>>    * The rows are arranged as per the array index value programmed
>>    * in register. The index 15 has dummy value 0 in order to fill hole.
>>    */
>> -int rows[SDW_FRAME_ROWS] = {48, 50, 60, 64, 75, 80, 125, 147,
>> +int sdw_rows[SDW_FRAME_ROWS] = {48, 50, 60, 64, 75, 80, 125, 147,
>>   			96, 100, 120, 128, 150, 160, 250, 0,
>>   			192, 200, 240, 256, 72, 144, 90, 180};
>>   
>> -int cols[SDW_FRAME_COLS] = {2, 4, 6, 8, 10, 12, 14, 16};
>> +int sdw_cols[SDW_FRAME_COLS] = {2, 4, 6, 8, 10, 12, 14, 16};
>>   
>> -static int sdw_find_col_index(int col)
>> +int sdw_find_col_index(int col)
>>   {
>>   	int i;
>>   
>>   	for (i = 0; i < SDW_FRAME_COLS; i++) {
>> -		if (cols[i] == col)
>> +		if (sdw_cols[i] == col)
>>   			return i;
>>   	}
>>   
>>   	pr_warn("Requested column not found, selecting lowest column no: 2\n");
>>   	return 0;
>>   }
>> +EXPORT_SYMBOL(sdw_find_col_index);
>>   
>> -static int sdw_find_row_index(int row)
>> +int sdw_find_row_index(int row)
>>   {
>>   	int i;
>>   
>>   	for (i = 0; i < SDW_FRAME_ROWS; i++) {
>> -		if (rows[i] == row)
>> +		if (sdw_rows[i] == row)
>>   			return i;
>>   	}
>>   
>>   	pr_warn("Requested row not found, selecting lowest row no: 48\n");
>>   	return 0;
>>   }
>> +EXPORT_SYMBOL(sdw_find_row_index);
>>   
>>   static int _sdw_program_slave_port_params(struct sdw_bus *bus,
>>   					  struct sdw_slave *slave,
>> -- 
>> 2.20.1
>>
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
