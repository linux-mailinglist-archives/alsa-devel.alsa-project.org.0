Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5BB1BD1EE
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 03:59:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33B1E1683;
	Wed, 29 Apr 2020 03:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33B1E1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588125551;
	bh=5aGXILf0SoG4xP1tKUlsHLgZVeol8OS3DTcwRqZJjWw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WQtwSYWzvQCXW4ABY1aHXpSYO8tKqpZQrlU5X8jvg0sMj3NzGuChwMFuWACb/+oyx
	 pMUBZgMBqcWuXDREcNhghG/WRy7IaB4zoqswF668TFPv2dKdT6/11mTjvEYJ4gP9fS
	 0b4y2c/yNdRMaegXS0/gemnyZGRe/8h0uwxDB75Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F532F80232;
	Wed, 29 Apr 2020 03:57:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64430F8022B; Wed, 29 Apr 2020 03:57:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E94B4F80109
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 03:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E94B4F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IZbdQf1a"
Received: by mail-pf1-x442.google.com with SMTP id x77so338516pfc.0
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 18:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=piyFAQuE1nQbg6TLe0uPF76+MOhAF84QvXHI7/T29lI=;
 b=IZbdQf1arsR3leQH3qkMB/7zjjQNiHdLMfuqXBARYJxDJI0GWKrDArn1qrVOvNnTcd
 jNtWkvKsvdexhMVmVeYCMGbWXAO2guv1bNPNSVdoJnddu7oT9/jZL8z8n2Fj85Rh4nva
 H+izmnO9F/lum+wM/2TKvYmYeDLAPu9CRi0kMzBktOnYuln3Ep+WEGmb5207YDLIek17
 pCVah/bsAqmIec6gXibW5MZPHXo+uVvt9P9Xjm+xqtR631dwDP1pL7YqaTnQKsKNAvit
 lO4rNjKxOxoYYPRC484WnBIyQyzDi6cwcy5Oo3U2m4sPfYzxPA9T8XfHL7SJFRv6v9TU
 Vz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=piyFAQuE1nQbg6TLe0uPF76+MOhAF84QvXHI7/T29lI=;
 b=GDB4I6KUDOogKkbsubH57EohWDWhxPpJi9bPD2PEvpPL1VICF+ZEdjxjh2lKkI4Sk9
 uOzijT9be6GSl4lQTkT4SzfLIHn6vRF+jrJT8kje+s1fEBirJJ+SJAHiCpku13tqynVY
 zAJriwRrpiZZEGIJ5cF48D2xzbdpIq1++hLLHx5vT8URE35MzxPHt54cOm2f+LI7rhOe
 o+9DFPAOP/1gZhoj483rgCGTX2PGSZRqWL7br9qJW14kFkr34IAyniHeJGePU/xqmtMk
 8DxUuyGHOOMrVHkBxhWe/9OaRfZ8kNxRBhRyRLjtgPkzZdtXqgsRySUfZwD8kek5EYtN
 kaqA==
X-Gm-Message-State: AGi0PuaS1q8drE9PLF7T8mabST4QJTwHqORe+UmDLEWmjuu7pqkZsLqE
 7k3Jo4/maq2cjKzGN3AQt5k=
X-Google-Smtp-Source: APiQypJ8YEslaSIUMAz5iAgOMHXRXcLYU5tW9zTih3fsaaHOhEGTJzvS7w36/0kdqam3M6gdfAu8xA==
X-Received: by 2002:a63:df0c:: with SMTP id u12mr29713898pgg.387.1588125434585; 
 Tue, 28 Apr 2020 18:57:14 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id b24sm16226326pfd.175.2020.04.28.18.57.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Apr 2020 18:57:14 -0700 (PDT)
Date: Tue, 28 Apr 2020 18:56:34 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ASoC: fsl_easrc: mark PM functions __maybe_unused
Message-ID: <20200429015632.GA15142@Asurada-Nvidia>
References: <20200428212847.2926376-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428212847.2926376-1-arnd@arndb.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Fabio Estevam <festevam@gmail.com>
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

On Tue, Apr 28, 2020 at 11:28:08PM +0200, Arnd Bergmann wrote:
> ifdefs are hard, and in this driver the suspend/resume functions are
> the only callers of some other helpers that trigger a harmless warning
> when CONFIG_PM is disabled:
> 
> sound/soc/fsl/fsl_easrc.c:1807:12: warning: 'fsl_easrc_get_firmware' defined but not used [-Wunused-function]
>  1807 | static int fsl_easrc_get_firmware(struct fsl_asrc *easrc)
>       |            ^~~~~~~~~~~~~~~~~~~~~~
> sound/soc/fsl/fsl_easrc.c:303:12: warning: 'fsl_easrc_resampler_config' defined but not used [-Wunused-function]
>   303 | static int fsl_easrc_resampler_config(struct fsl_asrc *easrc)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Remove the #ifdef and just mark the callers as __maybe_unused to
> suppress the warnings altogether.
> 
> Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
