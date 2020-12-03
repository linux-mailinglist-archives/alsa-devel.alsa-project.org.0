Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DAF2CE1F6
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 23:40:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1695F1856;
	Thu,  3 Dec 2020 23:40:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1695F1856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607035255;
	bh=A15gPCmUyOTaRxTE49bjRcDY3dJuwz6rCBKcye7tCZo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IqsNCJ46GGzCFe7RkX26SpyxAUUhEupRjOgo8zGnXUYxaji/b9YO3zvo+raCZAted
	 UgXjh/OAv5vu+dKWx7OLgvJy/qxJjGyDKZcdGg3azwXxydWsdwSoZL+GNSsG+N2dGL
	 4AbQglTDMe9G4fBdfJ0IOE8RfxKwP9QFVnG+OhvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72FD9F800E8;
	Thu,  3 Dec 2020 23:40:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB756F80158; Thu,  3 Dec 2020 23:40:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE050F80158
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 23:39:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE050F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p1gwki3o"
Received: by mail-pg1-x541.google.com with SMTP id o4so2321595pgj.0
 for <alsa-devel@alsa-project.org>; Thu, 03 Dec 2020 14:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Qtj77dS9cHDPtLOQV8kRZMJrnqowkKFbs0Ao69ze8yo=;
 b=p1gwki3oOUo+P7PEOXQvu0gEWvu282wplUNpim3bRudNhLVadPVjh3Nx0CBqu2B2si
 2tH9peMetiV8ZLFoBtSCyttjOzm46Xp/iC8USe1djX4MQr7Dnb5fAKiuRvzC829CKSYf
 vZvcGqDgtR4MeHvDKqhfVjCsRNSHd33LVwpqdNceX/miA/4I/MPUDdCxbDWoRMBSfCiv
 ZLxzMWwOunAjPVyEudrVou3xwAcj4ypDZFOVMqQ/pSaLUmyYH3L5ej5MKHVreGIMiRNy
 LE6PYmlZKKud/KnvpcHekr/20xf9NQshmEvEL8ZJuip+Xhm6YHgc1hnkv1AjVnHBpOoq
 8qAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Qtj77dS9cHDPtLOQV8kRZMJrnqowkKFbs0Ao69ze8yo=;
 b=ONFqT6vVwJukoDAjDv4BG830O/6ElI/kmfzK5s59K93a6XEn5RTd3Rf6C/IUHo+c84
 GJHnkI8qdq7a93ob40qUb0yF+zRyVpYFObXbTLdWVWrfw8N03oWHeV9Y4kGiYIs6Io2P
 nVFYv7UAxjUv8yZOzYFNGMV2i5yMg6bVPtHt67z5oVy785/LlBGbmSHiBMjTtuhu2w5f
 sXh9gJ52YGUkpOrWdwyoLuL17zgN6fuKTIftdkaeMkOEBp8pnfwrAq1dGro2sGPdnIej
 5dXuHCJvFdXwGbzoceOi+QhcJ4NQOuT1u3Ps7+olUDAzAC/5ecmJYFXYqgsCQ27anAKr
 Ypyw==
X-Gm-Message-State: AOAM531aPtKkVGJNvdX6iUrqChm4lIBWz74Mv4/y2mVUx0jw3b4dRaJF
 WkCkse2iS2hub8P4Ckbc//4=
X-Google-Smtp-Source: ABdhPJyRSHJAid1qLYHP9zDmtf4HjETwpYJVHYSQGmjoPkUfJgaFvmQ4jNjlnjBiGOtzRniTkZ8HUA==
X-Received: by 2002:a63:4623:: with SMTP id t35mr4888350pga.270.1607035188896; 
 Thu, 03 Dec 2020 14:39:48 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id u3sm2817244pfu.47.2020.12.03.14.39.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Dec 2020 14:39:48 -0800 (PST)
Date: Thu, 3 Dec 2020 14:36:55 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ASoC: fsl_aud2htx: mark PM functions as __maybe_unused
Message-ID: <20201203223654.GA10130@Asurada-Nvidia>
References: <20201203222900.1042578-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203222900.1042578-1-arnd@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Timur Tabi <timur@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
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

On Thu, Dec 03, 2020 at 11:28:47PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When CONFIG_PM is disabled, we get a warning for unused functions:
> 
> sound/soc/fsl/fsl_aud2htx.c:261:12: error: unused function 'fsl_aud2htx_runtime_suspend' [-Werror,-Wunused-function]
> static int fsl_aud2htx_runtime_suspend(struct device *dev)
> sound/soc/fsl/fsl_aud2htx.c:271:12: error: unused function 'fsl_aud2htx_runtime_resume' [-Werror,-Wunused-function]
> static int fsl_aud2htx_runtime_resume(struct device *dev)
> 
> Mark these as __maybe_unused to avoid the warning without adding
> an #ifdef.
> 
> Fixes: 8a24c834c053 ("ASoC: fsl_aud2htx: Add aud2htx module driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
