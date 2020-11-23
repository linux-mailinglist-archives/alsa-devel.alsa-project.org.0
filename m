Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D772C0373
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 11:40:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4070168B;
	Mon, 23 Nov 2020 11:39:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4070168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606128013;
	bh=5FdECtdXDdxGy8YfS5WKC6dGDXp5g4ZnIzQe2rameZg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cBYII+4bHpUv39+J7WlVq4xE2Ab3M4pldcK/zQeDZb3Exx21Ck/HQ9idGlePqBis1
	 BnHTFMdbsjj73rzX8HctAPbLQZ0zG0f+JQ9XTRtuZDUj8Wc3dGH7fVRazAyu92I2TO
	 9kzgAxXpX582eiFBtTboQjT4CzwKQQd+oXCFwBR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39E04F80128;
	Mon, 23 Nov 2020 11:38:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ADBBF80255; Mon, 23 Nov 2020 11:38:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB41BF80128
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 11:38:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB41BF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="X1usOJU0"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fbb91270000>; Mon, 23 Nov 2020 02:38:31 -0800
Received: from [10.26.72.66] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Nov
 2020 10:38:26 +0000
Subject: Re: [PATCH v5 0/6] Tegra210 audio graph card
To: Sameer Pujar <spujar@nvidia.com>, <broonie@kernel.org>,
 <robh+dt@kernel.org>, <thierry.reding@gmail.com>
References: <1605119676-32273-1-git-send-email-spujar@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <bbf5c039-faab-618b-7b3c-8991bb75d4a0@nvidia.com>
Date: Mon, 23 Nov 2020 10:38:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1605119676-32273-1-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1606127911; bh=rja4mFvPtVCeH4UELYSy3t07Yo+UPDvUCyzzCQixKww=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=X1usOJU0UqprKtf9SA4DFxYJrh+6K9X8SYt/mat5kG4dSMka4gKP49pcyT+p8VgMd
 C+RHSlT9DCECut9i25KXabM0IxvutDNtWbugyunFjn0LqQlhgoJXa+ta3UkfzVm4XO
 XEF+/6ueRwEjEcEWdzXXOOej6W5Qgd80k5W+UWwjNrurK3OhrJJ+i87dEmtGhT7pfr
 E1wGOeL9KWUjTZkz1tKSi1j9C8Eyvq1PfaSQ83Ks9XxpXcJ52QNV0EZAf5zjx8aI5D
 ntYZjtEFwhHiXVgiCJxXImRFz5M4DgFwlR6ST45KR+i02u0QRE2bwMHBRBHVs2/CQf
 KiJk20Zt8/N0Q==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 sharadg@nvidia.com, linux-tegra@vger.kernel.org
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


On 11/11/2020 18:34, Sameer Pujar wrote:
> This series adds audio graph based sound card support for Tegra210
> platforms like Jetson-TX1 an Jetson-Nano. The following preparatory
> audio graph enhancement series is already merged.
>  * https://patchwork.kernel.org/project/alsa-devel/list/?series=375629&state=*
> 
> Following are the summary of changes:
>  * Add graph/audio-graph based schemas or schema updates for Tegra210
>    component and machine drivers.
>  * Add Tegra audio graph machine driver.
>  * Add required DT support for Jetson-TX1/Nano.
> 
> This work is based on earlier discussion of DPCM usage for Tegra
> and simple card driver updates.
>  * https://lkml.org/lkml/2020/4/30/519
>  * https://lkml.org/lkml/2020/6/27/4
> 
> This series has dependency over following graph and audio-graph series.
>  * http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20201102203656.220187-2-robh@kernel.org/
>  * https://patchwork.kernel.org/project/alsa-devel/list/?series=382009&state=*


Only one minor comment, but this looks good to me. Otherwise for the
series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
