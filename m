Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 739BD20CC9D
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 07:50:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC3D082C;
	Mon, 29 Jun 2020 07:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC3D082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593409845;
	bh=iFr9/+ZUaqh8+qPaNtKkJTqoxAWy0R++XI+JV1h/yu4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XYXFiFDeZVgpSlGUTX5xUt3F1N0UN5ahHt8OIZlJ/H6kkmF+yF4csSPeHdFcL6YZE
	 RWkAcQ5A5R/3qPagcDBJ2UDWvO33sTOC7zuLEtcwERtTZW2LR1JRlxs8zHsCJitpWy
	 f0AcR3vVTL1Cs+1wViKP+h13jIhbs+PfIPefbS1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 037FCF800EA;
	Mon, 29 Jun 2020 07:49:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E12CDF8020C; Mon, 29 Jun 2020 07:49:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1296F800EA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 07:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1296F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="oqVGNarR"
Received: by mail-il1-x142.google.com with SMTP id t85so13420397ili.5
 for <alsa-devel@alsa-project.org>; Sun, 28 Jun 2020 22:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iFr9/+ZUaqh8+qPaNtKkJTqoxAWy0R++XI+JV1h/yu4=;
 b=oqVGNarR8QMt1tROOcA6BBdbzAWXonlLjH1vOYvelZBLnGycz/ozZwBm0eIQ4D7Kp1
 kOeIfr9WOUpmpImfEFHT5maO1bb6VwmsuJHnDeODtAccjBWqqdZjgXWO9TjUHyZsUI08
 uidt7aCld88Igm2X5BpIBHvV1KFqgqcY72YxcNwuAh4IvmcWe4+KK0WpCBgM1jhRPt+O
 YYzUBs9IWuxTN1/bJ/BR5hr2rBSFw5AOTWxJYz7j+J6o/RePfd2EaPIHE/HpYcgBX+SP
 7ATJS/MQzlrHUYQPkJUNYIqytIJlpYIIVy5AKwq8H4jNiEngQ75/7C/OXZya7Wf/gTCj
 jcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iFr9/+ZUaqh8+qPaNtKkJTqoxAWy0R++XI+JV1h/yu4=;
 b=dJrZRiTKg3+LKjgBw1uLeIONOaXkPb8WCQIreWAlLvZ5jxfMV/elp+wux3w3qP5agF
 z0+iDJ78bgVWpiIFni/+6WR6d3A7RT5oJkViH5G0SC1V4M4hwkvjDqEQ+LnwpB6sbWIY
 JhRQd/pEThN7AVd/90VsvJgRsHn1vvxXh9NrrKQFjfkxDSftj4OBi2U8MEFlAu4Dw4Cy
 EEywYYP88OPUYFaPSPE33ci3OB9or5HUYbKMgpZGFDYjz1GewOlzEnsVNp6eeDvigcWS
 vkLwWsNbyq0AvzL/yy1f5x0sy0cOeAsU1a9y6GVH1eysCgBC1DTjtisYH+b4T2wFb5oV
 jyXw==
X-Gm-Message-State: AOAM531FGzSc2diEbRhpIErqFRf3RLiJdmdKP68+VPS87H/ZeUaLmSxE
 QHKK3Iuj6zxIXTQjAU1O0xJ8vu00FpFLaW8VzKGDJPqJ
X-Google-Smtp-Source: ABdhPJzYzrVrmKh4vXNiGwgbhf2kuxT4BRo18M9+mdtA8yxJXlMCu2YlEBL+i6ITtVI0LuO9v6QguHzlEBF2qjUCzX0=
X-Received: by 2002:a92:8947:: with SMTP id n68mr9872547ild.235.1593409732664; 
 Sun, 28 Jun 2020 22:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200625153543.85039-1-tzungbi@google.com>
 <159311231750.10637.12370136760007816881.b4-ty@kernel.org>
In-Reply-To: <159311231750.10637.12370136760007816881.b4-ty@kernel.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 29 Jun 2020 13:48:41 +0800
Message-ID: <CA+Px+wWX58pbK6958AK89aS13h0pxJ4Tqi3DSbmiOJPQcn7gUw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ASoC: rt1015: fix compilation errors and warnings
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On Fri, Jun 26, 2020 at 3:12 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, 25 Jun 2020 23:35:40 +0800, Tzung-Bi Shih wrote:
> > The series fixes compilation errors and warnings discovered in the thread
> > https://patchwork.kernel.org/patch/11622319/.
> >
> > The original patch:
> > (1) adds acpi.h for fixing implicit declaration of function 'ACPI_PTR'
> > (2) sorts header inclusions in alphabetical

I am wondering if it is a better practice (next time) to separate the
original patch into 2 patches.
