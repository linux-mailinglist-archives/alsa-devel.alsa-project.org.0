Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C1A227F55
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 13:54:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60BAE16A3;
	Tue, 21 Jul 2020 13:53:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60BAE16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595332476;
	bh=S7ZiuBpj4cH31vrsSX4cgkKwNaWvDxrfEJQ32GBBVOk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VWUp5Q24zRnkb1By2m9eg3jxyk4H0wtJ6EN78nzVAxg1FYLnRfhNqbYXJfvWyV/Zx
	 J2dBwYEpCJbrl9njx+fI2fuDQ7WR6pGGewvdisrcAXVjaoXwYk2cXdVFPsC0y7GZHV
	 Cn84J+Rg01hXKquUvOjuJdGXOuiE1kd0CtkU59dA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CDDFF80268;
	Tue, 21 Jul 2020 13:52:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D83FF8024A; Tue, 21 Jul 2020 13:52:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B335FF80117
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 13:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B335FF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="hVhAHlWj"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f16d6950000>; Tue, 21 Jul 2020 04:50:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 21 Jul 2020 04:52:45 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 21 Jul 2020 04:52:45 -0700
Received: from [10.25.101.238] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Jul
 2020 11:52:38 +0000
Subject: Re: [PATCH v5 00/11] Add ASoC AHUB components for Tegra210 and later
To: Mark Brown <broonie@kernel.org>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>, <perex@perex.cz>, <kuninori.morimoto.gx@renesas.com>,
 <tiwai@suse.com>
References: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
 <159525589435.6792.708136378511410418.b4-ty@kernel.org>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <72d45476-7050-187b-19d6-2ddb9b0ba97a@nvidia.com>
Date: Tue, 21 Jul 2020 17:22:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <159525589435.6792.708136378511410418.b4-ty@kernel.org>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595332245; bh=I7A23ZSDWorRZy3D4VQyChJjvsPD/dJJdKZBL01AyEU=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=hVhAHlWjK0Q60cjDRWNgeIlhcFJpQNO333aYgHZOCCeCWLvH9zsHW+xiu22sRg/+r
 qUPJTzg/eC+7GHo3Rk4CRbDSJbH6YEtLs3HWNoMgt1OUIf2VMqmt3Uu0Cqmo6xObOq
 wSjpcCcN6MdKHsyNmMieNBuXOYsb6b0LlvtgWJnr6HbpkCeCATqO68jhhdHX3vuaLe
 N6oj1m8kCUHNnWymeEArxb4n4QCI1jvYvgvijDHK9U159AFdPRD16FamIsXU/IJeqE
 nR6IAadACO3JLqykMd70eLNXo08sUtvLtRuwmgKbWE8P+d03Xr3fkELSZ54IEcG+MU
 s5YfcVms9ZWuA==
Cc: viswanathl@nvidia.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 spujar@nvidia.com, nwartikar@nvidia.com, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, nicoleotsuka@gmail.com, sharadg@nvidia.com,
 thierry.reding@gmail.com, atalambedu@nvidia.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com, rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

On 7/20/2020 8:08 PM, Mark Brown wrote:
> External email: Use caution opening links or attachments
>
>
> On Sun, 19 Jul 2020 10:31:19 +0530, Sameer Pujar wrote:
>> Overview
>> ========
>> Audio Processing Engine (APE) comprises of Audio DMA (ADMA) and Audio
>> Hub (AHUB) unit. AHUB is a collection of hardware accelerators for audio
>> pre-processing and post-processing. It also includes a programmable full
>> crossbar for routing audio data across these accelerators.
>>
>> [...]
> Applied to
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
>
> Thanks!
>
> [1/6] ASoC: dt-bindings: tegra: Add DT bindings for Tegra210
>        commit: 665308c0b44a37339b9b3368f1dd61eb66acde87
> [2/6] ASoC: tegra: Add support for CIF programming
>        commit: 1c3b89fb7e4a78ddcd627e3f218a216e2136ae9b
> [3/6] ASoC: tegra: Add Tegra210 based DMIC driver
>        commit: 8c8ff982e9e2b2eb9255fc393f938915b0ddc127
> [4/6] ASoC: tegra: Add Tegra210 based I2S driver
>        commit: c0bfa98349d1796fe754dfac7f7f505bb60dcd83
> [5/6] ASoC: tegra: Add Tegra210 based AHUB driver
>        commit: 16e1bcc2caf446fa3e1daa040b59fd6f6272a766
> [6/6] ASoC: tegra: Add Tegra186 based DSPK driver
>        commit: 327ef64702668bb754eeea80ce402454d7a1302a

I see that "[PATCH v5 07/11] ASoC: tegra: Add Tegra210 based ADMAIF 
driver" is not applied as part of this. I wanted to understand if this 
is because some more review comments are expected or there are other 
reasons?

Thanks,
Sameer.

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

