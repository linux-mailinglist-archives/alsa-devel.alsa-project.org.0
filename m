Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F00621161
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 13:49:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E13F0836;
	Tue,  8 Nov 2022 13:48:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E13F0836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667911760;
	bh=MJUBCrCVMvGt+ISx07tb0sbRZ6TEwz+S8rNrFkLS40o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DQzG1txbo6ujRT8BC1vkdO5wZg7N/dw+YEBV84uHF7lIB3RfuZCe6vC9ld0G81/Ht
	 Gnbrx5sJch0Dwx1JYrvNy0N4DD/3slQa3IUizXObVjljoqpVfSNz8cBqri14/6LnYw
	 q9XAsj6CGRlGmLC2eJXK0/VnV7n5Fqe9UrUDKlV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A170DF8020D;
	Tue,  8 Nov 2022 13:48:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF48AF8025D; Tue,  8 Nov 2022 13:48:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FC75F8020D
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 13:48:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FC75F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="q4zKbmw9"
Received: by mail-lj1-x22d.google.com with SMTP id t10so21004120ljj.0
 for <alsa-devel@alsa-project.org>; Tue, 08 Nov 2022 04:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4s4Z1WdUOPpLx6Zbqf7L1892zlqXckJCl3Ja/uP89L4=;
 b=q4zKbmw94I9pKmSWoe1A3Z/AzqpYt6qpaN3SW9lzEWOqTY8eaaaJuqXM1wk6WGGLYM
 7sI2uCTjDurSYYLQu1LE/8Rj4uHJGC+81xE4Q4OnEwH/uqCsLXMy1yiHuAhdbRxtjE5y
 AaTHEEkEAzPsI+cVKXlTxV771Mkg7tCW4n6Urqq3KBG9y5jeZBV0q8dX132l6sNaOCb4
 jQe5GMdRFVrP3Hyqq7uM5RI/fSmKBXO504+GUY+jokmW7j4Ztrhx7fRGiwyr8UWfopPy
 MJ1e8STAA0bb7J07uwj3dFWVoiVfLcYqSIlFHs9W7OZfx09PfDB4zDzlNwDxgCq4HrBS
 86Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4s4Z1WdUOPpLx6Zbqf7L1892zlqXckJCl3Ja/uP89L4=;
 b=UXiU4uUwDK19AsbO3Pyp9QQUkxkRE6uEsxN5CYmNW6YE3wzsJh4mXpC/K3KgQScxQa
 ObMPDY8ke3h0hHXYtWc8EUzlxsHJZgwBT7hkvMMJXIWwsoxjlzBg4ZZ6Rvf8/S8JVzdo
 DsdJ7zloZjfSBo70JMDi+Q/9x7GgoYusSYvGHhF4Ohv23Ajyxxpmk8zeY++VqM+YCVff
 7uG+5ltsF6ittepZrxtmkCX1CBbEXfDpY9zk/AtYfUdtv9M7hjgBO37XsmKN7C5Anx7W
 mgfk9t/Ppf6jFXdMAFUvAJVc5891b0IgGa2gHnHrPYRP3Lx6FFsgy/AmPmYAsgZ097X2
 3k/g==
X-Gm-Message-State: ACrzQf3E6KZ0FNcsbJvBQLlaoKtTw4EfpLOGhOalfjjzqvsWjcEtkczF
 e+kE0aKpLqOUYcCRPfk+gHo7Zg==
X-Google-Smtp-Source: AMsMyM6tlA5qzQlcNJ0y1TkIG//th+wyQ8gWeyik8VyEAXOPTD7CNbXS8/glvZgW2PFrCL59t12K8g==
X-Received: by 2002:a05:651c:2d9:b0:277:14bc:da0 with SMTP id
 f25-20020a05651c02d900b0027714bc0da0mr18784418ljo.212.1667911699164; 
 Tue, 08 Nov 2022 04:48:19 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a2e88c7000000b0026daf4fc0f7sm1729753ljk.92.2022.11.08.04.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 04:48:18 -0800 (PST)
Message-ID: <6a939e52-b69f-b30f-664d-dfb9f279b5dd@linaro.org>
Date: Tue, 8 Nov 2022 13:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: sc7280: Remove redundant
 soundwire property
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org
References: <1667911156-19238-1-git-send-email-quic_srivasam@quicinc.com>
 <1667911156-19238-4-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1667911156-19238-4-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
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

On 08/11/2022 13:39, Srinivasa Rao Mandadapu wrote:
> Remove redundant and undocumented property qcom,port-offset in
> soundwire controller nodes.
> This patch is required to avoid dtbs_check errors with
> qcom,soundwie.yaml

> 
> Fixes: 12ef689f09ab ("arm64: dts: qcom: sc7280: Add nodes for soundwire and va tx rx digital macro codecs")
> 

Same two comments as patch #2.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

