Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AF28257B
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 21:20:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0923A167C;
	Mon,  5 Aug 2019 21:19:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0923A167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565032847;
	bh=/XiPusZjK1XqsmRrBduFabjAVxdtl89OBBmI0aynz38=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CfJIvveZVY1Ll4Fd9igthCmBAcpI1cp8aT8arDS0YeJdIV1HqgvgOC2dRb1avIwL4
	 SDQHvnfsJTGdOG9Ev88hXHswdMLYspPCRykvlciJf10QYKJWyUNWKrx/KMRGahYpO3
	 zCvWEfl0OozG1TvpWBLgNefsNHsjpj02MRxWuqTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37BD6F8011B;
	Mon,  5 Aug 2019 21:19:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 843E5F80533; Mon,  5 Aug 2019 21:19:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4DD0F800F3
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 21:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4DD0F800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 12:18:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="373180072"
Received: from amerhebi-mobl1.amr.corp.intel.com (HELO [10.251.154.70])
 ([10.251.154.70])
 by fmsmga005.fm.intel.com with ESMTP; 05 Aug 2019 12:18:35 -0700
To: Sanyog Kale <sanyog.r.kale@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-29-pierre-louis.bossart@linux.intel.com>
 <20190805165729.GC24889@buildpc-HP-Z230>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4c4e64fb-9657-0312-a19f-2a17b44fbae3@linux.intel.com>
Date: Mon, 5 Aug 2019 14:18:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805165729.GC24889@buildpc-HP-Z230>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com
Subject: Re: [alsa-devel] [RFC PATCH 28/40] soundwire: intel: handle
 disabled links
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



On 8/5/19 11:57 AM, Sanyog Kale wrote:
> On Thu, Jul 25, 2019 at 06:40:20PM -0500, Pierre-Louis Bossart wrote:
>> On most hardware platforms, SoundWire interfaces are pin-muxed with
>> other interfaces (typically DMIC or I2S) and the status of each link
>> needs to be checked at boot time.
>>
>> For Intel platforms, the BIOS provides a menu to enable/disable the
>> links separately, and the information is provided to the OS with an
>> Intel-specific _DSD property. The same capability will be added to
>> revisions of the MIPI DisCo specification.

[snip]

>> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
>> index c7dfc824be80..f78b076a8782 100644
>> --- a/include/linux/soundwire/sdw.h
>> +++ b/include/linux/soundwire/sdw.h
>> @@ -380,6 +380,7 @@ struct sdw_slave_prop {
>>    * @err_threshold: Number of times that software may retry sending a single
>>    * command
>>    * @mclk_freq: clock reference passed to SoundWire Master, in Hz.
>> + * @hw_disabled: if true, the Master is not functional, typically due to pin-mux
>>    */
>>   struct sdw_master_prop {
>>   	u32 revision;
>> @@ -395,6 +396,7 @@ struct sdw_master_prop {
>>   	bool dynamic_frame;
>>   	u32 err_threshold;
>>   	u32 mclk_freq;
>> +	bool hw_disabled;
> 
> Do we have such cases where some of SoundWire links are disabled and
> some enabled?

Yes, by default my ICL test board uses HDaudio for the codec so the 
SoundWire link0 is disabled. If I rework the board and change the BIOS 
advanced menu then SoundWire link0 is enabled. This information is 
dynamically provided to the OS after the _INI step.
SoundWire-2/3 are used typically for attached DMICs or for a combination 
of SoundWire amplifier and mic capture. It's really platform-specific.

> 
>>   };
>>   
>>   int sdw_master_read_prop(struct sdw_bus *bus);
>> -- 
>> 2.20.1
>>
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
