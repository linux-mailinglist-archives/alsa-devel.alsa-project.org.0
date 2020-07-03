Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19296213507
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 09:33:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A208C16BF;
	Fri,  3 Jul 2020 09:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A208C16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593761636;
	bh=C0Izbs6RbeSKq/gEEfsJ8cqHx1Qb+Z2Ku4928fDFUXY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WnMGUdBkVcwoHq0T67aX+WEHsR0ekmg6h+tRwX7LE99fYH46cpG6hQBOqF1kg9EFm
	 7Alk//YpILEkOARsyP8qA9J9hJiZB93ULsI/01qEQI6yJVsCJR7Jet/mPnIJUZCfyp
	 yeHlAdcKyRtO3wk6hY/8Wsm/5x0/i4r6aGBbD7eM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95DCBF800E0;
	Fri,  3 Jul 2020 09:32:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D494F80217; Fri,  3 Jul 2020 09:32:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8329EF800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 09:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8329EF800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="vTATOuPQ"
Received: by mail-il1-x143.google.com with SMTP id x9so26540175ila.3
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 00:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x+/vW+OeCuUFfmZ33bKp2kdfIMTrI96qZvK5nkkiTS8=;
 b=vTATOuPQzML5zSoilwoHzw3DAL41OliM6zI+kKVgVVsC0Q2hSUkdoudQe7Zj/AsBBy
 QIZR6MeIAocScr5kByrRZdLf8L7FzZTjU+0btvYZB+U2e4NI8exHoKYz8wdsx3i683k6
 0jdVR4MmHk/GYYB5JTbd/elg1rvm8T/U+/QDu7Hv5Ekj/jYHjLLOZrkV3mkhN2ZzN+Bo
 qCWbEKd41cX4C0unh44Qvb2A/7l9/+zIRCWB6vqECnFKuNSLzvsBFQruh/BHY25cBH3p
 WN9nVnin0cV2XgKukA9RuGEQfNzq2dznlPgj9EFbpHzkoU2K5ABbq6+PAahe4ex7GHje
 5/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x+/vW+OeCuUFfmZ33bKp2kdfIMTrI96qZvK5nkkiTS8=;
 b=WDJFkwtzqOWsR8MHersfLsGu47Zypj06ej7IX79/7GF+aCtLYmgIksSykvVA+VHWHN
 31sydoggN55BYVa+MwEKZeJkZ2qJc040u9ZFBzcMXcF3g6ZY3cj33hnT0tN2uTu8wGcP
 mmrGv/riG46ToskrLCsfAmeOuvD/mNNoEZ0Ipqw5V3HEeUG8/iRoajNF05qXGcSp2Vvj
 N/P8tLUYIz8hDF0Urx/b7leFixo7AKFjebueDHUXKWxO4HVNSn7E+wAxxfR5QBSKXz7Z
 yzUBFiNUEwnHNUhZTH8ojIci+8bop20bth7B41+BDc/26trqZKGheYgZ6yUpM4gnvgCF
 EhJg==
X-Gm-Message-State: AOAM533C5yurwe49B/pU4pYb2NfUkZ1U8ybyrwWH6Amwg/w8nkfoKhuI
 nuEfNrPENav1kEW30KQ4ANEBdh0usEhpkE5rt0vFGA==
X-Google-Smtp-Source: ABdhPJzWzMZA3AtErhTkdyYBW8iBKoGbRxKNeoaVF3URlnVrwKsdXGH9YXH56hFuzbiryQV9r7LZj72JExxKvSQ2WF4=
X-Received: by 2002:a92:8947:: with SMTP id n68mr16903165ild.235.1593761523450; 
 Fri, 03 Jul 2020 00:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200703071913.2358882-1-yuhsuan@chromium.org>
In-Reply-To: <20200703071913.2358882-1-yuhsuan@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 3 Jul 2020 15:31:52 +0800
Message-ID: <CA+Px+wVQC0vu5osOECC+x9JdsxdS8VpN+ni6y1k6YvOErsmKqA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: cros_ec_codec: Log results when EC commands fail
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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

On Fri, Jul 3, 2020 at 3:19 PM Yu-Hsuan Hsu <yuhsuan@chromium.org> wrote:
> Log results of failed EC commands to identify a problem more easily.
>
> Replace cros_ec_cmd_xfer_status with cros_ec_cmd_xfer because the result
> has already been checked in this function. The wrapper is not needed.

Alternatively, you can still use cros_ec_cmd_xfer_status( ).  I guess
it is okay to have 2 logs for an error.

> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
> index 8d45c628e988e..a4ab62f59efa6 100644
> --- a/sound/soc/codecs/cros_ec_codec.c
> +++ b/sound/soc/codecs/cros_ec_codec.c
> @@ -90,10 +90,17 @@ static int send_ec_host_command(struct cros_ec_device *ec_dev, uint32_t cmd,
>         if (outsize)
>                 memcpy(msg->data, out, outsize);
>
> -       ret = cros_ec_cmd_xfer_status(ec_dev, msg);
> +       ret = cros_ec_cmd_xfer(ec_dev, msg);
>         if (ret < 0)
I am thinking of if it is a better solution to print msg->result here.

>                 goto error;
>
> +       if (msg->result != EC_RES_SUCCESS) {
> +               dev_err(ec_dev->dev, "Command %d failed: %d\n", cmd,
> +                       msg->result);
> +               ret = -EPROTO;
> +               goto error;
> +       }
So that you don't need this block.
