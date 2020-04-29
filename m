Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F05BB1BD794
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 10:49:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74E7F169B;
	Wed, 29 Apr 2020 10:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74E7F169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588150184;
	bh=hExyo09DNkDzyHLH/hJgJk00iY63pc6UCpsrnc+EKT4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rNi3wLkw6evp1eOv7UpQcwznRKZe/2W5NWmxABjn+umy7xo058u/aqaVfRDTyKL+S
	 RZVco3eleHIT79V/hc4n0eVomYZfe7BhxbQ8Hkm3xq5C98CtOxc6iUXkTI/WQ1GoMC
	 1Df6HZf6dmIQBS9Q3JpqBJ6obX6mLQ05YMTS/YUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E877F800D2;
	Wed, 29 Apr 2020 10:48:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D68DEF8022B; Wed, 29 Apr 2020 10:47:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B05CF800B6
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 10:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B05CF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="RtPHj/Nl"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03T8logm017993; Wed, 29 Apr 2020 03:47:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=wg0rOWzlWFXEP48Zt5Zht4FjVgU4+4tJHUQA+GsEaYo=;
 b=RtPHj/Nli1Q2cfdMZ1oucOKAqHi1PVoSZtxTWDxaFXpSzlV4E7DfvPa8LXeDaH8l10LF
 SYK5IimHdi7pgNJoxvT8GIxzBh9x5ndjSdr03LwWfFbrw02M1WTf/6GCInJEpMTpQIBO
 4p55ic4vyI+wN/JPLj5Ua1DfoA94d6CZuWpGz7yfBFzi4TxYNYNY8es9ys01vK/h4b8y
 hz0rsV5CHZgdFSj32lokmhU8ckl2YRKcl/JI+wdLiW2r7vqlteB2dnp1ydxd4tJFKvR5
 2O1g1p9QoofGbamGvhdnPXsQh60OwCnlVaRQcQes9QP63GR6hyPMYofij/afR8Mb4vbh dw== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 30mhmqxhee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Apr 2020 03:47:50 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 29 Apr
 2020 09:47:48 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Wed, 29 Apr 2020 09:47:48 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A3F472C5;
 Wed, 29 Apr 2020 08:47:48 +0000 (UTC)
Date: Wed, 29 Apr 2020 08:47:48 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ASoC: codecs: wm97xx: fix ac97 dependency
Message-ID: <20200429084748.GO44490@ediswmail.ad.cirrus.com>
References: <20200428212721.2877627-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200428212721.2877627-1-arnd@arndb.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015 bulkscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=981
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004290073
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
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

On Tue, Apr 28, 2020 at 11:26:59PM +0200, Arnd Bergmann wrote:
> A recent build fix got the dependency slightly wrong, breaking
> builds with CONFIG_AC97_BUS_NEW:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_WM9713
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AC97_BUS [=n]
>   Selected by [m]:
>   - SND_SOC_ZYLONITE [=m] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_PXA2XX_SOC [=m] && MACH_ZYLONITE [=y] && AC97_BUS [=n]=n
> 
> WARNING: unmet direct dependencies detected for SND_SOC_WM9712
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AC97_BUS [=n]
>   Selected by [m]:
>   - SND_PXA2XX_SOC_EM_X270 [=m] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_PXA2XX_SOC [=m] && (MACH_EM_X270 [=n] || MACH_EXEDA [=n] || MACH_CM_X300 [=y]) && AC97_BUS [=n]=n
> 
> Change the dependency to allow either version of the AC97 library
> code.
> 
> Fixes: 5a309875787d ("ASoC: Fix SND_SOC_ALL_CODECS imply ac97 fallout")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
