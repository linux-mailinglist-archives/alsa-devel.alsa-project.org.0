Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8707020F405
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 13:57:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27C88167D;
	Tue, 30 Jun 2020 13:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27C88167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593518267;
	bh=3jc8EyudNpVWKc60u2MwECuEVk3kExP5l8qhl+cek9w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ltHIw1Lrxrco+CvwICbi1PcogIeIPPldC8KQryKj0Py4P42OsGBZc8YHy5jPa0RVJ
	 DcBs00h/ajQWo0cXgfFhTQPsZrzTd2w75hKuplkfO1dQh1aFhiY7X5mevxvkR3sVNN
	 r2/UeuTp2hsBxEjfM6B7RnOaKSmN8BTa3fWd3qpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A492EF80247;
	Tue, 30 Jun 2020 13:56:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D062F80247; Tue, 30 Jun 2020 13:56:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFFDDF8022D
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 13:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFFDDF8022D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="QLp5BLjW"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efb286e0001>; Tue, 30 Jun 2020 04:56:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 30 Jun 2020 04:56:44 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 30 Jun 2020 04:56:44 -0700
Received: from [10.25.97.62] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 11:56:35 +0000
Subject: Re: Re: [PATCH v4 11/23] ASoC: simple-card: Loop over all children
 for 'mclk-fs'
To: Mark Brown <broonie@kernel.org>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-12-git-send-email-spujar@nvidia.com>
 <875zba1y28.wl-kuninori.morimoto.gx@renesas.com>
 <58000bd3-861c-bbc2-75e1-128cf0199a76@nvidia.com>
 <87lfk5z4ov.wl-kuninori.morimoto.gx@renesas.com>
 <b33d5a1b-ecd5-3618-4894-c3ab0f4b077d@nvidia.com>
 <20200630105532.GG5272@sirena.org.uk>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <8b264575-08e7-64c5-fd7c-3109a0a36ce8@nvidia.com>
Date: Tue, 30 Jun 2020 17:26:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630105532.GG5272@sirena.org.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593518192; bh=kRg7pU3gJSgsCt5OO4SsNHbiLgeij8sbJesDlJdXIC8=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=QLp5BLjW8+idyvq+WuWlIPC61zDNT6Kje7XkXi8kNAoSVMwbMbbWavQJ6WlfZibDw
 CQ0Sw4x9eV/JAKfaSJkPtWlcoWgibJd7FnDyn16roIHIEhdb/lahy1dJSa9iApPDxN
 7wM2JeXbdjR+YTnTJ7G+ol6+c9mzd+lGqBHOx736znHl/t8p5Wmx60beRaUHXBUMLQ
 6huyFzHmpjRQ6I8UeUpoGcv7Mf9kKFqrz5Gk5IxkEtEz6u0I7IyJBcpXmZKqbAp3RF
 sIaAFK0ql04TSyxYZlSAYaN3OLETqq/Lpllw0DTtRQuIlPq6ejNhtzpO/Bz60Rlfqn
 SokJqLJ4GVZ4g==
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



On 6/30/2020 4:25 PM, Mark Brown wrote:
> On Tue, Jun 30, 2020 at 09:53:13AM +0530, Sameer Pujar wrote:
>> On 6/30/2020 7:38 AM, Kuninori Morimoto wrote:
>>> External email: Use caution opening links or attachments
>>>>>> +     if (cpu != codec)
>>>>>> +             of_property_read_u32(codec, prop, &props->mclk_fs);
>> Sorry if I was not clear before.
> I agree with Moromito-san that the new code (especially the above bit)
> is very confusing, I'm not sure how the reader is supposed to figure out
> what the purpose of the check is or how the CPU could ever be the CODEC.
>
>> simple_parse_mclk_fs() is used by both simple_dai_link_of_dpcm() and
>> simple_dai_link_of(). To make the same API work for both the cases, I had to
>> use (A) in DPCM function. Now (B) does not get used for
>> simple_dai_link_of_dpcm(), but will get used by simple_dai_link_of().
>> If it is simpler I will just avoid 'cpu != codec' check and keep the
>> function simple_parse_mclk_fs() as it is.
> That'd definitely be simpler, or supporting this with a CPU node as
> well.

OK. I will keep it simple.

