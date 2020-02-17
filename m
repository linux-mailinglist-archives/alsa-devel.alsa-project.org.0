Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F9A160C06
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 08:59:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0381F82E;
	Mon, 17 Feb 2020 08:58:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0381F82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581926378;
	bh=hHYUsPGezze/n7oVQh9m6hPhZEPrJfrvb/Ka2mfwHIc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tUa3YuHihD0B1JACoQb3j7l/ksmE+uVjZg5Wx4J1lAlsP56eNnfS7eVnAIk9IIsoP
	 7gHdzcAbw3TmtkM8L0jUIb8Bnrbwi0Mj0GHSMxUd9wbaavE8vJY+SfyetHoo7T70x/
	 GvaZ5mPNrnze0iCXdbMZr0b/Z+ya2nnYLuQgJgbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40431F80096;
	Mon, 17 Feb 2020 08:58:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AF7DF801F5; Mon, 17 Feb 2020 08:58:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77545F80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 08:58:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77545F80096
Received: by mail-ed1-f68.google.com with SMTP id f8so19608578edv.2
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 23:58:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qAkDAKXcgCBrOdSb/zgNyHSfr/RVZZb04YTPxwkLXA0=;
 b=d7fdRj9e27JW7V2Sea8Onam1gJhriqm9BacLD0VYdmNJuUUHaQBX7qmj2bC7WqNNBq
 F72V+qHyhBtIU45Eie79I82PDopUCCz+A0pC+yhFaaiUr5pft7EofHKKiyMgEIaUhzvY
 yyvJphiQOpv0mUJlkR9f0zvSwbeA0c2IiTm33vJ+UWGwT3ucbKN/GU7bYSQS9F5BUone
 TmKQrm9fGBh0zETC7L5YPuVz4ZZqHJSplBjvtrF8lWn0N4D0KC7bfoBD8NeWm8MOmew6
 7U9gJws/Fz2cwso78VCPiss019ExOFA1kX1JnO50VniIA9u/+AIw75DY1h+GKQJqQtl+
 NEjg==
X-Gm-Message-State: APjAAAVZnlavYHHbLd1GGCvnAC0JxYVrBvwNcU2nU/ZJ2PDMNJefG2mS
 3ghDEdFT5q6oRN09xuVWT6H7+Wh6Qa4=
X-Google-Smtp-Source: APXvYqyodKt+9bWWAk+W3OGN7NI+EZs7N3KQjjLIXFyHUeS0aPeRiJ/zL103ZilHJPri6fkTbT1Rrw==
X-Received: by 2002:a05:6402:144c:: with SMTP id
 d12mr11945360edx.265.1581926308363; 
 Sun, 16 Feb 2020 23:58:28 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41])
 by smtp.gmail.com with ESMTPSA id u10sm826445ejx.20.2020.02.16.23.58.27
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2020 23:58:27 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id a6so17282489wme.2
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 23:58:27 -0800 (PST)
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr22154598wmg.16.1581926307557; 
 Sun, 16 Feb 2020 23:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-14-samuel@sholland.org>
In-Reply-To: <20200217064250.15516-14-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 15:58:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v649-ZJZfnOoNtsRuQXFOsZLg69Bizz+vZbB6yML-T8z2g@mail.gmail.com>
Message-ID: <CAGb2v649-ZJZfnOoNtsRuQXFOsZLg69Bizz+vZbB6yML-T8z2g@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@free-electrons.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [RFC PATCH 13/34] ASoC: sun8i-codec: Fix
	AIF1_ADCDAT_CTRL field names
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Feb 17, 2020 at 2:43 PM Samuel Holland <samuel@sholland.org> wrote:
>
> They are controlling "AD0" (AIF1 slot 0), not "DA0".
>
> Fixes: eda85d1fee05 ("ASoC: sun8i-codec: Add ADC support for a33")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
