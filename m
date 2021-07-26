Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B05B3D5E56
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 17:48:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 081FA171F;
	Mon, 26 Jul 2021 17:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 081FA171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627314506;
	bh=9T6a7+7pH1LfAmmy8DjEj2+MFaA+P1f5yXJG7hxGanM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RJvnV1WhfGUsKPZgVnTxEatproloMhRPk4Oiu8TiZH/d9ExIjx8lemKyvJaZp2RTL
	 dV5lQ6FsTMNx6g4zi/9mYF8LcDQ/ApsYay3UDBQ8Y+8usPwM5x7cYhRuSpqx1w8ZYr
	 ud8N/oC+9BoAa1kZ/SeEesW7tsvhb5DMBZJfDN84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CA2BF8025E;
	Mon, 26 Jul 2021 17:46:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87F24F8025A; Mon, 26 Jul 2021 17:46:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F4C3F80130
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 17:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F4C3F80130
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="209151259"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="209151259"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 08:46:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="455807917"
Received: from jwconner-mobl1.amr.corp.intel.com (HELO [10.209.169.36])
 ([10.209.169.36])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 08:46:03 -0700
Subject: Re: [PATCH] ASoC: Intel: sof_da7219_mx98360a: fail to initialize
 soundcard
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20210726094525.5748-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c878f42c-5f44-0e54-785b-36988cc2fe22@linux.intel.com>
Date: Mon, 26 Jul 2021 09:08:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726094525.5748-1-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jie Yang <yang.jie@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Paul Olaru <paul.olaru@oss.nxp.com>,
 Zou Wei <zou_wei@huawei.com>, Rander Wang <rander.wang@intel.com>
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



On 7/26/21 4:45 AM, Brent Lu wrote:
> The default codec for speaker amp's DAI Link is max98373 and will be
> overwritten in probe function if the board id is sof_da7219_mx98360a.
> However, the probe function does not do it because the board id is
> changed in earlier commit.
> 
> Fixes: 1cc04d195dc2 ("ASoC: Intel: sof_da7219_max98373: shrink platform_id below 20 characters")
> Signed-off-by: Brent Lu <brent.lu@intel.com>

Nice catch indeed.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/sof_da7219_max98373.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
> index 896251d742fe..b7b3b0bf994a 100644
> --- a/sound/soc/intel/boards/sof_da7219_max98373.c
> +++ b/sound/soc/intel/boards/sof_da7219_max98373.c
> @@ -404,7 +404,7 @@ static int audio_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	/* By default dais[0] is configured for max98373 */
> -	if (!strcmp(pdev->name, "sof_da7219_max98360a")) {
> +	if (!strcmp(pdev->name, "sof_da7219_mx98360a")) {
>  		dais[0] = (struct snd_soc_dai_link) {
>  			.name = "SSP1-Codec",
>  			.id = 0,
> 
