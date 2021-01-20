Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B622FCA34
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 06:08:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D33C718CA;
	Wed, 20 Jan 2021 06:07:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D33C718CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611119319;
	bh=AFnIeKG3uVl+iY6U/2mo+oJ44nJ9fa8RMu5UEyTd2T0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bO/DRVBixHpO24ejJRw+1iN2HLCEpySaIfkwwET5exykh2VWGeHxOSmkoAmcZUed4
	 1TfpdUCa5majGPwVzWkLS5B9aLr7ezJuJ2Tkz3OHm/cH4mYefNcKT/L4ELAvEK1Uf1
	 VHjiD0nDOJF1WQrGWfNFBLLQpw4HvNLEQafR5afM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45CC7F80137;
	Wed, 20 Jan 2021 06:07:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BBB5F8016E; Wed, 20 Jan 2021 06:07:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74F8FF80137
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 06:06:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74F8FF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="iqJqehfr"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6007ba6e0000>; Tue, 19 Jan 2021 21:06:54 -0800
Received: from [10.25.99.10] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Jan
 2021 05:06:48 +0000
Subject: Re: Re: Re: [RESEND PATCH v6 5/6] arm64: tegra: Audio graph header
 for Tegra210
To: Thierry Reding <thierry.reding@gmail.com>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
 <1611048496-24650-6-git-send-email-spujar@nvidia.com> <YAcTxxyogVgfN1uw@ulmo>
 <b83eb795-328e-acc5-4555-7befd919a136@nvidia.com> <YAcdi7ARk0imXafQ@ulmo>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <fb0d0f14-e038-cb0c-542e-011ccb4beb93@nvidia.com>
Date: Wed, 20 Jan 2021 10:36:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YAcdi7ARk0imXafQ@ulmo>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611119214; bh=TrUW/bRVd0y6RBunmo1Nvw8U/CisQ85mSiTQB96uz4Q=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=iqJqehfrlGaLEYWRtxL8pSQcX78r9QttWiB+MThCuJIKgzBAG05ePIeO7kEtH3u/w
 lKt3gIrqHKl2y2rosb6wvtl0mGOf4xTMhixn97FdZEXDfyp1TXk1MBmpz4dGKFTh0p
 6yuyUPjOwC1fWbInmd2GX5IlkNh0bscT1c4rJ7bz5rkxVsv8a+y8jLOEHjV27Dw+Np
 CXv7nlVgSuim4YEU3v93drYtjTu4UdfUo66xQPY/+Vh21xrI9i/319L0kc1ub4RLYK
 XuVuyONSrYrmMpaopjtSGaxQSv2E0F8WFn/+psAoaISZ87LPRUOIIH62rj+IqyrO3i
 lYpd9Yh5WOaEg==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, linux-tegra@vger.kernel.org
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



On 1/19/2021 11:27 PM, Thierry Reding wrote:
> On Tue, Jan 19, 2021 at 11:09:32PM +0530, Sameer Pujar wrote:
>>
>> On 1/19/2021 10:45 PM, Thierry Reding wrote:
>>> On Tue, Jan 19, 2021 at 02:58:15PM +0530, Sameer Pujar wrote:
>>>> Expose a header which describes DT bindings required to use audio-graph
>>>> based sound card. All Tegra210 based platforms can include this header
>>>> and add platform specific information. Currently, from SoC point of view,
>>>> all links are exposed for ADMAIF, AHUB, I2S and DMIC components.
>>>>
>>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>>> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
>>>> ---
>>>>    .../boot/dts/nvidia/tegra210-audio-graph.dtsi      | 153 +++++++++++++++++++++
>>>>    1 file changed, 153 insertions(+)
>>>>    create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
>>> I prefer keeping everything in tegra210.dtsi, but I can do that merge
>>> when I apply, after the DT bindings have been acked, so no need to
>>> resend just because of that.
>> I think this may be fine for Tegra210 based boards. But for Tegra186 and
>> Tegra194, whenever we add support for it, can rely on a common audio-graph
>> dtsi because there is no change w.r.t APE. This can help us to avoid
>> duplication of the bindings. This most likely applies to future chips as
>> well (where Tegra186 audio-graph bindings can be considered as base) when
>> there is no significant change in APE.
> Maybe. Although that argument is somewhat extreme because we already
> have some of that same duplication throughout the other .dtsi files. By
> the same argument we could save a bit of duplication by having something
> like tegra-gpio.dtsi and including that in all the SoC .dtsi files and
> only update the compatible string, because that's the only significant
> change.

> Duplication isn't a big problem for DTS files because the data is meant
> to be stable anyway. So once it is in place and doesn't have to change,
> it really doesn't matter if it comes from an include or it's duplicated.

OK, if there is no issue with duplication then fine with me. Thanks.

