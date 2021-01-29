Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DEC308C4B
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 19:20:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51C0F1685;
	Fri, 29 Jan 2021 19:19:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51C0F1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611944425;
	bh=1umby2kmyXbE/MHkdQr+TcOmzTHFEWaLSCnRCMjTvvI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CKAgPZf6gJ3H0JX/XkoumaKWIJmrXsG+gbE9bzihlvCqycM1TGiwX3PnRBed1jy9X
	 LoVu1ufjAQRrK853BsXpFMGwLgoZQmxspJr/YAKPrK5/aZLjhOr3CQfeds3MbUmk2E
	 CjzW40xHDZSUUS2Lx/YvhcIbVUZmy2v5rHAWKJNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADFACF8025F;
	Fri, 29 Jan 2021 19:18:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4231DF80259; Fri, 29 Jan 2021 19:18:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24A18F80130
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 19:18:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24A18F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="XR7AIYlZ"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601451800001>; Fri, 29 Jan 2021 10:18:40 -0800
Received: from DRHQMAIL105.nvidia.com (10.27.9.14) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 18:18:39 +0000
Received: from [10.25.100.162] (172.20.145.6) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 18:18:35 +0000
Subject: Re: [PATCH] ASoC: tegra: SND_SOC_TEGRA_AUDIO_GRAPH_CARD should depend
 on SND_SOC_TEGRA
To: Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
References: <20210129125915.2652952-1-geert+renesas@glider.be>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <43fbd512-3689-21b7-8d74-3257cb65d520@nvidia.com>
Date: Fri, 29 Jan 2021 23:48:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210129125915.2652952-1-geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL105.nvidia.com (10.27.9.14)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611944320; bh=RII+q9JAnVamdrcIkQvXr9aEi7U2AFuj/1dXm5fvuvM=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=XR7AIYlZFAA1hCaVNfeSw44OuVwUPB/Y9TK4MAhluHrQleKST6w+85ceU1jQOuCHl
 05jztXaH29EbgHbNwDkH84frbHXrjCrZ5ZCd9SHbDCmoFMh0lJ1JKMTZoeYnA4vzab
 bQwsR9Cf0OwE4wiiLREP+BbB3qLDDikwr5J4A9RxidUBpvx+ymr4AzcnyanuR77o9c
 F4/KLo/0S8Ok6Rz9FBY/Kg/urCJ8cGg5wHQybwJEv7VA9rBlw4Lpfg0UKGMV0lyOux
 NB0z7ecqU+HV/ity5EpnjObYwG5bS42bYxoLkv7F5ZW0G8KWf0KLiLuoYmQNtuvOtj
 jRoSlEUvA0oOA==
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
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



On 1/29/2021 6:29 PM, Geert Uytterhoeven wrote:
> External email: Use caution opening links or attachments
>
>
> Audio Graph Card based Tegra driver is only useful on NVIDIA Tegra SoCs.
> Hence add a dependency on SND_SOC_TEGRA, to prevent asking the user
> about this driver when configuring a kernel without Tegra sound support.
>
> Wrap all Tegra sound config options inside a big if/endif block, instead
> of just adding the dependency to the single config option that does not
> have it yet, to preventing similar future mistakes.
>
> Fixes: 202e2f7745437aa5 ("ASoC: tegra: Add audio graph based card driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   sound/soc/tegra/Kconfig | 33 +++++++++++++--------------------
>   1 file changed, 13 insertions(+), 20 deletions(-)
>

Acked-by: Sameer Pujar <spujar@nvidia.com>
