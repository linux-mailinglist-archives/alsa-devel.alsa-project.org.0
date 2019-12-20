Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D10C8127FD6
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 16:51:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 457A215F8;
	Fri, 20 Dec 2019 16:50:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 457A215F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576857090;
	bh=FMhmYudlLP73AL7FvC1LxFF3Kh9FnnD077E157yVeNI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y6RcjqN4qIMu63LMF4OiXo84VL2PHiG0jwnDnXgKfXfNtu3Qk8D9vUkcP8wpyHK0K
	 Ofm+84lN2i8qrkkeTNU1nFhrY1phr88Yy7mODtqz3bQiGtZsF3NaeWoYQ+t4a/QsdU
	 fElzaELPAsDs9Z+896E0+Y/uMGSDK+r0UpcCfiL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF2B6F8014C;
	Fri, 20 Dec 2019 16:49:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7E48F8022C; Fri, 20 Dec 2019 16:49:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A46CF80059
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 16:49:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A46CF80059
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2019 07:49:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,336,1571727600"; d="scan'208";a="267551905"
Received: from pkriegsm-mobl.amr.corp.intel.com (HELO [10.252.132.172])
 ([10.252.132.172])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Dec 2019 07:49:34 -0800
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org, 
 lee.jones@linaro.org, linus.walleij@linaro.org
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
 <20191219103153.14875-3-srinivas.kandagatla@linaro.org>
 <af48cd71-fa1a-dbc5-0e88-e315ea13c28c@linux.intel.com>
 <db36d6d7-40a2-bbd2-f299-838abf4d92cc@linaro.org>
 <4492b71e-9923-365c-f22c-3766e2d5bae2@linux.intel.com>
 <3fa4997f-4409-97f6-ba10-a87013383eb7@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <df1c8ef8-2619-99b7-317c-1970c9413d00@linux.intel.com>
Date: Fri, 20 Dec 2019 09:22:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <3fa4997f-4409-97f6-ba10-a87013383eb7@linaro.org>
Content-Language: en-US
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vinod.koul@linaro.org, devicetree@vger.kernel.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v6 02/11] mfd: wcd934x: add support to
 wcd9340/wcd9341 codec
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



>>> Note these are the child devices of the MFD SLIMBus device.
>>
>> Ah ok. I guess the creation of those child devices when the parent 
>> SLIMbus device reports PRESENT initially if fine, it's the part where 
>> you remove them if the device loses sync or gets powered off which is 
>> odd. And I guess technically you could still have race conditions 
>> where a child device starts a transaction just as the parent is no 
>> longer attached to the bus.
> 
> Losing power to SLIMBus device is very odd usecase and if it happens 
> suggests that threre are bigger issues on the board design itself. This 
> case should never happen. Even if it happens we would get timeout errors 
> on every SLIMbus transactions.
> 
>>
>>>> I would however not remove the devices when the status is down but 
>>>> only on an explicit .remove.
>>>
>>> Am open for suggestions but I would not like the child devices to 
>>> talk on the bus once the SLIMbus device is down! Only way to ensure 
>>> or make it silent is to remove.
>>
>> it's as if you are missing a mechanism to forward the parent status to 
>> the children so use remove() for lack of a better solution?
> That is true. This gives bit more control on the slave device lifecycle.
> Current solution works fine for now with less complexities across 
> multiple drivers. I also agree that there is scope of improvement in 
> future for this.

ok, makes sense, thanks for the answers. No further questions, so

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
