Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCDC46E37C
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Dec 2021 08:47:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8EFF23CA;
	Thu,  9 Dec 2021 08:46:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8EFF23CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639036041;
	bh=dwiBHK5glxP+IiiITbNrcF1aMhKp81CcD1gFLurKOGo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=coRP0eQxnmOxqMoR1a/aadFr9+cx2DsfAC+Rh7qwDet5giMOkxVwN6ZGB1YT+k7NQ
	 T26WYBJnDzWZq7hxJr8EhVWxgdxHDRstZOwELvfprcNsKbm9GG0Q8s6dt4yYk4FxHj
	 dWrNZLDQUDf+kq39RWz8VFrbYgA9zz1DLfnB0GhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58947F802A9;
	Thu,  9 Dec 2021 08:46:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94F2DF8028D; Thu,  9 Dec 2021 08:46:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 507BBF800AB
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 08:45:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 507BBF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="bTTq3Fc8"
Received: by mail-pg1-x52c.google.com with SMTP id 133so4332929pgc.12
 for <alsa-devel@alsa-project.org>; Wed, 08 Dec 2021 23:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=S6sljBlTTFv4LyM3w/XYfSB/y8cuCgv6qRRvYOM58bo=;
 b=bTTq3Fc8zqIWiPIv0qyowDZ02fTob/teqhwg5s1M+8upNrw6f6A7/H7BhIbjGTUI3i
 9O7uP9Q7vqtDuY7xp/fO3yVuxhfr3MYcVYj03X5KVsGH1K+jQIPHILMrAccfL97yn8Fe
 LtCjk9Gk+6VOiX1Pb1bjQlFNDukElregC8rqGEIFwpf3LAEcZ4bPyaGajNz7C1hF/fex
 GB4JfcFWKklvnpig+PJ3WswnxelColuNpVWC+ifWgRlWFhoDTu4QoEKooD/3e4AJTFkq
 cMuX+ZfNLjLAhWhRmWHTeyNyXJ+taEpl9uvVvktx7gBZBvrScpxmsNM2zgP/u9B9bD/T
 Rx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S6sljBlTTFv4LyM3w/XYfSB/y8cuCgv6qRRvYOM58bo=;
 b=kBCkgl9qqcscwaGLBFAYWY7KD2WdzJG1G6rEK8nSAhifnYx0YhHqsulyEdSpEo2jqF
 HivPlpLQ2fxnToEwpL5wZoj/MjaVHv54MV5C/0zw78KIKTDtaS/LGvfGO6UjcqDs0Nwf
 HD4iFl+wRHqx3gGDzd6+0stFOe+XYsqyjh39LnuIapU8FIqEfuY/+r2dOD9B7T3qznOu
 Nyuyjl+wY6JfleUj1ddsPnBDZ32Y1w+DZXAznlRH0RERdMdEjbdljpZEcOsm4epx39uS
 1/9ZBm8sGIkMf+AFKDwJ7TunDeGtGs3QglZzAoLCqJIgiOahWWA5iW/4kKYYHNlSF5mf
 kYgw==
X-Gm-Message-State: AOAM5330jJgQehzY9pkfGvDAiDXLn8Vw9QTee5/d4hoOqPpBLC9JZmio
 VdxIO/zcDsGIlTufUhkBeai16GbSsGqocQ==
X-Google-Smtp-Source: ABdhPJy4vLVK4vNJiSv25VuTqdUwuEzS7XUOtNkjDw/CRuoa3MUT3oLkzCtaNr74NgLOMeqWqbReOw==
X-Received: by 2002:a63:2b03:: with SMTP id r3mr32170691pgr.328.1639035956433; 
 Wed, 08 Dec 2021 23:45:56 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:636e:d54:3de7:fbc7])
 by smtp.gmail.com with ESMTPSA id a23sm4571889pgh.35.2021.12.08.23.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 23:45:56 -0800 (PST)
Date: Thu, 9 Dec 2021 15:45:53 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: assign correct type to argument
Message-ID: <YbG0MRKHi0VrYD1A@google.com>
References: <20211209073224.21793-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209073224.21793-1-jiaxin.yu@mediatek.com>
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 yc.hung@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Dec 09, 2021 at 03:32:24PM +0800, Jiaxin Yu wrote:
> Fix the following sparse warning: (new ones prefixed by >>)
> >> sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33:
>      sparse: sparse: incorrect type in argument 3 (different base types)
>    sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33: sparse:
>      expected unsigned int to
>    sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33: sparse:
>      got restricted snd_pcm_format_t [usertype]
> 
> Correct discription of format, use S32_LE and S24_LE to distinguish the
> different 32bit.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reported-by: kernel test robot <lkp@intel.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
