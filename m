Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B7A2E0C6A
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Dec 2020 16:09:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9D751762;
	Tue, 22 Dec 2020 16:08:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9D751762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608649752;
	bh=P5rh6+QiNqZSzp6BEKfstxif0a5AH6dSuuF4/ucGpE0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NqUZbENlWdia1YiaNpBI+YscQGbuhWabubJ4hKhZEGt9Ef3yZ6aA3Gb3t0tKMIGGa
	 b0OVU68egVG3olfIJwXYT4+yyPOxa2MSBFE4MvOP9rfJRkDjweYf/4Alu/QQ+PQV5E
	 M9yzA03cfd3e9tTr5nArZ0Abj2vD8zc4xhGIYpgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAC40F8021D;
	Tue, 22 Dec 2020 16:07:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E244F80224; Tue, 22 Dec 2020 16:07:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B264F80161
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 16:07:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B264F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="stLyfZX9"
Received: by mail-io1-xd32.google.com with SMTP id o6so12216915iob.10
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 07:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LSZe6kdgOB0LR7hxUYry4TSc2IqyZGUCr8x+rBs0II4=;
 b=stLyfZX9Skp5SLTWBml7TFa94b0bTpk5Ro8RzqZgC9zFYtCKD32c2oQqpG9VvBH3h/
 wXuBzMfbxr8mzVyKsb+gUDBMvJcqKIzXPRtNIB5/bTNmMVSrs91CVQPvKXHcmUrT2m45
 B8vNToRWL7cIAlqAg8oYtn5cI0sZdHgBcwW+UQQwhQ2HPdDUwdQ2ldXzWbptBMQQnQCa
 tueD22hG/kisdnGEYkgrPFd3iOxvP7Rs34jlh2+TlSoX6rbNFhJ6IWyLUlYRsWgB0qPI
 6Oq0ZXBdK33YCJppiDKXQTGmXU8Mb6RBToaK8DjY1Mha4hiJZ42q60iDys972RzI6rWM
 37Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LSZe6kdgOB0LR7hxUYry4TSc2IqyZGUCr8x+rBs0II4=;
 b=o6QglJQy6gMcEYKCqJ6crccBXvzxhRayr5734eQw3JSzj1OttXOjCOvAihagmuPE3h
 oD3PLJxMyo3MweTT2V94Gi785d3JTXuaf61ZqPhgaMq6wBJemmJvzXu9v8ceLQ/ZixaM
 7b3752bLlwBT9ht/DVxxUGgFTvpmGTNGRpCIYYrEHhm1LYFuPAy00KHT+chl8G/f2xWk
 Zp0JO0VQVYVMYGP09Xa/J3j8OTEZAeiAHQfhjKwXuoQnvnfJIWaeQQyjmwgjrEMNUzd8
 5T6elJKgvyrL37uNkvbR2EgG9Dvaduw8Ln6MySbt7a7oKMbiKsLWGli7VG4l3E58cT8o
 L3lQ==
X-Gm-Message-State: AOAM533xZ9jlc3at/Gf8C2zHhl7aAZXDix9QPHXMnEDH1F+Sytkxp770
 GScwmkjHL/usWumXgUhhhzJC4Nu0nnJvkj0s0em+Fg==
X-Google-Smtp-Source: ABdhPJya2Rc2FuYnx7qQ8kNuOFwBx/CjbaZOp1sskB17DKL1QreHIAiw/9FVnptaAl45cj+IcGM9oYcwm3wnp22jkw0=
X-Received: by 2002:a02:8622:: with SMTP id e31mr19093651jai.88.1608649647844; 
 Tue, 22 Dec 2020 07:07:27 -0800 (PST)
MIME-Version: 1.0
References: <20201216041601.5993-1-chiu@endlessos.org>
In-Reply-To: <20201216041601.5993-1-chiu@endlessos.org>
From: Chris Chiu <chiu@endlessos.org>
Date: Tue, 22 Dec 2020 23:07:17 +0800
Message-ID: <CAB4CAwcAbZYa7NS-Kxd60gN_Z1qv2C-SxMsTvgqWSfmcD=s3Kw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Add quirks for DeeQ X5-Z8300
To: cezary.rojewski@intel.com, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 yang.jie@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Linux Kernel <linux-kernel@vger.kernel.org>,
 linux@endlessos.org
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

On Wed, Dec 16, 2020 at 12:18 PM Chris Chiu <chiu@endlessos.org> wrote:
>
> DeeQ X5-Z8300 is a laptop empowered by Intel Atom Cherry Trail. Add
> quirks to select the correct input map, jack-detect options to enable
> jack sensing and internal/headset microphones.
>
> Signed-off-by: Chris Chiu <chiu@endlessos.org>
> ---
>  sound/soc/intel/boards/bytcr_rt5651.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
> index 688b5e0a49e3..9df09e26b05a 100644
> --- a/sound/soc/intel/boards/bytcr_rt5651.c
> +++ b/sound/soc/intel/boards/bytcr_rt5651.c
> @@ -507,6 +507,14 @@ static const struct dmi_system_id byt_rt5651_quirk_table[] = {
>                                         BYT_RT5651_SSP0_AIF1 |
>                                         BYT_RT5651_MONO_SPEAKER),
>         },
> +       {
> +               .callback = byt_rt5651_quirk_cb,
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "DeeQ"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "X5-Z8300"),
> +               },
> +               .driver_data = (void *)(BYT_RT5651_IN1_IN2_MAP | BYT_RT5651_JD1_1),
> +       },
>         {}
>  };
>
> --
> 2.20.1
>

Gentle ping. Cheers.

Chris
