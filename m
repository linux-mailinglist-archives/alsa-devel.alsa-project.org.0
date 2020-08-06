Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2BF23D5E9
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 06:02:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C890E829;
	Thu,  6 Aug 2020 06:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C890E829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596686546;
	bh=bzJ4dtXroWYGUCk/+lpxRnjmjTTQC4S4CNnyDNaHNfw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rm8XHRBjRJuNCNJNsv07Tl4Wp+EOCxjbJTxlCmiUyZM5/tlypiez+BqvinBCmlddN
	 MIydg515Es1eZp9XqsxWTWNuW+5pEpwULqN7gvxToZ4+CPh+3zNVSMxle1KvsbHvbz
	 QfJFTa4cUGVKKIA14XrWeSXvQ4OP3Yiidy7cPICs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC163F800B7;
	Thu,  6 Aug 2020 06:00:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD3CCF80159; Thu,  6 Aug 2020 06:00:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_MSPIKE_H2,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F664F800B7
 for <alsa-devel@alsa-project.org>; Thu,  6 Aug 2020 06:00:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F664F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="E0xfXNjS"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596686436; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=385LRkURABpjFHvOhGppwgzxlDi5diqKefwwA9AZkPM=;
 b=E0xfXNjSnqYklr5/91dC6c69Qx9mD7LZNArYvnu81NTSuhc3iT1kko3Z7GScdNUbLT9I3KHK
 M8sADWHR0TcZfdPYKYZBbMB5++F2DZyJ1Uye9UDQLENdLghtsmuuNBVR45d7PGWUYZttsXtj
 AbTJnh0gFREyhbCC7GdRTm6dGXg=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f2b804e725833be30595867 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 Aug 2020 04:00:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2DB8BC433CA; Thu,  6 Aug 2020 04:00:14 +0000 (UTC)
Received: from [192.168.0.129] (unknown [183.83.142.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D254C433C6;
 Thu,  6 Aug 2020 03:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0D254C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
Subject: Re: [PATCH v4 01/12] ASoC: qcom: Add common array to initialize soc
 based core clocks
To: Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
 <1595413915-17867-2-git-send-email-rohitkr@codeaurora.org>
 <159667391634.1360974.15763918681460437981@swboyd.mtv.corp.google.com>
From: Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <989f1d99-3cd0-e725-3f6d-43facf1ec04d@codeaurora.org>
Date: Thu, 6 Aug 2020 09:29:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <159667391634.1360974.15763918681460437981@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: Ajit Pandey <ajitp@codeaurora.org>
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

Thanks Stephen for reviewing.

On 8/6/2020 6:01 AM, Stephen Boyd wrote:
> Quoting Rohit kumar (2020-07-22 03:31:44)
>> From: Ajit Pandey <ajitp@codeaurora.org>
>>
>> LPASS variants have their own soc specific clocks that needs to be
>> enabled for MI2S audio support. Added a common variable in drvdata to
>> initialize such clocks using bulk clk api. Such clock names is
>> defined in variants specific data and needs to fetched during init.
> Why not just get all the clks and not even care about the names of them?
> Use devm_clk_bulk_get_all() for that, unless some clks need to change
> rates?

There is ahbix clk which needs clk rate to be set. Please check below 
patch in

the series for reference

[PATCH v5 02/12] ASoC: qcom: lpass-cpu: Move ahbix clk to platform 
specific function

Thanks,

Rohit

-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

