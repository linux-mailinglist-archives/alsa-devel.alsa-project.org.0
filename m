Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2993F26C2
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Aug 2021 08:24:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F947167C;
	Fri, 20 Aug 2021 08:23:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F947167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629440662;
	bh=DPdFuoYVBV2fy44BIlhXhA216bktD1PVavyAP1G8DyQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ts0RCI/0wPVyE5m051QhM9U2ZWHxOqez7qs/EavG7kqH2acCiDqIdK0L2zN1l7zrl
	 wk04GFPP+Zv9dcexmx8jCqXSaH6gPqWQxUCT6RPkAdFTIvGx2I1k4FvYh/I10rtITw
	 jHaDKwcJdYozHz+mU9IWuNv6CdHnR5bJUYNhFOJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE266F800C1;
	Fri, 20 Aug 2021 08:23:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEAB9F80249; Fri, 20 Aug 2021 08:23:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3A0AF800C1
 for <alsa-devel@alsa-project.org>; Fri, 20 Aug 2021 08:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3A0AF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="AelbYVYX"
Received: by mail-pf1-x434.google.com with SMTP id j187so7720129pfg.4
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 23:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=99KnB+URAYBtBEFeaEEoqvbN3Lia8bbvXa6b4D4VGvk=;
 b=AelbYVYXhvB2C9bFtneY/yrgfG2toP1CjqK6lvDsXri4wpxXyhmsJgoDY6ahx/XN61
 vKAczg+E4fXnnS8G0G93MoK9T+n8JSHY8ekq/8I4u69XNDvXXmaeliXWl3ny7DbR459m
 W50jTwNToE1LmUUokyr6le1aob0gVY3GnP1Ka3mI4XHwRz2fWCsY/l4SMPzwsS0xTXB9
 EixGvESxoBHqQEVnBddxUt4aKYU3B3NSH4JBU4qDMkK7Jhzi3FgC5Vb8HdCiGR2LwcMT
 sxBxULIIw3r+NvwPaEY2Ixaz7kUmSTr4+dFabybVlm+sD0srX/k7GhsedXDOGcsj6xyH
 5o7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=99KnB+URAYBtBEFeaEEoqvbN3Lia8bbvXa6b4D4VGvk=;
 b=Dlh2LRcc+4VD8Hr02is+cNi+RiJ6dPxRsWwQvXElZihiy8X6dBKFUrq6axjmdTMy4o
 C1q+lRgFsWJ5qiHI3l6szTTfyNyfkwTE8v5qO703VgusUNlp4gkojbJ0tLGDqF/Rezoh
 kvVIjG9G7Y4lEz4BXbr6v7YyuiAdMQwU19Tusc1/oRtCLuNYVOCtuIz5g3VG3dxToMQK
 c8F0Fw6TBG17MdA5CwqryJQajipv1eh2iMOjRjxATNJlaAKWYK9xAIYWulxKu+lwBY/L
 YmMXq45kYKJsZ6UMfdMo1ZgawBecWgjnJRBQwvId21qJJOGs9GNy1gxw+sUJ664YEuVB
 3FCA==
X-Gm-Message-State: AOAM533MFnn+qDYXRUV5veN+i6n9e1zc6Z3zUW3bn/HwSYe23Fb8dDu6
 HKGV7RW5dO7QHvsoEIRK6wUlHg==
X-Google-Smtp-Source: ABdhPJypGMO2Ed7IdFKaQRO9FolvH4ihNSVV3QakhuP+Wz6bn/ypKEJCBJHQBshWUbxfQ2Oh/Vy6BA==
X-Received: by 2002:a62:b414:0:b029:317:52d:7fd5 with SMTP id
 h20-20020a62b4140000b0290317052d7fd5mr18445201pfn.30.1629440567069; 
 Thu, 19 Aug 2021 23:22:47 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:549a:ad5a:e5bd:8c8a])
 by smtp.gmail.com with ESMTPSA id x7sm5507625pfj.200.2021.08.19.23.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 23:22:46 -0700 (PDT)
Date: Fri, 20 Aug 2021 14:22:43 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: sound: rt1015p: correct indentation
Message-ID: <YR9KM5ubMr9JLLb5@google.com>
References: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
 <20210819101020.26368-2-krzysztof.kozlowski@canonical.com>
 <CAL_JsqK1dhwSKbmCbuaWtBWQH0e-+rdJaWkzfx5b_5vX0toAjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqK1dhwSKbmCbuaWtBWQH0e-+rdJaWkzfx5b_5vX0toAjg@mail.gmail.com>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Dillon Min <dillon.minfei@gmail.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>
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

On Thu, Aug 19, 2021 at 04:52:38PM -0500, Rob Herring wrote:
> On Thu, Aug 19, 2021 at 5:12 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
> >
> > Use common enum instead of oneOf and correct indentation warning:
> >   realtek,rt1015p.yaml:18:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Tzung-Bi Shih <tzungbi@google.com>
