Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE24742B52
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 19:34:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BBB87F1;
	Thu, 29 Jun 2023 19:33:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BBB87F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688060057;
	bh=MBd6SSE95qwooGG5YBju5UeAszhs75qZzsSaT6Mjuys=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CXpN5tIVcTfi9/Yx/jH1Jm63Lf2x0ZS0Pbaxr+aZ3GhAKYS5UxAqZDlL+J5UZYB6g
	 yCn1QMy07HUvvDXL5iLsu8asEWo1j44xeiWd/d60JOZG7byY0/gPRYZJbwWFqPeUEf
	 Y1Cx68GB37oPp6ZgMO8K7T9x6LAPhgA36xh2kf2o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEF43F80431; Thu, 29 Jun 2023 19:33:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ED31F80212;
	Thu, 29 Jun 2023 19:33:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28CEDF80246; Thu, 29 Jun 2023 19:33:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44225F80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 19:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44225F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oXBlUOCs
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3141316b253so1025284f8f.3
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Jun 2023 10:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688059991; x=1690651991;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EZxvYIZuxAB+lwUWpz3iVved5/FIuiHwGeX7NNNfKPs=;
        b=oXBlUOCsey6+rQUYnSJFVtS5AWj+TbJrKzuUNlXTOUDDPjK+vhhuNDtuh7MyHlBUsP
         Ukjnxt4TxiOim3clDHs754DtEm602HxHBTOIFJ0b+NopLsIPE7rA6+oD7LY51iHYJR+m
         20c1zNfsyGl1cEqDtSLlm2/WFFdvFlgAXUdIIuHRpGLhBRs7n6Vo6gIFhGFosIPlOi4S
         yXGkdGT17L0B9ls3SA7mR8Ki+y/tYlW9/UAiFJkGqX9DfynoLqqQm+0tLR8EkHpzejP+
         ACbLaqzMjnVZAM3SRHoK93fl0XcLt5aKHocBM8O01XqnbrNSQzYssz1m6CnwHxWqyscx
         rFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688059991; x=1690651991;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZxvYIZuxAB+lwUWpz3iVved5/FIuiHwGeX7NNNfKPs=;
        b=losxP+EW4CEN4Y+pEZ91fvW1cpQK/UEaoA/ke0GmxN6tnfV6B37z8cQMrmTIng/CGE
         4xKpuQwsE6r6Jyv7htUULaLTaXiY8p6fp1c/YZvL0DiWt7B8+Z+CHBxsYfdXE7qjrj2M
         4u8Wxo3n3OxBG4+V6vqVz17/sJwufQLPSLF2CtofUEi5KmdcqbMTlQ2+GyoIMZTdF8YK
         IOK95LtrRx2+pbCs6+CtV7InNfWZHjFgoKSAIiGT5mZrduxxiYgT8D8vfvuADf8IudDc
         B8a6CI477TFHZQouuW0pS1hTzWy5idZBg4RyQp4M50lxgejpMNrf42WFA6kESrqFlbWy
         vxQw==
X-Gm-Message-State: ABy/qLYpVZYERunREYbNZpiBvDdZ6LnJ1JDa6uA4PgxMUoMGYJhtMP6/
	awWmnR9d3Cxq3SYz/SXZz2LyrQ==
X-Google-Smtp-Source: 
 APBJJlE8XZRIPMaI6hNQHvv0XXg37ddZC1ZtloaleapPkcO90Mg1HZkMU3CBxM8wYYCsAhqtCIVBew==
X-Received: by 2002:adf:fd43:0:b0:314:77a:c2b2 with SMTP id
 h3-20020adffd43000000b00314077ac2b2mr223834wrs.32.1688059991220;
        Thu, 29 Jun 2023 10:33:11 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 c1-20020a05600c0ac100b003fba6a0c881sm7762482wmr.43.2023.06.29.10.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 10:33:10 -0700 (PDT)
Message-ID: <77b348f7-0475-5e16-95e1-0e5831408d2b@linaro.org>
Date: Thu, 29 Jun 2023 18:33:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qdsp6: q6apm: use dai link pcm id as pcm device
 number
To: Mark Brown <broonie@kernel.org>
Cc: johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 Stable@vger.kernel.org
References: <20230628092404.13927-1-srinivas.kandagatla@linaro.org>
 <c22fcc94-aa41-4ffd-bfe8-f0b9f15a76c0@sirena.org.uk>
Content-Language: en-US
In-Reply-To: <c22fcc94-aa41-4ffd-bfe8-f0b9f15a76c0@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OE3TYACYPADPYM7EKIYC7SZQPU4ANSNH
X-Message-ID-Hash: OE3TYACYPADPYM7EKIYC7SZQPU4ANSNH
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OE3TYACYPADPYM7EKIYC7SZQPU4ANSNH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 29/06/2023 16:43, Mark Brown wrote:
> On Wed, Jun 28, 2023 at 10:24:04AM +0100, Srinivas Kandagatla wrote:
>> For some reason we ended up with a setup without this flag.
>> This resulted in inconsistent sound card devices numbers which
>>   are also not starting as expected at dai_link->id.
>>   (Ex: MultiMedia1 pcm ended up with device number 4 instead of 0)
> 
> Why is this a problem?

In existing Qualcomm setup the backend pcm are added first, which 
results in frontend pcms getting pcm numbers after this.

For example: with 3 backend dailinks in DT we have frontend pcm start at 
3. Now if we add new backend dai-link in DT we now have frontend pcm 
start at 4.

This is a bug in qualcomm driver.

> 
>> With this patch patch now the MultiMedia1 PCM ends up with device number 0
>> as expected.
>>
>> Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
>> Cc: <Stable@vger.kernel.org>
> 
> Won't this be an ABI change?  That seems like it'd disrupt things in
> stable.
Yes, but this is a real bug. without fixing this also results in abi(pcm 
number) change when we add new backend dai-link. I have also sent fix 
for UCM to handle this.


--srini
