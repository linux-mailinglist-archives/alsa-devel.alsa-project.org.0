Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0D449265D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 14:03:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73469183E;
	Tue, 18 Jan 2022 14:02:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73469183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642510987;
	bh=c91+g+iW2h28tG00xHQUKlvPDJ9ZEQQzx+2EfBoLIBI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tt3b/WjJ05Eogsni2lOfF6Zo206qEJkNGAW9hwbCZbD3DIFWqLzY2Se85/N6FI2DV
	 HNCULxCBDamitdffghLb8/w+mxEXG4hBS8VQsBXKs1xTKfXTeZsWOK3GVztENfn6vu
	 VkcB2DiemRHb29Ui80w6ABfP1B3EIUjujrC26FIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED7BFF80100;
	Tue, 18 Jan 2022 14:02:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26AB5F8023B; Tue, 18 Jan 2022 14:02:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53CFDF80100
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 14:01:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53CFDF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="YCTaC28r"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20I6gF7I004768;
 Tue, 18 Jan 2022 07:01:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=2gdzjEg5kQilpj8cuYWQPc3gR01MqchMRRXJgwpOffQ=;
 b=YCTaC28r3Lv4k215DZ32he2J0UNNComd7pHsBjTzzZLRR74GO894cvL4cQMmeOWY+9U4
 opKkcDWeKrCYFQwJMGjtJWhGxVkch1iR5Q62pHYDPRdvvOLe6wbu764GZj8JrnXTOVV+
 j0GoSqCyYOCRio+e7Sd1PUtHPfbDEN2PtvR/esef8brUCkcIwWDcUavkHezpqlGhrCP2
 RAGO5xu/WzBjKJLZQGUKijst2M7Gja6PzKEmMtv5TnEv90o/7p9uyUvAWl8XTuBGSGeL
 ekryJv0rzzNaH4P3EPaMbBhiyXzbq3Ul/puvi0uS/bIdYZ7zgX/SRe73bokopX5ynLk+ ww== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dnaxhs4t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 18 Jan 2022 07:01:54 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 13:01:52 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Tue, 18 Jan 2022 13:01:52 +0000
Received: from [198.61.64.122] (unknown [198.61.64.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 01ECC459;
 Tue, 18 Jan 2022 13:01:51 +0000 (UTC)
Message-ID: <6bca7fc2-c7d8-99fb-d7d8-df18d643e6fb@opensource.cirrus.com>
Date: Tue, 18 Jan 2022 13:01:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ALSA: hda: cs35l41: Make cs35l41_hda_remove() return void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, "James
 Schulman" <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>
References: <20220117220055.120955-1-u.kleine-koenig@pengutronix.de>
From: Lucas tanure <tanureal@opensource.cirrus.com>
In-Reply-To: <20220117220055.120955-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1bYTkJxUXIiPDgDXl1R2UYtxgEJLc1w-
X-Proofpoint-ORIG-GUID: 1bYTkJxUXIiPDgDXl1R2UYtxgEJLc1w-
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, kernel@pengutronix.de
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

On 1/17/22 22:00, Uwe Kleine-König wrote:
> Up to now cs35l41_hda_remove() returns zero unconditionally. Make it
> return void instead which makes it easier to see in the callers that
> there is no error to handle.
> 
> Also the return value of i2c and spi remove callbacks is ignored anyway.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   sound/pci/hda/cs35l41_hda.c     | 4 +---
>   sound/pci/hda/cs35l41_hda.h     | 2 +-
>   sound/pci/hda/cs35l41_hda_i2c.c | 4 +++-
>   sound/pci/hda/cs35l41_hda_spi.c | 4 +++-
>   4 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
> index 30b40d865863..ce3782826830 100644
> --- a/sound/pci/hda/cs35l41_hda.c
> +++ b/sound/pci/hda/cs35l41_hda.c
> @@ -508,7 +508,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
>   }
>   EXPORT_SYMBOL_GPL(cs35l41_hda_probe);
>   
> -int cs35l41_hda_remove(struct device *dev)
> +void cs35l41_hda_remove(struct device *dev)
>   {
>   	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
>   
> @@ -517,8 +517,6 @@ int cs35l41_hda_remove(struct device *dev)
>   	if (!cs35l41->vspk_always_on)
>   		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
>   	gpiod_put(cs35l41->reset_gpio);
> -
> -	return 0;
>   }
>   EXPORT_SYMBOL_GPL(cs35l41_hda_remove);
>   
> diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
> index 76c69a8a22f6..8ecaddf5f132 100644
> --- a/sound/pci/hda/cs35l41_hda.h
> +++ b/sound/pci/hda/cs35l41_hda.h
> @@ -64,6 +64,6 @@ struct cs35l41_hda {
>   
>   int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int irq,
>   		      struct regmap *regmap);
> -int cs35l41_hda_remove(struct device *dev);
> +void cs35l41_hda_remove(struct device *dev);
>   
>   #endif /*__CS35L41_HDA_H__*/
> diff --git a/sound/pci/hda/cs35l41_hda_i2c.c b/sound/pci/hda/cs35l41_hda_i2c.c
> index 4a9462fb5c14..d4240b8ded10 100644
> --- a/sound/pci/hda/cs35l41_hda_i2c.c
> +++ b/sound/pci/hda/cs35l41_hda_i2c.c
> @@ -32,7 +32,9 @@ static int cs35l41_hda_i2c_probe(struct i2c_client *clt, const struct i2c_device
>   
>   static int cs35l41_hda_i2c_remove(struct i2c_client *clt)
>   {
> -	return cs35l41_hda_remove(&clt->dev);
> +	cs35l41_hda_remove(&clt->dev);
> +
> +	return 0;
>   }
>   
>   static const struct i2c_device_id cs35l41_hda_i2c_id[] = {
> diff --git a/sound/pci/hda/cs35l41_hda_spi.c b/sound/pci/hda/cs35l41_hda_spi.c
> index 77426e96c58f..d63c487bc3a9 100644
> --- a/sound/pci/hda/cs35l41_hda_spi.c
> +++ b/sound/pci/hda/cs35l41_hda_spi.c
> @@ -30,7 +30,9 @@ static int cs35l41_hda_spi_probe(struct spi_device *spi)
>   
>   static int cs35l41_hda_spi_remove(struct spi_device *spi)
>   {
> -	return cs35l41_hda_remove(&spi->dev);
> +	cs35l41_hda_remove(&spi->dev);
> +
> +	return 0;
>   }
>   
>   static const struct spi_device_id cs35l41_hda_spi_id[] = {
> 
> base-commit: 0c947b893d69231a9add855939da7c66237ab44f
Reviewed-by: Lucas Tanure <tanureal@opensource.cirrus.com>
