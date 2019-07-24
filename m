Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE0D72B3A
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 11:15:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 645F11937;
	Wed, 24 Jul 2019 11:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 645F11937
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563959739;
	bh=rYGZRGP+aUIgf/BPYCcxTk2mt4r8PNLW633s99LU0Bg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X1aRPV06ZOzBt5VlnelZbzGaBiYE7bj2re04GCcN/iN1cGCwZEsX3dz2doEYBIp9D
	 LfQV/ugviyBvlOJ6Xs1W5Mr2gE9Xe7EU39nrSREEq0pHCNXwHa/f2EiFfmDZD+EbLs
	 KSRiuQxaHlLV8kJhox8SDM8Blq0XJ28hf7gdR6OU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47020F803D5;
	Wed, 24 Jul 2019 11:13:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4ECDF803D1; Wed, 24 Jul 2019 11:13:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C7D4F800E8
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 11:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C7D4F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MXnxjkk2"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6O99k5b028863; Wed, 24 Jul 2019 04:13:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=vDeLB29tP9y01JAcOBbrKQTTMt0JF7ixN4HsRVUb3Qs=;
 b=MXnxjkk2FRRbSRtQ1MyT8gSGKE/qnA7nm8w26cWmJQ4tAgY+veug1w4BzlLK2LlGQjUM
 ZgAHMVdwKDjW/y9JCPbL854UyIkviI9TgF1Y58HUo0xxtmq0etODk7b4CuikH96kmAW/
 pWHBKuoEDxwf0TlILethp+xjhdji2uaxlxm40S+xmdeOBXM8h2oiYE9/aP0XufRPeIiZ
 tZzzRAbs5SHYTwz160zBXXGZax43BqHKKokYucOewKa0Am04UFaDnwPhgT6ebE7kvF8S
 e0XAZjpcAEN9Mk9YSG6YgvnFRgH794Z2G6XwnRYkbu8LW8mJJlwPKPrulggGw3BuJNVc eA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2tx61nh21d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 24 Jul 2019 04:13:46 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 24 Jul
 2019 10:13:44 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 24 Jul 2019 10:13:44 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D0B3A45;
 Wed, 24 Jul 2019 10:13:44 +0100 (BST)
Date: Wed, 24 Jul 2019 10:13:44 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190724091344.GT54126@ediswmail.ad.cirrus.com>
References: <8736iwurtc.wl-kuninori.morimoto.gx@renesas.com>
 <87pnm0td6q.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pnm0td6q.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 mlxscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=771 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1906280000
 definitions=main-1907240103
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 09/25] ASoC: soc-component: add
 snd_soc_component_pointer()
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

On Wed, Jul 24, 2019 at 10:52:00AM +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current ALSA SoC is directly using component->driver->ops->xxx,
> thus, it is deep nested, and makes code difficult to read,
> and is not good for encapsulation.
> This patch adds new snd_soc_component_pointer() and use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> +int snd_soc_component_pointer(struct snd_soc_component *component,
> +			      struct snd_pcm_substream *substream)
> +{
> +	if (component->driver->ops &&
> +	    component->driver->ops->pointer)
> +		return component->driver->ops->pointer(substream);
> +
> +	return 0;
> +}
>
> @@ -1115,13 +1115,10 @@ static snd_pcm_uframes_t soc_pcm_pointer(struct snd_pcm_substream *substream)
>  	for_each_rtdcom(rtd, rtdcom) {
>  		component = rtdcom->component;
>  
> -		if (!component->driver->ops ||
> -		    !component->driver->ops->pointer)
> -			continue;
> -
> +		offset = snd_soc_component_pointer(component, substream);
>  		/* FIXME: use 1st pointer */
> -		offset = component->driver->ops->pointer(substream);
> -		break;
> +		if (offset > 0)
> +			break;

This doesn't feel like it is equivalent to the previous code, is
zero not a valid value for pointer to return?

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
