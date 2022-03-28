Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E2E4E9AC5
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 17:13:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CE2317F4;
	Mon, 28 Mar 2022 17:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CE2317F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648480394;
	bh=0Xfm6ZmBe6qP65GEW9BCvq91UKkCOHo/5Qe8dITTyQs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aTw9eJTCVLsupcp3cU9cKj3BnLPUWMgYDl9Ns2vpZPCVx5k18vCVcqHieakdHlFdu
	 CWXDOfMUaRp4SY/M6FArKXDR/sVTctZ8uPzkdjCZsN0/730RyE/CecrfFb6TdkNB4/
	 IbeCdNZvo1OTRW86YuTCB1Ys9AoSmoIsCQ+C/oPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE574F800FA;
	Mon, 28 Mar 2022 17:12:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CD08F8024C; Mon, 28 Mar 2022 17:12:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FA56F800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 17:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FA56F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="D5CYoOsZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648480320; x=1680016320;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0Xfm6ZmBe6qP65GEW9BCvq91UKkCOHo/5Qe8dITTyQs=;
 b=D5CYoOsZ0D7xOlB7r6aEyhHtd+Dv/aNXGPGTEfFf1DBPQ44thg6WUXU2
 mg/m8f4HeEMQjY2fVlpW9uyaVNFhQJanhTK/wv37hpAnvAQJc81oSyIeM
 IbAN+maLvSCwAHrFgWvBY8lcvxz/tOzSvqggl+L6avJaRDEqd+dZXd1lC
 2aPKtYGPavuLr92GPWNJTIU3yhta80ZHJo5NCe3bhAL7U3hOTQrZV7oJN
 o4H3mN7jHD9RXyxw8+3zFBOhbGJQZQJzsSWz8xit01GB0RiM/t3fbOsal
 f8jcOHfw0Js06EaS/eB8LCe9C5JIPvGgAkGMcGwvaTFDIWXD36tQWBK7C w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="283911771"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="283911771"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 08:11:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="719145825"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.166])
 ([10.99.249.166])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 08:11:50 -0700
Message-ID: <6ae534e4-25f8-5825-a2ec-cb1c512dac57@linux.intel.com>
Date: Mon, 28 Mar 2022 17:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v2 4/6] ASoC: soc-pcm: tweak DPCM BE hw_param() call
 order
Content-Language: en-US
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, krzk+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com
References: <1648448050-15237-1-git-send-email-spujar@nvidia.com>
 <1648448050-15237-5-git-send-email-spujar@nvidia.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <1648448050-15237-5-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 3/28/2022 8:14 AM, Sameer Pujar wrote:
> For DPCM links, the order of hw_param() call depends on the sequence of
> BE connection to FE. It is possible that one BE link can provide clock
> to another BE link. In such cases consumer BE DAI, to get the rate set
> by provider BE DAI, can use the standard clock functions only if provider
> has already set the appropriate rate during its hw_param() stage.

Above sentence seems to suggest that consumer can set clock only after 
provider has started, but code in this patch seems to do it the other 
way around?

> 
> Presently the order is fixed and does not depend on the provider and
> consumer relationships. So the clock rates need to be known ahead of
> hw_param() stage.
> 
> This patch tweaks the hw_param() order by connecting the provider BEs
> late to a FE. With this hw_param() calls for provider BEs happen first
> and then followed by consumer BEs. The consumers can use the standard
> clk_get_rate() function to get the rate of the clock they depend on.
> 

I'm bit confused by " With this hw_param() calls for provider BEs happen 
first and then followed by consumer BEs. "

Aren't consumers started first and provider second? Code and previous 
sentence "connecting the provider BEs late to a FE" confuse me.

Overall I don't exactly understand correct order of events after reading 
commit message and patch...

> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>   TODO:
>    * The FE link is not considered in this. For Tegra it is fine to
>      call hw_params() for FE at the end. But systems, which want to apply
>      this tweak for FE as well, have to extend this tweak to FE.
>    * Also only DPCM is considered here. If normal links require such
>      tweak, it needs to be extended.
> 
>   sound/soc/soc-pcm.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 59 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 9a95468..5829514 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1442,6 +1442,29 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
>   	return prune;
>   }
>   
> +static bool defer_dpcm_be_connect(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_dai *dai;
> +	int i;
> +
> +	if (!(rtd->dai_link->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK))
> +		return false;
> +
> +	if ((rtd->dai_link->dai_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) ==
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

Not sure about this define, it adds unnecessary limitation on max clock 
number, can't you just run same loop twice while checking 
defer_dpcm_be_connect() first time and !defer_dpcm_be_connect() second 
time? defer_dpcm_be_connect() function name may need a bit of adjustment 
(rtd_is_clock_consumer() maybe?), but it gets rid of the limit.

or do something like following instead of copy pasting loop twice:

rename original dpcm_add_paths() to _dpcm_add_paths() and add additional 
argument and check somewhere inline:
static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
	struct snd_soc_dapm_widget_list **list_, bool clock_consumer)
{
	...

  // with renamed defer_dpcm_be_connect
	if (clock_consumer ^ !rtd_is_clock_consumer())
		continue;

	...
}

static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
    	struct snd_soc_dapm_widget_list **list_)
{
	int ret;

	/* start clock consumer BEs */
	ret = _dpcm_add_paths(*fe, stream, **list_, true);
	if (ret)
		return ret;

	/* start clock provider BEs */
	ret = _dpcm_add_paths(*fe, stream, **list_, false);

	return ret;
}

> +
>   static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
>   	struct snd_soc_dapm_widget_list **list_)
>   {
> @@ -1449,7 +1472,8 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
>   	struct snd_soc_dapm_widget_list *list = *list_;
>   	struct snd_soc_pcm_runtime *be;
>   	struct snd_soc_dapm_widget *widget;
> -	int i, new = 0, err;
> +	struct snd_soc_pcm_runtime *prov[MAX_CLK_PROVIDER_BE];
> +	int i, new = 0, err, count = 0;
>   
>   	/* Create any new FE <--> BE connections */
>   	for_each_dapm_widgets(list, i, widget) {
> @@ -1489,6 +1513,40 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
>   		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_CLOSE))
>   			continue;
>   
> +		/* Connect clock provider BEs at the end */
> +		if (defer_dpcm_be_connect(be)) {
> +			if (count >= MAX_CLK_PROVIDER_BE) {
> +				dev_err(fe->dev, "ASoC: too many clock provider BEs\n");
> +				return -EINVAL;
> +			}
> +
> +			prov[count++] = be;
> +			continue;
> +		}
> +
> +		/* newly connected FE and BE */
> +		err = dpcm_be_connect(fe, be, stream);
> +		if (err < 0) {
> +			dev_err(fe->dev, "ASoC: can't connect %s\n",
> +				widget->name);
> +			break;
> +		} else if (err == 0) /* already connected */
> +			continue;
> +
> +		/* new */
> +		dpcm_set_be_update_state(be, stream, SND_SOC_DPCM_UPDATE_BE);
> +		new++;
> +	}
> +
> +	/*
> +	 * Now connect clock provider BEs. A late connection means,
> +	 * these BE links appear first in the list maintained by FE
> +	 * and hw_param() call for these happen first.

Let's stick to ALSA terminology, hw_params() please, same in commit message.

> +	 */
> +	for (i = 0; i < count; i++) {
> +
> +		be = prov[i];
> +
>   		/* newly connected FE and BE */
>   		err = dpcm_be_connect(fe, be, stream);
>   		if (err < 0) {

