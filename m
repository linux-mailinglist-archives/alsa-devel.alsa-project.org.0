Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF18729D49
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:50:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABB92825;
	Fri,  9 Jun 2023 16:49:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABB92825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322202;
	bh=jU1Lu7noq7FFB42OxO5LhF6eYAy7PHY4si4haSjPrNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OuYic3uQtQhuLvBdMKErz7oTFm3GQia/k3zN9+aVh3ioqMpDX+Xxl7tWu5L+YkzKr
	 X8bar0jgs6wk2AdFHW5n0B57j/VVHjO6VOlo7103m1jxF6iqCcmZEaqQPVLWn5EnrK
	 cmi0BQEU7nI+LTdSa7nWabtewArCfcJ5wuZ6gqc0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACAF0F805C0; Fri,  9 Jun 2023 16:47:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7228F805BA;
	Fri,  9 Jun 2023 16:47:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7222FF80199; Wed,  7 Jun 2023 12:48:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0413F800C8
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 12:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0413F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jqPUXaZQ
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f6ffc2b314so3518465e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Jun 2023 03:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686134905; x=1688726905;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5WnwcMBCzqkTVNzKGHjoxn35nzFWBrFOxHg0gfxp444=;
        b=jqPUXaZQTinGdOZHeZxGkOYpbigj6OXsRHKd7XkfsY1tBwB6IzcgfyGQRj+rsh3zCj
         XzzwOyIaek0ZGCBxXF/aJ+GQA9BXjMMVsq3uoYZc4ywMZQBbdQjUWTpNNNG606Xn7Ltl
         /IhqNZPiBawT2D5CS2vlz9p9JxZowy+4Wq5GwnwNll1xJiTqUXduLEsQ5twg9HMzBEQU
         jD+AmO6QvNniSv+ifKh/AG9oZpHNo5+AWvgf+Ds3jzGWCUocVXXFXqsIgn8uDtJIcvNc
         a9SxM3MtSpX+pbk/9Q8wQiKBYIuEIM10hDwFyZzCyivMMkfz0Or3gQXQdCia5HgWK5C7
         T54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686134905; x=1688726905;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WnwcMBCzqkTVNzKGHjoxn35nzFWBrFOxHg0gfxp444=;
        b=Zxd86UgGqlc+iQacEdrbWz4Dws16l9uwaBEj3vSaJ44xl6Od8Doeel+9bDieRc/qNK
         nlE6mzC50JexpCkT3PMJvP5IBacRzLpZjGy9TtNMswkIPR98OoydHRW1CZHX5tCqFabP
         eqmlmXQCYlVD5vzAozgtUGhib7N+y7Mk8BuUESCQ6TTj4mAuK6WskthuTRl6wQVjV4lI
         8C8VnOfQk8DtF8syPmU+uC9OVpgB23Ta6AdJ02ct3KRmr5Wl++h25i2fSeav5P99GrhX
         MDktaRjL1CLlLDiGgfQ9J0/BQjZhrKGjuCWNRereqpcIxklGEEsB+pDps5gB56+iDIo2
         ++XA==
X-Gm-Message-State: AC+VfDwi5t04UsLv6erf/PfQgIZJYz5IkiATHHTVQ65z1WDHL5YJQX9n
	+DmDCEmu4DbMZXVyTh6i9t4s6g==
X-Google-Smtp-Source: 
 ACHHUZ6CMGSciI0Kpmcx3vVL2gO7RAJ6dvY+IatyoKt8MAEdLxsahTyA1fWKNuhWdn9mN/PELwNlRQ==
X-Received: by 2002:adf:f141:0:b0:307:cf71:ed8c with SMTP id
 y1-20020adff141000000b00307cf71ed8cmr9229756wro.35.1686134905648;
        Wed, 07 Jun 2023 03:48:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 m6-20020a7bce06000000b003f7e717c770sm1720326wmc.23.2023.06.07.03.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:48:23 -0700 (PDT)
Date: Wed, 7 Jun 2023 13:48:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Trevor Wu =?utf-8?B?KOWQs+aWh+iJryk=?= <Trevor.Wu@mediatek.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"amergnat@baylibre.com" <amergnat@baylibre.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Fix error code in
 codec_init
Message-ID: <37fcdf74-d67b-4235-bb76-66df461cdc8a@kadam.mountain>
References: <f1d2f4c5-895d-4ad3-ab0f-b7ea4a74b69b@moroto.mountain>
 <6506d2d9deb95d4340261ace299eb8d735a50ddb.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6506d2d9deb95d4340261ace299eb8d735a50ddb.camel@mediatek.com>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NJ5WPDNDCH7IMOJXY7ZIGNQBATKHUV5Q
X-Message-ID-Hash: NJ5WPDNDCH7IMOJXY7ZIGNQBATKHUV5Q
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:46:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 07, 2023 at 10:30:05AM +0000, Trevor Wu (吳文良) wrote:
> On Wed, 2023-06-07 at 12:41 +0300, Dan Carpenter wrote:
> >  Return -EINVAL on this error path instead of returning success.
> 
> Hi Dan,
> 
> I intended for the function to be reusable by both 2 and 4 amps, which
> is why I added a condition in the middle.
> This shouldn't be considered an error case, so there is no need to
> return -EINVAL here.
> Please kindly inform me if there are any errors in my understanding.

Oh, it looked like an error path.  Let me change it to "return 0;".

regards,
dan carpenter

