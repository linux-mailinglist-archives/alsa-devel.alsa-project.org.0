Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CEE1E2210
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 14:40:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CF5E1750;
	Tue, 26 May 2020 14:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CF5E1750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590496829;
	bh=2n9O10q9FlnjLKFE1laBR1TEFD4AAu1pdg0fdLeHpkE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZsFxGLFJeoSQR40GFOUVMp4lq8O6QISH6XwFSybgQDKUaFimeNJRcSiDaeqdcfTXm
	 oGua1XlYXxLbuH0WDlrYsH06iYJz2/x+Zjsr0HrjwqO+7BvcfYJx9Mw7RQc2Jm8T0i
	 DBXZfF7FmAA58/dRM24Fr3GkrOHIrJWYiwiSJk7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 734F3F8015C;
	Tue, 26 May 2020 14:38:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7600CF80150; Tue, 26 May 2020 14:38:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45351F80146
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 14:38:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45351F80146
IronPort-SDR: nOgNwSL8LSVQXyW/Vvo9GYS4J/9kju8RXcrg/Uky0DwsqkLooqsuqyWezYgWfhRjQGyJii1PiL
 IGoWHPqtSJ5g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 05:38:35 -0700
IronPort-SDR: yPL+3QZbIxGUnzhrP62xMu+eVww930PWCQxjOvv96tfgrkBzZ1wmxadwnwWnHQQ/bgqtLXbwWt
 WnNQITL++l5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; d="scan'208";a="468280364"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.10.59])
 ([10.213.10.59])
 by fmsmga005.fm.intel.com with ESMTP; 26 May 2020 05:38:33 -0700
Subject: Re: [PATCH v2 1/2] ASoC: topology: refine and log the header in the
 correct pass
To: Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org
References: <20200521074847.71406-1-yang.jie@linux.intel.com>
 <20200521074847.71406-2-yang.jie@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <4c05fcc4-2f94-1ca0-2148-af70ef739d00@intel.com>
Date: Tue, 26 May 2020 14:38:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521074847.71406-2-yang.jie@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

On 2020-05-21 9:48 AM, Keyon Jie wrote:
> The check (tplg->pass == le32_to_cpu(hdr->type)) makes no sense as it is
> comparing two different enums, refine the element loading functions, and
> log the information when the header is being parsed in the corresponding
> parsing pass.
> 
> Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
> ---
>   sound/soc/soc-topology.c | 53 +++++++++++++++++++++++++++++++---------
>   1 file changed, 42 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 49875978a1ce..70c0ff7ce13f 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -2636,6 +2636,17 @@ static int soc_tplg_manifest_load(struct soc_tplg *tplg,
>   	return ret;
>   }
>   
> +static int (*elem_load[])(struct soc_tplg *, struct snd_soc_tplg_hdr *) = {
> +	[SOC_TPLG_PASS_MANIFEST]	= soc_tplg_manifest_load,
> +	[SOC_TPLG_PASS_VENDOR]		= soc_tplg_vendor_load,
> +	[SOC_TPLG_PASS_MIXER]		= soc_tplg_kcontrol_elems_load,
> +	[SOC_TPLG_PASS_WIDGET]		= soc_tplg_dapm_widget_elems_load,
> +	[SOC_TPLG_PASS_PCM_DAI]		= soc_tplg_pcm_elems_load,
> +	[SOC_TPLG_PASS_GRAPH]		= soc_tplg_dapm_graph_elems_load,
> +	[SOC_TPLG_PASS_BE_DAI]		= soc_tplg_dai_elems_load,
> +	[SOC_TPLG_PASS_LINK]		= soc_tplg_link_elems_load,
> +};
> +

Do we really need private array for this? There is a separate 
soc_tplg_load_header function already. By separate, I mean an isolate 
scope for single task only - validating tplg headers. While I agree with 
the idea behind second patch of the series - removal of individual 
checks in favor of generic one - I believe said checks could be 
"inlined". See below.

>   /* validate header magic, size and type */
>   static int soc_valid_header(struct soc_tplg *tplg,
>   	struct snd_soc_tplg_hdr *hdr)
> @@ -2685,19 +2696,31 @@ static int soc_valid_header(struct soc_tplg *tplg,
>   		return -EINVAL;
>   	}
>   
> -	if (tplg->pass == le32_to_cpu(hdr->type))
> +	return 1;
> +}
> +
> +/* check and load the element for the current pass */
> +static int soc_pass_load(struct soc_tplg *tplg,
> +			 struct snd_soc_tplg_hdr *hdr,
> +			 unsigned int hdr_pass)
> +{
> +	if (tplg->pass == hdr_pass) {
>   		dev_dbg(tplg->dev,
>   			"ASoC: Got 0x%x bytes of type %d version %d vendor %d at pass %d\n",
>   			hdr->payload_size, hdr->type, hdr->version,
>   			hdr->vendor_type, tplg->pass);
> +		return elem_load[hdr_pass](tplg, hdr);
> +	}
>   
> -	return 1;
> +	return 0;
>   }

Remove the function and merge its body into soc_tplg_load_header.

>   
>   /* check header type and call appropriate handler */
>   static int soc_tplg_load_header(struct soc_tplg *tplg,
>   	struct snd_soc_tplg_hdr *hdr)
>   {
> +	unsigned int hdr_pass;
> +
>   	tplg->pos = tplg->hdr_pos + sizeof(struct snd_soc_tplg_hdr);
>   
>   	/* check for matching ID */
> @@ -2711,27 +2734,35 @@ static int soc_tplg_load_header(struct soc_tplg *tplg,
>   	case SND_SOC_TPLG_TYPE_MIXER:
>   	case SND_SOC_TPLG_TYPE_ENUM:
>   	case SND_SOC_TPLG_TYPE_BYTES:
> -		return soc_tplg_kcontrol_elems_load(tplg, hdr);
> +		hdr_pass = SOC_TPLG_PASS_MIXER;
> +		break;
>   	case SND_SOC_TPLG_TYPE_DAPM_GRAPH:
> -		return soc_tplg_dapm_graph_elems_load(tplg, hdr);
> +		hdr_pass = SOC_TPLG_PASS_GRAPH;
> +		break;
>   	case SND_SOC_TPLG_TYPE_DAPM_WIDGET:
> -		return soc_tplg_dapm_widget_elems_load(tplg, hdr);
> +		hdr_pass = SOC_TPLG_PASS_WIDGET;
> +		break;
>   	case SND_SOC_TPLG_TYPE_PCM:
> -		return soc_tplg_pcm_elems_load(tplg, hdr);
> +		hdr_pass = SOC_TPLG_PASS_PCM_DAI;
> +		break;
>   	case SND_SOC_TPLG_TYPE_DAI:
> -		return soc_tplg_dai_elems_load(tplg, hdr);
> +		hdr_pass = SOC_TPLG_PASS_BE_DAI;
> +		break;
>   	case SND_SOC_TPLG_TYPE_DAI_LINK:
>   	case SND_SOC_TPLG_TYPE_BACKEND_LINK:
>   		/* physical link configurations */
> -		return soc_tplg_link_elems_load(tplg, hdr);
> +		hdr_pass = SOC_TPLG_PASS_LINK;
> +		break;
>   	case SND_SOC_TPLG_TYPE_MANIFEST:
> -		return soc_tplg_manifest_load(tplg, hdr);
> +		hdr_pass = SOC_TPLG_PASS_MANIFEST;
> +		break;
>   	default:
>   		/* bespoke vendor data object */
> -		return soc_tplg_vendor_load(tplg, hdr);
> +		hdr_pass = SOC_TPLG_PASS_VENDOR;
> +		break;
>   	}
>   
> -	return 0;
> +	return soc_pass_load(tplg, hdr, hdr_pass);

By having "log" code here we have one place for hdr validation, rather 
than two (the second being just an "if" to be fair..) and private array 
is no longer necessary. Local func ptr variable would take care of 
storing adequate function to call.

>   }
>   
>   /* process the topology file headers */
> 
