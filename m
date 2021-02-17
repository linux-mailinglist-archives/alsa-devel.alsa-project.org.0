Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DF931E1A9
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Feb 2021 22:53:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 325971662;
	Wed, 17 Feb 2021 22:52:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 325971662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613598827;
	bh=lhBoGY7enjnZ4RBMXhRw6bW+8AVQLGtmjtY1z85F54E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eLPbxOSz6qdw1CGQcNMgYZqmX3uz9MJHTFMGrti9T0eva55qLHmKnim7e+HEUyQtF
	 xl5a3YAD83MVU9xxuMSItmK2zazkHcoPnXjdM9r0IaXtZOBjoCzClDAo9iD3BQWNlo
	 v8J0NujBHDg5ii9F9paoM0zpzpVbbEH6y+1N8ifA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7792DF800AE;
	Wed, 17 Feb 2021 22:52:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2437FF80258; Wed, 17 Feb 2021 22:52:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10143F800D0
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 22:52:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10143F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="tYZe8OJU"
Received: by mail-qk1-x72f.google.com with SMTP id 81so183319qkf.4
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 13:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gPp6BCwPwx8BaXvkN0btUeoVM1kHJFwJfsOcaM7RBVo=;
 b=tYZe8OJUCuY6YjcY5qaxI0qYMbFv+dNlNQSTyvmDmXgWVpakLLZq69QfqObAp2gSAV
 QEtRd0Rqtpr4ShuUH2K5I1WrnUuOFi/OZp5CdSSNvt/CHgx0ANPq5ztrf79DXJF39CUj
 jskK+RoE4ZDTEKXZ3gg3OMIKqfJo7I0vI1hwE81xWqRon5tEpbW/HFjrzVK/V/hw0aWP
 m++a3Y6oGkAgOuriF1tleUTtjpPj2bIcHCkLFGEZgOZYvMV1dBLgMT8IMuYrepryzZ8o
 bQXHcrclz2bBQm6w8BaNAswio+bKRMbQu0RQNuSKdZSu9i8zdx9HNfftQCDroS2Aw7At
 WZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gPp6BCwPwx8BaXvkN0btUeoVM1kHJFwJfsOcaM7RBVo=;
 b=O+E2WglfyOZI8zzTJE39UWVmXlxSkJMU7NPQfkKB2N20QNUEQlgXAZQudsP8BBhAEE
 wKGapK3UdVdu+fNjJC373k/fbo0ubR4cq2hJNkr9+2w/VT1UGRM6PUyiAHXt/OI/9r9y
 NaspFguaZw/u+v9lIrMjX3aVrgG4AZmJdrSrqqVO65lm24DlTQE7SgbLeRbRIcEx17jN
 5PSq5UhUBLPthPNes78HMOEPPmhi1cRGrloFrcZvwfKV3OaGfp7anWfRcCacW63Ih+Hk
 Y5EaYSHgKZXPqkpYIT+XYQOk0BdVn77rBGOZRpXsmVPfnYIvV/ve31uavZ4XyYK0UGI4
 sOeQ==
X-Gm-Message-State: AOAM5326kjJqMjnecqBoTX6gNRUriyMOJ5oZTtyoMfnz6iMONJRlMSTy
 BfFlQamiRnngyTlrQrxoRUGCL4twbF/Qc3NWDfqGSA==
X-Google-Smtp-Source: ABdhPJyi9K6EC9xEgp7qNa+2ZKLBjYmMUQIYdwovuWElqxh/q5JgtQoNH0o9+OF3N5+2/YlKQNQKCQ5CYTtErLt4YWU=
X-Received: by 2002:ae9:edc9:: with SMTP id c192mr1365188qkg.36.1613598725263; 
 Wed, 17 Feb 2021 13:52:05 -0800 (PST)
MIME-Version: 1.0
References: <20210217214914.700751-1-cujomalainey@chromium.org>
In-Reply-To: <20210217214914.700751-1-cujomalainey@chromium.org>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 17 Feb 2021 13:51:53 -0800
Message-ID: <CAOReqxj=sCSdtd47n+VprG5g8-weybg0ThZ6tBLxprxi6==RDw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt5682: remove jack detect delay
To: Curtis Malainey <cujomalainey@chromium.org>, "Arava,
 Jairaj" <jairaj.arava@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Oder Chiou <oder_chiou@realtek.com>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

Hello Realtek
+Arava, Jairaj <jairaj.arava@intel.com>

On Wed, Feb 17, 2021 at 1:49 PM Curtis Malainey <cujomalainey@chromium.org>
wrote:

> There is a 250ms delay on the jack detect interrupt currently, this
> delay is observable to users who are using inline controls. It can also
> mask multiple presses which is a negative experience.
>
> Cc: Bard liao <yung-chuan.liao@linux.intel.com>
> Cc: Shuming Fan <shumingf@realtek.com>
>
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> ---
>  sound/soc/codecs/rt5682-i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
> index 93c1603b42f1..b15c3e7d1f59 100644
> --- a/sound/soc/codecs/rt5682-i2c.c
> +++ b/sound/soc/codecs/rt5682-i2c.c
> @@ -78,7 +78,7 @@ static irqreturn_t rt5682_irq(int irq, void *data)
>         struct rt5682_priv *rt5682 = data;
>
>         mod_delayed_work(system_power_efficient_wq,
> -               &rt5682->jack_detect_work, msecs_to_jiffies(250));
> +               &rt5682->jack_detect_work, 0);
>
>
This change is posted to start a discussion as to the purpose of this
delay, we are seeing noticeable UI delay and button masking. Is there an
electro/mechanical purpose to it? If not I think I should post a V2 to
remove the workqueue since this is a threaded irq. Please advise, thanks.


>         return IRQ_HANDLED;
>  }
> --
> 2.30.0.478.g8a0d178c01-goog
>
>
