Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2962EE8A3C
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 15:06:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 800B92274;
	Tue, 29 Oct 2019 15:05:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 800B92274
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572358008;
	bh=ugM4LRYhN1vlLqpp3N5lkJPQ/qpvg5/2HvwQqusv4k4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FoFBRWO8Qw5EaCDxypo9P1NdVOwrOAX48LYnXtXEJHBLlEAkvrp6I76Ub7FgHb94z
	 +Be06rwx7VOVkPJrArc18+hQg6GuhH8EPK5FACtlulfQYys3UO8PxwV9dcYi5gGH8j
	 pxVqyDgoasaW58xbmUbi2AFQW3xWVcQEQFB4Fr+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B40DF800E7;
	Tue, 29 Oct 2019 15:05:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDD66F80392; Tue, 29 Oct 2019 15:04:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89593F800E7
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 15:04:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89593F800E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 07:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,244,1569308400"; d="scan'208";a="193614311"
Received: from vtungala-mobl3.amr.corp.intel.com (HELO [10.254.109.225])
 ([10.254.109.225])
 by orsmga008.jf.intel.com with ESMTP; 29 Oct 2019 07:04:34 -0700
To: mac.chiang@intel.com, alsa-devel@alsa-project.org
References: <1572320124-13250-1-git-send-email-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e5be3da4-0c97-3d42-f11e-bc45133370f7@linux.intel.com>
Date: Tue, 29 Oct 2019 09:04:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1572320124-13250-1-git-send-email-mac.chiang@intel.com>
Content-Language: en-US
Cc: sathya.prakash.m.r@intel.com, naveen.m@intel.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: bxt_da7219_max98357a: update
 dai_link platform name
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 10/28/19 10:35 PM, mac.chiang@intel.com wrote:
> From: Mac Chiang <mac.chiang@intel.com>
> 
> redefine soc platform name "0000:00:1f.3" if cml core

we already have code that can update the platform name:

	/* override plaform name, if required */
	mach = (&pdev->dev)->platform_data;
	platform_name = mach->mach_params.platform;

	ret = snd_soc_fixup_dai_links_platform_name(&broxton_audio_card,
						    platform_name);

Are you sure this additional assignment is required?

> 
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> Signed-off-by: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
> ---
>   sound/soc/intel/boards/bxt_da7219_max98357a.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> index ac1dea5..38b7dbe 100644
> --- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
> +++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> @@ -40,6 +40,13 @@ struct bxt_card_private {
>   	struct list_head hdmi_pcm_list;
>   };
>   
> +static struct snd_soc_dai_link_component platform_component[] = {
> +	{
> +		/* name might be overridden during probe */
> +		.name = "0000:00:1f.3"
> +	}
> +};
> +
>   enum {
>   	BXT_DPCM_AUDIO_PB = 0,
>   	BXT_DPCM_AUDIO_CP,
> @@ -708,6 +715,7 @@ static int broxton_audio_probe(struct platform_device *pdev)
>   				broxton_dais[i].name = "SSP0-Codec";
>   				broxton_dais[i].cpus->dai_name = "SSP0 Pin";
>   			}
> +			broxton_dais[i].platforms = platform_component;
>   		}
>   	}
>   
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
