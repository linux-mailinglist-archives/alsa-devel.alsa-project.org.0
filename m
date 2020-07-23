Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A566722AB87
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 11:13:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 812C91616;
	Thu, 23 Jul 2020 11:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 812C91616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595495593;
	bh=EM6UezgZjDjuZ9w6nqBvkunDpJsnb6gqrhonZbOH2Tc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wou4e7O16CzOYGmG3nHRW0KTQoGgllLH5UUw7w+Z6eDRlBcfdnkxnWtkyfNkCgMMr
	 AxU/AQ80vrWWE/GK8cbjaxHEXh1GJoRnUuDPd0RoVH+fCCkNgrPekj4msjOwfBu0II
	 ej9ObbMTePB+xyT7xYwzlsWvy6WeRmCUEDRlUqRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ABFDF8020D;
	Thu, 23 Jul 2020 11:11:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61E93F80212; Thu, 23 Jul 2020 11:11:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07DE2F800CE
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 11:11:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07DE2F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="aw3sj9WY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06N973cf012329; Thu, 23 Jul 2020 04:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=0EejbdwZKCfgcmR+0Fu1/YeaxkeY4oELenMhMDWbhU8=;
 b=aw3sj9WYcVoW23xAgGhvMdiCzsFBWY3EHXuTc1yHjIPdPpESOEUNuysEwnL4xsqKbLGR
 3Jetpw4skeQ8Kjje4C6/Romdwz2cpWTO6bNgQwf77GGNtxmPKwbQzsqdCwKiDqaZWuXp
 iuJ28D83/qimbyRRfcP/rIjBTFcncvQUBDTGU54DwHdb5LJCWr4PnylBAogmm3dICoon
 s+ILP0emp5X/cm4Vh1ipop86MCWeO9RUDcw2Qz1fef37VW2xdt9Xlos6p6mXQ97X85SQ
 3Pi4n6HpmsTfB8pCxZY401tmmmFyCK0JLGikCvjmJxcLEJJTtiDHSkTFVECIep8vVzuV PA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 32bwgnq815-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jul 2020 04:11:20 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 23 Jul
 2020 10:11:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 23 Jul 2020 10:11:18 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 75EEC45;
 Thu, 23 Jul 2020 09:11:18 +0000 (UTC)
Date: Thu, 23 Jul 2020 09:11:18 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ASoC: wm8962: Do not access WM8962_GPIO_BASE
Message-ID: <20200723091118.GA10899@ediswmail.ad.cirrus.com>
References: <20200717135959.19212-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200717135959.19212-1-festevam@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 spamscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230070
Cc: shengjiu.wang@nxp.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com
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

On Fri, Jul 17, 2020 at 10:59:59AM -0300, Fabio Estevam wrote:
> According to the WM8962 datasheet, there is no register at address 0x200.
> 
> WM8962_GPIO_BASE is just a base address for the GPIO registers and not a
> real register, so remove it from wm8962_readable_register().
> 
> Also, Register 515 (WM8962_GPIO_BASE + 3) does not exist, so skip
> its access.
> 
> This fixes the following errors:
> 
> wm8962 0-001a: ASoC: error at soc_component_read_no_lock on wm8962.0-001a: -16
> wm8962 0-001a: ASoC: error at soc_component_read_no_lock on wm8962.0-001a: -16
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---

This doesn't quite smell right admittedly I am not 100% sure for this
chip but usually the Wolfson chips just return zero when you read a
non-existant register rather than NACKing the transaction. But even
if the chip was NACKing the transaction I would probably expect an
EIO rather than EBUSY error.

Are we sure we understand the error we are addressing here?

Thanks,
Charles

> Hi,
> 
> There is still one more soc_component_read_no_lock error left on register 48.
> 
> I can get rid of it with the below change:
> 
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -151,6 +151,7 @@ static const struct reg_default wm8962_reg[] = {
>  	{ 40, 0x0000 },   /* R40    - SPKOUTL volume */
>  	{ 41, 0x0000 },   /* R41    - SPKOUTR volume */
>  
> +	{ 48, 0x0000 },   /* R48    - Additional control(4) */
>  	{ 49, 0x0010 },   /* R49    - Class D Control 1 */
>  	{ 51, 0x0003 },   /* R51    - Class D Control 2 */
>  
> @@ -841,7 +842,6 @@ static bool wm8962_readable_register(struct device *dev, unsigned int reg)
>  	case WM8962_SPKOUTL_VOLUME:
>  	case WM8962_SPKOUTR_VOLUME:
>  	case WM8962_THERMAL_SHUTDOWN_STATUS:
> -	case WM8962_ADDITIONAL_CONTROL_4:
>  	case WM8962_CLASS_D_CONTROL_1:
>  	case WM8962_CLASS_D_CONTROL_2:
>  	case WM8962_CLOCKING_4:
> 
> I haven't submitted it yet because I don't know if this is the correct
> approach.
> 
> Please advise.
> 
> Thanks
> 
>  sound/soc/codecs/wm8962.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> index df8cdc71357d..8159a3866cde 100644
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -956,7 +956,6 @@ static bool wm8962_readable_register(struct device *dev, unsigned int reg)
>  	case WM8962_EQ39:
>  	case WM8962_EQ40:
>  	case WM8962_EQ41:
> -	case WM8962_GPIO_BASE:
>  	case WM8962_GPIO_2:
>  	case WM8962_GPIO_3:
>  	case WM8962_GPIO_5:
> @@ -3437,7 +3436,13 @@ static int wm8962_probe(struct snd_soc_component *component)
>  	/* Save boards having to disable DMIC when not in use */
>  	dmicclk = false;
>  	dmicdat = false;
> -	for (i = 0; i < WM8962_MAX_GPIO; i++) {
> +	for (i = 1; i < WM8962_MAX_GPIO; i++) {
> +		/*
> +		 * Register 515 (WM8962_GPIO_BASE + 3) does not exist,
> +		 * so skip its access
> +		 */
> +		if (i == 3)
> +			continue;
>  		switch (snd_soc_component_read(component, WM8962_GPIO_BASE + i)
>  			& WM8962_GP2_FN_MASK) {
>  		case WM8962_GPIO_FN_DMICCLK:
> -- 
> 2.17.1
> 
