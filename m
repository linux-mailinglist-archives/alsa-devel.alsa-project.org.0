Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 472122566E9
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Aug 2020 12:54:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C304718DF;
	Sat, 29 Aug 2020 12:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C304718DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598698460;
	bh=L8iDZ08X8VZB7HAUJwq9rMPLXorcKD4YRXwPChxNYhU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tcq4ThZaTXZKamPUMCFS01YclOKmmJo2zEFOo0sZaZUEmeGxcxlFq4PHVuPEjnBGP
	 6zfJjIiJD4ia/4PPUX8cw/EnxxG+FBEMiILcqo9+UU7HoPiedoQ+P7YgstsWBrVxi+
	 fY5j9iKWFzdLrn9+DGuB8k++UQA3OH3wG8mM4/4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC1E8F8012E;
	Sat, 29 Aug 2020 12:52:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0DFFF8025A; Sat, 29 Aug 2020 12:52:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2881CF8014E
 for <alsa-devel@alsa-project.org>; Sat, 29 Aug 2020 12:52:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2881CF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="mZbVHOUq"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f4a33590000>; Sat, 29 Aug 2020 03:52:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Sat, 29 Aug 2020 03:52:24 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Sat, 29 Aug 2020 03:52:24 -0700
Received: from [10.25.99.248] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 29 Aug
 2020 10:52:14 +0000
Subject: Re: [PATCH v2 3/9] ASoC: audio-graph: Identify 'no_pcm' DAI links for
 DPCM
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1596605064-27748-1-git-send-email-spujar@nvidia.com>
 <1596605064-27748-4-git-send-email-spujar@nvidia.com>
 <87pn7ofs19.wl-kuninori.morimoto.gx@renesas.com>
 <97f325a6-96cc-11c5-8027-8c0a159e3da0@nvidia.com>
 <2d3aa11e-3c56-1f7a-3d41-2457f973d55b@nvidia.com>
 <87sgcbwcnf.wl-kuninori.morimoto.gx@renesas.com>
 <14691a05-cb29-a030-0e72-eca900d8eb7e@nvidia.com>
 <87o8mzwajg.wl-kuninori.morimoto.gx@renesas.com>
 <e9698ac3-0a2e-08a2-3f78-b0be0069d6ee@nvidia.com>
 <87lfi3w7hj.wl-kuninori.morimoto.gx@renesas.com>
 <f3724be2-c79d-0815-6ff5-460a4f6c10cc@nvidia.com>
 <87eentvwab.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <6c2bb431-c7d5-53b7-2f62-c1487e321680@nvidia.com>
Date: Sat, 29 Aug 2020 16:22:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87eentvwab.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1598698330; bh=z9YAEWuxCL0ZcZL6/sF4aCg5M+VV5wvIy23653SjDZc=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=mZbVHOUqOGxXut6zWwsgRZ0CUbPiGk7QDGFLrWBAMMepGty8Xh28KLm2rwVEvhpUB
 Q2BwcEzoaFOnzE1pjU7+AH59VEU7ZxQc1I/QGYd/KXXLqbf8YrAue4PhepCWaBKIEz
 cDBpWWb4sB8fp62IRRIHjRoufyO35FyoCKjXDIZsdtQ+VV3ViOf+0cDLzo3cf0FHzg
 BcsOm3uobCfVAvFjrY9/3FnvHMdOblx5ZjpvAmBuV58M5GFYv+IzPlN9cqALNhsw9e
 sx3ui32biKPGCbx7rZhuwEsVUFSS+5PNIdM3vT53hniB9VsNYfod9h97MxB6V+Y8Hn
 f1FFMcjDp6/eg==
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, linux-kernel@vger.kernel.org,
 nwartikar@nvidia.com, lgirdwood@gmail.com, robh+dt@kernel.org, tiwai@suse.com,
 viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, rlokhande@nvidia.com,
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

Hi Morimoto-san,

Sorry for the delayed reply as I was on sick leave.
>> Sure. BTW, there are more such candidates which require 'lock' version
>> of these helpers.
>> For example: soc_find_component(), snd_soc_add/remove_pcm_runtime()
>> and snd_soc_register_dai().
> soc_find_component() is static function, no need to care about mutex.
> other functions are indeed exported function, but is used from
> topology.c which is calling it under mutex.
>
>
I was just thinking if we need to future proof these functions. As you 
mentioned, currently these have limited usage (in topology.c) and should 
just be fine to address snd_soc_find_dai() for now.

Thanks,
Sameer.

