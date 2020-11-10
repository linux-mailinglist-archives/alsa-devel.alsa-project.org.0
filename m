Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7292AD030
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 08:00:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 047ED16C0;
	Tue, 10 Nov 2020 08:00:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 047ED16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604991651;
	bh=NWJbTGCdOLJ+wtx9fPLy3a8m+lFFVFWL5EHeEubjeLA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tUcDnF4fyd6U9dvcx3beNwhwLcoPDERtxy2ITg/ooRX3eysOmgFxriYR3XHJCdGSb
	 073iDQdnqIPDXovPAKrhIJfznjk9BCPWb3PB5H+7PhHkKev9n+01YbETz47DDP9EHE
	 I/jAY//CliWCbCaIIK9PWyGrT7Xwcy+UC2IYY7aU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8462F800EB;
	Tue, 10 Nov 2020 07:59:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBF0FF801D5; Tue, 10 Nov 2020 07:59:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACDE4F80059
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 07:59:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACDE4F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oYs4nMC2"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AA6x5ec053594;
 Tue, 10 Nov 2020 00:59:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604991545;
 bh=lcxk2NIGPVfaoYb1YXbCG/kCN5Buyca2t0w8RiClbbw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=oYs4nMC2I0J3x7H3Rkd40cmrnWlhhWnFxApMrg3gyPseiqJAoGNzi+GJbxQUd89Q5
 ZgTgcGY904AOVvZMgbekYHO27HmnmqRACD1y+zFtTikfyb56g2AVqSyymmoQEFehAZ
 Cj/D5kX433AwKEPrvadI8woJveYrhli37/Dv/ldM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AA6x5iR040123
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 00:59:05 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 00:59:04 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 00:59:05 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AA6x2vA122096;
 Tue, 10 Nov 2020 00:59:03 -0600
Subject: Re: [PATCH] ASoC: pcm512x: Add support for data formats RJ and LJ
To: Kirill Marinushkin <kmarinushkin@birdec.com>, Mark Brown
 <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood
 <lgirdwood@gmail.com>
References: <20201109212133.25869-1-kmarinushkin@birdec.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <690508c7-7029-6781-a1a2-0609e37cb9e6@ti.com>
Date: Tue, 10 Nov 2020 08:59:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201109212133.25869-1-kmarinushkin@birdec.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Matthias Reichl <hias@horus.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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



On 09/11/2020 23.21, Kirill Marinushkin wrote:
> Currently, pcm512x driver supports only I2S data format.
> This commit adds RJ and LJ as well.
> 
> I don't expect regression WRT existing sound cards, because:
> 
> * default value in corresponding register of pcm512x codec is 0 ==  I2S
> * existing in-tree sound cards with pcm512x codec are configured for I2S
> * i don't see how existing off-tree sound cards with pcm512x codec could be
>   configured differently - it would not work
> * tested explicitly, that there is no regression with Raspberry Pi +
>   sound card `sound/soc/bcm/hifiberry_dacplus.c`
> 
> Signed-off-by: Kirill Marinushkin <kmarinushkin@birdec.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Matthias Reichl <hias@horus.com>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  sound/soc/codecs/pcm512x.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
> index 8153d3d01654..c6e975fb4a43 100644
> --- a/sound/soc/codecs/pcm512x.c
> +++ b/sound/soc/codecs/pcm512x.c
> @@ -1167,6 +1167,7 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_soc_component *component = dai->component;
>  	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
>  	int alen;
> +	int afmt;
>  	int gpio;
>  	int clock_output;
>  	int master_mode;
> @@ -1195,6 +1196,22 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
>  		return -EINVAL;
>  	}
>  
> +	switch (pcm512x->fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +		afmt = PCM512x_AFMT_I2S;
> +		break;
> +	case SND_SOC_DAIFMT_RIGHT_J:
> +		afmt = PCM512x_AFMT_RTJ;
> +		break;
> +	case SND_SOC_DAIFMT_LEFT_J:
> +		afmt = PCM512x_AFMT_LTJ;
> +		break;
> +	default:
> +		dev_err(component->dev, "unsupported DAI format: 0x%x\n",
> +			pcm512x->fmt);
> +		return -EINVAL;
> +	}
> +

The bus format and

>  	switch (pcm512x->fmt & SND_SOC_DAIFMT_MASTER_MASK) {

>  	case SND_SOC_DAIFMT_CBS_CFS:
>  		ret = regmap_update_bits(pcm512x->regmap,

the clock generation role should be set in pcm512x_set_fmt(), in that
way you can deny specific setups earlier.

I would also add DSP_A and DSP_B modes at the same time, DSP_A would
need a write of 1 to register 41 (PCM512x_I2S_2, offset = 1), other
formats should set the offset to 0.

> @@ -1236,6 +1253,13 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
>  		return ret;
>  	}
>  
> +	ret = regmap_update_bits(pcm512x->regmap, PCM512x_I2S_1,
> +				 PCM512x_AFMT, afmt);
> +	if (ret != 0) {
> +		dev_err(component->dev, "Failed to set data format: %d\n", ret);
> +		return ret;
> +	}
> +
>  	if (pcm512x->pll_out) {
>  		ret = regmap_write(pcm512x->regmap, PCM512x_FLEX_A, 0x11);
>  		if (ret != 0) {
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
