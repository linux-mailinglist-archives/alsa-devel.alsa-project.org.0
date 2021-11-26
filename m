Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2291D45ECF5
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 12:50:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F7F41908;
	Fri, 26 Nov 2021 12:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F7F41908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637927438;
	bh=YlqUYOXq2aHxQbQesSZ2M0+x3OxsQxK++T3SIY62JO0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bA+UKS2s5ut1iFnR+Zjei/c1FDBJbix+hkhdWqzdyQBGIU7al96NFNI4RyAgL0rB8
	 ybhH+IWJwc7hq2WMxHWDA3bZXx6EHUcZ8uD+7d0fQEmS/dEwiDbLt+uIC1l5pENJ7n
	 m4KllvDeokDRZ+goSu3JWh8EJ8NEc1JSerFtFDSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C54CF80245;
	Fri, 26 Nov 2021 12:49:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18C62F80212; Fri, 26 Nov 2021 12:49:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75664F80166
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 12:49:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75664F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="GcZO+879"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637927358; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=oZgdyvo1io3Ueda7LDecb0wwryFOu5iilAfeWEuxHaA=;
 b=GcZO+879TkWffTCbMWnmzLWGFL8Zh+uoujdGvBSxhtSRpiz18lS7nd507j4df2BuCafu5rB9
 Ks+9HXQzMxtQaSLD95KiuOXwcpv+sbTzOBEQKPlNdRQH22ErBXVAAfi/233rRD7cRuuQzOtx
 qYx1+IHuOb64dtp+sEd+Gp5Ge48=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61a0c9ace7d68470af743d0f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Nov 2021 11:49:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6196BC4360C; Fri, 26 Nov 2021 11:48:59 +0000 (UTC)
Received: from [10.242.143.72] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9BBDEC4338F;
 Fri, 26 Nov 2021 11:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9BBDEC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v4 00/10] Add support for audio on SC7280 based targets
To: Mark Brown <broonie@kernel.org>
References: <1635838265-27346-1-git-send-email-srivasam@codeaurora.org>
 <YZUT6BQKz00jXov9@sirena.org.uk>
 <e01729cd-0b2b-fe27-809b-c75ccbb6fac4@codeaurora.org>
 <YZ+z+XPyecvDJA88@sirena.org.uk>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <e69ac087-f78c-65e0-4ea9-dc408a69255c@codeaurora.org>
Date: Fri, 26 Nov 2021 17:18:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZ+z+XPyecvDJA88@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, rohitkr@codeaurora.org,
 swboyd@chromium.org, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


On 11/25/2021 9:34 PM, Mark Brown wrote:
> On Thu, Nov 18, 2021 at 03:35:46PM +0530, Srinivasa Rao Mandadapu wrote:
>> On 11/17/2021 8:08 PM, Mark Brown wrote:
>>> On Tue, Nov 02, 2021 at 01:00:55PM +0530, Srinivasa Rao Mandadapu wrote:
>>>
>>>> This patch set depends on:
>>>> 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=570161
>>>> 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=572615
>>>> 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=559677
>>> None of those links seem to show any patches (or errors)?
>> Sorry for Inconvenience Rob. I think due to it's status change patches are
>> not being appeared on provided link.
> I'm not Rob...
Sorry.. Brown.😁
>
>> With removing filter able to see patch set. Below are the links with view
>> filter change.
>>
>> -- 
>> https://patchwork.kernel.org/project/alsa-devel/list/?series=570161&archive=both&state=*
> Please note this bit of the mail:
>
>>> Please include human readable descriptions of things like commits and
>>> issues being discussed in e-mail in your mails, this makes them much
>>> easier for humans to read especially when they have no internet access.
>>> I do frequently catch up on my mail on flights or while otherwise
>>> travelling so this is even more pressing for me than just being about
>>> making things a bit easier to read.
> So it looks like we still depend on at least the sc7280 machine driver?
Yes. Currently it depends on Machine driver.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

