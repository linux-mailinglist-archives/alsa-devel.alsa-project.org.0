Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E4363FC97
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 01:11:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8944817A9;
	Fri,  2 Dec 2022 01:10:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8944817A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669939904;
	bh=maN3HmSwTnxT3kLD8fUrziroAS+4tYBWZBHKqsMkMSc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f8M0FxpV3TCAYQGT3rl6v+nSPeFHxFmhXnhtU27DFiOgzUFOj3o3eAMrOukW+aC6v
	 5OymH6hHuYfOI9cYHnt67Vs29uAR70o7rB8NLkvyif9fJJoYKLP7uBQF0rHSHuxT0c
	 Ioqi9Z/0HdcdqF+5FiwWoK7mZckPcRt5Zd9V03UI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E054F80118;
	Fri,  2 Dec 2022 01:10:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D39AF80162; Fri,  2 Dec 2022 01:10:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98DB1F80162
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 01:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98DB1F80162
Received: by mail-ot1-f49.google.com with SMTP id
 p8-20020a056830130800b0066bb73cf3bcso2004575otq.11
 for <alsa-devel@alsa-project.org>; Thu, 01 Dec 2022 16:10:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uwV47pF0x8U7rd7NR79rNEXGsagQJIpvbm5W5UmYny0=;
 b=crtLQwJzqWSBPjsz7pXV38+3IauNQ99CGnkRnAW+jyRMQuhtkjl6DTe66Z2PXADwEZ
 v1dQT/BqH/Qq5z+JnoWXf/ekF4s1yB5dhmb+yS0oaJTA7y0U5vv2LGWvuxhu1maa+W1z
 ZhzwMamhhSTueteS0FUfM1tMUCypxZqyLG2O+TJ20BS6oet7k+2DBatecSsqnHYUGTb9
 pl8LYHFdctpV6KBEWgb+cXwVNsCjV4S9iL+QGKslwX52jJdX2NbQDK9ZibwyNqpK3VCl
 xbeeJUJC5BBh9vhLFpaquLI5wBG2n8bVboYpQ/SRdQoXnZfkXkIKN4/gyBFtrc36hZD0
 YZVQ==
X-Gm-Message-State: ANoB5pn/E6FRoSN2//uVUvWtEmnMSOCkZj7wuP6xBlg85/27RmszR0gi
 Pjaci7Ol3Jdx7bSF1eZYZw==
X-Google-Smtp-Source: AA0mqf7AEpmA2qWD6lE5NIau1JNEjmDdHQY0KFYIoW3nQGe/ogvO3xevqCCrDzz9W+3Ftf1ypOHr4A==
X-Received: by 2002:a9d:2aa:0:b0:66c:44be:cf1d with SMTP id
 39-20020a9d02aa000000b0066c44becf1dmr23953181otl.267.1669939839576; 
 Thu, 01 Dec 2022 16:10:39 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v188-20020a4a7cc5000000b004a066f9a7b4sm2311577ooc.34.2022.12.01.16.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 16:10:39 -0800 (PST)
Received: (nullmailer pid 1740146 invoked by uid 1000);
 Fri, 02 Dec 2022 00:10:38 -0000
Date: Thu, 1 Dec 2022 18:10:38 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: soc: qcom: apr: document generic qcom,apr
 compatible
Message-ID: <166993983796.1740107.16144015318255344818.robh@kernel.org>
References: <20221201133637.46146-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221201133637.46146-1-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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


On Thu, 01 Dec 2022 14:36:37 +0100, Krzysztof Kozlowski wrote:
> Document the qcom,apr compatible, used by Qualcomm Asynchronous Packet
> Router driver.  There are no upstream DTSes using this compatible -
> instead we have ones with APRv2 (qcom,apr-v2).  The driver does not make
> distinction between both compatibles, which raises the question whether
> the compatible is really needed.  Document it (as compatible with v2)
> for completeness.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
