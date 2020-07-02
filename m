Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3088212F0E
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 23:48:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 386A316D3;
	Thu,  2 Jul 2020 23:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 386A316D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593726528;
	bh=wEWLJugUEoJF13EVG36TIW/5jfa4TRoxlnl+tX/Wn14=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aqWnNmmPxmJXwVyzRz5pCw6790PYW5q5NvM/+nW/NRJqz51AYalAiUtYhPKcep0RA
	 kS1UaCb5spt6S9/n3hfWbQ7jkXCVMyIRqfYlV+Uzdin55X5zBikMkoV7m9HF7wdKDZ
	 PoKNP4W85lDeo1QRiyEeJ312uD/wEniWM1DZ0JUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C542F80134;
	Thu,  2 Jul 2020 23:47:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9484AF8022D; Thu,  2 Jul 2020 23:47:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23AB0F800C1
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 23:46:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23AB0F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sm2IOQme"
Received: by mail-lj1-x241.google.com with SMTP id f8so21880718ljc.2
 for <alsa-devel@alsa-project.org>; Thu, 02 Jul 2020 14:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wEWLJugUEoJF13EVG36TIW/5jfa4TRoxlnl+tX/Wn14=;
 b=sm2IOQmesVWJ2z0ORa2TSdnYdjJIGzToARHSUN1fhHU3JQH4rkm/9yUzqJe18MjgRO
 cEfd9xFFw94U9bfjx/6tCrVEw+YDC25KG3GqUB+h+ESGVBxgaP8AdZSSX2IMS/OjIiYE
 jD4v7Y1Y7biuhhoMmQPttanmkCj97ERsYN5jC+NQHkuSXZ7cQUUSm/iWRn1nFaxgXIjL
 h7uDrGbnQ4rawQoaUIYFheBUEuwy8/ODC9Pi2eqLqx9I9he1VSRmTP+fZZIN63A2f9pj
 3LL25C9HRCgceLBWY/9UXCtL99epNMGZNvJovRC3HKKIHoIANYTepGWuX9bPeeDVX7fs
 Y08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wEWLJugUEoJF13EVG36TIW/5jfa4TRoxlnl+tX/Wn14=;
 b=Lbhb2l8jrX/iUg5tX4fPiNHYhFA/CLTKhaO2u2P3HfAhomxn7UN8wodJfmyCpGVnJH
 r1vfiZkgR+1QypcayEkY/5RStHhz26LyJ9F5TK3xdjdgopKTiJ5LRYSziKL58SJ/T4VF
 5r/GqXzeYDy1s192BgBvaUVR/VxP/RFn+Cn96LuiXY7/yuH0Q8XecGWTh0NfjPrxdgXP
 vLQPJJ8I3BDN2prlMwg7cOXLzFDDOzYIjcHn3EpIgkPRiLM6gZF0X6tVSPJsuVGVa6n8
 Tlrq6EEeUQ1YcFT6DfWi61ddeGgE4UG1tFRCWt4pGpBvexiT/iUnJPTJKyCHEjNHZYal
 xvlw==
X-Gm-Message-State: AOAM530XRlepVn552TWC9egFw11rgOfQAcop8Jv/Gy7nw6qn0h1HZP5P
 fUOxDCEuSF6gY3BvQVjfMRVfXXji/d/Xevu3iug=
X-Google-Smtp-Source: ABdhPJyiO67FouY0jlSz55/tgTo3v5o4FPE/8mfJyTgmhx7uN6BdSgCL6JlgSdYfOLxyZadGIa83ykMwT8pYWiLh6ms=
X-Received: by 2002:a05:651c:200f:: with SMTP id
 s15mr4716908ljo.125.1593726414677; 
 Thu, 02 Jul 2020 14:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200702193102.25282-1-nicoleotsuka@gmail.com>
In-Reply-To: <20200702193102.25282-1-nicoleotsuka@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 2 Jul 2020 18:46:43 -0300
Message-ID: <CAOMZO5BveOO3wNpGYbqDyQ290wNE3Xp5X_jXkvcDdP8iytRZiA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Shengjiu to reviewer list of
 sound/soc/fsl
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Timur Tabi <timur@tabi.org>,
 Xiubo Li <Li.Xiubo@freescale.com>, linuxppc-dev@lists.ozlabs.org,
 "S.j. Wang" <shengjiu.wang@nxp.com>
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

On Thu, Jul 2, 2020 at 4:31 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> Add Shengjiu who's actively working on the latest fsl/nxp audio drivers.
>
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> Cc: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
