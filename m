Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 566F2213391
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 07:35:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB59916CE;
	Fri,  3 Jul 2020 07:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB59916CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593754548;
	bh=el/bvxKGZCoWQ+Th9ZC4x6Zo74egeAcCbNfR0dPnQgg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O2lXVAtz2RYEnnMKEEiUofx/aKFZye2KHfi2FUARHEGDQcxTxpoWf6mzMV4T07oem
	 7wqx0S5mh2EdKTazF2Jx7Dirp1OzEdeF7KJSyZmE0k8uGKbEo9wnr0WsKp9jh09U/j
	 u2PlBbZO7MY1PyqkmJ64lZeV1DDqLNJuFtiiVbBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E6EF8021D;
	Fri,  3 Jul 2020 07:34:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C112AF80217; Fri,  3 Jul 2020 07:34:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C83F5F800ED
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 07:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C83F5F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="C0tiH8s1"
Received: by mail-ed1-x543.google.com with SMTP id z17so26553275edr.9
 for <alsa-devel@alsa-project.org>; Thu, 02 Jul 2020 22:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vr5c0L1rLWCP9M1VAYm/mEwO9A0z23CicG6nUFMruNQ=;
 b=C0tiH8s1cuWq04m/sVyKw6ARueRXh9QIK/mxxpbLBcssWeBQV2/qKi7GTQMfxDZIsK
 Al4Pg6HsFLz+VfvzekOfSybi8s0LCDgHm+u4PAXQqJKMHSBnUeUF03s14TXRz0JDDSvj
 PlquAQARdIoU3uiOyr61TBsqp9ArwIrnnviwfIlS1kb4ySpr8QZZTfy0fbqWAQsr6h9W
 t/zrEsoGc8Rp3KZqodhyVRleLixQp6HMcvFP7sG3xFVbdkQ9BiC60Jf44E3+jGp0LgKC
 jv1eKsEDGfwjDr92axHRg4/76uY59PuNK8JUDnIHRyeGf4JvutpeXQeBLXjqk7VhiE3Q
 UDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vr5c0L1rLWCP9M1VAYm/mEwO9A0z23CicG6nUFMruNQ=;
 b=s1RjPx/6sazFYnCLUqqj2+oWl8RrVxPeDU6gr3QclkjaKAyKmtJNnHtXcesFa1UPJ7
 XWcgvwdSAS7kUU4su1pn+gkCCvPNb1/xUnaS62qevu86ldcx7f2eTQQZY5zWLDNwpzdF
 8rghvlGPI1F8WWprMle++/QrSvS1eBV5T8j5MwKnJYinQqdDWNaH07Cs0U7JX3GJHKUg
 D5Jiq9JTzodApeZpRiyWywabsddGDJfwxeqQhZyoQBd3y/1XPe3gH969DI/oJ/9VtpiI
 WOODFTgphvt5acuLBNmM3gXM30l3ourJOv1ReemhR/K9R5lKpNGDHiErEojzV+cxtI/1
 ETLA==
X-Gm-Message-State: AOAM530i8niXurZMFPc75oco1CSqLpL7wXyBGLVYPwjf9jzzYzU2MmRI
 TQR4mk0Od6hXNsC4witGkw2HI6OD2pYg0wMtCqausA==
X-Google-Smtp-Source: ABdhPJzAeLBC6ue2bO19iEG+xcUUJ6HFdGxGHSzpvhD0HMJhUwMC47/S3rC5UCdKAqz2bgjKGzKGAPViC3TTpACt+fY=
X-Received: by 2002:a05:6402:16db:: with SMTP id
 r27mr39373377edx.139.1593754437656; 
 Thu, 02 Jul 2020 22:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200703032948.2185290-1-yuhsuan@chromium.org>
In-Reply-To: <20200703032948.2185290-1-yuhsuan@chromium.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 2 Jul 2020 22:33:46 -0700
Message-ID: <CABXOdTezM+N+kO=BYTggfDvCyqBtQzYzVEZtrd183VUYP6KwKA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: cros_ec_codec: Log results when EC commands fail
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>,
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

On Thu, Jul 2, 2020 at 8:30 PM Yu-Hsuan Hsu <yuhsuan@chromium.org> wrote:
>
> Log results of failed EC commands to identify a problem more easily.
>
> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> ---
>  sound/soc/codecs/cros_ec_codec.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
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

This change isn't explained in the description.

Guenter

>         if (ret < 0)
>                 goto error;
>
> +       if (msg->result != EC_RES_SUCCESS) {
> +               dev_err(ec_dev->dev, "Command %d failed: %d\n", cmd,
> +                       msg->result);
> +               ret = -EPROTO;
> +               goto error;
> +       }
> +
>         if (insize)
>                 memcpy(in, msg->data, insize);
>
> --
> 2.27.0.212.ge8ba1cc988-goog
>
