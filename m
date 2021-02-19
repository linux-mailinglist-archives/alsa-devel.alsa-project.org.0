Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FEA32002B
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Feb 2021 22:15:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CE611661;
	Fri, 19 Feb 2021 22:14:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CE611661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613769304;
	bh=OX1Bom4NAV0DkIMAAsBtNfqcP+U+3CD2osts5lU+bk4=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=umiyCuwwlM/EpKx5UUhEm5vVGQelwmblV/1VerV7SAxLzANi6Aw7ZGnT7qyoEDrMm
	 OIraNuS3OhaCcsq31CYnHB2Zwdv2WNuAtudHt1FAb8Tt54QSluzexixD29h7IV1wWU
	 QnIyL/U+XscbQblp4+U+y8dxtTCKzq33Q5RZrvD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6734BF80258;
	Fri, 19 Feb 2021 22:13:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3966F8020B; Fri, 19 Feb 2021 22:13:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 735DBF800D0
 for <alsa-devel@alsa-project.org>; Fri, 19 Feb 2021 22:13:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 735DBF800D0
IronPort-SDR: NBMbtRN2F1yWH39B2+HqM2HBiaX1CruT7Smzfe6t4Qslp6QzLffCfH4W8SF10WjvxAhUGNEbbY
 S2JaARkksPPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="245402316"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="245402316"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 13:13:23 -0800
IronPort-SDR: HsXOnOiOE04PK4hZwZxbkf9Ni5x5InjymCk2606Ilyk0sKhTY8fo4pabPMIxfRsjAVOx7+S7iC
 V7+eHMAKL4AA==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="440422875"
Received: from cnolsen-mobl1.amr.corp.intel.com (HELO [10.209.128.197])
 ([10.209.128.197])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 13:13:22 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] soundwire: add support for static port mapping
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
References: <9a688b02-80a6-fb1f-d6fa-36ba2d88d3b9@linux.intel.com>
 <c6278763-57d9-2631-7b43-829259a9ea1f@linaro.org>
 <3ee60ad9-9635-649e-ba67-d40a96b25256@linux.intel.com>
 <487c91f9-f6ea-75c2-9150-52db2de42a3a@linaro.org>
 <eaf13d70-86fe-3e18-7a5a-4043f2d8a22d@linux.intel.com>
 <aaf34f07-5eed-3045-e4c6-dc9416689b20@linaro.org>
 <f960757f-ec8b-6d3f-f00e-27242c687926@linux.intel.com>
 <e962caa8-89c3-4a22-5932-4498c406e8f8@linaro.org>
 <adb91730-35db-db7a-75b3-4771723de945@linux.intel.com>
 <31ff9d2b-760a-374e-5b37-45d8e8116f7b@linaro.org>
 <20210201102709.GT2771@vkoul-mobl>
 <c8bb718d-c06d-2942-9c0b-2a6f97031e10@linaro.org>
Message-ID: <64d2537a-bd60-e0a3-c4aa-4f802c34102b@linux.intel.com>
Date: Fri, 19 Feb 2021 13:52:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c8bb718d-c06d-2942-9c0b-2a6f97031e10@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com
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



>>>> It seems you are in a different solution-space, where the codec driver
>>>> needs to notify the master of which ports it needs to use?
>>> Correct! As Codec is the place where we have mixer controls ant it can
>>> clearly tell which master ports should be used for that particular
>>> configuration.
>> And that should come from firmware (DT etc) and driver should pass on
>> this info
> 
> Are you okay with the patch as it is, provided this information is 
> populated from DT?

I am fine with the direction at a high-level. The premise for SoundWire 
is that the bus is simple enough that it can be used in different 
contexts and architectures, so if Qualcomm need something that differs 
from what is needed for Intel we are really not in a position to object.

That said, I could use more explanations on how the mapping is defined: 
I don't think we have the same definition of 'static port mapping'. For 
SDCA integration, we plan to have a static mapping in some sort of ACPI 
table that will describe which port on the Manager side is connected to 
which ports on Peripheral XYZ. That's static as in set in stone in 
platform firmware. I understand the reference to DT settings as the same 
idea.

But if the mapping depends on the value of mixer controls as you 
describe it, then it's not static and defined by DT settings, but 
run-time defined.

Also maybe we'd want to have a more opaque way of passing the 
information, maybe with a stream private data or a callback, instead of 
hard-coding fields that are only used by Qualcomm.


