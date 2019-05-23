Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1189B27894
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 10:56:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 832471616;
	Thu, 23 May 2019 10:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 832471616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558601782;
	bh=FRJ4lpxHiv2BZa5OmaUxCRoEiMGbm4RkXnOMSn9nCso=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dmjBBRDdQYchopuT7nHGBypgcjVdBY/hSB2Nc0POp206SaInMSJdtIUWYimLjqLXs
	 1YmN7Jxd+Y7xjoXfktnZQsaXdI0JnszlAB8uWBgZHS8UHODVEM9vRd2hSJWKsSPenW
	 FJkzXx1gY8EIDAnErSsL8ODsQ+uACMWTDiu046wA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE480F80C0F;
	Thu, 23 May 2019 10:54:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95FBCF89674; Thu, 23 May 2019 10:54:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C967FF80C0F
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 10:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C967FF80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="N2+5ucc9"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ce65fc50000>; Thu, 23 May 2019 01:54:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 23 May 2019 01:54:30 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 23 May 2019 01:54:30 -0700
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 May
 2019 08:54:27 +0000
To: Mark Brown <broonie@kernel.org>
References: <20190521203241.B277E1126D1B@debutante.sirena.org.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <51ce00db-05ce-ba66-f1be-74c800f6daed@nvidia.com>
Date: Thu, 23 May 2019 09:54:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521203241.B277E1126D1B@debutante.sirena.org.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1558601671; bh=nEAGdQpsuiGbyUsp/OlVYhTmZlrhOGEiFb+mN7BRwqw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=N2+5ucc9z+nzenpVaXE1PYc49m0cyFnjFgsAW6RgYS4Hp11q0bDfUuYgvXHCWh4oS
 oriY7nwHGrMh8TTZxErFOOCTVLxm4uAWYh9DRlfXSJRJkpL12X1qwON+Ltws7aN9/u
 lvhPydHp4bgR3hNb0v3L8/6SwLpuG/xtDNVbrdCk85JuSFz3jtosfMQ0m2Vg/yn5Fg
 BtIiTDsqUQmJJCrRpN6e9faG6VUwBRFDCMFEuoZVcZSCEh83IUxWkAz4QtBl06KIZN
 ndSyC7/fcvp6i49+WYjAA+evZg75nqhW8JaE+sbkTazEDxL1zLtKlSQutM/0NcGP2m
 7CMReaH9tJbww==
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] Applied "ASoC: simple-card: Fix configuration of
 DAI format" to the asoc tree
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

Hi Mark,

On 21/05/2019 21:32, Mark Brown wrote:
> The patch
> 
>    ASoC: simple-card: Fix configuration of DAI format
> 
> has been applied to the asoc tree at
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2
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
> 
> From 069d037aea98ffa64c26d4b1dc958fb8f39f5c2b Mon Sep 17 00:00:00 2001
> From: Jon Hunter <jonathanh@nvidia.com>
> Date: Thu, 16 May 2019 18:51:26 +0100
> Subject: [PATCH] ASoC: simple-card: Fix configuration of DAI format
> 
> When configuring a codec to be both bit-clock and frame-master, it was
> found that the codec was always configured as bit-clock and frame-slave.
> Looking at the simple_dai_link_of() function there appears to be two
> problems with the configuration of the DAI format, which are ...
> 
> 1. The function asoc_simple_parse_daifmt() is called before the function
>    asoc_simple_parse_codec() and this means that the device-tree node
>    for the codec has not been parsed yet, which is needed by the
>    function asoc_simple_parse_daifmt() to determine who is the codec.
> 2. The phandle passed to asoc_simple_parse_daifmt() is the phandle to
>    the 'codec' node and not the phandle of the actual codec defined by
>    the 'sound-dai' property under the 'codec' node.
> 
> Fix the above by moving the call to asoc_simple_parse_daifmt() after the
> the call to asoc_simple_parse_codec() and pass the phandle for the codec
> to asoc_simple_parse_daifmt().
Please can you drop this patch?

Per some offline review with Morimoto-san, it turns out that the actual
issue resided in my DT (which was incorrect) and not the simple-card
machine driver.

In my DT I incorrectly had ...

sound {
	compatible = "simple-audio-card";

	...
=>	simple-audio-card,bitclock-master = <&codec>;
=>	simple-audio-card,frame-master = <&codec>;
	...

	simple-audio-card,cpu {
		sound-dai = <&xxx>;
	};

	simple-audio-card,codec {
=>		sound-dai = <&codec>;
	};
};

But I should have had ...

sound {
	compatible = "simple-audio-card";

	...
=>	simple-audio-card,bitclock-master = <&codec>;
=>	simple-audio-card,frame-master = <&codec>;
	...

	simple-audio-card,cpu {
		sound-dai = <&xxx>;
	};

=>	codec: simple-audio-card,codec {	/* simple-card wants here */
		sound-dai = <&xxx>;		/* not here */
	};
};

Thanks to Morimoto-san for correcting me!

Cheers
Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
