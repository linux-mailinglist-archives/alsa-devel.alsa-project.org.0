Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B792720EC2D
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 05:50:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5762915E0;
	Tue, 30 Jun 2020 05:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5762915E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593489005;
	bh=UcthL2nug+KzY9nuYTxpnBMkugp7xSoOqkW4NlNHcSo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l0zjEumU7oEIRgFeI3TbGybzEoGvP8hAGJha71+gTtutNRNR/jGfoPwMBnIbFdNBE
	 XGTsnQkZhhmWLCRXd96XuzjqvbuhZLtbPKjK5O0cbhmSucU17ENjOmVmP0ozdLnKD6
	 jZ6LFt89IS2+x27aA+fUHeshzzho/n/p13dAk7R0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FD56F8022D;
	Tue, 30 Jun 2020 05:48:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 766D6F801D8; Tue, 30 Jun 2020 05:48:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EFF1F8013E
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 05:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EFF1F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="qwFpHH7Q"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efab59a0000>; Mon, 29 Jun 2020 20:46:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 29 Jun 2020 20:48:12 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 29 Jun 2020 20:48:12 -0700
Received: from [10.25.97.62] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 03:48:03 +0000
Subject: Re: [PATCH v4 10/23] ASoC: simple-card: Wrong daifmt for CPU end of
 DPCM DAI link
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-11-git-send-email-spujar@nvidia.com>
 <877dvq1yhy.wl-kuninori.morimoto.gx@renesas.com>
 <6e27daa5-331e-968b-4027-2e30aeb7d382@nvidia.com>
 <87o8p1z81b.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <841ac69f-1c3f-2b13-17f9-6f196811ce52@nvidia.com>
Date: Tue, 30 Jun 2020 09:17:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <87o8p1z81b.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593488794; bh=Waf+fRsBa+tnFyTsNnzSNk2rurwJRlEFA5A13c5KFMs=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=qwFpHH7QE9mC28kfCJxAzmZEE6JRNuOHvraL8M+Y1I0zQ2WHYK/Oh8u5rmuHvtNqL
 GcmVOB6EW9EOlpdfCaH4AOmTYNBxxacg/Aqt2JtYELBNEAWybmjXvu3pfb4AEyqrHY
 yYntjl5O1xuuT5F/Sh4kN2gK+PEGfeQf+KCl4vnYO0NNbx7GcryFnkzP9t1XgMNp6w
 +kXre478ipBLf7aA32L6fd0Y6QQeVQ5UhAfx1kBLrlGT0G/1FnvSypYJelewxTlkSP
 ACpFmiAhdlrKdgWY8KEQGkm7JZP3NEu8oHzSFiQf8DZKRtYw9BWJms99RTFKLDDhT7
 ThgNFlWVXU8Ag==
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, linux-kernel@vger.kernel.org,
 spujar@nvidia.com, nwartikar@nvidia.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
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



On 6/30/2020 6:26 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>>   snd_soc_runtime_set_dai_fmt() {
>>       ...
>>
>>       if (cpu_dai->component->driver->non_legacy_dai_naming)
>>           fmt = inv_dai_fmt;
>>
>>       ...
>>   }
>>
>> Above flips polarity for 'cpu_dai' if 'non_legacy_dai_naming' flag is set.
>>
>> 1. Hence example mentioned in the commit message does not work if my 'cpu_dai'
>> driver does not have this flag set.
> ?
> Do you want fo flip it ? or don't flip?
> It is for Codec <-> Codec connection.

For DPCM links I don't want to flip based on one Codec reference. My 
goal was to make the binding work for multiple CPU/Codec link. Hence I 
thought it would be better to explicitly describe the 'Master' DAI. We 
can eventually get rid of 'codec' argument from simple_dai_link_of_dpcm().
>> 2. While it is true that we consider reference of 'Codec' mode for simple CPU<->
>> Codec DAI links, for DPCM this does not seem flexible. For DPCM links CPU and
>> Codec are not directly connected (CPU<->Dummy or Dummy<->Codec). Please
>> consider, for example, if the DAI link has multiple CPU/Codecs. Which 'Codec'
>> reference needs to be considered? Isn't it better if we explicitly mention which
>> DAI we want to operate as 'Master'?
> I think Lars-Peter has (had ?) plan for this SND_SOC_DAIFMT_CBx_CFx
> flag flexibility ? Yes maybe it is needed for multi CPU/Codec system.
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

