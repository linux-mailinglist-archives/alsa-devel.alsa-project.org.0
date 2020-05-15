Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 049D61D43A9
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 04:42:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 768851666;
	Fri, 15 May 2020 04:41:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 768851666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589510551;
	bh=89aNKTbBMpnlbwmG/rEXfmBNNni1rAjOp3gLK9P26Ac=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NHdiySwF7t7RgArfFxQ1euN6rC+Me5DonEWR1k6CXsDIS5NO3wluD/EfR4xD540W7
	 Epon9jaCj8wsGHnHLU3nqtZ6EuyEByAdTHr3oH60JS8JFWl9FF8WGVyFQ2GCO4nuws
	 a65ENl9Ip7b7OZd4QybDUhKkhe3GcSB3kbyz2TBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D966F80101;
	Fri, 15 May 2020 04:40:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B983F80247; Fri, 15 May 2020 04:40:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,ENV_AND_HDR_SPF_MATCH,NML_ADSP_CUSTOM_MED,
 SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C0ADF80101
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 04:40:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C0ADF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="HSYH4riR"
Received: by mail-io1-xd44.google.com with SMTP id x5so1079212ioh.6
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 19:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KkbPyV+difhpJv6yxC0OkWyudbcLolqKMpILjsUi6qE=;
 b=HSYH4riRZK9vU4lCLpOonV+VizjiVp3FRsKL9ZhwYb06ZeTgKb3+d6yPU0kZrbKkhH
 QaLnyj0zDWPwcCimJng10JiXUbFLnGyQgrNhVBBG1Cy3Y5lR7ZQUkWalp94wy4M7LWz+
 Ff+GmkuiNaM6n9UrZUkFnOKOXMJ9FF7ient4srtgpbxpNQMauDdHJWiJABq88zQ0lPr7
 xEs+3U6ctsrNs0ggAAdZF9sk7fmOXAzXy9Ot37LnpFoGwlO0aDMmK+/wQ9kWvoGDmbCu
 JiWQNXTRZszo7iDs8dNqkg8v6CDIEiddkQ66HPCgRqDd6IQINx++bPEVXlobqFAzYB/h
 0njg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KkbPyV+difhpJv6yxC0OkWyudbcLolqKMpILjsUi6qE=;
 b=ugy9ZmrGOLvTkIk5U8vO/E+LfLm9/0kJAlw/zQIKJKTsrbp2daXCvUtGRL83k12Mt3
 knvXc8zZf288Zj56VEWaJ1XDSzjeNsFEJn4EDpgc6M5uLtncUpEEXW91E3CXHrbQkJ7H
 gfb7h93aejbWAwd3wDOxhA7PS/69kinpO0BZIYsM0dhzu/9vlmfYMaFv+FQiZ7GgXy6i
 FlNrli181Y5KLy2QX6pEO2Sb49RE5ELfsI5Nog9TsSWRm/zZR+BiwKYWy9o0iAfIoQep
 7SXWKEd7ZFkdiKos5DTQzpJnFxxq6EYd0N2HcSvO29aLxDDbNUc4Q44TKEfi/7Gn/33o
 QZ6w==
X-Gm-Message-State: AOAM530tweH4//rwJLoSEI9x/oaDfm7A9CCz8nWYMDTleahSnpcIV8C1
 qQzBVQl5Gbf09r3paT8hMtwmZX61XlOPkVr1i36dMg==
X-Google-Smtp-Source: ABdhPJzY/WFUyRIgzalc5gp3j/5IMlHyOExDcL8m4/OIp5X4jZ0pXM1n2EwQ4rDXe2pV7iqftfS8AnJ9tv7a42PKF5c=
X-Received: by 2002:a02:cd91:: with SMTP id l17mr1215961jap.34.1589510430554; 
 Thu, 14 May 2020 19:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200514161847.6240-1-ardb@kernel.org>
 <20200514162548.GA141824@google.com>
In-Reply-To: <20200514162548.GA141824@google.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 15 May 2020 10:40:19 +0800
Message-ID: <CA+Px+wWps5d5qpL_0ed2jrD5bMKgd=8p1rbcRH28J-1SpgVz0Q@mail.gmail.com>
Subject: Re: [PATCH] SoC: cros_ec_codec: switch to library API for SHA-256
To: Benson Leung <bleung@google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Ard Biesheuvel <ardb@kernel.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

On Fri, May 15, 2020 at 12:26 AM Benson Leung <bleung@google.com> wrote:
> On Thu, May 14, 2020 at 06:18:47PM +0200, Ard Biesheuvel wrote:
> > The CrOS EC codec driver uses SHA-256 explicitly, and not in a
> > performance critical manner, so there is really no point in using
> > the dynamic SHASH crypto API here. Let's switch to the library API
> > instead.

Pardon me if I don't understand it precisely.  What is the difference
between the two APIs?  Suppose it should calculate the same SHA256
hash with the same binary blob after switching to library API?

> > Looking at the code, I was wondering if the SHA-256 is really required
> > here? It looks like it is using it as some kind of fingerprint to decide
> > whether the provided file is identical to the one that has already been
> > loaded. If this is the case, we should probably just use CRC32 instead.

No, the binary blob carries data and possibly code.  We are not only
using the hash as a fingerprint but also an integrity check.

> > Also, do we really need to wipe the context struct? Is there any security
> > sensitive data in there?

No, not necessary as far as I know.
