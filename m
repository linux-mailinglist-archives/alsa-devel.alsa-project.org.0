Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E6D1B5F05
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 17:23:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 615741699;
	Thu, 23 Apr 2020 17:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 615741699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587655423;
	bh=deOrrlEqt2z4D3sNfP79ZAFHrF+nZEzMWU53vM5f/DQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rTK/2qZZn2SqxPG5eEs0xMZbKpXeeWrMpVXXfRnF57oVpMCxHPjgFFw1UZqm10rGI
	 r68Ere4ZcCXwxPIFq+jCre6MIJxUhQCXArxIwvkjUTsNLTBFlpHYqsUY2WOcWS/4qf
	 nHaFh/rYn8/ZiBWWe6L8TmUD652V7f7kXMGQt4jw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4960DF800F2;
	Thu, 23 Apr 2020 17:22:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66645F801EC; Thu, 23 Apr 2020 17:22:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FBF5F800F2
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 17:21:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FBF5F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QJmPofKQ"
Received: by mail-wr1-x442.google.com with SMTP id d15so5702101wrx.3
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 08:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+n1qB9PXPe2HKGRrV3dcqGYLE3ob/n0fI2GQ9M8Mp6U=;
 b=QJmPofKQz5hYw4WGgLjYX/t0gpZghFeeK+2QVLzv4q1KoGnOG58JJzYElK0qbGODhj
 HDQnwFmhWkVgucmAo8KISGyQPklQpsqB0cPl6j6r3jSx8kL2WaPAf2AYXafk1FcmlVgY
 CEIFkd0vUSkFYCTR/iuoKgpZKbhIbS7j/KZvNVZBaKjxvAwh6AeF3H1DOOvlEEqI3wQh
 iHz3jiA8J6OoWqFJCFtKNq7P3Zm0040UvNPN5a4IQBJrkHxjfoYAK9M5H/SVh0OpgmbS
 eV9VejTTc0TYAeIVpMtozEFeeLPhP8JJpAhok8VVWIHMdHoE81lSif2tTgl8o0nXmnvl
 AGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+n1qB9PXPe2HKGRrV3dcqGYLE3ob/n0fI2GQ9M8Mp6U=;
 b=ZuT0fxbmfuvbAlC1DYXno6n2Iw07MeHquRUAm+iD3nKaaQgdKBZDjZtUj0Q3wQzD44
 IhPhAjOF7SSYEveqWfx4c/y7MuHbp545OEbNa4brdKwOaUdt2WziKEa33q0Vd3BAkwUa
 j78ksHNCKfPa/1FEe3ZYez2UHP9hK1u7F30/wXvah7OlbUFJFfSPFRchcsmMf8yCOXS7
 398DkAgQQ+jLvesv4Que9ZuopkCxOu15nCidLfonH93kYuB3X/mjbhRK+lbiiuRekVF6
 sOJraywGZmayQwa21fzbURIfFss/T0E5HwyNf2Tn+hk6qVK3GRoa4Bt3jmc7cPrGTxub
 5FBQ==
X-Gm-Message-State: AGi0PuaCgihTtmE5MbbqjMYet1zk7gz/LOkRe9mCWvgKN2mu0cigLqde
 SC59A+NRiEA4L15pQJydmQ6EI6UXkxU+Q6Yi3yM=
X-Google-Smtp-Source: APiQypJkLI0axWjlY9wEZO1PRxcvsT02G+ejQec5DScVMsCuJkfzfgzLtvReUtOuj/LAuv9jXDaSAKBtoAZfyLY3mT0=
X-Received: by 2002:adf:84c1:: with SMTP id 59mr5586524wrg.350.1587655311437; 
 Thu, 23 Apr 2020 08:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200423142805.52757-1-broonie@kernel.org>
In-Reply-To: <20200423142805.52757-1-broonie@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 23 Apr 2020 18:21:40 +0300
Message-ID: <CAEnQRZDqNRfUu1Yak=8AM98sAicxnv+Cpm0y2UcCMeABcRQPWQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: Add missing dependency on IMX_SCU
To: Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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

This should no longer be a problem after the following patch is merged:

https://patchwork.kernel.org/patch/11395247/

Also, Pierre already fixed this in SOF tree like this:

https://github.com/thesofproject/linux/commit/5e3103aaf77fd5c985d717a5fe774fd2154e97aa
I think we should go with Pierre's version for now.

Pierre,

Will you send the fixes to Mark? Or should I send them?

Anyone,

What is the exact difference between 'depends on' and 'selects'. This
is a question I try
to clarify for myself for a while. And most important when to use one
or another?


On Thu, Apr 23, 2020 at 5:29 PM Mark Brown <broonie@kernel.org> wrote:
>
> This broke PowerPC allyesconfig.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/sof/imx/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
> index 5e0c68b12292..9a5ed1860e4e 100644
> --- a/sound/soc/sof/imx/Kconfig
> +++ b/sound/soc/sof/imx/Kconfig
> @@ -21,6 +21,7 @@ config SND_SOC_SOF_IMX_OF
>
>  config SND_SOC_SOF_IMX8_SUPPORT
>         bool "SOF support for i.MX8"
> +       depends on IMX_SCU
>         help
>           This adds support for Sound Open Firmware for NXP i.MX8 platforms
>           Say Y if you have such a device.
> --
> 2.20.1
>
