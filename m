Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACD97018E2
	for <lists+alsa-devel@lfdr.de>; Sat, 13 May 2023 20:01:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44164E86;
	Sat, 13 May 2023 20:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44164E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684000873;
	bh=8t/NvNYtuE5Tbun+2ID8XFAS57udLxWPPSwf/EXaD9Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xjc9MtCT0O8p/APQlK/TCuhQFzQx7y2aVBFGcpq6m5dg8lpE9pKVYVSC/k52acd0O
	 jzUpuwojSPpf2eF+NpFshRUX8wVIxftgtxvNujXSD6gP6asumzQzpobhEJcpTZp7JX
	 mnNtBIETSVOJLro39PjSSkKUSi5OSYtoN3aJaFn8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A79F4F8053B; Sat, 13 May 2023 20:00:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55A6DF8032D;
	Sat, 13 May 2023 20:00:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2392FF8052E; Sat, 13 May 2023 20:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A554F802E8
	for <alsa-devel@alsa-project.org>; Sat, 13 May 2023 20:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A554F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=sjhzCzAA
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50bc4ba28cbso19774495a12.0
        for <alsa-devel@alsa-project.org>;
 Sat, 13 May 2023 11:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684000807; x=1686592807;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SdRy69fIEsxIBR9NIDENofSkdxQv1jnZ0R7WuYlxvmg=;
        b=sjhzCzAAyBjuTGKHxODaXBbt3IpZUH5n9QRg5Y00mSFjTzfBddfZuq7hkOgVwvviWw
         JETvWMvXIe8kNlLiq9kuULyBmn2zskRTyCr65AwIRK0eAHmKepiAsDBIAMLqnRt4w5b0
         AWxZs2dkeSj79sI4AJuEfGIl+G/rSfNcWv3Z4/MgqdGdRM53QKB4icfgyvmfmjhkFPp4
         ZmURF1Uib0HpC8OqtlKQWb1l+xoRAxETAcxkMU2Zz+Pa5oi7AReKtIikudjXHhWcQ/S5
         dP+FhtG/HiJ8vZAy9boN7lWtS71Hmdz1JCc8MEc5cPlb4GA8rhFidccFxRDtmgovXxlg
         sovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684000807; x=1686592807;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SdRy69fIEsxIBR9NIDENofSkdxQv1jnZ0R7WuYlxvmg=;
        b=BFVVGntVfvPSaZ1l++4w60wSR7YLhYJNYx2mSs1KtGxse1wNxDKpvFiX7sqvBEGCz8
         oCO5WitETKuf8GEl0c0/KyWMNPOmkM72fEo8bK8TOeY5xYjqe3eT6XOKPsh8Sr7EpyfJ
         4gjs4OaMdEQkt6KiETjY2kcDg9y9ML2kmGw7zyGv6KvWXKfffCLK2fnN+05nAP3cGFJ8
         g8FwKGs7T6VtXwA+BjdO2WMiZQq4PtjBhsekiFSvAYcqWsjAZvuZAfdsxP2698iI9Z9B
         4h/2vBxkNtki3SLZkBJ0+RA8R3cBQT/vCSewYgCVgFBU4eaEdsTDXiPfu55f/g6h5Dgv
         8HEw==
X-Gm-Message-State: AC+VfDwE17VmHd9CX7peDpYYCFmaURVpjSBWUopnVwfNI0YEROY1dxvJ
	KX4lVy4D/ASeqRl8lAWTF20b+g==
X-Google-Smtp-Source: 
 ACHHUZ4m7lCl8p2Q7EHaoUU/9iQg5m8GgeAPaGDj82d7+DhAw/jzqEtERboZRuZ59/7bEz4RKl+kkg==
X-Received: by 2002:a17:907:7f94:b0:969:e9ec:9a0 with SMTP id
 qk20-20020a1709077f9400b00969e9ec09a0mr20377665ejc.77.1684000807359;
        Sat, 13 May 2023 11:00:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ba68:e5c9:694e:c6e4?
 ([2a02:810d:15c0:828:ba68:e5c9:694e:c6e4])
        by smtp.gmail.com with ESMTPSA id
 u24-20020a056402111800b0050bc4eb9846sm5105168edv.1.2023.05.13.11.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 11:00:06 -0700 (PDT)
Message-ID: <633b305e-a311-3334-3d4e-30d5d09ebb6a@linaro.org>
Date: Sat, 13 May 2023 20:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 08/10] pinctrl: cs42l43: Add support for the cs42l43
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, tglx@linutronix.de,
 maz@kernel.org, linus.walleij@linaro.org, vkoul@kernel.org,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-9-ckeepax@opensource.cirrus.com>
 <9591999e-9d7f-2a4a-29df-d9c42dfa736b@linaro.org>
 <20230512155426.GJ68926@ediswmail.ad.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512155426.GJ68926@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BCEBXWBMGYQA4OX6T3MTCFAREDJWYDDG
X-Message-ID-Hash: BCEBXWBMGYQA4OX6T3MTCFAREDJWYDDG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BCEBXWBMGYQA4OX6T3MTCFAREDJWYDDG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/05/2023 17:54, Charles Keepax wrote:
> On Fri, May 12, 2023 at 05:30:37PM +0200, Krzysztof Kozlowski wrote:
>> On 12/05/2023 14:28, Charles Keepax wrote:
>>> +	priv->gpio_chip.fwnode = dev_fwnode(cs42l43->dev);

What's also a bit confusing is that gpio_chip is the parent's node, but
pinctrl is not...

>>> +
>>> +	if (is_of_node(dev_fwnode(cs42l43->dev))) {
>>> +		device_set_node(priv->dev,
>>> +				fwnode_get_named_child_node(dev_fwnode(cs42l43->dev),
>>> +							    "pinctrl"));
>>
>> That's something unusual. It seems you want to bind to a DT node because
>> you miss compatible in DT node?
>>
> 
> Kinda, I don't really want to add multiple compatibles for the
> device. This is just a CODEC device, even in device tree it
> seems a little weird to have multiple compatibles for a single
> I2C device. On ACPI I am pretty sure it would be considered flat
> out right wrong. The fact Linux supports the device using multiple
> drivers is seemed to be a Linux implementation detail, rather than
> describing the hardware.
> 

I think if you do not have compatible, then the device node should be
rather the parent (so the main node with compatible), not the child.
Child is just a wrapper for pinctrls, but not something representing a
device.

Best regards,
Krzysztof

