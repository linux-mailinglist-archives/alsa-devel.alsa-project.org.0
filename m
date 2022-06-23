Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A56557867
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 13:07:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 819151EF3;
	Thu, 23 Jun 2022 13:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 819151EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655982425;
	bh=m7MZZk96AFlMIvBh5BkmSfCjeTcJKvyFp6SEri010Oo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aQ08mmyZC9fTCG0ducCK+VQKznh8KFRZpMIWwNCrmWnoqctYTZ4mcypsGievhFSQX
	 FdRlOqhOMP0ld0p4/Kht3SGYmNaXojJNQfqdPE0WoYEoNGYfbInfR/R/WaTYvSfLSI
	 AC/XmzlbCG99pxdbUjOAfWuI8LGgfNSsEgUMDuVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E771F8055B;
	Thu, 23 Jun 2022 13:04:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5004DF804C1; Thu, 23 Jun 2022 11:03:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98008F800CB
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 11:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98008F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="N+E4E6aB"
Received: by mail-lj1-x231.google.com with SMTP id e4so22506798ljl.1
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ozaotd6LY3ERvzpwuGvbQZTaC8kPny1azl5sB1Hldp8=;
 b=N+E4E6aBHykbEoIC0lGs7IRiK7feaBLf/CkLd78oSXziwtTtGtoy3tXA3mN4u+M1+H
 2lEeyKhEQm7uMBzKjVgfV32iv3ycYBLlXefCytlCiYeWvc1vlkkqeVdHyvQa/4I7awPw
 +yqS6OsEIt1tCt5xFxEtaCt0oLEVSvoZwtAwW4dIcdORniXK5c03omQkgHXW3VVUbG5+
 pCxDaxADdI5OOyGHM8VigOdxW8fFm9ClSBdiUkl8+LnNLmV81U1i7QDLpG5qCPGM/ib4
 ezVP1RIDjW8Fye2pDE0ph9F+Vj4aLCnvOMeonKSMKU9+nmoEZVsNcW8/ABtqbLZ0wEk1
 ujjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ozaotd6LY3ERvzpwuGvbQZTaC8kPny1azl5sB1Hldp8=;
 b=dhRVNyRq9MN4YnioGjecLLOhZ4oMri+eRewaDK/i+XAi7ZCJnMgXcHa4iSvvnpWOyF
 dEq0i7OMeon7WShZXdPLOgHAFl163r1ufJDfXALSkQS+mfE2zZ616ODuzsyKtbwtM1P5
 DdciDgNixSXBumAL7gndVQR0MOOTXVnhutxU6mPB4/3w5ou632ipt5FhwqKcO2r6hB/y
 0uHLjPfsOyeGKEl84fCkRw4Oyq2YaIisGYZo3herwd3+6R0QQz2EV11ZOApkT8hktOLa
 MqjYDRVaUq/g121m7s4DZ2iAhvLslaJIly7UfoVDEj59juxbkrjpKlmlM1ht7otVUjbU
 ar0A==
X-Gm-Message-State: AJIora+GyYmxuWn6mxPclwQj1IXbRjPLs0qvp6N9fd6AMN/T+AWR5zzv
 Cg0sGGgo0tKtBEwb1ZiDErs=
X-Google-Smtp-Source: AGRyM1vF1zU4Gj87rqZsJvaSlU5/WAIf+VWD8fk9zG8OB0wQ+t7uncoazUPPDPmBI+qN6/ToK7aL7g==
X-Received: by 2002:a05:651c:1609:b0:25a:86a5:9eab with SMTP id
 f9-20020a05651c160900b0025a86a59eabmr4055972ljq.61.1655975028288; 
 Thu, 23 Jun 2022 02:03:48 -0700 (PDT)
Received: from [172.16.189.61] ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a05651c201000b0025a73f7aa3bsm1153452ljo.96.2022.06.23.02.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 02:03:47 -0700 (PDT)
Message-ID: <415e6876-9304-9493-369e-d5eca0238bea@gmail.com>
Date: Thu, 23 Jun 2022 12:03:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 02/49] regmap-irq: Fix offset/index mismatch in
 read_sub_irq_data()
Content-Language: en-US
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, broonie@kernel.org
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <20220620200644.1961936-3-aidanmacdonald.0x0@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20220620200644.1961936-3-aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 23 Jun 2022 13:04:32 +0200
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, rafael@kernel.org,
 linus.walleij@linaro.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, myungjoo.ham@samsung.com, lee.jones@linaro.org,
 samuel@sholland.org, maz@kernel.org, brgl@bgdev.pl, mani@kernel.org,
 krzysztof.kozlowski@linaro.org, jernej.skrabec@gmail.com,
 cw00.choi@samsung.com, wens@csie.org, agross@kernel.org, orsonzhai@gmail.com,
 linux-sunxi@lists.linux.dev, b.zolnierkie@samsung.com,
 linux-arm-msm@vger.kernel.org, tharvey@gateworks.com,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, tiwai@suse.com,
 tglx@linutronix.de, cristian.ciocaltea@gmail.com,
 linux-arm-kernel@lists.infradead.org, rjones@gateworks.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 michael@walle.cc, zhang.lyra@gmail.com, baolin.wang7@gmail.com,
 mazziesaccount@gmail.com
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

On 6/20/22 23:05, Aidan MacDonald wrote:
> We need to divide the sub-irq status register offset by register
> stride to get an index for the status buffer to avoid an out of
> bounds write when the register stride is greater than 1.
> 
> Fixes: a2d21848d921 ("regmap: regmap-irq: Add main status register support")
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>   drivers/base/regmap/regmap-irq.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
> index 4f785bc7981c..a6db605707b0 100644
> --- a/drivers/base/regmap/regmap-irq.c
> +++ b/drivers/base/regmap/regmap-irq.c
> @@ -387,6 +387,7 @@ static inline int read_sub_irq_data(struct regmap_irq_chip_data *data,
>   		subreg = &chip->sub_reg_offsets[b];
>   		for (i = 0; i < subreg->num_regs; i++) {
>   			unsigned int offset = subreg->offset[i];
> +			unsigned int index = offset / map->reg_stride;
>   
>   			if (chip->not_fixed_stride)
>   				ret = regmap_read(map,
> @@ -395,7 +396,7 @@ static inline int read_sub_irq_data(struct regmap_irq_chip_data *data,
>   			else
>   				ret = regmap_read(map,
>   						chip->status_base + offset,
> -						&data->status_buf[offset]);
> +						&data->status_buf[index]);
>   
>   			if (ret)
>   				break;

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));
