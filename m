Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C711E06D1
	for <lists+alsa-devel@lfdr.de>; Mon, 25 May 2020 08:18:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D1DD1712;
	Mon, 25 May 2020 08:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D1DD1712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590387526;
	bh=+43PzMgJYllN1LAIC1RAsYP7m+86k9FimLgH4sDQ6As=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ri6idJOTRDtF3ixm1OYHDOeAydiRnOgVsqhWUKGvELoQIa73YCxe1A9SA8uvwY0yY
	 rNUA9xavtiV2a8oio5sM++SV2B++fJUHV2K58faXOxbePXq/neRQsemnmNy/CKj0+I
	 ic4be/eULmz2C0CqR6IGHGKwYQ6LaIXSA1JgacRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99BF2F8016F;
	Mon, 25 May 2020 08:17:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8D89F8016F; Mon, 25 May 2020 08:17:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E74BF80100
 for <alsa-devel@alsa-project.org>; Mon, 25 May 2020 08:16:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E74BF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ri27KJ57"
Received: by mail-pj1-x1044.google.com with SMTP id q24so8150869pjd.1
 for <alsa-devel@alsa-project.org>; Sun, 24 May 2020 23:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1y4ds9zBC1SyppOslu2mLkxYcNHMS7bdeKWM7VoLVJM=;
 b=Ri27KJ57iDhs85zxL0RpQLEdYtlE2a3/aJma/2msgokrz+N411A+WrgmoubU77/pCl
 Yd8CtuzMQQZ9st9XfemTdl/UDK+Lg2y2aV0zsjqMoJbjiy2dgh2mSgMc1BI/S/ykes3y
 bnjRyoMAbybFPqi2XL/PoLK3RGacV1GBBnvZHLEElv8DAIpwmdKS2xMwU+uXmaZxKxrp
 azXyJBvjfpmt1G9WrzH6mgCWYVkGn6owSOkeU5ce18CWs9iujmuSPAWRB+XiD1xovLrk
 R+eCt1fDZtETLygzNUbhw8jyvId4OqGNVsZlEzfcx4PmA/PrHURT1ZljgOWcDxpndrWw
 FjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1y4ds9zBC1SyppOslu2mLkxYcNHMS7bdeKWM7VoLVJM=;
 b=I3WfJJo/+I0u2kNloBaJ3wCyttWfktxsOkBdnGTfUgGqtFSgoTzFPz79F4gnwRwhsx
 nksdkk962clUnG/VDCy7jmRm3sT4x7oKSxC8gIPL+vXukB0RNbg6a+fz1KcR2QXg6UQB
 LtIYsdFa4XyaJ0GxrwLeaET7uPggYrH4/m+4T7bk3dOtbFwNhrd2ZkfA8DI6G0BSJR0g
 YZeeOCVxrL1ExGzyFFrD0HKlGdOrEY4EbL9sktPuv4VJ6qlJ+LybIQNyZ82CWAvWeukP
 sOvxlfCQVX4oCOam0g9aUgfA2Ur70T+li0mv8eV0tzArzebFZEEdszY3/m0Wb4NK8ioS
 83cA==
X-Gm-Message-State: AOAM530S6T80XWyLYaDG7K669inLM3mousD5Nwn9rv5GBcLJW803/Zep
 rbg0uyBMTzzv21j7KZjElWc=
X-Google-Smtp-Source: ABdhPJyLnql6NYz3i6BDhhM9Z530+1CTHhFC5iBW0B2EeJA9dSWqab0WegzIfvg2UY2Fb/PuDkNTfg==
X-Received: by 2002:a17:902:7787:: with SMTP id
 o7mr20963332pll.52.1590387412768; 
 Sun, 24 May 2020 23:16:52 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 o16sm3623730pgg.57.2020.05.24.23.16.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 23:16:52 -0700 (PDT)
Date: Sun, 24 May 2020 23:16:46 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Merge suspend/resume function to
 runtime_suspend/resume
Message-ID: <20200525061645.GA12112@Asurada>
References: <1590141444-28668-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590141444-28668-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Fri, May 22, 2020 at 05:57:24PM +0800, Shengjiu Wang wrote:
> With dedicated power domain for asrc, power can be disabled after
> probe and pm runtime suspend, then the value of all registers need to
> be restored in pm runtime resume. So we can merge suspend/resume function
> to runtime_suspend/resume function and enable regcache only in end of
> probe.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
