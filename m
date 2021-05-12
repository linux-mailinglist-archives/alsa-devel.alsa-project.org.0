Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E434637C0F4
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 16:54:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82CB6186C;
	Wed, 12 May 2021 16:53:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82CB6186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620831267;
	bh=iqtC6rXZba9iPm73W/s0kRJWYkXso90HKQ4qnz04t5c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WdaBkopOjKEI7ERI797O9K2OBl+0VGBd9eWhHrZU9d2W/oRRIO3DpvvDsUjAkTpHp
	 EP740baamfMiEm8vg1IlfOkHE3KS8vxNT/bs5HNN4H09+kND3VCdbOJnRXzn6O/4os
	 i56JrExZiytVDGbkhHKsp+kmKb6I3VIXh63cOKZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2045F8026B;
	Wed, 12 May 2021 16:52:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECCCFF80240; Wed, 12 May 2021 16:52:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B565F8012E
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 16:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B565F8012E
IronPort-SDR: uG22VTPri/ZRTt0nC4VgjfgAiqVnXo4yqg+3jh1S/mRfLsbPNLFJ3LboNPsFoHxMJn0XUkJ4P+
 gZduKg9RPc0w==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="186855391"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="186855391"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 07:52:46 -0700
IronPort-SDR: cA6Zs510rHgQ6GkS8D4I8JMdHFHQypk/xImYgpETYmwZqd5kFXM15Z5wxzVPeZQ9aidlivSjlH
 DTsE4qIgJrvA==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="437236918"
Received: from cwitkows-mobl.amr.corp.intel.com (HELO [10.212.100.147])
 ([10.212.100.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 07:52:44 -0700
Subject: Re: [PATCH -next] ASoC: intel/boards: add missing MODULE_DEVICE_TABLE
To: Zou Wei <zou_wei@huawei.com>, cezary.rojewski@intel.com,
 liam.r.girdwood@linux.intel.com, yang.jie@linux.intel.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 kuninori.morimoto.gx@renesas.com, kai.vehmanen@linux.intel.com,
 brent.lu@intel.com, ranjani.sridharan@linux.intel.com, yong.zhi@intel.com,
 dharageswari.r@intel.com, sathyanarayana.nujella@intel.com,
 fred.oh@linux.intel.com, tzungbi@google.com
References: <1620791647-16024-1-git-send-email-zou_wei@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <50fa973b-aa9f-ccb4-8020-9d38a63e2c30@linux.intel.com>
Date: Wed, 12 May 2021 08:41:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1620791647-16024-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 5/11/21 10:54 PM, Zou Wei wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.

I have a limited understanding of all this, but we already support the 
machine drivers as modules and things work fine.

I wonder if this MODULE_DEVICE_TABLE generates the alias automatically, 
which would make the existing ones added manually at the end of the 
files unnecessary? If that was the case, then we should remove those 
MODULE_ALIAS as well, no?

MODULE_DESCRIPTION("SOF Audio Machine driver");
MODULE_AUTHOR("Bard Liao <bard.liao@intel.com>");
MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
MODULE_LICENSE("GPL v2");
MODULE_ALIAS("platform:sof_rt5682");
MODULE_ALIAS("platform:tgl_max98357a_rt5682");
MODULE_ALIAS("platform:jsl_rt5682_rt1015");
MODULE_ALIAS("platform:tgl_max98373_rt5682");
MODULE_ALIAS("platform:jsl_rt5682_max98360a");
MODULE_ALIAS("platform:cml_rt1015_rt5682");
MODULE_ALIAS("platform:tgl_rt1011_rt5682");
MODULE_ALIAS("platform:jsl_rt5682_rt1015p");

> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>   sound/soc/intel/boards/sof_da7219_max98373.c | 1 +
>   sound/soc/intel/boards/sof_rt5682.c          | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
> index f3cb077..8d1ad89 100644
> --- a/sound/soc/intel/boards/sof_da7219_max98373.c
> +++ b/sound/soc/intel/boards/sof_da7219_max98373.c
> @@ -440,6 +440,7 @@ static const struct platform_device_id board_ids[] = {
>   	},
>   	{ }
>   };
> +MODULE_DEVICE_TABLE(platform, board_ids);
>   
>   static struct platform_driver audio = {
>   	.probe = audio_probe,
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index 58548ea..cf1d053 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -968,6 +968,7 @@ static const struct platform_device_id board_ids[] = {
>   	},
>   	{ }
>   };
> +MODULE_DEVICE_TABLE(platform, board_ids);
>   
>   static struct platform_driver sof_audio = {
>   	.probe = sof_audio_probe,
> 
