Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BE35AF455
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 21:19:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B162210E;
	Tue,  6 Sep 2022 21:18:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B162210E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662491944;
	bh=mMXTLXRqhOR549yPMPkM4OHzglrtC5ZpCYNOZXQQAik=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hJ3oyQnGaGPiRZIVjI4u4rhfXTsoERUGjofgfZN/ahX2Y1a6qR1X3XPlu8oosCoG8
	 Li1DGU/dYpHkeLujSgVzJd6povREftN/6YNUds/qgdFYKujdGAAZhPzsIcjO865Zv4
	 meYffcukJztNmVxLvMDIG+cMNIy/NLebq7j0Yueg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C90DF8024C;
	Tue,  6 Sep 2022 21:18:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5333EF80165; Tue,  6 Sep 2022 21:18:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFBF3F80165
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 21:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFBF3F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="B3E8C/TB"
Received: by mail-ed1-x535.google.com with SMTP id t5so16405291edc.11
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 12:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=mMXTLXRqhOR549yPMPkM4OHzglrtC5ZpCYNOZXQQAik=;
 b=B3E8C/TBZqnpTcrMrYBP1uypjvJt6LTn5K0aeSFGTGnDM75/SgcLjnH2s1XuyndOr2
 NeXdk4gLnAtC1jnnSpSJcWb1nGw9BZXaiyxFj4nI7r60vra2MaDh1iVW+Vvc5roP7xyo
 +k854UjiXhaYoHukWSGuB1mcHCt99tnhERIvCrrIJubWvsrsQuJuyzqwJhPDs26ygpHa
 HikcX773yxgREPaejt0TfXyqKwSC72yBtS6IEcrjKfhKp/kmBybEA9Smaw16vi39PDAd
 /OBVPT0jcSIp2ASW0+yIy/FiHqpMYqsiePds7WT4ATwMGukbyxhYAyFGT0+e7U5H4Qit
 rlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=mMXTLXRqhOR549yPMPkM4OHzglrtC5ZpCYNOZXQQAik=;
 b=woml8ys6jNrYRJXJSWRj1E0ev1R3i//J2+4HWPu0eB8JPUlVF6DhMq37VifCcREONH
 cloc7tUWPvjgIaEi+CDdb0Eo0AK4U5zT4xM6Iy1dyfuLrQ5VAznENw4ceHeabix9amQI
 kUxCfXwdwz7Y9bVKbikk+zzR+daMTvmNr/yugxDdZbpR4VRZmojjISTlL+R9EH3BZfu+
 XgFTeGiuMFiPF9BA8fv7WgAYkw/v+9PyYs7F15pcfkpY69KoG9znDU6X1Lyq2t2OL6mr
 AGRlzbrFKcNSXdPZkiUrjvQvLt4s/nmHwM4Pyl5B/NGADTYxEncRwQaZSB7qGhwj9QTm
 4ieg==
X-Gm-Message-State: ACgBeo0/5qZL6Tzq+4jleanwtPyEql9Y99STRKvdnZDas7HciuVDHI9j
 m0m4m1llE5OxVFYlwM/basl4hQ7mxBJVh1KhJ8iRug==
X-Google-Smtp-Source: AA6agR6o8OVhPVYM0ef4LJ7gVnZEfp7DJX8/8ks9/6/dcXNmB91DkT5okCGy8Jsh2ons04HOpj/baeQ+tZHL0Qzh1PY=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr85904edb.133.1662491875121; Tue, 06
 Sep 2022 12:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <YxeaITtlJexygQo9@google.com>
In-Reply-To: <YxeaITtlJexygQo9@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 Sep 2022 21:17:43 +0200
Message-ID: <CACRpkdb_wksaRhAesjmGjvzm-thB2UdXX04Pd+-qRe2KKZhK4A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: switch to using gpiod API
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Tue, Sep 6, 2022 at 9:06 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This patch switches the driver away from legacy gpio/of_gpio API to
> gpiod API, and removes use of of_get_named_gpio_flags() which I want to
> make private to gpiolib.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Excellent patch, I love what you're doing here!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
