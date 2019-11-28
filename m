Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F404810CCCC
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 17:25:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DC7A16E8;
	Thu, 28 Nov 2019 17:24:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DC7A16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574958325;
	bh=YwsI+CjbD+Q1ihsYN8iUZIO3WhKyCyimxkPY82F0yHs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ReP9AvopZvQBVOP0iRj9bK4jVfUm8P8EOot2J195JANOZ44+zrjlRwuxZQcI7F+x0
	 kfa0nZBJSVm7S5777nQ7boUsA9K4sOMtf7FN4bx7ZSV0nJgouEPSky0G9FEX6Dfa83
	 HPUnrIBSJ8E/SPX53Jn/S2iOFVbZP2Wwiot2a0fk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF217F8013A;
	Thu, 28 Nov 2019 17:23:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72B56F800CB; Thu, 28 Nov 2019 17:23:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7BFDF800CB
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 17:23:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7BFDF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="QlG8FeOh"
Received: by mail-qk1-x742.google.com with SMTP id v19so3540323qkv.3
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 08:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K8XvQHgppYcDW50Z3mxnLcawHzKVUChFD3WmygE8jJY=;
 b=QlG8FeOh4YutiDQZiMigBWumte0ZxgjrWi7dlY33bnq/Pix3ZMtX1PdvOKVeC+YM6V
 lxrYrlLXApqvXBrhyOoLnzvzmHs2gxLXow3B1TDyAVSBreMqKBXpM9D0rUxKCIgt3e5K
 dVIcQkH60qlvG67nXfZ9XOcj0X6lNbOAU6ZR1SoZqh8TiABMtmFSzPr8cP7Gue0ufzIx
 YTBMTIzIV9pHyoC2/ob8S+84iOyOKskZKVkgMAthHjQ4NqU8o2aWVPyESwfY4eEdYbVJ
 dBGpLC278mjZeolaJDHnW4wA1Htx91scXmx5MMsCr20wB9aA0r+VAu2YxJIiLJFHhVmV
 XXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K8XvQHgppYcDW50Z3mxnLcawHzKVUChFD3WmygE8jJY=;
 b=EKJwfaiJcOQG2pdsEjALJ3Rhu1nTE47hQSLL5FT4V1GYNGaHRZkTQStPOVRlPwoUF3
 Z+9403gucwKhfMtAQuGMDPYNb3GdvkEadVUfWV4DWoHUrWFVUuJL371XchQLKnbVRLml
 WqKQ6TODRV9dMSbj0+GuT4V09mbWsx0p6BNYROu7wcnsQqfHCsFvQOCZPozeeldIJAAb
 VR7S2X/HE0ntiamD/VOYwKF4zSuwU91F/egHgI18mxlgQSGok8CDMkbEeN5tHzess9s4
 tTKbNCpUA8rm+pZAH1IKcE4wP2WPy6tuyJh4/fNKBGfkH71U92614hyVyRK6O0EIkeVf
 EU5w==
X-Gm-Message-State: APjAAAU6CDn5ySo73Hq2wjkANP/v9pX+67I4PjWi9IT7cUrRGgTvMWWB
 hZfjxraZYSfwF+YmLj+y1wZaKbh4BnerRCNF0LhuJQ==
X-Google-Smtp-Source: APXvYqz1IJXxT9rTtNsjA/xKc5VDvtDe/wEq74yU0DmldaqtV/JtzOKgaJH1FbCLywxSEXr50xk3GlZCJpAIQ7rTVG4=
X-Received: by 2002:ae9:f711:: with SMTP id s17mr10873263qkg.238.1574958213431; 
 Thu, 28 Nov 2019 08:23:33 -0800 (PST)
MIME-Version: 1.0
References: <20191128011358.39234-1-cujomalainey@chromium.org>
 <s5hlfs0ld25.wl-tiwai@suse.de> <20191128134901.GE4210@sirena.org.uk>
In-Reply-To: <20191128134901.GE4210@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 28 Nov 2019 08:23:21 -0800
Message-ID: <CAOReqxj1V475mbfSEWNn3NrMJDttO+23KjboBR01tGhzAAJmBw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: core: only flush inited work during
	free
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

On Thu, Nov 28, 2019 at 5:49 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Nov 28, 2019 at 07:39:30AM +0100, Takashi Iwai wrote:
>
> > For this delayed_work, the situation is a bit complex, though.
> > Usually the work is set up to point to a fixed function, but in the
> > case of ASoC, it seems serving for different purposes depending on the
> > component type.  I guess the cleaner way would be a redirect call
> > like:
>
> Yes, or just separate fields for each.
Sounds good, I will refactor this change and send a new version next
week as US is on holiday rest of this week.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
