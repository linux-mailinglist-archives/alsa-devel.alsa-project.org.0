Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4252FDC42
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 23:17:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B67A31805;
	Wed, 20 Jan 2021 23:16:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B67A31805
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611181020;
	bh=n0qz2bseMc9cl3f2t1BSQ0A1p0iGPOPENTqFXgvkwNw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UV+N2us97asxMrf5Ydbz2ZHXa8/G1ZdMjJuMJrqm93sbiZ+iSQK1ANfKv0HU3o9kR
	 rU5TyOXzCjWHoq/BZJhoD+wywQ9IvJcFlT5IGKiQMRj3QATLb2exOqpqfoqPkz93F6
	 XEXZrIwlNgKICEmcNHy+JBJkERkdr7oGGfQ4UU6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79ED5F80166;
	Wed, 20 Jan 2021 23:15:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98B63F8016E; Wed, 20 Jan 2021 23:15:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88EA7F8012C
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 23:15:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88EA7F8012C
IronPort-SDR: NlUq0pRTDVon1Oiw3zLwqwh8RdfQJEeuSRVMhukjQV05RPlJfyhuvUY1A+ep8aIvKAOHUh7KJ3
 X6PJipW2yVRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="175678112"
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="175678112"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 14:15:11 -0800
IronPort-SDR: Wjo0c6C/w/yBCGStuE5kfgMxktdIffdv8ncqct3gjkw5pSnZxF8jMSjl5d1M26u662x43IVT9A
 hy6C84yiQXtQ==
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="356216635"
Received: from bmetsx-mobl1.amr.corp.intel.com (HELO [10.209.108.15])
 ([10.209.108.15])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 14:15:10 -0800
Subject: Re: [RFC PATCH 1/2] soundwire: add support for static port mapping
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
References: <20210120180110.8357-1-srinivas.kandagatla@linaro.org>
 <20210120180110.8357-2-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fcc1b199-644d-8c7f-5e8b-d12b0d9c9a04@linux.intel.com>
Date: Wed, 20 Jan 2021 16:15:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120180110.8357-2-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: gregkh@linuxfoundation.org, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 1/20/21 12:01 PM, Srinivas Kandagatla wrote:
> Some of the soundwire controllers can have static functions assigned
> to each port, like some ports can only do PCM or PDM. This is the situation
> with some of the Qualcomm Controllers.
> 
> In such cases its not correct to assign/map any free port on master
> during streaming.
> 
> So, this patch provides a way to pass mapped port number along
> with the port config, so that master can assign correct ports based
> on the provided static mapping.

I am not sure I understand the problem or what's different between Intel 
and Qualcomm.

On the Intel side we also have fixed-function ports, some for PDM and 
some for PCM. They are not interchangeable, and they are also dedicated 
for each link.

We don't dynamically allocate ports on the master side, the mapping is 
defined by the dai->id and is static. There is a 1:1 relationship 
between dai->id and port_number. See intel_register_dai() and 
intel_hw_params() in drivers/soundwire/intel.c

In the machine driver we make use of specific master DAIs in the dailink 
definitions, just like regular ASoC solutions, so which DAIs you use in 
the machine driver defines what ports end-up being used. There is 
nothing fancy or dynamic here, the dai/port allocation is defined by the 
dailinks. This is a static/worst-case allocation, we don't reassign 
ports depending on use-cases, etc.

The only thing that is dynamic is that the programming of each port is 
handled based on the bandwidth needs of that port, i.e if you play 16 or 
24 bits you'd get fewer or more bitSlots allocated to that dai/port, and 
the DPn registers are updated if you have concurrent streaming on other 
ports. If you only have a fixed set of payloads, as in the existing 
amplifier cases, you can hard-code this allocation as well.

Does this help and can you align on what Intel started with?

