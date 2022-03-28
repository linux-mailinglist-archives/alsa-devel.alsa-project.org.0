Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B663A4E9B2A
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 17:31:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4098E1825;
	Mon, 28 Mar 2022 17:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4098E1825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648481469;
	bh=ujQCSh8gd9iXs63iL8zY1QPpgpG7qcOOfXmWogNz3mg=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZK6i/jS7Mcj3YgYr4nBN7onvu3jFKB3tTQDR5PzLJF9KZ+82BEPJ8TOBGitWtCIH
	 IG0Cqp4IUynwN6/XYo4T0u79TsSEBp0HD2oHqRqx7GMm67s1uMQtF/I7F34ki8IaZ7
	 ZGkoHLRh9DDgmMCt0hrcN3VBd6RGNMjXZ3EtYVtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EB80F800CB;
	Mon, 28 Mar 2022 17:30:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1563F8024C; Mon, 28 Mar 2022 17:29:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 622EDF800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 17:29:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 622EDF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Zjr/U3Pi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648481392; x=1680017392;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ujQCSh8gd9iXs63iL8zY1QPpgpG7qcOOfXmWogNz3mg=;
 b=Zjr/U3PiFiYPlYT43tQHYBdLXNs7pbgShyDJHnZdT4P9ZxnkEXY7C5ap
 9OLaMkUKkt/SJk9ieq6vCeOeI8ktczwOXh/FiJ7Y78xF38zX3Riv79t+9
 Pj0TFOfNwzxY6mmrN5CPBvfUb89AzKslkgD08g7Cdb9BjCN5dUUiGhlws
 ls71LxeRA+fkfeVA44Q2IdiKYE1U9OfvsTtSvkAFKvJGkVCYLm3+kqab5
 x66VzMP+/qecGv/NRg/K/QxXro4MxunMgUuPHTDPSpRaXF4ryimGpkNEf
 wyfj88vm+fzxwBpMKH10uAkUbchj+WiybUvhGkAEmb0XPElJnQ5cjfiQY Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="256603853"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="256603853"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 08:29:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="563756053"
Received: from gsfreema-mobl1.amr.corp.intel.com ([10.251.131.129])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 08:29:45 -0700
Message-ID: <51c8d2541ccff2689b9164ab9b671b0b2514e65f.camel@linux.intel.com>
Subject: Re: [RFC PATCH v2 4/6] ASoC: soc-pcm: tweak DPCM BE hw_param() call
 order
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com,  robh+dt@kernel.org, krzk+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com,  peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com
Date: Mon, 28 Mar 2022 08:29:45 -0700
In-Reply-To: <1648448050-15237-5-git-send-email-spujar@nvidia.com>
References: <1648448050-15237-1-git-send-email-spujar@nvidia.com>
 <1648448050-15237-5-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

On Mon, 2022-03-28 at 11:44 +0530, Sameer Pujar wrote:
> For DPCM links, the order of hw_param() call depends on the sequence
> of
> BE connection to FE. It is possible that one BE link can provide
> clock
> to another BE link. In such cases consumer BE DAI, to get the rate
> set
> by provider BE DAI, can use the standard clock functions only if
> provider
> has already set the appropriate rate during its hw_param() stage.
> 
> Presently the order is fixed and does not depend on the provider and
> consumer relationships. So the clock rates need to be known ahead of
> hw_param() stage.
> 
> This patch tweaks the hw_param() order by connecting the provider BEs
> late to a FE. With this hw_param() calls for provider BEs happen
> first
> and then followed by consumer BEs. The consumers can use the standard
> clk_get_rate() function to get the rate of the clock they depend on.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  TODO:
>   * The FE link is not considered in this. For Tegra it is fine to
>     call hw_params() for FE at the end. But systems, which want to
> apply
>     this tweak for FE as well, have to extend this tweak to FE.
>   * Also only DPCM is considered here. If normal links require such
>     tweak, it needs to be extended.
> 
>  sound/soc/soc-pcm.c | 60
> ++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 59 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 9a95468..5829514 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1442,6 +1442,29 @@ static int dpcm_prune_paths(struct
> snd_soc_pcm_runtime *fe, int stream,
>  	return prune;
>  }
>  
> +static bool defer_dpcm_be_connect(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_dai *dai;
> +	int i;
> +
> +	if (!(rtd->dai_link->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK))
> +		return false;
Is this check necessary?
> +
> +	if ((rtd->dai_link->dai_fmt &
> SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) ==
> +	    SND_SOC_DAIFMT_CBC_CFC) {
> +
> +		for_each_rtd_cpu_dais(rtd, i, dai) {
> +
> +			if (!snd_soc_dai_is_dummy(dai))
> +				return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +#define MAX_CLK_PROVIDER_BE 10
> +
>  static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int
> stream,
>  	struct snd_soc_dapm_widget_list **list_)
>  {
> @@ -1449,7 +1472,8 @@ static int dpcm_add_paths(struct
> snd_soc_pcm_runtime *fe, int stream,
>  	struct snd_soc_dapm_widget_list *list = *list_;
>  	struct snd_soc_pcm_runtime *be;
>  	struct snd_soc_dapm_widget *widget;
> -	int i, new = 0, err;
> +	struct snd_soc_pcm_runtime *prov[MAX_CLK_PROVIDER_BE];
> +	int i, new = 0, err, count = 0;
>  
>  	/* Create any new FE <--> BE connections */
>  	for_each_dapm_widgets(list, i, widget) {
> @@ -1489,6 +1513,40 @@ static int dpcm_add_paths(struct
> snd_soc_pcm_runtime *fe, int stream,
>  		    (be->dpcm[stream].state !=
> SND_SOC_DPCM_STATE_CLOSE))
>  			continue;
>  
> +		/* Connect clock provider BEs at the end */
> +		if (defer_dpcm_be_connect(be)) {
> +			if (count >= MAX_CLK_PROVIDER_BE) {
What determines MAX_CLK_PROVIDER_BE? why 10? Can you use rtd->num_cpus
instead? 
Thanks,
Ranjani

