Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 961BD5B3C73
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 17:56:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A1341651;
	Fri,  9 Sep 2022 17:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A1341651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662739016;
	bh=N3UmQb/J/dVz3Y12p6XtcrMnL6MuX8BFnr+bmkltnlw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qa0tELS+gcIUhG/NaQN0NMPMJMRozjq3WTwbIQFXua/bsrlGmVPJFG7xYhOUTKFLJ
	 2xI22h55+j01vs2Vrq7K1ol1y45N5wQI5Kf+S1RvZucprMBcT2CBL+NJN1jVAb4lWZ
	 XVzuLE+NKROjguGxyPNt5B4zg4xJ4lGvB519xhrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89D7BF8032B;
	Fri,  9 Sep 2022 17:55:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5E07F8023A; Fri,  9 Sep 2022 17:55:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CD26F8016C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 17:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CD26F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="q44sG+gY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2896qFNo009110;
 Fri, 9 Sep 2022 10:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=3nHT9uBcMm+Mg6mZ509Ukrc3RClGASZLYFpwg58jTGE=;
 b=q44sG+gY/lsPHBrCOUP9ij9NNoi6qLerKsYnCAC1xTgMMribA0s/oERPxSBmAN0mndrq
 PQLuwqJXl8iJxn8J7bM2LLSiSBLYB2Yrt9O+jdjw0B7ziPc+ESoK3mmRwm3Lddoqgu+p
 PBFm6W2lVIGndfsEFK6aA+YOmaN7QG9eqoMDZgmamGRXJu4rPCiP2695debKqeW0H6Sd
 2qyIiCz7Xk/WxHl0KIfYjlmUNoCo8RNcJhCygFPMbyaL4Gjm8/QjA5oLqSBpHPvO1nPe
 BM/iOsk5/bXiplWteN8UMeZe+18u8CV+CUwNSx2CqoccqJYX7BANkxhtV7bR5TNpza8a 3w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jc3bq1774-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Sep 2022 10:55:49 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Fri, 9 Sep
 2022 10:55:48 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Fri, 9 Sep 2022 10:55:48 -0500
Received: from [198.90.251.95] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 87CF72C5;
 Fri,  9 Sep 2022 15:55:41 +0000 (UTC)
Message-ID: <20342329-8525-9081-e1c1-f67067883c72@opensource.cirrus.com>
Date: Fri, 9 Sep 2022 16:55:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 04/10] ASoC: cs42l42: Split probe() and remove() into
 stages
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>, James Schulman
 <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, "Lucas
 Tanure" <tanureal@opensource.cirrus.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220909135334.98220-1-povik+lin@cutebit.org>
 <20220909135334.98220-5-povik+lin@cutebit.org>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20220909135334.98220-5-povik+lin@cutebit.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sCliLYKo1kOmkbqQ3fdYLmEc-YZZcr8n
X-Proofpoint-ORIG-GUID: sCliLYKo1kOmkbqQ3fdYLmEc-YZZcr8n
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>,
 asahi@lists.linux.dev, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Matt Flax <flatmax@flatmax.com>
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

On 09/09/2022 14:53, Martin Povišer wrote:
> +static int cs42l42_init(struct cs42l42_private *cs42l42)
> +{
> +	unsigned int reg;
> +	int devid, ret;
> +
>   	/* initialize codec */
>   	devid = cirrus_read_device_id(cs42l42->regmap, CS42L42_DEVID_AB);
>   	if (devid < 0) {
> @@ -2320,15 +2331,15 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client)
>   	/* Setup headset detection */
>   	cs42l42_setup_hs_type_detect(cs42l42);
>   
> +	/*
> +	 * Set init_done before unmasking interrupts so any triggered
> +	 * immediately will be handled.
> +	 */
> +	cs42l42->init_done = true;
> +
>   	/* Mask/Unmask Interrupts */
>   	cs42l42_set_interrupt_masks(cs42l42);
>   
> -	/* Register codec for machine driver */
> -	ret = devm_snd_soc_register_component(cs42l42->dev,
> -			&soc_component_dev_cs42l42, &cs42l42_dai, 1);
> -	if (ret < 0)
> -		goto err_shutdown;
> -
>   	return 0;
>   
>   err_shutdown:
> @@ -2337,34 +2348,69 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client)
>   	regmap_write(cs42l42->regmap, CS42L42_PWR_CTL1, 0xff);
>   
>   err_disable:
> -	if (i2c_client->irq)
> -		free_irq(i2c_client->irq, cs42l42);
> -

These 3 lines should not be removed. cs42l42_init() must free
the irq in the error paths.
