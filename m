Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DEF45D49D
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 07:14:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB936181A;
	Thu, 25 Nov 2021 07:13:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB936181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637820853;
	bh=dMj8l/p5FRKgJRec0aZR4tkzSFYRlxJqBSMXNvEZULw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cbfFigTXSBrN12W83pJMV9c839gE7oEZrzD5jJVv6rMegyhtd13gnpT4E5PVB/XjE
	 wL0gCQMWiTHjKKyRk9zzSNSQI8krAC/J5XhPR17xDFv90omeEBGfjIzWbFt9hbDt9L
	 +o3GuCryjxO6Or4QOp7FXZDtwe00XJq+tZcKcVsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EB8EF8007E;
	Thu, 25 Nov 2021 07:12:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 934C1F8049E; Thu, 25 Nov 2021 07:12:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B9ADF8007E
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 07:12:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B9ADF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="n44WZ2z6"
Received: by mail-pj1-x1030.google.com with SMTP id gt5so4421823pjb.1
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 22:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YKVOYD3BZCO+X1y+/55daB35BTEfDtfDdx/rM8jqf9E=;
 b=n44WZ2z69BFhD6vXWR3Y71Tv2Zgm+1rz0FtTfpotm+0hmcPZ4gF1VMyFrivfZgFzR8
 MOGavT5d/logVOf2dPzjha8xDqIvaFogxvhakYpzRenhBiKAgeES61jdpxEqZg2oBi6c
 7mwCxUrW6+HKm73SPS/WPDIL6NhLX5CxWq3DUWJWqeGIg0xkpsm3jl23w9Y7ZhtoVkrf
 XXap00ZG3ymtg31S8xYpPyHcp3t9bzHzsbIhEJrt604GMm4tSSm1S9jOjbNKLk3KLYR3
 rsydc2tsDnNk0Tl45d2/T9Z/BEDWXslWhVFaIrkLtoByCb29PbSsbNuJEBoiELGgbGeM
 hP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YKVOYD3BZCO+X1y+/55daB35BTEfDtfDdx/rM8jqf9E=;
 b=fOGXPeRrcn4sbAtK0p1yUn3jFeqgv+7aN7S2tYCv+//YSdKWibhvmCYEkLkNke83LG
 I6rRSNtWyjJaLnVhjSP733zLqBfesNnn/Z/pTJJiYU8C3MVcdj5r++v7IhU+ppX4Nq6+
 QuJoQ2NGfDePjV3QFB4Sk5CCsfuBSaKpsgh73YSXu8kL0EvL9Q7k1oTurQr9n5PWy8HK
 l9fvGoajU+6sqHXmiULKThvCTAFt4k4jVJf6U3N2ysTNjS/7p5+UkhEw7565pBKSUbYd
 dJLwrZfDE9VpVxCPxAf6a5Hp0hhQfV73Q/fFlxDUZLw2sTZEgcU0tRnxafMpMCbRjmFI
 KlgQ==
X-Gm-Message-State: AOAM5334PrX8/NEQzws/LWKDuAFtYVNglm+wg/ThKz23Ujfc/ckHvGrU
 oQ/JJBAjSHSJ+DR/wvLOoOEuWQ==
X-Google-Smtp-Source: ABdhPJwCSDiaHHIcRXyx/a84z6DGPSsJ7vljD/viUs2u9iWx1qa9RfjpBOH+FGAIZgcGnOGyAhdYaw==
X-Received: by 2002:a17:90b:1e0e:: with SMTP id
 pg14mr4061574pjb.143.1637820760339; 
 Wed, 24 Nov 2021 22:12:40 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:cd6a:1959:1c65:cc19])
 by smtp.gmail.com with ESMTPSA id y130sm1621671pfg.202.2021.11.24.22.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 22:12:39 -0800 (PST)
Date: Thu, 25 Nov 2021 14:12:36 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: remove unnecessary CONFIG_PM
Message-ID: <YZ8pVIVApvSiW6Ue@google.com>
References: <20211125042422.2349-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125042422.2349-1-jiaxin.yu@mediatek.com>
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 garlic.tseng@mediatek.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, kaichieh.chuang@mediatek.com
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

On Thu, Nov 25, 2021 at 12:24:22PM +0800, Jiaxin Yu wrote:
> The unnecessary conditional inclusion caused the following warning.
> 
> Such as:
> >> sound/soc/mediatek/mt8192/mt8192-afe-pcm.c:2368:32: warning: unused
> >> variable 'mt8192_afe_pm_ops' [-Wunused-const-variable]
>    static const struct dev_pm_ops mt8192_afe_pm_ops = {
> 
> Because runtime_pm already handles the case without CONFIG_PM, we
> can remove CONFIG_PM condition.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reported-by: kernel test robot <lkp@intel.com>

Acked-by: Tzung-Bi Shih <tzungbi@google.com>
