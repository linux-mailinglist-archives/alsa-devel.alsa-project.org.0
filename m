Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DBB2FEDB5
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 15:58:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE5EB18F0;
	Thu, 21 Jan 2021 15:57:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE5EB18F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611241089;
	bh=2QZMuncB9WwX25gf7Ly84H9X5xQTDc4loBghK3jhuDI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CZovh/h8VvcP1+SSsHH+0fCZbCPrYLvDdNC01Kr0CPsgwVS94sBgdAeozlneTxRJj
	 rCX0MmQM/4+/+TaQlwhahERD8X3MT56eQnxIh3qZcQ15WfN4eM2FJddi/p2pKgyUKW
	 f73f2MZq8FrPL1jiiWvJ3vu5Fe9XEQDvuPxINs10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26FE4F80255;
	Thu, 21 Jan 2021 15:56:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F628F80257; Thu, 21 Jan 2021 15:56:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D61AF80162
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 15:56:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D61AF80162
IronPort-SDR: OPU55bnhpS/MjI1ka5gIukbzPtKEclMd1owksBnipzE/moZWWQ4+FVH9l6BVK0gD98LWfGTgMC
 ujfy2P+Mj1NQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="240818292"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="240818292"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 06:56:26 -0800
IronPort-SDR: W74hvUF2c/5+F/l5fu8K8Cgr6Xq1W49lAZJiJbNOTI+yBnUbs6lb9zduxyvNgGCCfQp6q4Slgx
 bGBmc6RnAwxg==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="427378077"
Received: from rjstacey-mobl2.amr.corp.intel.com (HELO [10.212.160.37])
 ([10.212.160.37])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 06:56:25 -0800
Subject: Re: [RFC PATCH 1/2] soundwire: add support for static port mapping
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
References: <20210120180110.8357-1-srinivas.kandagatla@linaro.org>
 <20210120180110.8357-2-srinivas.kandagatla@linaro.org>
 <fcc1b199-644d-8c7f-5e8b-d12b0d9c9a04@linux.intel.com>
 <0a2bbbe5-821a-34dd-e893-fef42baaad2b@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9a688b02-80a6-fb1f-d6fa-36ba2d88d3b9@linux.intel.com>
Date: Thu, 21 Jan 2021 08:56:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0a2bbbe5-821a-34dd-e893-fef42baaad2b@linaro.org>
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



> Port allocations are something like this:
> 
> RX: (Simple)
> Port 1 -> HPH L/R
> Port 2 -> CLASS H Amp
> Port 3 -> COMP
> Port 4 -> DSD.
> 
> TX: (This get bit more complicated)
> Port 1: PCM
> Port 2: ADC 1 & 2
> Port 3: ADC 3 & 4
> Port 4: DMIC-0, DMIC-1, DIMC-2 , DMIC-3 and MBHC
> Port 5: DMIC-4, DMIC-5, DMIC-6 and DMIC-7
> 
> We handle the port allocation dynamically based on mixer and dapm 
> widgets in my code! Also channel allocations are different for each 
> function!

Sorry, I am not following here. What is dynamic here and use-case 
dependent? And is this a mapping on the master or the codec sides that 
you want to modify?

>> Does this help and can you align on what Intel started with?
> 
> Firstly, This is where the issue comes, if we go with the 
> suggested(dai->id) solution, we would end up with a long list of 
> dai-links with different combinations of both inputs/output connections 
> and usecases. Again we have to deal with limited DSP resources too!
> 
> Secondly, The check [1] in stream.c will not allow more than one master 
> port config to be added to master runtime. Ex: RX Port 1, 2, 3 is used 
> for Headset Playback.

I am confused here, we do have examples in existing codec drivers where 
we use multiple ports for a single stream, e.g. for IV feedback we use 2 
ports.

In your "RX Port 1, 2, 3" example, are you referring to the codec or the 
master side? If it's for the codec, it's already supported, see e.g. 
https://github.com/thesofproject/linux/pull/2514, we use DP2 and DP4 for 
the same stream. This is done with the port_config capability.


