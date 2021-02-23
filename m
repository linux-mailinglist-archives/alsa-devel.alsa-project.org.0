Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D5632318E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 20:42:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 751AA1676;
	Tue, 23 Feb 2021 20:41:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 751AA1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614109333;
	bh=YXFXz/p5xSBrU0WmSf+XkrBUDiFWAkC6+169Jz7OmYM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NkMT3yIoaSwgg2ANuwQVsiN9iGarqi6jHyGg4FlCGRjVLf5T7y5IWVBS5m/h6OsdI
	 Mg3Do24aqf19lfJ5y9bDT5whW6pdAWzY8xrmi7tn2i2RLtXKwgH36e+9l1ErSLaY3t
	 Q6pJonxXC0uhOWUX9otXaggNnt9aoxFRD5j6YVoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5B11F8016A;
	Tue, 23 Feb 2021 20:40:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ED08F8016A; Tue, 23 Feb 2021 20:40:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48211F800B4
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 20:40:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48211F800B4
Received: by mail-wr1-f51.google.com with SMTP id n4so23801165wrx.1
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 11:40:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sns0MeQxWwav8lrRZ1YtEH+ncu6WHJJ5CzQoTX7IQn8=;
 b=AXu16gKf0v1ujsqYz7KyiQTWXTeR91lxf2Lxnbh5cyZfxPD9v8zvT6b1HSwMks4h6s
 0poCFjDXIqldQwljs8KfISpCotFykhuLn1yi9H/f8O2JAgDK83JaplunjbcXToZq1nUG
 iSCL3/jHT7tl0ZLWbCEvNzL9ge7aoR/oLJpH84y7rVxHeZKWADIDvPwITK9MamG8IuxM
 aQ3nKZZUchFStdPj2/L8kO7Cxz6aY/Ids9/DV3s2G2LOnff6AzHMjjx6MUb6YM25leQB
 UDMCshikyy9Z9r++lxOlqHUvvzHVDqOZ3wshoRlKgeLrCordPu/ErOGG2c3HyrQ1zETe
 npvA==
X-Gm-Message-State: AOAM533bXgfs1yOVQxL3sBckqFYB68M0WLlahnOeoc75rEdGxWdN6HNn
 U2pE5HiBtfuloipydHAHhg4=
X-Google-Smtp-Source: ABdhPJw2kO99MyQhBFmwwOVdeQtUTiieSVx1G4g8al0ncg0nM0PcNXZoJ8qZrygGB8HBqP9aElXo8Q==
X-Received: by 2002:adf:e60a:: with SMTP id p10mr2683770wrm.291.1614109230300; 
 Tue, 23 Feb 2021 11:40:30 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id j125sm3538982wmb.44.2021.02.23.11.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 11:40:29 -0800 (PST)
Date: Tue, 23 Feb 2021 20:40:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 1/6] ASoC: samsung: tm2_wm5510: fix check of of_parse
 return value
Message-ID: <20210223194027.2efq23dxuwrbpqp2@kozik-lap>
References: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
 <20210222213306.22654-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210222213306.22654-2-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 stable@vger.kernel.org
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

On Mon, Feb 22, 2021 at 03:33:01PM -0600, Pierre-Louis Bossart wrote:
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
> The args is a stack variable, so it could have junk (uninitialized)
> therefore args.np could have a non-NULL and random value even though
> property was missing. Later could trigger invalid pointer dereference.
> 
> This patch provides the correct fix, there's no need to check for
> args.np because args.np won't be initialized on errors.
> 
> Fixes: 75fa6833aef3 ("ASoC: samsung: tm2_wm5110: check of_parse return value")
> Fixes: 8d1513cef51a ("ASoC: samsung: Add support for HDMI audio on TM2board")
> Cc: <stable@vger.kernel.org>
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
