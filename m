Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECFF57DC37
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 10:21:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86D2E1867;
	Fri, 22 Jul 2022 10:21:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86D2E1867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658478112;
	bh=tvrBh13VVJ6kWjNNuOVEV6YI8P9t7+Ld6yUvel8e+A0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ESTuOtVlAccnFOm7qXwmHRiztP4His34e+sYeoi4yTfNoZH4Fqw9cFSRKklSuvhit
	 jXGguJarilH8ByVH2rR7rfdstjfvhutxaCPaanCb4bpw5dAWDV74wEsAXd34HgQKUL
	 tS7thiscftUQ4mW9Ktvqw87+ehYGH0GJd8Ckos2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDBA4F80166;
	Fri, 22 Jul 2022 10:20:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53249F80166; Fri, 22 Jul 2022 10:20:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B0B2F80166
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 10:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B0B2F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="gq4iiMo+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26M5W98a002873;
 Fri, 22 Jul 2022 03:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=GntB1BCtcoPvCgqm5ushfKyKSHcldkf+JZ2aiyILZro=;
 b=gq4iiMo+OzmhxhUU80Fw9ynoV5jlId+PiHfjbDPJRST1dloJsdDvLz/zH9FyxHo6hwaS
 0/DIh38GOy7voa0qxOFR36g2nDTfQxHVdeTdQxkIgSp96aui7pQR1LoemTc2hxeibH+k
 h9ZGJLYuWE5s30TojD+Q+soKxYyaBT8ah9SJnUszDjSUa6sHT60jo2UESpHeTwBgxheG
 bkdGZGtV+QkhVFhZ9gP+PTgMU3nbFemZjNlsrZ2LS94IqAn3swC6fi8yvorFsTj+2rRI
 UsNXabuley0Sb0qgqIDT5PAnt/RwIclWFm/S/jLuO1AI4m2Pn4P6YSLh84P75lTzNiaX xA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hdxffbm46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 03:20:39 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Fri, 22 Jul
 2022 03:20:37 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Fri, 22 Jul 2022 03:20:37 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5C035B0E;
 Fri, 22 Jul 2022 08:20:37 +0000 (UTC)
Date: Fri, 22 Jul 2022 08:20:37 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH] ASoC: amd: vangogh: Use non-legacy DAI naming for cs35l41
Message-ID: <20220722082037.GE92394@ediswmail.ad.cirrus.com>
References: <20220721233227.1459374-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220721233227.1459374-1-cristian.ciocaltea@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: -LieSRoCLqrTKJf1hUJY24KjP9k_P9X2
X-Proofpoint-GUID: -LieSRoCLqrTKJf1hUJY24KjP9k_P9X2
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, kernel@collabora.com,
 tanureal@opensource.cirrus.com, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, david.rhodes@cirrus.com
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

On Fri, Jul 22, 2022 at 02:32:27AM +0300, Cristian Ciocaltea wrote:
> Unlike most CODEC drivers, the CS35L41 driver did not have the
> non_legacy_dai_naming set, meaning the corresponding DAI has been
> traditionally registered using the legacy naming: spi-VLV1776:0x
> 
> The recent migration to the new legacy DAI naming style has implicitly
> corrected that behavior and DAI gets now registered via the non-legacy
> naming, i.e. cs35l41-pcm.
> 
> The problem is the acp5x platform driver is now broken as it continues
> to refer to the above mentioned codec using the legacy DAI naming in
> function acp5x_cs35l41_hw_params() and, therefore, the related setup
> is not being executed anymore.
> 
> Let's fix that by replacing the obsolete DAI name with the correct one.
> 
> Fixes: bc949a3b4af3 ("ASoC: core: Switch core to new DAI naming flag")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

Looks good to me:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Looped in David and Lucas from ourside who I believe worked on
the steam deck incase they have any comments too. Apologies for
this one and thank you for fixing it up.

Thanks,
Charles

>  sound/soc/amd/vangogh/acp5x-mach.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
> index 727de46860b1..af3737ef9707 100644
> --- a/sound/soc/amd/vangogh/acp5x-mach.c
> +++ b/sound/soc/amd/vangogh/acp5x-mach.c
> @@ -178,8 +178,7 @@ static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *substream,
>  	ret = 0;
>  	for (i = 0; i < num_codecs; i++) {
>  		codec_dai = asoc_rtd_to_codec(rtd, i);
> -		if ((strcmp(codec_dai->name, "spi-VLV1776:00") == 0) ||
> -		    (strcmp(codec_dai->name, "spi-VLV1776:01") == 0)) {
> +		if (strcmp(codec_dai->name, "cs35l41-pcm") == 0) {
>  			switch (params_rate(params)) {
>  			case 48000:
>  				bclk_val = 1536000;
> -- 
> 2.37.1
> 
