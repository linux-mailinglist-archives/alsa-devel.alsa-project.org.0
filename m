Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EC2300185
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 12:28:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 968AD1B15;
	Fri, 22 Jan 2021 12:27:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 968AD1B15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611314880;
	bh=w8TYDyEYykkC1nn7LyAkiN6ulBqqG5ms8mrwnI6ZU7E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q8uVdh2SlG19fEA0UjfA09Z0eKPd4fDKBYn+fQ2h1iLUysAM7IyorJ26WUg8IXyR2
	 4PSY2mzMW68zzbB4snvs4qcVRAQ0q358LsWPMueJ9V9G+KWejGP6dVuUrmttlNuuJM
	 72S7kPosth7/tHpula8Xi6MOn4t7mpGfcG9o/oV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 508A8F80227;
	Fri, 22 Jan 2021 12:26:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44C0EF80218; Fri, 22 Jan 2021 12:26:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from a1.mail.mailgun.net (a1.mail.mailgun.net [198.61.254.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CBD1F8019B
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 12:26:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CBD1F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="unMvjdoQ"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611314815; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EcxNP+TLzuN0BO2fcJ/dlWRSp4kMBjsiagD6HdDAIt4=;
 b=unMvjdoQhrqV0HhrvAPqlh5sgcORfE9BM8lVZybIjK1OtLqnRgdiMSvHNeX5VG3BUSI7NiAf
 WzlUt/RtnFVru7h+mCXy+aShS9SBB4UzK5EHyk4+q4vJKoG9hK/Lsa7X1SU9MCTj/X58xOnm
 rrmxeipsDVKA+tJflot0BojjqiI=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 600ab665bdcf4682872b58a4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 Jan 2021 11:26:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 437AAC433ED; Fri, 22 Jan 2021 11:26:28 +0000 (UTC)
Received: from [192.168.29.24] (unknown [49.37.157.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 835D6C433C6;
 Fri, 22 Jan 2021 11:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 835D6C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH] ASoC: qcom: Fix number of HDMI RDMA channels on sc7180
To: Mark Brown <broonie@kernel.org>, Stephen Boyd <swboyd@chromium.org>
References: <20210115203329.846824-1-swboyd@chromium.org>
 <161125795422.35635.5979635189908672108.b4-ty@kernel.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <89cc3dfb-35da-3498-b126-b440c91f9a45@codeaurora.org>
Date: Fri, 22 Jan 2021 16:56:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <161125795422.35635.5979635189908672108.b4-ty@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 V Sujith Kumar Reddy <vsujithk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

Hi Mark and Boyd,

Thanks for your time on this issue.

In my opinion, It 's better not to apply this patch.

I will post patch with changing size in sc7180.dtsi file.


On 1/22/2021 1:09 AM, Mark Brown wrote:
> On Fri, 15 Jan 2021 12:33:29 -0800, Stephen Boyd wrote:
>> Suspending/resuming with an HDMI dongle attached leads to crashes from
>> an audio regmap.
>>
>>   Unable to handle kernel paging request at virtual address ffffffc018068000
>>   Mem abort info:
>>     ESR = 0x96000047
>>     EC = 0x25: DABT (current EL), IL = 32 bits
>>     SET = 0, FnV = 0
>>     EA = 0, S1PTW = 0
>>   Data abort info:
>>     ISV = 0, ISS = 0x00000047
>>     CM = 0, WnR = 1
>>   swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000081b12000
>>   [ffffffc018068000] pgd=0000000275d14003, pud=0000000275d14003, pmd=000000026365d003, pte=0000000000000000
>>   Internal error: Oops: 96000047 [#1] PREEMPT SMP
>>   Call trace:
>>    regmap_mmio_write32le+0x2c/0x40
>>    regmap_mmio_write+0x48/0x6c
>>    _regmap_bus_reg_write+0x34/0x44
>>    _regmap_write+0x100/0x150
>>    regcache_default_sync+0xc0/0x138
>>    regcache_sync+0x188/0x26c
>>    lpass_platform_pcmops_resume+0x48/0x54 [snd_soc_lpass_platform]
>>    snd_soc_component_resume+0x28/0x40
>>    soc_resume_deferred+0x6c/0x178
>>    process_one_work+0x208/0x3c8
>>    worker_thread+0x23c/0x3e8
>>    kthread+0x144/0x178
>>    ret_from_fork+0x10/0x18
>>   Code: d503201f d50332bf f94002a8 8b344108 (b9000113)
>>
>> [...]
> Applied to
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
>
> Thanks!
>
> [1/1] ASoC: qcom: Fix number of HDMI RDMA channels on sc7180
>        commit: 7dfe20ee92f681ab1342015254ddb77a18f40cdb
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

