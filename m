Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB74822A6F7
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 07:38:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9042715F9;
	Thu, 23 Jul 2020 07:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9042715F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595482688;
	bh=Jzb5mSKeEJRhUqB+VlsJhMGmv3w+dcMux6er8t3FhhA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fyaX45snba4Y+5Q55ucoYo8x2gyHK57nOFIUsiHWO7vrYR7b1hrPCNN68q+5bvNl7
	 fvuZW8pCjLUYctPPPNsQPvJZ+Du4slfrsV8KPw7Gm0shaR7WX9x4jn0FPhpfLGEpRV
	 fh3P4KkGxMtzTlHIlDU/Zq4wKN/dJ3HIG7OxxPVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A111DF8020D;
	Thu, 23 Jul 2020 07:36:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49B9FF80212; Thu, 23 Jul 2020 07:36:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCF25F800CE
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 07:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCF25F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="o5ZB3El9"
Received: by mail-pf1-x442.google.com with SMTP id u5so2421498pfn.7
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 22:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tFcZGTVxEOvpoeXkUsiN4vBy9B3kLzwfdLU6/Bk7M20=;
 b=o5ZB3El9NmbYAUMnVLSF4MIKU/vBZ/hxFH6zt/eg3JEdcrIYxBDT5DdYf4FaDNM7tc
 HYHjiAVqeSntdb6shGkwKcnEkageOOeoE6zxzESicOczUGrZEhoT9DaQHtjx5/yB4OYY
 1OfErF+AkU8/UiZFKOriS/yecoTRi9lBcCUC/2ZIbRJXr9gJb3RmlQPOYZ41m93EV/vV
 5IpLOGY1BcxzSVSF8CQu+FUYZ9Top4dkOSr5fM3ywCobxPGrAjWg/PmOn0Kf5mKXlZJM
 +KDrpfzLSI7/vaIf0f5ZMCVlZlPjz80SNScDW+gU0Jy0JQX9zaLqvfvb7wJLkqaSg4DE
 Jotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tFcZGTVxEOvpoeXkUsiN4vBy9B3kLzwfdLU6/Bk7M20=;
 b=ONXTJrP530S1MMjeW5ngHmc/ynuhLbrtNJsq8Np8Oka9K41XwVtcIFO8/wa4iCQ6o8
 RoquDJ8CG3k7IBKNy53xQ2+cW+DAm6U8hHEVxU5sLbxntAsMZZH/0z8ry4Q/scQZGn+X
 9KuCw0Ea+Pj3gFQGGlTBnMiOH73yL8s3fdj0OCL6ZLjg1Q833MoXSYeyAzzvns3j5WVo
 lgcdnXH6TmXKeemSYi4Qy3hUZ0oO3IK7Ie2uJa0wxeJsRdjFFX5h2j3dFKfIu7NhRP0p
 bQd5IB8LMFkUQAu6CJHSMUiLTmV1XkTjfYx699mwewwM0TYcVRn8vtrL3itOsZfJDtR3
 7tuw==
X-Gm-Message-State: AOAM532GZuxJNBWYxSG9nopdnbhzHU/9QQUAnl12K8F8PNywNYtla8XZ
 LCuoi/bXUnyKDjp+o+L4dFQ=
X-Google-Smtp-Source: ABdhPJwFIlyfJWb07kcj58BziwubzU5I4KohZd4uiMgJMQI1YstOLbnS44kIKgEb1P7Wi4W5qBcaaw==
X-Received: by 2002:a65:6554:: with SMTP id a20mr2447316pgw.301.1595482572334; 
 Wed, 22 Jul 2020 22:36:12 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id o128sm1414392pfg.127.2020.07.22.22.36.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Jul 2020 22:36:11 -0700 (PDT)
Date: Wed, 22 Jul 2020 22:35:39 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl-asoc-card: Support configuring dai fmt
 from DT
Message-ID: <20200723053538.GB5476@Asurada-Nvidia>
References: <1595302910-19688-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595302910-19688-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Tue, Jul 21, 2020 at 11:41:49AM +0800, Shengjiu Wang wrote:
> Support same propeties as simple card for configuring fmt
> from DT.
> In order to make this change compatible with old DT, these
> properties are optional.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

For both changes:
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
