Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B416E580FC9
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 11:22:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0828E839;
	Tue, 26 Jul 2022 11:21:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0828E839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658827335;
	bh=qpI/jYh8wmGecYAt6qT8gmbiPkJFDRtgWzXV59vxohg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=id26q8tJfR8J2Av4XWSyZOMS1KaIOFnzS9gWhMywOp+YBC2vPJgUvgiwFnAIQl93p
	 8UCBg2Tp58BzBYI/qgs3CCuof7OT6TMf2244fbaCXNK1RXaCw2dHBT/fDHrVxDWqTD
	 WFdxSedECM1x7qqPqwuAkib66UhuGSJMw030CeM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69A37F80271;
	Tue, 26 Jul 2022 11:21:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE1ABF8025A; Tue, 26 Jul 2022 11:21:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89620F80153
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 11:21:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89620F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="DvKXLvHY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q5xlKR018505;
 Tue, 26 Jul 2022 04:21:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=qL9VQHI6gHzerfDG4MXQcGSbkPxboMLFC/IpYFesMYs=;
 b=DvKXLvHYwJVrQWdSRifJIE9+BxaquQTUgjWEGM4ehWgRIiCW3UjbgI11WN4KxmiiAb3J
 uPaM6tipShonTeEz/Juh+He0WVVPq7mbllDzKqV+XNE4ZzdL9sH9u+/CUE+E69yxHEYn
 lR9LtiuQNIsbq64xnCr2iZzLV2tNhG0dXp2emXXR9sjcTGox8WgGTVldY/ZMgAMBYlhG
 0fF7Y/sGEE9Np13hyKwfqR6IDjTcEnShHkxzYcBTDIf3hz9XOH16YHhRgI9TkaICUoT4
 CZ68TKcg50huLZEAhvRjQ9UsYn+k7XdysYVkz/oQILy9qisdRZNYwVrtdbt5FXN37PB+ Aw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hgddp37sa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 04:21:00 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Tue, 26 Jul
 2022 04:20:58 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Tue, 26 Jul 2022 04:20:58 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B3D78B06;
 Tue, 26 Jul 2022 09:20:58 +0000 (UTC)
Date: Tue, 26 Jul 2022 09:20:58 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zhu Ning <zhuning0077@gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: codecs: add support for ES8326
Message-ID: <20220726092058.GG92394@ediswmail.ad.cirrus.com>
References: <20220726082505.125267-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220726082505.125267-1-zhuning0077@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: H_y6NjnjQwwRj69qykbYqBPLToxbXjja
X-Proofpoint-ORIG-GUID: H_y6NjnjQwwRj69qykbYqBPLToxbXjja
X-Proofpoint-Spam-Reason: safe
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, broonie@kernel.org,
 Zhu Ning <zhuning@everest-semi.com>, David Yang <yangxiaohua@everest-semi.com>
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

On Tue, Jul 26, 2022 at 04:25:05PM +0800, Zhu Ning wrote:
> The ES8326 codec is not compatible with ES8316 and requires a dedicated driver.
> 
> Signed-off-by: David Yang <yangxiaohua@everest-semi.com>
> Signed-off-by: Zhu Ning <zhuning@everest-semi.com>
> -----
> +static const struct snd_soc_component_driver soc_component_dev_es8326 = {
> +	.probe		= es8326_probe,
> +	.remove		= es8326_remove,
> +	.resume		= es8326_resume,
> +	.suspend	= es8326_suspend,
> +	.set_bias_level = es8326_set_bias_level,
> +	.set_jack	= es8326_set_jack,
> +	.dapm_widgets	= es8326_dapm_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(es8326_dapm_widgets),
> +	.dapm_routes		= es8326_dapm_routes,
> +	.num_dapm_routes	= ARRAY_SIZE(es8326_dapm_routes),
> +	.controls		= es8326_snd_controls,
> +	.num_controls		= ARRAY_SIZE(es8326_snd_controls),
> +	.use_pmdown_time	= 1,
> +	.endianness		= 1,
> +	.non_legacy_dai_naming	= 1,

The non_legacy_dai_naming flag has been removed, you will get
this behaviour by default now.

Thanks,
Charles
