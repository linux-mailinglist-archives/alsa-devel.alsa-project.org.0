Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2569B535B40
	for <lists+alsa-devel@lfdr.de>; Fri, 27 May 2022 10:16:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFAA916FA;
	Fri, 27 May 2022 10:15:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFAA916FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653639389;
	bh=yymcLsU0CVx4xjTLV/Cr9dvk3zmZQ7IzxRhZIbgm+9Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vXHs3H2D8MeYziq7TLFIiA1nyAPq1SpiNDdEG/XK4DUiIgxE6nx3eTGPmgly897/R
	 vNj+QvW2Gvw1NzGyKG9HlG4kFP/6aHvfZxvTFkrR2qMm3pPlp4MS5QmlPUWf5to9Nc
	 55GetCBHKhb0CVMuPmcw7fXg01cHjFntY1D7J0/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3042FF800D0;
	Fri, 27 May 2022 10:15:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7B23F802DB; Fri, 27 May 2022 10:15:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8693FF800D0
 for <alsa-devel@alsa-project.org>; Fri, 27 May 2022 10:15:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8693FF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LN9wrgIz"
Received: by mail-lj1-x22e.google.com with SMTP id v9so4150394lja.12
 for <alsa-devel@alsa-project.org>; Fri, 27 May 2022 01:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/qtRZ+VrSUBptAVUI9iiPS+3Nf9EqilNhA3oI5WaH1c=;
 b=LN9wrgIzY9T9nAhkMGUB6grt3fCRrvPbohzwAptzm29NkbPgyOlxbcXavd1U5vQhD5
 4B5H4U+0WniWtiMLh6KWtbauRw4A51A3J+eqwoRymCrJH/d1KxxtN7mABubw7rd3WVXX
 VxxKJ69sGrKE3EGP9Gry/tEm3OaNUN11r4o7irMa/v+8tvRedjZhchK34GcpxIL6Fe4N
 4i50BGegSLe1ekIbWuW050dhid4yNH0rQ2vfuxa9lzPIWUqOTfP3jyNr/ChL6hTYpmTU
 4iBeMqEkNcBVHhMkKDbTTi/UlAL1ABHMaDg1wPiCk7Ws6zski7f4d176bNfCt4cBhKlp
 HpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/qtRZ+VrSUBptAVUI9iiPS+3Nf9EqilNhA3oI5WaH1c=;
 b=ASzGDaS63VV+BV3dBUlYV21hMSysCZb7LJ6AQkzwC6LDRhYDis34VcrWAeiVXNR7kS
 XFzwhiv6JLv6hRyWnFuX9oA1UOSE7dBg3rVMn4pLPmGD2LG3jFC+wI4AOLvMX8m1d/N2
 35rrMjxeaBZH/eS9hraLnxUM59tOeSijHMZA2B/DhY+5e/CXTTyz+X7VnYXQEVwM5m04
 BQazIIyg4iMkFZFLGlsyiKySpir/NI9uJwVJZU8+0lWFsbrv5DJcL8wEE/WCyogXpDIb
 9iglKkWhbfB/h+VgT/TFSKX0QvDTnIuhDJQueLJlkaFTKWxPi/IzWtd2UnLGGFD539wX
 iwQg==
X-Gm-Message-State: AOAM532cDfHNP1AQcf5VkYgL+sXQlFU0uWZRoxs4aYkuT2cKggN09QS5
 V07gEp8lyopjKlmzH9BhtTZk05n7aZtXb42kcB8=
X-Google-Smtp-Source: ABdhPJwfhdtYBja/wknI3jeAuqx3w0yF2tm2ccxF6U2pCWUGQdvLXrCDDtBn6dYA2cj+a5HPO/SDcFLklo/+BLTlEFs=
X-Received: by 2002:a05:651c:509:b0:253:f7d4:15bf with SMTP id
 o9-20020a05651c050900b00253f7d415bfmr10421261ljp.189.1653639317735; Fri, 27
 May 2022 01:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220526010543.1164793-1-festevam@gmail.com>
In-Reply-To: <20220526010543.1164793-1-festevam@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 27 May 2022 16:15:06 +0800
Message-ID: <CAA+D8AOjUhoSShAaXUqFb9i=fXKrw4P8tgnsP2Qh2SjW8TzSaQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-audmux: Silence a clang warning
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: nathan@kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, kernel test robot <lkp@intel.com>
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

On Thu, May 26, 2022 at 9:05 AM Fabio Estevam <festevam@gmail.com> wrote:

> Change the of_device_get_match_data() cast to (uintptr_t)
> to silence the following clang warning:
>
> sound/soc/fsl/imx-audmux.c:301:16: warning: cast to smaller integer type
> 'enum imx_audmux_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 6a8b8b582db1 ("ASoC: imx-audmux: Remove unused .id_table")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
wang shengjiu


> ---
>  sound/soc/fsl/imx-audmux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
> index dfa05d40b276..a8e5e0f57faf 100644
> --- a/sound/soc/fsl/imx-audmux.c
> +++ b/sound/soc/fsl/imx-audmux.c
> @@ -298,7 +298,7 @@ static int imx_audmux_probe(struct platform_device
> *pdev)
>                 audmux_clk = NULL;
>         }
>
> -       audmux_type = (enum
> imx_audmux_type)of_device_get_match_data(&pdev->dev);
> +       audmux_type = (uintptr_t)of_device_get_match_data(&pdev->dev);
>
>         switch (audmux_type) {
>         case IMX31_AUDMUX:
> --
> 2.25.1
>
>
