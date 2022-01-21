Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFC5495C18
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 09:40:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 966D82B2A;
	Fri, 21 Jan 2022 09:39:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 966D82B2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642754424;
	bh=MgIwdzcr7LV9skhmbvsLlJxcxXhmadQznqfSYu9d7d8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gk+Bv7MSxnkaVSAsPcOs3OwOQ0uiABJkRcSUR3FQBUNXWzdjUSZpFE3T7xndXbKps
	 u0Vqo6yHsxq1Ifv+Yeuch9cD7WsX00ggylVL/DEKLcpUk3OQv15HP9xhtq6LHO/2Hy
	 lT0OrX8Aok7pJpPVrfG2Q0fXvIlaNOGR1jhuN+ZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ACCFF80302;
	Fri, 21 Jan 2022 09:39:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CBFFF8028B; Fri, 21 Jan 2022 09:39:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FSL_HELO_FAKE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6C7EF800F8
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 09:39:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6C7EF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uQY0mIJW"
Received: by mail-wm1-x32d.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso27384924wmj.2
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 00:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=5WZ6mypcJ2R1wGosAmpXdFhGbAKQVNpR3ybI6dSypA0=;
 b=uQY0mIJW+qAbtFxNL+dj/Sh1kCoe8+m9G/K37p1/XZotpZTwylvIVUhbu4wuiCBPxn
 5WyRpQczzRHfhm59xVpI5/yNi0XMIOASC5sn/Z40bCp87AxAOBpdNfA8tf6R+tun5I1b
 WwVLUTw3p3IVZy3MVpZSV5nm2sGqxMdigzpMZDB3Y+t629XuN51wx8NnbVcM2Ox3Q9Qd
 Mvu5ZIw/xgeZe3oPmm8KlDYZlM/d3q1XFH/BDGKOzcilp2QDD5tcXNBtikBz5kiWAHcA
 J0dhGUB7oagXnXwjkj5k2YyFsrrF/JFZIGpE6Vz+mOJDBoSO5FmSl986Go2p0bs6CXkE
 yVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5WZ6mypcJ2R1wGosAmpXdFhGbAKQVNpR3ybI6dSypA0=;
 b=gHEebnNkGnVKFtO2gn0jsoDXtMA2vVnKqyNGiLnShzaz3mPNqjKxiBQdgtIaQBnCEz
 CYr8HN71HkNkvADKyUJt1STXKOHc4jQBeqv73Vmok0qgmJ9kPtqGMu3zO2O2CACPaP9L
 SUbYlL5QiBf3BnCnKHUv/fVeP7CZWK9mc7gjNERVv0U5ep39FWR0il08b/YObt9GGEP6
 Klgt/jacf/SZC5QJVayPcxzRcKkBShS/PDBbGK8Q/SCAlcOd5IJmJmFQZMY3BNtxkhUy
 AJ5ylbxl+YNfIoGT414bI7QOChO7vN19hixWf/1rsbKZHNb++2hMrC/mqd0wehYaidb2
 6Aiw==
X-Gm-Message-State: AOAM532xTuNORG4W4Xw+WUNrqXrKRpzGzfdL1P2zsQda7dWcdRrJqv1e
 uCemeB6uz5uZdei7EPAVpkFUpg==
X-Google-Smtp-Source: ABdhPJyN3vNmCddqfvDMAzeF+N2ym9YGaiVGex/2JkuoDu+0WMpnuPQz3SxAAYWHxCKgEFIlNEGkFA==
X-Received: by 2002:adf:fd43:: with SMTP id h3mr2862159wrs.341.1642754344867; 
 Fri, 21 Jan 2022 00:39:04 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net.
 [86.15.223.86])
 by smtp.gmail.com with ESMTPSA id d11sm6351991wri.65.2022.01.21.00.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 00:39:04 -0800 (PST)
Date: Fri, 21 Jan 2022 08:39:02 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mfd: cirrus,madera: Fix 'interrupts' in
 example
Message-ID: <YepxJgjQ89PmMUkD@google.com>
References: <20220119015611.2442819-1-robh@kernel.org>
 <Yem5rQ7RFG3bUUxV@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yem5rQ7RFG3bUUxV@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>
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

On Thu, 20 Jan 2022, Rob Herring wrote:

> On Tue, 18 Jan 2022 19:56:11 -0600, Rob Herring wrote:
> > The 'interrupts' properties takes an irq number, not a phandle, and
> > 'interrupt-parent' isn't needed in examples.
> > ---
> >  Documentation/devicetree/bindings/mfd/cirrus,madera.yaml | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> 
> Applied (with my Sob added), thanks!

Was going to say ... :)

Please add my Ack too:

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
