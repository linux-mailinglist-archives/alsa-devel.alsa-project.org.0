Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 678DE68950D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 11:18:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4DFA1E7;
	Fri,  3 Feb 2023 11:17:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4DFA1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675419505;
	bh=9l4KcOpMsyVhtHbEZRdEddHodRAlDrXiRpf/nOTfsDc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=F451F/o3m8SkEn4bYRzmg2443SYc7qztjNCTcWE3tZVspuri0zheSSydZP24Fe8Vl
	 LjBp2v4oe763saByb5UPyLR+3rkrM/Q/Kd9LCZdsuW6xmGu1R8ljwcp/tgpotzbV3v
	 v1qj4s1kS+LR8N3pn+d5c1VopGbAW0v2bjuOmdp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFB41F80022;
	Fri,  3 Feb 2023 11:17:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C17FF8032B; Fri,  3 Feb 2023 11:17:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99F0FF80169
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 11:17:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99F0FF80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Xq2KYOfa
Received: by mail-wr1-x429.google.com with SMTP id r27so364095wrr.1
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 02:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g/WNjPQ18JRVRhyOrTsC5R8S4qdzTnKfuVYcyxolytU=;
 b=Xq2KYOfaW9x9GMrGHICotdHA+FksZKs3pQpRnwtOakPyg+wS67mMubbfAy8SL8pY+w
 IH9i/xAxGjFcjfniH1CvgTQ16VlvoFH8blqO9maFhRFysHVs4f52Jfe3BjH/IengRzy9
 q6i5/YQVF0ySyqw1lpZMVRuFzkxoin/ie+JEd98QOt0pSzBYUxmVGqy7UpK0+7HebgXC
 bUvUwWK8Fjt1Yp79pcizNnj6rZdssJWSoAvwyJ8LPrnMLgfm4DFrc57nbLabE3ktLsRc
 XaqJSjRgiQLn79HXVmAYKB4MJtvf5V1Xd335w84krCvIdWNOlbD8DfHj/7CEyWdIqCEm
 4Tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g/WNjPQ18JRVRhyOrTsC5R8S4qdzTnKfuVYcyxolytU=;
 b=AoEO134g2sAgMpJful/snj6qjjFAlo9kyWBs+hsoNpITfgqsXqoiTwIa3BKuLMk4Jv
 dRihzb/d+K4zrAKMHU7tbmnj/53Smxg2+x4tgQNrR9/MW6ryxJQbbAfLsK8vb2whse3m
 wSyljJL3NDAQvGcy+EZ4E045QpRTMjBap7yIi93j0n3O4MJk4E/G36OFHECaFcAXfYR7
 WkVTWl0rFCIhGMNmpOFXi8aDQf43zAVUbtYPDS698CiwmKG3j1Dz1NCLrAVoQX7znoVF
 t+VGoOfJAwNuYeLSt8l8T0Ppztt6B46NohVkjjlbGJpY7iIOHAv6qw/VzEZfsFHGG8Ka
 BdxA==
X-Gm-Message-State: AO0yUKWKuB1AASNdxrFi2+hYo+Zvw3nLqIO1+2e4SpclpgMz3peo21XE
 c97mvH9SVLpdStqR+a6Uz1GOzHtR9WeNQPJE
X-Google-Smtp-Source: AK7set8mPBxEY7bgE4SAboc3eVYbmvKHZm+if6cSAOlPEVguCHGCvPSCuS/A/oPxmUwblCrlwppX7g==
X-Received: by 2002:a05:6000:16c4:b0:2bf:f024:de79 with SMTP id
 h4-20020a05600016c400b002bff024de79mr11676673wrf.37.1675419438905; 
 Fri, 03 Feb 2023 02:17:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a056000186200b002bddd75a83fsm1773632wri.8.2023.02.03.02.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 02:17:18 -0800 (PST)
Message-ID: <2195773d-12b4-0b32-26b0-488d78844e5f@linaro.org>
Date: Fri, 3 Feb 2023 11:17:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/9] ASoC: dt-bindings: meson: convert axg pdm to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-6-jbrunet@baylibre.com>
 <512edf50-a74d-815d-1278-39fdeb1c2d35@linaro.org>
 <1jtu03m6ia.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jtu03m6ia.fsf@starbuckisacylon.baylibre.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 03/02/2023 10:37, Jerome Brunet wrote:
> 
> On Fri 03 Feb 2023 at 09:01, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 02/02/2023 19:36, Jerome Brunet wrote:
> 
> [...]
> 
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - "#sound-dai-cells"
>>> +  - clocks
>>> +  - clock-names
>>> +
>>> +if:
>>
>> Keep in allOf here (need to move ref from top to here)
>>
> 
> I'm not sure I get it. As it is, it seems to have the effect I had in
> mind while trying with dt_bindings_check.
> 
> What does it do when putting the conditional under the AllOf section ?

It avoids any future re-indents if you need to add one more if clause.

Best regards,
Krzysztof

