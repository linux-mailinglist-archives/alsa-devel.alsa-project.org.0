Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC85620D7C
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 11:37:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94927950;
	Tue,  8 Nov 2022 11:37:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94927950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667903876;
	bh=T+oIHKmaZnuZbEoSOr+mnIaB7DkRgjaMBfAYIzhDlYA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YY88nkTakQzu9rnky0benC+Gk2z9h6EqtV5z9CDOFH1Qv6Ufk81Fpi26dgVCs+s3m
	 nwIE8XuScVSdzFhnUxTuRYlYWco4JfTBnN9CdO7A6kK0nL4Uuy1CJ7Q5zCF3zhOw9P
	 YpcXCmfFnP5mm1NMRPVI/CCTDCMH+6GGYQmZuqsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40B6AF8016A;
	Tue,  8 Nov 2022 11:37:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B3AEF801D8; Tue,  8 Nov 2022 11:37:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95EFDF8016A
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 11:37:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95EFDF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qxlKoNOC"
Received: by mail-lf1-x130.google.com with SMTP id j4so20691325lfk.0
 for <alsa-devel@alsa-project.org>; Tue, 08 Nov 2022 02:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F1eU2MNzr9lEfofB/L6YKz5jRjvrNUwGoC1RPrJsqIc=;
 b=qxlKoNOCj8bwEn/unr4ZPcnBCXcdPnwp6/SZBWWeD1f+nNzLQZ17cHnkenX1JoZ+nJ
 l5mhxoz3baMzHRwcGvuZBeAgFsbmfiw5waqPt908NhhIv4tecxmqQPdV0Dhf9IJm8Dt0
 k0NtuvI7zoLtlVsm93UDSI5nvXT8giTAEmr04mTtPEhLQpmnA/bd5jRs34pBIxkPVDZp
 sLD6ufM7RkVvdGhirGvWrEpWffO+PQUzvRoxY2bs+2fNm4Hu8I9+dliDE1l3I0yRMuNK
 qnErbVUK+0FDLBkKVwWv6dWzXNsnSoy7R0nrBCaZxdKQNiCL0RQeH6J78bt+69PPVLrT
 Kytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F1eU2MNzr9lEfofB/L6YKz5jRjvrNUwGoC1RPrJsqIc=;
 b=ZYcUkXPQAtC38+Gz+rdAlzS/N+77AMe8OECaYOd6PTmeoMpJD9vHr9zbp7WxqjfP8i
 gC3tzBQh75iuY1QIUnZLl2xX+G4qmjh65ooFh4kJ8KmJUs4CDiphrw/CWSliGOmhWlHd
 zD18JW4Tn6Nz8nF3ZCzeUJc9ERgJtlzWVDo2fTIQqZznlBqb4dnDQiOBZGoo7GHTsDwt
 zlQxAz2sWBt4lQV6m+NIymp5ca6aLJM0ke5B02NLB8klHlYIdUU+WwW2IWKTHftjzeHE
 HGqbI7PIs3Z1Gs4YAOGduuGrStgKK3v7AwLusw0MH5JGV+mF70Y0UnG83bGztNL0e+z2
 /b7w==
X-Gm-Message-State: ACrzQf2T06TLV0veDA/2O8AJuzzRmO6s0dWlqrRWjB46ffwlOb8YrMXi
 IZTyX+7VS2zOTCKbIQ0O5/GbQA==
X-Google-Smtp-Source: AMsMyM6S9IhbB/K0PCnZCtTSePbIeEuS4EFok4irDdkDhHZDjaoZyjyvFW3wOa0V66uhD+fgmiISkQ==
X-Received: by 2002:ac2:569c:0:b0:4b1:966f:7a19 with SMTP id
 28-20020ac2569c000000b004b1966f7a19mr8890286lfr.587.1667903819567; 
 Tue, 08 Nov 2022 02:36:59 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a056512110a00b00497b198987bsm1726912lfg.26.2022.11.08.02.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 02:36:59 -0800 (PST)
Message-ID: <2ba09d50-229a-25d6-e437-c0b31429eaf0@linaro.org>
Date: Tue, 8 Nov 2022 11:36:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/6] dt-bindings: sound: Add sound card bindings for Tesla
 FSD
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
 'Rob Herring' <robh@kernel.org>
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104901epcas5p1a61ea81c3b1640bd8a064633c0b1e40d@epcas5p1.samsung.com>
 <20221014102151.108539-4-p.rajanbabu@samsung.com>
 <20221014151325.GA1940481-robh@kernel.org>
 <04b901d8e529$573b17e0$05b147a0$@samsung.com>
 <253fc459-c3dc-7710-6f34-0466d5301482@linaro.org>
 <01c101d8f333$b3bc8db0$1b35a910$@samsung.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <01c101d8f333$b3bc8db0$1b35a910$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rcsekar@samsung.com, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 alim.akhtar@samsung.com, linux-kernel@vger.kernel.org
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

On 08/11/2022 06:33, Padmanabhan Rajanbabu wrote:
>>>
>>> The actual reason for having a custom sound card driver lies in the
>>> fact that the Samsung i2s cpu dai requires configuration of some
>>> Samsung specific properties like rfs, bfs, codec clock direction and
>>> root clock source. We do not have flexibility of configuring the same
>>> in simple card driver (sound/soc/generic/simple-card.c) or audio graph
>>> card driver (sound/soc/generic/audio-graph-card.c). The binding has
>>> been added to support the custom sound card driver.
>>>
>>> I understand from your query that the newly added card has device tree
>>> nodes and properties which are used in simple card as well, but having
>>> a different or new prefixes. I believe to address that, we can
>>> restructure the string names to generic ones.
>>
>> You must use generic, existing properties where applicable.
> 
> Okay
> 
>>
>>> But I would like to understand, to reuse the simple card or audio
>>> graph card bindings, can we add secondary compatible strings in the
>>> simple card dt-binding for the custom sound card to probe ?
>>
>> If you see other vendor compatibles there, then yes... But there aren't any,
>> right?
> 
> Yes you are right, we don't see other vendor compatibles. But, am I allowed
> to add such secondary compatibles so that we can extend the simple card
> and its utilities to a large extent?
> 
> If no, then I believe we will need a separate binding to extend the generic
> properties.

If you have any custom properties, then yes. But you don't have.


Best regards,
Krzysztof

