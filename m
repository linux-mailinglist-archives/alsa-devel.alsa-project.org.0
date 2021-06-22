Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 538573B08AD
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 17:22:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0CC786F;
	Tue, 22 Jun 2021 17:21:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0CC786F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624375329;
	bh=bpqGkk/JGVe/MnPyoETv0p8uKc3pSJj4YexxopDDd2U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i7LRnooNiTp79GvHgf1o2Gl2z/1FyfE1azWpHtDSCXoUm210cP9pKMJCzCqCaeF8N
	 PmIBmQFZm4edoXuYfu/UiMKRrQqDNbid7BVEzRS5lQzbbc0UftKHEYyuan8Yc49u0O
	 vH4aO+5cHT+aStYBm9tJCptTyhDfPNw6PhR5LqkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1AA4F800E1;
	Tue, 22 Jun 2021 17:20:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08FFBF80268; Tue, 22 Jun 2021 17:20:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDDC1F800E1
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 17:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDDC1F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WLtAFBCc"
Received: by mail-lf1-x136.google.com with SMTP id p7so36415390lfg.4
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 08:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bpqGkk/JGVe/MnPyoETv0p8uKc3pSJj4YexxopDDd2U=;
 b=WLtAFBCczgLWoAx5u/xKxcRWJO0HNR6yVqDk+l8R3m+JsOWedfC6dxPJ0mhagcz+5K
 pzjeCg9kaBJUrpA2ySWvC5cu6MfVaxmxHmNjq2FNGbWzWw4/7Y2IKQXHnAR0CtM0spvG
 6ql5tmTlMHQNAGJ2lOmr7QKkejf+ZwcjpfhlvwZVgToxzbfSrYren053WLBLciXXr7AS
 bvggn8Kiz0A3YCR9fNo1hIfKyk/0ei3k7nRWo1Y0j944cFgoxzbUwTWlnLMtJre4oqZN
 znE/RpQ6dhr/I20sFxQDyiV2Txk8sOqA7IFz0r2LCkuZYgmWccid1xu5pOCRtWPLnUaO
 bWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bpqGkk/JGVe/MnPyoETv0p8uKc3pSJj4YexxopDDd2U=;
 b=uJE4iTe+a9wJrG0iQ4vbha+DBpozR0EmaDe1CmEh/vMnvUgcWW479ualCGRFH9ONkz
 CHC05ag2x7d9Vwhu8Izz+eSaXbRR1nBOmH0ESq9tQgtDvVl5rDxCB0Q+ooHV0e8DpR8r
 kn2vkBiKbY39RoxFKbBwMlJUZLz5s82VkgnBlISqb50JEPlAIu2VnRgdemHqFoIolhO8
 X6xRkd6l/2SctjowRtAM8aR6luaYNxJvgBAVGJ9n2Zt2LdisiVobudUJF86rcuTTmaTT
 oOYdASMhDTDmWhnII2BNzWIZErKf6nNO6l3xd6OzGUmoR06i3ngNcghEvRn5ngo99IZJ
 Yupg==
X-Gm-Message-State: AOAM533SETP2N4CQP4dQDwGsUn2bef2KepQ6oPMqWtgdNEZwb8jovXmu
 DUOB44XDVmmWFc+gd0lD9jibovkh0kKmm976w7U=
X-Google-Smtp-Source: ABdhPJzlzy1eLbw1J5ldiP+ql0q+z9KvG3TP9jztXX37rcURHYnYtIPG00PB5rkr0m28KIYSpdRMxVt50kjP3cde070=
X-Received: by 2002:ac2:4d25:: with SMTP id h5mr3257357lfk.583.1624375230527; 
 Tue, 22 Jun 2021 08:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <1624365084-7934-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1624365084-7934-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 22 Jun 2021 12:20:19 -0300
Message-ID: <CAOMZO5A_0KncwCgfZ6LSAO-LA01U9LS4=Hopn-_9qj8cv1Qhmg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Fix unexpected interrupt after suspend
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
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

On Tue, Jun 22, 2021 at 9:50 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> When system enter suspend, the machine driver suspend callback
> function will be called, then the cpu driver trigger callback
> (SNDRV_PCM_TRIGGER_SUSPEND) be called, it would disable the
> interrupt.
>
> But the machine driver suspend and cpu dai driver suspend order
> maybe changed, the cpu dai driver's suspend callback is called before
> machine driver's suppend callback, then the interrupt is not cleared
> successfully in trigger callback.
>
> So need to clear interrupts in cpu dai driver's suspend callback
> to avoid such issue.
>
> Fixes: 9cb2b3796e08 ("ASoC: fsl_spdif: Add pm runtime function")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
