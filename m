Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F0A223BC4
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 14:57:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E39415E5;
	Fri, 17 Jul 2020 14:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E39415E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594990653;
	bh=xszZi/0RQuB6zRVP4bCYHuUsCAX9DatYgtsS+mBsmhg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lNDg7crfYxNxsH65jADBfAJeSEg9KGIOfPs0tRGou1txNREYFu4m8tarcb5/FO4VO
	 PSvMKQU/g8N7i3VeAKvxTWkLsb+jwzirPRvUxfXmZS3EzMuork14tm06BGwzeKy7T0
	 04Fk3XPGL3sel5amG27DYCpA8OjDnABWt6KHqoCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6AC4F8021D;
	Fri, 17 Jul 2020 14:55:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E615CF80217; Fri, 17 Jul 2020 14:55:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00425F800E4
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 14:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00425F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="CVhmyGBZ"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f119f910001>; Fri, 17 Jul 2020 05:54:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 17 Jul 2020 05:55:40 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 17 Jul 2020 05:55:40 -0700
Received: from [10.25.99.49] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jul
 2020 12:55:21 +0000
Subject: Re: Re: Re: Re: [PATCH v4 12/23] ASoC: simple-card: Support DPCM DAI
 link with multiple Codecs
To: Mark Brown <broonie@kernel.org>
References: <874kqu1x70.wl-kuninori.morimoto.gx@renesas.com>
 <1e0cf6d1-bf4e-8808-5390-c8a3b7c7fe7e@nvidia.com>
 <87mu4lz6pt.wl-kuninori.morimoto.gx@renesas.com>
 <1d7888c7-a8cc-e891-01aa-016e31cc9113@nvidia.com>
 <87ftadyrec.wl-kuninori.morimoto.gx@renesas.com>
 <492079e9-4518-78ba-a227-859d31594369@nvidia.com>
 <20200630110100.GH5272@sirena.org.uk>
 <81d106c0-e1c8-a79a-8caf-1f3be0d61f0c@nvidia.com>
 <20200630153220.GL5272@sirena.org.uk>
 <fb286ab7-21f2-43ad-2751-c76b7b6e4cf2@nvidia.com>
 <20200702122605.GE4483@sirena.org.uk>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <6194dad2-040b-c0f2-b269-571a303bbb08@nvidia.com>
Date: Fri, 17 Jul 2020 18:25:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200702122605.GE4483@sirena.org.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1594990481; bh=SusogErtypZgY+TzdZS2HFWYqEUTbBJkbKRjGIuYqvc=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=CVhmyGBZcGr+Ew3ideddsTJWWsTullCZJHR3/D8XmLHsiV2Jm+4xp8TaKd7EYMTGF
 HPDeCCX45FfXcap1FcW+RZ3dJIgpCKzLjSjaj05k/WOj2HQlQBBhVEg2xVMe+xOPIn
 OQAWAYffwU1bNtxD5KfBoSZE4ILYseTTMS62kK9aSM8iki+oTGPCdj1x+MaHZA+V+B
 6hIOXD4L76hcGKwGiCgA5e/qpm8fiIPhGoKgnNYJbymhyKMyy3/CoN5FbzDmuidjhW
 hMVmKQw2wkuZjZvSAp2Vns2E+IY3rwBscDpE3q/BI87S1vc/MbvVvHBle6pUfIOPvy
 /s/Enp4rdzLoA==
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, spujar@nvidia.com, nwartikar@nvidia.com,
 lgirdwood@gmail.com, tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 robh+dt@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com, rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

Hi Mark,


On 7/2/2020 5:56 PM, Mark Brown wrote:
> On Thu, Jul 02, 2020 at 04:06:14PM +0530, Sameer Pujar wrote:
>
>> For the HW I am using, there are no fixed endpoints and I am not sure if it
>> is allowed to have empty endpoints in audio-graph-card. Crossbar/router
>> provides the flexibility to connect the components in any required order.
>> Patch [05/23] exposes required graph and MUX controls for the flexible
>> configurations. Mostly, in DT, I am trying to model the component itself and
>> finally router can help me specify the audio path to interconnect various
>> components. Hence I was trying to understand if it is really necessary to
>> represent the links using audio-graph-card. Kindly help me understand what
>> more it offers. If simple-card works fine, are we allowed to use it?
> The links in the graph card should be the physical links at the edge of
> the devices, those must be fixed no matter what.

I used graph-card and could get few things working with it. Based on the 
feedback so far, I am planning to split the series as suggested and send 
two series as below.
[1] Tegra AHUB series and related DT bindings as V5.
[2] Audio graph card enhancements and related DT bindings for Tegra 
platforms as V1.

Thanks,
Sameer.


