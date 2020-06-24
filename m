Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5494207F2E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 00:10:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 431BE18BE;
	Thu, 25 Jun 2020 00:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 431BE18BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593036631;
	bh=s0N/3oY0dR/eCGJE1yLNFMIKD18MtTaz9x5dXX9ZrfY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IEvcVt/P2SOFDYBZmXXZ2nBf6gQViVGICqP4EcMVkKhR1EEqwxLrIXon40xCJmA+v
	 eVzAQH3etCRm1hu93i22ip8Gf1fPUlwqS1Ct8yWuNQAiOLo7n14nZl87IebDorsbes
	 4KCVvbaMHBUgerxVTBfFgCwvyldalwmEQNGDWuPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5310AF80162;
	Thu, 25 Jun 2020 00:08:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7DCAF8015B; Thu, 25 Jun 2020 00:08:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03FABF8012F
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 00:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03FABF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dew2+X+x"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05OM8bQG066351;
 Wed, 24 Jun 2020 17:08:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1593036517;
 bh=8pxGcSuDGHL5/biPmNuRMj2l3xMNTG6V1WBrzq8DbV8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=dew2+X+xSol3YYZIrkXvLmNttcwE1ukDAiVHz+Vo+ZzGEQpzssCP2gBtVQcMplq3b
 ky9x5liGGAsvAOJtzc+3uop7JlYH0bsBpkeOe/thg+jtwRzT9POJVMmKAj/HQsf+M0
 5l06R3bRbEpFuvwwt1xYrGfe4dKfkyKAgFpWJWkY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05OM8bUj052317
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 24 Jun 2020 17:08:37 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 24
 Jun 2020 17:08:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 24 Jun 2020 17:08:37 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05OM8bgi092136;
 Wed, 24 Jun 2020 17:08:37 -0500
Subject: Re: [PATCH v6 4/7] ASoC: tas2562: Add rx and tx slot programming
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
References: <20200624174932.9604-1-dmurphy@ti.com>
 <20200624174932.9604-5-dmurphy@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <c3c86e7f-de5e-dea1-98de-045bdd564fbc@ti.com>
Date: Wed, 24 Jun 2020 17:08:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200624174932.9604-5-dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: robh@kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
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

Hello

On 6/24/20 12:49 PM, Dan Murphy wrote:
> Add programming for the tdm slots for both tx and rx offsets.
>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   sound/soc/codecs/tas2562.c | 17 ++++++++++++++++-
>   sound/soc/codecs/tas2562.h |  4 ++++
>   2 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
> index d26e30a2948c..2f1d4b697f01 100644
> --- a/sound/soc/codecs/tas2562.c
> +++ b/sound/soc/codecs/tas2562.c
> @@ -208,6 +208,22 @@ static int tas2562_set_dai_tdm_slot(struct snd_soc_dai *dai,
>   	if (ret < 0)
>   		return ret;
>   
> +	if (tx_mask > TAS2562_TX_OFF_MAX) {
> +		dev_err(tas2562->dev, "TX slot is larger then %d",
> +			TAS2562_TX_OFF_MAX);
> +		return -EINVAL;
> +	}
> +
> +	ret = snd_soc_component_update_bits(component, TAS2562_TDM_CFG1,
> +					    TAS2562_RX_OFF_MASK, rx_mask << 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = snd_soc_component_update_bits(component, TAS2562_TDM_CFG4,
> +					    TAS2562_TX_OFF_MASK, tx_mask << 1);
> +	if (ret < 0)
> +		return ret;
> +

I need to fix this patch to remove the slot programming during dai_fmt 
as the code is not correct and resets the slots

Dan


