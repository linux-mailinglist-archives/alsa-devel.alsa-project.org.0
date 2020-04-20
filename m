Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 266001B18EC
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 23:57:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8EC21685;
	Mon, 20 Apr 2020 23:56:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8EC21685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587419868;
	bh=kkxLaqrl/6cWfSDOWzUOUYNLiePShm6BNfGrHZJ42mM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OwAkvMiY5QtEzt8RDe2qwAHMEC+CyqV1o1QSMFV2xNydPegCsD/i79dBYcWxccLRp
	 v1s/gAiki4gXTb+zwWQLJS0orTGE0SwiIapkYkVdhIEwAKlg6x0GzwptyYnQQbErip
	 C3E8cNTsOLH8KqM1pQM8MI79lrhXUP34/zX1UdG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BB3EF8020C;
	Mon, 20 Apr 2020 23:56:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46DCAF801D9; Mon, 20 Apr 2020 23:56:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB27BF800E7
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 23:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB27BF800E7
Received: by mail-ot1-f65.google.com with SMTP id 72so3103807otu.1
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 14:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iCw71v93X288tPDb+ouK6ph9U/I5qrL2nm2iv5gfjUo=;
 b=s1zvV92rD+ywZJFoOLs6/R0pf6MdGlxjAFqcNBCgRweS7g2MCbiR0ZYXRJbZHq2lCA
 DyXMVfjveDBCGhPNC2RUFBEhr32rVrmSfXwbVSydp0jY2KvYIhEA8B+RgM1WUHCi1djY
 JbxOk33FiyNDrKSwX0kgbgTtjFmLzyUVAa+Js8t7MmaNLOaVCBsJwaCC5PJlk6bNmugT
 ICgOor45zcUcupdpgETNnW4DGmysatqYE8+2PYoEvRx03Hc71l1vgEeGIspXF4xD23+m
 wErkWsWb9nmWPWkOitwgFHvaC12fKyl/5ONUr8iEsC5Xb9CxEu5/lmnL6pcJh94LegmF
 gOEw==
X-Gm-Message-State: AGi0PuaYxWSYHV5E1D7GUNaCCFuc3gQ9RWRbfOql3glxjzKPdeXnbudr
 GxHURo/RHPFCLRtDWa+WDw==
X-Google-Smtp-Source: APiQypJ2UbkICoX7+yXMjbxjcdQP7ntZI5u01giYlSzLCtyuo2QmFFLftwRDKn7Lr2RxloPjBms4KA==
X-Received: by 2002:a05:6830:2439:: with SMTP id
 k25mr1339863ots.76.1587419754478; 
 Mon, 20 Apr 2020 14:55:54 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h64sm192630oia.11.2020.04.20.14.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 14:55:53 -0700 (PDT)
Received: (nullmailer pid 32546 invoked by uid 1000);
 Mon, 20 Apr 2020 21:55:52 -0000
Date: Mon, 20 Apr 2020 16:55:52 -0500
From: Rob Herring <robh@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 2/2] dt-bindings: soc: qcom: apr: Use generic node names
 for APR services
Message-ID: <20200420215552.GA32508@bogus>
References: <20200415081159.1098-1-stephan@gerhold.net>
 <20200415081159.1098-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415081159.1098-2-stephan@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
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

On Wed, 15 Apr 2020 10:11:59 +0200, Stephan Gerhold wrote:
> Device nodes should be named according to the class of devices
> they belong to. Change the suggested names of the subnodes to
> apr-service@<id>, which is already in use in
> arch/arm64/boot/dts/qcom/sdm845.dtsi.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,apr.txt | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
