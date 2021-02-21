Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A143209A8
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Feb 2021 12:00:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F08511662;
	Sun, 21 Feb 2021 11:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F08511662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613905250;
	bh=l7l64p9aWOBOlJaNGGkpRUhGtci8YxsB1TonzXgR0AY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lQpT/NUyBZvhAz8KO7OFFCGMeKoDOw5rJZuH5RMgQl+2MdxJqAAI1CblWA/g34ZKl
	 AXZQn8OliX1tOu1+e4ut3t6wo5u/Arvdl+z2iP9i2YQziTiYJx5eL25UqB/cj+O/V8
	 azzUnXuOq6yTVYODVjxuH/POBde7PBXbcF9/al/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D9C2F80167;
	Sun, 21 Feb 2021 11:59:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 754C1F8016A; Sun, 21 Feb 2021 11:59:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36567F80082
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 11:59:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36567F80082
Received: by mail-ed1-f51.google.com with SMTP id g3so18045913edb.11
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 02:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t81BxgbZs7qj3AIlLEIFL5HL8fw6VeMrLybH59Y6KiM=;
 b=XPtf1l8RXsc+6Ybn/6X603RGYSXUS/vXo138xW6jBzv6p+FE+onIJdhmYH22a1WthN
 0nfWWIi655iIsZihp0uIZudpJMT8+a32WvqCIxOm2sg81yedww+ajisg4g57xqrVScXi
 VGEhP1p+hOrU9qnGttIDaqY4Ndub7oAIT7e2LCbT+vjqY2SdsMVunL5kjpokSrvYm3ra
 /tb/a4/i3cS1cusFetspnEiKx5TzrQiFkB0oMVrWwBXqLtk6ZqchJcIigwRd98BMelGy
 X0sQNSmlnKaQ7MmOnOjO0owhj2/NGbsPT4jmzDnWJjpH8Vh7l46jRcSyHQ8r71wnQ8/T
 aumg==
X-Gm-Message-State: AOAM5337jovMl/sPIUUMA2nsn6+Qg6+Qs02a/KlkacJipl7tiZswGFu2
 8bmURYcUCIWyexI0U2VSkqc=
X-Google-Smtp-Source: ABdhPJwT5ABO361iDzqTw+sI5prv1NAsS42M9Rh3MOgWHu3rmXo35X7McW2X3Ftj/BrEN+OqIuwy8A==
X-Received: by 2002:a50:9ecf:: with SMTP id a73mr17255942edf.181.1613905148315; 
 Sun, 21 Feb 2021 02:59:08 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id r11sm9253022edt.58.2021.02.21.02.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 02:59:07 -0800 (PST)
Date: Sun, 21 Feb 2021 11:59:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/6] ASoC: samsung: smdk_wm8994: add missing return
Message-ID: <20210221105905.aygi75qkjzl434wp@kozik-lap>
References: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
 <20210219230918.5058-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210219230918.5058-4-pierre-louis.bossart@linux.intel.com>
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

On Fri, Feb 19, 2021 at 05:09:15PM -0600, Pierre-Louis Bossart wrote:
> cppcheck warning:
> 
> sound/soc/samsung/smdk_wm8994.c:179:6: style: Variable 'ret' is
> reassigned a value before the old one has been
> used. [redundantAssignment]
>  ret = devm_snd_soc_register_card(&pdev->dev, card);
>      ^
> sound/soc/samsung/smdk_wm8994.c:166:8: note: ret is assigned
>    ret = -EINVAL;
>        ^
> sound/soc/samsung/smdk_wm8994.c:179:6: note: ret is overwritten
>  ret = devm_snd_soc_register_card(&pdev->dev, card);
>      ^
> 
> The initial authors bothered to set ret to -EINVAL and throw a
> dev_err() message, so it looks like there is a missing return to avoid
> continuing if the property is missing.

Good catch. It's a required property.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
