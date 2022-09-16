Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B20015BAF3C
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 16:25:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5346F1AC1;
	Fri, 16 Sep 2022 16:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5346F1AC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663338326;
	bh=quqz7w40+JN9mVdBdAp9nLJxD/EREdSo/n19syqzaqY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l+p5NRjcf+unK5lE+iX2mnz6ZbSqc+qrEXzSQBv18QnoSVH1RbTH6qc/6DvbWDoP9
	 66QR+etc9cgr53bmVLJsTiHUnjjnEezn90mHuiEZJQW1M5ybz8eskXwwLACB3POipV
	 QUJjxoTbQLMLm5y7ACG5ELo0I+inl7Icegc2Q6uk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9025F80528;
	Fri, 16 Sep 2022 16:24:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31465F80528; Fri, 16 Sep 2022 16:24:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3941CF8024C
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 16:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3941CF8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="g3IWklNR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663338240; x=1694874240;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=quqz7w40+JN9mVdBdAp9nLJxD/EREdSo/n19syqzaqY=;
 b=g3IWklNRLb+967kgYMySRlDjZFpml5aLoDIohl5pyE82gQ+PquGHwQwh
 tTziihR+8TAQCS0CTsDzzTQpbYR6tKRq4A0Lo0XaBBHGLTaFTyZupD9It
 ub6qJ5G6a+FkBGlyVTGtVtl4PpivsOyowskVVBkrpJATiCFhD9IQPLG6c
 L63scynCu8PFMzaWlArfGZVT75bqRE2uAll9zF6jy0qLr9lDrkJah+/Un
 QmL/3PYI+XmfA9tXucq5V+skQHKrYkB7q1QWYJ1xKIZei2eKJlSrN4Xf2
 1H43uaPEF5R7rZkTvYidJ3M2g6NvhZN70My1JiawMC1J/G4MNcOwblzqL g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="296589107"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="296589107"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 07:23:56 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="650888893"
Received: from kchan21-mobl1.ger.corp.intel.com (HELO [10.252.61.56])
 ([10.252.61.56])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 07:23:50 -0700
Message-ID: <0cc74fa6-a9f0-ac99-0cba-ca61929feeaf@linux.intel.com>
Date: Fri, 16 Sep 2022 10:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH linux-next] ASoC: Intel: sof_nau8825: use function
 devm_kcalloc() instead of devm_kzalloc()
Content-Language: en-US
To: cgel.zte@gmail.com, broonie@kernel.org
References: <20220916062320.153456-1-ye.xingchen@zte.com.cn>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220916062320.153456-1-ye.xingchen@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 peter.ujfalusi@linux.intel.com, Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, akihiko.odaki@gmail.com,
 ye xingchen <ye.xingchen@zte.com.cn>, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org,
 yong.zhi@intel.com
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



On 9/16/22 08:23, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Use 2-factor multiplication argument form devm_kcalloc() instead
> of devm_kzalloc().
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


> ---
>  sound/soc/intel/boards/sof_nau8825.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
> index 8d7e5ba9e516..5585c217f78d 100644
> --- a/sound/soc/intel/boards/sof_nau8825.c
> +++ b/sound/soc/intel/boards/sof_nau8825.c
> @@ -355,10 +355,10 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>  	struct snd_soc_dai_link *links;
>  	int i, id = 0;
>  
> -	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
> -			     sof_audio_card_nau8825.num_links, GFP_KERNEL);
> -	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component) *
> -			     sof_audio_card_nau8825.num_links, GFP_KERNEL);
> +	links = devm_kcalloc(dev, sof_audio_card_nau8825.num_links,
> +			    sizeof(struct snd_soc_dai_link), GFP_KERNEL);
> +	cpus = devm_kcalloc(dev, sof_audio_card_nau8825.num_links,
> +			    sizeof(struct snd_soc_dai_link_component), GFP_KERNEL);
>  	if (!links || !cpus)
>  		goto devm_err;
>  
> @@ -421,9 +421,10 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>  
>  	/* HDMI */
>  	if (hdmi_num > 0) {
> -		idisp_components = devm_kzalloc(dev,
> -						sizeof(struct snd_soc_dai_link_component) *
> -						hdmi_num, GFP_KERNEL);
> +		idisp_components = devm_kcalloc(dev,
> +						hdmi_num,
> +						sizeof(struct snd_soc_dai_link_component),
> +						GFP_KERNEL);
>  		if (!idisp_components)
>  			goto devm_err;
>  	}
