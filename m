Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3100A64AA1A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 23:19:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A47FB18D5;
	Mon, 12 Dec 2022 23:18:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A47FB18D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670883546;
	bh=CjlWzsKT6Im8j1QL2Trac0h3gq6f+yZ34l4Pxa+7MFQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=G+cD8dwAha/gce5mj8vGUkjYeBq0uH4X7JtSImXTZKw3csQ5otcVBdQCgkl4Lf74y
	 IayVoP+BAv1+PsWvMXKi8qa2ZvijyqeanQ/IXqb6k2NW+D34QuPwNZ//7yGsVupIz6
	 dOuQ4E3mAN9TJ9yPJcbpMokRMEmNefqnRgd0mg4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BB00F80115;
	Mon, 12 Dec 2022 23:18:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 033A9F8042F; Mon, 12 Dec 2022 23:18:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84C47F800F8;
 Mon, 12 Dec 2022 23:18:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84C47F800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZrGXpP7m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670883484; x=1702419484;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CjlWzsKT6Im8j1QL2Trac0h3gq6f+yZ34l4Pxa+7MFQ=;
 b=ZrGXpP7mt/DeWooijF82qdKvpSp4uT6OyioFpDeoYQBs0r1LhRAKuhCv
 C+27LTIzqhDdxKGCht2o8rIXPcFbLvEQYyc11IfdwzTqtitbXhgDJsO6d
 M6NlsTKK1LLMZJoCKCdbJOEu0kAeIkZpabrimde8dRzQxi/Ze87TP5hIt
 4w2B5k9IoybRM2C6wvi+FZVOMTKuHFCDMavPmuM+6SsFKA01JWQu+Ukjn
 QExcoNh+Idtvj8HK9r2G0KFIA9lO5OtIV35YLZL3dXGOZAXty1epPCvk6
 DgVrueQsXJja/hDBBJpTdvOZhl6LACu77d8EK3cMov0QZYIpToZkYWVzb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="301392878"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="301392878"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 14:17:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="648328854"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="648328854"
Received: from mjayakum-mobl2.amr.corp.intel.com (HELO [10.209.135.28])
 ([10.209.135.28])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 14:17:55 -0800
Message-ID: <57c1e07c-a994-043a-6447-07fef46390a8@linux.intel.com>
Date: Mon, 12 Dec 2022 16:17:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 15/15] ASoC: SOF: nocodec: Drop empty platform remove
 function
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
 <20221212205406.3771071-16-u.kleine-koenig@pengutronix.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221212205406.3771071-16-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, kernel@pengutronix.de,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/12/22 14:54, Uwe Kleine-König wrote:
> A remove callback just returning 0 is equivalent to no remove callback
> at all. So drop the useless function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/sof/nocodec.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
> index 3537805070ad..b13bfdeb2b70 100644
> --- a/sound/soc/sof/nocodec.c
> +++ b/sound/soc/sof/nocodec.c
> @@ -103,14 +103,8 @@ static int sof_nocodec_probe(struct platform_device *pdev)
>  	return devm_snd_soc_register_card(&pdev->dev, card);
>  }
>  
> -static int sof_nocodec_remove(struct platform_device *pdev)
> -{
> -	return 0;
> -}
> -
>  static struct platform_driver sof_nocodec_audio = {
>  	.probe = sof_nocodec_probe,
> -	.remove = sof_nocodec_remove,
>  	.driver = {
>  		.name = "sof-nocodec",
>  		.pm = &snd_soc_pm_ops,
