Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 636742D219B
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 04:56:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8C0E16C7;
	Tue,  8 Dec 2020 04:55:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8C0E16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607399801;
	bh=iUB9ZMWvlKhWiL6Nt363IWbp8GfZriWVS7Jl3aqT2Z4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R3TH4IbvRp2uNE+B4YrNbjR3FCI3NTThrDohOor97p9efBWaxmlgqQeOqnIELaS+c
	 +BcbYXZ4Lj8kPlMONkUe45RYQ8Fvzd5CCMnvlP+SF3lWV6WdFDC6cTMZZ+aJcojAlc
	 mViCUPxGGNe+QC8lAytSeB3vK7a9kKXv+nK1dYTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA7EDF80218;
	Tue,  8 Dec 2020 04:55:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1A4AF8019D; Tue,  8 Dec 2020 04:55:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1AB3F800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 04:54:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1AB3F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="SqDXS5tE"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fcef90e0004>; Mon, 07 Dec 2020 19:54:54 -0800
Received: from [10.25.96.159] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 8 Dec
 2020 03:54:51 +0000
Subject: Re: Re: [PATCH v6 0/6] Tegra210 audio graph card
To: Mark Brown <broonie@kernel.org>
References: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
 <160683107678.35139.14772386553150233276.b4-ty@kernel.org>
 <a3541d83-1f2e-c60f-05f8-4fdd8c8f4175@nvidia.com>
 <20201207123131.GB5694@sirena.org.uk>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <14d2a6cc-9ca6-f6dd-ae83-6fc75d5361eb@nvidia.com>
Date: Tue, 8 Dec 2020 09:24:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207123131.GB5694@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1607399694; bh=57K2arrOkrJycwF/NemnQ2nVOm/DzL8o8jMnlSRtwvI=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=SqDXS5tEn21GY7pYzotCi6w+Aay3/ODcWDWFr9ajMXtspjiBxj905ymiwC6mZrh07
 U0PAJio4KsGhKpaiSAqSJ1A4M6dTRq2Oo02szHGWVkXWfm/pY1V31R/vWic5h+mayT
 07v/9KAx1px26e3tLqMYdRkHWwbrsnDPHXzLV9HR50dB8hLFOz2cif/2F+HDZpsIyH
 R4WjVNtpBnusnLuIXG9K0GufcDjVph3MrOwy3L950iysmgvu53VtHxH3tQpjpHO5YZ
 pmrc8tGM9N98rtARkuHAa8Dd0f9vec7Gks10E8QYs6HKpc5sRiwnR6zpiwomm4Wdn8
 3Oc2KaL66t1LA==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, sharadg@nvidia.com
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


>>> [1/3] ASoC: dt-bindings: tegra: Add graph bindings
>>>         (no commit info)
>>> [2/3] ASoC: dt-bindings: tegra: Add json-schema for Tegra audio graph card
>>>         (no commit info)
>>> [3/3] ASoC: tegra: Add audio graph based card driver
>>>         (no commit info)
>> I don't see above patches in linux-next yet. Should I wait some more time
>> for this to appear?
> No, this was sent by a b4 bug - notice the "no commit info" there, they
> weren't applied.

Oh I see! I guess review would be still pending then.
