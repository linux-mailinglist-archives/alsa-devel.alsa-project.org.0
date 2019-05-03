Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BDA1304D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 16:34:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5542717FB;
	Fri,  3 May 2019 16:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5542717FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556894088;
	bh=K3U+5rIJHi5QSAwpV98th7K0+n5E55FRl2iTVtrhyQY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sTV0+sVGmdOThcHMvlZpRisIR8aqVIfcFjpp+Tk22/dHw0ClcN6FAzqvE/0kdshY5
	 Xg+RfJhqsS5MayW+vBwUc017JyLDjdX+F/k6/6wjbks5QEqyIHldVr2LuW4x+mTn0F
	 cZWHgPkG1e2351AYerWAwfnaMfXkgyx7jdQ88zsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1C06F896B7;
	Fri,  3 May 2019 16:33:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1B2FF896B7; Fri,  3 May 2019 16:33:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A0C6F80722
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 16:32:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A0C6F80722
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2019 07:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,426,1549958400"; d="scan'208";a="145734214"
Received: from nzussbla-mobl.amr.corp.intel.com (HELO [10.254.111.239])
 ([10.254.111.239])
 by fmsmga008.fm.intel.com with ESMTP; 03 May 2019 07:32:53 -0700
To: Mark Brown <broonie@kernel.org>
References: <20190419194649.18467-1-pierre-louis.bossart@linux.intel.com>
 <20190419194649.18467-3-pierre-louis.bossart@linux.intel.com>
 <20190503043957.GA14916@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <535dfeac-77d8-1307-0329-33b8f2675bbd@linux.intel.com>
Date: Fri, 3 May 2019 09:32:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503043957.GA14916@sirena.org.uk>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com
Subject: Re: [alsa-devel] [PATCH v2 2/2] regmap: soundwire: fix Kconfig
	select/depend issue
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



On 5/2/19 11:39 PM, Mark Brown wrote:
> On Fri, Apr 19, 2019 at 02:46:49PM -0500, Pierre-Louis Bossart wrote:
> 
>>   config REGMAP_SOUNDWIRE
>>   	tristate
>> -	depends on SOUNDWIRE_BUS
>> +	select SOUNDWIRE_BUS
> 
> This now makes _SOUNDWIRE different to all the other bus types; if this
> is a good change then surely the same thing should be done for all the
> other bus types.  It's also not clear to me that this actually does
> anything, do selects from symbols that are themselves selected actually
> do anything?

yes, this works, but if you prefer alignment I can follow the SLIMBUS model

config SND_SOC_WCD9335
	tristate "WCD9335 Codec"
	depends on SLIMBUS
	select REGMAP_SLIMBUS
	select REGMAP_IRQ

config REGMAP_SLIMBUS
	tristate
	depends on SLIMBUS

menuconfig SLIMBUS
	tristate "SLIMbus support"
	
if SLIMBUS

# SLIMbus controllers
config SLIM_QCOM_CTRL
...

As I mentioned it'll compile the bus even if there is no user for it, 
but it's your call: alignment or optimization.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
