Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBA6166011
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 15:54:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD13E16CC;
	Thu, 20 Feb 2020 15:53:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD13E16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582210440;
	bh=Xli1EoMgZ1K9abk2JjrMW1tzcWL21DvMJiinmTRuINw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RzpfdIni9iq3Zr94XjIUGmub31M5IHSYpmhoXTIvIU6dyVCnUScAhLbcUpcNbAaw2
	 ArAAAXsjb6OWNErqhjMTdvp8Ip4/gUWiZByC5Q2E7TCC0ykOqTlU5OiTnf3KaWFxHy
	 Zln9rmjqf9jBP9H7MNygq8HANIcF6xC49D5n93b8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6EE4F80101;
	Thu, 20 Feb 2020 15:52:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D0EFF80148; Thu, 20 Feb 2020 15:52:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61631F80114
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 15:52:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61631F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Ni1qflRZ"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4e9cd30000>; Thu, 20 Feb 2020 06:50:59 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 20 Feb 2020 06:52:11 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 20 Feb 2020 06:52:11 -0800
Received: from [10.21.133.51] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Feb
 2020 14:52:07 +0000
Subject: Re: [PATCH v3 09/10] arm64: tegra: enable AHUB modules for few Tegra
 chips
To: Sameer Pujar <spujar@nvidia.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-10-git-send-email-spujar@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <b55acd02-a492-77cd-833c-d3b18f230037@nvidia.com>
Date: Thu, 20 Feb 2020 14:52:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582180492-25297-10-git-send-email-spujar@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582210259; bh=DZHlCZb018d/zo5xDroBdpIDW9ip6fqXfYqSSOWT/JQ=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Ni1qflRZzYz34vqKivqunhS7MmM24P5AmcqRfHIF+urTDCRwA+1GD3Os5R7bkZ3wr
 yKxy/GmEZC39B4VNlcz4m/FcqVYoXLfnZkXvBtfLZir27PA0hoJrtTRjzaF3IxAXMI
 OQ02s+Ll0uT+jeoYrQZKyKef8w+CVks05D4tmLshLSlsBlajjqIRprsKaBOd7hrnan
 oEyGs0LvDyHUR26XD5/zcVfaJApqutMsmydojfD/VmuQLj1r3xMBKazFnSQnkL3/38
 uG6iuQTar7mhxAm5N3yCcNIhXQl1SJMr7NdklhHAn7/QeDqwOHhU91fc4Gsv1EbjtL
 CcUhf/Xs1arWA==
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
> This patch enables AHUB, ADMAIF modules for following Tegra platforms.
> Along with this specific instances of I/O modules are enabled as per
> the board design.
> 
>  * Jetson TX1
>    - I2S1, I2S2, I2S3, I2S4 and I2S5
>    - DMIC1, DMIC2 and DMIC3
> 
>  * Jetson TX2
>    - I2S1, I2S2, I2S3, I2S4, I2S5 and I2S6
>    - DMIC1, DMIC2 and DMIC3
>    - DSPK2
> 
>  * Jetson AGX Xavier
>    - I2S1, I2S2, I2S4 and I2S6
>    - DMIC2 and DMIC3
>    - DSPK1
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 48 ++++++++++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 36 ++++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 40 ++++++++++++++++++
>  3 files changed, 124 insertions(+)
Thanks!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
