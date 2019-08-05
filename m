Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 077C882010
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 17:27:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F09D1678;
	Mon,  5 Aug 2019 17:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F09D1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565018825;
	bh=NCnH9XKUjjCZgNPtQBcUM/CkYKGCbJvPYEpWQJdR62w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A+EAN0DJzyO4Pap1Dd30dwuMq5LpjpkCwydwaHr7c9mlxs5g7oZU2oBu7iHt+xK88
	 qFB6su2RYW6QCptlwaLZ6LVB0BtO6ETDVOxpmUArmscV3nrURiY1EXu/fcTRSS88K4
	 BE6f8piPDgAVDPkVUfJ161ORJFdv6DaH9kqB+joE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B884DF8011B;
	Mon,  5 Aug 2019 17:25:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64DC8F80533; Mon,  5 Aug 2019 17:25:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99AEFF800F4
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 17:25:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99AEFF800F4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 08:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="164679880"
Received: from nupurjai-mobl.amr.corp.intel.com (HELO [10.251.149.179])
 ([10.251.149.179])
 by orsmga007.jf.intel.com with ESMTP; 05 Aug 2019 08:20:25 -0700
To: Sanyog Kale <sanyog.r.kale@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-3-pierre-louis.bossart@linux.intel.com>
 <20190805075509.GA22437@buildpc-HP-Z230>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <37002145-b8dc-ac30-d857-00b277ef4bac@linux.intel.com>
Date: Mon, 5 Aug 2019 10:20:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805075509.GA22437@buildpc-HP-Z230>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com
Subject: Re: [alsa-devel] [RFC PATCH 02/40] soundwire: cadence_master: add
 debugfs register dump
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


>> +static ssize_t cdns_reg_read(struct file *file, char __user *user_buf,
>> +			     size_t count, loff_t *ppos)
>> +{
>> +	struct sdw_cdns *cdns = file->private_data;
>> +	char *buf;
>> +	ssize_t ret;
>> +	int i, j;
>> +
>> +	buf = kzalloc(RD_BUF, GFP_KERNEL);
>> +	if (!buf)
>> +		return -ENOMEM;
>> +
>> +	ret = scnprintf(buf, RD_BUF, "Register  Value\n");
>> +	ret += scnprintf(buf + ret, RD_BUF - ret, "\nMCP Registers\n");
>> +	for (i = 0; i < 8; i++) /* 8 MCP registers */
>> +		ret += cdns_sprintf(cdns, buf, ret, i * 4);
>> +
>> +	ret += scnprintf(buf + ret, RD_BUF - ret,
>> +			 "\nStatus & Intr Registers\n");
>> +	for (i = 0; i < 13; i++) /* 13 Status & Intr registers */
>> +		ret += cdns_sprintf(cdns, buf, ret, CDNS_MCP_STAT + i * 4);
>> +
>> +	ret += scnprintf(buf + ret, RD_BUF - ret,
>> +			 "\nSSP & Clk ctrl Registers\n");
>> +	ret += cdns_sprintf(cdns, buf, ret, CDNS_MCP_SSP_CTRL0);
>> +	ret += cdns_sprintf(cdns, buf, ret, CDNS_MCP_SSP_CTRL1);
>> +	ret += cdns_sprintf(cdns, buf, ret, CDNS_MCP_CLK_CTRL0);
>> +	ret += cdns_sprintf(cdns, buf, ret, CDNS_MCP_CLK_CTRL1);
>> +
>> +	ret += scnprintf(buf + ret, RD_BUF - ret,
>> +			 "\nDPn B0 Registers\n");
>> +	for (i = 0; i < 7; i++) {
>> +		ret += scnprintf(buf + ret, RD_BUF - ret,
>> +				 "\nDP-%d\n", i);
>> +		for (j = 0; j < 6; j++)
>> +			ret += cdns_sprintf(cdns, buf, ret,
>> +					CDNS_DPN_B0_CONFIG(i) + j * 4);
>> +	}
>> +
>> +	ret += scnprintf(buf + ret, RD_BUF - ret,
>> +			 "\nDPn B1 Registers\n");
>> +	for (i = 0; i < 7; i++) {
>> +		ret += scnprintf(buf + ret, RD_BUF - ret,
>> +				 "\nDP-%d\n", i);
>> +
>> +		for (j = 0; j < 6; j++)
>> +			ret += cdns_sprintf(cdns, buf, ret,
>> +					CDNS_DPN_B1_CONFIG(i) + j * 4);
>> +	}
>> +
>> +	ret += scnprintf(buf + ret, RD_BUF - ret,
>> +			 "\nDPn Control Registers\n");
>> +	for (i = 0; i < 7; i++)
>> +		ret += cdns_sprintf(cdns, buf, ret,
>> +				CDNS_PORTCTRL + i * CDNS_PORT_OFFSET);
>> +
>> +	ret += scnprintf(buf + ret, RD_BUF - ret,
>> +			 "\nPDIn Config Registers\n");
>> +	for (i = 0; i < 7; i++)
> 
> please use macros for all the hardcodings.

yes, I completely changed that part in the upcoming update by using 
register start/stop for all loops, it makes the code more consistent and 
easier to change (SoundWire 1.2 registers will need to be added)

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
