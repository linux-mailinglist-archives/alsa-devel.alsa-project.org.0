Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8731C2D9830
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 13:45:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 035EB1772;
	Mon, 14 Dec 2020 13:44:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 035EB1772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607949942;
	bh=U9q/RNBhkfqvglBjEu9KMafmOj5ICycxYvU4X1KQDt4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P4nS+x3OyhqMCE/cRcACDtFaeFevncj6aStbdv/EHoZH8tS7Koousq7Yu9Orwbgha
	 sM+SOg7MLdaGQTdk8rFrUHMjVbFeABKB2pIEIjUb7jexkAC/LYBusXqmujHIsuQKDD
	 ssgQbMZcOQUp7PkK/eGm1POgdcEYMd1Fw+s9K1ao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E37AF80240;
	Mon, 14 Dec 2020 13:44:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D17B0F801F7; Mon, 14 Dec 2020 13:43:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60E3CF800ED
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 13:43:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60E3CF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="aTOy27k5"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1607949833; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EtLiKOSmtdxM3lPu08opt0J1Uv63PkkfxPsuqDSZOg4=;
 b=aTOy27k5z41ncKdXjuyiPHw7bUrwN/jzmiVjDogzeOu05ZCDdjIMMni45qi9LWzpBM7Qhtnl
 qBp7azzoJ7BTBC8DPkZsejJQ3OilrvFbg5p+hL4LVsa4WsgvjAlK/G3caLZqv74iLNUFG9QJ
 pM3uHzF1oaPHMifQkp8CVWrPYjU=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fd75df41c400338e540b622 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Dec 2020 12:43:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5DDB7C43461; Mon, 14 Dec 2020 12:43:31 +0000 (UTC)
Received: from [10.242.141.31] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 72E11C433C6;
 Mon, 14 Dec 2020 12:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 72E11C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v4 1/2] Partially revert ASoC: qcom: Fix enabling BCLK and
 LRCLK in LPAIF invalid state
To: Mark Brown <broonie@kernel.org>
References: <1606539559-4277-1-git-send-email-srivasam@codeaurora.org>
 <1606539559-4277-2-git-send-email-srivasam@codeaurora.org>
 <20201130124617.GC4756@sirena.org.uk>
 <966993b7-4720-bdd2-cf4d-cf5a7c11a0c1@codeaurora.org>
 <20201201175135.GO5239@sirena.org.uk>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <89456f01-aa02-7a7d-a47b-bf1f26e66d4c@codeaurora.org>
Date: Mon, 14 Dec 2020 18:13:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201201175135.GO5239@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
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

Thanks Mark for Your time!!!

On 12/1/2020 11:21 PM, Mark Brown wrote:
> On Tue, Dec 01, 2020 at 11:01:21PM +0530, Srinivasa Rao Mandadapu wrote:
>> On 11/30/2020 6:16 PM, Mark Brown wrote:
>>> Part of this commit message says that the problem was making the registers
>>> non-volatile but both the change and the rest of the commit message say
>>> that the issue was that the registers were made volatile.  I'm also
>>> still unclear as to what the issue is either way - how does reading the
>>> state of the registers from the hardware instead of the cache affect
>>> things?
>> Initial problem was, during playback if device suspended, I2S and DMA
>> control registers
>> are getting reset and unable to recover playback after resume.
>> As these registers were non volatile registers, driver is not getting actual
>> register value
>> and unable to report error state to application. Due to this application
>> keeps on polling for HW current pointer state and not exited from PCM
>> running state.
>> Later from review comments by Srinivas kandagatla, I got to know
>>
>> about regcache sync APIs, which can be used  to sync cache after resume and
>>
>> HW registers can be updated with  original values. With that playback can be
>> continued.
>>
>> So is the reason, I am reverting partial changes in the commit b1824968221c.
> I don't understand why a fix for the register cache not being in sync
> with the hardware doesn't involve syncing the register cache with the
> hardware.

I am sorry I couldn't understand your point. Could you please elaborate 
your query?

Actually I posted V5 version based on review comments.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

