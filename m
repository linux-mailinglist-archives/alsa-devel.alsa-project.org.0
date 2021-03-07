Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC2933035B
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Mar 2021 18:31:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B8391F73;
	Sun,  7 Mar 2021 18:31:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B8391F73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615138318;
	bh=pCeB5JVeModdLYSnWUF46oxT6WvcQH/+S48fLGvWFEo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SVWqwKjwfpDWeszhD8N0WM3HW3HEDoQaa3eyHdkhgcI5GIRGMw8xCZevL4cHAm1pW
	 0pZGghFxu6CTcIlOFl7ZPKc2ldQfW6m44bgAq0/vd2CC9XrVvYinTt5M9cv2s3tIRD
	 zOa3k/CWutvFPDRsVXA3ZuF0HLrTyLu/7ODekhrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D0B5F80139;
	Sun,  7 Mar 2021 18:30:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9641F80227; Sun,  7 Mar 2021 18:30:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C45B3F800ED
 for <alsa-devel@alsa-project.org>; Sun,  7 Mar 2021 18:30:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C45B3F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Q3TKGNs6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 127HTsxA023819; Sun, 7 Mar 2021 11:29:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=qFwuaB9XRWNdbWaM1kjbKcvQcMGq7hMqEHja3kG8szw=;
 b=Q3TKGNs6jVIvV3XvCmrApgK/BIpd/eWKtee5dvRWRrLf19B6pzkFvRD++5D0Ox/OsDRH
 esp8o8nd8gX4e99EtjIERCTYCJ2Oqavx++GhVTf2HtLYbdLlBXKEFa5Ms/QjGqX/aarx
 DV5OgBlrCa6vnO7Dl+kaX0gn7cHipNMeMybN8qoh5eKe3iEh3Aeo+tjqfKt2pTx0UyKU
 EJCnzmWSRj3Qtt3hKqfqYw+r/X4vvwHDhVJ/JwtW9lHGtDOAmQJ4OfTGSIcXCrGVf2m2
 0Ei4X0NQ4URm7HdzWCh49YfPHMGaT76pZhW5LbxCdz5t4NAnEfsUsB2w5Tbqc6erDno6 Rg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 37471vs4kr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sun, 07 Mar 2021 11:29:54 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sun, 7 Mar 2021
 17:29:52 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Sun, 7 Mar 2021 17:29:52 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D480B11CB;
 Sun,  7 Mar 2021 17:29:52 +0000 (UTC)
Date: Sun, 7 Mar 2021 17:29:52 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: wm8962: Relax bit clock divider searching
Message-ID: <20210307172952.GG106851@ediswmail.ad.cirrus.com>
References: <1614770488-12861-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1614770488-12861-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103070096
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 gustavoars@kernel.org, kuninori.morimoto.gx@renesas.com,
 patches@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 peter.ujfalusi@ti.com, broonie@kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Mar 03, 2021 at 07:21:28PM +0800, Shengjiu Wang wrote:
> With S20_3LE format case, the sysclk = rate * 384,
> the bclk = rate * 20 * 2, there is no proper bclk divider
> for 384 / 40, because current condition needs exact match.
> So driver fails to configure the clocking:
> 
> wm8962 3-001a: Unsupported BCLK ratio 9
> 
> Fix this by relaxing bitclk divider searching, so that when
> no exact value can be derived from sysclk pick the closest
> value greater than expected bitclk.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/codecs/wm8962.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> index ce4666a74793..f5cd22450190 100644
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -2403,6 +2403,7 @@ static const int sysclk_rates[] = {
>  static void wm8962_configure_bclk(struct snd_soc_component *component)
>  {
>  	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
> +	int best, min_diff, diff;
>  	int dspclk, i;
>  	int clocking2 = 0;
>  	int clocking4 = 0;
> @@ -2473,23 +2474,23 @@ static void wm8962_configure_bclk(struct snd_soc_component *component)
>  
>  	dev_dbg(component->dev, "DSPCLK is %dHz, BCLK %d\n", dspclk, wm8962->bclk);
>  

Very minor nit but it would probably be nice to have some
equivalent debug statement that prints out the actual BCLK we end
up with. There are a couple of statements printing the requested
speed, but nothing that will output what the driver actually
applies after this change.

Otherwise I think the change looks good.

Thanks,
Charles
