Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A35248026
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 10:07:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 873FB1740;
	Tue, 18 Aug 2020 10:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 873FB1740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597738022;
	bh=heC1vgbpgk+q1649W474V+oLjLNHTHPDYHt2f0ykG68=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nQ0TiUdLLF2JhtE3ng1983/vuLDCaLCvxd9eFSDOpD1N1o62i5sX01Ge7vJ0EnKDD
	 WDp0rVnhLxkGG42Aj/hlyFjGHbTXDUsJyJ1qzsogb8ZiXJZ88SR2ml9SRWLQXUQyBQ
	 CH525OVz8Nz+118CBVD9vxfzcvGbE8l+tZiYKLNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A782AF80114;
	Tue, 18 Aug 2020 10:05:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9005FF8023F; Tue, 18 Aug 2020 10:05:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09AC9F80104
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 10:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09AC9F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Sc5umqZg"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f3b8b7b0000>; Tue, 18 Aug 2020 01:04:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 18 Aug 2020 01:05:09 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 18 Aug 2020 01:05:09 -0700
Received: from [10.25.96.247] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Aug
 2020 08:05:01 +0000
Subject: Re: [PATCH v2 3/9] ASoC: audio-graph: Identify 'no_pcm' DAI links for
 DPCM
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1596605064-27748-1-git-send-email-spujar@nvidia.com>
 <1596605064-27748-4-git-send-email-spujar@nvidia.com>
 <87pn7ofs19.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <97f325a6-96cc-11c5-8027-8c0a159e3da0@nvidia.com>
Date: Tue, 18 Aug 2020 13:34:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87pn7ofs19.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1597737851; bh=Oi6lbenVf+d9qaNFylb6ue+c+bn4H+xbJ5ZdG5w01GY=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=Sc5umqZgw8m8LG4dT+NvJ1NfVxVpw9Xj6fB066rpl3kPqZ5iFDH0/mMqz0bI1S4Sh
 diqKfHmMnNbAMdMzuyzhhNif+tMIbSArvDAyZFI7O54nZWpD1OY7bjOYtWvF6Q4op9
 7/IkPuA+thy1LgsS7mZ/hugMFT4a7KFpKxkSyZ5oAaK/E9BdN4OaZheMBrKLPJKkHt
 is53Jk3Fck8jNxH0RhgNTajxJhIfex2GBm2kOO06Z/8nXBrzG8b3EFxu2TlAs45u8g
 G90C9Pqna43RNH5A1msm7Xl+ytEPKZo4o+3aJeQ7FGVA7t21ACVnNOVYF19UGL8Zw1
 9ASlmX1NbUg4Q==
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

On 8/18/2020 10:53 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi again
>
>> PCM devices are created for FE dai links with 'no-pcm' flag as '0'.
>> Such DAI links have CPU component which implement either pcm_construct()
>> or pcm_new() at component or dai level respectively. Based on this,
>> current patch exposes a helper function to identify such components
>> and populate 'no_pcm' flag for DPCM DAI link.
>>
>> This helps to have BE<->BE component links where PCM devices need
>> not be created for CPU component involved in such links.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
> (snip)
>> +static bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
>> +{
>> +     struct snd_soc_dai *dai = snd_soc_find_dai(dlc);
>> +
>> +     if (dai && (dai->component->driver->pcm_construct ||
>> +                 dai->driver->pcm_new))
>> +             return true;
>> +
>> +     return false;
>> +}
> This snd_soc_find_dai() will indicate WARNING
> if .config has CONFIG_LOCKDEP for me.
>
> Maybe implement it at soc-core.c with client_mutex lock
> is needed.

Thank you for testing this. I will update this in next revision.

>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
