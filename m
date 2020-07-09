Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A57B219D50
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 12:14:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D68D51614;
	Thu,  9 Jul 2020 12:14:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D68D51614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594289694;
	bh=DjxGdoEO0Wc0O9doBVGdvGDo+IPdXfYZ232IDe3j80s=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oz9MhgGiVfBhmSnucam9rjqykfbn/gr9k866dltCoF7KmZEChF19dyWIP9PkJ8seV
	 e1Fe1qgN+N0sag17dKSCrIryEvcqI2sKVGCxqkBs35iLQ1o4UkdZstCalV1Q24W9Ax
	 76EYkcflvXOfjkmaEnH/nV8US7NNKQTg7pAsqEnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A3B8F8011F;
	Thu,  9 Jul 2020 12:13:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CACE2F801F9; Thu,  9 Jul 2020 12:13:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, RCVD_IN_SORBS_WEB, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A7E9F80117
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 12:13:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A7E9F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="FKZCpj2R"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594289586; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=wWq91HAC/ZSJGdVzwMRWL+Q0WO0UCK3z/tPDOpaZ6gU=;
 b=FKZCpj2Rvdz04VIW0/1F19AZTvlHOqpYTCO2q5O/2v/hqq+8VaiD1mL2PEzsfTlXtOcBQozm
 PgGgtmt2WL9YBrqHKJ0Dcn02bLsyl3P5ExUI7yyUupmFiDN9yNVyIGpJmnVNX4dospOZc/72
 OsDTDNcN8c5BI4VQ/XZVbrUNlOw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5f06ed9ec9789fa906cdc389 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 10:12:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D14D6C43395; Thu,  9 Jul 2020 10:12:45 +0000 (UTC)
Received: from [192.168.0.129] (unknown [183.83.142.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 437E9C433C6;
 Thu,  9 Jul 2020 10:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 437E9C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
Subject: Re: [PATCH v3 6/8] dt-bindings: sound: lpass-cpu: Add sc7180 lpass
 cpu node
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-7-git-send-email-rohitkr@codeaurora.org>
 <6b6b0e38-9c04-e065-8a43-ccfec260d60c@linaro.org>
 <430e0d24-c5c2-84ec-fe7b-b6b27192666d@codeaurora.org>
 <de07f84b-40bc-d9ae-932d-623a5e8341e2@linaro.org>
From: Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <40ca93fe-5bf0-ace3-4f95-90624d29a409@codeaurora.org>
Date: Thu, 9 Jul 2020 15:42:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <de07f84b-40bc-d9ae-932d-623a5e8341e2@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 7/9/2020 3:38 PM, Srinivas Kandagatla wrote:
>
>
> On 09/07/2020 11:01, Rohit Kumar wrote:
>>
>> On 7/9/2020 2:57 PM, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 08/07/2020 06:08, Rohit kumar wrote:
>>>> Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.
>>>>
>>>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>>>> ---
>>>>   Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt | 3 ++-
>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git 
>>>> a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt 
>>>> b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>>> index 32c2cdb..04e34cc 100644
>>>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>>> @@ -4,7 +4,8 @@ This node models the Qualcomm Technologies 
>>>> Low-Power Audio SubSystem (LPASS).
>>>>     Required properties:
>>>>   -- compatible        : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu"
>>>> +- compatible        : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
>>>> +              "qcom,lpass-cpu-sc7180"
>>>>   - clocks        : Must contain an entry for each entry in 
>>>> clock-names.
>>>>   - clock-names        : A list which must include the following 
>>>> entries:
>>>>                   * "ahbix-clk"
>>>
>>> Can you also list the clocks that are mandatory for this SoC.
>>>
>>> --srini
>>>
>> Will it be fine if I update it in patch 8 only where we have moved to 
>> yaml format?
>>
> May be reverse the order, Convert to Yaml first and then add sc7180!

Actually Mark suggested to keep yaml change at the end of patch series 
as there

are pending yaml patch reviews and it might take time. If we keep yaml 
change before sc7180

change, then it will get blocked until yaml review. For now, I can 
update in exisiting

documentation. Please suggest.

Thanks

>
> --srini
>> Thanks,
>>
>> Rohit
>>
>>>
>>>>
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

