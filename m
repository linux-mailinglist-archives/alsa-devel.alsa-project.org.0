Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBFE223BB8
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 14:54:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 379FE1660;
	Fri, 17 Jul 2020 14:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 379FE1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594990480;
	bh=8TAFpuiNk3z5NKpih87G4c4GgugC1x86MJVzPQ1yYTg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LfaIKAtj1n2qaNNsqnN9pRwvEu9Gftw02+apvwt1xJHv+qmD4u6GEyuGywq7o/jyX
	 d2tBju37rtGuvj4wFXOdgG+nj0Gw1uzJe0cqPq9GHJwaudLvyt6wED2HChwaEQfzUg
	 V4yPAXycQjq3zWqCqzgZBT8jQ+ig+Gum/2vf7BSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E5B9F800E4;
	Fri, 17 Jul 2020 14:52:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 654ECF80217; Fri, 17 Jul 2020 14:52:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7003EF8014E
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 14:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7003EF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oEJl7xfx"
Received: by mail-lj1-x236.google.com with SMTP id q7so12515995ljm.1
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 05:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A72XQ/4lbu1eBzjeGWJUH6DJRuv22E7TgvwmAfvQwo4=;
 b=oEJl7xfxO2lrfIV9qbjHf6KwuZIlWK9/RJgh1RmH4wNhcsZ79XEG4fbsF3y1nzmoY9
 q2lIkzOxcGosp6HVnfdITqDhcual2hMpvPWjeKTf/kmyN39kzXPNkP+ZssMJMN2IQIK4
 O0KjZqbNPB7AqBf+EJ1/m9KHQi1wy/4g8+4YB47uoyXuuXu4dOHhNMCQ/yOffnol0FZP
 7aVvwfi5vTGHGfo4JUpJpwP3XIPKsCgpeoL/aPKqYNJlo3GYkJm2F3tf81qeytm9OCbi
 vfyvJmngK79z/1sVHPjNkJZELp28pBmvJOXqtkWEckQiMKeKHM4x85zAAVmUywpCAvP2
 5jLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A72XQ/4lbu1eBzjeGWJUH6DJRuv22E7TgvwmAfvQwo4=;
 b=HPLzV3BerA0rzrjpAEcMYvAPMRZLKAwY1EjIhmlNyk/Vag6CtjNr0s0Hq4O3B+Flz/
 eJvsY9UX1r6MWqmUtOozJs5uAZqOUATQvPuW9PG3Fjg/E54Bg37mIU7Aqdo/IxJvkSl9
 OJh1qGZY+wzD9jkFJaPCHIsNByGVPEa0aiYOkZzaVyhszz1hwjuySxM3NK/VTtfKo87V
 PVaZyQwOWYiDxKdYuEE2S6o4rovAh1cpQaKRVE+zDKaB7nb+DxDsJZAD88mB+Bxi0+mT
 UJbt+gh6Uzome3VwHaSr7gZa9aN5lgFd6JDH4jZNwwiyrceD0NU/6lIPkO0+xEG5EFwy
 n7jg==
X-Gm-Message-State: AOAM530HlNIxIWfZps1bepD4sOVqLsSXHWrVz6SskG98IL99ZRKnlb5Q
 x9h17N4oZaycEpyVNwjqauPzlyg0SqR4MZaEMlw=
X-Google-Smtp-Source: ABdhPJzF/3wq6lE8ffOBID7hYAL2GYFnH/xCoPbgAhlYKlB1cM4PrAuHaAtw8cQhtkK63WgTP7MLSuUiTYdqUPUHkvY=
X-Received: by 2002:a05:651c:544:: with SMTP id
 q4mr4758373ljp.310.1594990365891; 
 Fri, 17 Jul 2020 05:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5Bhhcmm6ex0nP6MnYq0Uf8EMYCMMFOMav-fCrVJvOY+vQ@mail.gmail.com>
 <87o8of2gb8.wl-kuninori.morimoto.gx@renesas.com>
 <20200717112332.GB4316@sirena.org.uk>
In-Reply-To: <20200717112332.GB4316@sirena.org.uk>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 17 Jul 2020 09:52:34 -0300
Message-ID: <CAOMZO5D1BMjNcf-2z11uzCc46yCA2-GTWh+V28Y7WhrSAM_+Cg@mail.gmail.com>
Subject: Re: wm8962: error at soc_component_read_no_lock
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Fri, Jul 17, 2020 at 8:23 AM Mark Brown <broonie@kernel.org> wrote:

> Right, IIRC the wm8962 had some registers that weren't accessible all
> the time and possibly also some volatile bits - the driver will need
> updates to handle things better for these widgets.

Thanks, Mark.

I instrumented the code to print the register names so we can see
where soc_component_read_no_lock fails:

[    6.010526] ************ register is 512 (WM8962_GPIO_BASE)
[    6.014540] wm8962 0-001a: ASoC: error at
soc_component_read_no_lock on wm8962.0-001a: -16

[    6.030852] ************ register is 515 (This register does not exist)
[    6.034806] wm8962 0-001a: ASoC: error at
soc_component_read_no_lock on wm8962.0-001a: -16

[    6.162651] ************ register is 48 (WM8962_ADDITIONAL_CONTROL_4)
[    6.166524] wm8962 0-001a: ASoC: error at
soc_component_read_no_lock on wm8962.0-001a: -16
[    6.174911] ************ register is 48 (WM8962_ADDITIONAL_CONTROL_4)
[    6.178779] wm8962 0-001a: ASoC: error at
soc_component_read_no_lock on wm8962.0-001a: -16

Charles, Shengjiu, any suggestions, please?

Thanks
