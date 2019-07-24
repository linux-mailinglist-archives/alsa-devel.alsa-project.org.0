Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D3372B4E
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 11:25:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D460A1932;
	Wed, 24 Jul 2019 11:24:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D460A1932
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563960314;
	bh=2mTdQpMinbmYRnNnQL7L4Z8SvwPob6WUqF1tzmaihDE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O8WdfSmM1+2zCS4iwgD/Zpfky/EUyKRTNeurJHqJFPjHkXtadi+dGKV2s4VavS+L9
	 cuX/s+5FWurVhBIRTTH/xRHqI6TfEXkJZRnd2bnFkywiEHBogcAzyugn9Ql5GJZ1uS
	 TGX8w37l1It5FLO+IpeAyAdHCd8iQjrb9xBn+ZMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7755F803D6;
	Wed, 24 Jul 2019 11:23:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 507E1F803D1; Wed, 24 Jul 2019 11:23:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79741F800E8
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 11:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79741F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="m4dFrkIn"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6O99CO0028288; Wed, 24 Jul 2019 04:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=TuX5UtoY0eSlxJE7RRbfgksD/ZBmiNHaC8Z6Hna9b0k=;
 b=m4dFrkInihmY7QYcR6ST0qwAdCa7vig97qp15+/Omx8ZGBPjAgI8YNna7YotzMPVFtcu
 cmNiPR24tSEoeZykeUE+aRPIkOaT7qMPh1cSncIWGXs37m+700uQgJE8R9Z/xHzv9lXy
 dvkC9KwABDkk2+7WjXERKhayyFs6NiA9oBqhekhAqi4lR/IIh0yhMouHQZvMWfxArFEd
 DNeXV7MawSONX7jg0I0h5zIfr24AxFSiBm7FxlaoOroimNLIi96rrflMlk5Ma3PCwZoq
 xCIIiUddEiQjehAEgz48fpoYtd/hmGwq8CnDSLRMEcm1fXGQkAiWZywbh/GK0FQv8lil nQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2tx61nh2cs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 24 Jul 2019 04:23:23 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 24 Jul
 2019 10:23:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 24 Jul 2019 10:23:22 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4DF6E45;
 Wed, 24 Jul 2019 10:23:22 +0100 (BST)
Date: Wed, 24 Jul 2019 10:23:22 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190724092322.GU54126@ediswmail.ad.cirrus.com>
References: <8736iwurtc.wl-kuninori.morimoto.gx@renesas.com>
 <87o91ktd6m.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o91ktd6m.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 mlxscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=2
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1906280000
 definitions=main-1907240103
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 10/25] ASoC: soc-component: add
 snd_soc_component_ioctrl()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jul 24, 2019 at 10:52:05AM +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current ALSA SoC is directly using component->driver->ops->xxx,
> thus, it is deep nested, and makes code difficult to read,
> and is not good for encapsulation.
> This patch adds new snd_soc_component_ioctrl() and use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 7ab68de..064d16c 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1116,6 +1116,7 @@ static snd_pcm_uframes_t soc_pcm_pointer(struct snd_pcm_substream *substream)
>  		component = rtdcom->component;
>  
>  		offset = snd_soc_component_pointer(component, substream);
> +

This whitespace change belongs in the previous patch.

>  		/* FIXME: use 1st pointer */
>  		if (offset > 0)
>  			break;
> @@ -2455,16 +2456,15 @@ static int soc_pcm_ioctl(struct snd_pcm_substream *substream,
>  	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>  	struct snd_soc_component *component;
>  	struct snd_soc_rtdcom_list *rtdcom;
> +	int ret;
>  
>  	for_each_rtdcom(rtd, rtdcom) {
>  		component = rtdcom->component;
>  
> -		if (!component->driver->ops ||
> -		    !component->driver->ops->ioctl)
> -			continue;
> -
> +		ret = snd_soc_component_ioctl(component, substream, cmd, arg);
>  		/* FIXME: use 1st ioctl */
> -		return component->driver->ops->ioctl(substream, cmd, arg);
> +		if (ret != -ENOTSUPP)
> +			return ret;

This feels a little forced, and also changes behaviour if any
ioctl callbacks already report -ENOTSUPP.

I wonder if for some/all of these functions it might be worth
abstracting them at a higher level so the whole for_each_rtdcom
loop moves into the helper function similar to what I did with
compress stuff, for example in these patches:

1e57b82891ad ("ASoC: compress: Add helper functions for component open/free")
4ef0ecb80e34 ("ASoC: compress: Add helper functions for component trigger/set_params")

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
