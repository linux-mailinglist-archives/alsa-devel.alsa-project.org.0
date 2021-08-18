Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCCB3F0471
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 15:17:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6250A1676;
	Wed, 18 Aug 2021 15:16:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6250A1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629292637;
	bh=/2gFWHnrWENoVI9Yh2X0Vf5/ajiJPLw1zMu5y47s1+k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QO+CeN6ZoGVTp36Mf72BfPW+mizFlVKS9aV18oitWF5gTbq58eai1CdGs8NeE1qIB
	 A47PIPeh3hPro6IiMhB6FVL8DWSjOdEF2WVFV5Jvelvi3g+Gbazw3ifRe/9LwGwbOl
	 pmI4Fxy94Z7pVky+nen7h7n3KD7KRLBwLAeQvV7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE258F800EC;
	Wed, 18 Aug 2021 15:15:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2FE3F80249; Wed, 18 Aug 2021 15:15:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E36EF800EC
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 15:15:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E36EF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HjNMFg39"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17IDAl0S027040; 
 Wed, 18 Aug 2021 08:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=RT10YEEl56y+8zUe9U6xjHrzQdqClkYbLj6Atk7GYAo=;
 b=HjNMFg39N0Q0J+3so/7kGFLXm4GG0+NFLyUv33EyDGRLypVvftP1ApSCavCWiLl2L70I
 uRgfn+ERzZEOFtZbi4rwJJ4acQkDA4VYyN2VqD+b3dj02uZ/owsIWp9/mhNVOsV2egSE
 Tv408e7Kd5G5y/3pTKRns6qZKVjvs1rdej5TNXk32ADZruWDxum1tnsszstN/BmhGI9B
 HeXPXilVQAlYoZ21O4a0DgK+uVkVjoyKWn+Jbr5W/CRPOmVvjEx2g4ChLcWkU+pDD/kS
 GJSBL/Gfd1QuQmjQBgwgqPiTxwJLo92RSdSB4ECOmfu4bzJiTr2dMYmmVutcaEf4foSG ow== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3agtd4gp6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 18 Aug 2021 08:15:47 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 18 Aug
 2021 14:15:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Wed, 18 Aug 2021 14:15:45 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DFED445D;
 Wed, 18 Aug 2021 13:15:44 +0000 (UTC)
Date: Wed, 18 Aug 2021 13:15:44 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.13 03/12] ASoC: wm_adsp: Let
 soc_cleanup_component_debugfs remove debugfs
Message-ID: <20210818131544.GL9223@ediswmail.ad.cirrus.com>
References: <20210817003536.83063-1-sashal@kernel.org>
 <20210817003536.83063-3-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210817003536.83063-3-sashal@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 07ovo_PiZY4C71smc856evkHyhsV5zae
X-Proofpoint-GUID: 07ovo_PiZY4C71smc856evkHyhsV5zae
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1031
 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108180083
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Mark Brown <broonie@kernel.org>
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

On Mon, Aug 16, 2021 at 08:35:27PM -0400, Sasha Levin wrote:
> From: Lucas Tanure <tanureal@opensource.cirrus.com>
> 
> [ Upstream commit acbf58e530416e167c3b323111f4013d9f2b0a7d ]
> 
> soc_cleanup_component_debugfs will debugfs_remove_recursive
> the component->debugfs_root, so adsp doesn't need to also
> remove the same entry.
> By doing that adsp also creates a race with core component,
> which causes a NULL pointer dereference
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> Link: https://lore.kernel.org/r/20210728104416.636591-1-tanureal@opensource.cirrus.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  sound/soc/codecs/wm_adsp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
> index cef05d81c39b..6698b5343974 100644
> --- a/sound/soc/codecs/wm_adsp.c
> +++ b/sound/soc/codecs/wm_adsp.c
> @@ -746,7 +746,6 @@ static void wm_adsp2_init_debugfs(struct wm_adsp *dsp,
>  static void wm_adsp2_cleanup_debugfs(struct wm_adsp *dsp)
>  {
>  	wm_adsp_debugfs_clear(dsp);
> -	debugfs_remove_recursive(dsp->debugfs_root);
>  }

It might be better not to backport this patch to the stable
kernels. The issue has only been seen on one out of tree driver
and the patch looks a little off to me. This
debugfs_remove_recursive should run before the
soc_cleanup_component_debugfs one, and as such it's hard to see
what is actually going on. We are currently investigating internally
but we might end up reverting the change, and it only seems to be
causing issues on the one not upstreamed part.

Apologies for missing the review of this one when it went up
Mark, I was on holiday at the time.

Thanks,
Charles
