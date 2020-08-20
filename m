Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF4124B1A5
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Aug 2020 11:04:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCA1C167D;
	Thu, 20 Aug 2020 11:04:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCA1C167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597914297;
	bh=xD51AxssCzFvHTs8M540hgD1vCdy4eD+8i85yMdxqrg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kEHfz1YUChWOlwv2bt4oWbU7IoTxA6lZ30nJKKQhVUj7x1/c+ALdlmqYrx7mhlawG
	 bOnoQyOrXqc76QwKr5Zns8W8jnlqtH3Po7hstV/TeW07bNlUQ4mtLMYuNuKA+KqHJ5
	 wlOHJwj6ChVbh+67mzPyg6uLpd56MBHIaMuptdmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3A8DF80114;
	Thu, 20 Aug 2020 11:03:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AAD1F80228; Thu, 20 Aug 2020 11:03:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB317F80114
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 11:03:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB317F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="pjCbM9vS"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f3e3bd5001d>; Thu, 20 Aug 2020 02:01:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 20 Aug 2020 02:03:04 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 20 Aug 2020 02:03:04 -0700
Received: from [10.25.96.247] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Aug
 2020 09:02:58 +0000
Subject: Re: [PATCH v2 0/9] Audio graph card updates and usage with Tegra210
 audio
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1596605064-27748-1-git-send-email-spujar@nvidia.com>
 <87v9highuf.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <8fa4a359-c80c-9c8f-93fa-c1cc25b322e8@nvidia.com>
Date: Thu, 20 Aug 2020 14:32:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87v9highuf.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1597914070; bh=l93EHFvud8eHnNf5HuttsftOmzf1SaVxatzJ4Lt47G8=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=pjCbM9vSsTNYfabczFr41DPleV11yMC26g0HrwUCyslwN3LhT0yRZnjyHAQGv+7zn
 ERIfTz94Ctp7fikIKeSYmpySTLRP1VR/1v6a/rpZefKBcemsJ9tYInzNlXyCiUQsYu
 lTaBq6rNRYXWxM+xZIDw8sIOXPvHRPy3A337VD2zrOQanIe+NVd4mrjohacGiAPDbo
 bc3dBl+ZsvNWRVUpSSfHMpGxvRHLMsWLj5hZ1J6MCgegtrxY7msb4FF4Ae9YiqSzsp
 M+qwAt6n9Y46KVt35kxvMG2YKk42ZxqMKMSW1RyB+5sWWJ967j9U5C0eEJblT+FmCh
 Pz7MmtO821lMA==
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

Hi Kuninori,

On 8/17/2020 7:23 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
> Cc Mark
>
>> This series proposes following enhancements to audio-graph card driver.
>>   * Support multiple instances of a component.
>>   * Support open platforms with empty Codec endpoint.
>>   * Identify no-pcm DPCM DAI links which can be used in BE<->BE connections.
>>   * Add new compatible to support DPCM based DAI chaining.
>>
>> This pushes DT support for Tegra210 based platforms which uses audio-graph
>> card and above enhancements.
>>
>> The series is based on following references where DPCM usgae for Tegra
>> Audio and simple-card driver proposal were discussed.
>>   * https://lkml.org/lkml/2020/4/30/519 (DPCM for Tegra)
>>   * https://lkml.org/lkml/2020/6/27/4 (simple-card driver)
> I will try to test this patch-set this week, and report/review it.

Thank you for review so far. Have you also got a chance to review 
remaining commits in the series?

>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
