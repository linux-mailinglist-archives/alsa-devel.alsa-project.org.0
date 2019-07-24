Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A3D72B54
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 11:27:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C3261944;
	Wed, 24 Jul 2019 11:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C3261944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563960453;
	bh=kL2u8FetBuH4OVudq2oF+w4tbPJhWYFNv0NbGrT4ljU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sx6aoeFw5QW9pGlATXWIXOdcr0O1Lmn0f1pOvGZrS2D0XkDYu40WcLMv9vAMC0WSj
	 Dmzjey1iHM4y+GndANQ5B18II7B4aunodqu1IQvlwcVS3T8b79vTcexQJRYIH3Mg7A
	 UmCKJz+TdzpS02ogpxf1+oWDbnV7dkI9oa++d7a8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59170F803D5;
	Wed, 24 Jul 2019 11:25:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4BCFF803D1; Wed, 24 Jul 2019 11:25:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 241D6F800E8
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 11:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 241D6F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="RTM+R5K3"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6O9OX2X030545; Wed, 24 Jul 2019 04:25:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=LAaTmOlmc+RK0LesOOJtPBxHLL5q9ufAd5HMr9h0IA0=;
 b=RTM+R5K3wOcedb+RMuesBr/HXL2TZXfU9X27d8Q/A0UHLyARQ4PCkeQng9Dm7QG7Mpm6
 v75RgayyIsdnTsPvJYLJ+VSQFC7tLGrjCwCGPec5cf7xcGIIE3G7rrh/aKcnf9EzEdYW
 jng2pIqjo72GVymsFFcjo+XTYigXyGNs97aZiJ4LU27vKH1o3ZY/X/np9zkGbukdUvUN
 MxY4X9IeUAcr6ZhaQU8gecvEMpl6UY6AugRDk/DdcDlR4kphDGt7HkaI53PtFWsvAXif
 RZXxwQKsMY1tHxqhETLwrLGtxfTxBzXvnHRzccL70ByxMrgq2oS8AOgd9JZ53qReglVP Nw== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2tx61s1514-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 24 Jul 2019 04:25:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 24 Jul
 2019 10:25:38 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 24 Jul 2019 10:25:38 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 40B0945;
 Wed, 24 Jul 2019 10:25:38 +0100 (BST)
Date: Wed, 24 Jul 2019 10:25:38 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190724092538.GV54126@ediswmail.ad.cirrus.com>
References: <8736iwurtc.wl-kuninori.morimoto.gx@renesas.com>
 <87zhl4td7r.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zhl4td7r.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=939
 suspectscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1907240104
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 02/25] ASoC: soc-component: add
 snd_soc_component_get/put()
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

On Wed, Jul 24, 2019 at 10:51:23AM +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> ALSA SoC is calling try_module_get()/module_put() based on
> component->driver->module_get_upon_open.
> To keep simple and readable code, we should create its function.
> This patch adds new snd_soc_component_get/put().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
> index d2f94cf..57270c2 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -279,6 +279,11 @@ void snd_soc_component_init_regmap(struct snd_soc_component *component,
>  void snd_soc_component_exit_regmap(struct snd_soc_component *component);
>  #endif
>  
> +int snd_soc_component_module_get(struct snd_soc_component *component,
> +				 int has_flags);
> +void snd_soc_component_module_put(struct snd_soc_component *component,
> +				  int has_flags);

The name has_flags feels a little vague here, is the intention to
support more flags in the future? Or would something like
require_get_upon_open or something be better?

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
