Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 626DE2463B2
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 11:48:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B6AA16CD;
	Mon, 17 Aug 2020 11:47:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B6AA16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597657686;
	bh=4iGOCdGkz+Aj/3IIXUNMtb4rkQZEqs2lrAx7C0+36sc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bETK+gi/hJwLtmI55fXctQhmeONOP2dSaGAQeB4APQGrGJw90/11HCj9bZDA5IfrQ
	 A3e3IgQrna8eLNczZJqHNpGhli7F09szOv1SNHF65WZmNr8c61w9vDqFKIC+MgUMmz
	 m9miT5TN3qFMjaFAgNwlNF6+wzTl+ChdpE4qf5LU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61F23F80218;
	Mon, 17 Aug 2020 11:46:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 461C2F80257; Mon, 17 Aug 2020 11:45:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2DE3F80216
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 11:45:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2DE3F80216
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MKVa+/kK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07H9awI3017011; Mon, 17 Aug 2020 04:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=CiZvvrflbbiQInTc4jaOIayzjKvg5AkGtoN55UZtxYI=;
 b=MKVa+/kK/IGCJlPT3qrrndOw6Xj5AItUSxs9oCLosQNZ6NVc++RZYdqlihCC8JFv4TXf
 IgB9I4MNTZN8A22gHVdzNCmKGE6VHL6LZWmiVDVXKsvEMKA5IdLl5w0KKJoY9px1hRas
 nKEuv/z27a7y2JtUPeW0kZlFljZMM1EL7hUouyyeDU4N1iAkHgVzZKIQkcOZ7TF+jMcD
 X083Ul8ACXjGPq3D7YavR4wWQTgHTLBRTa3pnaoAPUwurWTGKbnpMxQwwSKg7dFd3xI8
 BnaRu0yrHkA+nepKsjS/h7xFwVUuPeWlbMH8JhzSur3B0gkYDVK9sQ6tNNkRneLtnblv Jw== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 32xc4pj8sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 17 Aug 2020 04:45:42 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 17 Aug
 2020 10:45:41 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Mon, 17 Aug 2020 10:45:41 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4B48F2C6;
 Mon, 17 Aug 2020 09:45:41 +0000 (UTC)
Date: Mon, 17 Aug 2020 09:45:41 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ASoC: wm8994: Prevent access to invalid VU register bits
 on WM1811
Message-ID: <20200817094541.GG10899@ediswmail.ad.cirrus.com>
References: <CGME20200804141056eucas1p176f970fa509a9caa677837118c7ed50c@eucas1p1.samsung.com>
 <20200804141043.11425-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200804141043.11425-1-s.nawrocki@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 mlxlogscore=742
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008170072
Cc: simon@lineageos.org, alsa-devel@alsa-project.org, b.zolnierkie@samsung.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, broonie@kernel.org,
 m.szyprowski@samsung.com
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

On Tue, Aug 04, 2020 at 04:10:43PM +0200, Sylwester Nawrocki wrote:
> The ADC2 and DAC2 are not available on WM1811 device. This patch moves
> the ADC2, DAC2 VU bitfields to a separate array so we can skip accessing
> them and avoid unreadable register access on WM1811.
> 
> This allows to get rid of warnings during boot like:
> wm8994-codec: ASoC: error at soc_component_read_no_lock on wm8994-codec: -5
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> +static void wm8994_update_vu_bits(struct snd_soc_component *component)
> +{
> +	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
> +	struct wm8994 *control = wm8994->wm8994;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(wm8994_vu_bits); i++)
> +		snd_soc_component_write(component, wm8994_vu_bits[i].reg,
> +					snd_soc_component_read(component,
> +						       wm8994_vu_bits[i].reg));

Is there a reason to not be using snd_soc_component_update_bits
here?

I think otherwise this looks ok.

Thanks,
Charles
