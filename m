Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4FC3ADF48
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Jun 2021 18:10:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13A9116C5;
	Sun, 20 Jun 2021 18:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13A9116C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624205407;
	bh=tjeSINciDW12S1VrmF4nq1guvtodgKBNcjudvGRABrA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BX2NCnWL8r+YGo5fsUQpdaD6wXYw6oP9O88ZCISll/fEcXvH1vcBXXSaohfpR6vKi
	 gLEOVxRfeKsmJuaU7WfLxNYruP9r5Q11yoK7fMMThMqi6dLyvOtobVnkeJwe8GTUrG
	 2t4m5py8NivzdgxqBiNdrvzicsDJQSVNvWolBleU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B160F8026A;
	Sun, 20 Jun 2021 18:08:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED4E3F80268; Sun, 20 Jun 2021 18:08:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5D54F80166
 for <alsa-devel@alsa-project.org>; Sun, 20 Jun 2021 18:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5D54F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SCUZYrhy"
Received: by mail-lj1-x22c.google.com with SMTP id a21so16595379ljj.1
 for <alsa-devel@alsa-project.org>; Sun, 20 Jun 2021 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xyEfebiXqYNaALai0dc0NlYZvLuifjLJPF+acdj7cHw=;
 b=SCUZYrhyC3bzbekfgEdTiQvAkoXaEfCjnMe13sR9LNfoznfnhDaODdysD1dWVxyJMm
 Q3Hn0orc8h7uWkPszLm+3sfQuvAt+4smHgkIBA2RmWQ929Kh5sqzpv1+CPVOJ5kQ7Y30
 k8dHZ/qmy0SghgxSOrlqM5IIug7ZSON9VlPkzNz15SZHwfCgbZPyNoY/WLmvzSyikFt0
 /LAbQ5tlJc1MKfBQzh7IbUKM5nmulIg1N+RkmtEStdduXGl9yvtSzLK0mnlT+NFLF6+O
 o+54oEKIqjSIl4tBZ0jYP/tVN4HowXsyMLoYngtn4ri0U8tY2WCJL2GkW38qKVnwXt5r
 Omrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xyEfebiXqYNaALai0dc0NlYZvLuifjLJPF+acdj7cHw=;
 b=Sw9NiIVN9AybIdDAdE8vq3qpDs5/y55xnY1+whJ6HRpElnLr1JLDjLSESWNPUM0Cu9
 wYLkZvyKLx98aoFn7S9bMbaiQiHZMz/ZMvtJTlH+uYoiRH3Dfd0fKGOyulh8+TP7M6ui
 wcS5Rjhb4qUdRmtr23V40EjNnCuhtWlalgM1Ymntbfkg/yzPzTteJkaU9QHzdQQJGKJp
 zNTZD3pTMQlLe82KJtOk5QNAMickhJoz+NFjKdOByd5jZhFYg5CHGiKSGEYclZY3pNRu
 YyEewOZSP61EK9+/3ArMzmnx8s8vm3l8BijuhBrh2fCIE+K9cYFCB+nXuvz2G/xCc6mb
 IPKg==
X-Gm-Message-State: AOAM531WtzQDmaXnX5kipeIo13dzoxDP0D+9KxXvyaLv51g51iG2HHX1
 VGwEe9chYesfoendPqbw6b3TIfFF35DBsB+kowc=
X-Google-Smtp-Source: ABdhPJyROgTI4VlSioroA2g+HNxf+9YY6jNyzTlN+44vu84Jzis/OtsdjYoW27jIdySr8q0TAxU/StC00hdanaWUbVY=
X-Received: by 2002:a2e:9194:: with SMTP id f20mr17902405ljg.264.1624205310874; 
 Sun, 20 Jun 2021 09:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210620160135.28651-1-timur@kernel.org>
In-Reply-To: <20210620160135.28651-1-timur@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 20 Jun 2021 13:08:19 -0300
Message-ID: <CAOMZO5CfoyxiDGKngp2Ar+UEd4zX5se2hWbZvs=S0jXsvJ4D8Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: remove Timur Tabi from Freescale SOC sound
 drivers
To: Timur Tabi <timur@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Nicolin Chen <nicoleotsuka@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>
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

Hi Timur,

On Sun, Jun 20, 2021 at 1:01 PM Timur Tabi <timur@kernel.org> wrote:
>
> I haven't touched these drivers in seven years, and none of the
> patches sent to me these days affect code that I wrote.  The
> other maintainers are doing a very good job without me.
>
> Signed-off-by: Timur Tabi <timur@kernel.org>

Thanks for all the good work you did!

Reviewed-by: Fabio Estevam <festevam@gmail.com>
