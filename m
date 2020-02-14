Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CDA15FB40
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Feb 2020 01:01:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E0E51676;
	Sat, 15 Feb 2020 01:00:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E0E51676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581724873;
	bh=lyeLlT8T/Hnk6XsivFhKUekD2fvpgmkdqUrlemSipG8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gThFM1glAyIB1KlLKdTZz4n3rbRUGFWibT7Ut9IyfAQWdbNY8SB4OVW77FHh5XIAH
	 p8ovvi+l7kHhxbqABkveR5Ytj4c8MRDAGJ2eTkxgvDNcYAHBQonldMrLMLXQO//cPX
	 yaWFenBtJm0OFLkhz0yROk0Kks2cSzm4JvsdV70k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9B99F80086;
	Sat, 15 Feb 2020 00:59:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAF6BF8014F; Sat, 15 Feb 2020 00:59:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9105F80086
 for <alsa-devel@alsa-project.org>; Sat, 15 Feb 2020 00:59:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9105F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="qoZ8bvp1"
Received: by mail-io1-xd41.google.com with SMTP id c16so12423362ioh.6
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 15:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1d6JlykbVicmjG0A2XUt4eGD3FJVfi/fh9TSeO7qCwM=;
 b=qoZ8bvp1ZKuu6goMKUjVMTPgR9GgeGjmljCOt3XjoV9fORvvcDsIAjo0g3xIbB5Ik7
 KdGkT5lt9iXWZ/z/MBilIsHWc1nzMp+g5gcU/hLP3vaaScigRfoYnnNQDPZ6vWCu/3rX
 3tNKdFZUQnZ2J6y90kTjadH6BTGSsLBoexQkRbptaj3XneVQq9+fqz0sEQZQtCyq4aPH
 EsqRQsZv57w2f+dNLbWlzBU4HQkLfnvHLaz+tjNhVSDD0ZhI0UAhcui0sTQ/IAblTagH
 68V0nNAsfXuA0agsT9wdDsreszDD+Ha/TE2LwH2nuoLj4yJ61g317518G0bMp5PPuA9w
 uoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1d6JlykbVicmjG0A2XUt4eGD3FJVfi/fh9TSeO7qCwM=;
 b=MJIu9xXURXMYr2jp0PxiiAR0aXxplIUHujhVm5gJMZC72L21iquT21uAY+Ps8mXqSS
 21oxXscB3eYeRkGEHtlE0pkNXdqQx7aYs8ShPgAA5dsEBvT6jPpi86C8+xhnyZZf9Gfp
 HZ40dVRjQn3SVPvCjnfmFNv7VBwrrms39DqyK9+Riyn4TAT1isleXmd3Jrk0QHP3E7Z7
 Qv3ojsf0+r2PJTlDqDA2HXxbTejAiP0f92bT3GNf6hRst7lgWQja4Bd6HydrwLPGTlrE
 Z5rN8UTUwXvZzQumRJUneRwwTPkXHlrvpB8c55vgIxjdwDwTjJkJ18uu8A2k6UZA0KVj
 u3dg==
X-Gm-Message-State: APjAAAWN0zrWDoT5cARJRlZOpm7c0qAVkWmgEo36mGRCLU+HYiX6W68O
 XU7ncpT65ErjB6mapez/WwiubHOIDn2WDPzpMMnoYA==
X-Google-Smtp-Source: APXvYqzCcV3CabKkAZK0b1p7Mn18+1jLNQikB9SRQht9Z9uo7mLVPhCQ74Zh2zqPN2EZXKwwi7uQIrNePZqAf4dxm7A=
X-Received: by 2002:a05:6638:538:: with SMTP id
 j24mr4421937jar.12.1581724764168; 
 Fri, 14 Feb 2020 15:59:24 -0800 (PST)
MIME-Version: 1.0
References: <20200213153226.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
 <1581664042.20487.4.camel@mtksdaap41>
 <CA+Px+wW0BWz0-8L_UXJ-OYbwG6W9vmCWRr7kevpk0yokp+NKKg@mail.gmail.com>
 <1581669243.29925.13.camel@mtksdaap41>
In-Reply-To: <1581669243.29925.13.camel@mtksdaap41>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Sat, 15 Feb 2020 07:59:13 +0800
Message-ID: <CA+Px+wUacX+HbgLTSjAuq0feoeYNb5pp=1w8C4_zm=0jGVcHUw@mail.gmail.com>
To: CK Hu <ck.hu@mediatek.com>
Cc: ALSA development <alsa-devel@alsa-project.org>, p.zabel@pengutronix.de,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Dylan Reid <dgreid@google.com>, linux-arm-kernel@lists.infradead.org,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] drm/mediatek: fix race condition for HDMI
	jack status reporting
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

On Fri, Feb 14, 2020 at 4:34 PM CK Hu <ck.hu@mediatek.com> wrote:
> It looks like that even though sound driver is removed, hdmi driver
> would still callback to sound core. This is so weird. After sound driver
> is removed, hdmi driver would callback with codec_dev which is invalid.
> I think this may cause some problem.

Will do some tests and get back to you.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
