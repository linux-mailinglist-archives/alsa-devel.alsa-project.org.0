Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEB8756E7F
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 22:41:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AFAAAE9;
	Mon, 17 Jul 2023 22:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AFAAAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689626513;
	bh=1/r/L5stpVG6h+5vKfitneIYxWzQpEKAKaGfjQSkEdQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gz9eLZB98gJxkbbYmUOwWSNv52c1vgDCykIQrZg0o3ZPY4WsnUWSZrig37BeHif9M
	 TAXfzXhNpnizRYlT1iq4IHhzU5sW14QZZGv6wJXezlVRvTvqkJw3sxq7bW8+CtIXpL
	 cYGawTICDAIBTlhqKNBnu0+mCceEFl7YI5CJGbaM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02733F8007E; Mon, 17 Jul 2023 22:41:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C1D7F8032D;
	Mon, 17 Jul 2023 22:41:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49F50F8047D; Mon, 17 Jul 2023 22:40:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EBACF8007E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 22:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EBACF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zS4AGQ1O
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-992ace062f3so703647766b.2
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jul 2023 13:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689626453; x=1692218453;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qsbuf3RPbQPVf+4WdMEnUAqNMgaL0d1YoOJRV82aCKA=;
        b=zS4AGQ1OhUBgX67e8EsFP0sJibDRDHW6Lb+3fISsRExE//XBJ/vSXstkv0nlJOnuC0
         WEsQAN4JBXWjriJupy+P2TSh+O33xP2XYHLxbauifss08CmcCj7w4eiIAhKkU7dbt5HN
         FiR/JHedjlZtN10fs6Cz0d1WqGjBC1Duv1+bLF9VmVhY4hnBwK7mLH+pD6l6V2c9EpRS
         AcOT38EHV43sFx8ev/IpCJGO4DJ/97kpBPzv07jMbHwjC9iRcwGI+mriSnSW3kl25z7v
         zUinoqgrNQdNuZ5MStxDcA9tchmWNYtJbhNFZWwn75YuwH0jloCxmc8e1K4TZoAo/GON
         8TPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689626453; x=1692218453;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qsbuf3RPbQPVf+4WdMEnUAqNMgaL0d1YoOJRV82aCKA=;
        b=XPuUdOipoQGVgsXVRS6OHwcjdJdollEmgLHThT+bNroGF6G7qp+XVqHjm1Pu9W8veV
         AqjS8K70JxRWdw2tQ3ZCoi00TyVU2bm3k1nGgakGThhDHytde5TJ/OigjpLPcAn3Feg2
         k4k0og7oNxrUWfo6RPe6dSaXC3grjXeHc4okMW5FVSNPXwvl8SMiAc2wLlTwCjzCc3rR
         autrDJaZQGO6o/kVwTO3GauiFe/xMMvG33Rb4QL11PMIAnYL80MhqoS1xiW35LLKFQsc
         bXi9ZDnZ6s5PUZeHr0TvnlVcPK/eDIGFwZXRChB95IR6nepfA9Y4scYtTx76/AGbURkO
         p+2g==
X-Gm-Message-State: ABy/qLaz0j+/CPrq/aLqC5Ns8CFRW9Yev3UeBvHBMV2L/qEmi85q2s5V
	+sWHDjCBZ6MOzX5cr9rzv7DF1w==
X-Google-Smtp-Source: 
 APBJJlGZqwMGrv/lBAVXmEwqvyCbJpsT6m6ffvhLAi5J1UvzCHfarcHAvYwQAXY5sZryz5PYEfGn5A==
X-Received: by 2002:a17:906:2201:b0:98d:fc51:b3dd with SMTP id
 s1-20020a170906220100b0098dfc51b3ddmr11477113ejs.41.1689626453324;
        Mon, 17 Jul 2023 13:40:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 w21-20020a1709064a1500b00997d76981e0sm104654eju.208.2023.07.17.13.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 13:40:52 -0700 (PDT)
Message-ID: <98292541-8435-53cb-22d9-716ed6541485@linaro.org>
Date: Mon, 17 Jul 2023 22:40:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V1 3/5] ASoC: codecs: ACF bin parsing and check library
 file for aw88261
Content-Language: en-US
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com, rf@opensource.cirrus.co,
 shumingf@realtek.com, herve.codina@bootlin.com, flatmax@flatmax.com,
 ckeepax@opensource.cirrus.com, doug@schmorgal.com, fido_max@inbox.ru,
 pierre-louis.bossart@linux.intel.com, kiseok.jo@irondevice.com,
 liweilei@awinic.com, colin.i.king@gmail.com, trix@redhat.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: yijiangtao@awinic.com, zhangjianming@awinic.com
References: <20230717115845.297991-1-wangweidong.a@awinic.com>
 <20230717115845.297991-4-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230717115845.297991-4-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CWHQQ4SJY5425TS5ZQJCIIZQQF66B3V4
X-Message-ID-Hash: CWHQQ4SJY5425TS5ZQJCIIZQQF66B3V4
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWHQQ4SJY5425TS5ZQJCIIZQQF66B3V4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/07/2023 13:58, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> The AW88261 is an I2S/TDM input, high efficiency
> digital Smart K audio amplifier with an integrated 10.25V
> smart boost convert

So all your commits are doing the same?

> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  sound/soc/codecs/aw88261/aw88261_lib.c | 997 +++++++++++++++++++++++++
>  sound/soc/codecs/aw88261/aw88261_lib.h |  91 +++
>  2 files changed, 1088 insertions(+)
>  create mode 100644 sound/soc/codecs/aw88261/aw88261_lib.c
>  create mode 100644 sound/soc/codecs/aw88261/aw88261_lib.h
> 
> diff --git a/sound/soc/codecs/aw88261/aw88261_lib.c b/sound/soc/codecs/aw88261/aw88261_lib.c
> new file mode 100644
> index 000000000000..b8f00708dacf
> --- /dev/null
> +++ b/sound/soc/codecs/aw88261/aw88261_lib.c
> @@ -0,0 +1,997 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// aw88261_lib.c  -- ACF bin parsing and check library file for aw88261
> +//
> +// Copyright (c) 2023 awinic Technology CO., LTD
> +//
> +// Author: Jimmy Zhang <zhangjianming@awinic.com>
> +// Author: Weidong Wang <wangweidong.a@awinic.com>
> +//
> +
> +#include <linux/crc8.h>
> +#include <linux/i2c.h>
> +#include "aw88261_lib.h"
> +#include "aw88261_device.h"
> +
> +#define AW88261_CRC8_POLYNOMIAL 0x8C
> +DECLARE_CRC8_TABLE(aw_crc8_table);
> +
> +static char *profile_name[AW88261_PROFILE_MAX] = {

Cannot be const char *?

...

> +EXPORT_SYMBOL_GPL(aw88261_dev_load_acf_check);

Why?



Best regards,
Krzysztof

