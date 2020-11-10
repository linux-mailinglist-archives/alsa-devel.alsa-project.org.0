Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDDB2ADB4E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 17:09:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8924F173C;
	Tue, 10 Nov 2020 17:08:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8924F173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605024588;
	bh=OgJN6tTDsS/fS+87mkjYEUmzONyIpbrcOFnuZo/NVzE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e+ZEkRxa6R/nFV5M32iFxbdbEnNGouzmCeUHJP5Opb+4JKHX2DkeYa5LeqcGd5Mzh
	 PG3nayWzafpFVk/QHMxbjsb+s4s6ZuRCYUKVH9SoePWAdr2CcsGYmjGoKv8eNLe9fe
	 prl3YAabZG4vpGT0bTvDMziwfnzUQwT8RN+ckhbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED612F801EB;
	Tue, 10 Nov 2020 17:08:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D1A2F801D5; Tue, 10 Nov 2020 17:08:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B0BEF80059
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 17:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B0BEF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="RejgqHVr"
Received: by mail-lj1-x244.google.com with SMTP id x9so2876926ljc.7
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 08:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IdXpjX2fMBvN29YoOyMaOI1PARSVc0VzhKJzQ6c/jNY=;
 b=RejgqHVrBZZu4n1N0vlVzMwLbdbQEz7KDOjszF61G4q8FnDRgS6MlMMKiWMrZXVwRi
 C8H+ONHnQK3GJnpwFCGrj7Fjjj5F4RE4KtWhAayffxNUeXtlvMXbToJGo2vgtLLcaJqY
 peRHc6Z8Ayw2KbWU+aISfdBvaP/YrBNtZpBsI0qEWF4/hqkHjLL4F8T+mRom6j/cota6
 TQSbE1NjoQJKPX856Cxow92rdGCYIcyrktxvr8p8+99382ZchOXMvY62mC+8arBWtKey
 5U+z/S5+mUycsJXW9CjMbci8JwbcUuiXsjlR3nZ4kRBOE4I8I+YIImyCVntI7tSyibnb
 GUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IdXpjX2fMBvN29YoOyMaOI1PARSVc0VzhKJzQ6c/jNY=;
 b=sKQT1oxVuV6Hip56UmErHcbXng1wtuX+71TJoqtdjhPc55v5AAs6qmqYl9A1wM/Hof
 phRYRa+yiPdlPnUuAiF61s4vyvIZxe9YCTH9VMfiPTKcrakYXpQ4rHdlL4ULkzocvCXp
 WZNDy7cniUaZFejohsQ8XziX6c7X84U5vmdGU5b37pySiHqmxLOyN4LzP90AEaBaI20R
 l5HquzG/k2A6fBVLe+pLHPAX9x0WsUIEnhv5Yaj62JELM6PjjJ3n73Uk2XfzMMZdk9i8
 5AnYUyz9IAwBwUp2vtOlnKwP59FLLdl3p9BCrEEb8Oc+1scRVtzIiyYGympMquBshAtj
 KKhQ==
X-Gm-Message-State: AOAM531mvYPWW3RxIqteUZN+v8gJvWGHfJSTaXik8W7ZWrjsYH9yYFxz
 Z5O+JEEUrE5G4F4JFHUyos4OfLYya3fzeZfutUhZGQ==
X-Google-Smtp-Source: ABdhPJx+3OPv/DyILoTWnWz5YCDXJQRkrl7b/kpZjceXJV8+4bcdHjQXNz+aJr98/86fydWiNskQFSAqwT5vTI8Eyk0=
X-Received: by 2002:a2e:9449:: with SMTP id o9mr8049890ljh.457.1605024485448; 
 Tue, 10 Nov 2020 08:08:05 -0800 (PST)
MIME-Version: 1.0
References: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
 <CALprXBZCthdkxGbJBZZ+ESJRDBHY879FZMpB_4Mgpq1YAJun2g@mail.gmail.com>
 <20201110115631.GA5957@sirena.org.uk>
In-Reply-To: <20201110115631.GA5957@sirena.org.uk>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Wed, 11 Nov 2020 00:07:54 +0800
Message-ID: <CALprXBZKnJGzFCLp0=UxJQp423QuaiPiaPzyY3-662k1gHUk-g@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Modify documentation and machine driver for SC7180
 sound card
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>,
 ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ajye Huang <ajye.huang@gmail.com>,
 Patrick Lai <plai@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Cheng-yi Chiang <cychiang@chromium.org>
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

Hi,Mark

Thank you, I already understand, sorry for causing you trouble.

Ajye

On Tue, Nov 10, 2020 at 7:56 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Nov 10, 2020 at 05:40:40PM +0800, Ajye Huang wrote:
> > Hi, Mark
> >
> > Could you please kindly review the series patch v6? And may I get your
> > approval if the review is done.
>
> Please don't send content free pings and please allow a reasonable time
> for review.  People get busy, go on holiday, attend conferences and so
> on so unless there is some reason for urgency (like critical bug fixes)
> please allow at least a couple of weeks for review.  If there have been
> review comments then people may be waiting for those to be addressed.
>
> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed
> directly if something has gone wrong you'll have to resend the patches
> anyway, so sending again is generally a better approach though there are
> some other maintainers who like them - if in doubt look at how patches
> for the subsystem are normally handled.
