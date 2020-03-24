Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A7D19183E
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 18:55:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4F231661;
	Tue, 24 Mar 2020 18:55:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4F231661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585072552;
	bh=8IKyP1JImeXrDn9RA3nO3T/0MpTwKoFXEmr0mmYnjcs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZCfhQrmelL6ffnW3aTO1d9mHV/JIK8/WH81J8Z7TAtcInBIGBDhXNdPAu0jtVZtG1
	 HdYMC4jtScPWnuF2zgZs9j51nTL9+GXQjRnvX7RznvXLTxgWC8q/wWBartOJeNPu2l
	 mfz/37zxon3OnkK9CQiGVp0/GcWPkPxTQM6/uSXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A9CBF800FE;
	Tue, 24 Mar 2020 18:54:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8703FF801F9; Tue, 24 Mar 2020 18:54:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3052BF800B9
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 18:54:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3052BF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="k2nSqa5w"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02OGiPYu031950; Tue, 24 Mar 2020 11:53:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=ScKwwBhE3C+v/4bfo/2rg3dRb/l6B3lG/MbO+yCkwiQ=;
 b=k2nSqa5wk6RiiR1ePTSFCZT+ILQOCQ9fB8ikhzKVgsChZhM5nYU2RX0CNMPqB0f9Jz/Y
 IDVW1ji7xWzHsjY4i17PQHz1iRUK3iijDUWQfLaLNUf79y+ZW5LKnUGB+Xz/mwqlOezZ
 FiCdFIUtxTS8qNf1LNEy0raQwgLnRU98Gl9i/ljsysv8XRbz3c7/LtI2O1ZIL6ZCML9+
 0kunFJRBZSEUeIqd5IRyZ0mxrET6G6usuphVlgKbcQkupdYZn6JdisPb1i0MAQeAiwGX
 yyAHGIc8GSZBT0g5EeouSxMxKfftEd/zNf2e/lrZ+TVV1pkKIc4SG+VWLL9T5YbFWUbm Bg== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2ywgb2d7aw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 24 Mar 2020 11:53:22 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 24 Mar
 2020 16:53:21 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 24 Mar 2020 16:53:20 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DA09B2AB;
 Tue, 24 Mar 2020 16:53:20 +0000 (UTC)
Date: Tue, 24 Mar 2020 16:53:20 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] ASoC: wm8974: remove unused variables
Message-ID: <20200324165320.GB81149@ediswmail.ad.cirrus.com>
References: <20200324070615.16248-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200324070615.16248-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003240088
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Mar 24, 2020 at 03:06:15PM +0800, YueHaibing wrote:
> sound/soc/codecs/wm8974.c:200:38: warning:
>  wm8974_aux_boost_controls defined but not used [-Wunused-const-variable=]
> sound/soc/codecs/wm8974.c:204:38: warning:
>  wm8974_mic_boost_controls defined but not used [-Wunused-const-variable=]
> 
> commit 8a123ee2a46d ("ASoC: WM8974 DAPM cleanups")
> left behind this, remove them.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  sound/soc/codecs/wm8974.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm8974.c b/sound/soc/codecs/wm8974.c
> index dc4fe4f5239d..06ba36595ddd 100644
> --- a/sound/soc/codecs/wm8974.c
> +++ b/sound/soc/codecs/wm8974.c
> @@ -196,14 +196,6 @@ SOC_DAPM_SINGLE("MicN Switch", WM8974_INPUT, 1, 1, 0),
>  SOC_DAPM_SINGLE("MicP Switch", WM8974_INPUT, 0, 1, 0),
>  };
>  
> -/* AUX Input boost vol */
> -static const struct snd_kcontrol_new wm8974_aux_boost_controls =
> -SOC_DAPM_SINGLE("Aux Volume", WM8974_ADCBOOST, 0, 7, 0);
> -
> -/* Mic Input boost vol */
> -static const struct snd_kcontrol_new wm8974_mic_boost_controls =
> -SOC_DAPM_SINGLE("Mic Volume", WM8974_ADCBOOST, 4, 7, 0);
> -

I am not sure this is quite the right fix both of these are valid
controls on the CODEC, and looks a bit like they shouldn't have
been orphaned in the original patch.

But given they clearly haven't been used by anyone in ten years
and unless Mark has any objections:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
