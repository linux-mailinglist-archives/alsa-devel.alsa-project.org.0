Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E41B2A2602
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 09:21:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64F0E16E3;
	Mon,  2 Nov 2020 09:20:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64F0E16E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604305297;
	bh=0piY80B4GWSScxJcAUqI/amYrXsKGWrVDNPobuE1CSQ=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GyTkZpIvUE18BEdkQ187PdPYx+J7iXSfDpH0VE4UiwKvNDYzwi0zPWw14qauhbWsL
	 TaX2u0JHQVNQ1wUY05doVdVPO1rIkLT5w61K24T23XMBL+VowcYdIr9QJs0eGqQzzT
	 Z0lBZ2zPNLGxmeTH+8H5XDNO3Min/e2980g2/Z0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4D4CF80234;
	Mon,  2 Nov 2020 09:20:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61D19F80083; Mon,  2 Nov 2020 09:20:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEF5EF80083
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 09:19:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEF5EF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FSwCTChV"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A28Jsjl087168;
 Mon, 2 Nov 2020 02:19:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604305194;
 bh=8QkUcp7suRi8RShJ/lyYhamgLqKphm7ps0gHEJVZIcM=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=FSwCTChVAJ/jKeZCXZPLSDuoOK4PpIECMvE/EbdET2trUUxtVZeF6iRce6cRhZOPf
 ozsBpflEC8AnpQOYCix7M61DuJOjNj1hv98NHr+f6Jq5yPsnhBLBob97XkP7vm8Qxo
 aMmehq014oP3j4MIH5QEmKoGAYF9aJG/hdYUapJE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A28Jsdh127918
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 Nov 2020 02:19:54 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 2 Nov
 2020 02:19:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 2 Nov 2020 02:19:54 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A28Jq7r049544;
 Mon, 2 Nov 2020 02:19:53 -0600
Subject: Re: [PATCH] ASoC: ti: davinci-mcasp: fix possible reference leak in
 __davinci_mcasp_set_clkdiv
To: Zhang Qilong <zhangqilong3@huawei.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <alsa-devel@alsa-project.org>
References: <20201030153626.94150-1-zhangqilong3@huawei.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <745d0b29-9b97-32fd-0d50-24b3df266ca6@ti.com>
Date: Mon, 2 Nov 2020 10:20:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201030153626.94150-1-zhangqilong3@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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



On 30/10/2020 17.36, Zhang Qilong wrote:
> pm_runtime_get_sync() will increment pm usage counter whatever it
> does. Forgetting to call pm_runtime_put will result in reference
> leak in __davinci_mcasp_set_clkdiv, so we should fix it.

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  sound/soc/ti/davinci-mcasp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index a6b72ad53b43..4b46dd827f3f 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -607,6 +607,8 @@ static int davinci_mcasp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  static int __davinci_mcasp_set_clkdiv(struct davinci_mcasp *mcasp, int div_id,
>  				      int div, bool explicit)
>  {
> +	int ret = 0;
> +
>  	pm_runtime_get_sync(mcasp->dev);
>  	switch (div_id) {
>  	case MCASP_CLKDIV_AUXCLK:			/* MCLK divider */
> @@ -644,11 +646,11 @@ static int __davinci_mcasp_set_clkdiv(struct davinci_mcasp *mcasp, int div_id,
>  		break;
>  
>  	default:
> -		return -EINVAL;
> +		ret = -EINVAL;
>  	}
>  
>  	pm_runtime_put(mcasp->dev);
> -	return 0;
> +	return ret;
>  }
>  
>  static int davinci_mcasp_set_clkdiv(struct snd_soc_dai *dai, int div_id,
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
