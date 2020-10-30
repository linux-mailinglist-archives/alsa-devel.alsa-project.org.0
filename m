Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4A329FDE4
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 07:37:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E14F15E5;
	Fri, 30 Oct 2020 07:36:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E14F15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604039823;
	bh=E7K3KG63qlLfu8Y8v/5hcqzhA68ePP6UVKkYv2kodr4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IJp3Gj8YGAo0YmrA3U5YtAZ+0mXJ3MSEErFHc1g65cbppxcvOf4EyOSWlO4ByruTz
	 cQFW00T0K+jr/QuvVdMWTwKecBNh0xFdFnzNx7LXowPAV60mVvNQOTN0CVSLtkrjLV
	 Z62B2n0i08nccTI8eODUbNi0zvIbUCY4ptBnm51w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 833ADF80249;
	Fri, 30 Oct 2020 07:35:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73EE2F80212; Fri, 30 Oct 2020 07:35:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2FD8F800C0
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 07:35:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2FD8F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="OFw85CW5"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f9bb4290001>; Thu, 29 Oct 2020 23:35:21 -0700
Received: from [10.25.99.37] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 30 Oct
 2020 06:35:08 +0000
Subject: Re: [PATCH v4 00/15] Audio graph card updates and usage with Tegra210
 audio
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <pierre-louis.bossart@linux.intel.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <p.zabel@pengutronix.de>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <c98d63a7-f311-a94f-abcc-1c5a87ba8025@nvidia.com>
Date: Fri, 30 Oct 2020 12:04:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604039721; bh=ycvf4n5KD1xsLuNvIWPme1ipDvYuSNjDWB6qo9gxrm0=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=OFw85CW5ZHPXwP2yMStP6E8VJZGIr7gva0pPhFEPMqhFXd/kbLi0yx6xXFBnoiCj9
 scstZc7uTWQBYHCxC8lcqQvSxa4QZjYOsH0nCbPxZP30C1tbMIRl2cfXcQR8FDH7J7
 c3LBaUOOEcLZICdBXB2ZWKYqIB0Vc6Hm0VA6gnyPJ0lwP430wVX1CippU+vVpVOfsj
 ZeYmF3TXY030eMT1m/uhVd5gD3VKLp3T3YWWoKdtkHafIiVd07tdhHDA8zzT/VZcaD
 VECCUJqlDuilUr3l2JwuUEO4h5EUdu1lBW0j4lR3DRHIf/oiYZwv1MhV/OhUJA65UR
 CJqGl6OxIyi0g==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 nicoleotsuka@gmail.com, swarren@nvidia.com, linux-kernel@vger.kernel.org,
 atalambedu@nvidia.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 nwartikar@nvidia.com, linux-tegra@vger.kernel.org, rlokhande@nvidia.com,
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

Hi Mark, Morimoto-san,

> Summary of changes:
>   * Support multiple instances of a component. For example there can be
>     multiple I2S devices which can use the same component driver.
>
>   * Support open platforms with empty Codec endpoint. Customers can plug
>     their own HW and can populate codec endpoint.
>
>   * In a component model there can be many components which can be
>     connected togethe. In such cases Identify no-pcm DPCM DAI links which
>     can be used in BE<->BE connections.
>
>   * Add Tegra audio graph driver which is based on generic audio graph
>     driver and specific customizations are done in Tegra driver.
>
>   * This pushes DT support for Tegra210 based platforms which uses
>     audio-graph card and above enhancements.
>
> The series is based on following references where DPCM usgae for Tegra
> Audio and simple-card driver proposal were discussed.
>
>   * https://lkml.org/lkml/2020/4/30/519 (DPCM for Tegra)
>   * https://lkml.org/lkml/2020/6/27/4 (simple-card driver)
>
> Changelog
> =========
>
> v3 -> v4
> --------
>   * Added new patches to convert graph.txt and audio-graph-card.txt
>     to corresponding json-schema files. Later these references
>     are used in Tegra audio graph schema.
>
>   * AHUB component binding docs are updated to reflect the usage
>     of ports/port/endpoint
>
>   * More common stuff is moved into graph_parse_of() and this is
>     used by both generic and Tegra audio graph.
>
>   * DT binding for Tegra audio graph is updated to included "ports { }"
>
>   * As per the suggestion 'void *data' member is dropped from
>     'asoc_simple_priv' and instead container method is used to
>     maintain required custom data internal to Tegra audio graph.
>
> v2 -> v3
> --------
>   * Dropped new compatible addition in generic graph driver
>     after reviewing it with Morimoto-san. Instead added Tegra
>     audio graph driver and new compatibles are added in the same.
>   * Added new patches to expose new members for customization
>     in audio graph driver.
>   * Added new patch for Tegra audio graph driver and related
>     documentation.
>   * Minor change in below commit where mutex version of helper is used
>     "ASoC: audio-graph: Identify 'no_pcm' DAI links for DPCM"
>   * DT binding is updated to use the newly exposed compatibles
>   * No changes in other patches
>
> v1 -> v2
> --------
>   * Re-organized ports/endpoints description for ADMAIF and XBAR.
>     Updated DT patches accordingly.
>   * After above change, multiple Codec endpoint support is not
>     required and hence dropped for now. This will be considered
>     separately if at all required in future.
>   * Re-ordered patches in the series.

>
> Sameer Pujar (15):
>    ASoC: soc-core: Fix component name_prefix parsing
>    ASoC: soc-pcm: Get all BEs along DAPM path
>    ASoC: audio-graph: Use of_node and DAI for DPCM DAI link names
>    ASoC: audio-graph: Identify 'no_pcm' DAI links for DPCM
>    ASoC: audio-graph: Support empty Codec endpoint
>    ASoC: audio-graph: Expose new members for asoc_simple_priv
>    ASoC: audio-graph: Expose helpers from audio graph

Would you suggest to keep above in a separate series and thus not 
blocked by below doc updates? If so do I need to resend above in a next 
revision or if these are good to be picked up?

>    Documentation: of: Convert graph bindings to json-schema
>    ASoC: dt-bindings: audio-graph: Convert bindings to json-schema
>    ASoC: dt-bindings: tegra: Add graph bindings
>    ASoC: dt-bindings: tegra: Add json-schema for Tegra audio graph card

Documentation patches in the series have some dependency over 
Morimoto-san's audio-graph series 
https://patchwork.kernel.org/project/alsa-devel/list/?series=372759. I 
will update doc related patches once dependency is merged.

>    ASoC: tegra: Add audio graph based card driver
>    arm64: defconfig: Enable Tegra audio graph card driver
>    arm64: tegra: Audio graph header for Tegra210
>    arm64: tegra: Audio graph sound card for Jetson Nano and TX1
