Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 870C518801D
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 12:07:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1292A183C;
	Tue, 17 Mar 2020 12:06:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1292A183C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584443269;
	bh=DiuLaOBXCsz7WvUJMGxKZzFNyQlB9CIP8l10XUfYL7c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GqUoeiUR/BcN9feNK+szDL740kNjG6hNYZ7udTJTs2uj3Ix1ll10Y/q3Nc7MderaT
	 qjvzWzBuWbZiaZRNzYBUXBs3kGPcTA6sHL4MSVV8tcifpuJwhrP6fQpOTEJAIns7bR
	 F5gVGXYM7d8jHmj+rqvi7dZEYnCuLh6h4L5r3amg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63C27F80232;
	Tue, 17 Mar 2020 12:06:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99294F8022B; Tue, 17 Mar 2020 12:05:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4799AF800C0
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 12:05:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4799AF800C0
IronPort-SDR: 3rOZfeZ1Zv6NVR2HjW4yeh2f+BPA8gpVNbEh703F/a5rVCdb/dbaaxTE+THow/MQqZESu1WB//
 e16dwCqc27EA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 04:05:08 -0700
IronPort-SDR: bgfHtvH1a3H3Nhd/LyCgZIcuiaeiG022Nl/oQcRTlKJ75NNSMvbr4tUmFx/gdWLdhOY2c9BbuN
 UXBPXBfwKGxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; d="scan'208";a="290962544"
Received: from dasabhi1-mobl.amr.corp.intel.com (HELO [10.255.35.148])
 ([10.255.35.148])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Mar 2020 04:05:07 -0700
Subject: Re: [PATCH 0/2] ASoC: sdm845: fix soundwire stream handling
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20200317095351.15582-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a442a21e-47ce-f304-5bfb-06958d078a78@linux.intel.com>
Date: Tue, 17 Mar 2020 06:05:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317095351.15582-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
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

Hi Srinivas,

On 3/17/20 4:53 AM, Srinivas Kandagatla wrote:
> Recent addition of SoundWire stream state-machine checks in linux-next
> have shown an existing issue with handling soundwire streams in codec drivers.
> 
> In general soundwire stream prepare/enable/disable can be called from either
> codec/machine/controller driver. However calling it in codec driver means
> that if multiple instances(Left/Right speakers) of the same codec is
> connected to the same stream then it will endup calling stream
> prepare/enable/disable more than once. This will mess up the stream
> state-machine checks in the soundwire core.

That's a known issue that we've fixed on the Intel side a  month or two 
ago. Unfortunately the review cycle is so slow that you don't benefit 
immediately from our fixes, what can I say.

> Moving this stream handling to machine driver would fix this issue
> and also allow board/platform specfic power sequencing.

It's fine but that's unnecessary, and if you start having multiple 
machine drivers with the same codecs you'll duplicate the stream 
handling code.

All you need to ensure in a multi-codec or multi-cpu dai case is that 
the stream is allocated once, and yes that's typically done as part of 
the dailink .startup callback.

Then it's fine to call the stream prepare or enable multiple times from 
the individual dai level, and only do the transition for the first call.

See patch "soundwire: stream: only change state if needed" that I just 
shared. We've used it both in 'TDM' mode with two codecs hanging off of 
the same link and in 'aggregated' mode with two codecs on separate links.


> Srinivas Kandagatla (2):
>    ASoC: qcom: sdm845: handle soundwire stream
>    ASoC: codecs: wsa881x: remove soundwire stream handling
> 
>   sound/soc/codecs/wsa881x.c | 44 +-----------------------
>   sound/soc/qcom/Kconfig     |  2 +-
>   sound/soc/qcom/sdm845.c    | 69 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 71 insertions(+), 44 deletions(-)
> 
