Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D8B82557
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 21:10:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A82D7166E;
	Mon,  5 Aug 2019 21:09:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A82D7166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565032221;
	bh=9X2xIeUuG7bjKjDHEoex6UCa5XTSOOrWo+N1Lrr+PPY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uh9OLsCobUAZoG36BEow6jQnfvnWCvNcXZJ6gOZwJxx7bHMIWP9/mrkZ0XZJfi2zN
	 yLEJX+K9tChmc5ibca+GWg37yRVuABBwex3rpnn2bbmpS0CunOKLJvjwiInvq2QX25
	 9wo1mWfhJURz1rYp2FJKA4A7JUXFS6MaBsrxVB6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C634F80534;
	Mon,  5 Aug 2019 21:08:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0BF1F80533; Mon,  5 Aug 2019 21:08:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3C20F800F3
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 21:08:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3C20F800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 12:08:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="373176650"
Received: from amerhebi-mobl1.amr.corp.intel.com (HELO [10.251.154.70])
 ([10.251.154.70])
 by fmsmga005.fm.intel.com with ESMTP; 05 Aug 2019 12:08:28 -0700
To: Sanyog Kale <sanyog.r.kale@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-28-pierre-louis.bossart@linux.intel.com>
 <20190805165422.GB24889@buildpc-HP-Z230>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <89fe8170-c252-5bea-a565-631e5b682dbb@linux.intel.com>
Date: Mon, 5 Aug 2019 14:08:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805165422.GB24889@buildpc-HP-Z230>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com
Subject: Re: [alsa-devel] [RFC PATCH 27/40] soundwire: Add Intel resource
 management algorithm
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


>> +static int sdw_select_row_col(struct sdw_bus *bus, int clk_freq)
>> +{
>> +	struct sdw_master_prop *prop = &bus->prop;
>> +	int frame_int, frame_freq;
>> +	int r, c;
>> +
>> +	for (c = 0; c < SDW_FRAME_COLS; c++) {
>> +		for (r = 0; r < SDW_FRAME_ROWS; r++) {
>> +			if (sdw_rows[r] != prop->default_row ||
>> +			    sdw_cols[c] != prop->default_col)
>> +				continue;
> 
> Are we only supporting default rows and cols?

for now yes. Note that the default is defined by firmware and e.g. 
different for ICL (50x4) and CML (125x2). The firmware itself also 
provides a single clock value so we'd need to override the DSDT or force 
the properties to be different to use multiple gears.

This will probably change at some point when we have multiple device per 
link. SoundWire 1.2 devices also provide a standard means to control the 
clock, otherwise with SoundWire 1.1 the clock management requires quite 
a bit of imp-def changes that we have not tested.

> 
>> +
>> +			frame_int = sdw_rows[r] * sdw_cols[c];
>> +			frame_freq = clk_freq / frame_int;
>> +
>> +			if ((clk_freq - (frame_freq * SDW_FRAME_CTRL_BITS)) <
>> +			    bus->params.bandwidth)
>> +				continue;
>> +
>> +			bus->params.row = sdw_rows[r];
>> +			bus->params.col = sdw_cols[c];
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> -- 
>> 2.20.1
>>
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
