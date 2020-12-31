Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB232E81E2
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Dec 2020 21:09:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A88571704;
	Thu, 31 Dec 2020 21:08:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A88571704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609445374;
	bh=555ljg+6YPrD+wMXSB+bYIMx22VyvyRPeppNzLZgc/c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X0ScZtBkpa24fBcyE/BO9ENiopOz/t6nayki6Adb/eFsHwnrk+kxkxbNpkeYbq7g1
	 6qXKHiSw+bHAEd0pCqAf6uBMF6JpzEwzzlDz8eRi4E3hBPcJCUWYywtO1e9mwXf6PT
	 3yNqUAYDpFFvhgbZpz+ZOjEBJJnhr+Xv5tkrilxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13F6CF8022D;
	Thu, 31 Dec 2020 21:08:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA6CCF8022B; Thu, 31 Dec 2020 21:07:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9824F8015F
 for <alsa-devel@alsa-project.org>; Thu, 31 Dec 2020 21:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9824F8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="q4OSIz/J"
Received: by mail-pj1-x102e.google.com with SMTP id z12so5344497pjn.1
 for <alsa-devel@alsa-project.org>; Thu, 31 Dec 2020 12:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LUdKDlLlflhborB/8hVdW+VgkZLtdJkIlQCMkULEfnY=;
 b=q4OSIz/JkJT0Z+P9uVNEenQw9LCMicx+csh5V1YclMspc2ubhEGsY9l8aXWn/1o2D2
 tqsq+6zRnIEQMwGOBhYBOR9pibQi2htQPQreoUST292qXMsKVsAGim3LKXZ9E+zMie7M
 52pwQiP+QDRiqEfB5yLl54UhEeUJ60jgAJwDEmxEkbKliBbXL/avFooqe6pFZMd1QB1x
 f3/SsfSySDPPrUOV8ywWsXStpQTqui22/EZnyTuI7YSk7qzrBY3irhTo5l7yn6rfj/Vz
 GGe2OnNRSe4tThPrYvn4loOQr6sb0xPyFqSteoIbplYoQzmBYtJfo/gJZzG5cX1u/qXP
 c+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LUdKDlLlflhborB/8hVdW+VgkZLtdJkIlQCMkULEfnY=;
 b=JpdwwC7WPQdv6a0vDHFS7O4m4hmFG22CETH+8wYYZ9/7gmW5eiEDEobJ2l0+9VG0Kp
 PUhqRRMhDk9dsuk+foVmr704TwiwCyqp8WuxOkjW0xkgHvniAUBK+ggKNWrBEJ6cd0FW
 5cu2t8aQ9YQ1e5Px8jJbxxMI0vJKM84GPkfJy+1Q+xUvZwGxwQleCIOFy4yxvrwJEoSo
 vaUYAVVFHjZbMoDae/JxbynR+Nw7s/13VQA+ZH9GfC2rAgBjaYGvOYJtpH5i4O6avDYb
 Tv3HtQKFFNjP982bxKgmuxCs+RH56cuIE/EOw5KXlM27HG6k615kpUrn3psmJGbVy3sZ
 Vahg==
X-Gm-Message-State: AOAM531VshzA+oViRFlKsVnPEJ8sR3s2ZshAGrKGvmFTGOKf20YzJiWv
 8SYPUcWRH60ulInzdcy8PGM=
X-Google-Smtp-Source: ABdhPJzl+Fbw2ZK/0YW+xvW1opW2piy82XGq/LFQSMQzdbhXDr9nGtRYASFfPXeTVmyCnl65miZT/w==
X-Received: by 2002:a17:902:6b0a:b029:dc:31af:8dc3 with SMTP id
 o10-20020a1709026b0ab02900dc31af8dc3mr36249199plk.41.1609445265935; 
 Thu, 31 Dec 2020 12:07:45 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id y189sm44418568pfb.155.2020.12.31.12.07.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 31 Dec 2020 12:07:45 -0800 (PST)
Date: Thu, 31 Dec 2020 12:07:57 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ASoC: fsl: fix -Wmaybe-uninitialized warning
Message-ID: <20201231200756.GA15207@Asurada-Nvidia>
References: <20201230154443.656997-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230154443.656997-1-arnd@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Timur Tabi <timur@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, clang-built-linux@googlegroups.com,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Nathan Chancellor <natechancellor@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org
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

On Wed, Dec 30, 2020 at 04:44:15PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Clang points out a code path that returns an undefined value
> in an error case:
> 
> sound/soc/fsl/imx-hdmi.c:165:6: error: variable 'ret' is used uninitialized whenever 'if' condition is true [-Werror,-Wsom
> etimes-uninitialized]
>         if ((hdmi_out && hdmi_in) || (!hdmi_out && !hdmi_in)) {
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/fsl/imx-hdmi.c:212:9: note: uninitialized use occurs here
>         return ret;
> 
> The driver returns -EINVAL for other broken DT properties, so do
> it the same way here.
> 
> Fixes: 6a5f850aa83a ("ASoC: fsl: Add imx-hdmi machine driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/soc/fsl/imx-hdmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
> index 2c2a76a71940..ede4a9ad1054 100644
> --- a/sound/soc/fsl/imx-hdmi.c
> +++ b/sound/soc/fsl/imx-hdmi.c
> @@ -164,6 +164,7 @@ static int imx_hdmi_probe(struct platform_device *pdev)
>  
>  	if ((hdmi_out && hdmi_in) || (!hdmi_out && !hdmi_in)) {
>  		dev_err(&pdev->dev, "Invalid HDMI DAI link\n");
> +		ret = -EINVAL;
>  		goto fail;

I think Mark has already applied a fix :)
https://lkml.org/lkml/2020/12/16/275
