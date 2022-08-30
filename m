Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB5B5A6BD7
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 20:12:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A21E816A9;
	Tue, 30 Aug 2022 20:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A21E816A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661883128;
	bh=Cs9owmSQktVh3UvVnvO5GKOOUy9EJT+NfXuwpcMvDLU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=van5H6zGmZsxTOoUK3fiPsUm4FK70XNUao0OjMpRX0+qwok95w3jmiftrxMYORvAW
	 zAQorlB4FtmJsG29WHFcEoOktMWws8KSGYnZfXMQs1MIyTpmBfEC70TZ4F/ISRVXiC
	 WssbAUTRS8rS2xA971bO5kiQxZIrdi8SppSNlYW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 979E6F8012A;
	Tue, 30 Aug 2022 20:11:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 399F8F804C2; Tue, 30 Aug 2022 20:11:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99345F8012A
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 20:11:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99345F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="IdHkGy3k"
Received: by mail-lf1-x134.google.com with SMTP id v26so6400441lfd.10
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 11:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=0jx9VNj/HcW0dooShctB6tlNBtRfv946EPoOPim3t0E=;
 b=IdHkGy3kZluHn+s1pCS1fWDIsltwMDgJ5SLNDPu4jLO5nDxOv7HtdjosNkKuyV0DmG
 eUVjPmcsRIc71d5lUiyCBv5yz5iwuKITxlkI2CCTrVITfLANq+620vJrpokgFTnjMf65
 PPqxsSS+0cG9/10Su2NyJ/PoPuhyRXxyjcg+WLJwi+0JwWn4830Atw3YAVd9seGZ8bBd
 pQb455HbnE8H9AyoNrefVsPmjpWDZYG8ji2B4reou+a4cddd1nX5+NK/Opneeh+VVpgv
 0tybYtY7AnI1k1Wc5+hDcL2lPd/zK924fpvX3KRBLJpdU13SX0L3NR2Wv2HkylcGhsWw
 6Kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=0jx9VNj/HcW0dooShctB6tlNBtRfv946EPoOPim3t0E=;
 b=k6BBnt3zIRKseZyWPzkoob0rhkIJThwq1xaQ8FhOKJHHFrNFLGTpeNn1vE4qzIC+F2
 8h85E+NEOJ8TUQrvDhLVKE5QaKQ1HevEpIMH8jXiZAdYc1bxgU0FCtEFHvVzTa8t9oFl
 Ol8sueCiugDEEFT8Y9TybGzPqc18zo158leoOD7PGSlWg3g3TqtDrKEKMuu2YG5h2hp2
 LUpMZyJRi9SjkJaqR+qUUUrQ8I06pYQ0nhDOdw56AbUscczBuAf/EKyA4Z/7o31p6oX/
 aMxY0niqdvZJXTDCcwLMYQFb5nESv6eHB4FWPXkX1smT1LuZcXYkc5ISnxXLM/rKjwCc
 JVOA==
X-Gm-Message-State: ACgBeo1EE5UjpC9rpZHV56KC3OIm3zYDR/5oAb4+Ifix+t1F5rkr9zuo
 mvzrAdPA+PG+2zClVuZxiworJg==
X-Google-Smtp-Source: AA6agR4LS54/XWSxpR5JM4CrvVaGHIeYIc+KzFnzxBcHugfK4mmyTYOXAfXMhla6rcSZpaiqZFIh6g==
X-Received: by 2002:a05:6512:3503:b0:481:4470:4128 with SMTP id
 h3-20020a056512350300b0048144704128mr7794471lfs.303.1661883066495; 
 Tue, 30 Aug 2022 11:11:06 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv.
 [109.73.99.134]) by smtp.gmail.com with ESMTPSA id
 o17-20020ac24e91000000b00492ef074fc1sm1683629lfr.183.2022.08.30.11.11.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 11:11:05 -0700 (PDT)
Message-ID: <ce096b36-b678-63e1-e98c-7549f3df357f@linaro.org>
Date: Tue, 30 Aug 2022 21:11:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v9 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings
 for DMIC controller
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <1661872039-40174-1-git-send-email-fengzheng923@gmail.com>
 <25072fba-64e2-df11-c8f0-a274037141f0@linaro.org>
 <Yw5Qd7ZNPIc/o7+6@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yw5Qd7ZNPIc/o7+6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Ban Tao <fengzheng923@gmail.com>, samuel@sholland.org, lgirdwood@gmail.com,
 jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org, wens@csie.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

On 30/08/2022 21:01, Mark Brown wrote:
> On Tue, Aug 30, 2022 at 08:35:09PM +0300, Krzysztof Kozlowski wrote:
>> On 30/08/2022 18:07, Ban Tao wrote:
>>> DT binding documentation for this new ASoC driver.
> 
>>> +properties:
>>> +  "#sound-dai-cells":
>>> +    const: 0
>>> +
>>> +  compatible:
>>> +    const: allwinner,sun50i-h6-dmic
> 
>> Put compatible first in the list of properties (also in required:).
> 
> Can the tooling be taught about this?

Probably could save me some time in writing reviews... Let me look.

Best regards,
Krzysztof
