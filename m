Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AD123EBA8
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 12:54:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E737B15F9;
	Fri,  7 Aug 2020 12:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E737B15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596797652;
	bh=WJ+ctKDP+/tJDEuRHJ9LcxyheZstTWfubHWl7bbjs4o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h+yXG/LjAkvODmDYfSsTZ86GQFLc+sjEh2TQ4RJbjAtkmUdOg+xhECJ4xLzzoOSyv
	 T+8zuLxGKbOh686unE4OtjR6cu/AKjZGIi4FerB95aYMxUT6dTvF451Ji0rvzLx4/L
	 RTimill7l3yFIb43/8i/G6YxaexMi2+OLcn0/a/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2800FF801F7;
	Fri,  7 Aug 2020 12:52:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F610F80218; Fri,  7 Aug 2020 12:52:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E11DDF800AB
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 12:52:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E11DDF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="LsppKRMQ"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f2d322b0000>; Fri, 07 Aug 2020 03:51:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Aug 2020 03:52:14 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Aug 2020 03:52:14 -0700
Received: from [10.26.73.183] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Aug
 2020 10:52:07 +0000
Subject: Re: [PATCH v5 11/11] arm64: tegra: Add DT binding for AHUB components
To: Sameer Pujar <spujar@nvidia.com>, <broonie@kernel.org>, <perex@perex.cz>, 
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
References: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
 <1595134890-16470-12-git-send-email-spujar@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <2c2f2d99-ff04-264a-5894-8505b26dda9e@nvidia.com>
Date: Fri, 7 Aug 2020 11:52:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595134890-16470-12-git-send-email-spujar@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596797483; bh=n7ah1pWyLlub/9ZS2fn/AkKC/kj38d7XQOKi6Q45Wd0=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=LsppKRMQEdNBDfD4j0pVOdgFOJKmhtIgEQBMGJnGdk+50OBM4pfn4uIaj/8TdhqjO
 oSs1FUkpBYcvq+g0HQNy373PvgV6UJzGo0jSy6kpM39JvPTbIvn8gDhnLfzKjz9m+W
 kVqlLIURx1xp9hTljCVcMZkmxPhY/iCUpS9TFC6CMdUvmcW6NXVnSaTb6XiCPJEpkF
 lif4O+3TVy3VIbJjElzflhc/5l5i+e/eDdUV4MdSKKwgPVl0gNueM5Mg3fh+7+FMT4
 OYXQXPputLs9gPWz/aLo1PGohq1oITIR4eVVLbZwucwSGwIS5raaw5qAI7OIlOr5Pe
 DfSASFmxt8PxA==
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 nwartikar@nvidia.com, linux-kernel@vger.kernel.org, atalambedu@nvidia.com,
 viswanathl@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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


On 19/07/2020 06:01, Sameer Pujar wrote:
> This patch adds few AHUB modules for Tegra210, Tegra186 and Tegra194.
> Bindings for following modules are added.
>  * AHUB added as a child node under ACONNECT
>  * AHUB includes many HW accelerators and below components are added
>    as its children.
>    * ADMAIF
>    * I2S
>    * DMIC
>    * DSPK (added for Tegra186 and Tegra194 only, since Tegra210 does
>      not have this module)
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 217 ++++++++++++++++++++++++++++-
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 225 ++++++++++++++++++++++++++++++-
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 140 +++++++++++++++++++
>  3 files changed, 580 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> index 34d249d..7869aec 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> @@ -85,7 +85,7 @@
>  		ranges = <0x02900000 0x0 0x02900000 0x200000>;
>  		status = "disabled";
>  
> -		dma-controller@2930000 {
> +		adma: dma-controller@2930000 {
>  			compatible = "nvidia,tegra186-adma";
>  			reg = <0x02930000 0x20000>;
>  			interrupt-parent = <&agic>;
> @@ -140,6 +140,221 @@
>  			clock-names = "clk";
>  			status = "disabled";
>  		};
> +
> +		tegra_ahub: ahub@2900800 {
> +			compatible = "nvidia,tegra186-ahub";
> +			reg = <0x02900800 0x800>;
> +			clocks = <&bpmp TEGRA186_CLK_AHUB>;
> +			clock-names = "ahub";
> +			assigned-clocks = <&bpmp TEGRA186_CLK_AHUB>;
> +			assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x02900800 0x02900800 0x11800>;
> +			status = "disabled";
> +
> +			tegra_admaif: admaif@290f000 {
> +				compatible = "nvidia,tegra186-admaif";
> +				reg = <0x0290f000 0x1000>;
> +				dmas = <&adma 1>, <&adma 1>,
> +				       <&adma 2>, <&adma 2>,
> +				       <&adma 3>, <&adma 3>,
> +				       <&adma 4>, <&adma 4>,
> +				       <&adma 5>, <&adma 5>,
> +				       <&adma 6>, <&adma 6>,
> +				       <&adma 7>, <&adma 7>,
> +				       <&adma 8>, <&adma 8>,
> +				       <&adma 9>, <&adma 9>,
> +				       <&adma 10>, <&adma 10>,
> +				       <&adma 11>, <&adma 11>,
> +				       <&adma 12>, <&adma 12>,
> +				       <&adma 13>, <&adma 13>,
> +				       <&adma 14>, <&adma 14>,
> +				       <&adma 15>, <&adma 15>,
> +				       <&adma 16>, <&adma 16>,
> +				       <&adma 17>, <&adma 17>,
> +				       <&adma 18>, <&adma 18>,
> +				       <&adma 19>, <&adma 19>,
> +				       <&adma 20>, <&adma 20>;
> +				dma-names = "rx1", "tx1",
> +					    "rx2", "tx2",
> +					    "rx3", "tx3",
> +					    "rx4", "tx4",
> +					    "rx5", "tx5",
> +					    "rx6", "tx6",
> +					    "rx7", "tx7",
> +					    "rx8", "tx8",
> +					    "rx9", "tx9",
> +					    "rx10", "tx10",
> +					    "rx11", "tx11",
> +					    "rx12", "tx12",
> +					    "rx13", "tx13",
> +					    "rx14", "tx14",
> +					    "rx15", "tx15",
> +					    "rx16", "tx16",
> +					    "rx17", "tx17",
> +					    "rx18", "tx18",
> +					    "rx19", "tx19",
> +					    "rx20", "tx20";
> +				status = "disabled";
> +			};
> +
> +			tegra_i2s1: i2s@2901000 {
> +				compatible = "nvidia,tegra186-i2s",
> +					     "nvidia,tegra210-i2s";
> +				reg = <0x2901000 0x100>;
> +				clocks = <&bpmp TEGRA186_CLK_I2S1>,
> +					 <&bpmp TEGRA186_CLK_I2S1_SYNC_INPUT>;
> +				clock-names = "i2s", "sync_input";
> +				assigned-clocks = <&bpmp TEGRA186_CLK_I2S1>;
> +				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <1536000>;
> +				sound-name-prefix = "I2S1";
> +				status = "disabled";
> +			};
> +
> +			tegra_i2s2: i2s@2901100 {
> +				compatible = "nvidia,tegra186-i2s",
> +					     "nvidia,tegra210-i2s";
> +				reg = <0x2901100 0x100>;
> +				clocks = <&bpmp TEGRA186_CLK_I2S2>,
> +					 <&bpmp TEGRA186_CLK_I2S2_SYNC_INPUT>;
> +				clock-names = "i2s", "sync_input";
> +				assigned-clocks = <&bpmp TEGRA186_CLK_I2S2>;
> +				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <1536000>;
> +				sound-name-prefix = "I2S2";
> +				status = "disabled";
> +			};
> +
> +			tegra_i2s3: i2s@2901200 {
> +				compatible = "nvidia,tegra186-i2s",
> +					     "nvidia,tegra210-i2s";
> +				reg = <0x2901200 0x100>;
> +				clocks = <&bpmp TEGRA186_CLK_I2S3>,
> +					 <&bpmp TEGRA186_CLK_I2S3_SYNC_INPUT>;
> +				clock-names = "i2s", "sync_input";
> +				assigned-clocks = <&bpmp TEGRA186_CLK_I2S3>;
> +				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <1536000>;
> +				sound-name-prefix = "I2S3";
> +				status = "disabled";
> +			};
> +
> +			tegra_i2s4: i2s@2901300 {
> +				compatible = "nvidia,tegra186-i2s",
> +					     "nvidia,tegra210-i2s";
> +				reg = <0x2901300 0x100>;
> +				clocks = <&bpmp TEGRA186_CLK_I2S4>,
> +					 <&bpmp TEGRA186_CLK_I2S4_SYNC_INPUT>;
> +				clock-names = "i2s", "sync_input";
> +				assigned-clocks = <&bpmp TEGRA186_CLK_I2S4>;
> +				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <1536000>;
> +				sound-name-prefix = "I2S4";
> +				status = "disabled";
> +			};
> +
> +			tegra_i2s5: i2s@2901400 {
> +				compatible = "nvidia,tegra186-i2s",
> +					     "nvidia,tegra210-i2s";
> +				reg = <0x2901400 0x100>;
> +				clocks = <&bpmp TEGRA186_CLK_I2S5>,
> +					 <&bpmp TEGRA186_CLK_I2S5_SYNC_INPUT>;
> +				clock-names = "i2s", "sync_input";
> +				assigned-clocks = <&bpmp TEGRA186_CLK_I2S5>;
> +				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <1536000>;
> +				sound-name-prefix = "I2S5";
> +				status = "disabled";
> +			};
> +
> +			tegra_i2s6: i2s@2901500 {
> +				compatible = "nvidia,tegra186-i2s",
> +					     "nvidia,tegra210-i2s";
> +				reg = <0x2901500 0x100>;
> +				clocks = <&bpmp TEGRA186_CLK_I2S6>,
> +					 <&bpmp TEGRA186_CLK_I2S6_SYNC_INPUT>;
> +				clock-names = "i2s", "sync_input";
> +				assigned-clocks = <&bpmp TEGRA186_CLK_I2S6>;
> +				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <1536000>;
> +				sound-name-prefix = "I2S6";
> +				status = "disabled";
> +			};
> +
> +			tegra_dmic1: dmic@2904000 {
> +				compatible = "nvidia,tegra210-dmic";
> +				reg = <0x2904000 0x100>;
> +				clocks = <&bpmp TEGRA186_CLK_DMIC1>;
> +				clock-names = "dmic";
> +				assigned-clocks = <&bpmp TEGRA186_CLK_DMIC1>;
> +				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <3072000>;
> +				sound-name-prefix = "DMIC1";
> +				status = "disabled";
> +			};
> +
> +			tegra_dmic2: dmic@2904100 {
> +				compatible = "nvidia,tegra210-dmic";
> +				reg = <0x2904100 0x100>;
> +				clocks = <&bpmp TEGRA186_CLK_DMIC2>;
> +				clock-names = "dmic";
> +				assigned-clocks = <&bpmp TEGRA186_CLK_DMIC2>;
> +				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <3072000>;
> +				sound-name-prefix = "DMIC2";
> +				status = "disabled";
> +			};
> +
> +			tegra_dmic3: dmic@2904200 {
> +				compatible = "nvidia,tegra210-dmic";
> +				reg = <0x2904200 0x100>;
> +				clocks = <&bpmp TEGRA186_CLK_DMIC3>;
> +				clock-names = "dmic";
> +				assigned-clocks = <&bpmp TEGRA186_CLK_DMIC3>;
> +				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <3072000>;
> +				sound-name-prefix = "DMIC3";
> +				status = "disabled";
> +			};
> +
> +			tegra_dmic4: dmic@2904300 {
> +				compatible = "nvidia,tegra210-dmic";
> +				reg = <0x2904300 0x100>;
> +				clocks = <&bpmp TEGRA186_CLK_DMIC4>;
> +				clock-names = "dmic";
> +				assigned-clocks = <&bpmp TEGRA186_CLK_DMIC4>;
> +				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <3072000>;
> +				sound-name-prefix = "DMIC4";
> +				status = "disabled";
> +			};
> +
> +			tegra_dspk1: dspk@2905000 {
> +				compatible = "nvidia,tegra186-dspk";
> +				reg = <0x2905000 0x100>;
> +				clocks = <&bpmp TEGRA186_CLK_DSPK1>;
> +				clock-names = "dspk";
> +				assigned-clocks = <&bpmp TEGRA186_CLK_DSPK1>;
> +				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <12288000>;
> +				sound-name-prefix = "DSPK1";
> +				status = "disabled";
> +			};
> +
> +			tegra_dspk2: dspk@2905100 {
> +				compatible = "nvidia,tegra186-dspk";
> +				reg = <0x2905100 0x100>;
> +				clocks = <&bpmp TEGRA186_CLK_DSPK2>;
> +				clock-names = "dspk";
> +				assigned-clocks = <&bpmp TEGRA186_CLK_DSPK2>;
> +				assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <12288000>;
> +				sound-name-prefix = "DSPK2";
> +				status = "disabled";
> +			};
> +		};
>  	};
>  
>  	mc: memory-controller@2c00000 {
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index ea629da..bdef4b8 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -83,7 +83,7 @@
>  			ranges = <0x02900000 0x02900000 0x200000>;
>  			status = "disabled";
>  
> -			dma-controller@2930000 {
> +			adma: dma-controller@2930000 {
>  				compatible = "nvidia,tegra194-adma",
>  					     "nvidia,tegra186-adma";
>  				reg = <0x02930000 0x20000>;
> @@ -140,6 +140,229 @@
>  				clock-names = "clk";
>  				status = "disabled";
>  			};
> +
> +			tegra_ahub: ahub@2900800 {
> +				compatible = "nvidia,tegra194-ahub",
> +					     "nvidia,tegra186-ahub";
> +				reg = <0x02900800 0x800>;
> +				clocks = <&bpmp TEGRA194_CLK_AHUB>;
> +				clock-names = "ahub";
> +				assigned-clocks = <&bpmp TEGRA194_CLK_AHUB>;
> +				assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0x02900800 0x02900800 0x11800>;
> +				status = "disabled";
> +
> +				tegra_admaif: admaif@290f000 {
> +					compatible = "nvidia,tegra194-admaif",
> +						     "nvidia,tegra186-admaif";
> +					reg = <0x0290f000 0x1000>;
> +					dmas = <&adma 1>, <&adma 1>,
> +					       <&adma 2>, <&adma 2>,
> +					       <&adma 3>, <&adma 3>,
> +					       <&adma 4>, <&adma 4>,
> +					       <&adma 5>, <&adma 5>,
> +					       <&adma 6>, <&adma 6>,
> +					       <&adma 7>, <&adma 7>,
> +					       <&adma 8>, <&adma 8>,
> +					       <&adma 9>, <&adma 9>,
> +					       <&adma 10>, <&adma 10>,
> +					       <&adma 11>, <&adma 11>,
> +					       <&adma 12>, <&adma 12>,
> +					       <&adma 13>, <&adma 13>,
> +					       <&adma 14>, <&adma 14>,
> +					       <&adma 15>, <&adma 15>,
> +					       <&adma 16>, <&adma 16>,
> +					       <&adma 17>, <&adma 17>,
> +					       <&adma 18>, <&adma 18>,
> +					       <&adma 19>, <&adma 19>,
> +					       <&adma 20>, <&adma 20>;
> +					dma-names = "rx1", "tx1",
> +						    "rx2", "tx2",
> +						    "rx3", "tx3",
> +						    "rx4", "tx4",
> +						    "rx5", "tx5",
> +						    "rx6", "tx6",
> +						    "rx7", "tx7",
> +						    "rx8", "tx8",
> +						    "rx9", "tx9",
> +						    "rx10", "tx10",
> +						    "rx11", "tx11",
> +						    "rx12", "tx12",
> +						    "rx13", "tx13",
> +						    "rx14", "tx14",
> +						    "rx15", "tx15",
> +						    "rx16", "tx16",
> +						    "rx17", "tx17",
> +						    "rx18", "tx18",
> +						    "rx19", "tx19",
> +						    "rx20", "tx20";
> +					status = "disabled";
> +				};
> +
> +				tegra_i2s1: i2s@2901000 {
> +					compatible = "nvidia,tegra194-i2s",
> +						     "nvidia,tegra210-i2s";
> +					reg = <0x2901000 0x100>;
> +					clocks = <&bpmp TEGRA194_CLK_I2S1>,
> +						 <&bpmp TEGRA194_CLK_I2S1_SYNC_INPUT>;
> +					clock-names = "i2s", "sync_input";
> +					assigned-clocks = <&bpmp TEGRA194_CLK_I2S1>;
> +					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
> +					assigned-clock-rates = <1536000>;
> +					sound-name-prefix = "I2S1";
> +					status = "disabled";
> +				};
> +
> +				tegra_i2s2: i2s@2901100 {
> +					compatible = "nvidia,tegra194-i2s",
> +						     "nvidia,tegra210-i2s";
> +					reg = <0x2901100 0x100>;
> +					clocks = <&bpmp TEGRA194_CLK_I2S2>,
> +						 <&bpmp TEGRA194_CLK_I2S2_SYNC_INPUT>;
> +					clock-names = "i2s", "sync_input";
> +					assigned-clocks = <&bpmp TEGRA194_CLK_I2S2>;
> +					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
> +					assigned-clock-rates = <1536000>;
> +					sound-name-prefix = "I2S2";
> +					status = "disabled";
> +				};
> +
> +				tegra_i2s3: i2s@2901200 {
> +					compatible = "nvidia,tegra194-i2s",
> +						     "nvidia,tegra210-i2s";
> +					reg = <0x2901200 0x100>;
> +					clocks = <&bpmp TEGRA194_CLK_I2S3>,
> +						 <&bpmp TEGRA194_CLK_I2S3_SYNC_INPUT>;
> +					clock-names = "i2s", "sync_input";
> +					assigned-clocks = <&bpmp TEGRA194_CLK_I2S3>;
> +					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
> +					assigned-clock-rates = <1536000>;
> +					sound-name-prefix = "I2S3";
> +					status = "disabled";
> +				};
> +
> +				tegra_i2s4: i2s@2901300 {
> +					compatible = "nvidia,tegra194-i2s",
> +						     "nvidia,tegra210-i2s";
> +					reg = <0x2901300 0x100>;
> +					clocks = <&bpmp TEGRA194_CLK_I2S4>,
> +						 <&bpmp TEGRA194_CLK_I2S4_SYNC_INPUT>;
> +					clock-names = "i2s", "sync_input";
> +					assigned-clocks = <&bpmp TEGRA194_CLK_I2S4>;
> +					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
> +					assigned-clock-rates = <1536000>;
> +					sound-name-prefix = "I2S4";
> +					status = "disabled";
> +				};
> +
> +				tegra_i2s5: i2s@2901400 {
> +					compatible = "nvidia,tegra194-i2s",
> +						     "nvidia,tegra210-i2s";
> +					reg = <0x2901400 0x100>;
> +					clocks = <&bpmp TEGRA194_CLK_I2S5>,
> +						 <&bpmp TEGRA194_CLK_I2S5_SYNC_INPUT>;
> +					clock-names = "i2s", "sync_input";
> +					assigned-clocks = <&bpmp TEGRA194_CLK_I2S5>;
> +					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
> +					assigned-clock-rates = <1536000>;
> +					sound-name-prefix = "I2S5";
> +					status = "disabled";
> +				};
> +
> +				tegra_i2s6: i2s@2901500 {
> +					compatible = "nvidia,tegra194-i2s",
> +						     "nvidia,tegra210-i2s";
> +					reg = <0x2901500 0x100>;
> +					clocks = <&bpmp TEGRA194_CLK_I2S6>,
> +						 <&bpmp TEGRA194_CLK_I2S6_SYNC_INPUT>;
> +					clock-names = "i2s", "sync_input";
> +					assigned-clocks = <&bpmp TEGRA194_CLK_I2S6>;
> +					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
> +					assigned-clock-rates = <1536000>;
> +					sound-name-prefix = "I2S6";
> +					status = "disabled";
> +				};
> +
> +				tegra_dmic1: dmic@2904000 {
> +					compatible = "nvidia,tegra194-dmic",
> +						     "nvidia,tegra210-dmic";
> +					reg = <0x2904000 0x100>;
> +					clocks = <&bpmp TEGRA194_CLK_DMIC1>;
> +					clock-names = "dmic";
> +					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC1>;
> +					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
> +					assigned-clock-rates = <3072000>;
> +					sound-name-prefix = "DMIC1";
> +					status = "disabled";
> +				};
> +
> +				tegra_dmic2: dmic@2904100 {
> +					compatible = "nvidia,tegra194-dmic",
> +						     "nvidia,tegra210-dmic";
> +					reg = <0x2904100 0x100>;
> +					clocks = <&bpmp TEGRA194_CLK_DMIC2>;
> +					clock-names = "dmic";
> +					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC2>;
> +					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
> +					assigned-clock-rates = <3072000>;
> +					sound-name-prefix = "DMIC2";
> +					status = "disabled";
> +				};
> +
> +				tegra_dmic3: dmic@2904200 {
> +					compatible = "nvidia,tegra194-dmic",
> +						     "nvidia,tegra210-dmic";
> +					reg = <0x2904200 0x100>;
> +					clocks = <&bpmp TEGRA194_CLK_DMIC3>;
> +					clock-names = "dmic";
> +					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC3>;
> +					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
> +					assigned-clock-rates = <3072000>;
> +					sound-name-prefix = "DMIC3";
> +					status = "disabled";
> +				};
> +
> +				tegra_dmic4: dmic@2904300 {
> +					compatible = "nvidia,tegra194-dmic",
> +						     "nvidia,tegra210-dmic";
> +					reg = <0x2904300 0x100>;
> +					clocks = <&bpmp TEGRA194_CLK_DMIC4>;
> +					clock-names = "dmic";
> +					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC4>;
> +					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
> +					assigned-clock-rates = <3072000>;
> +					sound-name-prefix = "DMIC4";
> +					status = "disabled";
> +				};
> +
> +				tegra_dspk1: dspk@2905000 {
> +					compatible = "nvidia,tegra194-dspk",
> +						     "nvidia,tegra186-dspk";
> +					reg = <0x2905000 0x100>;
> +					clocks = <&bpmp TEGRA194_CLK_DSPK1>;
> +					clock-names = "dspk";
> +					assigned-clocks = <&bpmp TEGRA194_CLK_DSPK1>;
> +					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
> +					assigned-clock-rates = <12288000>;
> +					sound-name-prefix = "DSPK1";
> +					status = "disabled";
> +				};
> +
> +				tegra_dspk2: dspk@2905100 {
> +					compatible = "nvidia,tegra194-dspk",
> +						     "nvidia,tegra186-dspk";
> +					reg = <0x2905100 0x100>;
> +					clocks = <&bpmp TEGRA194_CLK_DSPK2>;
> +					clock-names = "dspk";
> +					assigned-clocks = <&bpmp TEGRA194_CLK_DSPK2>;
> +					assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
> +					assigned-clock-rates = <12288000>;
> +					sound-name-prefix = "DSPK2";
> +					status = "disabled";
> +				};
> +			};
>  		};
>  
>  		pinmux: pinmux@2430000 {
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> index f4e0cc2..4f2853e 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -1366,6 +1366,146 @@
>  			clock-names = "clk";
>  			status = "disabled";
>  		};
> +
> +		tegra_ahub: ahub@702d0800 {
> +			compatible = "nvidia,tegra210-ahub";
> +			reg = <0x702d0800 0x800>;
> +			clocks = <&tegra_car TEGRA210_CLK_D_AUDIO>;
> +			clock-names = "ahub";
> +			assigned-clocks = <&tegra_car TEGRA210_CLK_D_AUDIO>;
> +			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x702d0000 0x702d0000 0x0000e400>;
> +			status = "disabled";
> +
> +			tegra_admaif: admaif@702d0000 {
> +				compatible = "nvidia,tegra210-admaif";
> +				reg = <0x702d0000 0x800>;
> +				dmas = <&adma 1>,  <&adma 1>,
> +				       <&adma 2>,  <&adma 2>,
> +				       <&adma 3>,  <&adma 3>,
> +				       <&adma 4>,  <&adma 4>,
> +				       <&adma 5>,  <&adma 5>,
> +				       <&adma 6>,  <&adma 6>,
> +				       <&adma 7>,  <&adma 7>,
> +				       <&adma 8>,  <&adma 8>,
> +				       <&adma 9>,  <&adma 9>,
> +				       <&adma 10>, <&adma 10>;
> +				dma-names = "rx1",  "tx1",
> +					    "rx2",  "tx2",
> +					    "rx3",  "tx3",
> +					    "rx4",  "tx4",
> +					    "rx5",  "tx5",
> +					    "rx6",  "tx6",
> +					    "rx7",  "tx7",
> +					    "rx8",  "tx8",
> +					    "rx9",  "tx9",
> +					    "rx10", "tx10";
> +				status = "disabled";
> +			};
> +
> +			tegra_i2s1: i2s@702d1000 {
> +				compatible = "nvidia,tegra210-i2s";
> +				reg = <0x702d1000 0x100>;
> +				clocks = <&tegra_car TEGRA210_CLK_I2S0>,
> +					 <&tegra_car TEGRA210_CLK_I2S0_SYNC>;
> +				clock-names = "i2s", "sync_input";
> +				assigned-clocks = <&tegra_car TEGRA210_CLK_I2S0>;
> +				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <1536000>;
> +				sound-name-prefix = "I2S1";
> +				status = "disabled";
> +			};
> +
> +			tegra_i2s2: i2s@702d1100 {
> +				compatible = "nvidia,tegra210-i2s";
> +				reg = <0x702d1100 0x100>;
> +				clocks = <&tegra_car TEGRA210_CLK_I2S1>,
> +					 <&tegra_car TEGRA210_CLK_I2S1_SYNC>;
> +				clock-names = "i2s", "sync_input";
> +				assigned-clocks = <&tegra_car TEGRA210_CLK_I2S1>;
> +				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <1536000>;
> +				sound-name-prefix = "I2S2";
> +				status = "disabled";
> +			};
> +
> +			tegra_i2s3: i2s@702d1200 {
> +				compatible = "nvidia,tegra210-i2s";
> +				reg = <0x702d1200 0x100>;
> +				clocks = <&tegra_car TEGRA210_CLK_I2S2>,
> +					 <&tegra_car TEGRA210_CLK_I2S2_SYNC>;
> +				clock-names = "i2s", "sync_input";
> +				assigned-clocks = <&tegra_car TEGRA210_CLK_I2S2>;
> +				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <1536000>;
> +				sound-name-prefix = "I2S3";
> +				status = "disabled";
> +			};
> +
> +			tegra_i2s4: i2s@702d1300 {
> +				compatible = "nvidia,tegra210-i2s";
> +				reg = <0x702d1300 0x100>;
> +				clocks = <&tegra_car TEGRA210_CLK_I2S3>,
> +					 <&tegra_car TEGRA210_CLK_I2S3_SYNC>;
> +				clock-names = "i2s", "sync_input";
> +				assigned-clocks = <&tegra_car TEGRA210_CLK_I2S3>;
> +				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <1536000>;
> +				sound-name-prefix = "I2S4";
> +				status = "disabled";
> +			};
> +
> +			tegra_i2s5: i2s@702d1400 {
> +				compatible = "nvidia,tegra210-i2s";
> +				reg = <0x702d1400 0x100>;
> +				clocks = <&tegra_car TEGRA210_CLK_I2S4>,
> +					 <&tegra_car TEGRA210_CLK_I2S4_SYNC>;
> +				clock-names = "i2s", "sync_input";
> +				assigned-clocks = <&tegra_car TEGRA210_CLK_I2S4>;
> +				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <1536000>;
> +				sound-name-prefix = "I2S5";
> +				status = "disabled";
> +			};
> +
> +			tegra_dmic1: dmic@702d4000 {
> +				compatible = "nvidia,tegra210-dmic";
> +				reg = <0x702d4000 0x100>;
> +				clocks = <&tegra_car TEGRA210_CLK_DMIC1>;
> +				clock-names = "dmic";
> +				assigned-clocks = <&tegra_car TEGRA210_CLK_DMIC1>;
> +				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <3072000>;
> +				sound-name-prefix = "DMIC1";
> +				status = "disabled";
> +			};
> +
> +			tegra_dmic2: dmic@702d4100 {
> +				compatible = "nvidia,tegra210-dmic";
> +				reg = <0x702d4100 0x100>;
> +				clocks = <&tegra_car TEGRA210_CLK_DMIC2>;
> +				clock-names = "dmic";
> +				assigned-clocks = <&tegra_car TEGRA210_CLK_DMIC2>;
> +				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <3072000>;
> +				sound-name-prefix = "DMIC2";
> +				status = "disabled";
> +			};
> +
> +			tegra_dmic3: dmic@702d4200 {
> +				compatible = "nvidia,tegra210-dmic";
> +				reg = <0x702d4200 0x100>;
> +				clocks = <&tegra_car TEGRA210_CLK_DMIC3>;
> +				clock-names = "dmic";
> +				assigned-clocks = <&tegra_car TEGRA210_CLK_DMIC3>;
> +				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
> +				assigned-clock-rates = <3072000>;
> +				sound-name-prefix = "DMIC3";
> +				status = "disabled";
> +			};
> +		};
>  	};
>  
>  	spi@70410000 {
> 

Thanks LGTM!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers!
Jon

-- 
nvpublic
