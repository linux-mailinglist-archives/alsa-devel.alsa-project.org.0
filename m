Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 600BA53E3F0
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 11:34:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE73016D7;
	Mon,  6 Jun 2022 11:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE73016D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654508096;
	bh=WsFr9hKVjblfAbokfApI70TNzJmefrbsCSijks2ViKE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e3Z7xlHsdybW/IBMDlKyAs1oUxW+yVr1A8pzUbFHlpJzPCUmfHVqG6AvOEZPgyqQG
	 MYVciXXYG4Ye1XxEON4uurOQcwY2hotFWAU6Cjn1Vq1zfpiHqKsQdqjOODaHdHjItR
	 xEL0I5dIhG2qCHcV+vZ1tC78Fuwels36afEwp4Vg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A7EAF80310;
	Mon,  6 Jun 2022 11:33:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B61A0F80089; Mon,  6 Jun 2022 11:33:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A91DAF80089
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 11:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A91DAF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="BwuNFsey"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2567cllq030641;
 Mon, 6 Jun 2022 04:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=VUdD1guqD0Qi0LS/4B8LoHY2yPYYeCkOvTny4xFn5gY=;
 b=BwuNFseyfaRSx/dcP0/JROg2dLRovYkXcKjTTY6s6rq5ZBrQhXAIgtkyveoolIpuN09w
 Umbe3QhYmcop3blsgu+aNdkpB0Y8pQj2pWJ4VS9mvU9tn0dHwZlMqW9lZ08aQZnlqDeg
 wBV15jXyBucpCt7Ltcl+eB68pP1Ln/ALBfWX00Le4vjxWF9OxYH/bMZ/AvXFBk4ZFHSV
 IpVysORk++iAHg4m4iMDeJDmC5gwE6Sa8bvIrUl39K91TznaN5+fAS+F/f8KMh82qkHA
 sP0kPr76C6CP9z0bnl3sTf36cRwFrqkk3j/UtyvL4Kl17NesU9Uj1EeuLRLHeMAbahF9 uw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gg4t3sngc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 06 Jun 2022 04:33:44 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 6 Jun
 2022 10:33:42 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Mon, 6 Jun 2022 10:33:42 +0100
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.90.251.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0732AB10;
 Mon,  6 Jun 2022 09:33:42 +0000 (UTC)
Subject: Re: [PATCH] ASoC: wm_adsp: Remove redundant NULL check before
 release_firmware() call
To: <cgel.zte@gmail.com>, <lgirdwood@gmail.com>
References: <20220606013916.290387-1-chi.minghao@zte.com.cn>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <ab457b05-6a50-9852-5f12-fed1558fae46@opensource.cirrus.com>
Date: Mon, 6 Jun 2022 10:33:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220606013916.290387-1-chi.minghao@zte.com.cn>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9M7AEQigAU00T33Sv2cjvfVeyDHvpHo0
X-Proofpoint-ORIG-GUID: 9M7AEQigAU00T33Sv2cjvfVeyDHvpHo0
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, broonie@kernel.org
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

On 06/06/2022 02:39, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> release_firmware() checks for NULL pointers internally so checking
> before calling it is redundant.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>   sound/soc/codecs/wm_adsp.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
> index 7973a75cac05..4c4344b21c2e 100644
> --- a/sound/soc/codecs/wm_adsp.c
> +++ b/sound/soc/codecs/wm_adsp.c
> @@ -739,12 +739,10 @@ static void wm_adsp_release_firmware_files(struct wm_adsp *dsp,
>   					   const struct firmware *coeff_firmware,
>   					   char *coeff_filename)
>   {
> -	if (wmfw_firmware)
> -		release_firmware(wmfw_firmware);
> +	release_firmware(wmfw_firmware);
>   	kfree(wmfw_filename);
>   
> -	if (coeff_firmware)
> -		release_firmware(coeff_firmware);
> +	release_firmware(coeff_firmware);
>   	kfree(coeff_filename);
>   }
>   
> 
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
