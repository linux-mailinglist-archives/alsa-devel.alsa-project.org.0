Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CAB1D745E
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 11:51:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FDFD16CE;
	Mon, 18 May 2020 11:50:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FDFD16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589795491;
	bh=th4/YmylM3TpoWfXXlSk+HbmJ5ijq7G/PoyxjWf7/cI=;
	h=Subject:To:References:From:Date:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=YMTfYS6QxaodTEanAtkmfgGI8oQ5E2vZPiEILo2u+Wx5/NuBe6dwX0IkzdQY7RCbG
	 EfB/obWc0cVjxdQrpmtW6alzetH9McswyMWTO4bvspwrrvrd90as6GcS7X9izZfbud
	 MI0JzUK2pSMUR9bQPQe0Yuxw9go2srI86A0K1wkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B71AAF801F9;
	Mon, 18 May 2020 11:49:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3886F801DA; Mon, 18 May 2020 11:49:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4E10F8015C
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 11:49:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4E10F8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="chu9Reaj"
Received: by mail-wr1-x443.google.com with SMTP id s8so11031788wrt.9
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 02:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=ENajwhYLgh6sOiUIP9e6Xj0EhfOD2GHJT5X8M/vf8Bk=;
 b=chu9ReajW6HqxpiFU5X/Xq7ycdbAJTYXqrXhd/98jAkFWbBicg3eCnxNwkS81jVo1d
 9qXWhcMySsBbOn0orMwWV6SbBNZclVKmJ5S22Avx1W8yBWJO9mB3RQYfp/P7zaKT44ht
 PhyEImaP0Bc0xSGqE3OpaU0M1c34EndgWocJ7zSYMIQmKoTLIKET/bH1Td/X8hT/g9Jn
 aoZfyWIDZgBc7ZIVrctUbu/HP4PjDd9l/aYVkmv6enQioY8Ms7J6TbY8n/cH8XnKGoEf
 XO/VKcTbXghBNlFDxM+yYD4Y/i/sHc3sfjjx3kqTG973fFRXDcveox2xsDCoWD70wYfV
 agUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=ENajwhYLgh6sOiUIP9e6Xj0EhfOD2GHJT5X8M/vf8Bk=;
 b=eT2g6doSFb/MenqgW5CkEJXtaIyHJloS0bqlkOPDLDYhh4f1oMKoUksPKumQsnHPAj
 qoY00o+IeIiiIlFYoc3etlKhekM2dwHVvh50w445aUTW3ji+8kKV62UJtpUiDq8neTIT
 ZDYuYk5siDAdfbuGQoet/hxoBWZeNVZTEFOBkLnqLSYyPIAa4INdkg7bQYA43OrFMuGu
 /aTK+PXsvwECgpSv3RrdXC2TaDynVuwykC7tBazamTtvIOtdJyBbaYEWugLDPdeDahRS
 yVNUyL+xOmAzqRRasS0mmfFOynhzECvKSFNpI+Mi6MtQH6n8lB5lEu5gX7kJl7OYMNII
 f9Yg==
X-Gm-Message-State: AOAM533XwklXXwZ6M/Diz/uouELF5zah18Quz9uYYvkbRKWZg7Dwk1tY
 RtX9xYOygRRX0Gpt4gDxIeGm5FiyRgw=
X-Google-Smtp-Source: ABdhPJx2XKbq7KkL41aumny2mb2gN4FSdUPlh42S2nUjjgI6dDC3vnddICzIiSo0P7gUCnJZQXDTsA==
X-Received: by 2002:a5d:4ed0:: with SMTP id s16mr20122647wrv.166.1589795377819; 
 Mon, 18 May 2020 02:49:37 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id f128sm16679392wme.1.2020.05.18.02.49.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 02:49:37 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] ASoC: qcom: lpass: Use regmap_field for i2sctl and
 dmactl registers
To: Ajit Pandey <ajitp@codeaurora.org>, broonie@kernel.org,
 plai@codeaurora.org, bgoswami@codeaurora.org
References: =?UTF-8?Q?=3c=1c1586592171-31644-1-git-send-email-ajitp=40codeau?=
 =?UTF-8?Q?rora=2eorg=1d=3e_=3c1589474298-29437-1-git-send-email-ajitp=40cod?=
 =?UTF-8?Q?eaurora=2eorg=3e_=3c1589474298-29437-5-git-send-email-ajitp=40cod?=
 =?UTF-8?Q?eaurora=2eorg=3e?=
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a3527251-cafd-6d8f-3f96-0549b220af09@linaro.org>
Date: Mon, 18 May 2020 10:49:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
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



On 14/05/2020 17:38, Ajit Pandey wrote:
> I2SCTL and DMACTL registers has different bits alignment for newer
> LPASS variants of SC7180 soc. Instead of adding extra overhead for
> calculating masks and shifts for newer variants registers layout we
> changed the approach to use regmap_field_write() API to update bit.
> Such API's will internally do the required bit shift and mask based
> on reg_field struct defined for bit fields. We'll define REG_FIELD()
> macros with bit layout for both lpass variants and use such macros
> to initialize register fields in variant specific driver callbacks.
> Also added new bitfieds values for I2SCTL and DMACTL registers and
> removed shifts and mask macros for such registers from header file.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-apq8016.c   |  61 ++++++++++++
>   sound/soc/qcom/lpass-cpu.c       | 114 +++++++++++++---------
>   sound/soc/qcom/lpass-lpaif-reg.h | 203 ++++++++++++++++++++++++---------------
>   sound/soc/qcom/lpass-platform.c  |  86 +++++++++++------
>   sound/soc/qcom/lpass.h           |  30 ++++++
>   5 files changed, 340 insertions(+), 154 deletions(-)
> 

Thanks for moving this to regmap fields, looks clean!
However this patch just removed support to lpass-ipq806x.c variant, 
which should to be taken care of while doing patches that apply to all 
variants.


> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index 8210e37..3149645 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -124,6 +124,32 @@
>   	},
>   };
>   
> +static int apq8016_init_dmactl_bitfields(struct lpaif_dmactl *dmactl,
> +					 struct regmap *map,
> +					 unsigned int reg)
> +{
> +	struct reg_field bursten = DMACTL_BURSTEN_FLD(reg);
> +	struct reg_field wpscnt = DMACTL_WPSCNT_FLD(reg);
> +	struct reg_field fifowm = DMACTL_FIFOWM_FLD(reg);
> +	struct reg_field intf = DMACTL_AUDINTF_FLD(reg);
> +	struct reg_field enable = DMACTL_ENABLE_FLD(reg);
> +	struct reg_field dyncclk = DMACTL_DYNCLK_FLD(reg);
> +
> +	dmactl->bursten = regmap_field_alloc(map, bursten);
> +	dmactl->wpscnt = regmap_field_alloc(map, wpscnt);
> +	dmactl->fifowm = regmap_field_alloc(map, fifowm);
> +	dmactl->intf = regmap_field_alloc(map, intf);
> +	dmactl->enable = regmap_field_alloc(map, enable);
> +	dmactl->dyncclk = regmap_field_alloc(map, dyncclk);

My idea was to move this all regmap fields to variant structure and 
common code will do the regmap_filed_alloc rather than each variant 
duplicating the same code for each variant, also am guessing some of the 
members in the lpass_variant structure tp become redundant due to regmap 
field which can be removed as well.

ex :

struct lpass_variant {
	...
	struct reg_field bursten
	...
};

in lpass-apq8016.c

we do
static struct lpass_variant apq8016_data = {

	.bursten = REG_FIELD(reg, 11, 11),
	...
}

in lpass-cpu.c we can do the real regmap_field_alloc	
asoc_qcom_lpass_cpu_platform_probe



> +
> +	if (IS_ERR(dmactl->bursten) || IS_ERR(dmactl->wpscnt) ||
> +	    IS_ERR(dmactl->fifowm) || IS_ERR(dmactl->intf) ||
> +	    IS_ERR(dmactl->enable) || IS_ERR(dmactl->dyncclk))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>   static int apq8016_lpass_alloc_dma_channel(struct lpass_data *drvdata,
>   					   int direction)
>   {
> @@ -158,6 +184,39 @@ static int apq8016_lpass_free_dma_channel(struct lpass_data *drvdata, int chan)
>   	return 0;
>   }
>   
> +static int sc7180_init_i2sctl_bitfields(struct lpaif_i2sctl *i2sctl,
> +					struct regmap *map, unsigned int reg)
> +{
Should this be apq8016_init_i2sctl_bitfields

Please make sure that you compile the code before sending it out!

--srini

> 
