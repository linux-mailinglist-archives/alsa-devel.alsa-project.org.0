Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CCF22ABB3
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 11:23:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1473B1669;
	Thu, 23 Jul 2020 11:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1473B1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595496219;
	bh=2MR3yZuQzmWzpftIEepdwxtj1I6qwkc8G0e2p7L4RLM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NIxJMy7kG3vwzKwkf7In1V4A/EkQVV8bCho5BwB96145ziIxXmHEtmmXgs7rxm/ZT
	 Pljmnp07u0e7XD2dA7wSHeJ8wPhvvPli9/eDDl2bSjGgd6lh07ADjYku/0FKBX57H7
	 GouYDOLF1sFZ00wmz9jnnyIBK9c60JfVOnlznCwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BC52F800CE;
	Thu, 23 Jul 2020 11:21:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 039BFF8011F; Thu, 23 Jul 2020 11:21:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 150EDF8011F
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 11:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 150EDF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="L3RUOEuU"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06N9JqR1023697; Thu, 23 Jul 2020 04:21:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=fSfWD+FkC/PZJUbzki3F0hipBI2W3e6yrnVCAjDpz6Y=;
 b=L3RUOEuUpTyyoyWRqqGFRU8ufN2EvElzBpyN03raLCHmxx2xFPDlIk1OYiDdrKi1wgA8
 JSiTUR414SD7nBCu/5ZVT7I5+bI/uPWWHY7XIViwt3nk117VVUWqpjZTBPuCifrcu9A7
 Le5eb7UMy4j5m3lDOVtBfKhaxTagZ2ECmQLiabhSay/7Ujqu1cE7NSc0htwect0K5pUR
 JGpCB2OYkS+HEwSxS9UPDzegnvlSlUrT0frqD/gTwfiGmiDi54aBK2zmJq09aBWtvyDH
 kQ2utPA4pRvJPHeKkV3mgEtIFWQ4MY627iNW6kr4L3llYLg5Tk0hd6W+11nw9f6SGv9P 8g== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 32bxg1faat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jul 2020 04:21:42 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 23 Jul
 2020 10:21:40 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 23 Jul 2020 10:21:40 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2E11445;
 Thu, 23 Jul 2020 09:21:40 +0000 (UTC)
Date: Thu, 23 Jul 2020 09:21:40 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ASoC: wm8962: Do not access WM8962_GPIO_BASE
Message-ID: <20200723092140.GB10899@ediswmail.ad.cirrus.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1015
 adultscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230071
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

Ah ok I think I can see what is going on here, you get an EBUSY
if the regmap is in cache only and you try to read a register
which isn't in the cache. Is that what you are seeing?

> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
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

Yeah this one doesn't look like the right fix to me. Is this also
a cache issue? Since this register is volatile.

I suspect for all of these it would be edifying to know which
reads happen to these registers whilst the cache is set to
cache only.

Thanks,
Charles
