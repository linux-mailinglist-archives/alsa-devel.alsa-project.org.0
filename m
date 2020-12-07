Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B922D09DF
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 05:54:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB8B51738;
	Mon,  7 Dec 2020 05:53:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB8B51738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607316871;
	bh=LAKlJPf7KTPND4glmW2D738l9+goD4Zw+DCnnzW7RQU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tQEAZ1n0TIWJ7qiEgG1KkkUcNG8V78YIMDnq+vIvIc2tyqxw1kGYmJQgz60YXTEw1
	 9DvETx0kRNyhjQLzLbxJl+Guo6/jOh8IEZVoSLHvhvJgT1+LqxCB2P1Keg6wktvMAx
	 2AHyBKd3AacHZvhWH3htEP30xPjOu+RHuQORDM9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61501F80217;
	Mon,  7 Dec 2020 05:52:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3FACF8020D; Mon,  7 Dec 2020 05:52:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74A1CF8010A
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 05:52:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74A1CF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="cjwm6O4N"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fcdb51e0000>; Sun, 06 Dec 2020 20:52:46 -0800
Received: from [10.25.96.159] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Dec
 2020 04:52:42 +0000
Subject: Re: [PATCH v6 0/6] Tegra210 audio graph card
To: Mark Brown <broonie@kernel.org>, <thierry.reding@gmail.com>,
 <robh+dt@kernel.org>
References: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
 <160683107678.35139.14772386553150233276.b4-ty@kernel.org>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <a3541d83-1f2e-c60f-05f8-4fdd8c8f4175@nvidia.com>
Date: Mon, 7 Dec 2020 10:22:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <160683107678.35139.14772386553150233276.b4-ty@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1607316766; bh=a4fExwYSCzW8iKIEs03t5hkl0PLY9U5HKC1J+84tRhM=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=cjwm6O4NAxb/W+maQk/2sGdGDRj4MpwGSnFYip4dmHyIRdfKxdqAw/xMxz3lPIaB6
 tLB0lnQiIr1cMTQDDHiKSwnYghiJpu2OKoCa2kVanUMKZyN0/24hDqGPzHflFuxKgx
 2wFJ1gRnNmxbTgKwa0/yorMDiZDK/p7CkowMZnGcrSGWwghPt4RnLehYoTER3mSq8H
 pDWqZRHCQWgR9JlB0dOlCKGwii311NIadAqnWIIiOLzBqx3aqb4lVXEZ6QHuO6BOq9
 aKZGq/3HYqVneBKvj62EYkUQ21rVhcspyam7+DeemDjwNLZnNXeCpncclxMTSh+KxS
 9CIlMFhlLXK5w==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, sharadg@nvidia.com
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

Hi Mark,

>> This series adds audio graph based sound card support for Tegra210
>> platforms like Jetson-TX1 an Jetson-Nano. The following preparatory
>> audio graph enhancement series is already merged.
>>   * https://patchwork.kernel.org/project/alsa-devel/list/?series=375629&state=*
>>
>> Following are the summary of changes:
>>   * Add graph/audio-graph based schemas or schema updates for Tegra210
>>     component and machine drivers.
>>   * Add Tegra audio graph machine driver.
>>   * Add required DT support for Jetson-TX1/Nano.
>>
>> [...]
> Applied to
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
>
> Thanks!
>
> [1/3] ASoC: dt-bindings: tegra: Add graph bindings
>        (no commit info)
> [2/3] ASoC: dt-bindings: tegra: Add json-schema for Tegra audio graph card
>        (no commit info)
> [3/3] ASoC: tegra: Add audio graph based card driver
>        (no commit info)

I don't see above patches in linux-next yet. Should I wait some more 
time for this to appear?


Thanks,
Sameer.
