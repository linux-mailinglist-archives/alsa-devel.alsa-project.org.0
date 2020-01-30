Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F08D314DB4B
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 14:10:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 969C31683;
	Thu, 30 Jan 2020 14:09:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 969C31683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580389831;
	bh=0c9bWa0yOsyR0whBc1Se1/IFh2aVaNluZFHVV1KSy6Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KXHe3BIguuJa9uBY7g0PmwuOy9mPXAZ+6Y+2cfhda0FefAOzZEu5c9LxU4Zc5AboO
	 kxxUcHdf0Sj/5whZrWGwFLX/x31hdDK1PsiXD+ZQLaMw1+ieArzCNAaMNBGoCVTSW1
	 9orG0MJfvbQ3HEVigIbdNPBAVyASNx5rrDRLIeDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B02C6F801F7;
	Thu, 30 Jan 2020 14:09:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60E9EF801EB; Thu, 30 Jan 2020 14:09:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AC57F80123
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 14:09:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AC57F80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="UqSWE/IX"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e32d5560000>; Thu, 30 Jan 2020 05:08:38 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 30 Jan 2020 05:09:30 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 30 Jan 2020 05:09:30 -0800
Received: from [10.26.11.91] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jan
 2020 13:09:27 +0000
To: Ben Dooks <ben.dooks@codethink.co.uk>, Mark Brown <broonie@kernel.org>,
 Dmitry Osipenko <digetx@gmail.com>
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
 <4b90efd2-5d0c-84df-961d-80cee288e0d4@nvidia.com>
 <586ea2b9-c204-2bd1-f8e2-875e0974e42d@nvidia.com>
 <fe002ec7-ae6e-f770-b82a-49237e0b29c6@codethink.co.uk>
 <c01e6e09-d3ed-7c39-5a66-e25950f8bdcc@nvidia.com>
 <5898e2ed-1773-8f8f-b26b-d4613a8ad4de@codethink.co.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <68c35b2c-160a-0114-7265-e7ca01523ffc@nvidia.com>
Date: Thu, 30 Jan 2020 13:09:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5898e2ed-1773-8f8f-b26b-d4613a8ad4de@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580389718; bh=vMjNIMhnnsMm3t7wZl2/ug6FswrpT9lMOEs3C10Yj9U=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=UqSWE/IXPHG0gbwK7K7HVhSRKrvUaj9UgcSvmpjRjY1Tioi6e4rGSp2uiL2kf+t93
 IZo44BRPUICuwt0DoGZfduh2oI2BtC3pBzjBB/1zaKelOc/K2gC7qgJpgPskMv3M0S
 wwkN0mO4hy/FrL5mlDbnqa/UstH3p7RsgWeqtPNtIzLFVP+oWYem1eOMswbdcvIUUV
 3JjmeQ53GldcZ2TyaXk00yauYtr5jcDGQYLXY8str0sbW05eogA1tm4pbXELVQg3/2
 J1KCNqEtsyULlUiA1fRedJNlqDCsiQ4a3pXubXASEaHURLOhZXUG9R3w27wx2EvHHl
 LFXP88SML+M7g==
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 30/01/2020 12:07, Ben Dooks wrote:
> On 30/01/2020 12:05, Jon Hunter wrote:
>>
>> On 30/01/2020 08:17, Ben Dooks wrote:
>>
>> ...
>>
>>> I'll be back in the office next week to test.
>>
>> Any objections to reverting this patch now for v5.6 and pushing to
>> stable for v5.5, then getting this fixed properly for v5.7?
> 
> No, as long as it does not drag on too much.

I won't if you can address the comments previously posted for the other
patches :-)

> The other option is just to remove the announcement of these
> capabilities.

This patch is not that big and so we may as well revert.

> I think I need to check exactly what got merged and then go and
> work out a full series.

Looks like 3 of 7 patches were merged. So if we revert this, then there
are still 5 that are needed.

Cheers!
Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
