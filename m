Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 444122FBDE1
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 18:41:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D311418D3;
	Tue, 19 Jan 2021 18:40:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D311418D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611078082;
	bh=g5s2pe27q/SxkjfTGAsH1Ja+K1l6zO9rkLBnVs14Es4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OFe/H7yEC4hdL/RVdOPFi+fC/GHM5JHSY03shJmX+ULMBDoTHId/GvV7ZqqOdFexW
	 /B8rfs4Yhb6C3gKinObUA75KemiUY4iQgjg6SYJ5IqLhZWd/t2v1TwNqw9fqZcmM+9
	 XAPqjQv6YfYl2p3h5ut1Wxfhpdoe7caXzFcYqtag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50BDBF8026A;
	Tue, 19 Jan 2021 18:39:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A184F80117; Tue, 19 Jan 2021 18:39:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44044F80117
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 18:39:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44044F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="BkfBjCUi"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6007195c0000>; Tue, 19 Jan 2021 09:39:40 -0800
Received: from [10.25.99.10] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 17:39:36 +0000
Subject: Re: Re: [RESEND PATCH v6 5/6] arm64: tegra: Audio graph header for
 Tegra210
To: Thierry Reding <thierry.reding@gmail.com>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
 <1611048496-24650-6-git-send-email-spujar@nvidia.com> <YAcTxxyogVgfN1uw@ulmo>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <b83eb795-328e-acc5-4555-7befd919a136@nvidia.com>
Date: Tue, 19 Jan 2021 23:09:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YAcTxxyogVgfN1uw@ulmo>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611077980; bh=NYSuQvptGwglsg6hwhbeZo+P6a5iRvHlv/Ac5X3wq0E=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=BkfBjCUirmEPSHaImywpIfpgV7kphUGUianmqeHjkbZ0ygzEmqlRasO7Hwd/L4VPy
 KOO2kYKtrdPTiV4eFWv2p4PUvcSY07KI0LiQ2CZaQQtGpJXn8EjBnfOmzwobA1RVdZ
 MSxH3StnoqYMehpSI9CqmNvITcT7VpsxCqSErtSmKkGgyaqQL90TXladEbNVJGOybg
 PLS6JMYhVbDNvmgjUEg2rAaCoqv08+3EKa/mlMh+SnOTuWQP1v06KTpRg6mHxSlIgK
 uvz8RO5GxtqnZGHBIbwoekZLCd/ajzehQG7HgxkAZy5fj5SXzTAaaFR0QZ9pBUlM7S
 8VOFBzSnarVhQ==
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



On 1/19/2021 10:45 PM, Thierry Reding wrote:
> On Tue, Jan 19, 2021 at 02:58:15PM +0530, Sameer Pujar wrote:
>> Expose a header which describes DT bindings required to use audio-graph
>> based sound card. All Tegra210 based platforms can include this header
>> and add platform specific information. Currently, from SoC point of view,
>> all links are exposed for ADMAIF, AHUB, I2S and DMIC components.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   .../boot/dts/nvidia/tegra210-audio-graph.dtsi      | 153 +++++++++++++++++++++
>>   1 file changed, 153 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
> I prefer keeping everything in tegra210.dtsi, but I can do that merge
> when I apply, after the DT bindings have been acked, so no need to
> resend just because of that.

I think this may be fine for Tegra210 based boards. But for Tegra186 and 
Tegra194, whenever we add support for it, can rely on a common 
audio-graph dtsi because there is no change w.r.t APE. This can help us 
to avoid duplication of the bindings. This most likely applies to future 
chips as well (where Tegra186 audio-graph bindings can be considered as 
base) when there is no significant change in APE.
