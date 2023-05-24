Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C66C37125C8
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 13:44:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6C8A82C;
	Fri, 26 May 2023 13:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6C8A82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685101444;
	bh=jrNaUKV55pYJB5mKAAv6IabDAOzlS6+ZNJsdjzsVunA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bMOPRB3yScNS34WMa9wZHDNdViytSuBpT6Z5HtvqMbqiJrulGx1juhX18W6H+/0qn
	 RHRBwXnPKr3Rc0Lk0MY++3zdbUX8V4Sp+NcMcCkVVbnLt9ycaRpMZLU3LLJCsLtKvl
	 UUSkfwAAKVlND/iJ2wsAobV6r07NGOJ5dBM2vYKE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46272F8026A; Fri, 26 May 2023 13:42:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B57B7F8026A;
	Fri, 26 May 2023 13:42:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D385BF80552; Wed, 24 May 2023 16:12:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B75F7F80549
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 16:12:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B75F7F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=LHhbslmT
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f60e536250so13312675e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 24 May 2023 07:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684937560;
 x=1687529560;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zm+/ZRBOZldlqL53b66Kc1VMqiVBWlw5REXJ3gKRg4Y=;
        b=LHhbslmTHVtT9aRVJDuMWr6LDB2MF3ACI6tD/x5vOsxgQkBYgqvwDD2fM+JU9yS1rR
         XzvkbnASGuJZNpMiKuI2/qFlqr16uMdAr8lTmipfrNJb6s/OVD8XXt9gOBHYaPg/xnR6
         B6iJpZtoz1xSwOhBJMS1ND9SZv6/Ekphr0o7uDD2vsM7YYmyvFT+Fe4QprO+akeUiG81
         5TpJskzGdjOImOoOwC/fPDAGUD5jOnCl7oGrQ95IAJMqiik4rjNWC8EVUculVpwDP3Dp
         /2dVOwmVQ6isKH5XKbxJzxmAJGeP4NF0aaOh5tW8/GzYrRbooI3r6d8C9kyvJyTeU1I0
         RUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684937560; x=1687529560;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zm+/ZRBOZldlqL53b66Kc1VMqiVBWlw5REXJ3gKRg4Y=;
        b=UhQLl4H0d7huWskxEThMlg9x7hoKq1dun/3BX+v8xHHoBu7gXNjBQwdcafxRAQyMFU
         mwGaWz2mULTvkXRhlsdlTgt73vL00RNJGS2WMvCp9S8gqgnmoRWu+mm2E81VV9SVX+9l
         +0ivRFvuGYNfZkYS+1QwvOSZ/ClT2iykI6mybP65/mxbJRp0xiy2ZzwKVbP3b1ZY+//e
         EhYg6luHPAZsILG58P+w7SqSnWW71fu7gqfMBhhldksC/ghzpoBPSK3DM/KXCju7D5Yg
         vTZlgL8po8CtHiFO4BQ0VIpduWQvbuIuTakFIQbrWDnIsAaxNNWJXUFN9WCv7MG1OYPy
         6rfw==
X-Gm-Message-State: AC+VfDyKEwAIJ9uzNScHbukGJ6jel6GSz320qowaPxXeKft3WnpTByn9
	rBPmwSA7mvr/p4BFjrfHDzJe/g==
X-Google-Smtp-Source: 
 ACHHUZ7ZiBQArVsrxbnbOPfcgyP4nY6sB/SNzM2bGxT5NtG/F1Eh5MP/d2t7lgX/aqnh4urNKvrplQ==
X-Received: by 2002:a7b:cbc9:0:b0:3f6:84:3df6 with SMTP id
 n9-20020a7bcbc9000000b003f600843df6mr9846304wmi.10.1684937560071;
        Wed, 24 May 2023 07:12:40 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 13-20020a05600c24cd00b003f4dde07956sm2444460wmu.42.2023.05.24.07.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 07:12:39 -0700 (PDT)
Message-ID: <cb2e035d-2630-2eca-3f15-b04e4d81c699@baylibre.com>
Date: Wed, 24 May 2023 16:12:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 4/7] ASoC: mediatek: common: soundcard driver add
 dai_fmt support
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
 <20230523021933.3422-5-trevor.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230523021933.3422-5-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VCFRHONWG3PQB6MW7DZ6ULLX53URMZYE
X-Message-ID-Hash: VCFRHONWG3PQB6MW7DZ6ULLX53URMZYE
X-Mailman-Approved-At: Fri, 26 May 2023 11:42:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCFRHONWG3PQB6MW7DZ6ULLX53URMZYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/05/2023 04:19, Trevor Wu wrote:
> There are two changes included in the patch.
> 
> First, add set_dailink_daifmt() function, so dai_fmt can be updated by
> the configuration in dai-link sub node.
> 
> Second, remove codec phandle from required property in dai-link sub node.
> For example, user possibly needs to update dai-format for all etdm
> co-clock dai-links, but codec doesn't need to be specified in capture
> dai-link for a speaker amp.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   .../mediatek/common/mtk-soundcard-driver.c    | 49 ++++++++++++++++++-
>   1 file changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
> index 738093451ccb..5e291092046b 100644
> --- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
> +++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
> @@ -22,7 +22,7 @@ static int set_card_codec_info(struct snd_soc_card *card,
>   
>   	codec_node = of_get_child_by_name(sub_node, "codec");
>   	if (!codec_node)
> -		return -EINVAL;

IMO, the debug or info print should be welcome here because the behavior
change: dai link info parse will not stop if the codec node is NULL.
That could help to understand what is happening during init.



Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

