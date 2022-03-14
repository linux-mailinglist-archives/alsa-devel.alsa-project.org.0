Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD894D903F
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 00:18:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50803171D;
	Tue, 15 Mar 2022 00:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50803171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647299937;
	bh=b5qaYr4jus9PAvQVHEz8DFj0wyevvnS7UCzasxOWAcA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lzSBnHm85X23OFaCQf+Yqde6p6MUWuulGaBlg8Xa5eqQLhdvgnNfwTZ9SRZ8OtH2h
	 xpJ/sCjFnlh2yn0fugdUI4Pv9A/X36RG0tf3nBk4+WMtQ/SqM4iUApxiDnt0d0sU29
	 Wkivfj9htiD4+XbsnlBIVgfMhFDoik5rUobvWUb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB1E9F801EC;
	Tue, 15 Mar 2022 00:17:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B1D5F80139; Tue, 15 Mar 2022 00:17:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3A67F80100
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 00:17:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3A67F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="njGtCAef"
Received: by mail-yb1-xb31.google.com with SMTP id u61so33903968ybi.11
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 16:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+qhpZ4/gQn44J41+/TZnqVxppcvQMQk2SpTOJ9SJma4=;
 b=njGtCAef1QBlBntVQw5+KnC5czMQCkltUAYIkUxfpTnSLBtrsetXxuhKATLSUjoxbi
 PjxqIGFnvbvof7+hKZrBMR+zMGIa/1CfUWQqHY3EIfi/HRvPcP1FnzWqnsed8XV2uwe3
 e8P26Rf0BRTA3hIXTVa1ijVWkWX60/OcBoWxxk6JtlgsMfhCvBscS2bHr5PpAzkgPv6b
 3tugqcBbi0Of36og68swWqwOpxjeGn3hhi8Ylr8qcvvulKkZjE2akzXDCzOZ++3z7c02
 1SfNSlf/lHyFExW7gler46i1qXHyGjC0OimYa6eMB/x4lYo0VLSGPSVGzcpOi8qW+lWS
 qOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+qhpZ4/gQn44J41+/TZnqVxppcvQMQk2SpTOJ9SJma4=;
 b=WcX8k2++MI1C5Dt43WZAVpV2JuTRs9I9JJtIsfdj39lIAmdZQnRRsVCNiMXwK8xuDA
 zrkXqg9n+5Ugp7iBK39QDUYN7/zfdxOkg/8A3dObFWRc0bnQCd88DPfP8TuMBwJ6/zfb
 iqHCIrbkYf8oR4IBD/8TDPb2qcq7MgKDS3kFnm7I5wLG7bBEeE0xD60a/JvdGgPWQ8r3
 1IS0Q1LZIDR6CMSRvLfSpwl4GsImdrWMIzEKxvZ2ayyHsNOsQBIOffdGqm+37LzmjCG2
 BUz8QumPeFIgFbu5DvcxXDYoYX5ZeaGqCIKbZdHYfuth45ShTspvrhMOvGz/WFwbEOqk
 1K+Q==
X-Gm-Message-State: AOAM532GAmCMDnk8dkY4bs+0k+9CL9/ogNNLCApN1IOrptlOMKRnTVlK
 WnarqfZQtEXuRtszu6jOIL3Oj22ahi7aUZJAZpo52Q==
X-Google-Smtp-Source: ABdhPJzn2AGcMQQ0Ue+lFE8XgGj75yeqVsqxktcqS4/nhxUbDwqbTmo1pLNFRbd6YCUHGHSkf/tGLjs9SDMj6tj9FKM=
X-Received: by 2002:a25:4e82:0:b0:633:68d7:b864 with SMTP id
 c124-20020a254e82000000b0063368d7b864mr2996309ybb.514.1647299854049; Mon, 14
 Mar 2022 16:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220303232350.2591143-1-robh@kernel.org>
In-Reply-To: <20220303232350.2591143-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Mar 2022 00:17:22 +0100
Message-ID: <CACRpkdaSiVhg1dZ_uhZEsxT_QYrwEtdodUAhx4nwMd9S=-g_HQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: mfd: Fix pinctrl node name warnings
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 - <patches@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Lee Jones <lee.jones@linaro.org>
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

On Fri, Mar 4, 2022 at 12:24 AM Rob Herring <robh@kernel.org> wrote:

> The recent addition pinctrl.yaml in commit c09acbc499e8 ("dt-bindings:
> pinctrl: use pinctrl.yaml") resulted in some node name warnings:
>
> Documentation/devicetree/bindings/mfd/cirrus,lochnagar.example.dt.yaml: \
>  lochnagar-pinctrl: $nodename:0: 'lochnagar-pinctrl' does not match '^(pi=
nctrl|pinmux)(@[0-9a-f]+)?$'
> Documentation/devicetree/bindings/mfd/cirrus,madera.example.dt.yaml: \
>  codec@1a: $nodename:0: 'codec@1a' does not match '^(pinctrl|pinmux)(@[0-=
9a-f]+)?$'
> Documentation/devicetree/bindings/mfd/brcm,cru.example.dt.yaml: \
>  pin-controller@1c0: $nodename:0: 'pin-controller@1c0' does not match '^(=
pinctrl|pinmux)(@[0-9a-f]+)?$'
>
> Fix the node names to the preferred 'pinctrl'. For cirrus,madera,
> nothing from pinctrl.yaml schema is used, so just drop the reference.
>
> Fixes: c09acbc499e8 ("dt-bindings: pinctrl: use pinctrl.yaml")
> Cc: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Fix lochnagar-pinctrl nodename in example
> v3:
>  - And fix lochnagar-pinctrl nodename in 'required'. Sigh...

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
