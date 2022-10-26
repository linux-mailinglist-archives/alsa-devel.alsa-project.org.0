Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8706A60E351
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 16:30:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 097972031;
	Wed, 26 Oct 2022 16:29:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 097972031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666794611;
	bh=JhICXDYHl8r7W3smxwnbkCN+Q3r8+01MVO8dtA2iU4A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QYwlJtqyTGqML0PzlVSjAGkcGlVTQ1mBZpYGhRBxvU8W5sBXOnYbOPhi+guqxUorf
	 5DU6N/vma6+V1TA0/a+GXpZODXObpBX4kBWAISTIUiBM/qt0cbCdCVpupuxvFwmpC/
	 8QwCUoaQHL22m7rV7acZdhQSuSz0NdFV9j4nthKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67842F80100;
	Wed, 26 Oct 2022 16:29:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFA8EF80271; Wed, 26 Oct 2022 16:29:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 618B6F80100
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 16:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 618B6F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xmhb1LPv"
Received: by mail-qk1-x72e.google.com with SMTP id l9so8080007qkk.11
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 07:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HepF+4A2/3ZWV1tTO7JvfOk/wi0W7kiAoRviokUEQWk=;
 b=xmhb1LPv6lF+utwsSzmBJo6aHeftPiH2Kyv4Bvr4KAlYL2U4tSNzSstC39opm1m5Rs
 Aszx1vnXqIpzkkRmAtd22JdQo95UE/RT1/6x0tAhvHJ4YwrJj38vaAv/uGIvh9sESCX6
 LIaVQCQHFwjJNL6ZhbLZfFEyHVG+XE47c0AoymmQS5/pkgVunpLDSldYJHlsbUivK3n+
 OPsEEcb5gI0GbyofsB8lEcGs5BcpWZJDpHwkM6DUicGJ6YJHxnAg7gQ8HtvxqurK917c
 8lXs2vckc72kTJN2aHETO3eVnL+u5khewCIpyjaqZmDTxILwvBAkGxklGQRLTfLUD7KC
 VIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HepF+4A2/3ZWV1tTO7JvfOk/wi0W7kiAoRviokUEQWk=;
 b=CKDvaDZvKVCEYwec8sKn1F0Y3rMyS/s1yAr2CEuOAJpR0Ks65V9AFUhJ9qqefatxTw
 XftnnaCNZZZW4t06eieb+8k+9ZEczVLhxx6u8K+OdZZvdljyocUuFcSQX30sWTtYsuB2
 5XCZFVR4Vg/P8Rd4uJs1W8SDA04So9YJnzUwH77imCPCMIKdb+6C6tqcRZnYzMSSvWaZ
 kdnXW9E9PWv8t9ZGr3+jfMcOvFx1A5JNNIJEfypBy+U9d1c17ZfK0uyi8LwZn3Bdv3Ff
 93oyYT1nm19pJyZuh73fD76/jjLCg8Xbslxu1WZkA9kgnBRPY+3FvZt/9ESopoBjreKZ
 1jYw==
X-Gm-Message-State: ACrzQf3aFU697SJJWJqFdIqCADZ+uMwxKsewGAGj6KUNeXs5sLJ/ln6y
 9wHFCyklWyUZCyzaAfJQED9KsA==
X-Google-Smtp-Source: AMsMyM6lpu83qpTJZs3g3pyaL3a9mQY9MGnGVNyB0/eSs1gGWO65GWGZ6/h84n2kWseHL1Vvyk1gdQ==
X-Received: by 2002:a05:620a:370c:b0:6ee:cece:c779 with SMTP id
 de12-20020a05620a370c00b006eececec779mr29445511qkb.727.1666794541727; 
 Wed, 26 Oct 2022 07:29:01 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a05620a255000b006cbe3be300esm4011966qko.12.2022.10.26.07.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 07:29:01 -0700 (PDT)
Message-ID: <5264f9e1-b67e-479d-843c-c92230cfd0c3@linaro.org>
Date: Wed, 26 Oct 2022 10:28:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 5/6] dt-bindings: soundwire: qcom: add v1.7.0 support
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
References: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
 <20221026110210.6575-6-srinivas.kandagatla@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221026110210.6575-6-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, sanyog.r.kale@intel.com
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

On 26/10/2022 07:02, Srinivas Kandagatla wrote:
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

