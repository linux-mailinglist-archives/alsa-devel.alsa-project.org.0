Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AFF31E650
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 07:27:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CC99165D;
	Thu, 18 Feb 2021 07:26:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CC99165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613629660;
	bh=xwdKrrUyYtLmcZWPGl+Ki7lFrwhA5og06mL019uog6Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FFLkthgWKpgClyhUFiUMnFrnUkjlMElhIA0Ba4qzlQUjxm3AP8YohKLQU9lnY//6X
	 qz26xWE0bKt5hy+12FH6VAVmZpv5znvS35q7frT15N+ewgjzMvaHv41AghPMnTBoiD
	 nhIpfzSJRsZtgPpRo2Y23Q+cLy81mYiTLicDGfqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB517F800E5;
	Thu, 18 Feb 2021 07:26:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA329F8015A; Thu, 18 Feb 2021 07:26:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5F45F800D0
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 07:26:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5F45F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SwbP04zN"
Received: by mail-pf1-x436.google.com with SMTP id b145so616755pfb.4
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 22:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sLJt7tf2kGzu5Czy0U2Qe4eXIzVd6dGSxOPpD9F+sx0=;
 b=SwbP04zNY5NXwT5QJn2HQhari+tefdsDFYTpb87Z9b/AWFrbf806XkVrsmFMzQNpOe
 nWyoHxWKJnoL9okQ6uRlcoG02LrOhhUUBiascPDyRTZiY1NI2f8bME4iwQC81uF6LDO8
 BssfPiPO2z1huH2DTLOpkxpR0PUPjYl2nKlty9jfi3mfg0bMqEbLgZPs7JTmOrZCIfPo
 RPbr2aCGdGm79eD1vjIhAVT15HDcOjksuQHzMI0U55f10HpKjFStY+2P8jAI9ajRwQ6W
 mP3htgKHM69w45RTv2kon7v0B+creRv8l6aIg6qHxqOz+KLtl7APVcFe2hu0rZqM0mfI
 RP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sLJt7tf2kGzu5Czy0U2Qe4eXIzVd6dGSxOPpD9F+sx0=;
 b=esIFhhEW4Mvewf8jUsTm2djylqH/FjturTeOViUsXSi51M5YNPz97e+zvDVY5nvMCv
 qPApNy/pJJzOis944zb0n4qZe/YjrwtZwyKlq4EwE7h/uwGoFL1WBj4rBMijaeXLh68C
 q0++8XSAnfXW0Wwx1M8fdXUDQR8lli8H1OufAkUTH8wy2/l1tvJVY/J2Ylcgiy5xUdWI
 w9M6G8F4I7cH5KA2Pk/r1ZF1xAi8rleZSraSM4LCTzr8Wq0Y2r2LlMs43raAn/l45K+F
 VnjdIHi12Dxl+aThHoXpa7x8uW7yc7iF04afcmERAdTa6+ovpC9jNZKI+4pUlrfD+8vv
 xTvA==
X-Gm-Message-State: AOAM532+qEZsDHQisp44QF5pJ58N4xY8SYdvrDARNJTeIH/J2oWpRNpf
 6oD5hMg6RthQcIxExNBFZG8=
X-Google-Smtp-Source: ABdhPJw5OWSgAym8q82LIq30sZKLyLBQrvVtPuBCUKFTBIXwTL2ff41fvl7umO+b8l3eglvQMBrCvQ==
X-Received: by 2002:a62:2bc6:0:b029:1d2:f224:d91e with SMTP id
 r189-20020a622bc60000b02901d2f224d91emr2902783pfr.26.1613629559584; 
 Wed, 17 Feb 2021 22:25:59 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id i7sm4138958pjs.1.2021.02.17.22.25.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 17 Feb 2021 22:25:59 -0800 (PST)
Date: Wed, 17 Feb 2021 22:26:50 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH] ASoC: fsl_ssi: Fix TDM slot setup for I2S mode
Message-ID: <20210218062650.GA13668@Asurada-Nvidia>
References: <20210216114221.26635-1-shc_work@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210216114221.26635-1-shc_work@mail.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
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

On Tue, Feb 16, 2021 at 02:42:21PM +0300, Alexander Shiyan wrote:
> When using the driver in I2S TDM mode, the _fsl_ssi_set_dai_fmt()
> function rewrites the number of slots previously set by the
> fsl_ssi_set_dai_tdm_slot() function to 2 by default.
> To fix this, let's use the saved slot count value or, if TDM
> is not used and the slot count is not set, proceed as before.
> 
> Fixes: 4f14f5c11db1 ("ASoC: fsl_ssi: Fix number of words per frame for I2S-slave mode")
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
