Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3B85BAF4C
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 16:26:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56FCE1ABE;
	Fri, 16 Sep 2022 16:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56FCE1ABE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663338385;
	bh=TUTrrnnUNzMDWn7idCm1PdQx1UFNwdQB3+BXN34GGsE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TzqlqvBdHasikIbI8yJDozzCYVV25Zz0T/I7IQVErIDhF7sLWI2EUHwCVZ9TfU86h
	 Ifmk8U/45kbxgbh2+5gtjtk2TzYZnXytI3gMBgVnaL2fR2SxGieTaFC39i3zjeJ5pP
	 X/nTbKRiNAQbHoajhOoJFnB/VW3zmGqmDs+MwPrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E0A1F80559;
	Fri, 16 Sep 2022 16:24:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDEB6F80551; Fri, 16 Sep 2022 16:24:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55AADF80551
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 16:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55AADF80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Rfw6l4tG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663338267; x=1694874267;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TUTrrnnUNzMDWn7idCm1PdQx1UFNwdQB3+BXN34GGsE=;
 b=Rfw6l4tGrz16/rS1r9o5gH3fw2Lgs+Wc/t3w+6WKjmGwdu/T/gebyJ+h
 djV+hTKmtq1zBBQ4EcAMMgj3RFqxsxzVT39Gv0dMs1C/6bQGR6CN7L5YM
 w0sJ4machLtClSUNgm5WFsI2vkc8838KjM+byM6WHZB0qOmNLe8qTn/dh
 +jYdnn50c9UKVz2aA9YRrr2yrA5doengk+NAkZjHit+bU5cTsteP0s/8c
 VQrL0cQ5AS2ueWIjrkuEfEwpNPxpX/WuMI8pH5NcjnTVHLknapa97W6if
 dRKLEs9frso/DnjNfsFCoaz7v7UJ5wwlo+vE7o4SG1wlcWH5cbDnyNNqn g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="296589233"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="296589233"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 07:24:22 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="650889049"
Received: from kchan21-mobl1.ger.corp.intel.com (HELO [10.252.61.56])
 ([10.252.61.56])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 07:24:15 -0700
Message-ID: <60ca20b7-c636-000c-c146-a46e52762691@linux.intel.com>
Date: Fri, 16 Sep 2022 10:25:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH linux-next] ASoC: Intel: sof_ssp_amp: use devm_kcalloc()
 instead of devm_kzalloc()
Content-Language: en-US
To: cgel.zte@gmail.com, broonie@kernel.org
References: <20220916062549.154114-1-ye.xingchen@zte.com.cn>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220916062549.154114-1-ye.xingchen@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 peter.ujfalusi@linux.intel.com, Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 akihiko.odaki@gmail.com, ye xingchen <ye.xingchen@zte.com.cn>,
 alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 brent.lu@intel.com, linux-kernel@vger.kernel.org
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



On 9/16/22 08:25, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Use 2-factor multiplication argument form devm_kcalloc() instead
> of devm_kzalloc().
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/sof_ssp_amp.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
> index 4a762e002ac7..94d25aeb6e7c 100644
> --- a/sound/soc/intel/boards/sof_ssp_amp.c
> +++ b/sound/soc/intel/boards/sof_ssp_amp.c
> @@ -210,10 +210,10 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>  	struct snd_soc_dai_link *links;
>  	int i, id = 0;
>  
> -	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
> -					sof_ssp_amp_card.num_links, GFP_KERNEL);
> -	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component) *
> -					sof_ssp_amp_card.num_links, GFP_KERNEL);
> +	links = devm_kcalloc(dev, sof_ssp_amp_card.num_links,
> +					sizeof(struct snd_soc_dai_link), GFP_KERNEL);
> +	cpus = devm_kcalloc(dev, sof_ssp_amp_card.num_links,
> +					sizeof(struct snd_soc_dai_link_component), GFP_KERNEL);
>  	if (!links || !cpus)
>  		return NULL;
>  
> @@ -306,9 +306,10 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>  	if (sof_ssp_amp_quirk & SOF_HDMI_PLAYBACK_PRESENT) {
>  		/* HDMI */
>  		if (hdmi_num > 0) {
> -			idisp_components = devm_kzalloc(dev,
> -					   sizeof(struct snd_soc_dai_link_component) *
> -					   hdmi_num, GFP_KERNEL);
> +			idisp_components = devm_kcalloc(dev,
> +					   hdmi_num,
> +					   sizeof(struct snd_soc_dai_link_component),
> +					   GFP_KERNEL);
>  			if (!idisp_components)
>  				goto devm_err;
>  		}
