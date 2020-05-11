Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FA01CE46E
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 21:28:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 589391612;
	Mon, 11 May 2020 21:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 589391612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589225303;
	bh=va+Bg/mGfIf3zooDCyJ6Te8A1FGZzAbfl8KpNyZGVIg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OfoXxdhS4uEHTHkhX+skmP5uM7Zjp2F6kEzkpUW84GYEMPZkkW7cF9NxGEg51rHWP
	 VeZHnHAn84hpGEjAs1qHFu4GToVibQEI3fU7W91lhrSsKWu9SQRMNtQw8Z2n54tGtl
	 kA+LfdmyryE/JIcPma8aK6qo5m5vXDLBRNr4WaAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E7EDF80107;
	Mon, 11 May 2020 21:26:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C736CF8022D; Mon, 11 May 2020 21:26:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DF0AF800E3
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 21:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DF0AF800E3
IronPort-SDR: XdMs11kOeprclJZBIGudf+LnBktOV16JhnOoQt6Hk0ugG1XkvoTUHmGebq7UNGCI3I5hMHi5JD
 xQOAQBomCV1w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 12:26:28 -0700
IronPort-SDR: PoBF/37Iog97BEDYRC4KQdmAbFup+2BeAOmci01fw202h/Z6qPZw99zVeip1HGiALKfr//K8JN
 8aN+BJkFPOKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,381,1583222400"; d="scan'208";a="297786521"
Received: from mlamm-mobl1.amr.corp.intel.com (HELO [10.255.230.116])
 ([10.255.230.116])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2020 12:26:28 -0700
Subject: Re: [PATCH] ASoC: topology: log all headers being parsed
To: Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org
References: <20200509082248.2757-1-yang.jie@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <75fb69cc-830f-432a-c724-7449309f2eba@linux.intel.com>
Date: Mon, 11 May 2020 13:38:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200509082248.2757-1-yang.jie@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
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

Kind reminder to always CC: maintainers....

On 5/9/20 3:22 AM, Keyon Jie wrote:
> The check (tplg->pass == le32_to_cpu(hdr->type)) makes no sense as it is
> comparing two different enums, remove the check and log all headers that
> being parsed.

It's true that the TYPE_MIXER should probably not be compared to 
TPLG_PASS_MANIFEST, but one would think that e.g. the TYPE_MIXER is 
handled in the TPLG_PASS_MIXER, no? and likewise that in the 
TPLG_PASS_MANIFEST all TPLG_TYPE_MANIFEST are handled?

Shouldn't you add a switch case to reconcile the two lists instead of 
removing the test altogether?

#define SND_SOC_TPLG_TYPE_MIXER		1
#define SND_SOC_TPLG_TYPE_BYTES		2
#define SND_SOC_TPLG_TYPE_ENUM		3
#define SND_SOC_TPLG_TYPE_DAPM_GRAPH	4
#define SND_SOC_TPLG_TYPE_DAPM_WIDGET	5
#define SND_SOC_TPLG_TYPE_DAI_LINK	6
#define SND_SOC_TPLG_TYPE_PCM		7
#define SND_SOC_TPLG_TYPE_MANIFEST	8
#define SND_SOC_TPLG_TYPE_CODEC_LINK	9
#define SND_SOC_TPLG_TYPE_BACKEND_LINK	10
#define SND_SOC_TPLG_TYPE_PDATA		11
#define SND_SOC_TPLG_TYPE_DAI		12

#define SOC_TPLG_PASS_MANIFEST		0
#define SOC_TPLG_PASS_VENDOR		1
#define SOC_TPLG_PASS_MIXER		2
#define SOC_TPLG_PASS_WIDGET		3
#define SOC_TPLG_PASS_PCM_DAI		4
#define SOC_TPLG_PASS_GRAPH		5
#define SOC_TPLG_PASS_PINS		6
#define SOC_TPLG_PASS_BE_DAI		7
#define SOC_TPLG_PASS_LINK		8


> 
> Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
> ---
>   sound/soc/soc-topology.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 49875978a1ce..58cf5a12af3f 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -2685,11 +2685,10 @@ static int soc_valid_header(struct soc_tplg *tplg,
>   		return -EINVAL;
>   	}
>   
> -	if (tplg->pass == le32_to_cpu(hdr->type))
> -		dev_dbg(tplg->dev,
> -			"ASoC: Got 0x%x bytes of type %d version %d vendor %d at pass %d\n",
> -			hdr->payload_size, hdr->type, hdr->version,
> -			hdr->vendor_type, tplg->pass);
> +	dev_dbg(tplg->dev,
> +		"ASoC: Got 0x%x bytes of type %d version %d vendor %d at pass %d\n",
> +		hdr->payload_size, hdr->type, hdr->version,
> +		hdr->vendor_type, tplg->pass);
>   
>   	return 1;
>   }
> 
