Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DAF219CE0
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 12:03:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 962B842;
	Thu,  9 Jul 2020 12:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 962B842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594289013;
	bh=e2oxi+dhjzfG6io2NEnNfiYHQVSAk98wop6KTNLVa2E=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FISClcmEU0DPiznQxPNE7SQujrpeue+INYUrargK4HKvg3vgXWCdE7RrCKIK0191M
	 hsqpFSgM9gedKinDYHrMX7NqX5ZsGSyTzz9QMFVf7PI91mbWPeNoA+y5y9TPka1/Qc
	 iEsYrLr5GLuiDlIl9EFf9GtX2kaIVyIwJLs8rvSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C390FF8011F;
	Thu,  9 Jul 2020 12:01:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19127F801F9; Thu,  9 Jul 2020 12:01:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H4, RCVD_IN_MSPIKE_WL, RCVD_IN_SORBS_WEB, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2759F800AE
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 12:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2759F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="LUuS9D9Q"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594288904; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=Vcf4pT1GA5PBOflu7PbMdZ+iJ9F8+ASAMkKs46dXbG8=;
 b=LUuS9D9QXM26zU0HHckKr0aaFvnXfXt1Lk6zrLnwoG0in9StTz0dTTZ8AiMsVYTEnUf7jryp
 rcibVDOKhtWeSJe5gYupFYGqId8Qe3u2eYobtjyuuKtL0REaOt9PfdIkMnUnF8vRJn/Z8EtA
 XpaQ2JVwHNTMaHV5Yu9il2zCWew=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-east-1.postgun.com with SMTP id
 5f06eaf3bca1ed31553af126 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 10:01:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5CA31C433C6; Thu,  9 Jul 2020 10:01:22 +0000 (UTC)
Received: from [192.168.0.129] (unknown [183.83.142.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 50F85C433C8;
 Thu,  9 Jul 2020 10:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 50F85C433C8
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
From: Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <430e0d24-c5c2-84ec-fe7b-b6b27192666d@codeaurora.org>
Date: Thu, 9 Jul 2020 15:31:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6b6b0e38-9c04-e065-8a43-ccfec260d60c@linaro.org>
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


On 7/9/2020 2:57 PM, Srinivas Kandagatla wrote:
>
>
> On 08/07/2020 06:08, Rohit kumar wrote:
>> Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.
>>
>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt 
>> b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>> index 32c2cdb..04e34cc 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>> @@ -4,7 +4,8 @@ This node models the Qualcomm Technologies Low-Power 
>> Audio SubSystem (LPASS).
>>     Required properties:
>>   -- compatible        : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu"
>> +- compatible        : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
>> +              "qcom,lpass-cpu-sc7180"
>>   - clocks        : Must contain an entry for each entry in clock-names.
>>   - clock-names        : A list which must include the following 
>> entries:
>>                   * "ahbix-clk"
>
> Can you also list the clocks that are mandatory for this SoC.
>
> --srini
>
Will it be fine if I update it in patch 8 only where we have moved to 
yaml format?

Thanks,

Rohit

>
>>
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

