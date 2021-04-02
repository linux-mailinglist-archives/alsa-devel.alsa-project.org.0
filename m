Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D3F3527BE
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Apr 2021 11:01:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6505416B4;
	Fri,  2 Apr 2021 11:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6505416B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617354079;
	bh=Hw4urW311SjiyIPvsHR4cP0+5Hu42j07ddiHJKdo9Yk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hww2f+YKQ3zovOhQmMf7gX+DujRXDSHxufv5V80Kzi6p2COmvwRO0LIkx4qtwG1oR
	 xTsfcLLjDVXrQDdi3TOlb/7QMtWprdWCqBAZg6Vv0nuvrDL7tpwRsksv91J7NrQkdS
	 RCc2/LFal7X7MEDNrddtYxjDDUMQkR0Igjc8F150=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA48FF80166;
	Fri,  2 Apr 2021 10:59:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40413F8016E; Fri,  2 Apr 2021 10:59:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7083F800F5
 for <alsa-devel@alsa-project.org>; Fri,  2 Apr 2021 10:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7083F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="By3vlDiX"
Received: by mail-pf1-x42c.google.com with SMTP id x26so3266759pfn.0
 for <alsa-devel@alsa-project.org>; Fri, 02 Apr 2021 01:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0rVACHbDkid1fDW/Of/8klaULkPRVDsEPB5Q/2pdAMo=;
 b=By3vlDiX92An/BBKnPT34ut+9iMCVjOHJdDiwttDnLAkEQdR/u2gN+i0ASEcMxfpYC
 BGhFmvmtnDEdh5rAq4c8cavYZ0P8fb0zC60gyVXJlWRgtqZ09JM6qaho1KJF1IPVIuHZ
 3hrWnLZpvGOghv3GHew8NcSUVJ1ajxvQoqbBNCEhE+39gLUYuCpTJJgGI6Z/2A4HM/P9
 uc0IHZOwxuMzrXzWfsIHyG5MFKOQSTTV05pzhYHZ/KLCtGK+k4Zc2OCCtBMW7/3jWRuM
 04uW2Da8UPsxDsbgr4YCBYK0uGDOIsa0i1p5KAZ4Ra1htRd3QcFjsAECf2VAAsT8lfg1
 IhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0rVACHbDkid1fDW/Of/8klaULkPRVDsEPB5Q/2pdAMo=;
 b=iWnu2Lj0K99EYmYUVLykjD6U/jSKNyw2fVS8p4Rj0xvXQ9EVhmuy3W1RFXcl0ZHz+9
 3MPABFvcXyDo9J6fVUjcAXLSFOm79ylvWRbF0A5z0tusSK0o9ZhMHwO77WRu6X5ueMBy
 /kSX9pfYWouBcoeRRDK13O4u6Hbk4cE/PQ98PVdYHn8L6/nWzQP59HJGVYZlDfAqAWKv
 n1OUQUqzrB0gLA+iHiAeUDLZYe02bJ0XxGFXz27PMjXUoolasZSHnoepSXu1iPRfBx1v
 DuSoLOQiIQjAbfuO0oU57dg3NS0BgDiAAwXf7ie3laiamwCA8+auBSQUBOlyV0j60P0u
 YNYg==
X-Gm-Message-State: AOAM5304RXzF30HfGoS9JOYofu6Xh4dWRIfLIFk+iG4subXw/6db/WXm
 lKWMG+j5qFlI9svyEpBJxHE=
X-Google-Smtp-Source: ABdhPJzU9Kv5zDQQqSqI86EpmslOOI5d80+OTNA0mKJjMD2Gb90rGupg/7tOeBifXKoIgHHcMgT3pg==
X-Received: by 2002:aa7:9471:0:b029:1f2:3e6c:69e3 with SMTP id
 t17-20020aa794710000b02901f23e6c69e3mr11161443pfq.69.1617353982477; 
 Fri, 02 Apr 2021 01:59:42 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id h6sm7726661pfh.13.2021.04.02.01.59.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 02 Apr 2021 01:59:42 -0700 (PDT)
Date: Fri, 2 Apr 2021 01:57:41 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH] ASoC: fsl_esai: Fix TDM slot setup for I2S mode
Message-ID: <20210402085741.GA11737@Asurada-Nvidia>
References: <20210402081405.9892-1-shc_work@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210402081405.9892-1-shc_work@mail.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>
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

On Fri, Apr 02, 2021 at 11:14:05AM +0300, Alexander Shiyan wrote:
> When using the driver in I2S TDM mode, the fsl_esai_startup()
> function rewrites the number of slots previously set by the
> fsl_esai_set_dai_tdm_slot() function to 2.
> To fix this, let's use the saved slot count value or, if TDM
> is not used and the number of slots is not set, the driver will use
> the default value (2), which is set by fsl_esai_probe().
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
