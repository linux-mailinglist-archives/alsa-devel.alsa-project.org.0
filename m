Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E59478809
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 10:47:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4AD21F1B;
	Fri, 17 Dec 2021 10:46:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4AD21F1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639734446;
	bh=bPL7SxCJiTq8bFvE1QZR7MTYb5LDoxxxCFXGNe0epFo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LRcLvh+D8egXjif65teBHmJBBOrVRmNFKzzpSeI0Xe+PAvd5hVRjdpEIrwVtO/aj+
	 nXiVsVBWFmJpxW7jHrF3xHy/tOEOo3dbPImg/J/Xr9oXOUAl6n/1i2xFpoq8murwo+
	 BHLIm2lbynanXv7omM21zPg4Mgn7vUnBqX8H2GaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EE3BF800F4;
	Fri, 17 Dec 2021 10:46:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00C59F8014D; Fri, 17 Dec 2021 10:46:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA528F80143
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 10:46:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA528F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="O6PaKYMJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BH7VDG4027623;
 Fri, 17 Dec 2021 03:46:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=3k0NdkEM+b3Vmv/jNu9YwAZ5aPOV8hy9c94hsdHkoj4=;
 b=O6PaKYMJB9vjvl7wcy1pWHj4P0faJMuF0dMqMltSrHWwGAVfYMOmuBbnX+LAkRZz5F6V
 v8Q9FhsZ3KePzhwjj8/kUnNCZqxk+5tBKmfkgN9V1JLOhup6g2vhlFOz8H84URzxqrg/
 SSlHtymU1eC56t0RReJdC0N1X8Oh/uxWBtxq3LG3XuIcrutoz5ta5Vszhl8eTIUXVLOo
 XnjIthvAFp/agnroLt0MsyrmGdnkn4xp4sNN3HiJffg3NfC6GbkVPcA73vVKZbmVh/PW
 /RyvuYkYTPuNDtlIQgUVHzSKKEyHl2e5aRh2uVSaAKFrYXfqwDjdeR3LclB/oGN/nrgU FQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cymsc2b1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 17 Dec 2021 03:46:11 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 17 Dec
 2021 09:46:09 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 17 Dec 2021 09:46:09 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F2DD8B10;
 Fri, 17 Dec 2021 09:46:08 +0000 (UTC)
Date: Fri, 17 Dec 2021 09:46:08 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: wm8962: potential use of error pointer
Message-ID: <20211217094608.GT18506@ediswmail.ad.cirrus.com>
References: <20211217031333.493777-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211217031333.493777-1-jiasheng@iscas.ac.cn>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: J6QOU-sQ0H4BXgBQ4mDiiuRrtxDn9pJ6
X-Proofpoint-ORIG-GUID: J6QOU-sQ0H4BXgBQ4mDiiuRrtxDn9pJ6
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 patches@opensource.cirrus.com, shengjiu.wang@nxp.com, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, daniel.baluta@nxp.com,
 linux-kernel@vger.kernel.org
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

On Fri, Dec 17, 2021 at 11:13:33AM +0800, Jiasheng Jiang wrote:
> The return value of devm_clk_get() needs to be checked.
> To avoid use of error pointer in case of the failure of alloc.
> 
> Fixes: d74e9e7090ae ("ASoC: wm8962: Add device tree binding")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>  sound/soc/codecs/wm8962.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> index 34080f497584..66693bf17763 100644
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -3540,6 +3540,8 @@ static int wm8962_set_pdata_from_of(struct i2c_client *i2c,
>  		}
>  
>  	pdata->mclk = devm_clk_get(&i2c->dev, NULL);
> +	if (IS_ERR(pdata->mclk))
> +		return -ENOMEM;

The value was checked later, so the code was mostly fine and what
bugs there were have already been fixed:

044c11401443 ("ASoC: wm8962: Convert to devm_clk_get_optional")

Thanks,
Charles
