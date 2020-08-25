Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 501EC250FD7
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 05:13:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4028167D;
	Tue, 25 Aug 2020 05:12:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4028167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598325192;
	bh=B+Zgx08ZZIlHiO3EjqC3kAgpVjVLj6Srzmvv9aySNKM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XK4j1jq7Rjh3LvIuGQyDjD38aYnYPbpRb6ufJIxNxEGh+FPOmSiszvS/tL+pa9Slb
	 TEE+IxWt/UpIpy17nzPB4ZiXmEwmo0EP/aF3jB6oT06uy30YwxzqQcE7JIhXLHo5Fi
	 wANGpnZTF37DIxAhu5UMeRi4AGYSbqkhLAMrVQiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E39FBF80260;
	Tue, 25 Aug 2020 05:11:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCA5CF8025A; Tue, 25 Aug 2020 05:11:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04419F80143
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 05:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04419F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Y+qrFFJ6"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f4481100000>; Mon, 24 Aug 2020 20:10:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 24 Aug 2020 20:11:10 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 24 Aug 2020 20:11:10 -0700
Received: from [10.25.97.151] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Aug
 2020 03:11:06 +0000
Subject: Re: More Generic Audio Graph Sound Card idea
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
 <20200821121844.GF4870@sirena.org.uk>
 <878se4zybn.wl-kuninori.morimoto.gx@renesas.com>
 <58220f32-0b3e-d666-5bb0-bbeae27f6aab@nvidia.com>
 <87364by23u.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <e6e04e2c-2695-b7ba-3eb2-79158f317e4a@nvidia.com>
Date: Tue, 25 Aug 2020 08:41:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87364by23u.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1598325008; bh=XXp2/9E8WDkIqXHecOtzHsA7j1S9s+rWmxMrXc6Vj1M=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=Y+qrFFJ6azmDcOPhED5vmbmUQ9QhqS+q4Gq5V6Jgkg8CRUjWxLq419lodNmeYmhfx
 vREVMM8bitmpoXcbsAp2XXSqWJChnVn1b+ks/ueQWc3eNl6HgpYYRwzOlOc2IJjOiw
 BSjpycygDJ1o3A/Wz5Cb33P1kAGg6fR5JvXyBnHrUvgEBjG3mCNhKeiXd8b1nJScK4
 8QWIYDBoAv+kYATwEnHqNzr45KbzGuNMlazn9sr6tvBtVKQvZ30D3CAp73B9abca6x
 cGRVja7G0Jqm7oNKksZA/GGQLk9YwmXehWnZHZTRDYonNe/+1iCv7er4VMuUCHPBXq
 vBjn0yNvglSpw==
Cc: sharadg@nvidia.com, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 jonathanh@nvidia.com
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

CC Jon, Sharad

On 8/25/2020 6:29 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>> The series [0] introduces small deltas to resolve issues I am
>> facing. As you see, most of the implementation is unchanged for the
>> graph-card driver. Hence I am not sure if we need a new driver now.
> Yes, maybe it is not needed *for now*, but will be issue in the future,
> because I can't have normal-link and DPCM-link in the same time, right ?

Yes I am forcing usage of DPCM for all links. May be the compatible 
"-cc-" should reflect this. The reason for doing so is, wanted to use 
DPCM interface with the component model as previously discussed with 
Mark in [1]. The existing detection mechanism did not work because, in 
my case, the HW links are one-to-one and the DT is described that way in 
[0].

>
>> at all it gets complicated in future, the "-cc-" compatible can be
>> moved to new driver? Please note that the new "-cc-" compatibility is
>> added to address following and some of these are discussed in [1].
>> - DPCM usage with component model (where there can be N number of
>> components available and M (<= N) of them can be connected together to
>> form an audio path). For example the path would be like,
>> FE -> BE_1 -> BE_2 -> ... -> BE_M.
>> - I am extending dpcm_path_get() for this reason and DAI ops get
>> called for all connected components.
>>
>> [0] https://lkml.org/lkml/2020/8/5/42
>> [1] https://lkml.org/lkml/2020/4/30/519
> The difference between "-cc" and "card2" is DPCM link detection.
> "-cc-"  will assume all are DPCM link,
> "card2" will detect both normal-link and DPCM-link via DT.
>
> But, I guess new driver 1st version is focus to
> detecting normal-link and DPCM-link only.

Do you plan to propose something like enum for card2 and has scope for 
extension, where link type can be normal/DPCM/codec-to-codec/etc., ?
Since there are so many board variants and may have some specific 
requirements, I am wondering being able to detect link type from DT 
should be the only motivation for a new driver.

>
> This means it is not enough for your case,
> because I can't full reproduce your board/situation.
> Maybe you need some extra patch on "card2"
> which "-cc-" added to soc-xxx.c

I am afraid that even the new driver won't work as it is for my case 
unless a similar compatible and flag exposed for it. So I am not sure 
how different it would be from [0].


Thanks,
Sameer.
