Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C000283BB1
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 17:53:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4111A17B7;
	Mon,  5 Oct 2020 17:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4111A17B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601913195;
	bh=ECteLpEYWYCm+mSfsD3H9bajG1oTzClwkS0uDSwJLd4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GNFhaZqZ3w2WJaEAl/zaQDxj5DgcpEp8ZeM71nFUGuWNRyDddMTN7QErLfGFaLdW6
	 hZE0ZyqbphZlEZYz3jxkpkgK/UNmWDKuDDCkg4hUk1D0KPRG6+e60hxaGDcLkTOqfG
	 lKeJlX/Vgx7uQTQwSolEGoTgi77oBNF9mXbqv0/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56055F80269;
	Mon,  5 Oct 2020 17:51:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DBEBF80260; Mon,  5 Oct 2020 17:51:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B18DF800C9
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 17:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B18DF800C9
IronPort-SDR: U11vy0wChOlX+QvwPITJUGDYlHu9v56AIc5Evkg1XxDmffi3njJmge/IMouVQ/CJQ5CU2vQG82
 Jyu8d36UrVkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="143657222"
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; d="scan'208";a="143657222"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP; 05 Oct 2020 08:51:15 -0700
IronPort-SDR: v0pZQ0WVeZV7h2vIQykWY35/5QD9fZWc6Q3I+OJgUrDrwpu2t9CAlMsk+R4nVrGU7TIaSWUHbH
 55a5XsMqSI1A==
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; d="scan'208";a="417308196"
Received: from srembels-mobl1.amr.corp.intel.com (HELO [10.212.125.28])
 ([10.212.125.28])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 08:51:10 -0700
Subject: Re: [PATCH 1/4] ASoC: Intel: bdw-rt5650: Mark FE DAIs as nonatomic
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20201004090609.29066-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3ac93d7c-f87f-334b-5cd9-334788030c29@linux.intel.com>
Date: Mon, 5 Oct 2020 09:49:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201004090609.29066-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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



On 10/4/20 4:06 AM, Cezary Rojewski wrote:
> PCM operations for DAI links connected with DSP platform component
> involve communication with DSP firmware by IPCs. As IPC protocol may
> cause thread to sleep while waiting for a response from DSP, propagate
> that information to ALSA core by marking all FE DAIs as nonatomic.

I double checked that indeed the machine drivers modified in this series 
were the only ones without both .dynamic and .nonatomic set.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Cezary!

> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/boards/bdw-rt5650.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
> index c44315af6a4c..aa420b201848 100644
> --- a/sound/soc/intel/boards/bdw-rt5650.c
> +++ b/sound/soc/intel/boards/bdw-rt5650.c
> @@ -232,6 +232,7 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
>   	{
>   		.name = "System PCM",
>   		.stream_name = "System Playback",
> +		.nonatomic = 1,
>   		.dynamic = 1,
>   		.ops = &bdw_rt5650_fe_ops,
>   		.trigger = {
> 
