Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1349A11D2B7
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 17:50:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F0FA1715;
	Thu, 12 Dec 2019 17:49:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F0FA1715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576169445;
	bh=Z22if0GLBaBgC/dhuqzUA6EMaNv8c6FnoCFhM69dKE4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NHdqrVLyU1yDVD50yHib3CfdOztqQmRQqhMxhWGXfOuE90NBZGNf1rdZCRxZA3pWH
	 pYTy9wgWVceOZcdFy79y4QMqX3CiG1cpxdBfN0Au7I8eIXvDd2dgmA8yfIpWvrGhn1
	 B0hexf6N4NR+LWzJCPFjj+eAPmPDoEUwrbXsXVuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B50BF80248;
	Thu, 12 Dec 2019 17:48:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D0B9F80249; Thu, 12 Dec 2019 17:48:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B4F4F80232
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 17:48:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B4F4F80232
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="FSoOnz2O"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBCGfE7x019441; Thu, 12 Dec 2019 10:48:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=Y5UjW/iCL1Sg9lvY5uXhCGfChrkY/+BGEyhe0F7nTj4=;
 b=FSoOnz2OD+7PkuvLAppfrLau4qkp5IvCDS61w9a3557LTss4kFKVQwQlC20v8VFUNYt8
 0IRsQIGpnwvEy0bDwoxmvbLLt9CaS/EsMwuiWn1hyMLDd1hNbCQ3mnyVLQkps3q8m3A3
 nbCBYqdhSjAaMmpblirUYeTlp26Ebju4YIpx6hZaHAG8vv1ZwusLWsS297O5v+U2rWEO
 ZD3APpOZUp/ySSNKJoClqNUf/5RYnHcKx/4jYa13IahTLTDfr404/Ow0O82gcrM4ypJ8
 MW6OVJLzZ/TPitZrzkG59o5Av33OOlsKoxdF22TuiW4qUORfI5HBBqVWDKeKNIb5PMjs 8w== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([5.172.152.52])
 by mx0b-001ae601.pphosted.com with ESMTP id 2wr9ctxxcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 12 Dec 2019 10:48:38 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 12 Dec
 2019 16:48:35 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 12 Dec 2019 16:48:35 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6D0192A1;
 Thu, 12 Dec 2019 16:48:35 +0000 (UTC)
Date: Thu, 12 Dec 2019 16:48:35 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20191212164835.GD10451@ediswmail.ad.cirrus.com>
References: <1576065442-19763-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576065442-19763-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 phishscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912120130
Cc: kstewart@linuxfoundation.org, guennadi.liakhovetski@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, patches@opensource.cirrus.com, tglx@linutronix.de,
 allison@lohutok.net
Subject: Re: [alsa-devel] [PATCH] ASoC: wm8962: fix lambda value
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

On Wed, Dec 11, 2019 at 07:57:22PM +0800, Shengjiu Wang wrote:
> According to user manual, it is required that FLL_LAMBDA > 0
> in all cases (Integer and Franctional modes).
> 
> Fixes: 9a76f1ff6e29 ("ASoC: Add initial WM8962 CODEC driver")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/codecs/wm8962.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> index 3e5c69fbc33a..d9d59f45833f 100644
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -2788,7 +2788,7 @@ static int fll_factors(struct _fll_div *fll_div, unsigned int Fref,
>  
>  	if (target % Fref == 0) {
>  		fll_div->theta = 0;
> -		fll_div->lambda = 0;
> +		fll_div->lambda = 1;
>  	} else {
>  		gcd_fll = gcd(target, fratio * Fref);
>  
> @@ -2858,7 +2858,7 @@ static int wm8962_set_fll(struct snd_soc_component *component, int fll_id, int s
>  		return -EINVAL;
>  	}
>  
> -	if (fll_div.theta || fll_div.lambda)
> +	if (fll_div.theta)
>  		fll1 |= WM8962_FLL_FRAC;

How well tested is this change, and is it addressing an issue you
have observed? I agree this does better fit the datasheet just a
little nervous as its an older part that has seen a lot of usage.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
