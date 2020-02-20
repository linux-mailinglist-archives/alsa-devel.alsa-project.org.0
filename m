Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 719BD165FF0
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 15:47:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0171216C7;
	Thu, 20 Feb 2020 15:46:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0171216C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582210022;
	bh=zlqxC2MqMLmAb760c8+4CCfBROwIllJSXcF4lORockc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QOszHtEofT0aL3KBgNkA08nZcXiCuPwmYp9aTujXs/Oe2X02k/YfFDi0H+HI++NtV
	 3wTlAIxdmqFiU0EoTeCX8lqeEHtqlM8CAhyXEptnsgTxfTsfGv2DT0wMPYKUki1sP5
	 7uBZAg8JBvnG4NBLEV//vrOt2fYt+nV2bTIzingE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 157C5F80145;
	Thu, 20 Feb 2020 15:45:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3502F80148; Thu, 20 Feb 2020 15:45:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDC10F80101
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 15:45:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDC10F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="OdHnmCRo"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4e9b6b0002>; Thu, 20 Feb 2020 06:44:59 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 20 Feb 2020 06:45:13 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 20 Feb 2020 06:45:13 -0800
Received: from [10.21.133.51] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Feb
 2020 14:45:10 +0000
Subject: Re: [PATCH v3 04/10] ASoC: tegra: add Tegra210 based I2S driver
To: Sameer Pujar <spujar@nvidia.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-5-git-send-email-spujar@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <8b224e0f-5e69-75a4-6be1-fb7bc083bf32@nvidia.com>
Date: Thu, 20 Feb 2020 14:45:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582180492-25297-5-git-send-email-spujar@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582209899; bh=ToZh4/TyGAmvxNYeBR1CnaphoSG1rFK0lkkCxri83P0=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=OdHnmCRoqtioB67vc9TZUhgUh9GReTNHyKRyE5tjc/IXkXP37oPK2DERs1ItzJlcC
 Tp8NbO0WDwEvxskGu++2Qnvc7WCT/emskqisVdxNQkQlG5oiIXutOovinGt7JNq+XE
 geoXtQVATTsQyiUSib0iSJFK7CPOMcQ458c9iZvr5xo/du8pw8e9u6x0Fhp9AnDhKd
 av4WhzWL/HZ4xjBl9+FPbzabsZXAQB4GCtQoejfAny6JXo7B+16K663y33XmmHreFs
 Fj1wkT6ZF+UBm514kW5N+CJDzcu8MpIGetazvw6UgiDQeUoX9B1K7XUtaQEKGyiqC1
 bFbFq7de4WjYg==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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


On 20/02/2020 06:34, Sameer Pujar wrote:
> The Inter-IC Sound (I2S) controller implements full-duplex, bi-directional
> and single direction point to point serial interface. It can interface
> with I2S compatible devices. Tegra I2S controller can operate as both
> master and slave.
> 
> This patch registers I2S controller with ASoC framework. The component
> driver exposes DAPM widgets, routes and kcontrols for the device. The DAI
> driver exposes I2S interfaces, which can be used to connect different
> components in the ASoC layer. Makefile and Kconfig support is added to
> allow to build the driver. The I2S devices can be enabled in the DT via
> "nvidia,tegra210-i2s" compatible binding.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  sound/soc/tegra/Kconfig        |  10 +
>  sound/soc/tegra/Makefile       |   2 +
>  sound/soc/tegra/tegra210_i2s.c | 938 +++++++++++++++++++++++++++++++++++++++++
>  sound/soc/tegra/tegra210_i2s.h | 132 ++++++
>  4 files changed, 1082 insertions(+)
>  create mode 100644 sound/soc/tegra/tegra210_i2s.c
>  create mode 100644 sound/soc/tegra/tegra210_i2s.h

Thanks!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
