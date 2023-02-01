Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB4968605C
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 08:13:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D20AE843;
	Wed,  1 Feb 2023 08:12:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D20AE843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675235579;
	bh=ETG8xzXnR5XE4VofqZV4A/M5phg1WDFIG1cxbUMSgQA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tdtUQOb40HuMrsQN8RqEYtpsMP1Y8F2i23dfXE5kekwPv+6qIBCopvjqK4zalFx2U
	 BKYxbHoPo4bffT5RXXDNPb6d0+elGCuupyQxalEmLEOwkwsPdYeZjpQACqQsK41JD8
	 go6k5WtNoewJjHA19i0ohEhw6LoB4NOsxVcqFRoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50BE9F80246;
	Wed,  1 Feb 2023 08:12:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59C6DF80423; Wed,  1 Feb 2023 08:12:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47B09F80246
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 08:11:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47B09F80246
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xULa/7uK
Received: by mail-wm1-x32d.google.com with SMTP id l8so11921906wms.3
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 23:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cn9LZKnUiXYPN0HrV8FpuolH+EcmV36idl0jPM8Bs7g=;
 b=xULa/7uKAzVNHnAjrjCp9bVHGfDdSgVls4B3o+aiUOTV71IywmXVOFH7OcwQRPAvJ7
 o4ekM/su0yqeVM3iZCXiPw8O3u2X6XfDGArz2H/Jpluck7lVJPyaR7zTZKiDC17mZ6uU
 LNCR6kaYks2FVZFKDnlbpvujlu1UBSXPdfYB7/tPGUnmX0XtlF/7gBiwCr6p2S+1vw6x
 KCiQltH7fAyBus7kyq+2VWrbTOAUfhEkc1ZrQ+P8F0OcOPi/bItCnidq+VUWduy3iHnu
 hVfpdfZ2HrshxO7ANs0DY3mirg1Xu7jECm+ERSKSelXhozgIYiUYALyVDI+nUvb0UZFj
 VJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cn9LZKnUiXYPN0HrV8FpuolH+EcmV36idl0jPM8Bs7g=;
 b=GSymRMDRh2E0+yqzbFTy7o7suNFsFX5mXGXAHgJITFcyqTPby02XLmqkWNWYOB8byz
 yOTQMKVYvkCFe+1WrOUSxWNu1eahmrd4kJNVR4ih5CCMBEVtrfFNi93QKb9KWPMTk9T+
 1wgWtnqu5tgU38l9s8obD6JEpcH362+m2hHy+ru5X2C1CFRt038V0V8PTmwXAFLDVnJo
 M+bbvyH8TTPWAzMMdG6y+5lsJ/gL6f8RymbEwuTM2RYNotW9BqTL4+/B9AND697URx9j
 rHbLsokmXKqeQE9Lo+BV5ZQTXxzowsRIv+KD+G7lldVpr3bFoqWBvmVRSnD7fOU+rSTW
 e/FQ==
X-Gm-Message-State: AO0yUKWEUUC0Y8h7Exlw6LeR7ZvhC/YSUMxUJvZ8Fnlj6GvMG49kL2pe
 kjn3CtXmTNucl5JLVAFt/xcTqQ==
X-Google-Smtp-Source: AK7set/sqXRZ6V1JnblJNIQrhR6jqsQ/X0zsu4VBAYE/A3nGGIdQrfitkZ9AQ2RPkzdeaCl+ugfyYg==
X-Received: by 2002:a05:600c:3b89:b0:3dc:19d1:3c13 with SMTP id
 n9-20020a05600c3b8900b003dc19d13c13mr891765wms.12.1675235510442; 
 Tue, 31 Jan 2023 23:11:50 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003dc36981727sm858730wmq.14.2023.01.31.23.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 23:11:50 -0800 (PST)
Message-ID: <17542e28-36dd-2bb6-6c04-49df9433a67a@linaro.org>
Date: Wed, 1 Feb 2023 08:11:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 14/15] ASoC: dt-bindings: renesas: add R8A779G0 V4H
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
 <87pmau5ejk.wl-kuninori.morimoto.gx@renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87pmau5ejk.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 01/02/2023 03:02, Kuninori Morimoto wrote:
> 

Blank line above From?

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Document R-Car V4H (R8A779G0), and R-Car Gen4 SoC bindings.
> 
> Link: https://lore.kernel.org/r/87zga6t5r4.wl-kuninori.morimoto.gx@renesas.com

The Link is a tag added by maintainers pointing to applied version of
the patch. This does not look correct...

Don't you wanted to just reference v1 under ---?

Best regards,
Krzysztof

