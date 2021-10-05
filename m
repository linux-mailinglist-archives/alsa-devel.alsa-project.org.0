Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB00422C22
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 17:15:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 616B11669;
	Tue,  5 Oct 2021 17:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 616B11669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633446903;
	bh=WQjdLaVGfmb29cCmEucMGmn1DBwCCk43ydhYKi278ek=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BCJ2lSModbAcf+LIzRjKunurwU7xYQY+boW6eKAWVBxydVhCB2Q+xU2aJrPB7Vp46
	 H55r4wfngdR1w3QBgN3C8tg8TISo7j+ZtCT9XukMrbP2ru8lvjQsNtq9equjjsNK/M
	 1iE88n+7O7V3cbRIcpzK9EmecO39rEcxZn2rTN0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDD39F8028B;
	Tue,  5 Oct 2021 17:13:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E43A2F8027D; Tue,  5 Oct 2021 17:13:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A1B0F8020D
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 17:13:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A1B0F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="ci3YUWau"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633446824; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=s3Xb4IsSqsYB8Xe3c7qxyiGRJeLbjA3gkFSG8+CibCw=;
 b=ci3YUWauTTzD3KiMBMK2iQYParPQqQbjJYUMgSsBqwr8OsJX06YBidxPPNXi56ygSwHhdBQ/
 rpRHZfqV50i8PRMx6qq4qMYaT0mhPHYF+F4ZqVbawDU/ntBjkzVGZ3DNUHN7Nni1oQWT0exW
 x6zo2qYTqztgMImU5QI2wYOZlVs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 615c6b937ae92c7fc90fdaba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 15:13:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DC1AEC43460; Tue,  5 Oct 2021 15:13:22 +0000 (UTC)
Received: from [192.168.1.102] (unknown [157.48.255.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7DCE6C4360C;
 Tue,  5 Oct 2021 15:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7DCE6C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] ASoC: qcom: soundwire: Enable soundwire bus clock for
 version 1.6
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1633105471-30928-1-git-send-email-srivasam@codeaurora.org>
 <a2b6a9c7-2191-4bc9-b03b-3b22b495a4be@linux.intel.com>
 <2c18ff0c-cd24-356c-0104-086837ed7ff0@codeaurora.org>
 <d485af5f-4dfb-df08-9a22-901b7534ca3b@linux.intel.com>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <f7fbf5e2-2f09-1df5-475a-cfe04f33059a@codeaurora.org>
Date: Tue, 5 Oct 2021 20:43:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d485af5f-4dfb-df08-9a22-901b7534ca3b@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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


On 10/5/2021 8:33 PM, Pierre-Louis Bossart wrote:
> Thanks for Your time Bossart!!!
>
>>>> +        ctrl->swrm_hctl_reg = devm_ioremap(&pdev->dev,
>>>> swrm_hctl_reg, 0x4);
>>> if (!ctrl->swrm_hctl_reg)
>>>       return -ENODEV;
>>>
>>> ?
>> I think here error check is not required, as this change is required
>> only for soundwire version 1.6 and above.
> My comment had nothing to do with versions, it's just that ioremap can
> fail and in general it's wise to test for errors...

Okay. My intention is if offset (swrm_hctl_reg) is zero, devm_ioremap 
may return error.

In that case we need to ignore error.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

