Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E73FA28D921
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 06:21:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 745B916C1;
	Wed, 14 Oct 2020 06:20:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 745B916C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602649297;
	bh=2Ny7BcUIi7yDelPN95PAx5itdaCMv/c5gmTpDmj9gNc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kfm0m88PGs9+eH+Wjg4YGWTuh1mYB7I8uHr9G/8VRO3IkDCgOmkSJG1Yix9hJTB4v
	 E17MPh1iiiYOZqbrIcPV6rTYmxSrnavXIgjkMKvKN4G7vNPuFUN4owxlSlsdFUHFcn
	 NarLbx0BusPTRWpPW3CqPxokGAgbzteu99y8yILc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 224D6F800F6;
	Wed, 14 Oct 2020 06:19:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19D19F80217; Wed, 14 Oct 2020 06:19:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94A80F8012B
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 06:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94A80F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="OCQRk2XG"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1602649187; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=HOggyxgAIuw5vh136a7l4IRaEFhhlZ9M1Zj7qRah5nQ=;
 b=OCQRk2XG9xyBNa9K+EJia7KeshW32qzL/w7WHyqOzhislml02b1XjMwhl0XJg3FvVl+5ket8
 jRPPIfm47gqcbloR1TpoplLzdNPoF0jqvSTJ+8/8K7oKgJPnWF5Teh1Jr8Iy4r5zXrx/JUgB
 w6WUt23sBTunIkQj2Ag8byy8BXg=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f867c6183370fa1c1322f4a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Oct 2020 04:19:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 46CFCC433FF; Wed, 14 Oct 2020 04:19:45 +0000 (UTC)
Received: from [192.168.29.24] (unknown [49.37.131.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 50618C433CB;
 Wed, 14 Oct 2020 04:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 50618C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH 1/2] Asoc: qcom: lpass-cpu: Fix clock disable failure
To: Mark Brown <broonie@kernel.org>
References: <1602596386-9886-1-git-send-email-srivasam@codeaurora.org>
 <20201013151505.GA7913@sirena.org.uk>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <49ac01c8-d270-5e9b-360b-87909e550360@codeaurora.org>
Date: Wed, 14 Oct 2020 09:49:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201013151505.GA7913@sirena.org.uk>
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

Thanks  Mark Brown for your time !!!

On 10/13/2020 8:45 PM, Mark Brown wrote:
> On Tue, Oct 13, 2020 at 07:09:46PM +0530, Srinivasa Rao Mandadapu wrote:
>> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>>
>> Disable MI2S bit clock from PAUSE/STOP/SUSPEND usecase
>> instead of shutdown time. Acheive this by invoking
>> clk_disable_unprepare API from cpu daiops shutdown to
>> cpu daiops trigger.
> I'm missing patch 2 here?
No.. It's a single patch. By mistake I sent with wrong header.
>
>> This Fix is update to the below patch.
>> https://lore.kernel.org/patchwork/patch/1308101/
> Fixes should be specified using tags like this:
>
>    Fixes: commit 30fb9454ab23 ("selftests/vm: hmm-tests: remove the libhugetlbfs dependency")
>
> in the changelog.
Thanks for your guidance. I will take care of it next time.
>
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

