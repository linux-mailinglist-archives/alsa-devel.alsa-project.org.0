Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C25592DCD79
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 09:16:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EB4C1710;
	Thu, 17 Dec 2020 09:15:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EB4C1710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608192992;
	bh=CI1AanPGBi5R2zs6b8Xijp4JCDoEx68Q8qujehOGp1E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PH2fXkuYyGZE/TfE6rksfyCBTtXjyVhN5I6jD3C75fnZ4JacixH3XfinoHsXDhUB8
	 tk86k44GjyqGkuNuyUfnV5D9Vg1BVzHZg0F7aj5cuM6A5qptEfGdn6CPZrt84sijXn
	 fRujiT7xMoBEVHAyVwBBbg8UnR+42LXSpVjA5tno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3886F80260;
	Thu, 17 Dec 2020 09:14:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 037B6F8014B; Thu, 17 Dec 2020 09:14:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BF7FF80148
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 09:14:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BF7FF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="peuY6rsa"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608192890; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Vl15HlNa4mtXvZ1I16t5kCLv5QtQ8BV4wsxKyd1mo5E=;
 b=peuY6rsa/c+GHoOH0+jBLzrDcLGYEdCXUBi0+Vxiafj14ISdZ/wj5/TaGJZ6sfwCRUUfxoki
 pYsuYoVuO3FmCF7QQrH26l58qovj70jO2No6dyYvIdiZn8l9bvgnHSYb9cgngncA7DUMC1bn
 daFgQNFHAyCaEjw4skxE7hLyxoM=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5fdb13790564dfefcdffbfa1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 08:14:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 52687C43461; Thu, 17 Dec 2020 08:14:48 +0000 (UTC)
Received: from [10.252.214.131] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AF250C433C6;
 Thu, 17 Dec 2020 08:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AF250C433C6
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
 <89456f01-aa02-7a7d-a47b-bf1f26e66d4c@codeaurora.org>
 <20201214175009.GD4880@sirena.org.uk>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <043ecf21-bf1c-8a32-f079-a526dfc90b6e@codeaurora.org>
Date: Thu, 17 Dec 2020 13:44:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201214175009.GD4880@sirena.org.uk>
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

Thanks Mark for your Time!!!

On 12/14/2020 11:20 PM, Mark Brown wrote:
> On Mon, Dec 14, 2020 at 06:13:22PM +0530, Srinivasa Rao Mandadapu wrote:
>> On 12/1/2020 11:21 PM, Mark Brown wrote:
>>>> Later from review comments by Srinivas kandagatla, I got to know
>>>>
>>>> about regcache sync APIs, which can be used  to sync cache after resume and
>>>>
>>>> HW registers can be updated with  original values. With that playback can be
>>>> continued.
>>>> So is the reason, I am reverting partial changes in the commit b1824968221c.
>>> I don't understand why a fix for the register cache not being in sync
>>> with the hardware doesn't involve syncing the register cache with the
>>> hardware.
>> I am sorry I couldn't understand your point. Could you please elaborate your
>> query?
> Your changelog talks about syncing the cache but neither the driver nor
> your change actually does that.

Yeah.. Now I posted v6 patch 
(https://lore.kernel.org/patchwork/patch/1354638/)

with subject lines explaining actual changes.

could you please check  the same.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

