Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E72905A83
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 20:14:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68AFEDFA;
	Wed, 12 Jun 2024 20:13:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68AFEDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718216041;
	bh=/ShJS2RsD6IOV3S0b7xD5uM3uAGmHGRcmp6lYjD4Rs0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eQiFS/kGUpvD9wkyDlEAtTCjtvkpwZ5wNsT324rm6QlAFy1lRxTQHq7M1H/yXozO4
	 4migniPT4jx2NnE/6eK/OzETcuRGM1vdnTmB7gU12vLBXw8uI9LRWHkxVUAUY64LqU
	 qdlNXDoFs4MDySG3t2GsjiKvHX+tUd625ZgxUAoI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03265F805B0; Wed, 12 Jun 2024 20:13:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A64C4F805B4;
	Wed, 12 Jun 2024 20:13:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB4FFF8057A; Wed, 12 Jun 2024 20:13:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98F14F80496
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 20:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98F14F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kYZs5Mh3
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-dfe1aa7cce2so195363276.1
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 11:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718215994; x=1718820794;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vk/PriGPmFJoIWbwcdF3L4d1fQIDRSRyN4fnZfXOrQ8=;
        b=kYZs5Mh3tA0c7KFtDjgmHtw0RvJxW2nUGYqUhFr9FagCMXn4+A38+PxMAz0xSzhhVi
         v5Buwzhfzbo93d5Q738JTQOLsumW0FldCLes3kz8uIfZ8Ei5oqayorWN1+LXAo3vC+/V
         s3WWBx6BMn1xvNirK+6pJvcjNaNZ2phqlQJkkW6ICcob1HHdxlCXmYQoaWQIaELB/y+D
         QgACTpGAJ/AJFcVYvwesa/pfR4Iazww1d3yr8lUA99Jc19IxPd9divQlNcSrA+zHYe7X
         NQnWtTlHO7zEoitOTWjLHMjUCKKE0psmhXEItkGccU1kUaUPW7Fwlx2PK5ZyunLN+Sxh
         hMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718215994; x=1718820794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vk/PriGPmFJoIWbwcdF3L4d1fQIDRSRyN4fnZfXOrQ8=;
        b=XAaNhClYsyfVDG0eCi88u9+khSE72shM7Gs5tGIVtJ4UCgHCdntBIEC3588S16XQPX
         2gXp4cao6R019rnefmNgLhqCfhmhW2uNERNaW/PojzrfbfYwtoAKdG3SH9DQo+JKLP72
         DgcIrD0b3XZHCbagXNyQUTxVF9ciYcMNKzv+376GkWTDSwHbbWcuqkTzaahHzc7/Vt7t
         xGTZHR78/akD9L7NqdVz09Z3rrSFXI2lyKYn+CZM6i16mtX0x/ENA8FMl3ZkRLDYc1Uc
         qMn0CFtITTXJUTithuJmm/sSdBqBmgV3mie4s+1OOA6zh54EWOvb7DV4juiBD2ELsBfE
         2oDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN5bLza/alfIdHjP8GVwR5VL91Vawr3DLU1hj6vuJm796sjQjhIZBz49EFuSU0eGSpTHrdTQkdqxMVGtbQx23MmJSWRPlermAtuLA=
X-Gm-Message-State: AOJu0YyZdSDioKEcCxXLc4zZN1dUsrC0Jsqfq8slbpdafCwIp6rImJTq
	vCUD3qCyeRZFqfPqKFWMakyghT3uE/1IZRoJ1oTFd2x4Jt3+0HsK6oORRle3k9FZ0Y1r+E72Cfw
	yuERucwLnngKBwF0lnKeQ6YTKEgtuYiEzlfT8Vg==
X-Google-Smtp-Source: 
 AGHT+IF6/xz9wzOXAOOEVpHYVAwPbs/GJXPgfY0I46o2OvJeO1Svt93Jr+6EnXSV8J5OKndG7JusmWzs8eeebNU7YDI=
X-Received: by 2002:a25:aac5:0:b0:dc2:5553:ca12 with SMTP id
 3f1490d57ef6-dfe66175fdbmr2383958276.14.1718215994315; Wed, 12 Jun 2024
 11:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
 <20240606122559.116698-3-srinivas.kandagatla@linaro.org>
 <qjyuvejxvjfanhqi3xpgobqjuugh52okxiutdprprx43emee7t@gzh7go6yc77z>
 <5bf5ee5e-d24f-476f-9500-9d1b7adcfc72@linaro.org>
 <mpm4pmt5ieofmpxmq5putvytyuiepbmnv5flsfqiwbtc54sb6k@jpoeaeojzzis>
 <171afc10-b69b-4c76-be34-7e93ec03355c@linaro.org>
In-Reply-To: <171afc10-b69b-4c76-be34-7e93ec03355c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jun 2024 21:13:03 +0300
Message-ID: 
 <CAA8EJpowb5eRdDH9HjiWoN5_n+VMd+sVkyx8fiuUTc5QYbxq0g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: codec: lpass-rx-macro: add suppor for 2.5
 codec version
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org, neil.armstrong@linaro.org,
	krzysztof.kozlowski@linaro.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: KP4A54M5ZBAEPYX3VWCK2XVHEKLFJVSH
X-Message-ID-Hash: KP4A54M5ZBAEPYX3VWCK2XVHEKLFJVSH
X-MailFrom: dmitry.baryshkov@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KP4A54M5ZBAEPYX3VWCK2XVHEKLFJVSH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jun 2024 at 20:09, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 12/06/2024 17:52, Dmitry Baryshkov wrote:
> > On Wed, Jun 12, 2024 at 03:37:56PM +0100, Srinivas Kandagatla wrote:
> >>
> >>
> >> On 07/06/2024 12:03, Dmitry Baryshkov wrote:
> >>> On Thu, Jun 06, 2024 at 01:25:59PM +0100, srinivas.kandagatla@linaro.org wrote:
> >>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>>>
> >>>> LPASS Codec v2.5 has significant changes in the rx register offsets.
> >>>> Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
> >>>> after SM8450 have only Left working.
> >>>>
> >>>> This patch adjusts the registers to accomdate 2.5 changes. With this
> >>>> fixed now L and R are functional on Headset playback.
> >>>>
> >>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>>> ---
> >>>>    sound/soc/codecs/lpass-rx-macro.c | 565 ++++++++++++++++++++++--------
> >>>>    1 file changed, 410 insertions(+), 155 deletions(-)
> >>>>
> >>>> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> >>>> index f35187d69cac..bb8ede0e7076 100644
> >>>> --- a/sound/soc/codecs/lpass-rx-macro.c
> >>>> +++ b/sound/soc/codecs/lpass-rx-macro.c
> >>>>    static int rx_macro_probe(struct platform_device *pdev)
> >>>>    {
> >>>> +  struct reg_default *reg_defaults;
> >>>>            struct device *dev = &pdev->dev;
> >>>>            kernel_ulong_t flags;
> >>>>            struct rx_macro *rx;
> >>>>            void __iomem *base;
> >>>> -  int ret;
> >>>> +  int ret, def_count;
> >>>>            flags = (kernel_ulong_t)device_get_match_data(dev);
> >>>> @@ -3567,6 +3793,33 @@ static int rx_macro_probe(struct platform_device *pdev)
> >>>>                    goto err;
> >>>>            }
> >>>> +  rx->codec_version = lpass_macro_get_codec_version();
> >>>
> >>> What guarantees that VA macro has been probed already? If I'm not
> >>> mistaken, we might easily get a default '0' here instead of a correct
> >>> version.
> >>
> >> fsgen(Frame sync gen) clk is derived from VA macro, so if we are here that
> >> means the va macro is probed.
> >
> > Is this written in stone or is it just a current way how these codecs
> > are connected?
>
> LPASS Codec IP which encompasses 5 other codec macros blocks (wsa, wsa2,
> tx, rx, va) all the codec macros receive framesync from VA codec block,
> this is the hw design.
>
> Not sure what do you mean by written in stone, but this is LPASS Codec
> design, at-least to the codec versions that this driver supports.

Ack. Please add a comment on top of it.

>
> >
> >>>> +  switch (rx->codec_version) {
> >>>> +  case LPASS_CODEC_VERSION_2_5 ... LPASS_CODEC_VERSION_2_8:
> >>>> +          rx->rxn_reg_offset = 0xc0;
> >>>> +          def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
> >>>> +          reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
> >>>> +          if (!reg_defaults)
> >>>> +                  return -ENOMEM;
> >>>> +          memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
> >>>> +          memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
> >>>> +                          rx_2_5_defaults, sizeof(rx_2_5_defaults));
> >>>> +          break;
> >>>> +  default:
> >>>> +          rx->rxn_reg_offset = 0x80;
> >>>> +          def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
> >>>> +          reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
> >>>> +          if (!reg_defaults)
> >>>> +                  return -ENOMEM;
> >>>> +          memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
> >>>> +          memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
> >>>> +                          rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
> >>>> +          break;
> >>>> +  }
> >>>> +
> >>>> +  rx_regmap_config.reg_defaults = reg_defaults,
> >>>> +  rx_regmap_config.num_reg_defaults = def_count;
> >>>> +
> >>>>            rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
> >>>>            if (IS_ERR(rx->regmap)) {
> >>>>                    ret = PTR_ERR(rx->regmap);
> >>>> @@ -3629,6 +3882,7 @@ static int rx_macro_probe(struct platform_device *pdev)
> >>>>            if (ret)
> >>>>                    goto err_clkout;
> >>>> +  kfree(reg_defaults);
> >>>>            return 0;
> >>>>    err_clkout:
> >>>> @@ -3642,6 +3896,7 @@ static int rx_macro_probe(struct platform_device *pdev)
> >>>>    err_dcodec:
> >>>>            clk_disable_unprepare(rx->macro);
> >>>>    err:
> >>>> +  kfree(reg_defaults);
> >>>>            lpass_macro_pds_exit(rx->pds);
> >>>>            return ret;
> >>>> --
> >>>> 2.21.0
> >>>>
> >>>
> >



-- 
With best wishes
Dmitry
