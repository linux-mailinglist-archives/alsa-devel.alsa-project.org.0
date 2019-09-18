Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7B4B6662
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 16:47:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3F1D167A;
	Wed, 18 Sep 2019 16:46:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3F1D167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568818067;
	bh=fZYwsYcmALk8bCuq749C368AQ0R4CigCO8tkFAhC2gY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=efXJGyD5aC6EYJ2Fe1fFzTmKeHIvAVKHMW+kOQf2bpxqSLGNW/Gqjxlu43y9gWsVQ
	 GOpU7RNiytbQr33JAr/tEbkh/N5rpWY2jio3aKrdjaEuWcqZQiufFMyQlpyXNGpMQW
	 NjJUe8MizfBtjWgNNIGF/tYYKu81bGBRUmKvSGJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B74FF80506;
	Wed, 18 Sep 2019 16:46:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE6FCF80506; Wed, 18 Sep 2019 16:46:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08529F80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 16:45:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08529F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="KNsjjCzj"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8IEhrtO014963; Wed, 18 Sep 2019 09:45:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=/PkaBLjqrZnFFsfMPPGd9OsWu3s/ywG4YE1D4v04UF0=;
 b=KNsjjCzjN0eYGWBtNt8IsihwEEOw+70uSyugZ0kv4joMGKCtiFwEvgTMkhLxd/D7Z6Gt
 IKyQS2IiQJ/ik5Cmr58H+9KB2pABeU5wxjBfk9D3Z72k0MuEj3GbIXnOaRodFAbOlAW4
 rTNNLEBrIFSDUmufaua6aKqlHwAtb/ZZTKG1bkQEWrksB+gqOidoWY2aTmwcnXjw4Z16
 SpmXlDMRH4xYQktdSCWQ+QwSGqF5zJvlMvPCg6KL5mYh9u0u2FcnXTxHUOSl9PkOsSHK
 7h+EKzC22PJ+1sHzE64SMmgtsNFSQOd8Nv5XqtV9o7ancveMqRewd0rrIwGSc4mYKWMf /A== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2v382qs8fs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 18 Sep 2019 09:45:55 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 18 Sep
 2019 15:45:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 18 Sep 2019 15:45:53 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9044B2C3;
 Wed, 18 Sep 2019 14:45:53 +0000 (UTC)
Date: Wed, 18 Sep 2019 14:45:53 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <20190918144553.GJ10204@ediswmail.ad.cirrus.com>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104705eucas1p1c01dc05bff199188677915e2bb8f7472@eucas1p1.samsung.com>
 <20190918104634.15216-8-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-8-s.nawrocki@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 mlxscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909180146
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
 sbkim73@samsung.com, patches@opensource.cirrus.com, broonie@kernel.org,
 lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v1 7/9] ASoC: samsung: arndale: Add support
 for WM1811 CODEC
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

On Wed, Sep 18, 2019 at 12:46:32PM +0200, Sylwester Nawrocki wrote:
> The Arndale boards come with different types of the audio daughter
> board.  In order to support the WM1811 one we add new definition of
> an ASoC card which will be registered when the driver matches on
> "samsung,arndale-wm1811" compatible.  There is no runtime detection of
> the audio daughter board type at the moment, compatible string of the
> audio card needs to be adjusted in DT, e.g. by the bootloader,
> depending on actual audio board (CODEC) used.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> -static const struct of_device_id samsung_arndale_rt5631_of_match[] __maybe_unused = {
> -	{ .compatible = "samsung,arndale-rt5631", },
> -	{ .compatible = "samsung,arndale-alc5631", },
> +static const struct of_device_id arndale_audio_of_match[] __maybe_unused = {

If your removing the of_match_ptr below I think the
__maybe_unused should be removed as well.

Thanks,
Charles

> +	{ .compatible = "samsung,arndale-rt5631",  .data = &arndale_rt5631 },
> +	{ .compatible = "samsung,arndale-alc5631", .data = &arndale_rt5631 },
> +	{ .compatible = "samsung,arndale-wm1811",  .data = &arndale_wm1811 },
>  	{},
>  };
> -MODULE_DEVICE_TABLE(of, samsung_arndale_rt5631_of_match);
> +MODULE_DEVICE_TABLE(of, arndale_of_match);
>  
>  static struct platform_driver arndale_audio_driver = {
>  	.driver = {
> -		.name   = "arndale-audio",
> +		.name = "arndale-audio",
>  		.pm = &snd_soc_pm_ops,
> -		.of_match_table = of_match_ptr(samsung_arndale_rt5631_of_match),
> +		.of_match_table = arndale_audio_of_match,
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
