Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A4976B3F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:13:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6DD7206C;
	Fri, 26 Jul 2019 16:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6DD7206C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564150399;
	bh=o364cHxcgl+rFUSo/o7hoYZ38PVNQOUFkRy2/TsmHQ8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WbHh6SZsSjB2b04aIY64pCPrd66MQ5a9S2xL4thUhAawI7hVOz5/ad8JSQIVAtXt0
	 A/94BepSKSnfVTwVKU/k6tu7CaH5bBWM6l0Q7RzYCALaDSZyadNKc7IXyiPZrSsGl0
	 3e7PMyhKfjbj/n4zJYjOAzkoGG7XeLwvfSFvqvts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 160E1F804CA;
	Fri, 26 Jul 2019 16:11:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C82E5F804A9; Fri, 26 Jul 2019 16:11:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56A1EF800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 16:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56A1EF800BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 07:11:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322049670"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 07:11:04 -0700
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-17-pierre-louis.bossart@linux.intel.com>
 <20190726072234.GD16003@ubuntu>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c91d6e9d-7ad9-64e2-6ed1-3c0be0b6833d@linux.intel.com>
Date: Fri, 26 Jul 2019 09:11:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726072234.GD16003@ubuntu>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 16/40] soundwire: cadence_master:
 improve startup sequence with link hw_reset
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


>> +static int do_reset(struct sdw_cdns *cdns)
>> +{
>> +	int ret;
>> +
>> +	/* program maximum length reset to be safe */
>> +	cdns_updatel(cdns, CDNS_MCP_CONTROL,
>> +		     CDNS_MCP_CONTROL_RST_DELAY,
>> +		     CDNS_MCP_CONTROL_RST_DELAY);
>> +
>> +	/* use hardware generated reset */
>> +	cdns_updatel(cdns, CDNS_MCP_CONTROL,
>> +		     CDNS_MCP_CONTROL_HW_RST,
>> +		     CDNS_MCP_CONTROL_HW_RST);
>> +
>> +	/* enable bus operations with clock and data */
>> +	cdns_updatel(cdns, CDNS_MCP_CONFIG,
>> +		     CDNS_MCP_CONFIG_OP,
>> +		     CDNS_MCP_CONFIG_OP_NORMAL);
>> +
>> +	/* commit changes */
>> +	ret = cdns_update_config(cdns);
>> +
>> +	return ret;
> 
> +	return cdns_update_config(cdns);
> 
> and remove the "ret" variable.

Yes, it's the same issue as previously reported. will fix.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
