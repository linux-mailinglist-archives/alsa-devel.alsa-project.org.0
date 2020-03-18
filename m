Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 942AE18A13D
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 18:11:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 047F21729;
	Wed, 18 Mar 2020 18:10:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 047F21729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584551500;
	bh=jER5BF7iUzKj2ITDA1X1ybD6zPWA/VuWruH9UTPl4zo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZFbfjoAskjCWLAEjjxr3uezFCgbzxdo3FAPYf3Lf2GbDF8LPja1/oXOuyxPaWBlby
	 YzLpVuiw96zJiRxE8Z4OzOfs0inO9QM1lruolhVMhJagGeRqSB4CSyyUMOIw9/ulp+
	 +aBLEZGN+HL7y9GY8sIkAZj2+Ts0aExvYPMzmZoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4B84F80058;
	Wed, 18 Mar 2020 18:09:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B262F8015B; Wed, 18 Mar 2020 18:09:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15833F80058
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 18:09:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15833F80058
IronPort-SDR: DDzAWm98fgj0tRGkMPz1s2KUnQJd+xI+OaH8r8RHOmrbJO072ms4fV3hOs/l02QpuFaguTR0Hb
 YgJxw/FfkaSA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 10:09:47 -0700
IronPort-SDR: f481HSyPpRKmelyJY/WmmDt+1dK/TzPlXi0k4IiiQ42LSybYx8Elt3v99cWghv3fAev4dnIUPd
 sqTW+JHWkLTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; d="scan'208";a="418019258"
Received: from nali1-mobl3.amr.corp.intel.com (HELO [10.255.33.194])
 ([10.255.33.194])
 by orsmga005.jf.intel.com with ESMTP; 18 Mar 2020 10:09:45 -0700
Subject: Re: [PATCH 1/2] ASoC: qcom: sdm845: handle soundwire stream
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20200317095351.15582-1-srinivas.kandagatla@linaro.org>
 <20200317095351.15582-2-srinivas.kandagatla@linaro.org>
 <8daeeb26-851b-8311-30f5-5d285ccbc255@linux.intel.com>
 <69c72f5a-e72e-b7b3-90cb-a7354dcb175d@linaro.org>
 <cbc6cc9b-24f5-8c2a-b60d-b5dab08c128e@linux.intel.com>
 <fcf845bd-9803-ab04-d2a9-c258ddfcc972@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c8738ecf-727f-2063-8aa0-46fc1c338383@linux.intel.com>
Date: Wed, 18 Mar 2020 11:53:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <fcf845bd-9803-ab04-d2a9-c258ddfcc972@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, vkoul@kernel.org,
 lgirdwood@gmail.com
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



On 3/18/20 10:57 AM, Srinivas Kandagatla wrote:
> 
> 
> On 18/03/2020 15:26, Pierre-Louis Bossart wrote:
>>
>> Same comment, how does the notion of cpu_dai come in the picture for a 
>> SoundWire dailink?
>> Would you mind listing what the components of the dailinks are?
> 
> dais that I was referring here are all codec dais from backend-dai.
> 
> Device tree entries from
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sdm845-db845c.dts?h=next-20200318#n538 
> 
> 
> 
> Frontend-dai:
>      mm1-dai-link {
>          link-name = "MultiMedia1";
>          cpu {
>              sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
>          };
>      };
> 
> Backend-dai:
>      slim-dai-link {
>          link-name = "SLIM Playback";
>          cpu {
>              sound-dai = <&q6afedai SLIMBUS_0_RX>;
>          };
> 
>          platform {
>              sound-dai = <&q6routing>;
>          };
> 
>          codec {
>              sound-dai =  <&left_spkr>, <&right_spkr>, <&swm 0>, 
> <&wcd9340 0>;
>          };

Thanks, I didn't realize this and now understand your point.

I guess that means we've officially stretched the limits of the DPCM 
model though, lumping all codec dais from separate devices into the same 
'backend' doesn't seem like a very good path forward, we'd really need a 
notion of domain to represent such bridges.

For now for the series

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
