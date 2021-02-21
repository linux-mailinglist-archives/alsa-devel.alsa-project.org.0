Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 504BE3209BB
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Feb 2021 12:12:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D719B886;
	Sun, 21 Feb 2021 12:11:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D719B886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613905957;
	bh=o6O6etVb0ua9Z9ooJdmBYNxeniZIwyzauEKUU+jH9NU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JoKGyELXUqzFItJtYrQObSbrhnoEXNgvBLImxPBOb/M0L+oDuKuAaYxmmMIJqMytG
	 o5E+pIX/UDDqyZdga42Z4LEVR+nnLNRA5MrigjsBvlvGM9PZvuVBoOwI6fCfpYdPGP
	 18ALVa6uZscJsUKvWOJdIogN8Xsb/v1YV4+YWg3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D086F80167;
	Sun, 21 Feb 2021 12:11:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7631BF8016A; Sun, 21 Feb 2021 12:11:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E18AF80082
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 12:10:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E18AF80082
Received: by mail-wr1-f45.google.com with SMTP id v15so15946715wrx.4
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 03:10:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LbHdf4FHIsdZFUVygYMz08Mm+lb/gyE7AdetIvz4dHs=;
 b=grxGRaBjxXkTJ9H+A/T/imXY/2yPm5+qWRhYE3vdGSFTMwX59hy88NJOTRYvd7R1QB
 jeB1P6bY7SX0mnhpV45Q65mXyB9hx15fBDcQ6zK539oDSoBwX3DEPOPUGp6AHbyMV+Cu
 UNp3myA5/iKeUUjVqkosJpFhMZQxh2rQ9caEAy9ynylJ94LdNWiS294yuxamxDcXQlKP
 mJzH09x2/mqvcwUbTdl9ArUQ80jtJysByBvZwjKzA7KbKCiVKG0QqTy2F2ISiwk9jYor
 o15NeUloQF606Kl88NlBD7yBXXsErxScSQYv4mRn53HlPTuzNLvi01CsE0osuoIlBzzn
 l5Dg==
X-Gm-Message-State: AOAM530vYMWwesYt99GI4BESizZIgEt6dWW228OBclbI6gWYTza7N8Wy
 /Y6kFT/7T4MgsjDatvixoL0=
X-Google-Smtp-Source: ABdhPJyp7ZOSzVoPEXiAEV/O4+nPSApdj3sYfmU7g1iWrLA05aRvCOr3DZFlcSFoIR3GAAp9J2cPow==
X-Received: by 2002:a5d:6c66:: with SMTP id r6mr16895275wrz.86.1613905857468; 
 Sun, 21 Feb 2021 03:10:57 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id c2sm24293784wrx.70.2021.02.21.03.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 03:10:56 -0800 (PST)
Date: Sun, 21 Feb 2021 12:10:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 5/6] ASoC: samsung: tm2_wm5110: check of_parse return value
Message-ID: <20210221111055.nfzr5nzvskdc3jyq@kozik-lap>
References: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
 <20210219230918.5058-6-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210219230918.5058-6-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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

On Fri, Feb 19, 2021 at 05:09:17PM -0600, Pierre-Louis Bossart wrote:
> cppcheck warning:
> 
> sound/soc/samsung/tm2_wm5110.c:605:6: style: Variable 'ret' is
> reassigned a value before the old one has been
> used. [redundantAssignment]
>  ret = devm_snd_soc_register_component(dev, &tm2_component,
>      ^
> sound/soc/samsung/tm2_wm5110.c:554:7: note: ret is assigned
>   ret = of_parse_phandle_with_args(dev->of_node, "i2s-controller",
>       ^
> sound/soc/samsung/tm2_wm5110.c:605:6: note: ret is overwritten
>  ret = devm_snd_soc_register_component(dev, &tm2_component,
>      ^
> 
> it seems wise to first test the return value before checking if the
> returned argument is not null?

Actually this is real bug. The args is a stack variable, so it could
have junk (uninitialized) therefore args.np could have a non-NULL and
random value even though property was missing. Later could trigger
invalid pointer dereference.

  Fixes: 8d1513cef51a ("ASoC: samsung: Add support for HDMI audio on TM2 board")
  Cc: <stable@vger.kernel.org>

> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/samsung/tm2_wm5110.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
> index 9300fef9bf26..da6204248f82 100644
> --- a/sound/soc/samsung/tm2_wm5110.c
> +++ b/sound/soc/samsung/tm2_wm5110.c
> @@ -553,7 +553,7 @@ static int tm2_probe(struct platform_device *pdev)
>  
>  		ret = of_parse_phandle_with_args(dev->of_node, "i2s-controller",
>  						 cells_name, i, &args);
> -		if (!args.np) {
> +		if (ret || !args.np) {

Only "if (ret)" because args.np won't be initialized on errors.

Best regards,
Krzysztof
