Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB5D5EB4DC
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 00:55:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB2D8825;
	Tue, 27 Sep 2022 00:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB2D8825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664232927;
	bh=XfKrh7FQOgJvFDa4UbRGsR3/r1w66NIij2K5IRC4wsg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FypWsD7SqBm6vkhvusMHZ1PEMt79FiuPVOoiRLI3Tz1U1Ut4K+gFyBksXE2YlixqS
	 JYCgUzHFyzf1PzAKpblI/Cq4xJo6dalwryj7Ce1RMOnHY8k3ReravYRwDW4v70UUlX
	 XxOvle42zLoT9EzXvFxk/CNKRmsVdow+7Ej1jQPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A408F80134;
	Tue, 27 Sep 2022 00:54:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3373CF80134; Tue, 27 Sep 2022 00:54:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFCDBF80134
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 00:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFCDBF80134
Received: by mail-ot1-f47.google.com with SMTP id
 w22-20020a056830061600b006546deda3f9so5401151oti.4
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 15:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=5EDhuR5nnVVwjruloR7awR6vateNTWu+qdgS57G4+ss=;
 b=i2zHrmSa/q4oERHsQJYTBkgFG79zwbvOc/+w6XKKXuO03NmksCObyUMz7sEw2KE7n8
 vqBEP+B5LmFaNIPD3ywnJ1bca76cXDz6z1aTQJzBJUAhk7bi4u8t3t7FMT2Elp4px+Ua
 yzj7M1/LPs+baAShUZE33xN6inErOvun16WYp5pMXSiscgSY/9iVeWJ7VtCxtwm3Fcoc
 ryP5YgZM9gP11DKvouVETkrBygoX+ncMbztflZt5SauRicILbwvemA/TN/yZJLfHgqay
 ozsN5R7Gg2RAbZXCZe5dduWljy7ZxqIHeB2/6bTfdRPVrDKLCA5nGJlu8uxUYMWRR1Ki
 YUvw==
X-Gm-Message-State: ACrzQf0YURReshxw8H4Nu7do4YnP3OhnBW8Ym7kSKQjSzqkaIGbu/99E
 E+HEW8nKQG5tTXi/ZM21ng==
X-Google-Smtp-Source: AMsMyM6gx0UiVSc1eGg+lhLXNtx8z9hFLkWGQk5YyWHvgLfIkYCb2AvYqItyYBiX19891NSJPHzzTQ==
X-Received: by 2002:a9d:7b56:0:b0:655:df1d:c9f8 with SMTP id
 f22-20020a9d7b56000000b00655df1dc9f8mr10227348oto.32.1664232859689; 
 Mon, 26 Sep 2022 15:54:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m13-20020a056870560d00b0011bde9f5745sm9491804oao.23.2022.09.26.15.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 15:54:19 -0700 (PDT)
Received: (nullmailer pid 3114680 invoked by uid 1000);
 Mon, 26 Sep 2022 22:54:18 -0000
Date: Mon, 26 Sep 2022 17:54:18 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 09/11] dt-bindings: slimbus: convert bus description to
 DT schema
Message-ID: <20220926225418.GA3114619-robh@kernel.org>
References: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
 <20220923161453.469179-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923161453.469179-10-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
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

On Fri, 23 Sep 2022 18:14:51 +0200, Krzysztof Kozlowski wrote:
> Convert the SLIMbus bus description bindings to DT Schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/slimbus/bus.txt       | 60 ------------
>  .../bindings/slimbus/slim-ngd-qcom-ctrl.txt   |  2 -
>  .../bindings/slimbus/slim-qcom-ctrl.txt       |  3 -
>  .../devicetree/bindings/slimbus/slimbus.yaml  | 95 +++++++++++++++++++
>  4 files changed, 95 insertions(+), 65 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/slimbus/bus.txt
>  create mode 100644 Documentation/devicetree/bindings/slimbus/slimbus.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
