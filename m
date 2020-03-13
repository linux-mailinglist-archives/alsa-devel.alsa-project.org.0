Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11611184DA4
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 18:30:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 586301835;
	Fri, 13 Mar 2020 18:29:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 586301835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584120603;
	bh=u5wYuhNIdltXJXaGATbionXCcVGdwE18yWVTNON5bzI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a5OgEw7iSM9/yShbyjzQ6X4M/4aVHIgWU3xvHhwt3ez0Z/jhoWX9H2koHT07YGVHO
	 TCdB3s/by/2hUvNYz9tc7f0eMZHFIopxdV3yxjPl8tuqQMGAuAIoMmxndy+lMjDeiD
	 QGI+IXo7t393yFLcFViBlDRVDH4waOFXsm+O4d7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40F35F8013E;
	Fri, 13 Mar 2020 18:28:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41BE8F8013E; Fri, 13 Mar 2020 18:28:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3E0DF8013E
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 18:28:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3E0DF8013E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2020 10:28:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,549,1574150400"; d="scan'208";a="237017059"
Received: from sblancoa-mobl.amr.corp.intel.com (HELO [10.251.232.239])
 ([10.251.232.239])
 by fmsmga008.fm.intel.com with ESMTP; 13 Mar 2020 10:28:03 -0700
Subject: Re: [PATCH v2] topology: Add topology file for generic HDA DSP
 machine driver
To: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200309120944.15240-1-mateusz.gorski@linux.intel.com>
 <0d2fb996-2668-e53b-ec91-18bf9e27df31@linux.intel.com>
 <7334e7b6-c4d3-aac3-46d2-b4fbcb0e3957@linux.intel.com>
 <27e153ce-f94b-876a-32e7-66dd5842c07b@linux.intel.com>
 <0efdc802-eb82-2137-19a1-9a7e71fa62d8@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <00bd3e15-b088-c185-4473-8d928da01b9c@linux.intel.com>
Date: Fri, 13 Mar 2020 11:13:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0efdc802-eb82-2137-19a1-9a7e71fa62d8@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, tiwai@suse.com
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




>>> This is a reference topology, and it was successfully validated on 
>>> few production laptops (including models on which DMIC capture was 
>>> not working).

The topology exposes a path that's not present in the hardware then?

>> Sorry, I don't understand what's missing in the cAVS driver?
>>
>> All you need is to select a different topology based on the number of 
>> DMICs detected.
> 
> 
> We have a mechanism to choose the PCM configuration of given topology 
> path via amixer control. That way we can include both 2ch and 4ch DMIC 
> configurations in one topology file and simply change DMIC pipeline 
> configuration on runtime.
> 
> Unfortunately this mechanism is not currently available on upstream.
> 
> As said before, this is a reference topology, if needed I can also 
> upload modified version with 4ch DMIC path.

I don't understand the concept of 'reference topology'. It's not like 
anyone is going to modify this file, which is seriously cryptic, so it's 
got to be a 'usable topology', turn-key really.

You would need three files, with no dmic, with 2 dmic with 4 dmic and a 
driver level code selection. Today the code loads the topology name 
coming from NHLT or dfw_sst.bin, you'd need a more elaborate logic to 
deal with the hardware variants and without requiring any fiddling, 
rename or edits of topology files.


