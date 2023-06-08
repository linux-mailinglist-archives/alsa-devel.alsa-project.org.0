Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48393729D56
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:52:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F162857;
	Fri,  9 Jun 2023 16:51:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F162857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322333;
	bh=p+9PC0msxgulaw0kUPQjcFmAXXcZj54dyZVDOO3+x1U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NPn6a4kU0Ll36P2RBHCyzsDS7FEz58BcgCTtCrglxqNXCRj9BVizb3KCHge7dXu5r
	 C+rTYy6vGL9blGgNiat55tKkpxOuZ4Z1XwGHjkf09kTowbvicZMo+eQeCpFi6cxPAy
	 4TyRss7nABWRHzvCDpAYxyl6oIIPT1VfO722HtKM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23C06F80618; Fri,  9 Jun 2023 16:47:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2617F80615;
	Fri,  9 Jun 2023 16:47:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69E5BF80199; Thu,  8 Jun 2023 11:51:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05A4DF80155
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 11:50:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05A4DF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=PpYoQ9yB
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-30ae5f2ac94so424070f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Jun 2023 02:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686217835;
 x=1688809835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BwfV7uve9JHvQ7KPIcuTdH5iXAupAcOmFZXka/qb7TE=;
        b=PpYoQ9yBVRw2vZUWFh2CmtHT2Hf537cbytt50hvfTVoPmF9Gk4gIoqksRA90soEjgT
         BJJUPYAibqGWlmew06C33ldDMSj9lAhFsIadnFoo4f9ywI2khZtxKVd959gjiVf8d84G
         /cQfPbgAt3rK+8fYSrJi2T1sM9TFSEkemPr0raVGVnxl39pmXPzInTP70Toq4HrLbXlF
         s66rtbskCNwdz9Pm8NDo6yRs9R+sqGG+njr5DbsW32pKBcJ6aOpZ9HcWJbXHgguMKqQQ
         Iom8RjZLir4TsGAMTJ6Yxq9WQxxyLk7XSWLw1aqKJ1G50LYHOSPlnbGIEHZiJRw1Q/Rh
         31YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686217835; x=1688809835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BwfV7uve9JHvQ7KPIcuTdH5iXAupAcOmFZXka/qb7TE=;
        b=KjdRITkECJ0AKiRkmBQhFeBG45PkgmxVlzuyGaFK1O8c8tklfqawnBuaaR9i4iFnNb
         Wi2ZKOm4yeLaXPZeIExWsjEpd6lHq3YF5bLeLesE8x5NYAG6vv/zYSJHxdRQQ+RYaEYd
         4Vuebs5xj8o2gqNBFylHOaX7EN9yCzqdC5zXkA7IGswjRrwoob36AvpcEQ5Rt+nWiPCl
         T8ZT7u+yxJ1261AfmjBBBVdiZHODslQ38XnaPTFqCuY5YYxtf3EXxG8d4hPBLCVxduup
         GXcaXkaXO1zovOKpcsJz/Pi4B2V8bxq8TdpuRNIhy6uyNHy1E03VGeyabOEBdtylONs0
         E5hQ==
X-Gm-Message-State: AC+VfDwwH295TVKF4XADoNafrRuPK9Y5RIe7stdkubuf/ybXb48vXiNC
	ra6c3oJggy2aA7uGQPxicKohkw==
X-Google-Smtp-Source: 
 ACHHUZ7vePKIJ7//4HDDmBh8tZbIexRsI4k41AJwSBLsN64OpFI6fQf5Jj3sbWscK45AtGmBnqt/1w==
X-Received: by 2002:adf:d84e:0:b0:307:82e3:70cd with SMTP id
 k14-20020adfd84e000000b0030782e370cdmr7002149wrl.14.1686217834930;
        Thu, 08 Jun 2023 02:50:34 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 x15-20020a5d650f000000b0030adfa48e1esm1071530wru.29.2023.06.08.02.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 02:50:34 -0700 (PDT)
Message-ID: <8bbbc852-6139-29d4-417c-a2d9c77c192f@baylibre.com>
Date: Thu, 8 Jun 2023 11:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/5] ASoC: mediatek: mt8188-mt6359: Use bitfield macros
 for registers
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, dan.carpenter@linaro.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
 <20230608084727.74403-6-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230608084727.74403-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4R6N7SHO5NZXRSRUNVMZE7GMHRP5TMJO
X-Message-ID-Hash: 4R6N7SHO5NZXRSRUNVMZE7GMHRP5TMJO
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:47:10 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4R6N7SHO5NZXRSRUNVMZE7GMHRP5TMJO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/06/2023 10:47, AngeloGioacchino Del Regno wrote:
> Replace open coded instances of FIELD_GET() with it, move register
> definitions at the top of the file and also replace magic numbers
> with register definitions.
> 
> While at it, also change a regmap_update_bits() call to regmap_write()
> because the top 29 bits of AUD_TOP_CFG (31:3) are reserved (unused).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 32 ++++++++++++++---------
>   1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> index 5b2660139421..ac69c23e0da1 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -6,6 +6,7 @@
>    * Author: Trevor Wu <trevor.wu@mediatek.com>
>    */
>   
> +#include <linux/bitfield.h>
>   #include <linux/input.h>
>   #include <linux/module.h>
>   #include <linux/of_device.h>
> @@ -19,6 +20,15 @@
>   #include "../common/mtk-afe-platform-driver.h"
>   #include "../common/mtk-soundcard-driver.h"
>   
> +#define CKSYS_AUD_TOP_CFG	0x032c
> + #define RG_TEST_ON		BIT(0)
> + #define RG_TEST_TYPE		BIT(2)
> +#define CKSYS_AUD_TOP_MON	0x0330
> + #define TEST_MISO_COUNT_1	GENMASK(3, 0)
> + #define TEST_MISO_COUNT_2	GENMASK(7, 4)
> + #define TEST_MISO_DONE_1	BIT(28)
> + #define TEST_MISO_DONE_2	BIT(29)
> +
>   #define NAU8825_HS_PRESENT	BIT(0)
>   
>   /*
> @@ -251,9 +261,6 @@ static const struct snd_kcontrol_new mt8188_nau8825_controls[] = {
>   	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
>   };
>   
> -#define CKSYS_AUD_TOP_CFG 0x032c
> -#define CKSYS_AUD_TOP_MON 0x0330
> -
>   static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>   {
>   	struct snd_soc_component *cmpnt_afe =
> @@ -265,13 +272,13 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>   	struct mtkaif_param *param;
>   	int chosen_phase_1, chosen_phase_2;
>   	int prev_cycle_1, prev_cycle_2;
> -	int test_done_1, test_done_2;
> +	u8 test_done_1, test_done_2;
>   	int cycle_1, cycle_2;

Shouldn't be unsigned too ?

I'm wondering if it would be better (probably in another patch) to 
change the data type of the other variables too, to match their 
use-case. (maybe it's already the case, I'm just wondering)

>   	int mtkaif_chosen_phase[MT8188_MTKAIF_MISO_NUM];
>   	int mtkaif_phase_cycle[MT8188_MTKAIF_MISO_NUM];
>   	int mtkaif_calibration_num_phase;
>   	bool mtkaif_calibration_ok;
> -	unsigned int monitor = 0;
> +	u32 monitor = 0;
>   	int counter;
>   	int phase;
>   	int i;
> @@ -303,8 +310,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>   	mt6359_mtkaif_calibration_enable(cmpnt_codec);
>   
>   	/* set test type to synchronizer pulse */
> -	regmap_update_bits(afe_priv->topckgen,
> -			   CKSYS_AUD_TOP_CFG, 0xffff, 0x4);
> +	regmap_write(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, RG_TEST_TYPE);
>   	mtkaif_calibration_num_phase = 42;	/* mt6359: 0 ~ 42 */
>   	mtkaif_calibration_ok = true;
>   
> @@ -314,7 +320,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>   		mt6359_set_mtkaif_calibration_phase(cmpnt_codec,
>   						    phase, phase, phase);
>   
> -		regmap_set_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, 0x1);
> +		regmap_set_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, RG_TEST_ON);
>   
>   		test_done_1 = 0;
>   		test_done_2 = 0;
> @@ -326,14 +332,14 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>   		while (!(test_done_1 & test_done_2)) {
>   			regmap_read(afe_priv->topckgen,
>   				    CKSYS_AUD_TOP_MON, &monitor);
> -			test_done_1 = (monitor >> 28) & 0x1;
> -			test_done_2 = (monitor >> 29) & 0x1;
> +			test_done_1 = FIELD_GET(TEST_MISO_DONE_1, monitor);
> +			test_done_2 = FIELD_GET(TEST_MISO_DONE_2, monitor);
>   
>   			if (test_done_1 == 1)
> -				cycle_1 = monitor & 0xf;
> +				cycle_1 = FIELD_GET(TEST_MISO_COUNT_1, monitor);
>   
>   			if (test_done_2 == 1)
> -				cycle_2 = (monitor >> 4) & 0xf;
> +				cycle_2 = FIELD_GET(TEST_MISO_COUNT_2, monitor);
>   
>   			/* handle if never test done */
>   			if (++counter > 10000) {
> @@ -361,7 +367,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>   			mtkaif_phase_cycle[MT8188_MTKAIF_MISO_1] = prev_cycle_2;
>   		}
>   
> -		regmap_clear_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, 0x1);
> +		regmap_clear_bits(afe_priv->topckgen, CKSYS_AUD_TOP_CFG, RG_TEST_ON);
>   
>   		if (mtkaif_chosen_phase[MT8188_MTKAIF_MISO_0] >= 0 &&
>   		    mtkaif_chosen_phase[MT8188_MTKAIF_MISO_1] >= 0)

After that:

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

