Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 726181ED9D4
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jun 2020 02:07:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FFC21666;
	Thu,  4 Jun 2020 02:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FFC21666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591229270;
	bh=oyWmk+YNGCFtbecMu3TX0vMjgotkNnqyPQehm1WTm18=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L3Hq9JMx/44hqqUiAvud7XgKT7D+yCF+MPs7i+eD8RGdxNMIrykh4mDQg/qOZwRdo
	 jXIyhQZvD2zK/PC5XsocYeYXdLJ4KIdzOHGWZJ0eqKoK7Zu4VUk2NfvlrkhR1BrFs4
	 w+bNgNnsbr23HLQMtrJZRP/Yw36T5ct2vXib5r6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D72BF800D0;
	Thu,  4 Jun 2020 02:06:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61524F801ED; Thu,  4 Jun 2020 02:06:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23E80F800D0
 for <alsa-devel@alsa-project.org>; Thu,  4 Jun 2020 02:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23E80F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NASVovjh"
Received: by mail-pf1-x444.google.com with SMTP id b5so2512925pfp.9
 for <alsa-devel@alsa-project.org>; Wed, 03 Jun 2020 17:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uF2n/gB3gDDP2hMwoQuaaueDJkaKtOoysRJtoTkMSDw=;
 b=NASVovjhwK7+HIO80yPXssp+od2Hj2d9eiKlapTw++P1bMpxgSBWmZWUJ0Js8p1fiB
 COH3UNC0JBHTjqVioC60wuQYj1RX8kglcJJOKWvyGdoUdYxhDo7lgrJJsnWmmwEOOnls
 GcWCSPxRy9zAbMJ7nMRszUCbpYU4qAb/KhOH8/Np8lUaDK8+qUddDyBu0T7i9cK2Q/z0
 IDedlFEsLhmXp3TpSpDuCorOYb8vG5doQsgNwk0P5CfjW5HuC7i51dX2b/EN0xJTER0u
 zGGYodiltvH/TmC9ebxBfVpybt4NFF6aebkphUU9nfM6Eqs+npjtS7j88HNdrymau7A8
 fObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uF2n/gB3gDDP2hMwoQuaaueDJkaKtOoysRJtoTkMSDw=;
 b=Bbpe9EfFfmh0wZrCzjLgtV9XujkytSX1JTLLYSPamC1Rbi119IOV9MiPRbWFYcNalQ
 dnlAaMpCTzhvnEK0pEnWCuaz0NOquuwFga53oGM5iBPoKa5Ie+ePbja42HCRqXjgjSR1
 O02YhAhhmMjjv6dHjrX5V0ZiB9TFVcwIWzO5jRg5Yj4kJut3RmkCuO7Pcf+LdSCDSL2+
 bHg8gopzFtFRSBTlxYUsrw87LPo96zcMS0ajeXnZ1VttTKlvxy77PRjnCE8JOvykHlXb
 j9w3NfKums+XCIkhGYbvHRBQR2jyOi31PGsvjKxEQhNmkALUVoEjmK3kuwDms8enD8US
 lCoA==
X-Gm-Message-State: AOAM530IkH39avv8HBGXmuDNdLyvh/kWRwZi/tg7qlYIJuvZ5dFcK/Ly
 QrJ7mSRGJ2FC67lEx3DYtv8=
X-Google-Smtp-Source: ABdhPJz9ZYK9jizQG8WXYX8Y04FQk4jgCjJhaM7jL6RxuPb2xp3UDdovwx057LKm/fMposyBvBJGzg==
X-Received: by 2002:a05:6a00:ce:: with SMTP id
 e14mr1523090pfj.44.1591229157170; 
 Wed, 03 Jun 2020 17:05:57 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id f11sm2767786pfa.32.2020.06.03.17.05.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Jun 2020 17:05:56 -0700 (PDT)
Date: Wed, 3 Jun 2020 17:05:52 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/3] ASoC: fsl_easrc: Fix -Wmissing-prototypes warning
Message-ID: <20200604000551.GA17364@Asurada-Nvidia>
References: <cover.1591155860.git.shengjiu.wang@nxp.com>
 <ab1b83a56c71f4159a98e6da5602c2c36fe59f4d.1591155860.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab1b83a56c71f4159a98e6da5602c2c36fe59f4d.1591155860.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Wed, Jun 03, 2020 at 11:39:39AM +0800, Shengjiu Wang wrote:
> Obtained with:
> $ make W=1
> 
> sound/soc/fsl/fsl_easrc.c:967:5: warning: no previous prototype for function 'fsl_easrc_config_context' [-Wmissing-prototypes]
> int fsl_easrc_config_context(struct fsl_asrc *easrc, unsigned int ctx_id)
>     ^
> sound/soc/fsl/fsl_easrc.c:967:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> int fsl_easrc_config_context(struct fsl_asrc *easrc, unsigned int ctx_id)
> ^
> static
> sound/soc/fsl/fsl_easrc.c:1128:5: warning: no previous prototype for function 'fsl_easrc_set_ctx_format' [-Wmissing-prototypes]
> int fsl_easrc_set_ctx_format(struct fsl_asrc_pair *ctx,
>     ^
> sound/soc/fsl/fsl_easrc.c:1128:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> int fsl_easrc_set_ctx_format(struct fsl_asrc_pair *ctx,
> ^
> static
> sound/soc/fsl/fsl_easrc.c:1201:5: warning: no previous prototype for function 'fsl_easrc_set_ctx_organziation' [-Wmissing-prototypes]
> int fsl_easrc_set_ctx_organziation(struct fsl_asrc_pair *ctx)
>     ^
> sound/soc/fsl/fsl_easrc.c:1201:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> int fsl_easrc_set_ctx_organziation(struct fsl_asrc_pair *ctx)
> ^
> static
> sound/soc/fsl/fsl_easrc.c:1245:5: warning: no previous prototype for function 'fsl_easrc_request_context' [-Wmissing-prototypes]
> int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
>     ^
> sound/soc/fsl/fsl_easrc.c:1245:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
> ^
> static
> sound/soc/fsl/fsl_easrc.c:1290:6: warning: no previous prototype for function 'fsl_easrc_release_context' [-Wmissing-prototypes]
> void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
>      ^
> sound/soc/fsl/fsl_easrc.c:1290:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
> ^
> static
> sound/soc/fsl/fsl_easrc.c:1317:5: warning: no previous prototype for function 'fsl_easrc_start_context' [-Wmissing-prototypes]
> int fsl_easrc_start_context(struct fsl_asrc_pair *ctx)
>     ^
> sound/soc/fsl/fsl_easrc.c:1317:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> int fsl_easrc_start_context(struct fsl_asrc_pair *ctx)
> ^
> static
> sound/soc/fsl/fsl_easrc.c:1335:5: warning: no previous prototype for function 'fsl_easrc_stop_context' [-Wmissing-prototypes]
> int fsl_easrc_stop_context(struct fsl_asrc_pair *ctx)
>     ^
> sound/soc/fsl/fsl_easrc.c:1335:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> int fsl_easrc_stop_context(struct fsl_asrc_pair *ctx)
> ^
> static
> sound/soc/fsl/fsl_easrc.c:1382:18: warning: no previous prototype for function 'fsl_easrc_get_dma_channel' [-Wmissing-prototypes]
> struct dma_chan *fsl_easrc_get_dma_channel(struct fsl_asrc_pair *ctx,
>                  ^
> sound/soc/fsl/fsl_easrc.c:1382:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> struct dma_chan *fsl_easrc_get_dma_channel(struct fsl_asrc_pair *ctx,
> ^
> static
> 
> Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reported-by: kbuild test robot <lkp@intel.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
