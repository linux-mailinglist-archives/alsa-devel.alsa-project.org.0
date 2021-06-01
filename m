Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 672E53975D7
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 16:55:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C573916D0;
	Tue,  1 Jun 2021 16:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C573916D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622559301;
	bh=PF65HMaC5iUV9xCVJf8Ec39doIgvO0umGLBQxkM8fjs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m+vSks6cKIWHeuvhDophN2SSQhrVybEHM9IW7HEPnJjjkbTqG4wQDiJzYse/jQOeY
	 O4p+QJ8G8wuvMYXo8Wi26XGPmfoLHiOvKaxcxywv+oFb6bf+COL/eYiAXh6rjl86mj
	 wk/oBXJlIbXy7kjt8nmt5j0OQao3aHyxOve6dWIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18FE1F800B2;
	Tue,  1 Jun 2021 16:53:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E525FF80254; Tue,  1 Jun 2021 16:53:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA386F801DB
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 16:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA386F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TEg21JhD"
Received: by mail-wm1-x32f.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so2119667wmq.0
 for <alsa-devel@alsa-project.org>; Tue, 01 Jun 2021 07:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=W2kyomq6HBL5TPAwM9hsMfHIspmq5b2l1+yMyreGJzo=;
 b=TEg21JhDUFVCafPPe9rtcG74SEu6TXV4OvdopaJQb+OjnboON7V+hy3twxJEL6EC+Z
 guj2+clNdkKivngAf/yeFgN554G9qcTO5VkztWsgQ/jJLrqTFvTl2UHZzBqrjM2EvVQQ
 QI/QyjvLkTsvaIVEWfLQcE6VVxHQ2jBq0J/ZuWmEg4w0kYKHsRZ+/ienMfT+etUon2tY
 6/h7i1V+YyLqXL16T9wBklzf502S2w9eoB04VN8uUUwu+Rj/eOTqRmMo1bEPPIoPtu+k
 xwOIOWyWxR8YUqFtjjE0yx/Lh0Heb49GqDNfUc8ahMJBqzwMHlasq00y5B9mlutSVzJb
 uHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=W2kyomq6HBL5TPAwM9hsMfHIspmq5b2l1+yMyreGJzo=;
 b=Q8hcH3Bj2okX7MkTuwcdXvy+bvf8gighOBHEXkFoV9+P3/tpIGJhGoGUuC0iYIr5eK
 0Dem1uZb+c2QEUSNRijAeI6SOXbCd23sMWlvSqItQd4dHE3dzLj9qcsHpYTbQHZu3QjB
 DVKb07hw5HcvwCg6SSZOQNW2DL27C0K5Cpm89/ki/PTuxJ+gdHtt2DPxZEPfVGyl+yw2
 iEcN8jwsu4EKf07F6mXCI5cS0nTInUMXyZwMHVo466H+eMfkVpBxKjmspWyKgAzDge2u
 R3hYDgAWaNlugPaqQJ59FhjokuqF0amLXNeXyqhAWGxoyHQi9fJyG+7LrC9QrlBaKSyJ
 5GWw==
X-Gm-Message-State: AOAM531bac7s9YB9247gzpACFEMxrov7zouHr/dw1LO1rIp9IExOqQkK
 5YUHYADOeB3sMVINNbDYFGx0mA==
X-Google-Smtp-Source: ABdhPJxnBgbZtAB1MlRP6uBEbzjBrOwMOwCbmGXHa+pkO19wrKIRJ28Pumactjmp/3FqEjyHVYLdBg==
X-Received: by 2002:a05:600c:2284:: with SMTP id
 4mr12558069wmf.146.1622559201249; 
 Tue, 01 Jun 2021 07:53:21 -0700 (PDT)
Received: from dell ([91.110.221.249])
 by smtp.gmail.com with ESMTPSA id h15sm18681785wmq.1.2021.06.01.07.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 07:53:20 -0700 (PDT)
Date: Tue, 1 Jun 2021 15:53:19 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] mfd: arizona: Allow building arizona MFD-core as module
Message-ID: <20210601145319.GL543307@dell>
References: <20210521135023.192688-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210521135023.192688-1-hdegoede@redhat.com>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
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

On Fri, 21 May 2021, Hans de Goede wrote:

> There is no reason why the arizona core,irq and codec model specific
> regmap bits cannot be build as a module. All they do is export symbols
> which are used by the arizona-spi/i2c and arizona-codec modules, which
> themselves can be built as module.
> 
> Change the Kconfig and Makefile arizona bits so that the arizona MFD-core
> can be built as a module.
> 
> This is especially useful on x86 platforms with a WM5102 codec, this
> allows the arizona MFD driver necessary for the WM5102 codec to be
> enabled in generic distro-kernels without growing the base kernel-image
> size.
> 
> Note this also adds an explicit "depends on MFD_ARIZONA" to all the
> arizona codec Kconfig options. The codec drivers use functions from mfd
> arizona-core. These new depends are necessary to disallow the codec
> drivers being builtin when the arizona-core is build as a module,
> otherwise we end up with missing symbol errors when building vmlinuz.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Add explicit "depends on MFD_ARIZONA" to all the arizona codec Kconfigs
> ---
>  drivers/mfd/Kconfig        |  2 +-
>  drivers/mfd/Makefile       | 14 +++++++-------
>  drivers/mfd/arizona-core.c |  2 ++
>  sound/soc/codecs/Kconfig   | 10 +++++-----
>  4 files changed, 15 insertions(+), 13 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
